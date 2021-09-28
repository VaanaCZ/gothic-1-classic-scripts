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
		AI_Output (self, other,"Info_GornFM_EXIT_09_01"); //Do boje!
	}
	else
	{
		AI_Output (self, other,"Info_GornFM_EXIT_09_02"); //Ještì se uvidíme.
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
	description	= "Hlídej tuhle pozici, já obhlédnu situaci!";
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
	AI_Output 			(hero,self,"Info_GornFM_WAIT_15_01"); //Hlídej tuhle pozici, já obhlédnu situaci!
	AI_Output 			(self,hero,"Info_GornFM_WAIT_09_02"); //Dobøe. Poèkám u vchodu do dolu a ty dohlídni, aby se nikdo o nic nepokusil.

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
	description	= "Pojï, potøebuji tvou pomoc.";
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
	AI_Output 			(hero,self,"Info_GornFM_FOLLOW_15_01"); //Pojï, potøebuji tvou pomoc.
	AI_Output 			(self,hero,"Info_GornFM_FOLLOW_09_02"); //Koneènì se pohneme! Jdi první, já pùjdu za tebou!

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"follow");
};



