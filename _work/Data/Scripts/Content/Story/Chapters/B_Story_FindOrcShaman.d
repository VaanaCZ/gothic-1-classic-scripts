//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstдnde --------
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_FindXardas,"Наконец-то я встретил Ксардаса. Однако услышал я совсем не то, что ожидал. Он вовсе не был заинтересован в горе руды и рассказал мне первую часть истории Спящего. Не знаю теперь, что и сказать Сатурасу об этой беседе.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Ксардас хочет вновь испытать меня. За второй частью истории о Спящем мне придется идти к изгнанному орочьему шаману в развалины замка. Это к востоку от башни Ксардаса, рядом с вершиной. Единственная проблема - это заставить шамана прекратить кидаться в меня огненными шарами. Придется что-то придумать.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
