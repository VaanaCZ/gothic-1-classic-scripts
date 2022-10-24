// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //������!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //�� ������ ���� ������!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //�� ������� ���������� � ����! ����� ������ ������! ��� ������������. ����� ������� �������, �� ��� ��������� � ����.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "��� ��?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //��� ��?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //� ������. � �������� � ���, ��� �������� � ���� ������.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //�� �� ���� ���������� � ����� ������. ��� ������� ����. �� ���� �������� �� ����� �������� � ����.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "�� ��� ����� � ��� ����������.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //�� ��� ����� � ��� ����������.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //�� �����! � ������, ��� ��� ����� ������ ���� ������ ���� ��������.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "�������� ��� ���-������ � ������.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //�������� ��� ���-������ � ������.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //��� �� ������ �����?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"�������� ��� � ��������.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"��� ����� ������?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"��� �� ������ � ���������?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //�������� ��� � ��������.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //���� ������ � ��������� �������. ��� ������������ ��� ������ ������ � �� ���� ������. ������ ���� ������, ������� ���������� ���� �������� ���� � ���.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //�� ���� �����������. ����� �� �������� � ��� �� ����. ��� � ���������. �� �������� ������� ������� � ��������� ��� ������ � ������.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //��������� �� ����������� ����� ����� ����, �� ��� ����� ��� ������ ������� ���������.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //��� ����� ������?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //������ - ��� ���. �� �������� ��� �������. �� �� ������ ������� ����� �����. ���� ���� �������� �� ���� ���� ���.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //�� ������� ���, ������ ��� �����, ��� �� ������ ���������� ���.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //� �� � ��� ������?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //��, � ������ ����� ��� ��� ����. �� ������, ��� ��� ����� - ������� ��� ���� � ���� ������?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //�� ���� ����������� �� ������, ���� � ����� ��������, ���� �� ���� �� ����� �����.
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //��� �� ������ � ���������?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //��, �������� �� �������� �� �������, ��� ���� ��������. ����� ����� �� ������������ ���������� ���������, ����� ��� ����� ���� ������. ��� ������ ��������� ����������.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //�������� �������� ������������ � �����������, ���� ����������� ��������������� �� ������� � ���������� ��������.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //�� ������ ��� �� ������ �� ������ ������� � ���������� ��� ����������� ����� ����� � ��������.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //�������, ��������� �������������� � ��� ������ ��-�� ����. ��, ��� ���� �� ����������� ��������� ��������� ������ � ������.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "� ���� �������������� � ��������!";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //� ���� �������������� � ��������!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //������ ��� ����� ����� ������, ����� �� �� �������� � ���� ��������.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //�� �� ���������� � �� ������ ������ ����. �� ����� ������ ����� ������.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //������� �� ������ �������� ���� �����������, ����� ����� ���� �� ���� �������� ���� � ��� ������.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "��� �� ��� �������? ����� �� ��� �� ����� �� ���� �������������?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //��� �� ��� �������, ���� ����� �� ��� �� ����� �� ���� �������������?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //���� �����, �� �� ������ ����� ��������, �� �� ����� ������ ����� ��������� ����.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //����� ��� �����, ��� �� ������� ���� ��������, ��� ������ ���� �� ����.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //� �����, ���� ����� ����� ������������� ����������� �������� ���� ����������� ������ ������.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"���� � ���� �������������� � ������� �� ��������� ������, � ������ ���������� ����������� �� ����. ��� �� ������������� � ���������. ��, ��� ������ ������, ��� ����� ��������� �� ����, � ����� � ���� ���������� �������� �� ���, � ������ ����� ���� ��������. ������, � ��� �� �������, ��� ��� ������! ����� � ������� �������� ������.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "��� ��� ���������� � ����� ��������?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //��� ��� ���������� � ����� ��������?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //�� ������ �����, ��� �� ����� �� ���� ��������.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //� ��� ��?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //���� ����������. ����� �� � ��������� ��� �������� � ����, �������� �� ���, � �� ������� ���������.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //������ � ����� ������ ����� ����� �����, ���� ���� ���������� ��� ��� �� ������� �������� ������ �����.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //�� ������� ���, ��� ����������� �� ������ ���� � ������ ������ ������� �� ������� �������.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //� ������ ����, ��� ��������� ���� ������ � ������ �������, � �� ��������, ��� ���� ���� �������, � ������� ������ ������� ���� � ����.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //�� �� ��������� �����������. �� ������� � ���� ����������?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //�����.
	
	B_LogEntry	(CH1_JoinPsi, "����� ������� ����� ������, � ������ ������� �������, ��� �������� ���� � ������� � ����������� �� ������ �����, ��� ����� �� ��� ������.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //��! ��� � ��� ����� �������. ��� � ���� ����?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "� ������� �� ������ �����.";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //� ������� �� ������ �����.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); // ������? � ������ �� ��� �����?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //��� ���� �������. ������ ������� �� ����.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //� ��� �� ������?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //�� ������: ��� � ������ �� ������� � ����� ����� �� �������.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //���� ���������� �������, ����������, �������� ����� ����������� ����� �����!

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "��� ��� ��������������� � ���� ������?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //��� ��� ��������������� � ���� ������?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //� ���� ���� �������� ��� ������.
};

