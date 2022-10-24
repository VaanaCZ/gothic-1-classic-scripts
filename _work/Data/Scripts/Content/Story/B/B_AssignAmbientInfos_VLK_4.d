// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_4_EXIT_Condition;
	information	= Info_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "��������� ��������";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //�������. �����!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //���� ���, ������.
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_4_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_4_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "��� ����� �������, ����� �������������� � ����� ������?";
};                       

FUNC INT Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_4_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //��� ����� �������, ����� �������������� � ����� ������?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //����� ���� ����� � ���������� ��� ���������, �� ������ �������? ��� �� ��� �� ������. ������ ����� ������ ���� � ������ ������ �����, ����� �� �������� ���������.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //� ��� ���� �������� ������������� � ������� ������. �� ���� �� �� ��������� � ������ �� �������, ����� �� ����� ������������ ���� �������.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //�� ����� ����� � �� ������� ����� � ���������. �� ��������� ������� ����� ����� ��� ����, ��� ������� ����. �� �����, ������� ��.
	
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "��� ��� ����� ���� ��� �������?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //��� ��� ����� ���� ��� �������?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //���� ����� ���������� � �����. ���������� �� ��������� � ���. ����� �� � �������, �� ������ � ���������� ������. �� ���� ����� ���� � ��������.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //�� ����� ������ ����, ���� � ���� ����� �������� ������� ����� ����� ������.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_4_DasLager_Condition;
	information	= Info_Vlk_4_DasLager_Info;
	permanent	= 1;
	description = "� ��� ��� ��� ����� �����?";
};                       

FUNC INT Info_Vlk_4_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //� ��� ��� ��� ����� �����?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //���� ������ � ����� ���� �� ����������, �� ����� ����� ���� ����� ����� � �������� ����� ��������� �������� � �������� �����.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //���� �������, ���� ������� ����� ��� �����. �� ����������� �� �� ���������, ���� ������ �������� ���� �����. ����� ����� �� ����� ������ - ����� ������.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //� ����� ����, �� ���� ��������� ����. ������ ��� �������, ����� ���� ���������. ��� ������ ������ ������ �� ����� ������.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //���� ������� �� �����? �����?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //����� � �� ����. ������ ����� ���, ��� ����� ����������.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_4_DieLage_Condition;
	information	= Info_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "��� � ���� ����?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //��� � ���� ����?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //��� ��, ��� � �������� ��� �����. �� ��� ����� ����� ����� ������ �� ����������.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc				= Hlp_GetInstanceID(slf);
};
