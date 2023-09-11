#Requires -Version 5.1
using namespace System.Collections.Generic;

[CmdletBinding()]
Param
(
	[Parameter(HelpMessage = "Game mod folder name.")]
	[string]$ModDir = "update_dev",

	[Parameter(HelpMessage = "Path to game folder.")]
	[string]$GamePath = '',

	[Parameter(HelpMessage = "Path to a folder with source files.")]
	[string]$SourcePath = '',

	[Parameter(HelpMessage = "Steam Game AppID.")]
	[int]$AppId = 550,

	[Parameter()]
	[switch]$MakeVpk,

	[Parameter(HelpMessage = "Relative path to VPK file.")]
	[string]$VpkName = "pak01",

	[Parameter()]
	[switch]$MultiChunkVpk,

	[Parameter(HelpMessage = "Text file with relative paths to exclude from VPK.")]
	[string]$VpkExcludeFile,

	[Parameter()]
	[switch]$Watch
)

# Init
Function ReadPathsFromConfig
{
	Param(
		[string]$Path,
		[ICollection[string]]$Container
	)

	$Container.Clear();
	
	if (-not $Path)
	{
		return;
	}

	$Path = Resolve-Path -Path $Path -ErrorAction 'SilentlyContinue';
	if (-not $Path)
	{
		throw "Invalid path to config '${Path}'!";
	}

	# Fix up incorrect slashes, since we'll be using -like operator
	Get-Content -LiteralPath $Path | ForEach-Object {
		$Container.Add($_.Replace([IO.Path]::AltDirectorySeparatorChar, [IO.Path]::DirectorySeparatorChar));
	};
}

Function CheckGameInstallPath
{
	Param(
		[int]$AppId
	)

	if ($GamePath)
	{
		$Path = Resolve-Path $GamePath -ErrorAction 'SilentlyContinue';
		if (-not $Path)
		{
			throw "Invalid GamePath '${GamePath}'!";
		}

		return $Path;
	}

	# Attempt to find game path from Steam installation
	$SteamPath = Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Wow6432Node\Valve\Steam\' -Name 'InstallPath' -ErrorAction 'SilentlyContinue';
	if (-not $SteamPath)
	{
		$SteamPath = Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Valve\Steam\' -Name 'SteamPath' -ErrorAction 'SilentlyContinue';
	}

	$SteamPath = Resolve-Path -LiteralPath $SteamPath -ErrorAction 'SilentlyContinue';
	if (-not $SteamPath)
	{
		throw 'Unable to locate Steam installation!';
	}

	$Path = Select-String -LiteralPath "${SteamPath}/steamapps/libraryfolders.vdf" -Pattern '\s+"path"\s+"(.+)"' -AllMatches -ErrorAction 'SilentlyContinue' |
		Select-Object -ExpandProperty 'Matches' |
		ForEach-Object {
			$LibraryPath = $_.Groups[1].Value;

			return Select-String -LiteralPath "${LibraryPath}/steamapps/appmanifest_${AppId}.acf" -Pattern '\s+"installdir"\s+"(.+)"' -ErrorAction 'SilentlyContinue' |
				Select-Object -First 1 -ExpandProperty 'Matches' |
				ForEach-Object {
					$InstallDirName = $_.Groups[1].Value;

					# Get rid of double slashes & check path
					return "${LibraryPath}/steamapps/common/${InstallDirName}/";
				};
		} |
		Select-Object -First 1;

	$Path = Resolve-Path -LiteralPath $Path -ErrorAction 'SilentlyContinue';
	if (-not $Path)
	{
		throw "Unable to locate game installation (AppId: ${AppId}!";
	}

	return $Path;
}

