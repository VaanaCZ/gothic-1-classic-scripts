//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Po tragicznej œmierci Magów Ognia pozosta³a ju¿ tylko jedna osoba, która mo¿e nam pomóc wydostaæ siê z kolonii. Saturas wyzna³ mi, ¿e prace nad tworzeniem Bariery nadzorowa³ trzynasty mag!");
	B_LogEntry			(CH4_FindXardas,"Trzynasty mag, imieniem Xardas, prowadzi samotnicze ¿ycie w swej wie¿y, gdzieœ g³êboko na ziemiach orków. Zgodzi³em siê odnaleŸæ go i poprosiæ o pomoc.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
