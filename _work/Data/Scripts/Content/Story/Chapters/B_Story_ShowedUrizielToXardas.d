func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas by� bardzo zaskoczony, �e uda�o mi si� dotrze� do podziemnej �wi�tyni. Chyba naprawd� uwa�a, �e jestem osob�, o kt�rej m�wi staro�ytna przepowiednia ork�w.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardasowi uda�o si� zidentyfikowa� dziwny miecz, kt�ry znalaz�em w �wi�tyni �ni�cego. To staro�ytny URIZIEL - niegdy� obdarzony niezwykle pot�nymi mocami. Niestety, z biegiem lat miecz straci� swe magiczne w�a�ciwo�ci. Musz� znale�� jaki� spos�b, by przywr�ci� mu dawn� �wietno��.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