Function SyncFolder_Internal
{
	Function ShouldBePacked
	{
		Param (
			[string]$Path
		)

		if (-not $MakeVpk)
		{
			return $false;
		}
	
		foreach ($Filter in $VpkExcludeFiles)
		{
			if ("$Path" -like "$Filter") {
				return $false;
			}
		}
		
		return $true;
	}

	Function EnsureFolder
	{
		Param (
			[string]$Path
		)

		$File = Get-Item -LiteralPath $Path -ErrorAction 'SilentlyContinue';
		if ($null -ne $File)
		{
			if ($File.Attributes -band [IO.FileAttributes]::Directory)
			{
				return;
			}

			# Confirm every deletion
			# NOTE: resolving path using .DirectoryName, since there is likely a slash at the end
			Remove-Item -LiteralPath $File.DirectoryName -Recurse -Force -Confirm -ErrorAction 'Stop';
		}

		New-Item -Path $Path -ItemType 'Directory' -Force -ErrorAction 'Stop';
	}

	Function EnsureLink
	{
		Param (
			[string]$LinkPath,
			[string]$TargetPath,
			[string]$LinkType = 'HardLink',
			[switch]$Confirm
		)

		$LinkFile = Get-Item -LiteralPath $LinkPath -ErrorAction 'SilentlyContinue';
		if ($null -ne $LinkFile)
		{
			if ($LinkFile.LinkType -eq $LinkType)
			{
				if ($LinkType -ne 'Junction')
				{
					# NOTE: sloppy, since System.IO.FileInfo.Target is empty for HardLink
					return;
				}
				
				if ($LinkFile.Target -eq $TargetPath)
				{
					return;
				}
			}

			# Confirm every deletion
			if ($Confirm)
			{
				Remove-Item -LiteralPath $LinkPath -Recurse -Force -Confirm -ErrorAction 'Stop';
			}
			else
			{
				Remove-Item -LiteralPath $LinkPath -Recurse -Force -ErrorAction 'Stop';
			}
		}

		New-Item -Path $LinkPath -ItemType $LinkType -Value $TargetPath -Force -ErrorAction 'Stop';
	}
	
	# Create .cache directory
	$null = EnsureFolder $CachePath;

	# Link mod folder to .cache directory
	$null = EnsureLink $ModPath $CachePath 'Junction' -Confirm;

	if ($MakeVpk)
	{
		$FilePaths2Vpk.Clear();
	}
	
	###
	Function SyncFolder_Recursive
	{
		Param (
			[string]$RelPath = ''
		)

		# $RelPath:
		# ""
		# "materials\models\v_models\weapons\sniper\"
		# "models\"
		
		# Traverse repo/root/*
		$FullSourcePath = Resolve-Path "./$RelPath";
		$SourceNumItems = 0;

		# Traverse repo/root/* files
		foreach ($ChildSourceFile in Get-ChildItem -LiteralPath $FullSourcePath -File)
		{
			$ChildRelPath = "${RelPath}{0}" -f $ChildSourceFile.Name;
			$ChildCachePath = "${CachePath}${ChildRelPath}";
			
			if ($MakeVpk -and (ShouldBePacked $ChildRelPath))
			{
				# File goes into VPK
				$null = $FilePaths2Vpk.Add($ChildRelPath);

				if ((Test-Path -LiteralPath $ChildCachePath))
				{
					# File should be packed
					Write-Verbose "Removing packed file: '${ChildRelPath}'";
					Remove-Item -LiteralPath $ChildCachePath -Recurse -Force -ErrorAction 'Stop';
				}
				
				continue;
			}

			$null = EnsureLink $ChildCachePath $ChildSourceFile.FullName;
			$SourceNumItems ++;
		}
		
		# Traverse repo/root/* directories
		foreach ($ChildSourceDir in Get-ChildItem -LiteralPath $FullSourcePath -Directory)
		{
			# NOTE: added separator to folder relative path to distinguish them from files in filtering
			$ChildRelPath = "${RelPath}{0}{1}" -f $ChildSourceDir.Name, [IO.Path]::DirectorySeparatorChar;
			
			$ChildSourceDirNumItems = SyncFolder_Recursive $ChildRelPath;
			if ($ChildSourceDirNumItems -ne 0)
			{
				$null = New-Item -Path "${CachePath}${ChildRelPath}" -ItemType 'Directory' -Force;
			}
			
			$SourceNumItems += $ChildSourceDirNumItems;
		}

		return $SourceNumItems;
	}

	Function SyncFolder_Cache_Recursive
	{
		Param (
			[string]$RelPath = ''
		)

		$FullCachePath = "${CachePath}${RelPath}";
		$CacheNumItems = 0;

		# Traverse .cache/* files
		foreach ($ChildCacheFile in Get-ChildItem -LiteralPath $FullCachePath -File -ErrorAction 'SilentlyContinue')
		{
			# NOTE: ignore VPK filter here, as -Exclude seem to miss out on ?absolute? paths
			if ($ChildCacheFile.FullName -like $VpkPathFilter)
			{
				continue;
			}

			$ChildRelPath = "${RelPath}{0}" -f $ChildCacheFile.Name;

			# Remove files and directories not existing in repo/root/*
			if (-not (Test-Path -Path $ChildRelPath -Pathtype 'Leaf'))
			{
				Write-Verbose "Removing missing file: '${ChildRelPath}'";
				Remove-Item -LiteralPath $ChildCacheFile.FullName -Force -ErrorAction 'Stop';

				continue;
			}

			$CacheNumItems ++;
		}

		# Traverse .cache/* directories
		foreach ($ChildCacheDir in Get-ChildItem -LiteralPath $FullCachePath -Directory -ErrorAction 'SilentlyContinue')
		{
			$ChildRelPath = "${RelPath}{0}{1}" -f $ChildCacheDir.Name, [IO.Path]::DirectorySeparatorChar;

			$ChildCacheDirNumItems = SyncFolder_Cache_Recursive $ChildRelPath;
			if ($ChildCacheDirNumItems -eq 0)
			{
				Write-Verbose "Removing empty directory: '${ChildRelPath}'";
				Remove-Item -LiteralPath $ChildCacheDir.FullName -Recurse -Force -ErrorAction 'Stop';

				continue;
			}
			
			$CacheNumItems += $ChildCacheDirNumItems;
		}

		return $CacheNumItems;
	}
	###
	
	# Traverse repo/root/*
	$null = SyncFolder_Recursive;
	
	# Traverse .cache/*
	$null = SyncFolder_Cache_Recursive;

	Function MakeVpk()
	{
		# Remove old VPKs from cache directory
		Remove-Item -Path $VpkPathFilter -ErrorAction 'SilentlyContinue';
		
		if ($FilePaths2Vpk.Count -eq 0)
		{
			return;
		}
		
		# Prepare a resource file
		$ResourceFilePath = New-TemporaryFile -ErrorAction 'Stop';
		
		# Export list
		# NOTE: workaround over Out-File in PS5 not aupporting utf8-nobom recognizable by vpk.exe
		# NOTE: workaround over List joining content with spaces instead of new line
		Set-Content -LiteralPath $ResourceFilePath -Value $FilePaths2Vpk.ToArray();

		# Prepare a directory hierarchy
		$null = EnsureFolder (Split-Path -Path $VpkPath);
		
		# Build new VPK from resource file
		if ($MultiChunkVpk)
		{
			$null = & $VpkExecPath -M a $VpkPath "@$ResourceFilePath";
		}
		else
		{
			$null = & $VpkExecPath a $VpkPath "@$ResourceFilePath";
		}
		
		# Remove resource file
		Remove-Item -LiteralPath $ResourceFilePath -ErrorAction 'Continue';
	}

	if ($MakeVpk)
	{
		MakeVpk;
	}

	Write-Host -ForegroundColor 'Green' -Object 'Built .cache folder successfully';
}

