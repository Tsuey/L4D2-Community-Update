@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0\tools\Mount.ps1" -ModDir update_ce_dev -MakeVpk -VpkExcludeFile do_not_vpk_these.txt -MultiChunkVpk %*
pause
