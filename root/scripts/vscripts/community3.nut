Msg("Activating community mutation 3.\n");

DirectorOptions <-
{
	ActiveChallenge = 1

	cm_CommonLimit = 0

	BoomerLimit = 0
	ChargerLimit = 0
	HunterLimit = 0
	JockeyLimit = 4
	SmokerLimit = 0
	SpitterLimit = 0
	cm_MaxSpecials = 4

	cm_SpecialRespawnInterval = 20

	function ConvertZombieClass(id)
	{
		return 5;
	}
}