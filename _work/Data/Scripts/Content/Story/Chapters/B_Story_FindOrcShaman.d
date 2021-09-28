//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindXardas,"Koneènì jsem se setkal s Xardasem. Setkání se však vùbec nepodobalo tomu, co všichni oèekávali. Nemìl nejmenší zájem o rudnou haldu, ale vyprávìl první èást Spáèova pøíbìhu. Nevím, co Saturasovi o prùbìhu tohoto rozhovoru povím.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas si mì chtìl znovu vyzkoušet. Abych si mohl vyslechnout druhou èást Spáèova pøíbìhu, musím v rozvalinách chrámu navštívit vyhoštìného skøetího šamana. Nachází se blízko vrcholu kopce smìrem na východ od Xardasovy vìže. Opravdu nemám ponìtí, jak jej pøimìju, aby po mnì nemetal ohnivé koule. Nìco ale vymyslím.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
