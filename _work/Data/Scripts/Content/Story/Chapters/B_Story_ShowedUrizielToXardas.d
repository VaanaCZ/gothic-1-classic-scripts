func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas byl dost pøekvapen, že se mi podaøilo proniknout do podzemního chrámu. Díval se, jako by mì považoval za ikonu ze starého skøetího proroctví.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas rozpoznal v podivném meèi, který jsem našel ve Spáèovì chrámu, URIZIEL. Tato prastará èepel mìla kdysi zøejmì nesmírnou moc, ale v prùbìhu èasu jí pozbyla. Potøebuji najít zpùsob, jak této zbrani vrátit její nìkdejší sílu. ");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
