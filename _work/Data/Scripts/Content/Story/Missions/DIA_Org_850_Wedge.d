// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Wedge_Exit (C_INFO)
{
	npc			= ORG_850_Wedge;
	nr			= 999;
	condition	= DIA_Wedge_Exit_Condition;
	information	= DIA_Wedge_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 1;
	condition		= DIA_Wedge_Psst_Condition;
	information		= DIA_Wedge_Psst_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Wedge_Psst_Condition()
{	
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Wld_IsTime(08,00,23,30)) )
	{
		return TRUE;
	};
};
func void  DIA_Wedge_Psst_Info()
{
	AI_Output (self, other,"DIA_Wedge_Psst_05_00"); //��, ��!
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //���?.. �?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //��, ��, ��... �������-�� ����!
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance  DIA_Wedge_Hello (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_Hello_Condition;
	information		= DIA_Wedge_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ���� �� ���� �����?"; 
};

FUNC int  DIA_Wedge_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_Hello_Info()
{
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //��� ���� �� ���� �����?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //�� ���� �� ��� ����� �����, ��? � ����� ��� �������.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //���� ����� ������ ����� � �����, ����� ������ �����. � ���� ������� ����, ���� ������.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //������ ����� ����� �� ���, � ��� �� ��������������. ��������, ���� - ��� ��� ��� � ������, ����� ������� ���. ������� �� ���� ��������!
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance  DIA_Wedge_WarnsOfButch (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_WarnsOfButch_Condition;
	information		= DIA_Wedge_WarnsOfButch_Info;
	important		= 0;
	permanent		= 0;
	description		= "������?"; 
};

FUNC int  DIA_Wedge_WarnsOfButch_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output (other, self,"DIA_Wedge_WarnsOfButch_15_00"); //������?
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //���� � ���� ���� ��������� �������� - ���� ���� ��������. ��� ��� ���������� �� ���������� ��� �� �����.
	//AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

INSTANCE DIA_Wedge_Lehrer (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 700;
	condition		= DIA_Wedge_Lehrer_Condition;
	information		= DIA_Wedge_Lehrer_Info;
	permanent		= 1;
	description		= "�� ������ ������� ���� ����-������?"; 
};

FUNC INT DIA_Wedge_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{	
		return TRUE;	
	};
};

FUNC VOID DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC, "��� ���� ����� ������� ���� ��������������, �������� � ��������� �����.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //�� ������ ������� ���� ����-������?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //������� �� ����, ��� �� ������ ������!
	

	Info_ClearChoices	(DIA_Wedge_Lehrer );
	Info_AddChoice		(DIA_Wedge_Lehrer,DIALOG_BACK																,DIA_Wedge_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0)		,DIA_Wedge_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0)		,DIA_Wedge_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,0)		,DIA_Wedge_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,0)		,DIA_Wedge_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)			,DIA_Wedge_Lehrer_Schleichen);
	};
};


func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //� ���� ��������� ��������������.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //��� ������ ���� ������ ��������� ����������. ��� �� ����������� �������������� ���� �������.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //���������� ������ ������ ��������, ��� ������� ����� �� ������ �������� ����� �����.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //� ���� ��������� ��������� ��������� �����.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //�� ���� ����� �� ��� ������, ��? ��������� ����� �� ����� ������.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //����� ����� ������� �� ���, ����� � ���� �� ��������� �������.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //���� �� ������ ����������� ����� ���������, �� ��������, ��� �� ������ ������� ���� �� ����������� ������ ����� �������.
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //� ���� ����� �������� ������ ������.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //����� ������� ���������������, � �� ��� � ��������� ������ ������������ ������, ����� ������� ������ ���-��� ���������. ��� ���� �� �������� ������ ����.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //� ������ � ���� ������ ������ ��������� ������ � ����� ��� �������� �������. ��� ���� �� ������ ������ �� ������� ����.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //���������� ������������� ����� ������� ������� �����, �� ������ �� ����� �������.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //� ���� ����� ������� �����������.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //��� �� ������ ��������� �������� ������� �������, ��? ��� �.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //� ����� ���� �����, �� � ���� ������ ���� ��������� ���� ���� ����������� �� ����� ������������.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //���� ����� �������� ������ � ��� ������, ���� �� ��������� ���� �� ���� �� ����� �������.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //�� ������ ���������������� ��� ����� ���������� ��������� �������� ���-������ ������ �� ������� ������������� ���������!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //���� �� ����� �� ����! ���, ��� �� ����� ��������������, ������� �� ������ �����.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //� ���� ����� ��������-�����������.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //�����, �� ��� ����� � ����, ����� � �������� ���� � ������� ���������� ����������.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //�� ����, ��� ���� ������ ����� ���� ����� ������� �� ����� ������������.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //���� ���������.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

