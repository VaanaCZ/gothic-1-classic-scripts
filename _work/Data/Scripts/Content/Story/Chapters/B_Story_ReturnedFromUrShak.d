func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Xardas by³ zadowolony z informacji, które uzyska³em od Ur-Shaka. Teraz mam udaæ siê do Wolnej Kopalni, w poszukiwaniu przyjaciela szamana orków.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Zaczynam rozumieæ plan Xardasa. Poprosi³em go o pomoc w zniszczeniu bariery, której zgodzi³ siê mi udzieliæ. Jednak nie zamierza pos³u¿yæ siê w tym celu kopcem rudy! Zamiast tego poleci³ mi odnaleŸæ drogê do podziemnej œwi¹tyni Œni¹cego."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
