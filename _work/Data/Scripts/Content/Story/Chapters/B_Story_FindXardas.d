//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Poté, co byli mágové Ohně vyvražděni, zbývá už jen JEDINÝ, který může pomoci s odpálením rudné haldy. Saturas mi řekl, že vytváření magické Bariéry vedl třináctý mág.");
	B_LogEntry			(CH4_FindXardas,"Tento třináctý mág jménem Xardas žije osamocen ve věži stojící uprostřed skřetího území. Souhlasil jsem, že se tam za ním vydám a požádám jej o pomoc.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
