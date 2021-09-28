/*
-------------------------------- Die Mission ----------------------------

Die Freemine Mission. 
Der SC metzelt sich durch die FM und findet dort einen Orc, welcher schwer
verletzt ist und einen Orcischen Heiltrank braucht. 
Alls Gegenleistung f�r den Heiltrank sagt er dir was man alles f�r Items
f�r das Ulu-Mulu braucht.
Wenn man ihm die drei Teile bringt bastelt er dir das Ulumulu.

--------------------------------- Die Items -----------------------------
OrcHeiltrank:			Orcmedicine			-> OrcGegengift	
	
Teil vom Ulu-Mulu (1)	ItAt_Waran_01		-> 	Flammenzunge
Teil vom Ulu-Mulu (2)	ItAt_Shadow_02		->	Horn eines Shadowbeast
Teil vom Ulu-Mulu (3)	ItAt_Swampshark_02	->	Z�hne des Sumpfhais
Teil vom Ulu-Mulu (4)   ItAt_Troll_02		->	Hauer eines Trolls

Ulu-Mulu				Ulumulu				-> Das Ulumulu

----------------------------------- ToDo ---------------------------------
-> Monsterhinweise m�ssen noch rein
-> Missionlogs basteln
-> Sprache �berarbeiten
*/


//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance Info_FreemineOrc_EXIT (C_INFO)
{
	npc			= FreemineOrc;
	nr			= 999;
	condition	= Info_FreemineOrc_EXIT_Condition;
	information	= Info_FreemineOrc_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
	
};                       

FUNC int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_FreemineOrc_EXIT_Info()
{
	if (!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))	
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_01"); //��� ����� ������!
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_02"); //���������� ������ �����!
	}                                                              
	else                                                           
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); //�������. � �����.
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_04"); //������ ������,  ����������!
	};
	AI_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
//	Info INTRO
//---------------------------------------------------------------------
instance Info_FreemineOrc_INTRO (C_INFO)
{
	npc				= FreemineOrc;
	condition		= Info_FreemineOrc_INTRO_Condition;
	information		= Info_FreemineOrc_INTRO_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output			(self, hero,"Info_FreemineOrc_INTRO_17_01"); //������ ����� ������! ������ �����!
};

//---------------------------------------------------------------------
//	Info WASPASSIERT
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASPASSIERT (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASPASSIERT_Condition;
	information	= Info_FreemineOrc_WASPASSIERT_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ����� ���������?";
};                       

FUNC int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASPASSIERT_15_01"); //��� ����� ���������?
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //������ ��������� ����� �������. ����� ������� ������� �������.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //������� ������� ������� ���.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //������ ������ ����. ������� ������� �� ������ ����. ������� ������� ������ ��� ���.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //����������, ������, ������ �����.
};

//---------------------------------------------------------------------
//	Info WASTUN
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASTUN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASTUN_Condition;
	information	= Info_FreemineOrc_WASTUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� � ���� ��� ���� �������?";
};                       

FUNC int Info_FreemineOrc_WASTUN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASTUN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_01"); //��� � ���� �������?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_02"); //������ ����� ������� ���������. ����� ������ �������.
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_03"); //����� ��������� �����?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_04"); //��� ��� �������� ������. ������ ����� ���������!
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_05"); //� ������ ���� ���������, �� ������ ��������. ������ �� �����!
};

//---------------------------------------------------------------------
//	Info OFFER
//---------------------------------------------------------------------
instance Info_FreemineOrc_OFFER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_OFFER_Condition;
	information	= Info_FreemineOrc_OFFER_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ����� ���� ���������!";
};                       

FUNC int Info_FreemineOrc_OFFER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_OFFER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_OFFER_15_01"); //� ����� ���� ���������!
	AI_Output			(self, hero,"Info_FreemineOrc_OFFER_17_02"); //������ ����� ������. ����������, ��������, ��� ������ �������!
	AI_StopProcessInfos	(self);

	B_Story_FoundOrcSlave();
};

//---------------------------------------------------------------------
//	Info CRAWLER
//---------------------------------------------------------------------
instance Info_FreemineOrc_CRAWLER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_CRAWLER_Condition;
	information	= Info_FreemineOrc_CRAWLER_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ����� ��� ���?";
};                       

FUNC int Info_FreemineOrc_CRAWLER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT)
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_01"); //��� ����� ��� ���?
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_02"); //���� ������� �����, ������ �� ����� �����.
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_03"); //��� ��� ���������! ��� ���� � ����!
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_04"); //��, ��������, ������ � ���� ��������!
};

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance Info_FreemineOrc_TONGUE (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TONGUE_Condition;
	information	= Info_FreemineOrc_TONGUE_Info;
	important	= 0;	
	permanent	= 0;
	description = "�� �������� ��-������?";
};                       

