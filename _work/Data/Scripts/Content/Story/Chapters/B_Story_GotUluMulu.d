func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"Zadanie sko�czone. Tarrok otrzyma� wszystkie elementy potrzebne do stworzenia Ulu-Mulu. Mam tylko nadziej�, �e orkowie strzeg�cy �wi�tyni �ni�cego uszanuj� amulet.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
