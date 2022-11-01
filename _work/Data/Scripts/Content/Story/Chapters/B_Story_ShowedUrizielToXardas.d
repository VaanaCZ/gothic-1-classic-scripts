func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas byl dost překvapen, že se mi podařilo proniknout do podzemního chrámu. Díval se, jako by mě považoval za ikonu ze starého skřetího proroctví.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas rozpoznal v podivném meči, který jsem našel ve Spáčově chrámu, URIZIEL. Tato prastará čepel měla kdysi zřejmě nesmírnou moc, ale v průběhu času jí pozbyla. Potřebuji najít způsob, jak této zbrani vrátit její někdejší sílu. ");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
