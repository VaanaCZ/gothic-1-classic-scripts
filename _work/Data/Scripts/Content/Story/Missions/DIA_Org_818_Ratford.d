// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //��, ��!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //��� ���� �����?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //���� ������������ ����. ����� �� ���� ���������� ��������� ������.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "� �� ���� ����� ����� ���������?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //� �� ���� ����� ����� ���������?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //�� �����������. �� �������� ����, � ���� �� �� �� ��� �� ������ �������. ����� ������ ����� ���.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //��? � ��� ��� �������?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //������ ����� ��������� ������. �� � ���� ������� ����� �����������.
};

// **************************************************
//					Warum gef�hrlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "������ ��� ����� ��������� ��������?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //������ ��� ����� ��������� ��������?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //�� ������ ��� ������, ��? � ������� ��� ���������� ����, ������ ��� ���� �����-�� ���������.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //�� ������� ����� �������� �� ��� ������, �� ���� ��� ���� ����� ��������� ���� ������ ��� ������, ��� ������� �� ������� ������ �������.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //� ���� �� ��� �� ��������, ���� � ���� ��� �� �������� �������, �� �������� ������.
};

// **************************************************
//					Wo Ausr�stung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "��� � ���� ����� ������� ������� � ������?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //��� � ���� ����� ������� ������� � ������?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //� ��������� � �������. ������ �������� �� ������� ������. ��� �� ������ � ��� ����� ��� �������.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //�� � ����� ������, �� �������� �� ������, ���� ����� �� ��� ������, ����, �������, ����� ������ �����.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //���� ������� � ������ ������, ����� ��������. �� ���� �� ���. � ���� �� ������� ������ ������� ����� �� ������ ����.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC, "��� ������� ������� � ������ ������ ���� ������ �� �������� �����.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "�������� ��� � ���, ��� ��������� � ���� �������.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //�������� ��� � ���, ��� ��������� � ���� �������.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //����� ������ ����� ������ �� ������ ������ � �������, ����� ������ �����. ��� �� �������� ������ �������������.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //� ���� � ���� ������� � ������� ����������, ������� ����� ������� �� ���������. ��� ������� � ������ �������.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //������� ������ ��������. ����� �� ����� �����. ����������� �� ��� - ������ ����������, ���������� �� ������ ������ ����� � ������. ������ ����� ��������� � ��������� ��������� �����.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //������ � ����� ������ ����� ��� ��������� ����� ��� ���� ����� ������� ������. � ����� �� ����� ���� ������ ����� ��������� ��������.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //� ��� ��������� �����: �� ����� ������� �� ������� �����!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "��� ��� ������� �����?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //��� ��� ������� �����?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //������ �� ���� ����� �� ������� ������. ��-�����, ��� ��� ���� ���������.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //�����, � ���� ���������� ������� � ���� �����-������ �����. �, �����, � ���� ����� ����� � ��� ����?
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte, "���� � ������� ����� ���������, � ������ ���, ��� ����� ������." 	,Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte, "� ����� ��� ����? ����� �� �� ������� ��?" 										,Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //���� � ���� ��������� ������� ����� ���������, �� � ������ �������, ������� ����� ������.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //� �� ��� ���������! ���� �����, �� �������� �������������� � ������ ������? ���� ������� ����, ����� �����. �� ��������� ����� �����. �����, � ���� �������� ��� ���� ������.
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //� ����� ��� ����? ����� �� �� ������� ��?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //��, �� ��� �������� ������ �� ��� �� ���� ����...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "������� �� ������.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //������� �� ������.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //������ �� �����, ��� ����� ��� ����� ���� ������ ����!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //�������, � ������� �������� ������, �� ��������� ����� ����� ���� ������ ������, ��� �� ������������ ���� �����.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //� ��� �������.
};











