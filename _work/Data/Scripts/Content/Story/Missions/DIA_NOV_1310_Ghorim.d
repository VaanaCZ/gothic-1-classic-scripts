// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Ghorim_Exit (C_INFO)
{
	npc			=  Nov_1310_Ghorim;
	nr			=  999;
	condition	=  DIA_Ghorim_Exit_Condition;
	information	=  DIA_Ghorim_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Ghorim_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

instance  DIA_Ghorim_MissingHarlok (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_MissingHarlok_Condition;
	information	= DIA_Ghorim_MissingHarlok_Info;
	permanent	= 0;
	description	= "������! ��� ����?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //������! ��� ����?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //� ������ � ���, ������. ������� ��� ��� ��� - � �� ������ ������.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //������ ������ ����� ������ ��� ��������� �� �����. � ���� ������ ������ ���.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //������ ������� ������ � ���� ����!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //��� ������ �� ���� �� ���������� � ���� � ����� � �� ����� ��� ��� ���?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //� �� ���� ����, ���� ������� ���� ����, - ��� ������ ������ �����.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //�����, �� ������� ������ ����? �� ����� ��� ������������ ��� ������, � �������.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //����� ���, ����� �� ���������� ����� ���� ������� ����. 
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"��������� ����� �������� ���� ��������� ������� ������� ������� ���. ������ ������ ��������� � �������� �������.");

	Ghorim_KickHarlok = LOG_RUNNING;
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Ghorim_SUCCESS (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_SUCCESS_Condition;
	information	= DIA_Ghorim_SUCCESS_Info;
	permanent	= 1;
	description	= "��? ������ �� ��������?";
};                       

FUNC int  DIA_Ghorim_SUCCESS_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Ghorim_SUCCESS_Info()
{
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //��? ������ �� ��������?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //��, �������-�� � ���� �������. �������, �������!
};


