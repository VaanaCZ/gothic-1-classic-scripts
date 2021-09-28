// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "�� �� ������ ���������, �����?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //�� �� ������ ���������, �����?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //�� �������� ��� ���������.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //� - ���� �����. �� �������� � ����� ������!
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "��� �� �����������?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //��� �� ����� �������?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //���������� ���� ������� ���� �������� ����� �������������� � ������ ��������.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //�� �������� �� ���������� �������� �����������. � ����� � ������ ������ ��������.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //� �� ���������� ����� ������� �������. ������� �������. ��� � ������ ������� ������������ �� �����������.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"���� ����� ������� �������� ����� � ��������� � ����� ������.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "������ ���, ��� � ���� ����.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //������ ���, ��� � ���� ����.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //��� ���������.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "������ ��� �� ������ ���� ��� ������ ��������?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //������ ��� �� ������ ���� ��� ������ ��������?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //���� ������ ������ �������� ���, �� �� �������� ��� ��� � ���� �� �����, ��� ���������� �������� �� ������� �����.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //�� ������� ��������� ��������, � �����, ��� ������ �� ���� ����� �� �����.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"���� ������ ������ ����� ����� � ���� � ����� � ����.");	
	};
};

// ************************************************************
// 					Ich k�nnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "� ���� ������ ���� ��������� ��������.";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //� ���� ������ ���� ��������� ��������.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //����� ������� ���� ���� ����� � ���� �������� ���� ����� ��������.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //�� �� ������ ������ ��� � ������. 
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //�� ��� ��� ����� �� ���� �����. ���������� �� ���, ��� ����� ��� ������ � ������, � ������, � ���� ������ ���� ��������.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //�������, ������ ���� �� ���������� � ���� �������..
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //�� ����� ������ ������ ����������� ���� ������. � ��� �������� ������ ��� ������.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "�����, ��� � ������, ���� ������ ���� � ����������?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //�����, ��� � ������, ���� ������ ���� � ����������?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //� ����� ������� ����, ��� �� ��� ���� ���������.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //� ���� ���� ������, � ������� ��������� �������������� ����� �������.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //���, ���� ��������, � ���� ������ ���� ����� ����� �� ������ ������ ��������. � ���� ������� ����� � ��� ������� � ������ ������.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //��� ��� - ������������ ������ ����������, �`�������.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //���� �� ������������� ������, � ���� ��������� ���� �����. 100 ���������� - ������� ����� �� ���� ������.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "�����, ����� ��� ��������. ���� � ������ ��� ���������?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //�����, ����� ��� ��������. ���� � ������ ��� ���������?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //������, �� ��� ����� ������� ��������. ������ ������ � ������. �� ����� - �� ������ ������ �������, �� ������.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //� ��� ��� ���: ���� ���-������ ������� � ���� ��������, ��� �� �������� ��� ���, ���� ������ �� ���������.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //����������.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"���� ����� ��� ��� 10 ���� �������� �������, ������� ��� ���� �������������� � ����� ������.");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "� ������ ��������, ��� �� � ������.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //� ������ ��������, ��� �� � ������.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //� � ���� ��� �������� ����� ����������. �� �������� ������� ������.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //��� �� ������ �������� � �������?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"� ������ ����.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"������ ��� ����� ������ ��������.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"����� ���������� ���������� ������. ��� ��� �� ����������?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"���� ����� ������� ����� �����������, � � - ���� ��������������.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //� ���� ��� �� ���� ����� �����������. �������� ���.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //����� ���������� ���������� ������. ��� ��� �� ����������?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //����� �����, ����, ���������, ��������� � ���. �� ������ ������� ����� ���.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"� ������ ���������� ������.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //������ ��� ����� ������ ��������.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //���� ������� ����� ���������. � ������ ����. ���� ���� - ���� �� ������ ���� ��������, ��� � �.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //�`������ ������ ��� ����� ����������, �� �������� ����� �� ����� ������ �� ���������.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //������ �� ������� ���� ��������� ������ ��������, ��� ������� ���� �� ������ ���������.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //���� �� ������ ��� ���, �� ������� ��� ���� ����������.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"���� ����� ��� ��� ��� ���, ����� � �������� ��� ����� �����. ��� ������� ��� �������������� � ��������.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //� ������ 100 ������ ����.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //����� ������. ��� ���.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //� ������ ���������� ������.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //������� �������. ������� ��� �����.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"����� �����",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"���������",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"���������",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"���",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"����",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //��� ��� ��������� ������. ��������� �� � ����!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //��� ��� ��������� ������. ��������� �� � ����!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //��� ��� ��������� ������. ��������� �� � ����!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //��� ��� ��������� ������. ��������� �� � ����!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //��� ��� ��������� ������. ��������� �� � ����!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




