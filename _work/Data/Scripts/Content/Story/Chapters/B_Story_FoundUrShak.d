func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,"Uratowa�em szamana Ur-Shaka przed jego w�asnym ludem. Z wdzi�czno�ci opowiedzia� mi reszt� dziej�w �ni�cego. Teraz mog� wr�ci� do Xardasa, by wype�ni� wreszcie moje zadanie.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Szaman-wygnaniec - Ur-Shak, zdradzi� mi, �e jedyny spos�b na w miar� bezpieczne przedarcie si� do podziemnej �wi�tyni �ni�cego. Musz� zdoby� ULU-MULU - �wi�ty amulet przyja�ni, respektowany przez wszystkich ork�w. Przyjaciel Ur-Shaka z Wolnej Kopalni mo�e sporz�dzi� dla mnie ULU-MULU."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
