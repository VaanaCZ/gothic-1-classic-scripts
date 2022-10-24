func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenstдnde --------
	

	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_FindOrcShaman,	"Я спас орка-шамана по имени Ур-Шак от его сородичей. За это он рассказал мне всю историю о Спящем. Теперь я могу вернуться к Ксардасу и передать ему эту историю.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,		"Ур-Шак, изгнанный шаман, указал мне единственный способ пройти через город орков к храму Спящего так, чтобы они на меня не напали. Мне нужен Улу-Мулу, священный предмет, который служит знаком дружбы у орков. Друг Ур-Шака, который был пойман людьми и отправлен в шахту, может сделать мне такой знак."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesablдufe дndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};