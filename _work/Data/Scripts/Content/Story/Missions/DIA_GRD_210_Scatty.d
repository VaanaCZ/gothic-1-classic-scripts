// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "��� �� �����������?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //� ��� ����������� ���� ������?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //� ������� �� ����� - ��������� ������, ������� ����� ������... � ��� �����.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "� ���� �������������� � ����� ������. �� ������ ��� ������?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //� ���� �������������� � ����� ������. �� ������ ��� ������?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //��� ��, ���� ���� ������� ���������� �� ���� �����������.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //����� ����������� ������ ����� ���� ���� �������.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //������ �� ��� ������ �� ���. ��������, ��������� �� �����, �, ����� ����, � ������� � ����� �������.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"�� ������, ������� �����, ���������� �����������, ���� � ������ �� ��� ������ �� ������.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "� ������ � �����!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //� ������ � �����!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //��, � ��������!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //�����, �� �� �������� ������� ���� ����...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"������ ����� ���� ���� ���� �� ��������� �� ������ �����������.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //� �� ������� ���! ������ ������� ��� �������! � �������!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"��� ��� ������ ����� �������� �� ������ �����������.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "� �������� � �������!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //� �������� � �������!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //��, � �� ������ ���� �������!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //�� ��������� ������ ����������. ������ ������� ���� �������� �� ������ ������.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //������, �� ��� ��������� - ��� ��� ����� ���� ����� ���!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"����� ����� ����! ��� �������� ����������� ������, �� ��� ��� ��� - ���.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //� �� ������� ���! ������ ��������, ��� ���� �������. ��� ������ ������� ����� �� ������ ������.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //�� ������ ����!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"� ������� ������! ������ ������� ��� ������������.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager K�mpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "������ �� ���������� ������ �� ������ ������� ������� �����?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //��� ��������, ��� ����� ������ � ������ ������ �� �����-�� ����� ����� ����� - ��� ������ �� �� ���������� ���� ����� ��������� �����?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //��� ����� ������: ��� ������� ����� ���� ��� � ������, � ��������� ����� �������� ��������, ��� ����������� �� ����� ����� �� ������ ������.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //����� ������� ���� �� ���, ���� ������ ������ ������ - � ���, ��� �� ���������, ������ �� �����.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //����� � ������� �� ���� ���� �������� �� ������ ������ - �� ������ ���� ������...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "� ���� ������� ������.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //� ���� ������� ������.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //�� ������ �� ����� �� �������.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //��������� ��� ��������� ����� ��������� ����. ����� �������������� ���������.
	
};

// **************************************************
// 					Will K�mpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "� ���� ��������� �� �����!";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //� ���� ��������� �� �����!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //� �� ���� ��������� ���� �����, ���� �� �� �������������� � ������ �� �������!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //������ �� ����� ����������� �����-��������!
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "� �� ������ ���������� ������?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC,"������, ������ �����, ����� ������� ���� ��������� ���������� �������.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //� �� ������ ���������� ������?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //��, �� �� ���� �����������. ���� �� ������, ����� � ���� ����, ���� �������� ���������.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //� ����� �� ��������������� � ���������� �������.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //������� �����! �� ������ ��� ���������� ��������, ���� ����� ��������� ��������� ������� ������.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //������� ����� �������� �� ������� ����� ������. ��� �����������, � ����� ����� �� ���������.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //�������� �� ������� ����� �����. ������ �����, � �� ����� ��� ����������.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //������ ������ ����� ������������ ����� ����, ����������� � ���� ��������. ��� ������� �������� �����.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //���� ��������� ���, � ��� � ���� �������, ���� ����� ������ ����� �������� � ��������.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //��, � ��� ��� ���: ��������� ����� ���� ����������� ���������. � ������� �� ��� ����� ������ ��������� ��.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //�� ��� ������ �� ������ �������������, ��� ����� ��� � ���� ����� ����������.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //� ���� ������������ ����!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //�������� ��� ��� ���-������ ��� ���������� ������.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //�����, �� ��� ������ �������. ���� ������� ������ ������� ����, ������ ���� ��������� ����� �������.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //������� ����, �������? �����, ������ � ���, ��� ����� ���������. ������ ��� ����� � �������������� - ���� ��������� �����������, � �� ��������� � �������� ���������.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //��� ���� ����� ������� ������ ������...
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //...� ������������� � �������� ������. �������, �� ������� �������������. ���, ����������� �������.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //�����������, ����� �������� ���������� ����!
	};
};
