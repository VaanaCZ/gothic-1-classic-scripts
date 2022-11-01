func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Xardas był zadowolony z informacji, które uzyskałem od Ur-Shaka. Teraz mam udać się do Wolnej Kopalni, w poszukiwaniu przyjaciela szamana orków.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Zaczynam rozumieć plan Xardasa. Poprosiłem go o pomoc w zniszczeniu bariery, której zgodził się mi udzielić. Jednak nie zamierza posłużyć się w tym celu kopcem rudy! Zamiast tego polecił mi odnaleźć drogę do podziemnej świątyni Śniącego."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
