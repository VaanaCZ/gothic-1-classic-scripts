// *********************** PRIESTER 2 ***********************

INSTANCE Info_HighPriest2 (C_INFO)
{
	npc			= ORC_Priest_2;
	nr			= 1;
	condition	= Info_HighPriest2_Condition;
	information	= Info_HighPriest2_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest2_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest2_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output			(self, other,"Info_HighPriest2_17_01"); //UN INFEDELE NELLA CASA DEL MAESTRO!!!
	AI_Output			(self, other,"Info_HighPriest2_17_02"); //CHE TU SIA DANNAAATOOOOO!
	AI_Output			(other, self,"Info_HighPriest2_15_03"); //TU sarai dannato, vecchio zerbino puzzolente!
	
	B_LogEntry			(CH4_EnterTemple,"Varrag-Kasorg, un altro dei cinque orchi sciamani, terminerà la propria non-esistenza ai miei piedi.");

	AI_StopProcessInfos	(self );

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};
