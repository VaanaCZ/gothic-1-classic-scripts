// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //�� �������� � ����� ������, ����������!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //� �����, ����� ��������� ���� �� ���� ��������.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "� ����� ���� �������� ����?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //� ����� ���� �������� ����?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //���� �������. ���� � ��� ���� ���������� ���.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //���� ����� �������� �������, � ������� ������ � ����� ������ ��������� ������� ���������.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //�� ��� ��� �� ������� � ���� ������ � ��������, �� ������ ����� ������� ��� ������.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //����� ������� �����, ��� ���� ���������� ��� ���� �������� ����. ��� ����� ��� ����������� ����� ��������������.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //��� ������ �������� ������, �� ������. ������, � ���� ��������� ���� ����.
};

// **************************************************
//					Vorteile f�r mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "� ����� ��� ������ �� ����, ��� � ������������ � ���?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //� ����� ��� ������ �� ����, ��� � ������������ � ���?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //��������, �� ������� ����� �� ���������, ��� ������� �� ������� ���������� ���.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //��� �� ������� ������� ������� ����� � ����� �������. ������ ������ �� ��� ����� �������� �����.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //���� ����� �� �� ���� �������, �� ������ ���� ���������� ��� ���� �������.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //������, ���� �������� ������ ����� ���������� ����.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //�������� ������� �� ����, ������ ��� ������ �������������� � ������-������ ������� ������!
};

// **************************************************
//					Schl�fer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "�� ������, ��� ����� ������?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //�� ������, ��� ����� ������?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //������ ������� � ���� �� ���� � ��������.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //��� ��� ���� ���, �� ����� ��� �� �����, � ��� ��� ��� ������� ������� ������� ���.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //��� ����� �������� ��������� ���� ����� � ������� � �������� ���� �������.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //��������? �� ����?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //�� ����� ���������� �����, �������! ������ ������ ��� ���� � �������!
};

// **************************************************
//			Was hat Schl�fer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "� ��� ������ ������?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //� ��� ������ ������?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //�� ������ ��� � ���������� ������� ����� �� ������. ������ ��� �� ��������� ���� ������.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //�� ������� ��� ������� �������� - ����� �� ��� �� ������ ����� �� ������.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //�� ������ ��� ���� ���������. �� ������� ��� ������ ������� � ������ �������� ���, ��� ��� ����.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //� ��������� �� ������ ���������� �����. ��� ����� ����� �������������� � �������, ��� ��, ��� ������������ ����������.
};

// **************************************************
//		Erz�hl mir von der MAgie des Schl�fers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "�������� ��� � ����� �������.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //�������� ��� � ����� �������.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //���� ��� ��������� �������� ��������� ����� ������ ������.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //������ ���� ��������� � �������� ����� �������.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "������� ���� � ���� ������. � ���� ���������� �� ����!";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //������� ���� � ���� ������. � ���� ���������� �� ����!
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi, "���� ������, ��������� �� ��������, ���� �������������� ���� � ������� � ������ ������. �� ��������� ��������� ���� � �������� ������.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //����� ������! � ����� �������. ��� �� ����!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //���, �� �� �����. ������ �� ������ ���� ��������� ������ ��������.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //������ �����? ��� ��� ������.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //������ � �������� � ����� ��������. ������, ���, ����� ����, �� �� �������� ����� ���.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //������ ��� ������. �� ���������� ��������� � �� ������������.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //� � ����������� � ������. ��� ��� ������ ����� ������ ����� ���� ������.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //�����!

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi, "������ ���� �������� ������. ��� ��������� ����������� ��� ���������� � ���� ��� �������. �� ��������� �� ������������ � ������������.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


