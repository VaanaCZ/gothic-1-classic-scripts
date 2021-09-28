// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //���������� ��������� �� ������� ������ ����� � ����������!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "��� �� �����������?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //��� �� ����� �������?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //����� �� ���, ����� ����� �� ���������� � ����� ������ - �������� ��� ���������� �� ������ ������.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //�� ���������, �������� ���������� ������ �������, �����?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //��, ��� �. 
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //����������� ����� �� ������ ������!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //� ������� �� ������ ������ - ����� ��� � ���, ���� �� ����� � �����, ��� ���������� �����.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //�� ��� ��������� � �����?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"���.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"��.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //���.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //� ���� �� �� �����? �� � ��� ���������� ���������.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //�� ����� ����� � ������� � ������ ��� ���������� ����, ��� ����� �������.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //��, ���������.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //������. ������, �� � ����� ����� �������������.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "������ ��� ������� ��������� ����� �� ������ ������?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //������ ��� ������� ��������� ����� �� ������ ������?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //�� ��������� � ����� �������, ������ - ��� ����� � ���������� �����.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //����� ������ �� �������� ������� �� �������� ����. �� ���� ������ ������ ���, ��� �� �����.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "� ������ ������?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //� ������ ������?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //�� ����� ����� ����� ����� ������. ������ �� ���� ���� ������ � ��������. �� � � ����� ���� ��������� ��������.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //������, ��� ��������� ����, ������ ���������� ���������. ���� ������ ���������� ��������, ��� ������ ���� �������� ����� ����� �� ���������.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "����� � ������ �� �����, ���� �� ���� ����� ������ ����..."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //����� � ������ �� �����, ���� �� ���� ����� ������ ����...
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //��� ��������� �� ����� ���������. ��� �������� ��� '������ ���������'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //�-�. � � ������ ������ ��� �����?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //� ����� ����� �������� ������� ��������. �� ��� �� ������ ����, ���� �� ������� ������ �� ���� ������.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "� �����, ��� ������ � �������� ���� ��������� �����-�� �������."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //� �����, ��� ������ � �������� ���� ��������� �����-�� �������.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //��, ������ �������� ���, ��� �����.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //�� ������ �������, ��� ������ ���������� ���� �� ������?!
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //��� ����� �� �����������, ��� � ��� �����. ���� �� ������ �� ������������ ��� �������, ��� �� ������ � ������ ��� ��� ���-������.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //�� ����, ��� ����...
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "��� ����� �����-������ ������..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //��� ����� �����-������ ������...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //����� ��������� �����, ������ �� ���� �����, ��������� ����� ����� ���-������.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //�� �� ����� ����� � ����� � ���-�� ����� ������ ����� - ��� ��������� ������� ������ � ��������, ����� ���� ������� �������.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //��������� ���� ������ ������������ �� ���� � ������ ������� �������������.
	
};



