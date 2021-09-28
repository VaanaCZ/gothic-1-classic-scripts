func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstдnde --------
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_EnterTemple,	"Ксардаса очень удивило то, что я смог попасть в подземный храм. Теперь он считает меня героем из какого-то древнего оркского пророчества.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,	"Ксардас узнал странный меч, который я нашел в храме Спящего. Он назвал его УРИЗЕЛЬ. Это древнее оружие когда-то обладало невероятной силой. Но со временем меч растерял ее. Я должен найти способ восстановить его.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};