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
	
	AI_Output			(self, other,"Info_HighPriest2_17_01"); //НЕВЕРНЫЙ В ХРАМЕ ПОВЕЛИТЕЛЯ!!!
	AI_Output			(self, other,"Info_HighPriest2_17_02"); //БУДЬ ЖЕ ПРОКЛЯТ!
	AI_Output			(other, self,"Info_HighPriest2_15_03"); //Проклинай САМ СЕБЯ, гниль!
	
	B_LogEntry			(CH4_EnterTemple,"Варраг-Касорг, следующий из пяти орочьих шаманов, сейчас простится со своей жалкой жизнью!");

	AI_StopProcessInfos	(self );

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};
