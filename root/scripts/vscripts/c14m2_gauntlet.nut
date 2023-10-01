Msg("Beginning Lighthouse Scavenge.\n")

DirectorOptions <-
{
	CommonLimit = 7
	MobSpawnMinTime = 8
	MobSpawnMaxTime = 16
	MobSpawnSize = 4
	MobMaxPending = 10
	IntensityRelaxThreshold = 1.1
	RelaxMinInterval = 6
	RelaxMaxInterval = 10
	SustainPeakMinTime = 10
	SustainPeakMaxTime = 15
	SpecialRespawnInterval = 40
	LockTempo = false
	PreferredMobDirection = SPAWN_ANYWHERE
	PanicForever = true
}

Director.ResetMobTimer();