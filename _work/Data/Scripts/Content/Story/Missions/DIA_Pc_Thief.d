var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //���� ����� �����.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //� ����...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //� �� ���� �����, ��� �� �����. �� ������ ��� �������� �����, � � ������������ �� ���������. ��� ������ ������ � �����.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //���� �� ������ �������� � ����� � ���� ������ �����, ���� �������� ���������� �� ����. �������, ������� �� ������ � ����� �����, � ��� � �����, ����� �������� ����? ��, ��� ��� �� �������?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //������� �� ������.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //��, �� ������ ���� �����. ��� ��� �������������.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //���������� � ������ ������.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //������.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //�� �������!
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "� ���� ���� �������� ��� ���������� ���� ����� ����.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //� ���� ���� �������� ��� ���������� ���� ����� ����.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //�� ��?!
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //��� ��� ��� �����-�� ���, ����� ��� ��� ���� �������� ����.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //���� �������, ��� � ��������� ����� �� � ����� � ������. ����� ������ ����� ��������� �� ���� ������ �� ��� ������.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //���� ������ ������ ������, � ����� ����������� ����� �� ����� �� ����� � �����.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //�� ����� ����� � �� ������ ��� �� ����� �� ��� ���, ���� �� �������� ����-������ �� �����. ������ ���� �� ��� �� ����� ������������.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//������? 
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //���� ����� � ����� ������� ������, �� ������ ���� ������ ����� ������� ����.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "������ �� ��� ���������?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //������ �� ��� ���������?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //������ ��� ���� ����� ���� ������. ������ �� ���� �� ����� �������� � �����. ��� �������� ������� �����, ��� ��.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //� � �� ����� ������ ������ � ������� � ��������. � �� �� ������ ��� ������ ����. � ���� ���� ��� ���� ���� �����������.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //�����������?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //��. � �����, ����� ���������� � ������ ������� �� �����, ��� ���� ����� ������.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //������, ��� �������� ����, ������ ������� ���� �����. � ������� ���� ��� ������, � �� ������ ������ �������������� � ������ �� ���.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //� ����� ��� ����, ����� �������� ��������, ��� ������ ������ - ������ ����� ��� ���.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "� ��� ������ ������ ���� ������?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //� ��� ������ ������ ���� ������?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //�� � ���������� ��������� � ������ ������� �� �������� ����. �� ������� ��� ���.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //�� ���� �� ������ ��������� ���, ���� ���������. ������ ������� ����.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "�������� ��� �� ���� �����.";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //�������� ��� �� ���� �����.                                                                                                                                                                     
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //���, ��� ��������� ������ �������, �� �������� ��������. �� ��� ������, ��� �� ����� �������� ���� ��� ������.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //��, �� ������� ����, � ������ ������...
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //� ������� ���� ��� ������. ������ ������ ����� �������. �� ��� ������.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "�������� ��� � �������.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //�������� ��� � �������.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //� ���� ��� ���� � ��� ����������. �� ����� ������, ��� �� �����������.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //��� ��������, ���� �������� ����� �� ������?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //���������, ��� ���������� - ��� �����. ���� ������ ������ ����� �������� ���� ������, �� ��������� ���� ���.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //���� ���� ���� ���� ������ ���������, � ��� �����.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //��� ������ ��������� ������? �� �� ������ ��� ����� ����!                                                                                                                             
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "� ��� � ����� ������� ��������?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //� ��� � ����� ������� ��������?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //��� ������ ������ ���������� �� ���, ����� ����� ������ ������� �� �������.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //����� ������ ��������� �� ������. �������� ���� ������, ��� ������ ��������� ������, ��� ������ ������� ��� ����� ���������� ����.  
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //���� ��� ����� ��������� �� �������. �� ������ ����� ������� ������, � ��� ����� � ������� ������ ����� ���������� ��.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //�� ���� ���-�� �� ��������.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //�� ����� ����� � �� �� ���� ������� ����� �� ���� ���������.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "�������� ��� ���-������ � ������ ������.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //�������� ��� ���-������ � ������ ������.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //�� ����� ������� � ������ �� ���� �������. ����� � ��� ���� ������������ ������, � ������ � ��� � ����� �����.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //��� � ����� ������ ��������� ��� ���, ��� �� �������. ������ � ��� � �����, ����?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //�� ��������� ��� ����, ����, ����, ������... ���.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //�� ���� ������ ����� ���� �����. ���� �������������� � ������.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "��� ����� �����?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //��� ����� �����?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //����� ����� ����������� �� �������. �� ������ � ������ ������, ��� ���������� ������� � �������.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "� ���� � ������ ����� ����� �� ��� �����, ��� ��� ����� �������?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //� ���� � ������ ����� ����� �� ��� �����, ��� ��� ����� �������?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //� ����� ����� �� ������� �������� �� ����� �����. ����� ���, ��� ���� ������� �����.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC, "���� � ����, ����� ���� ����� � ������ ������, � ������ ���������� � �������.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "��� � ����� ����� ������ ������?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //��� � ����� ����� ������ ������?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //��� �� ���� ������. ������ ������ - ��������� ���������� ����� �� ����� ����.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //����� �������� ������� ����� ����� ������. ����������� ��� ���������� - ������������.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "��� � ���� ����� ������?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //��� � ���� ����� ������?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //����� ������� �� ������ �����, ����� ������. � ������, �� ������� ���-������ �������.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //�� ����� ����� � ���������� ������ �� ������ �� ������.
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "� ������� � �������.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //� ������� � �������.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //� ��� �� ������?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //�� ����� ������� ���� � ������, ���� �� ���� �� ��� ���� ��������.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //���� � ���� ��������� ��� ���� ������.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //�� ������ ����� ������?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //������ ����� ���� ����� ������ ��������� �����.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "��� � ������ �����, ����� ���� ������� � ������ ������?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //��� � ������ �����, ����� ���� ������� � ������ ������?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //���� ������ �������� � ������, �� ������ ���������� ���������.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //�� ������� ������ ���� ��������� ����������� ������, � �������� ��������. ���� ������� �� ���� �����, ������, ������� �������.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //����� �� ������ ������ ������ ���� �� �����������.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //����� ����, ������ ������� ������ ��������� ���������� ������������. ��� ������ �� ������, ��� ������ �� ���� ������ ��� ������.
	
	B_LogEntry( CH1_JoinOC, "����� ���� ����� � ������ ������, � ������ ���������� ����������� �� ���������� ����� �� �������� ����� � ������ ��������� �� �����������, ������� ���������� �����.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "��� ����� ���� ����������� �����?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //��� ����� ���� ����������� �����?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //���, ��, ���� �� ��� ����� �����. ����� ��� �����. � ��� �� ��� ������.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //� ���������... �� �� ������� ���. ���� �� ���� �� ��� �� ��������, �� ���� ��� ������ ������.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //������� �� �������� ������, �������� � ������, � �� �������, ��� ���� ���.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "��� ����� ����� ������� ���� ����-������?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //��� ����� ����� ������� ���� ����-������?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //����� � ��������. �� ����� ������� ����� ���. 
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //�, ���� � ���� ���� ������ �� ������, �� ����� ������� ���� ��� ��������.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //��� � ����� ��������?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //��� ������ �� ����� ��������. ��� ����� ��� ������ ����� �� ������ ������ � �����.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //� ����� ����� ������� ������ � ��������� ���� � ������� �����.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,	"������� ����� ������� ���� �������� � ��������� �����. �� ����� �������� �� �����. ��� ��� ������� � ����� �����.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "�� ������ ������� ���� ����-������?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,	"����� ����� ������ ����� ����� ������� � ������.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //�� ������ ������� ���� ����-������?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //��. � ���� ������� ���� ��� �������� ���� � ��������.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //������ �� ���� �������.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //���� ������ �������� �� ���� � �������� ����� �����.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //������ ���, ���� ������� ����� ���������!
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "����� ���� � ������ ������?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //����� ���� � ������ ������?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //�� ����������� � ������ �����. ��� ��������� ������ �����, ��� ����� ��. �� ���� ���� ������.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //��� ������ ����� ��� ���. ��� ������ ��������, ������� ����� ������� �� ����� ��� ���������� ������.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //��� ������� ��� ��� � ��������� ���������.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //��� �������!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //�� ���, �������� ��� �� ����. ����� ������ �� � ���� ������ �� ������ �������� ���� ������!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //� ��� ������, ��� ��� �����. ���� � ���� ��� ���������, �� �������� ������� ��� � ����� �������.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"����� ������ ���� � ������ �����. ��� � ������ ����� �������� �� ����� �� � ����� � ���� ������ ��������. ���� ������ �� ������ ������� � ���� ����� �� ������ ������.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "��� ����� �� �������� ��� ����� ������ ������?..";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //��� ����� �� �������� ��� ����� ������ ������? �� �� ���� �� �����.
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //�� �����, ����, ����� �� �������, ��� �� �� �����. 
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //� ��� ��� � �����.
	
	B_LogEntry    (CH1_BringList,"�� ������ ��� ������, ���� � �����, ��� ���� ������� �����.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "��� ��������� ������ �����?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //��� ��������� ������ �����?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //������� � �������. �� ���������. �����, ��� �� �� ����. �� ���� ���� �����, � �� ��� �� ������� ���� � �����.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //�� ����� ����� �� �������� �����.
	
	B_LogEntry    (CH1_BringList,"������ ���� ��� �����. � ����� ����� ��� ����� �������� �����.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "�� ������� ��� ������.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //�� ������� ��� ������.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"����� ������� ������� ���� �������. � ������� ��� ������ ���.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"����� ������� ������� ���� �������. �������, �� �� �������, ��� ���� �������� ���. ��� ��� �� �������?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //������� ���������! ��� ����� �������� � ���� ������!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "��� ������ ��� ��� � ������?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //��� ������ ��� ��� � ������?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //��, � ��� ��������� � ������...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //� ���?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //������ ������, ��� �� ������ �����. 
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //������ ������, ��� ����� ������� ����. ��� ����������, ��� �� ����� ���������.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //������ ������, ��� ����� �� ��������� �� ���� ��� � �����.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //�������, ��� �����������, ��� �� ������ �� ��� ������. ������, ��� �� ��������.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //������ ��� � ����� ���� ��������� ���� ��� � �������. �� ��� ��������� ���� ������.
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //� �� �� ���������, ��� �� �������� ������ ������.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //������� ��������� ��� � �����... �, �� ����� �����, ������ �� ���� � ��������. � ����� ������ � ��� ������ �� ��������.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //� ��������� � ���������. �� �� ������! ���� � �������� � ��� �����. ������ ��������, ��� � ��������� ���� �� ��������!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //������� ����� �������� ���� ���. ����� �����, �������� ��� ��� ���, ����� �� ��������� ��������, ��� �� ���� ��� ���� � ������!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //���� ���������, ��� �� ����� � ������� ����. ������, �� ����� �������.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //��� �������, ���� ������ ������ ����. ���� ������ ��� ��������� �������, ����� ���� ���� ����, �� ��� �� � �� �����, ��� �� ������� � ����� ������.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //������� ����� ���� ������� �������. � �� �� ����� ����� ������ � ����.
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //������� ������, ��� �� ��� ���-��� ������, �� �� �������, ��� �� �������� �� �������.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //���� �� ��� ������������ � ��������. �� ����� ������������ ���� ��� ����� �������� ���. 
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //���� ������ ��������� ��� ������� ������. ���� �� �������� ���, ���� ��������� ����������.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //�� � ������ ������ ������ ��� ���� � ��� �������! ������� �������, �� � � ����.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //������ �������� ����� ����������. �� ������� ���������. ���� � ������ ������ �������� ���, ������� ���������������.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //����� �������, ��� ��� ����� ������ ����� ���� - ��� ������� ����.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //����� ��� ����� ���������, ��������� ���� �������. ��� �� ��������� ��������� ����� ����?!
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //���� ������ ���, ��� �� ��� ������. � ����� ������ �� �� ����� �������.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //���� ������ ���� �������������, ������. �� ����� ����� � �� ���������� �������� ������ ��������.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //�� ����� ��������� ��� ������ � ���� ������.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //�� � �������� �� �������� �� ������. ��� � ������. � ��� ��������� � ����� �������. �� �������� ���� ������ � ������.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC, "����� ������, ��� � ���� ����������� � �������. ������ � ����� ����� ����� �� ����� ������ � ����� � �����. ����� ���� ���������� � �������.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //�� ���� ��� ��������� �������� �� ��������.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //� ���������� ���� �������, ��� �� ���������� ������� ��� �������.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //�������� �������, ���� �� ������ ���� ����-�� �������� � ���� ������.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "��� ��� ����� ���� ��� ������� � �������?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //��� ��� ����� ���� ��� ������� � �������?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //����� ������ ����� ����� ���� ����. ����� �� ��������� �� ����, �� ��� �����, ��� � ����� ������.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //������ � �� ���� ���������� ����, ��� ��� ��������. �����!
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString("������� ������ ��������: ������ 40, ������ 5, ����� 20",VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //��� � ���� ������� ����� ������, ��� � ����?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //� ���� � ���� ������?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text f�r die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //���� ���� - ����� �������.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //��, � �� ����� �� �����.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //������� � ���� ��� �����.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //� ������� ����� ��������� ������� ����� ���� ���������. � ������, �� �� ��������� ���� ������ �� ��������� ������� � ���������. 
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //��, �� ��� ����� ������.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //���� ������, ��� �� �������... ������ �� ����� ������?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //��, ���� �� ���� ������ ��������� ���-�� �����.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //� ����, ��� ����� ���� ����� ������. �� ��� ���� ��������.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //�������. ��� �� �� ��� ������?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //� �� ������� ��������, �� ������ ���� �� � ����.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //�� � ����? ��� ��� �� ��� �� ��������?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //�������� ����� �� ��� �����. 
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //������. ������� - ��� �������.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,	"����� � �������� � ��������� ��������� �������, � ����� �������� �����. �� ����������� ����, ��� � ������ ���������� �����-�� �������� ��������.");
	B_LogEntry		(CH3_TrollCanyon,	"�����-�� ������� �� �����, ��� � ������� �������� � ��� �������. �� ������ ���������� ���� ������.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //�� ����� ������� ������ ���� � ������, ��� �������� ������.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //�������, ������� ��� �������� ���������� �� ��� �������� �����.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //����� ���������� � �������, ����� ����� ��� ������ �����... ��� ��������� ���-������ ���. 
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //� ������� ���.

	B_LogEntry		(CH3_TrollCanyon,	"�� ����� ��������� ������, ������� ���������� ��� ���������� ����. ����� ����� ������� ���, ���� � ����� ������ ����� ������.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //������ ����������! ��, �� ������� �����������! ��� �, ���� �� ��������. 
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //� ������ �����, ���������, ����� �� ���� ������ ���������� ���������.

	B_LogEntry		(CH3_TrollCanyon,	"������ ��������. ������ ����� �������� ��������, ������� ��������� ������� �� ���� � ��������� � ��������.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //������, ���������.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //���-�� ��� ���������, ����� ����, ������� ���-�� �������.

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //���, ������ ������ ����������.
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,	"����� ����� ��������������� �������. ������ ��� ����� �� ������ ����� ������.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //��� �� ��������, � � ������� �����.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //����� ������? �������.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //�����, ��� ���� ������������ � ������ ������. ����� �����!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //������, ���� ���������.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //��� ��������.

	B_LogEntry		(CH3_TrollCanyon,	"������ ���. �������� ������ ������� � ���� ���� ������, ������� �� ���� �� ��������.");
	B_LogEntry		(CH3_TrollCanyon,	"����� ������������ � ������ ������. �����, ��� ���� ��� �� ��������� ���� �������.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  











//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //��... ����!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //������, �����! � �������� �������� �� ������ ����� ������.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //������, ����� �� � ����� ��������� �������.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //�� ������, ��� ����������� ��������� �� ��������� �����?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //������, �����! ������ �� ���������?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //� �� ��� �� ������?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //������ ���?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //� ������ ����� �����, ��� ���� ���� ������, � �� ��������� ����� ��������� ���������.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //���? � ��� �� ��������?
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "������ ���������� ������ �����?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //������ ���������� ������ �����?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //���� ���������� � ����� ������� �������, ��� �� ����� ����� �� ������ ������, ��� ������������ �� ��������� ����.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //����� ���� ������� � �����, ��������� ���� �� ��������, � ������� ������� ���������.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //�� ���, ��� ��������� � �����, ������� ���� �������.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "������ ��� ���� ���� �������?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //������ ��� ���� ���� �������?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //��� ������ �������.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "����� ��� ����� ������� �� ��������� �����?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //����� ��� ����� ������� �� ��������� �����?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //��� ������ �������.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "��������!";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //��������! ��� ������ �� ������ ������ ������� �� ���, ��� ��� ����������� �������.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //��, �����. �� �������, � �������� � �������� �������, ����� ��� ������ �� ������ � �����.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //����� ���� �� �������� �� ������, ������� ��� ��������. �����, ���������, ��� ��� ��������� ����� �����������.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //��� ��. ���, ��� ������������ ������ ����, ��� ������ � ����� ��� �������.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //�� ����. ������ � ���� ��� �������� ��������� ����, ������� ����� ��� ���������� ���������� ������ �� �������� ����.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //����� �� ����� �������� �� ����, ���� �� �� ������ ����� �������� ������.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //� ��-�� ����� �� ����� ������� �� ��������� �����?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //���, ���� ������, ��������� ���� ������ �������� ������.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //���� ��� �����, ����� �������� ���������� ����������� � ��������� �����.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "�� ����� � ���! � �������� �� ���� � ����� ������!";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //�� ����� � ���! � �������� �� ���� � ����� ������!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //����� ���� ����� ���������� - ��� ��� ������ ����� ��������� ����.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //�� ��� ������� �� ������ ���������� ����� ���������� ������ ������!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //��� �� �� �����. ��������� ������� ����� ��� ����� ����, ������� ����� ���� ����� � ��������� �����. ����� ��� ����� � ��� �� �����.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "� ����� ����������, ���������� �������� ������.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //� ����� ����������, ���������� �������� ������.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //������� �� ��� ��������. ��� ������� �� ������, ��� �������� � ������.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //��� ������ ����� �� ��������� �� ��������� �����.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "�� ��� ��������� � ������ ����?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //�� ��� ��������� � ������ ����?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //�������� � ��������� ���� ���������� ����������, ��� �������� �������� � ���� ��������.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //��� ��������� ��������� � ����������� ������������ � ����� ���������� ��������.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //��� ��������� ������ ������� �� �����?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //��, ��. �������� � ������ �� ������ ���� ��� ����� ����. ����� �������� �������� �� �, �������� �����, ������� ����.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "��� �� � ��������� ����������� ������ ������?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //��� �� � ��������� ����������� ������ ������?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //�� ���� ��������� ����� � ����� ������������� ������, ����� ��� �� ���������� �� ������.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //������ �� ��� �� ������ ���.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "�������. ��� � ������ �������?";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //�������. ��� � ������ �������?
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //������ ������� � �����. ��� ������ ������ � ���, ��� ����� ����������.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //����� ��, ��� �� ������� ���������� � ����� �����, ��� ������.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //���� � ������� �� ������ ����, � �������, ��� �� ������ �� ������.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //���������, ���� ���. �� �������� �������� ������! ������ ���, ��� ��������.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"��� ���� ���� ������. �� ����� �� ����� �� ���� ���������������. ����� �������� ���� ������������ ����� � ������� � ���, ��� �� ����� ����������� � ���� � �������� �����. ��� �������, ��� ��� ����� �������."); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter �berfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schl�gerei mit Folgen         (+3 St�rke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung f�r mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des K�nigs Gardisten. dummerweise hat der K�nig viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("St�rke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich sa� in der Kneipe und habe meine Meinung �ber K�nig, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu sp�t daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du M�nner die so ziemlich jedes m�gliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("St�rke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
