//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Poté, co byli mágové Ohnì vyvraždìni, zbývá už jen JEDINÝ, který mùže pomoci s odpálením rudné haldy. Saturas mi øekl, že vytváøení magické Bariéry vedl tøináctý mág.");
	B_LogEntry			(CH4_FindXardas,"Tento tøináctý mág jménem Xardas žije osamocen ve vìži stojící uprostøed skøetího území. Souhlasil jsem, že se tam za ním vydám a požádám jej o pomoc.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
