func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"J'ai sauvé le shaman Orc appelé Ur-Shak de son propre peuple. Il a été si reconnaissant qu'il m'a raconté la partie restante de l'histoire du Dormeur. Maintenant je peux retourner chez Xardas pour compléter ma quête.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Ur-Shak, le shaman banni, m'a révélé le seul moyen d'accéder au temple souterrain du Dormeur sous la ville Orc sans avoir à combattre tous ces Orcs. J'ai besoin d'un ULU-MULU, une sorte d'objet sacré qui est respecté comme une emblème par tous les Orcs. Un ami de Ur-Shak qui est détenue dans une mine humaine peut me fabriquer cet objet."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
