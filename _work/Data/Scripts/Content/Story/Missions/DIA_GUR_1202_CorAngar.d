//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Sp�ter Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "�� ������ ����-������ ������� ����?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //�� ������ ����� ����?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //�� ������ ����� ������� ������ � ������ ����� ���� ����������.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //���������. �� � �� ���, ��� ���� �����.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //� ��������� ���� � ����, ��� ����������� � ���������� ����� �������.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "��� ����� �������?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //��� ����� �������?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //������ �����, �� ������ ����� ����������� � ��������, ��� �� ������������� ������ � �������.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //����� ����������� �� ���, � � ���� ����� ����.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							ST�RKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "�� ������ ������� ��� ���� � ��������?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //�� ������ ������� ��� ���� � ��������?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //������ ���� ��������� � ���� � ��������.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "� ���� ����� �������!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //� ���� ����� �������!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //�� ��� �� �����. �� ������� �������������� � ���, ����� � ���� ����� ������ �����.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //������ ����� ���� �������������� � ���.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //�����, ��� ������ - ��� �� ������ ������� ����� � ��������� ������. �� - ��������� ������ �������, ������ ����.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //�� ������� ���������� � ����������, � �������� ����. ���� ��, ��� ���� � ��� ������������ ������ �����, ����� ����� ��������� ��������.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //� �������� ��� ����, ��� �� ������� ����� ������������ ����������� �� ����� �������� �����. ������ �� ����� ����� ����� �� ���.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //�������: ������������ ��� � ������������� ���� ������� ���� �������� ������ ������ �����.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //����������� � ��� �� ���� �� ������������� ��������. �� ���� ���� ����� �������.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"������� ��� ����� �������� ���� �������. ��� �� ��� ���� ��� ����� �������. ������ ��� ����� ����� �� ������������� ��������.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"��� ����� ��������� ����, �������� � ����� ������� ��������� ��������� �������. �� ������� �� ���� ������ ������ �����, ����� � ���� ����� � ����� � ���������� �������. ������ ��� ������ ����� ����� �� ������������� ��������, �� ������ ������ ��������.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //� ���� ��������� ������� ��������� �����.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //��� � ��������� ������� ������� ������������ ���� � ��������.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //��� ���� ����� �������� ��, �� ������ ����������� �� ������ ���� ����, �� � ���� �����.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //���� ��������� �������� ��� ����� ���������� � �������� �����, �� ������� �������� ���� �����.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //���� ������� � ������������. � ������������ ������������ ���� � �����.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//� ���� ������ ���-������ ��� ��� ��������� ������.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //�� ��� ������ ������ ����� � �������. ������ � �������� ���� ��� ��������� ���.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //��������� ���� �������� ����, ��� ���� ����� ����������� �������� ����������, ������ ��� �� ������� ����.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //���� �� ������, ��� ������� ���� ����, �� �� ��� ���������� �������.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //���� �����, ���� �������� ������ ���� �������� � ������������, � ����� - �������� � �������.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //����� ������� ����. ���� ���� ���� � �������� ����� ������ ����� ���.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //��������� �������. �� ������� �������, ������ ���� ������ �������� � ��� ��������� � ���������������.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //��������� ���� ������ � ����. � �����: �������������� ��� - ������, ��������� ���.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der gro�en Beschw�rung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ������?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //��� ��� ���������?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //������� ���� ����� �������, ��� �������� ������ ��������, ������ ������� �� ���.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //���� � ���� �����: � ����� ���� � ������. ��� ���� ����������� ������� ������, �����, ����������.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //�����-�� ���� �������� ��� ����� �������, ��� ������ �� �������� ��� ������ ������� ���������.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //���� ���� ����� ���������� ���� � ����������� ��������. �������� ��� ������� �������� ���-��, ��� ������� ��� ������ ��� �������.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //��� �����, ����� ���-������ ���������� ���� � ����� ������� ��� � ��������.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //������ �� �� ������� ���? ���� �� �� ���������� ����� ��������!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //��� ������ - �������� �������������. � ������� ���������� �����, � �`��������, � �������� ���.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //�� ������ �������� ������ ������. � ������� ���� ������, ��� ����-���� ���.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //� ����� ���� ����������� �� ������� �������� � ��������, ��� ������� ����� �������.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"��� � ������ ������?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"� ����������� � ���� ����� ������!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //��� � ������ ������?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //���� ����� ����? ������, � ���������� ����. �� ��� �����, �� ��� �����. ���, ������ ����� ������ ����. ������ �� �� ��������!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //� ����������� � ���� ����� ������!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //������ ������ ��� ������. ��� ������� ���� � ���.
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ��������� �������� �����?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //��� ��������� �������� �����?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //�������� ������. ������ ���� ������� ��������� �����. �� ������� ��� �� ����� �����.

	B_LogEntry		(CH3_OrcGraveyard,"��������� ����� ������� ��� ���� �� ������ ��������. �� ���� ���� �� �������� �������.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ��� �� �������� �����. "; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //� ��� �� �������� �����. ��� ��� ������. �� �������, �� �������, ������ ������.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //� ���� ����� � ��� ������?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //��� ��� ������.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //������? �� ������, ��� ���������?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //������ ����� ����� ������. ��� �������� ���� �������.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //��� � ������ ������� ������, �� �� ��� ���� ����� � ���.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //�� ������, ��� ������ �������� ��� ����� ����, � �������� ������� ��������� ���� ������.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //������, �� ������ �� ��� ��������� � ������ � ���, ��� ��� ��� � �� ������� ������ �����.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //� �� ����, ��� ���� ������� �������� ��� �� ����� ������� ��������.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //����� �� �����... �� �����... ��� �� ��������� � ����!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //������ ����� ��, ��� ���� ����� ��� �� ����� ������� ������ � ����� �������.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //������ ��� ���� ������� �� �`�������.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "��� �������� �`������?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //��� �������� �`������?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //�� �� �������, ���� �� �� ������� ���. ������ - �� ������� � ������ �������. � ����, ��� ��������� ���, �� ��� ����� ��� ����������� ���� ������.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //��� � ������ �������?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //������� ��� �������� ����� � ������. ���� ������ ������ �������� ����� ������ ���� ����������.
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //����� ����, ����������!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"�'������ ��-�������� ��� ��������. ��� ����� �������� ���� ������� ���� �������� ����.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "��� � ����� ����� ��� �����?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //��� � ����� ����� ��� �����?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //��� �� �� ������ ������ ������. ���� �������� ����� ������ ������ ������ - ���������� �� ��������� �����������!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //� ������ ������� ����� �������. ���!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"������ ����� ������ � ������� �� �������. �� ��� �� ������� ���������� ����� - ����������.  ���� ������� ����� ���������.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "��� � �����, ��� ��� ������ �� �����, ������� ��� �����?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //��� � �����, ��� ��� ������ �� �����, ������� ��� �����?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //��� ������ �� ������ � ������� �������� � ���������� ��������.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //� ����!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"�������� ����� ������ �� ������ � �������� �������� � � �������� ���������� ��������.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "� ��� �� ������ ���������� ����.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//� ��� �� ������ ���������� ����.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//��������, � �������, ��������, ���� ���-������ � ������.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//��������. ��� ����� ���� ������. � �`������� �������� �� ��� �� ����� �������.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kr�uter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"��������, ��� ���� � �������, �������� ������� �� ��������.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "��� �������� ����� ��� �`�������.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //��� �������� ����� ��� �`�������.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //�������� ������. ���� �� ������, �`������ ��������� ������ � ����.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //�� ���-������ �������?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //��, �� ������, ��� ������ - �� ��, ��� �� ������. �� ������ �� ������ �������� ��������� ���.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //��� �������� ������ ���������, ��� ��� �`������� ��� �� ��� ��������.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"� �������� ��� ������ ���������� �������� ����. �������� ���������, ��� ��� �� ������� ������.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //�`������ �����. ��� �������� ��������� ������� ���!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //���� � ����� ������� ��� �� ������� ������ ���!
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //��� �� ������, ��� �����?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //� ������ ������� �`�������. ��������� �� �����, �� �������� ��� ���� ������� �� ���� ��������, ������������� ������ ����.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //��� ��� ������ �� ������ ������������ ����� ���� � �� ����.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //�� ����������� ���������� ������ � ��������. � ���, � ������ ������� ��� �����.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //��� ������ ��� �����?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //�� ��� � ������ - ������ ���������� ������� � ���������� ������ ���� ����������� ���� � �������.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //���������, ��� �� ��� ������ ������ ������?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //� �����, ��� �� ������� ����� � ������ � ����� �����������. ��� ���� �� �������.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //������!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //��?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //����� ��� ���������� ���� � ���� ������������� �� ���� ������ ����.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //��� �������� ���� ����� � ������ ������������ �� ���� ������ �����, ����� � ���� ��������� �������������.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //��������� ����!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
