func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas a été surpris que j'ai réussi à pénétrer dans le temple souterrain. Il pense que je fais partis d'une vieille prophétie Orc.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas a identifié l'étrange épée que j'ai trouvé dans le temple du Dormeur comme étant URIZIEL. Cette ancienne lame a supposé détenir d'immense pouvoirs fut un temps, mais dans la course du temps elle a perdu son énergie magique. Je dois trouver un moyen de restaurer cette arme.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
