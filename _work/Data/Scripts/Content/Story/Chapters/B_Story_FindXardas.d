//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Po tragicznej śmierci Magów Ognia pozostała już tylko jedna osoba, która może nam pomóc wydostać się z kolonii. Saturas wyznał mi, że prace nad tworzeniem Bariery nadzorował trzynasty mag!");
	B_LogEntry			(CH4_FindXardas,"Trzynasty mag, imieniem Xardas, prowadzi samotnicze życie w swej wieży, gdzieś głęboko na ziemiach orków. Zgodziłem się odnaleźć go i poprosić o pomoc.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
