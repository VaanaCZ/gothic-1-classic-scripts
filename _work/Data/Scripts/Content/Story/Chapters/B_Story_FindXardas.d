//*****************************************************************************
//***			Diese Funktion t�tet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Po tragicznej �mierci Mag�w Ognia pozosta�a ju� tylko jedna osoba, kt�ra mo�e nam pom�c wydosta� si� z kolonii. Saturas wyzna� mi, �e prace nad tworzeniem Bariery nadzorowa� trzynasty mag!");
	B_LogEntry			(CH4_FindXardas,"Trzynasty mag, imieniem Xardas, prowadzi samotnicze �ycie w swej wie�y, gdzie� g��boko na ziemiach ork�w. Zgodzi�em si� odnale�� go i poprosi� o pomoc.");
	

	//-------- Missionsgegenst�nde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
