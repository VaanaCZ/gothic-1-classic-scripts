func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,"Zachr�nil jsem sk�et�ho �amana Ur-Shaka p�ed jeho vlastn�mi lidmi. Byl mi tak vd��n�, �e mi dopov�d�l zbytek Sp��ova p��b�hu. Nyn� se m��u vr�tit ke Xardasovi a dokon�it sv�j �kol.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Ur-Shak, vyho�t�n� �aman, mi �ekl, jak se dostanu do Sp��ova podzemn�ho chr�mu pod sk�et�m m�stem, ani� bych musel bojovat se v�emi sk�ety. Mus�m m�t ULU-MULU, odznak, kter� v�ichni sk�eti respektuj�. Jeden Ur-Shak�v p��tel, kter� je v�zn�n v dole lid�, mi takov� odznak m��e zhotovit."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