FUNC int Info_FreemineOrc_TONGUE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TONGUE_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TONGUE_15_01"); //�� �������� ��-������?
	AI_Output			(self, hero,"Info_FreemineOrc_TONGUE_17_02"); //������ ���� ����� � ���� ����� �����. ������ ������ �������.
};

//---------------------------------------------------------------------
//	Info SEARCHPOTION - Medizin noch nicht gefunden
//---------------------------------------------------------------------
instance Info_FreemineOrc_SEARCHPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SEARCHPOTION_Condition;
	information	= Info_FreemineOrc_SEARCHPOTION_Info;
	important	= 0;	
	permanent	= 1;
	description	= "� �� ���� ����� ���� ���������!";
};                       

FUNC int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)	
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SearchPotion_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //� �� ���� ����� ���� ���������!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //���������� ������ ���! ��������� ���� �����!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //������ ������ �� ��� ���! ������ ��������, ����� ������!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //����������, ������ � ���� ����!
	 
	AI_StopProcessInfos	( self );
};
  
//---------------------------------------------------------------------
//	Info SUCHEULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_SUCHEULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SUCHEULUMULU_Condition;
	information	= Info_FreemineOrc_SUCHEULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "�� �������� �� ������ ��-����, ������?";
};                       

FUNC int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if	Npc_KnowsInfo(hero, Info_FreemineOrc_INTRO)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //�� �������� �� ������ ��-����, ������?
	AI_Output		(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //��-��� ���� ���, ��� ������. ��-��� �������! ������� ����� ���� �����!
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //���� ���� ������, ��� �� ������ ������� ��� ���� ���-����.
	if (FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //�� �������� ���, ��� � �������� ����!
	}
	else
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //������ ����� ������. ��� ���������, ������ �������.
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //���������� �������� ���������, ����� ������ ��������!
	};
};

//---------------------------------------------------------------------
//	Info GIVEPOTION
//---------------------------------------------------------------------
instance Info_FreemineOrc_GIVEPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_GIVEPOTION_Condition;
	information	= Info_FreemineOrc_GIVEPOTION_Info;
	important	= 0;	
	permanent	= 0;
	description = "���, � ����� ���� ���������!";
};                       

FUNC int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)	
	&&  Npc_HasItems(hero,Orcmedicine)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_01"); //���, � ����� ���� ���������!

	B_GiveInvItems      (hero, self, Orcmedicine, 1); 	
	EquipItem			(self, Orcmedicine);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItemToState	(self, Orcmedicine, 1);
	AI_UseItemToState	(self, Orcmedicine, -1);

	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //���������� �� ������, ��� ������ ����! ���������� �������!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //������ ������ �����������!
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_04"); //������ �� ������ ���� ��� ���-����?
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //���������� �������� ������, � ������ �������� ���������� ����!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //���������� ����� ������, ���-���, �������� � ���-�����.
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //���������� ��������� ���, ����� ������ ������ ���-����!
	
	if	!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)
	{
		B_Story_FoundOrcSlave();
	};

	B_Story_CuredOrc	();
};


//---------------------------------------------------------------------
//	Info FIREWARAN
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN_Condition;
	information	= Info_FreemineOrc_FIREWARAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ����� ������?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN_Condition()
{
	if	(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN_15_01"); //��� ����� ������?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN_17_02"); //���� ���� ����! ���� ���� ������� ����! 
	
};

