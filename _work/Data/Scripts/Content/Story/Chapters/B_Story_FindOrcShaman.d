//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindXardas,"Finalmente sono riuscito a incontrare Xardas, ma è andata molto diversamente da quanto mi aspettassi. Non era per nulla interessato al cumulo di metallo, ma mi ha raccontato la prima parte della storia del Dormiente. Non so cosa riferire a Saturas, di tutta questa conversazione.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas ha voluto mettermi nuovamente alla prova. Se voglio ascoltare la seconda parte della storia del Dormiente, devo far visita a un orco sciamano esiliato, egli vive fra le rovine di un castello, vicino alla cima di un monte, a est della torre di Xardas. Non so come lo convincerò a non scagliarmi contro delle palle di fuoco, ma penserò a qualcosa.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
