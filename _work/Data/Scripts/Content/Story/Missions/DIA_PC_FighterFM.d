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
		AI_Output (self, other,"Info_GornFM_EXIT_09_01"); //Do boju!
	}
	else
	{
		AI_Output (self, other,"Info_GornFM_EXIT_09_02"); //Do zobaczenia.
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
	description	= "Utrzymuj pozycj�! Spr�buj� si� troch� rozejrze�!";
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
	AI_Output 			(hero,self,"Info_GornFM_WAIT_15_01"); //Utrzymuj pozycj�! Spr�buj� si� troch� rozejrze�!
	AI_Output 			(self,hero,"Info_GornFM_WAIT_09_02"); //Dobra. Zaczekam przy wej�ciu do kopalni i postaram si�, �eby nikt nie zaszed� nas od ty�u!

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
	description	= "Chod� ze mn�, potrzebuj� twojej pomocy.";
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
	AI_Output 			(hero,self,"Info_GornFM_FOLLOW_15_01"); //Chod� ze mn�, potrzebuj� twojej pomocy.
	AI_Output 			(self,hero,"Info_GornFM_FOLLOW_09_02"); //Nareszcie co� si� dzieje! Id� przodem, p�jd� za tob�.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"follow");
};



