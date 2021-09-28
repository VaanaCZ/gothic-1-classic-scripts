//***************************************************************************
//	Info EXIT
//***************************************************************************
INSTANCE Info_GornFM_EXIT (C_INFO)
{
	npc			= PC_FighterFM;
	nr   		= 999;
	condition	= Info_GornFM_EXIT_Condition;
	information	= Info_GornFM_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_GornFM_EXIT_Condition()
{
	return 1;
};

func VOID Info_GornFM_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_GornFM_EXIT_09_01"); //Защищайся!
	}
	else
	{
		AI_Output (self, other,"Info_GornFM_EXIT_09_02"); //Увидимся.
	};
	
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info WAIT
//---------------------------------------------------------------------
INSTANCE Info_GornFM_WAIT (C_INFO)
{
	npc			= PC_FighterFM;
	condition	= Info_GornFM_WAIT_Condition;
	information	= Info_GornFM_WAIT_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Никуда не уходи, я посмотрю, что там происходит!";
};                       

FUNC INT Info_GornFM_WAIT_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func VOID Info_GornFM_WAIT_Info()
{
	AI_Output 			(hero,self,"Info_GornFM_WAIT_15_01"); //Никуда не уходи, я посмотрю, что там происходит!
	AI_Output 			(self,hero,"Info_GornFM_WAIT_09_02"); //Хорошо. Я буду ждать у входа в шахту и прослежу за тем, чтобы все было тихо.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"wait");
};

//---------------------------------------------------------------------
//	Info FOLLOW
//---------------------------------------------------------------------
INSTANCE Info_GornFM_FOLLOW (C_INFO)
{
	npc			= PC_FighterFM;
	condition	= Info_GornFM_FOLLOW_Condition;
	information	= Info_GornFM_FOLLOW_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Идем, мне нужна твоя помощь.";
};                       

FUNC INT Info_GornFM_FOLLOW_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func VOID Info_GornFM_FOLLOW_Info()
{
	AI_Output 			(hero,self,"Info_GornFM_FOLLOW_15_01"); //Идем, мне нужна твоя помощь.
	AI_Output 			(self,hero,"Info_GornFM_FOLLOW_09_02"); //Наконец-то мы двигаемся! Иди первым, я пойду сзади.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"follow");
};



