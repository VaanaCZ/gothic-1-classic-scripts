func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Xardas a semblé content de ma rencontre avec Ur-Shak. Ma prochaine route me mènera maintenant à la mine Libre pour trouver l'ami d'Ur-Shak.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Je commence maintenant à comprendre le dessein de Xardas. Je lui est demandé de l'aide pour la destruction de la Barrière Magique et actuellement il me montre un moyen, mais ce moyen n'a rien a voir avec l'amas de minerai des Magiciens de l'Eau. Il m'a demandé, à la place, de trouver un chemin vers le temple souterrain du Dormeur."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
