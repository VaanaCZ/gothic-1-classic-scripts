
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //� ������ ��������� �������.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //������ ����� �� ���� �� ���� ������� �������!
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ���� ��, ��������� �����?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //�� ���� ��, ��������� �����?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //��, � - ��. � ��� ��� �����, ��� ��� ������ ����� �� ������ � ������ �� ������!
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "����� ��� ����� ����������� �� ������?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //����� ��� ����� ����������� �� ������?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //��, �������, ��� ����� ������� ������. �� ����� ���� ������ ���� ���� - � ��� �.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "����� ����������, ��� ����� ���������� ����?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //����� ����������, ��� ����� ���������� ����?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //���� ����� �������� ���� � �����. ������ ����� �� ���������� 200 ������ �� ����� � ��� 20 - �� ����������.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //�� ��� ����, ��� �� ���������� ������, ����� ��������� �� ���� ����� �������.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ������, � ���� ���� ���� � ���������� ��������."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //� ������, � ���� ���� ���� � ���������� ��������. ������ ���������� ��� �� ����?
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //��, � ���������� ���� ���� ������ ��������. ������, ������� �� ��� ����������, ������� �� ��������, � ������ ������� ���� ������, ��� �������.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //� �����, ����������� ������ ������, ����� ��������� ������������ � ���.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "������ ���������� ��� ���-������ � ����?"; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //������ ���������� ��� ���-������ � ����?
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //� ���������, ���������� �������� ���� ��������� ��� ����������. ��� �������� ����� ����� ������ � ���������� ��������.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //�� ���� � ��� ����� ������, ���������� �� ���� ����, ���� ������� � ������ ������� �������.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "�������� ��� � �����."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //�������� ��� � �����.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //���� �������� ��������� �����, ������ � ���. � ������� ����� ��������, ��� ��� ����� ���������� � ������� �����.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //� �� ��������� � �������. ����� ���� ��� ������ ������� ����� � ������ ����� - ��� ����� ��� ������ ����� ���, ����� ���� ������� �� ����� � ���������.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //���� ����� � ����.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //�����, � ���� ���� ����. � ��� ��� ���: �� �������� ���� ������ �� ������!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //� ������ ������� ����� �������.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ������, ����� ������� ������ �������� ��� �����."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //� ������, ����� ������� ������ �������� ��� �����.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //�� ���� ��. ����������!
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "���� ������� �����. � ������ ������� ������."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //���� ������� �����. � ������ ������� ������.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //������, ��� ���� ������. ����� ��, ����� ������������ � ���������.
	B_LogEntry  (CH1_BringList,"�� ��� ��� ������ ��� ������ �������.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "���-�� ����� ������ ���� ������ ��������.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //���-�� ����� ������ ���� ������ ��������.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //� �����, ����� ����� �� ������ ������.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //������, ��� ����� ��������� �� ������ ��������...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //� ���� ������ ��� �������. ����� �� ��������. ������� ���������� ��������� ���� ����� �����.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //� � ������� �� ����, ��� ������ �����.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //����� ���: �� �������� ��� ����������, � � ������� ����.

	B_LogEntry		(CH2_MCEggs,"��, ��������� �����, �� ����� ��� �������� � ������� ������. ����� �� ��� ������������ � ��������� ��� ���������� ��� ������. �� ���-�� ������� � ������ ������� � ����������� ������� ��������.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "����������? � ��� ��� �� ������?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //����������? � ��� ��� �� ������?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //������������� �� ����, ��� ��, ��� � ��. 
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //�� � ������� ����� ���� ������ �����. �����, ��� ������� � ��� ���� ����� ��?
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ������ ����������.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //� ������ ����������.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //��, �������� ������! �����, ��� ��������. �����, ��, �������, ����� ������ ��������... �-��...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //����� � ������� � ������� ��� ������� ������, ����� �� ��� �������� � ������ ������.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //����� ���: '��� ����� ���������', - ��� �� ����� �����, ��� ��� � ��� ���� ����������.

	B_LogEntry		(CH2_MCEggs,"� ������ ��� ���������� �� ������� ������. �� ������� ���, ��� ������� ������� ������� ��� ����� � �������. �����-�� ������� ��� �������� ��� ������� ������.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ��� � �� ����� ������ ���� ������.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //� ��� � �� ����� ������ ���� ������.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //� �� ������� ����: ����� � �������. �� ��������� �����������. �� ������� ��� �� ������ ������.

	B_LogEntry		(CH2_MCEggs,"���� � ���� ��������� ������ ��� ��������, �� ��� ���� ���������� � ��������.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ����� ������ ��������!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //� ����� ������ ��������!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //� � ����� ������ ����� ���� � ��������. ��-��-��!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //�����, � �� ����� ���� �������. �������, ������!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //���, ������ ���� ���� ���� ���� �� �����.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ����� ������ ��������! � ����, ���������� �� ���������!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //� ����� ������ ��������! � ����, ���������� �� ���������!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //���? ��� ��� ����, ������� �� �����? �� ��� �, �� �������, ��� ������ �������.
};
