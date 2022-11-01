func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Uratowałem szamana Ur-Shaka przed jego własnym ludem. Z wdzięczności opowiedział mi resztę dziejów Śniącego. Teraz mogę wrócić do Xardasa, by wypełnić wreszcie moje zadanie.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Szaman-wygnaniec - Ur-Shak, zdradził mi, że jedyny sposób na w miarę bezpieczne przedarcie się do podziemnej świątyni Śniącego. Muszę zdobyć ULU-MULU - święty amulet przyjaźni, respektowany przez wszystkich orków. Przyjaciel Ur-Shaka z Wolnej Kopalni może sporządzić dla mnie ULU-MULU."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