Push-Location -LiteralPath $PSScriptRoot;
try
{
	# Prepare common paths
	$GameInstallPath = CheckGameInstallPath $AppId;
	Write-Host -ForegroundColor 'Green' "Game installation path: '${GameInstallPath}'";
	
	$RepoPath = Resolve-Path -Path "../";
	
	if ($SourcePath)
	{
		$SourcePath = Resolve-Path -Path $SourcePath -ErrorAction 'SilentlyContinue';
		if (-not $SourcePath)
		{
			throw "Invalid SourcePath '${SourcePath}'!";
		}
	}
	else
	{
		$TestPath = Join-Path -Path $RepoPath -ChildPath "root/";
		$SourcePath = Resolve-Path -LiteralPath $TestPath -ErrorAction 'SilentlyContinue';
		if (-not (Test-Path -LiteralPath $TestPath))
		{
			throw "Invalid path to a source folder (Path: '${TestPath}')!";
		}
	}
	
	$CachePath = Join-Path -Path $RepoPath -ChildPath "/.cache/";
	Write-Verbose "CachePath: '${CachePath}'";
	
	$ModPath = Join-Path -Path $GameInstallPath -ChildPath "${ModDir}/";
	
	if ($MakeVpk)
	{
		$VpkExecPath = Resolve-Path -Path "${GameInstallPath}/bin/vpk.exe" -ErrorAction 'SilentlyContinue';
		if (-not $VpkExecPath)
		{
			throw 'Unable to locate vpk executable (missing SDK/authoring tools)!';
		}
	
		$VpkPath = Join-Path -Path $CachePath -ChildPath $VpkName;
		$VpkPath = & {
			# Fix up VPK path (get rid of optional extension)
			$ParentPath = Split-Path -Path $VpkPath -Parent -ErrorAction 'Stop';
			$BaseName = [System.IO.Path]::GetFileNameWithoutExtension($VpkPath);
			if (-not $MultiChunkVpk)
			{
				$BaseName = "${BaseName}.vpk";
			}
		
			return Join-Path -Path $ParentPath -ChildPath $BaseName;
		};
		
		# More-less accurate path filter to exclude in processing/target for deletion
		$VpkPathFilter = "${VpkPath}.vpk";
		if ($MultiChunkVpk)
		{
			$VpkPathFilter = "${VpkPath}_???.vpk";
		}
		
		$VpkExcludeFiles = New-Object -TypeName 'List[string]';
		ReadPathsFromConfig $VpkExcludeFile $VpkExcludeFiles;
	
		Write-Verbose "VpkPathFilter: '${VpkPathFilter}'";
		Write-Verbose "Exclude from VPK: '${VpkExcludeFiles}'";
	
		# List of files to be packed
		$FilePaths2Vpk = New-Object -TypeName 'List[string]';
	}
}
catch
{
	return $_;
}
finally
{
	Pop-Location;
}

