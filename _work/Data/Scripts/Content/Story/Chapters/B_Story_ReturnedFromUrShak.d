func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Xardas sembrava felice di ciò che ho appreso da Ur-Shak. Ora devo dirigermi alla miniera libera, per cercare l'amico dell'orco sciamano.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Comincio a comprendere lo scopo di Xardas. Gli ho chiesto di aiutarmi a distruggere la Barriera magica e mi ha indicato la via da seguire, che però non ha nulla a che fare con il cumulo di metallo dei Maghi dell'Acqua. Invece, mi ha chiesto di trovare una via d'entrata per il tempio sotterraneo del Dormiente."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
