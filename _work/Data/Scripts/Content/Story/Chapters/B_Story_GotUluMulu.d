func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenstдnde --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_UluMulu,"Сделано. Таррок получил все четыре компонента и собрал из них Улу-Мулу. Мне остается лишь надеется, что орки города над храмом Спящего и в самом деле будут уважать его.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
