// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //���� ���-������ �����?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "��� ���� �����?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //�� ���?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //� �����, ������ ���� ������. ������ ��� ������� ������, �� ������ ���������� �� ����. ��� �������� ����.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "��� ����� ������� ������ ��������.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //��� ����� ������� ������ ��������.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //���� � ��� ���������� �������. ������ �� �������� � ���������� �� ����������.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //�� ������� ��� � ������� ������ �� ����� ��� �� ����� � ������� �����.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //����� ��, �������� ����, ���� � �� ����� ����� � �� �� ���� ��� ����������.

	B_LogEntry			(CH1_KrautBote,"����� ��������� ��� ������ ���� �������� � �������. � ����� ����� ��� � ���� �������.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "� ���� ������� ������.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //� ���� ������� ������. ����� ������, ��� ���� ������ ��������� � ��������.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //������� ���� ����� �����. �� �� ����� �� ��������. �����, ��� � ���� ����� � �������.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //��� �� ���� - � ������ ���� � ������. � ������ �� ������!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //����� ����� ���. ���� �� ������ ��������� � ���� ��������, �� ����� ������ ����� ���� ������� �������, ����?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "��� ���� �����?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //��� ���� �����?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //�� ������ ����� ������ �����������. ��������� ���� �� �������� ���� ��� ����� �������.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "����� ������, � ������ � ����.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //����� ������, � ������ � ����.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //�������! ��, ��� ���, �� ������ �������� ���� �����������, �������� ��� �������.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //��� ���� ��� ������ ���� �� ������� ������, �������� ���� �� �� ����� �� ������ ����� ������.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "��� � ������ �������?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //��� � ������ �������?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //�� ����� ������� ����� � ���������. �� ��� ������ �� ������, ��� �� �� ��������.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //����������� �� ������.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //����� ���������� �� ������, ������ � ���. ���, ��� �� �������, ����� ��������� �������� ��� ���.  
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //��� ������ �� ���������, ��� �����. �������� � ����... ���� ��, �������, ���������, � ��� � ������.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //����������, � �� ��������� �� �����.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //� ����, ��� �� �������.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"����� ������ ���� � �������� � �������� ������ �� ���� ������� ������. � ������ ����������� � ������� ��� ���������. �������� ����������� �����-�� ������ ��� ������� ����������.");
};

// *********************************************
// 				Ausr�stung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "��� ����� ����� ������� ������?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //��� ��� ����� ���������� �������?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //�������� � ����� - �� �������� ���� �����-������ �������. ��� � ���� ����� ������ ������ �������, �� � �� ��������������� ���� �� ������ ������.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //��� ������� �������� ���� ���������������� ������ �������.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //���� ���� ����� ������, �������� �� ������. �� ������� ��� � ������� ����� �������� �����, ��� ��������� ����� �� ���������� ����� �����.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"� ����� ���� ������� ������� ��� ����� ������. �� ��������� � ����� � �����.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"�������� ���� �������������� ������� �� ������ �����. �� ������ ��� ����� ������.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "� �������, ��� ����� �������� � ��������. ";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //� �������, ��� ����� �������� � ��������. 
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //������. � ���� ���� � ����� ����� �������������.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //���������� ������� ���������.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //�� ������ ���������.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"����� ��������� ��� ������ ����! � �� ����� �������� � ����� ����������. ��� �� �� ���. � ����� ������� ���� ������ ��, ��� ��� ������.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //������ �� ����� ����, ������� ����������� �������� ��������, ����� ������� ������� � �������� � ������� �� ������. ��� ���� � ���� � �����.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //����� ���������. ��� ������ ��������� ��. ������ ���� � ����.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //�� ������ ���������.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"����� ��������� ��� ������ ����! � �� ����� �������� � ����� ����������. ��� �� �� ���. � ����� ������� ���� ������ ��, ��� ��� ������.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //� ���� ��� �� ����, ��� ��� ���������� ������. 
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //����� ����� �� ���� ��������� �� ���?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


