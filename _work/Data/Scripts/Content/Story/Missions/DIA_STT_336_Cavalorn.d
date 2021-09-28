// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich J�ger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "��� �� �����������?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //��� �� �����������?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //� �������, ������� � �������� �� �����������.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "�� ������ ������� ���� ����-������?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"�������� - �������. �� ����� ������� ���� �������������� � �������� �� ����. ����� �������� � ������ ����� ��������.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //�� ������ ������� ���� ����-������?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //��� ������� �� ����, ��� �� ������ ������.
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK															,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //� ���� ��������� �������� �� ����.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //������� �� ��� �� ������ ����� ��������. ��� ������� �� ���������� �������.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //�������� ���� ������, ���� ����� �� ����� ������, ������� ������� - � �������!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //���� �����, ���� ��������, ����� ������� ����� � ������ ��������. ������, � ������� �� ��� �� ��� �� ����� ������.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //�� ���� �� ��������� ���, � ��� � ���� �������, � ������ ����� �� ������ �������� ��� ����� � �����.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //� ���� ��������� ������������� ��� ����. 
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //������� ����. ���������� �� ��� ������, ���� ����� ��������� � ��� ���, ����� ������ ������ �� �������.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //��� ������ ������� �������, � �� ������ ����� ������ ��� � ������� ������ �������������� ���� ��������.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //�������� ����� ����������� � ���, ��� � ���� ���� �� ������ ���������� � ���� ������� ����� ��������. ����� �� ���, ����� ����� �� �����, ��� �� ���������.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //������� ���. � �������: ������� �� ���������!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //���� ��� ����� ������� ������� ���������. ������ ����� ��������� ����, ���� �� ��� �� ������.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //��� ���� ����� ����� ������� ��������, ����� �������� ����. ����� ������, �� ���� ������������ ������� �������.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //��� ������ ���������� ���������: ������ ������ � ��������� ������, ����� ������ � ���������� �� ������. � �������, ������ ���� ������!
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //�� ��� ����� ������ ������ �������. �������� ����� ���������� ����� ������� � �������.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ��� ������� ������� ���?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //��� ��� ������� ������� ���?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //� ����. � ������ ������ ���� �� ���� ������ ������.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"�������� ������� ������ � ��������. ��� ����� ����� �� ������ � ������ ������, � ������� � ������ �� ������� ������.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "������ ���, ��� � ���� ����."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //������ ���, ��� � ���� ����.
	
};  








