g_Chapter = "DEVELOPER - tutorial_standards_vs";

devchap( "ALL MODES" );

if ( HasPlayerControlledZombies() )
{
    EntFire( "worldspawn", "RunScriptFile", "anv_standards" );
}