// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespr�ch
// *************************************************************************

INSTANCE Info_SFB_5_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_5_Pre_Condition;
	information	= Info_SFB_5_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_5_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //������!
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_5_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_5_EXIT_Condition;
	information	= Info_SFB_5_EXIT_Info;
	permanent	= 1;
	description = "���������";
};                       

FUNC INT Info_SFB_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_5_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_5_EinerVonEuchWerden_Condition;
	information	= Info_SFB_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "��� ���� � ���� �������������� � ���?";
};                       

FUNC INT Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //��� ���� � ���� �������������� � ���?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //�������������� � ���? � ��� �� ������ ���� - ���������?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //���, ���������.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //��������, ��� � ����� ����: ����� ����������� �� ���������� ���������.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //�������, ���� �� �����������... ��� � �������� �� ����� - ������, � ���� �������� ��� ���� ������ �����. 
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_5_WichtigePersonen_Condition;
	information	= Info_SFB_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "���� ����� ����� ������� ������ ���������?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //���� ����� ����� ������� ������ ���������?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //������? ����, �������.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //� �����, �� ����� ��������, ��� ����� �������.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //� �����, ���� ����� ���������� � ���������� ��� � ������. ����� ���� �� ���� �� �������. 
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //����� - ������� �������, �� ������� ���� ������� ������. �� ����� ���� �� ������ ������������ ����� � ������ ��, ��� ��� �������� ����.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_5_DasLager_Condition;
	information	= Info_SFB_5_DasLager_Info;
	permanent	= 1;
	description = "��� �������� � ���� ������?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //��� �������� � ���� ������?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //��� ������� �� ��������. ����� �� ���������� ������, ����� ������, ������ ������� ������� ���� ������������.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_5_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_5_DieLage_Condition;
	information	= Info_SFB_5_DieLage_Info;
	permanent	= 1;
	description = "� ��� ����� �������?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //��� ����� �������?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //�������!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //������ ������, ��� ��� ��� �������� �����, �� ��� ���� ��� �������� ������ ���������.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //���, �� �������, ���������� ��� �����? ��� ������, � � ������ ���� ������ �� ��������.
	
};	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_5(var c_NPC slf)
{

	Info_SFB_5_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
