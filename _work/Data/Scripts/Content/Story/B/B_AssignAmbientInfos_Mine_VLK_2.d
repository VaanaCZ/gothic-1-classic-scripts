// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_2_EXIT_Condition;
	information	= Info_Mine_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "��������� ��������";
};                       

FUNC INT Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_2_Mine_Condition;
	information	= Info_Mine_Vlk_2_Mine_Info;
	permanent	= 1;
	description = "�������� ��� � �����.";
};                       

FUNC INT Info_Mine_Vlk_2_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00"); //�������� ��� � �����.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01"); //��� ����� �����, ��� ��� �������� ����. �� ��-�� �������� ������ �������� ����������.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02"); //������� ����� ����, ������� ������� ������.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "��� ��� ����� ���������� �� ���� �����?";
};                       

FUNC INT Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00"); //��� ��� ����� ���������� �� ���� �����?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01"); //������ ����������. �� ������ ������ ����, �� ��������� ����, �� � ��� ������ �� �����. ��� ��� � ���� �� ������ ����.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_2_Minecrawler_Condition;
	information	= Info_Mine_Vlk_2_Minecrawler_Info;
	permanent	= 1;
	description = "��� �� ������ � ��������?";
};                       

FUNC INT Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00"); //��� �� ������ � ��������?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01"); //�� ���������� ������ ����, ������� ����� ����� ������. ��� ���� ���� ������.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02"); //������� ��� �������. �� �� �������? � ����� �����.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_2_DieLage_Condition;
	information	= Info_Mine_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "��� � ���� ����?";
};                       

FUNC INT Info_Mine_Vlk_2_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00"); //��� � ���� ����?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01"); //� ������ ��������. ���� ��������� ������, ��� � ������������, ��� �������� ����.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_2(var c_NPC slf)
{
	Info_Mine_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc					= Hlp_GetInstanceID(slf);
};
