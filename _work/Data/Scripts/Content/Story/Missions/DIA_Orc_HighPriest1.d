// *********************** PRIESTER 1 ***********************

INSTANCE Info_HighPriest1 (C_INFO)
{
	npc			= ORC_Priest_1;
	nr			= 1;
	condition	= Info_HighPriest1_Condition;
	information	= Info_HighPriest1_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest1_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest1_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output 			(self, other,"Info_HighPriest1_17_01"); //СМЕЕЕЕЕЕЕРТНЫЫЫЙ!
	AI_Output 			(self, other,"Info_HighPriest1_17_02"); //КАК ТЫ ПОСМЕЛ ПОТРЕВОЖИТЬ МЕНЯ!
	AI_Output 			(self, other,"Info_HighPriest1_17_03"); //ГОТОВЬСЯ К СМЕРТИ!
	AI_Output 			(other, self,"Info_HighPriest1_15_04"); //Мы еще посмотрим, кому следует готовиться к смерти, ты, гнилой труп!
	
	B_LogEntry			(CH4_EnterTemple,	"Варраг-Хашор, один из пяти орков-шаманов, которые держали Спящего в этом мире, стоит передо мной. Я помогу ему навсегда уйти из мира живых.");

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