Write-Host -ForegroundColor 'Green' "'${SourcePath}' ==> '${ModPath}'";

Push-Location -LiteralPath $SourcePath;
try
{
	Function SyncFolder
	{
		Param(
			[string]$ConfirmationMessage
		)

		try
		{
			SyncFolder_Internal;
		}
		catch
		{
			# NOTE: do not exit if exception happened during a cycle
			Write-Host -ForegroundColor 'Red' -Object "`nERROR: $_`n$($_.ScriptStackTrace)`n";
			Write-Host $ConfirmationMessage -NoNewline;
			$null = Read-Host;

			return $false;
		}

		return $true;
	}

	if (-not $Watch)
	{
		$null = SyncFolder 'Press Enter to exit';

		return;
	}

	Class Watcher : System.IO.FileSystemWatcher
	{
		[bool]$PendingChanges = $false;
	};

	# $Watcher = New-Object -TypeName 'System.IO.FileSystemWatcher' -ErrorAction 'Stop';
	$Watcher = [Watcher]::new();
	$Watcher.Path = $SourcePath;
	$Watcher.Filter = '*';
	$Watcher.IncludeSubdirectories = $true;
	$Watcher.PendingChanges = $true;

	$Action = {
		Param (
			$Watcher
		)

		# Just schedule it in case of rapid changes
		$Watcher.PendingChanges = $true;
	};

	$Handlers = @('Created','Changed','Renamed','Deleted') | ForEach-Object {
		return Register-ObjectEvent -InputObject $Watcher -EventName $_ -Action $Action;
	};

	$Watcher.EnableRaisingEvents = $true;

	while ($true)
	{
		if ($Watcher.PendingChanges)
		{
			if ((SyncFolder 'Press Enter to try again'))
			{
				$Watcher.PendingChanges = $false;
			}
		}

		Wait-Event -Timeout 1;
	}
}
finally
{
	Pop-Location;

	if ($Watch -and $Watcher)
	{
		# NOTE: Freeing here, as it tends to leak within PS session
		$Watcher.EnableRaisingEvents = $false;

		$Handlers | ForEach-Object {
			Unregister-Event -SourceIdentifier $_.Name;
			Remove-Job $_;
		};

		$Watcher.Dispose();
	}
}
