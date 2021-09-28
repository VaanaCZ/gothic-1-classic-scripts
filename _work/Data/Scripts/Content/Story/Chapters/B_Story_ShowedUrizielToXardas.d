func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas è rimasto molto colpito dal fatto che io sia riuscito a entrare nel tempio sotterraneo. Pensa che io sia l'icona di un'antica profezia degli orchi.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas ha identificato la strana spada che ho trovato nel tempio del Dormiente: il suo nome è URIZIEL e sembra essere stata dotata di straordinari poteri, che ha poi perso nel corso degli anni. Devo trovare il modo di restituirle tali poteri.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
