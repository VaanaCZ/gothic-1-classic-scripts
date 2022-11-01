func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenstände --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Vše je hotovo. Tarrok dostal všechny čtyři části a zhotovil z nich ULU-MULU. Doufám jen, skřeti z města nad Spáčovým chrámem budou tento odznak respektovat.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
