func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"V�e je hotovo. Tarrok dostal v�echny �ty�i ��sti a zhotovil z nich ULU-MULU. Douf�m jen, sk�eti z m�sta nad Sp��ov�m chr�mem budou tento odznak respektovat.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
