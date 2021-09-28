//*****************************************************************************
//***			Diese Funktion t�tet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Pot�, co byli m�gov� Ohn� vyvra�d�ni, zb�v� u� jen JEDIN�, kter� m��e pomoci s odp�len�m rudn� haldy. Saturas mi �ekl, �e vytv��en� magick� Bari�ry vedl t�in�ct� m�g.");
	B_LogEntry			(CH4_FindXardas,"Tento t�in�ct� m�g jm�nem Xardas �ije osamocen ve v�i stoj�c� uprost�ed sk�et�ho �zem�. Souhlasil jsem, �e se tam za n�m vyd�m a po��d�m jej o pomoc.");
	

	//-------- Missionsgegenst�nde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
