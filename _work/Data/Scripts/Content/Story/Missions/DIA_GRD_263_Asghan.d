
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "���-�� ����� ������ ���� ������ ��������."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //���-�� ����� ������ ���� ������ ��������.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //��� ���� - ���� �������� ������ ���� ������!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //������ ������� ��� �����?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //������� �� �� �� ������� ��������, �� ����������� ��� ������ � ������.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //������, ���-�� ���������� ������ ���� �� ������. ������� ��� ������� ������!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //���! ��� ������ ����� ���� ������� ������ � ���������� ���! �� ��� ��� ���� �� �� �������� ���, � �� �������� � �����.
	
	B_LogEntry		(CH2_MCEggs,"������, ��������� ���������� �����, �� ������� ������. ��� ����� ���������� ����� ���������� ���.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "��, ������, ������ �� ������ ������� ������!"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //��, ������, ������ �� ������ ������� ������!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //� ��� ������� ����: ������ ���� ��...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //������... ��� ����� � �������... � ����� ��������� ��������� �� ���.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //��, ���� �� ����� ��������������� �� ����... �� ������ �� ����� �������!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //�� ����� ��?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //������ ��� ������������ - ����-���� �������. � �� ���� ������ ����� ����, ����� ������� ������ �� �����!
	
	B_LogEntry		(CH2_MCEggs,"���� �� � ��� ��� ����������, ������ ��� ����� �� ������� ������ �� ��� ���, ���� � �� ������ ������������ �� ���������� �������.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ������������� ��������. ������ ����� ������� �����!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //��� ������������� ��������. ������ ����� ������� �����!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //�����, ��������. ������������� ����������!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"��� ������� ������� ��������� ������� ����� ��������. ��� �� ���� ��� ���, � �������?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "������� ������ �� ������������ ������!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //������� ������ �� ������������ ������!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //������� �������. � �������� ����� � ������!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz l�uft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ���� ����?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //��, ��� ����?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //���������... ���� ����� �� �������� ������� ������, ��� �� ����� ����������� ������ ������.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //��� ������ ���������� � ���� �������?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //�������. ������� ������� �����. � �� ����� ����� �����.
};  



































