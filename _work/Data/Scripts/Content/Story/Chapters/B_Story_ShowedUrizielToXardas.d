func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstдnde --------
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_EnterTemple,"Ксардас был удивлен, обнаружив, что я сумел проникнуть в подземный храм. Похоже, он стал считать меня героем орочьего пророчества.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Ксардас сказал, что найденный мной в храме Спящего меч является УРИЗЕЛЕМ. В былые времена клинок обладал могучими силами, но затем утерял магическую энергию. Мне придется отыскать возможность вернуть мечу его былое могущество.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
