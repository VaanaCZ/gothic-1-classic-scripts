func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstдnde --------
	

	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_FindOrcShaman,	"Кажется, Ксардасу пригодилась история, рассказанная Ур-Шаком. Теперь я должен пойти в Свободную шахту, чтобы найти друга Ур-Шака.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,	"Я понимаю, что хочет Ксардас. Я попросил его, чтобы он помог нам разрушить Барьер. Он предложил мне один способ, который оказался никак не связан с рудной горой. Он потребовал найти вход в подземный храм Спящего."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesablдufe дndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};