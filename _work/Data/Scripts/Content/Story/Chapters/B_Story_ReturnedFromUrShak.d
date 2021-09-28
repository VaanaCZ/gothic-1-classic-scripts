func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstдnde --------
	

	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_FindOrcShaman,"Похоже Ксардас весьма доволен тем, что я узнал от Ур-Шака. Мой дальнейший путь лежит в Свободную Шахту, чтобы отыскать друга Ур-Шака.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Я начинаю понимать цель, которую преследует Ксардас. Я попросил его помочь мне с разрушением барьера, и он подсказал мне путь. Однако этот путь никак не связан с горой руды, которую собрали маги воды. Он отправил меня искать путь в подземный храм Спящего."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesablдufe дndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
