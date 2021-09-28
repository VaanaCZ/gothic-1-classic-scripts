//*****************************************************************************
//***			Diese Funktion tцtet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintrдge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Все маги огня были убиты. Кроме одного. Сатурас рассказал мне, что в создании барьера участвовали тринадцать магов. Только этот, последний, может помочь взорвать руду.");
	B_LogEntry			(CH4_FindXardas,"Тринадцатый маг, известный под именем Ксардас, живет уединенно прямо посреди орочьих земель. Я согласился пойти туда, чтобы просить о помощи.");
	

	//-------- Missionsgegenstдnde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
