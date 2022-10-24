// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "� ���������. ��� ��?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //� ���������. � �� ���?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //� ���� �����, ���� �� ������ �������. � ������ �� ������ ��������.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "��� ����� �������� �������?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //��� ����� �������� �������?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //�� ��� �������� �������� �������������� ����� ����.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //��� ������ ��������� � ������� ������, ����� �����. � ������ ������ � ���� ����� ����� �������.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "��� ����� ������?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //��� ����� ������?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //������ - ��� ���������. �� ������� ���� � �������� ������ ������� �������� ���� ��� �����.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //� ��� ��� �� ����������� �� ���� �����. ���� ���� ��������� ��� �������.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //��� ���� �� ������ ��� ������, ��� �������� ���, ��������� ���������� ����� �������� ������������ � ��������. �� ������ ��������� ��� ������!
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "��� �� ������ ���������� ��� � ������?";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //��� �� ������ ���������� ��� � ������?
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //������ �������� �������� �����. � �����, ��� ���� �����, ��� �����, �� ��������� � ���.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //��� ��� ��������� � ����. �� ��� �� �� ����� ����� ��� ��� ���� ����. ��� ��� ������������ ������ ���, �� �����, ����� �������� ��� �����������.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //�� ������ ���, ����� ����� �������� ��� ������, ����� ������������������� ��� ����������� � ���������� �� ���� ����.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //���� ��, ��� ���, ��� ������� � �������, �������� ���� ���� ��������������, � �������� ����� ������ � ���� �����.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //�� ������ ��������, � ������ �������� �������������� ����� ���� ����, ��� ����������� � ���.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "� ��� ����� ��������� ���� � �������?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //� ��� ����� ��������� ���� � �������?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //�� ������� ������� ���������, � ������� ��������� ��� �������� ���� � �������� �������.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //�� ����� ��������� ��� �������� ������ ��� ���� � �������.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "���� �� � ���� �������������� ��� ����?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //���� �� � ���� �������������� ��� ����?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //���� ���� �� ���������� ��� � ��������. ��, ��� ���� ��� ������ ��� �����, ������ ������� �� ����������� � ��� ����.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //�� ������� �� �������� �����, ������� �������� �������������� ������������ � ����� ������� � �������� ���. ��������� �� ��� �������� ����� ��������� �������, ������� �� ��������.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //�������.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "��� � ���� ����� ������ ��������?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //��� � ���� ����� ������ ��������?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //������ � ���� ����� ���. �� ������ ���������� � ����� �������, ������� ���� ������ � ���� ������.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //��� ����� ����� �������� �� �����, �� ������ ������� �����. ��-�����, � ���� ��� ���� ���� ������.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi, "��������� �� ����� ���� ������ ����� ������� ���� � �������� ������. � ����� ����� ��� �� �������� ������� �� ������ � ������ ������.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "��� ����� ������� � �����. �� ������ ��� ������?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //��� ����� ������� � �����. �� ������ ��� ������?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //�����, ��� ����������. � ����� ����� ������� ������ �� �� ���, ��� ���������� ������ �������� �� ������ ������.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //�� �������� ��� � ����� ������� � ������ �������, � ����� ������ �� ������ �� �������� ����.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //���� �� �� ��� ����� �� ��������, ���������� �� ��� ������, ���� �� ���������� � �����. �� ��� ����� �� ������ �������� � ���� ��������.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //� ��� ���� ����� � �����?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"��� ����� ���������� ��� � ����� ���������."						,DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"� ���� ���� �������� � ���������� ���� ����� ����."	,DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //��� ����� ���������� ��� � ����� ���������.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //��? � ������ �� ���� �� ���������, ���� �� ��� ������ �� �����?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"���� ��� ����� �� �����������."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"��� ���� �� �����."	,DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //� ���� ���� �������� � ���������� ���� ����� ����.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //������? � ������ ��� � ����? ��� ���� ���� ����, �� ���� ��� �� ����� � ��� ������, ��?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //���� �� ������� ������������ �� ����. �� �� �������� - ��� � ������ ������ �� �����.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //�� ���� ����������� ������������ �� ������ � ��� ������, ������? ��-�� ���� ���� ����� ����� �� �����.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //������� ��������� �������� �������, ���������� �����, ������������ ������ �� �������� ����.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //��� ���� �� �����.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //�! ���� ������� �� ������� �� �����. ���� ������ �������� ����� ������ ������� � ���.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //����� �� �� ���� �����? �������, ����� ������ ���������� ���� ��� �����?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"���� ��� ����� �� �����������."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"�����, �� ������."				,DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //���� ��� ����� �� �����������.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //��� ������, ����. � �� ������ ����� ������...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //�����, �� ������.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //� ��� � �������! ��� �� ��� ����� �� ����� ������ �������� ��� ��.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //��� ���� �����: ������ �� ���� �����. �� ������ ���� �� �� �������.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //� ����� ������ ��� ��� ���� � ����� ����� ������� �������.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