//---------------------------------------------------------------------
//	Info FIREWARAN2
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN2_Condition;
	information	= Info_FreemineOrc_FIREWARAN2_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ��� ������ ��� �������� �������?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN)
	&&	!Npc_HasItems (hero,ItAt_Waran_01)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN2_15_01"); //��� ��� ������ ��� �������� �������?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //�������� ������� ���� ����. ���� ������. ���������� ������ ������!
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //����� ����� ��� �������� ������� �� ����� � ����.

	B_LogEntry			(CH4_UluMulu,"������� ����� ���� �������� ������� ��� ������������ ���-����. ��� �������� ������� �� ������� ����� � ������� �������, �� �������� ������. �������, � ����� ���� ������ ���������� �� �������� �������.");
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� �������� ���-���?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //��� �������� ���-���?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //���� ��� ���������. ������ ���, ��� ���, �������, ��� ������.
	
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST2_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST2_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ��� ������ ����������?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if 	 Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST)
	&&	!Npc_HasItems (hero,ItAt_Shadow_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //��� ��� ������ ����������?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //���� � ��� ��� ������. �� ������ ����.
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //���� ����� �������. ����������, ���������!

	B_LogEntry			(CH4_UluMulu,"������� ����� ��� ��������� ��� ������������ ���-����. �� ������� ����� ��� ������� � ����� � �������. ��������� ��� ��������, ����� ������� ������ ������ ���������� ����� ������ � �������� ��������.");
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK_Info;
	important	= 0;	
	permanent	= 0;
	description = "��������? � ��� ���?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //��������? � ��� ���?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //���� ��� ����������. ����� ���� ��� ������, ������ ������� �� �������.
	
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK2_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK2_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ��� ������ �����������?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK)
	&&	!Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //��� ��� ������ �����������?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //����� �����������, ��� ������ �����. ��� ������, ��� ������, �������!

	B_LogEntry			(CH4_UluMulu,"��� ������������ ���-���� ������� ����� ��� ����������. �� ������� �������� ����� ��������� ������� ���� ������."); 
};

//---------------------------------------------------------------------
//	Info TROLL
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL_Condition;
	information	= Info_FreemineOrc_TROLL_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ����� ���-�����?";
};                       

FUNC int Info_FreemineOrc_TROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL_15_01"); //��� ����� ���-�����?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL_17_02"); //���� ��� ������� ������! ������ ������� ����� � ������!
};

//---------------------------------------------------------------------
//	Info TROLL2
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL2_Condition;
	information	= Info_FreemineOrc_TROLL2_Info;
	important	= 0;	
	permanent	= 0;
	description = "��� ��� ����� �������?";
};                       

FUNC int Info_FreemineOrc_TROLL2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL)
	&&	!Npc_HasItems (hero,ItAt_Troll_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL2_15_01"); //��� ��� ����� �������?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_02"); //������ ����, ��� ����! ������ ������ ����� �����!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_03"); //���������� ������ � ����� �� �����! �� ������� ������� �������!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_04"); //����� ����� ����, ���������� ������ � ����!

	B_LogEntry			(CH4_UluMulu,"��� ������������ ���-���� ������� ����� ��� ������. ��� �������� ������� � ����� �� ������ �������. ��� ����� �������� �������� ������.");
};

//---------------------------------------------------------------------
//	Info LOOKINGULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_LOOKINGULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information	= Info_FreemineOrc_LOOKINGULUMULU_Info;
	important	= 0;	
	permanent	= 1;
	description = "� ���� ��� �� ������ ���, ��� �����.";
};                       

FUNC int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if	!Npc_HasItems(hero,ItAt_Waran_01)
	&&	Npc_HasItems (hero,ItAt_Shadow_02)
	&&	Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	Npc_HasItems (hero,ItAt_Troll_02)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output 			(hero, self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //� ���� ��� �� ������ ���, ��� �����.
	AI_Output 			(self, hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //���������� ������. ������ ����� �����!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info EVERYULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_EVERYULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_EVERYULUMULU_Condition;
	information	= Info_FreemineOrc_EVERYULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "� ������ ���, ��� ����� ��� ���-����!";
};                       

FUNC int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_RUNNING)
	&&	 Npc_HasItems(hero,ItAt_Waran_01		)
	&&	 Npc_HasItems(hero,ItAt_Shadow_02		)
	&&	 Npc_HasItems(hero,ItAt_Swampshark_02	)
	&&	 Npc_HasItems(hero,ItAt_Troll_02		)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //� ������ ���, ��� ����� ��� ���-����!
	AI_Output			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //���������� ���� ������� ����! ����� ����! ������ �������� ���-����!
	AI_Output 			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //���! ���������� ������ ���-���� � ���� ������! ������ ������ �����!
    
    CreateInvItems      (hero,  ItAt_Waran_01, 3);
	B_GiveInvItems	    (hero, self, ItAt_Waran_01, 4); //Notwendig f�r Ausschrift "4 Gegenst�nde �bergegen", wird sofort ausgeglichen
	Npc_RemoveInvItem	(hero, ItAt_Shadow_02		);
	Npc_RemoveInvItem	(hero, ItAt_Swampshark_02	);
	Npc_RemoveInvItem	(hero, ItAt_Troll_02		);
	
	Npc_RemoveInvItems	(self, ItAt_Waran_01, 4);    
	 

	B_Story_GotUluMulu	();
	
	AI_StopProcessInfos	(self);
};





