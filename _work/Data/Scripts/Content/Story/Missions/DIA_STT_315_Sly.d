// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr 			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begr�ssung 
// **************************************************

instance DIA_STT_315_Sly (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Condition;
	information		= DIA_STT_315_Sly_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode	(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //�� ���������, ��? � ���� ����� ��� �� �����.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //���� ����� ����. � ��������� �������� ������.
};

// **************************************************
// 					Erste Begr�ssung 
// **************************************************
	var int Sly_LostNek;
// **************************************************

INSTANCE DIA_STT_315_LostNek (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNek_Condition;
	information		= DIA_STT_315_LostNek_Info;
	permanent		= 0;
	description		= "� ���� ���� ��� ���� ������? �����?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //� ���� ���� ��� ���� ������? �����?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //������ ���� �� ����� ����������. ��� ����� ���. �� ��� ������������� � ������ ������!
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //�� ���������, ������ ������� � �� ��������� ����������. ��� ��� ������ � ���.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //������� ���, � � �������� �� ���� �������� � ������.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"� ���������� ����� ���.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"��� ��� � ����, ��� �� ��������� �� ���� ��������?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //��� ��� � ����, ��� �� ��������� �� ���� ��������?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //��� ���� ����� �������������� � ������ ������, ����� ���������� ���������� ������.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //���� � �������� � �����, ���� ��� ����� �������.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //� ���������� ����� ���.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //���� ��������� ��������, ��������� ��� ��� ����. ������� ������ ��� �����, � ��� ��� ��� ��� �����.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //��� ��� ��� ������?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //��� ����� ��������� ����� �����.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"������� �� ����� ���� ������ ���������� � �����, ���� � ����� �������� ����. ���� ��������, ������ ����, ������������� � ������ ������. ���� ������� � ����� � �������� � ��� ��������.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"������� �� ����� ���� �������� ���� ����� ���������� ��������� ����. ��������, ��� �� ������������� � ������ ������. ���� ������� � ����� � ���������� �� ���� � ���������.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNek );
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

INSTANCE DIA_STT_315_LostNekSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNekSuccess_Condition;
	information		= DIA_STT_315_LostNekSuccess_Info;
	permanent		= 1;
	description		= "� ����� ����.";
};

FUNC INT DIA_STT_315_LostNekSuccess_Condition()
{	
	if ( (Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0) )
	{
		return 1;
	};
};

func VOID DIA_STT_315_LostNekSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //� ����� ����.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //������! � �� ������ ��� ��������?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"���, �����, ��� ���.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"�� ��� ��� ���� ������ - ������.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //�� ��� ��� ���� ������ - ������.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //����������, ��-�� ����� ������� ��� � ����������. �� ����� ������.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //�����, �� ����� �������� ������ ����, �� � ����� �� �������� �����.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //���� ����� ������� ����, � ��������� � ���� ���������.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"� ����� ������ ���� ����. �� ��� ����� ������� ���� ����������.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"� ����� ���� ������ ����. ������ �� ��������� ��� ��� � �����.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"� ����� ���� ������ ����. ������ � ��� ������ ���, �� �� ������� - ���� ������ ������ ��� ����� �� �������� ��� � ��� ��������������.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //���, �����, ��� ���.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //��? �� ���� ������ �� ���� �� ���������, ������? � ���� ��� ���� ������...
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //�� �����, ����� � ����-�� ����������� ��� ����. ���� ������� ���� ������, ������� ��� ���!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //���� � ����� ������, �� ������ ������, ���� � ����� �� ����.
	
	B_LogEntry( CH1_LostNek,"���� ����� ������ ����.");
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_AfterSuccess_Condition;
	information		= DIA_STT_315_Sly_AfterSuccess_Info;
	permanent		= 1;
	description		= "��� ����?";
	
};

FUNC int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ( (Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //��� ����?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //������! �� ���� �� ������ ������ �� ����������� �� ������ �����!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //������ �� ������, �?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //�� ��� ����� � �����.
};


	
	
	




		
		