// **************************************************
//				F�HRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "�� ��� ������?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //�� ��� ������?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //���� �� �� ������ �������� ����� ��������, �� � ���� ������ ���������.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE �NDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "� ���������.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //� ���������.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //�� ������, ��� ���� �����.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------F�HRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "��� ������..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //��� ������...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...����� � ������� �������?",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...� �������?",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...� �����?",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...� �����������?",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...� �����������?",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...� �������.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //������ �� ����!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...� �����.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //������ �� ����!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...� �����������.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //������ �� ����!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...� �����������.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //������ �� ����!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //����� ����� �� ������� ����� ������. �� ������� �����������.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //��� �������� ����� �� ������������� �������� �������. � ������� ���� �����. ���� �� �����������, �� ������� ����� ���� � ����� � ������.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //��� ��� ����. �� ������ ����������� �����, �� ����� �� ������������, ����� � ������� � ����� ������.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //��� ���� �������! ���������, � ���� ���� ����� ���. ����� � ������� � ����� ������.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauth�ndler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //��� �������� ����� � ����������� ��� ������, ��������. � ����� ����� �������, �������� ����������.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //� ���� ����� ���� ����� � ������� ����. � ����� ��� �������� ����.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral f�r alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //������, ��� �� ������. � ���� ��� ���� �������.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //��������.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //���� ������ �������� ������� �������� �������.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //��? ��� ����� ����� ������?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //��� ����� �������� �������. �� �� ����� ���-��, ��� ������� ���������� �� �������� ����.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //��? 
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //��� ����� ����� ���������� ��������, ������� ��� �������� ��������.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "� � ��� ���� �������?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //� � ��� ���� �������?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //�������� � ���������. �� ��� ������� � ����� �������������� �� ���. � ���� ����� ����������� ��������� ��� �������.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //��� � ���� ��� �����?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //��� � �����. �� ����� �������� ���. ��������, � ���� �������� ������ �� ��������� ���� ����� � �������.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,	"��������� ������ ��������� ���, ��� �������� ����� ������. ������� � ����� ����� � ����� �� �����.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //��, ��� �� ����� �������?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //� �������� ������� ����� ����. �� ����� ���������� ���������, ���������� ���������.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //�� ������ ����� ������, ��? ��������� ���� �� ��������.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //� ��� ������� ������� � ������ ���� �� ������ ������ ����� ��������� ������ � ���������� �������.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //� ������ ����, ������ ����� ����� ��� ������������ �������.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //� ����. �� ����� ���, ����� �� �����?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //� ��� ��� ����� ��� ���, �� ����� �� ��� � ������ ����.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //���� ���� ��������, ������� �� ��� �������� ����� ����. � ������ �������, ������ ���� ����� ������.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ���� ������� ���������� ����� ��� ����� ����?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //��� ���� ������� ���������� ����� ��� ����� ����?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //� ������� �������� � ����. �� ����� ������ ������ �������.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� �� �������� �� ������ �����?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //��� �� �������� �� ������ �����?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //�����-�� ����� � ���� ����� ��� ��������� ���� ������. ��� ������������ ��� ����� � ��� �����.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //��� � ������� ���������, � ���� ��� ��������, �������������� ����� ������������� �� �����. �� �� ��� � �����.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //�� ���� �� ��������� �� ��������, �� ����� ���������� ����������.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //�� ����. �� ���� ���� ���� ����� ��������� ������, ���� �������� ����� ������� � ����.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ����� ������ ��������� ���� ����."; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //�� ����� ������ ��������� ���� ����.
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //�������� �����������. ��� ������, � � ����� ������.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,	"�������� �� ��������� ����� �� ���� � �������� ���������� ������� �� ��������� ������. ��� �� ���� ����� ���� ��������. �� ����� �������������� �� ���.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //��������-��, �������, ��� � ���� ������.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //��, �������, �� ����, ��... ��� �� ���-�� ����� �������...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,	"������, ������� ��� �����, ��������� �� ����������. ��� � �� ����� ��� �������. �� ��� �������� ����� ������ ������� ���.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL �BER DIE BR�CKE OHNE DEN AUFTRAG ERF�LLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //���� �� ��? ���� ������ ��� �� ���������.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "� �����. �� ������ ������ ���?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //� �����. �� ������ ������ ���?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //���, ������ ��� ����� �������.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE F�R LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ����� ��������."; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //� ����� ��������.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //�������! ������ ��� ������ � �������� �������. ��� ������� ���� ��������� �� �������.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //� ������� ���� �����, � ����������.

	B_LogEntry		(CH3_Fortress,	"���������, ������� ����� ������, ���������� � �����. � ����� �� ���� �� ��� ��� ������ ������ ����������. � �� ������� � ����� ������� ������.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� �� ��� ������� ���� ������?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //��� �� ��� ������� ���� ������?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //��� ������ ������� �������: '������� ��������� ����������� �������� ������, � ������ ���������� ���� ������ ����'.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //� �������� ����� � ����� ��������.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //�����, ��������, ��� ��� ����.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //�� ����� ��, ��� ������. � �������� ����� ���������, ���� ������� ��������� �����.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //�� ��� ����������.

	B_LogEntry		(CH3_Fortress,	"� ������ ������. ������ ������� ��� ��������� �������� � �����, ����� ���������� ����������. ���������, ���������� �� �� ��� �����-������?");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ����� ���-������?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //�� ����� ���-������?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //������ ������. ���� �����, ��� ������� �������� ���� ���-�� ����������.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //�� �������� ����� �� ������?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //���, ���� �� ����...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //� � ���������� �� �� �������?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ����� ��������� ���� ���� ������."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //�� ����� ��������� ���� ���� ������.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //������, �� ��� ������.
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Bj�rn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� �����?";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//��� �����?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//��, ��� �� ����� �������?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//������ ����� ����������, ����� ���� ��� �� ������ ����!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//� ���?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//��� ���� ����� ���� ������!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//����� �� ������� ������.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//�� ����� �� � ������� � �������� ���������!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//�������� �� ������� ������ � �������� ����� � ��������.
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//��� ����� ����������� � �����. �� ����� ������� �����.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//��� ������!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//��� ��� ������ ������?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//� ��� ������� ������ �����, �������� ������ �����.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//��... � �� �������...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//��� ������ ������� �������: '������� ��������� ����������� �������� ������, � ������ ���������� ���� ������ ����'.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//������, ������. � ��� �����.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//���� ���������.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//�������. � ������ ��� ����� �������.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//�� ������ ���� ������!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"� ������ ������� � �����, ��� �� ������ ����� � ���� �����������. ����� ������� ��� ����� ����."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
