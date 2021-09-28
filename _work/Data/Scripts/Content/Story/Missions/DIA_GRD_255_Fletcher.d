// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //��, ��!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //���? �?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //�� ��� ������, � ���� � ���������!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //��� ��� � ���� �����, ����� - ��� ��� �����. � ��� �� ����� ������������!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //�� �������, ����� ����, ������ ���������� �� �������� - �������� ����� ������� ��� ���� �� �����.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //��� ������ �� ���� �� ����������� ����� � �� ������������ � ��� ����� � ������ ���� ����� �� �����? ��� ��� �������� ����� ���� ������ ��� - �� ������� ��� �� ������. ����������� �����.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //� ���� � ������ ���� � �����-������ ������ ������, � ����� �������� �� ���, ����� �� ����� ������� �� ����.
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //��, ��!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //���� ����������� ��������� �� ������, �� ������ ��� ����� ������������ ����. 
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //��? � ������?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //������ ��� ���� ����� ���.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"�������.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"����� ������ �� � � ����� ������������?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"�-�. � ��� �� �� � ����� ������?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //�-�. � ��� �� �� � ����� ������?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //� � �����, ���� ����� �������� ������, � ����� ����� � �����.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //����� ������ �� � � ����� ������������?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //�� ������ ��� ��� ������, � ��� ��� �����.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //� �� ��� ���, ���� �� �� ��������, ����� �������� ��� ������ �� ������.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //�������.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "�� ������, ��� ������ ����� ���� ���?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //�� ������, ��� ������ ����� ���� ���?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //�� ����, �� � ������ ��������.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //��-������, ������� �������� ������ ���-�� �����, ��� ������ �� ����� ��� �������� �� ����������.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //�������� ������ - ���� ��� �����, ��� � �������� ��� ������� ������. ������, ��� ������� � ���� �� ������! 
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"�����, �������� � ������ ����� �����, ���� ������ ���.");
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "������ �� ���� � �������� �� ������� � ��� ��� ����� �� ������?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //������ �� ���� � �������� �� ������� � ��� ��� ����� �� ������?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //��� ��� ������ �����, ������ ��� ���������. ������ � ��� � �������� �����.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "� �� ������ ����...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //� �� ������ ����...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //��?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //�����, � ����� ���.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //���? ��� ��?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //������ ����...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //�, ���! ���������! ������, ������ � �������� ����� ��������. � ��� ��������, ��� �� ��������!
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //������ � ���� ��������� ��������.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //������� ��������.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //����� ���� � �����.
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "��, � ��� ��������?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //����� ��������?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //� �� ��� � ������ ����� ������. ������ �� ������, ��� � ����� ����� ����, � ����� ��������� ���� ������ ����...
};	












//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //�� ������ ����� ����� ���� �����. ����� ���������� � ������!
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //���������! �������� ������ - �� ��������� ���� ����� ����� �� ����������!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //��� ���� �� ����������-�����!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //������, ���������! ����� �� � ���� �� ��������� ������ - ���� ��� �� �������!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //��, �������, � ��� �� ��������?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //�� � ������� � ���� �������� �� ������ ������, ���� ���?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //������...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //�������, �� �����, ��� ����� � �� ����������, �?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //�� ��... ����������-�� �����!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //���, ����� �� �� ���������� ���� ������ - ������ ��� ����� �� �� ��������!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //����, ���������!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"������� �������� � ������ �����. �� ������������ ����� ��� ��, ��� � �������. � �� ���� �����, ������, ������ ����, ��� ���-�� ������� � ����� �������� ������� ��� ������ ������.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"�������, ���������� �������� ������, ������ ���� ���������� � ������������. �� �� ���� ������� ���� � ��� �� �����!");
			B_LogEntry			(CH4_BannedFromOC,"������, ���� ������� �� ������� ������!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //�� ������ �������� - ������ �� ������ ������!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //�� ������ �������� - ������ �� ��������� ������!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //� ���? ����� ���� �� ����� ����?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //����� ��� ����� ������������ ���� �����.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //��? ������ ������!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //�� ��� ��������� - ������ � �� ���� ��������� ���� ������� �� ���� �� ������ ����!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //������, ��� �� ����� ������������.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //���� ������ �������� �� ����, ������ ��� ��������� ����!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //��, ������...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //������, �����, ����� ���!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verst�rkung vor das Haupttor (Anf�hrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"������ ������� ������ ������ ������� � ���������� �����������. ��� ������� ������, ��� �������� ������.");
	};
	
	AI_StopProcessInfos	(self);
};

