// ************************ EXIT **************************

instance  GRD_262_Aaron_Exit (C_INFO)
{
	npc			=  GRD_262_Aaron;
	nr			=  999;
	condition	=  GRD_262_Aaron_Exit_Condition;
	information	=  GRD_262_Aaron_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_262_Aaron_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_262_Aaron_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//************************ EXIT **************************
instance  GRD_262_Aaron_CHEST (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_CHEST_Condition;
	information	=  GRD_262_Aaron_CHEST_Info;
	important	= 0;	
	permanent	= 1;
	description = "��� �� �����������?";
};                       

FUNC int  GRD_262_Aaron_CHEST_Condition()
{	
	if ( Npc_GetDistToWp (self,"OM_CAVE1_34") <400 )
	&& (!Npc_KnowsInfo   (hero,GRD_262_Aaron_BLUFF))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_CHEST_Info()
{
	AI_Output			(other, self,"GRD_262_Aaron_CHEST_Info_15_01"); //��� �� �����������?
	AI_Output			(self, other,"GRD_262_Aaron_CHEST_Info_09_02"); //����� �� ���, ����� �������� ����� ������� ��������� �������� �� ����� �������.
};

//***************** BLUFF *****************************
instance  GRD_262_Aaron_BLUFF (C_INFO)
{
	npc				= GRD_262_Aaron;
	condition		= GRD_262_Aaron_BLUFF_Condition;
	information		= GRD_262_Aaron_BLUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= "(�������� �����)"; 
};

FUNC int  GRD_262_Aaron_BLUFF_Condition()
{	
	if	Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL)
	&&	(Aaron_lock != LOG_RUNNING)
	&&	(Aaron_lock != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  GRD_262_Aaron_BLUFF_Info()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,DIALOG_BACK												,GRD_262_Aaron_BLUFF_BACK);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"���� ������� ��. �� ������ ����������� � ���� ����������!",GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"� ������, ����� � ����� ��������� �������. �� ����� ����.",GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"�������� ����� ����������� ���������!",GRD_262_Aaron_BLUFF_ORE);
};

FUNC void   GRD_262_Aaron_BLUFF_ORE ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_01");//�������� ����� ����������� ���������!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_02");//� ��� � ����?
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_03");//�����, ���� ����� �� ���� ����������!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_04");//������ �� ����.
};  
FUNC VOID GRD_262_Aaron_BLUFF_BANDIT ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //� ������, ����� � ����� ��������� �������. �� ����� ����.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //�� ���������� ���� �� ������? ��� �� ������� �� ����������!
};
func void  GRD_262_Aaron_BLUFF_IAN()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //���� ������� ��. �� ������ ����������� � ���� ����������!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //��� ��� �����?
	
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"������� �� ����.",GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"�� ����� ����.",GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"�� ����� ��������� ����.",GRD_262_Aaron_BLUFF_GOOD);
};  
func void GRD_262_Aaron_BLUFF_GOOD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //�� ����� ��������� ���� �� ������� ������.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //�� ��, ������? ��� �� �� �� ����� ��������.
	Npc_SetTempAttitude (self, ATT_ANGRY);
	AI_StopProcessInfos	(self);
};
func void 	GRD_262_Aaron_BLUFF_BAD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //�� ������� ���� �� ���� ����.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //��, �� �������. ����������!
	AI_StopProcessInfos	(self);
};
func void GRD_262_Aaron_BLUFF_UGLY()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //������� �� ����. �������� �� ��� ���� ������. �� ������� �� ��, ��� �� ����� �������� �� ���� ������ �������?
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //�����, ����� � ����� � ����!

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine	(self,	"trick");
	
	Aaron_lock = LOG_RUNNING;
	Snipes_Deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;
	
	B_LogEntry		(CH2_SnipesDeal,"� ����� �������� ����� �� ������� ��� ��� ���������, ��� �� ����� ��� ������. �������, �� ��������� � ����� � ������.");
};

func void GRD_262_Aaron_BLUFF_BACK()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
};

// ***************** Aaron ist angepisst *****************************
instance  GRD_262_Aaron_PISSED (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_PISSED_Condition;
	information	=  GRD_262_Aaron_PISSED_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC int  GRD_262_Aaron_PISSED_Condition()
{
	if	(Aaron_lock == LOG_RUNNING)
	&&	(Npc_GetDistToWP(hero, "OM_CAVE1_47") < 1000)
	{
		return TRUE;
	};
};
FUNC VOID  GRD_262_Aaron_PISSED_Info()
{
	AI_DrawWeapon		(self);
	AI_Output			(self, other,"Info_Aaron_PISSED_09_01"); //��, ��!!! ��� ��� ����������� ��������� ���� �������, � �� ��������, �����?!
	AI_RemoveWeapon		(self);

	Npc_ExchangeRoutine	(self,	"start");
	Aaron_lock = LOG_SUCCESS;
	
	B_LogEntry		(CH2_SnipesDeal,"� ����� �������� �����. ��� ������� �� ��������� ��� �����."); 
};

// ***************** Schl�ssel verkaufen *****************************
instance  GRD_262_Aaron_SELL (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELL_Condition;
	information	=  GRD_262_Aaron_SELL_Info;
	important	= 0;	
	permanent	= 0;
	description = "��, �� ������ �� �������? � �������, ���� �� �������? ";
};                       

FUNC int  GRD_262_Aaron_SELL_Condition()
{
	if ( Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL_RUN )) 
	{
		return 1;
	};
};

FUNC VOID  GRD_262_Aaron_SELL_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELL_15_01"); //��, �� ������ �� �������? � �������, ���� �� �������? 
	AI_Output			(self, other,"Info_Aaron_SELL_09_02"); //�����. � ���� �� ���� �����, ��� � ������ �� ����� ��� ����.
	AI_Output			(self, other,"Info_Aaron_SELL_09_03"); //�� � ��� ���� �������� ������ ����, ���� �� ������� ��� ���.

	B_LogEntry		(CH2_SnipesDeal,"���� ��������� ��� 20 ������ ���� �� ���� � ��� �������."); 
};

// ***************** Schl�ssel verkaufen 2*****************************
instance  GRD_262_Aaron_SELLNOW (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELLNOW_Condition;
	information	=  GRD_262_Aaron_SELLNOW_Info;
	important	= 0;	
	permanent	= 0;
	description = "(������� ����)";
};                       

FUNC int  GRD_262_Aaron_SELLNOW_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_262_Aaron_SELL) ) && ( Npc_HasItems ( hero,ItKe_OM_02))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_SELLNOW_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELLNOW_15_01"); //��� ���� ����.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_02"); //��, ��� ��. ��, ��� ���� �������� ������, ��� �� � ��������������.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_03"); //�� ���� �� �������: � ����� ������� � �� ����� � ���� ����! 
	
	CreateInvItems 		(self,ItMinugget,20);
	B_GiveInvItems      (self,other,ItMinugget,20);
	B_GiveInvItems      (hero, self, ItKe_OM_02, 1);

	B_GiveXP			(XP_SellKeyToAaron);

	B_LogEntry		(CH2_SnipesDeal,"� ������ ����� ��� �� ����������� ����. ���� ���������, �� �������� ����� ������."); 
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_SUCCESS);
};


