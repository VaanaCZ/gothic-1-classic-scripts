func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"Lo estoy consiguiendo. Tarrok ha recibido las cuatro partes y fabricado un Ulu-Mulu con ellas. S�lo espero que los orcos de la ciudad situada sobre el templo del Durmiente tambi�n lo respeten.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
