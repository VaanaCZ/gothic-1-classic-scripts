func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenstände --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Zadanie skończone. Tarrok otrzymał wszystkie elementy potrzebne do stworzenia Ulu-Mulu. Mam tylko nadzieję, że orkowie strzegący świątyni Śniącego uszanują amulet.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
