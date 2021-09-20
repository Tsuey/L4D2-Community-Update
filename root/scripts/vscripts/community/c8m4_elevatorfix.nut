/*****************************************************************************
**  HOSPITAL ELEVATOR FIX
**
**  There's many bugs/exploits during fast upward elevator motion. Survivors fall
**  through the floor if there is lag or SI Players stuck-warp in mid-ascent, or
**  warp up to skybox with "TAKE A BREAK". Joining and leaving the server is also
**  often risky. This fix attaches a blocker to the exact base of the elevator to
**  deter falling through, and since that can sometimes fail further attaches two
**  trigger_multiples which "fix up" Survivor's Z-coordinate with respect to the
**  elevator's Z-coordinate. Stuck-warping Charger and Hunter players get instantly
**  stuck and are "dumped" out -- the Jockey can still succeed, but it's harder,
**  and won't fall through (only way to prevent Jockey is to kill and that's not fun).
**
**  Given the elimination of all elevator locomotion risk, Survivors are finally
**  allowed to jump inside this elevator (like Dead Center 1). Survivors will only
**  have lower gravity during times that all non-incapped Survivors are inside. If
**  a Smoker death-pulls a Survivor out, the "fix up" still happens because they
**  are physical triggers; however, the gravity will return to normal until the
**  death-pulled player is incapped (this for security reasons in case the victim
**  is freed with a pipebomb). Gravity cannot be greater than 13.5% lower.
**
**  Modifies Coop and Versus basemodes only.
*****************************************************************************/

printl( "Logic modified for elevator fall-through fix" );

// No need for this anymore.

EntFire( "trigger_nojump", "Kill" );

// Injected I/O. When elevator starts, Enable the trigger that requires the entire
// team to be in it to activate lower gravity and with 5 second delay (to ensure all
// last-minute pre-departure attacks are over) start dumping stuck-warped SI Players.
// When elevator reaches the top, delete the Survivor-only trigger blocking falls,
// the dumper so Infected can attack immediately, and the in-elevator low gravity
// trigger. Note that Kill doesn't fire "OnEntireTeamEndTouch" so with 1 second
// delay ensure gravity was reset. To thwart DoS Attacks delete the teleport triggers
// after a substantial 5 second delay.

EntFire( "elevator_button",	"AddOutput",	"OnPressed " + g_UpdateName + "_elevator_trigmult:Enable::0:-1" );
EntFire( "elevator_button",	"AddOutput",	"OnPressed " + g_UpdateName + "_faller_trigmult:Enable::0:-1" );
EntFire( "elevator_button",	"AddOutput",	"OnPressed " + g_UpdateName + "_skybox_trigmult:Enable::0:-1" );
EntFire( "elevator_button",	"AddOutput",	"OnPressed " + g_UpdateName + "_elevator_infectdump:Enable::5:-1" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop " + g_UpdateName + "_elevator_tabbernaut:Kill::5:-1" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop " + g_UpdateName + "_elevator_infectdump:Kill::0:-1" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop " + g_UpdateName + "_elevator_trigmult:Kill::0:-1" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop worldspawn:RunScriptCode:c8m4_TeamGravity(1.0):1:-1" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop " + g_UpdateName + "_faller_trigmult:Kill::5:-1" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop " + g_UpdateName + "_skybox_trigmult:Kill::5:-1" );

// Survivor-only default-Enabled blocker that helps Survivors not fall through but
// is not perfect -- it's required that its top is exactly flush with elevator floor
// and the ~5200 height of the elevator shaft. Infected-only default-Disabled dumper
// extends out the bottom of the elevator to ensure they're properly out, then fall.
// When the Survivor-only blocker fails, the Survivor will get stuck inside it but
// quickly enter the "faller" trigger volume and teleport back up.

make_clip( "_elevator_tabbernaut",	"Survivors",	1, "-222 -222 -5205", "0 0 0", "13541 15357 5543" );
make_clip( "_elevator_infectdump",	"SI Players",	0, "-222 -222 -152", "0 0 70", "13541 15357 5619" );

// Trigger "elevator" ignores incaps and is only Enabled once elevator is started to
// activate low gravity; it's the exact size of the elevator carriage. Trigger "faller"
// is exactly 5 units under the floor and teleports Survivors up (even when getting
// attacked by a Charger, Hunter, or Jockey). Trigger "skybox" resolves "TAKE A BREAK"
// instances of teleporting either on top of the carriage or way up into skybox. The
// extreme height of triggers accounts for I/O latency induced by DoS Attacks / lag.

