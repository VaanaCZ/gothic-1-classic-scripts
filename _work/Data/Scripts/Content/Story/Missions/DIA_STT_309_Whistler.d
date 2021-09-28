// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "������! � ����� ���������.";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //������! � ����� ���������!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //� ��� ���� �� ���� �����?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //� ���� ����� ����� �� ��� - ���� �������������� � ������ ������.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //����� ����-������, ��� �� �����, �?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //���� �� ������, ����� � �������� �� ���� �������� ����� �����, ���� �������� ������� ������ ���.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "��� � ������ �������?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //��� � ������ �������?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //��� ����� ���� ���... ��� ������� ���� - ��� ���� �� ��������� �� �����.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //�������� ����� � �����������. �� ��� �� ��� �� �������...
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //� ��� ���� 100 ������ ����, ����� �� ����� ���. ������ �� ������ ����� ��� ����.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"�����, ����� ���� 100 ������. � ����� ���� ���.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"� �� �� �������, ��� � ���� ������� � ����� �����?..",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"� ������ �� ������ �� ����� ��������� ���� ������?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //�����, ����� ���� 100 ������. � ����� ���� ���.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //��� ���. � ����� ����������� �� ���!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"������� ������� ���, ���� � ����� �� ����� � ����� � ����� ��� ���. ��� ����� �� ��� ��� 100 ������ ����.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //� �� �� �������, ��� � ���� ������� � ����� �����?..
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //�� �������: ��� ������� ����� ���������. ���� ����������� ���� ������, � ���� �����!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //� ������ �� ������ �� ����� ��������� ���� ������?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //�� ��� ������� ���������.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //�?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //� ������. ���� ��� ����� �������!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "���� ������ ����� 110 ������ �� ���� ���.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //���� ������ ����� 110 ������ �� ���� ���.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //� �� ������, ����� � ���� ��� ��� 10 ������...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //� �����, ���� ����� ���� ���.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //���, ����� ���� � ����������!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "� �� ����� ������ ���. ��� ���� ���� 100 ������ �����.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //� �� ����� ������ ���. ��� ���� ���� 100 ������ �����.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //�� �����, � ������� � ��� ����� ����� �������! ���������� � ���� ����!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"� ��� ��������. ������� ������� �� ������� ���� ���.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //����� ��� 100 ������, � ����� �� ���� ����� �� ���������, ��� � ���� �������� ������� ������������.
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //��� �� ���! ����� ������� � ���� �����, ��? ���-�� ����, �����!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"� ��� ��������. ������� ������ ����� ��� �� ����.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "���� ��� � ����...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //���� ��� � ����...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //� �� ������� ����, ��� ��� ����� ��������. �� ��� �����: �� ����� ��� - � ������ ����.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //���� ����� ������� ����, � �������� �� ���� ��������. �� � ���� - ��������� ����������!
	
	B_LogEntry (CH1_JoinOC,"������� ������� ������� �����. �� ������������� ���� �����.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"������� ������� ������� �����. � ���������, ��� ��� ���� ������ ������ ������ �� ������: ��������� ����� � ��� �� ����.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "��� ����?";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //��� ����?
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //��� ������! �� ����� ��� - � ������ ����. � ����� �����, ��� �� �������� ������.
};





	
	





















