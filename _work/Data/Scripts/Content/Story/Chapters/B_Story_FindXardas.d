//*****************************************************************************
//***			Diese Funktion tцtet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintrдge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,	"После убийства магов Круга Огня остался еще один способ взорвать рудную гору. Сатурас сказал, что Барьер создавали тринадцать магов, а не двенадцать, как все думали.");
	B_LogEntry			(CH4_FindXardas,	"Тринадцатого мага звали Ксардас. Сейчас он живет в землях орков, в своей башне. Я вызвался найти его и попросить о помощи.");
	

	//-------- Missionsgegenstдnde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};