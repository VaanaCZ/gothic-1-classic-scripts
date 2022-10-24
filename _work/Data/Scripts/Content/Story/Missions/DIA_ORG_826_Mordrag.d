// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //��, ���������! � �������. ������� ����. � ������ ������������ ������ �� ������ ����.
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "������ ��� ���� ������.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //������ ��� ���� ������.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //������...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,	"��� ������� ������� �� �������� ������� ���������� �����.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER F�R MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "�� ������������� ���� �� ������ �����?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //�� ������������� ���� �� ������ �����?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //� ��� ���� ���?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //� �� ����� ���������� � ������. ��� ����� ������� � �����.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //���������� ����� ����� ������, ������� ������ ���������. �� ������� �������� ��, ���� ������� ����� �� ���.
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "� ���� ��������.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //� ���� ��������.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //������? � � ���� �� ���?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //���� ����, ������� �� �������� ���� ����������� �����. ��� ����� ���������� �� ����.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //�� �� ���? ����� ��� ������ ����� ��������� �� ��� ����-������, ����� ������ �� ������!
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //� ������ �� ������, ��� ��� ������ �� ���������? ��������, ��� ����� ������� ����...
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //������ ��� ��� �������, ��� �� �� ����� �� ������. �� ����� �������, ��� � ������� ���� ����� ���������� ����, ��� ������ �� ������.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //� ��� � ����� ������ ���� ����� ��������� ����. � ��� ��� ��� ������, ��� ����� ��������� ����, ��� �����, � ��� ������.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "�������� ��� ���-������ � ����� ������.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //�������� ��� ���-������ � ����� ������.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //� ����� ������ ����� ��������� ����. ������� ������� ��� ����, ������� ������ ��������.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //� ��� ���� ���� �����. � ��� �� �� ���������� ������� ���� ������!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //� ����� ��� ��� �����?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //���� ���� ���� ������ ���������� �������. ��� ��� ����� �� � �������� ���� ����.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //���� ����� � ��� ���� ��������� ��� ����, �� ��������� ��� ���� ���, ����� � ����� ������ �������� �������.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "� ���� � ������ �������������� � ������ ������... �� �������� ���?";//k�nntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //� ���� � ������ �������������� � ������ ������... �� �������� ���?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //���� �� ����� ������������� ������, �� ����� ����� ���� ����� ������. � ������ ���� � �����. �� ����� ����� �����.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //�� ���� �� ������ ������ �������� ���� �� ������, ����������, ��������!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "����� ������ � ����� ������!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //����� ������ � ����� ������!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //������! ��� �� ����.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "������� ���������� �������� ��� ������ � ����� ������. �������, �� �� ��������� ��� �������!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //��� �� � �� �����.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //� �����, ��� �� ��� ������� �� �������. ��� ��� �������, �� ������.
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //���� �������� ����� ��� ������, �� �������� ����� � ����� ������. �������� � ������. �� ������� ����. ��� ���� ������.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //��� ����� ����� ��������� � ����. ���� �� ������ �������� � ������ ���������.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //� ��� ������� � ����� �������� ����� ���������. � ���������� ���������. � ���� ��, ���������� � ������ ������ ��������� ����������.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //���� �������� ���� �����, ����� � ���. �� ��������� �� �����. ��������. �� �������!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //��� ��������!
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC, "�� ����� ����� �������� � ����� ������. ������� ��� ��� ������, ������� ����� ������� �����, ������� �����. ��� �� �� ��������� ��������� �����, � ������.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "� ���� ������ ��������� ������ ���� �� ���!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //� ���� ������ ��������� ������ ���� �� ���!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //������, �� � �� ���������...
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight, "����� �� ����� ������!" 					,Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight, "����� �� ����� ��� ���, ��� ������ ���� �������!" 	,Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight, "���� ������� �����. �� ������ �� ����� ���� ����� ������." 		,Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //����� �� ����� ������!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //������� ������� ����� ��� ������ ���������, ��� ��...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //����� �� ����� ��� ���, ��� ������ ���� �������!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //�, ��� �� � ���! ��� �� ����� � ������...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //���� ������� �����. �� ������ �� ����� ���� ����� ������.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //��? �����? ��� �, �� ������ ���, ��� ��� ���� �����...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //�����...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"� ����� �������� � ������ ���, ��� �� �� ������ ������������ � ������ ������.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "���� ������� ���� ��������.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //���� ������� ���� ��������.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //��-��, ���������.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //�� ����� �����, ��� �������� � ������ ���������. 
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //� ���� ����� �������, ��� ��� ��� ������� ���� �����...

	B_LogEntry	(CH1_JoinNC,	"� ������� �������� ��, ��� ������ ��� ����. �� ���-�� ������� � ���, ��� ���� ����� ������� ����. �� ����, ��� �� ���� � ����!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "���� ������, ����� � ����� ���� � ����������.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //���� ������, ����� � ����� ���� � ����������.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //��� ������... � ����, ��� ��� �� �������� ���� ���� ������.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //��� � ������ ���� ������ ��� ���?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //�����, � ���� ��� ���������. ������ �����������: ���� ����� ������, ���� ��� ��� ����� ���������.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //� ����, ��� ��� �������� ����� �������� �����-�� ���������. ����� � �� ���� �� � ������ �������, �� ���� � ���� �����:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //���� ����� ������� ����. � ���� �� �����, ���� �� �� �����, ��� � ��� ����������. ���� ��� �������?

	B_LogEntry			(CH1_GotoPsiCamp,	"������� ������ ���� � �������� ������ ����������� � ��������. ���� ������� �����-�� ���������, �� ��� ��� �����, �������� �������� �� �����.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"�� ������ �������� �����?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"� ��������, ��� ��� ����� �������.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //�� ������ �������� �����?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //�������� � ��������. � ��������� ����� ��� � ������ ���������, � �� ������� ��� �����. �� ������� �������.
	B_LogEntry(CH1_GotoPsiCamp,	"� ������ �������� � ������ ���������� � ����������� �� ����� ������. �� ������ �������� �� ������� ���, ����� ��� ��� � �������� ������. �������, ��� ����� ��������.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //� ��������, ��� ��� ����� �������.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //��� ������ �� ������� ���-������ ������, ����������� � ���.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "� ����� ���-��� � ���������...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //� ����� ���-��� � ���������...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //��, ����� ���-������?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //��� ������� ������� ���������.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //�� ����� ����! �� ��� ��� ������ � ����� �����������?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //��. ��� ��������� ���� �������� ���� � ������� ������ �����, ��������������� �� ��� ��������, � ���������� �������� �������.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //������� � ��� ������ �� ������! ��� ��� �� ��� ��� �����, ��?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //�������� �� ����������, ��� �� ����� ������.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //��� ����. ����������, ����� ��� �������� ���� ������ ����������.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,	"������� ������� ��� �������, ������ ��� ����������� � ��������� �� �����. �������, ��� ������ �� ���������� ���� ��������. � ������, ��� �������� ���� �������!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //� ���� �� ���� ������ ���������.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //��� ������� �����...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der T�r, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
