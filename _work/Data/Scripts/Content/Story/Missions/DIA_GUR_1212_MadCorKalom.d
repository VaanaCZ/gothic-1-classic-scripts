instance  GUR_1212_MadCorKalom_Talk2SC (C_INFO)
{
	npc				= GUR_1212_MadCorKalom;
	condition		= GUR_1212_MadCorKalom_Talk2SC_Condition;
	information		= GUR_1212_MadCorKalom_Talk2SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return TRUE;
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Ќаконец-то мы снова встретились!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //ћой господин сообщил мне о твоем прибытии!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //ќн чувствует, что ты р€дом.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //—коро € буду ближе к нему, ближе, чем ему хотелось бы!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //ћы не позволим тебе расстроить наши планы.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //ћир вот-вот станет свидетелем пробуждени€ »збавител€, и никто не в силах остановить его.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //¬сех неверных ждет расплата за их грехи. 
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //» тебе уготована честь стать первым из них.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //ѕѕ–––ќќќќќќќќќќќЅЅЅ””””””ƒƒ»—№, ———ѕѕѕѕѕѕяяяяяяяяяяяўўў»»»»»»…………!!!!!!!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
