//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstдnde --------
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_FindXardas,	"Я наконец-то нашел Ксардаса. Но наша встреча прошла не совсем так, как я предполагал. Его совершенно не интересует рудная гора, но вот о Спящем он захотел узнать больше. Он рассказал о нем немного. Интересно, что подумает об этом Сатурас?");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,	"Ксардас снова хочет меня испытать. Он хочет, чтобы я нашел одного из орков-шаманов, который прячется в руинах храма, и узнал у него все, что касается Спящего. Руины находятся на вершине горы к востоку от башни Ксардаса. Мне еще не совсем понятно, как я смогу поговорить с орком, но, думаю, скоро я смогу это выяснить.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};