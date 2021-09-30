//****************************************
//					EXIT
//****************************************

INSTANCE DIA_ORG_855_Wolf_Exit (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 999;
	condition	= DIA_ORG_855_Wolf_Exit_Condition;
	information	= DIA_ORG_855_Wolf_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//****************************************
//					Hallo
//****************************************

INSTANCE DIA_Wolf_Hello (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_Hello_Condition;
	information	= DIA_Wolf_Hello_Info;
	permanent	= 0;
	description = "��� ��?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //��� ��?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //���� ����� ����. � ����� �������.

	B_LogEntry			(GE_TraderNC,	"���� ������� ����� �������. ��� ����� ����� ����� ��� ����, � ������� ������ ������ ������.");
};

//****************************************
//				Bin ORG!
//****************************************

INSTANCE DIA_Wolf_GreetORG (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_GreetORG_Condition;
	information	= DIA_Wolf_GreetORG_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Wolf_GreetORG_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Wolf_GreetORG_Info()
{
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //��! ������ �� ���� �� ���.
};

//****************************************
//				TRADE
//****************************************

instance  Org_855_Wolf_TRADE (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 800;
	condition		= Org_855_Wolf_TRADE_Condition;
	information		= Org_855_Wolf_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Org_855_Wolf_TRADE_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_TRADE_Info()
{
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //� �� ������ � ������ ���-������ ���?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //� ������� ���� � ����� � ���������. ���� � ���� �������� ���-�� ��������, � ������������� �����.
	

};

//****************************************
//				Wo J�ger
//****************************************

instance  Org_855_Wolf_WhereHunter (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 900;
	condition		= Org_855_Wolf_WhereHunter_Condition;
	information		= Org_855_Wolf_WhereHunter_Info;
	permanent		= 1;
	description		= "��� ���������� ���� � �����?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //��� ���������� ���� � �����?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //�� ���� � ����� ������ ����� ������� �����. �� ����� ���� �������, ��� ��������� ����������� ������.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //������� � ����� ����� � �������� ����� ������� ������, �� ���� � �������� �������. 
};

//****************************************
//				Sell Armor
//****************************************

INSTANCE DIA_Wolf_SellArmor (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 700;
	condition	= DIA_Wolf_SellArmor_Condition;
	information	= DIA_Wolf_SellArmor_Info;
	permanent	= 1;
	description = "��� ����� ������ �������.";
};                       

FUNC INT DIA_Wolf_SellArmor_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Wolf_Hello)) 
	&& (!Npc_KnowsInfo(hero, Info_Wolf_ARMORFINISHED)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_SellArmor_Info()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //��� ����� ������ �������.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //������ �� ���� �� ���, � ������ ������ � ���� ���, ��� ��������.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //������ � �� ���� ������� �� ����. ���� ��� ������ �������, ���� � ������ ������� ������.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //� ���� ������ ������� ������.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //��� ���� �� ������ �� ������� ������.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //������� ������. ������ �� �����, ��� �� ���, �� �� ���� ������ ���� ��������.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //�� �������� ������� �������?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //��� ���� �� ������ �� ������� ������.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //���� ������ ������� ���� �� ����� ���������. � ��� ����� ����, �, ��� ������, �� ��� ��� ���.

		B_GiveInvItems		(hero, self, ItMinugget,VALUE_ORG_ARMOR_H);
		
		CreateInvItem 		(hero,ORG_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

/*------------------------------------------------------------------------
							BOGENSCHIESSEN	DAS ANGEBOT							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINOFFER (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINOFFER_Condition;
	information		= ORG_855_Wolf_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ���� ��������� �������� �� ����."; 
};

FUNC int  ORG_855_Wolf_TRAINOFFER_Condition()
{	
	if( Npc_GetTalentSkill (hero,NPC_TALENT_BOW) != 2)
	{
		return TRUE;
	};
};

FUNC void  ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //� ���� ��������� �������� �� ����.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //� ���� ������� ����, �� �� ���������. ��� ���� ����� �� ���-�� ����.
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //������� �� ������?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //������ ��� ���� ����� 50 ������ ����, � ���� ����� ���������.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"��� ���� ����� ������� ���� �������� �� ����.");
	
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAIN_Condition;
	information		= ORG_855_Wolf_TRAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50); 
};

FUNC int  ORG_855_Wolf_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //����� ���� �������� �� ����.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //���� �������� ������ �� �������� ��������. ��� ����� �� �������� �����, ��� ������ ����� ���� ��������.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //��� ����� �� ������� �������� �� ����, ��� ������ ����� ����������, �� ������� �� ������� �������� ���� ����. �� ������ ��������� � ��, � ������, ����� ����� ������� ��������.
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINAGAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINAGAIN_Condition;
	information		= ORG_855_Wolf_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_2,	LPCOST_TALENT_BOW_2,50); 
};

FUNC int  ORG_855_Wolf_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //� ���� ��������� ����� �������� �� ����.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //�� ��� ������� �������. ���� �������� ������� ��������� �����������.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //�� ������ ��������� ��������� ��������������, �� ���������� ��� ���, ��� ������ � ��������� ������.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //������� �����: ������������� ���������� �� ����, �������� ������, ���� ��������� ������ - � ������ ����� � ����. ���� ������ ����������.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //������� �� ����� ������ ������. ������ ������� ����� ��������� ���� ������ �� ��������.
			
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
}; 
//---------------------------------------------------------------
//     					 DEX
//---------------------------------------------------------------
INSTANCE ORG_855_Wolf_Teach(C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 100;
	condition	= ORG_855_Wolf_Teach_Condition;
	information	= ORG_855_Wolf_Teach_Info;
	permanent	= 1;
	description = "�� ������ ������� ���� ����-������?";
};                       

FUNC INT ORG_855_Wolf_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //�� ������ ������� ���� ����-������?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //�������� ��������, ��� ������� ���� �������� ������ � �����.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"��� ���� ����� ������ ��� ��������� ��������.");
	log_wolftrain = TRUE;
	};
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
};
func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0) ,ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


//---------------------------------------------------------------------
//	Info GOOD
//---------------------------------------------------------------------
INSTANCE Info_Wolf_GOOD (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_GOOD_Condition;
	information	= Info_Wolf_GOOD_Info;
	important	= 0;	
	permanent	= 0;
	description = "���� ������, ��� �� ������ ���������� �� ����.";
};                       

FUNC INT Info_Wolf_GOOD_Condition()
{
	if	Gorn_GotoWolf
	{
		return TRUE;
	};
};

func VOID Info_Wolf_GOOD_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //���� ������, ��� �� ������ ���������� �� ����.
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //���, ��� �� ������ �� ��� ����� ������.
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //����� ����� ������?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //����� ������ � �� ����� ��������� �����.
	};
};

//---------------------------------------------------------------------
//	Info SPEAK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SPEAK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SPEAK_Condition;
	information	= Info_Wolf_SPEAK_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ��� �� ������?";
};                       

FUNC INT Info_Wolf_SPEAK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_GOOD)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SPEAK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_01"); //� ��� �� ������?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //� ��������, ��� �������� �������� ����� ��������.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //��? � ���?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //����� ������� �������� � ������� - ������� ��������. 
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //�������, �� ��� ������ ���������, ������� �������� � ����� ������...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //...���. � ������ � ������ ��������, � ���, ��� ����� � ����� �����.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //�� ������� ����� ���������� �������. �� �� ����� ������� ������.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //���� �� ��������� ��� ���� ���� ����� �������, � ���������� ������� �� ���� ������.
};

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SKIN (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SKIN_Condition;
	information	= Info_Wolf_SKIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� �������� ��� �������� � �������� ��������?";
};                       

FUNC INT Info_Wolf_SKIN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SKIN_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //��� �������� ��� �������� � �������� ��������?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //�������� ������. ������� �������� ����������� � �������� �������� ������ �� �����.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //�� ����� �������, ����������� ����� ������ ���.
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //� �����! ���������, ����� �� � ����� ��� ��������.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("�����: ������ ��������� �������", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,	"��� �� ����� ���� �� ������ ������ ��������� ��� ������ ��������� �������� ��������, �� ������� �� ������ ������� ������. �� ��������� ���, ��� �������� ��� ��������."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"����� ������ ��������� �������: ������-����.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info PROFIT
//---------------------------------------------------------------------
INSTANCE Info_Wolf_PROFIT (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_PROFIT_Condition;
	information	= Info_Wolf_PROFIT_Info;
	important	= 0;	
	permanent	= 0;
	description = "� �� �������� ��� ��� ���, ������ �� ������ ������?";
};                       

FUNC INT Info_Wolf_PROFIT_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_PROFIT_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //� �� �������� ��� ��� ���, ������ �� ������ ������?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //��, �� ������... ���� � ���� ��������� ������� ������ �� ���� �������, �� � ������... ������... �, �����, ������ �� ����!
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESFEW (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESFEW_Condition;
	information	= Info_Wolf_MCPLATESFEW_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ����� ��������� ������� � �������� ��������!";
};                       

FUNC INT Info_Wolf_MCPLATESFEW_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) > 0)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) < 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //� ����� ��������� ������� � �������� ��������!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //���, �� ������� ����! �� �� ������ �� ������� ������!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //������ ��� ���!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESENOUGH (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESENOUGH_Condition;
	information	= Info_Wolf_MCPLATESENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ������ �������� ���� ������ ��������!";
};                       

FUNC INT Info_Wolf_MCPLATESENOUGH_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) >= 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESENOUGH_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //� ������ �������� ���� ������ ��������!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //�������! � ������� ���� ����� ������!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //��� ������ ����� �������?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //�� ����. � �� ������� ��� �� ����������� ����� ��������.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //������ �� ���, ����� � ���� ����� �� ��� �����.

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,	"� ����� ����� 15 ��������� �������. �� ������, ��� ��� ����� �����. � ����� � ���� �����.");
	B_GiveXP			(XP_DeliveredMCPlates);
	
	B_GiveInvItems	(hero, self, ItAt_Crawler_02,	15);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORINWORK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORINWORK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORINWORK_Condition;
	information	= Info_Wolf_ARMORINWORK_Info;
	important	= 0;	
	permanent	= 1;
	description = "��� ������������ ������������ ��������?";
};                       

FUNC INT Info_Wolf_ARMORINWORK_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	!= LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORINWORK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //��� ������������ ������������ ��������?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //���� ���� �� ��� ������, ��� �������� ��. ��� �������� ����� �� ��������� ���������, � � ��� �� ��������, ��� �� ����� �������� ����� �����.
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //��� ����� ��� ������� �������. �� � ���-������ ��������!
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORFINISHED (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORFINISHED_Condition;
	information	= Info_Wolf_ARMORFINISHED_Info;
	important	= 0;	
	permanent	= 0;
	description = "�� ���, �� ��� ������ �������?";
};                       

FUNC INT Info_Wolf_ARMORFINISHED_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	== LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //�� ���, �� ��� ������ �������?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //� ��������, ��� �������� ��������. � ���� ����������.
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //��� ������, ��� ������� ��� ������?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //��, �������. ��� ���. ��� ������� ���� �������� � ����� ������, ��� ����� �����.
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //�������. � ���� �������.
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //�, �� ����������! � ������ ����� ������ ����� ����.

	B_LogEntry			(CH4_MCPlateArmor,	"������ �����. �������� ������, � ���� �� ��� ������ ������, ������� � �����-���� �����.");
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_SUCCESS);

	B_GiveXP			(XP_GorMCPlateArmor);

	CreateInvItem		(self, CRW_ARMOR_H);
	B_GiveInvItems      (self,hero,CRW_ARMOR_H,1);
};

/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  Org_855_Wolf_SELLBOW (C_INFO)
{
	npc				= Org_855_Wolf;
	condition		= Org_855_Wolf_SELLBOW_Condition;
	information		= Org_855_Wolf_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ����� ��������� ������� ����?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //��� ����� ��������� ������� ����?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //�� ������ ����, ���� �����. �� ������ ������ � ���� ������� ���, ���� � ���� ���� ����.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"��� ���� ������� ����.");

};  





