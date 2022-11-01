//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindXardas,"Konečně jsem se setkal s Xardasem. Setkání se však vůbec nepodobalo tomu, co všichni očekávali. Neměl nejmenší zájem o rudnou haldu, ale vyprávěl první část Spáčova příběhu. Nevím, co Saturasovi o průběhu tohoto rozhovoru povím.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas si mě chtěl znovu vyzkoušet. Abych si mohl vyslechnout druhou část Spáčova příběhu, musím v rozvalinách chrámu navštívit vyhoštěného skřetího šamana. Nachází se blízko vrcholu kopce směrem na východ od Xardasovy věže. Opravdu nemám ponětí, jak jej přiměju, aby po mně nemetal ohnivé koule. Něco ale vymyslím.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
