// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "��������� ��������";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "� ���� ���� ���������. ��� ��� �������������� � ���?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //� ���� ���� ���������. ��� ��� �������������� � ���?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //����� �� ���? ������ �� �����, ��� ���� ��� �� ����������, �� ����� �� ��������.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //���� �� ��������� ������������� �����, �� �� ������ ����������. ��� � ������� ���-������ ���.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //���� �� ��� ��� �������, ��� ������� ���������� � ���� �����, �������� � �����. ��� ��� �������, ��� ���� ���� ����� � �������� � �����.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "��� ����� ���������?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //��� ����� ���������?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //���������? � �� �������� ������. �� ������� �� ��, ��� ������ ����� ����� ������, ����� ������ ������� ����.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "��� ��� �� �����?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //��� ��� �� �����?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //� �� ��� ���, ��-������, ������? �� ����������� ������?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //���� �� �� � ����� ���� ������� ���������� � ��������� �����, �� ������� �� ������ ��������, ��� ������� �������� ��� ���� �����-�� ������.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "��� �����?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //��� �����?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //� �� ��� �������? ���� �� ������. ������� ��� ���, � ���� � �� ������ ���� �� ������ �������.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //�� ����� ������ ����� ������ ������ ���������� �������� - �����. ���� �������� ��� ������� ����� ���. � ������ �� ��������� �� ����� � ��������� �� ������ ���� ������ �������.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