SpawnEntityFromTable( "trigger_multiple",
{
	targetname	= g_UpdateName + "_elevator_trigmult",
	StartDisabled	= 1,
	spawnflags	= 1,
	allowincap	= 0,
	entireteam	= 2,
	filtername	= "anv_globalfixes_filter_survivor",
	origin		= Vector( 13541, 15357, 5619 )
} );
SpawnEntityFromTable( "trigger_multiple",
{
	targetname	= g_UpdateName + "_faller_trigmult",
	StartDisabled	= 1,
	spawnflags	= 1,
	filtername	= "anv_globalfixes_filter_survivor",
	origin		= Vector( 13541, 15357, 5538 )
} );
SpawnEntityFromTable( "trigger_multiple",
{
	targetname	= g_UpdateName + "_skybox_trigmult",
	StartDisabled	= 1,
	spawnflags	= 1,
	filtername	= "anv_globalfixes_filter_survivor",
	origin		= Vector( 13541, 15357, 6274 )
} );

EntFire( g_UpdateName + "_elevator_trigmult",	"AddOutput", "mins -222 -222 -76" );
EntFire( g_UpdateName + "_elevator_trigmult",	"AddOutput", "maxs 0 0 70" );
EntFire( g_UpdateName + "_elevator_trigmult",	"AddOutput", "solid 2" );
EntFire( g_UpdateName + "_faller_trigmult",	"AddOutput", "mins -222 -222 -5200" );
EntFire( g_UpdateName + "_faller_trigmult",	"AddOutput", "maxs 0 0 0" );
EntFire( g_UpdateName + "_faller_trigmult",	"AddOutput", "solid 2" );
EntFire( g_UpdateName + "_skybox_trigmult",	"AddOutput", "mins -222 -222 -580" );
EntFire( g_UpdateName + "_skybox_trigmult",	"AddOutput", "maxs 0 0 5200" );
EntFire( g_UpdateName + "_skybox_trigmult",	"AddOutput", "solid 2" );

// Alter gravity when all Survivors are inside elevator and revert it if not. When
// any Survivor touches either trigger, warp them to the elevator's Z. Note that
// gravity 0.865 is used because it's the lowest possible value that avoids player's
// views stuttering up and down when they jump.

EntFire( g_UpdateName + "_elevator_trigmult",	"AddOutput", "OnEntireTeamStartTouch worldspawn:RunScriptCode:c8m4_TeamGravity(0.865):0:-1" );
EntFire( g_UpdateName + "_elevator_trigmult",	"AddOutput", "OnEntireTeamEndTouch worldspawn:RunScriptCode:c8m4_TeamGravity(1.0):0:-1" );

EntFire( g_UpdateName + "_faller_trigmult",	"AddOutput", "OnStartTouch worldspawn:RunScriptCode:c8m4_TriggerWarp(activator):0:-1" );
EntFire( g_UpdateName + "_skybox_trigmult",	"AddOutput", "OnStartTouch worldspawn:RunScriptCode:c8m4_TriggerWarp(activator):0:-1" );

EntFire( g_UpdateName + "_elevator_tabbernaut",	"SetParent", "elevator" );
EntFire( g_UpdateName + "_elevator_infectdump",	"SetParent", "elevator" );
EntFire( g_UpdateName + "_elevator_trigmult",	"SetParent", "elevator" );
EntFire( g_UpdateName + "_faller_trigmult",	"SetParent", "elevator" );
EntFire( g_UpdateName + "_skybox_trigmult",	"SetParent", "elevator" );

// Function to loop through alive Survivors only to give slight low gravity.

function c8m4_TeamGravity( flGravity )
{
	if ( developer() > 0 ) { printl( "Ran c8m4_TeamGravity" ); }

	local hndSurvivor = null;

	while ( ( hndSurvivor = Entities.FindByClassname( hndSurvivor, "player" ) ) != null )
	{
		if ( hndSurvivor.IsSurvivor() && ! hndSurvivor.IsDead() )
		{
			hndSurvivor.SetGravity( flGravity );
		}
	}
}

// Function to take a Survivor's origin and set it to the same on X and Y except
// substitute their Z with the elevator's Z.

function c8m4_TriggerWarp( activator )
{
	if ( developer() > 0 ) { printl( "Ran c8m4_TriggerWarp" ); }

	local vecSurvivor	= activator.GetOrigin();
	local zedElevator	= Entities.FindByName( null, "elevator" ).GetOrigin().z;

	activator.SetOrigin( Vector( vecSurvivor.x, vecSurvivor.y, zedElevator + 10 ) );
}