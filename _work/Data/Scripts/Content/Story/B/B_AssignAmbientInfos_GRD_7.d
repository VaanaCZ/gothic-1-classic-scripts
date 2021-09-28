// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "��� ����� �������, ����� ����� ����� �� ���������� ������?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //��� ����� �������, ����� ����� ����� �� ���������� ������?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //����?! �� ������. �� ���, �������, ����� ������ ������ ���� � ������ ����� � ����� ��������� �������, ���?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //����������� ���������� ������ �� ������.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //�� ������ ����������� ������ ��� ��, ��� � ��� ���������, � ��� ������ �������� ���� �������� ������, ���� ����� �� ���������.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "��� ����� ���������?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //��� ����� ���������?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //����� ������ �� ���, ��� ���������� � ������. ����� - ��� ��������.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //���� �� ������ ����-�� �������� �����, �������� ����� � ����.
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "� ��� ���� ����� �������� �� ������?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //��� ���� ����� �������� �� ������?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //��-�. ����������� �� ��� - ������� ��������.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //� ������� ������ ������ � ��������.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"�����", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"��� ������ ���������?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"��� ���������� ��������?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"��� ������ ��������?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //��� ������ ���������?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //�� �������� ������ � �������� ���������.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //������ ��� ������ �����, �� � �������� ����������� �� ���� ������. ���� �������� ����������.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //��� ���������� ��������?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //�������� ������ �� ���, ����� ����������� ������� ������.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //����������� �� ��� - ������� ���������, ��������� ������������ �� ������. ���� �� ������ ����-������ �������� �����, ��� ���������� ����.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //��������� ���������� �����, �� ������ ����� ����� �� ���.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //�� � ���� �� � �������, �� ���� ������� � ���� ������� �� ������� ���� �������, �����.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //��� ������ ��������?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //������� ������. ��� ���� �� �����-��, ����� �������, �� �������.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //�� ����, ��� ������� ���� ��������� ����, ����� �������� ��� ���������� �����.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //��, �������� ���, ������������ �������. ���� ���������� ����������� ����� � ������.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //��� �������, �� �������� �� �������, ��� ������ ������ ������. �������� � �������, ���� �� ��� �� ������ �����.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "��� ����?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //��� ����?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //��� ����, �� ������ � ����? ���� �� �� ������, � ����� �� ������, ����� �� ����� ������������ ���� �������, �����!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
