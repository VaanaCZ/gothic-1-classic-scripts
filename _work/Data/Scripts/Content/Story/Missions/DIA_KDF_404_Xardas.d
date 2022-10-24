//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //��� ����� ��������� ���� �� ���� ������������?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //���� �����...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //�������, ��� ���� �����. � �� ����� ����� �����.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //������� ������ ��, ��� �� ��� ��� ����� ����� �� ���� ��������� ������� ����� ������. � �� ��� ������.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "��� � ���� ��������� � ������?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //��� � ���� ��������� � ������?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //��, �� �� ���� ����. ����� ��� ��� ���������, � �������� �� � ����� �� ���� ��������.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //��, �� ������ ������ ���� ���������.
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "���� ������� �������. ��� ����� ���� ������!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //���� ������� �������. ��� ����� ���� ������!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //� ����� ���� ���� ������ ����, � ���...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //���� ���� �� ����� �� �������!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //�� �������?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //���!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "��� ���� ����� ���� ������!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //��� ���� ����� ���� ������!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //����� �� ������� ������.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //�� �����������. � ���� � ������ ������, ��� ���� �������������� �������� �� �����, �������� ��������� �����, ������ ���� ��������.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //�������� � ������ ���� ���� ���������� ���� ������, ����� �������� ������ ��������� ������.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "���, ���� �������� ������, �� ����� ���� ���� �����.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //���, ���� �������� ������, �� ����� ���� ���� �����.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //�� ���� ������ ���� �� ��������� ��������.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //���� ���� ������ �������, ��� ��� ������� ��������� � ���������.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //��� ��� ����� ������, �� ����� �� ���� ������� ���� �� ������������, ��� ��� ������ � ������.
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "���� ����� ������ ���� �� ������ ������������� ��� ���������...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //���� ����� ������ ���� �� ������ ������������� ��� ���������...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //... ������ �� ���� ���������� ����! ������� �� ������ ������� �� ������, ����� ��������� ������.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //���� �� �������� � ������� ��������� ���� ����� �� �������� �������, � �� �� ���� ��������� �����, ��� �� ������ ����� ��, ��� ���� �.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //� ��� �� ������?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //�� ������� �������� ������� �� ���� �� ���������� ���������� ����� �� ���������� ������ ���� ������, ������ ������ ������ ����� �������� ��������.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "�� ���� ������� ����� �� ���� �����?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //�� ���� ������� ����� �� ���� �����?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //��� �, ���� ����� ������� � ������������: ����� ����� ������ ��� ������� �����.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //��� ������� �����?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //���� �� �������� � ������� ������. � ��� ���� ���� ��������, � �� ��������� ��� ����� ���������� � ������������.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //����� ��� ����� ���� �����-������� �������� ��������������� ������, ����� �� ������ �� ������� �������� ������.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //� ������ - ��� ����� ������?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //��� ��� ���� ���� ��� ������ ������� �����. �� ����� ��� ��� ������� � ������ ��� ���������� ����� ����� ����� ���, � �� ����.
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "�� � ������ ����� �� ������?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //�� � ������ ����� �� ������?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //��� �������, ��� �� �������... ���, � ���� ��� � ���� ���������, ������� ��� ���� ���� �������.
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //����� �������?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //������ ����: ���� �� ������� ��� ������ �� ������ �����.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "�� ��� ������?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //�� ��� ������?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //����� � ���� �� ����. ����-���, �������� ����� ��� �����, �� ����� ��� �������� �� ���� ������.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "� ��� ������� ����� ���-�� ������� � ���� �����-�������?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //� ��� ������� ����� ���-�� ������� � ���� �����-�������?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //��. �� ��������� ���� � ������ ��, ��� ��� ����������.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //��� �������, ��� �� ����� �� ���� �������������.
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //��� �� ������, ����� � ����� ���� ��� ���?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //�������, ����, ��...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //����� �� ������� ������ ����� ��������!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //����� ����� ������. ���� �� ������ ��� ��� �������� �� ����, ������� ��, ����� ����, ��������� � �����, ������ ��� �����.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //�� ���� ���������!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "��� ����� ����� ���������� ������?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //��� ����� ����� ���������� ������?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //��� �� ������ � ������ ��������. �� ���������� ����������. ��� ����� �� ������� ���� � ����� ���� ��������.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //� ��� ����� ����� ������ ���?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //��� ������ ���������� ���������, �� ����� ���� ��� ������ ���������. ��� ���� �������� ����� �����.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "� ��������� ������ � ������� � ����!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //� ��������� ������ � ������� � ����!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //��� ����� ��� ������� ���� ���� ������������, ������� �������� ���������� ������ ���������� � ������ ���.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //������� ��, ����� ���� ����� ����� ��������� ����.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "� ���� ������� ���������� ������."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //� ���� ������� ���������� ������.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "���-����� ������� �� ��� �������!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //���-����� ������� �� ��� �������!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //��, � ��� �� �� ���������?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //���� �������, ������� �������� �������, ��������� ��� ��������� ����, ���� � ������� ��������� � ������ �����.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //���������!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //�� ����������� ������ �� ������ � ������� ��, � ������� ����� �������� ���, ������ �� �������.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //�������, ������.
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //���� ���������� ���� � ����� ��������� ������, ����� ������������ ������.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //�� ��� ��������, ��� ����� ����� � ���� ����?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //��, ���� ���� ���. ��...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //����������, ��� ������������! ��� � ���� ��������� ����! ������ ��� �� ������� ������, ��� ��������� ������!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //� ���� �� �������!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //����� �� ������ �� ��� �� �� ���, ����� ������, ��� ���������� ������?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //��, ��...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //��� ���! ������� ����� ������� ���� �������� �������. ��� � ����� ��, ��� ������ ��������� ����!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ����, ��� ������� � ��������� ����!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //� ����, ��� ������� � ��������� ����!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //��� ������... �����������!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //�� ���� ����� �����! �������, ��� ���-���� �� ������� ������ �������.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //������ �����, �� � ���� ��� �����, � ������� ��������� � ������������ �����!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "�����������? � ��� ��?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //�����������? � ��� ��?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //� ������� ������ �����, ���������� �� ����, ��� ��� ��������� ����, ����������� '��������� ����'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //��������� ����?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //���, ��� ������ � �������� ��������� �������!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //��� ��� ��� ���������� � �����-�� ������� �����������? ��������, �� ����������!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //����� ����... � ����� � ���!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ����� ���� ����� �������� ���."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //� ����� ���� ����� �������� ���.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //������-�� ��� ���.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //���������... �� ��� �������� '�������'.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //� ��� ������ ������� �� ���� ����. ��� ������� ������, ������� ��������� ������ ��� �����.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //��� ������� �� ������������ ��� �������. ����� �� �����, ��� ��� ��� ����������.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //�����, �� �������� �������� �����, �� ������ � �� �������� � ��� ���������� �������.
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "������� �������� �������� �����?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //������� �������� �������� �����?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //� ������ ��������� � ���, ��� ���� ��� �������� ������� ����� ������ � ���������� � ����� �������� �����������.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //��� ����� ����� ������ ������� � �����?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //������-����� ���� ������ �������� ��� � �������� �����. ��� �� ����� ��� ������������, ������� ��� ��� ������ ��������.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //��� �� �� ��� ������, ��� ������!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ����� �� ������������ ���� ����� ����?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //� ����� �� ������������ ���� ����� ����?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //��, �� ���� ����� ����� ����� ���������� ������� �������� ���������� �������.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //����� �������, ��� � ��� ������� ����� ���� �� ���������� ������?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //��, ��������, �����...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //����� ����, ����� �������� ������ ����������, ������� �������� ������ ������� ����� ���������.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //� ����� ��� ��������, �� ��� ����� ��� ����������� �����.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "� � ���� ����� � ����� ���� ������� �������."; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //� � ���� ����� � ����� ���� ������� �������.

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //���� ������ �� ��������� ������� �������� ������ ��������� ����� ����� � ��������� �����.
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //��� ����� �������� ������ �� ������ ���� ��������. �������� ����� ����� � ��������� �����.
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //����� ����� � ������� � ��������� ����� ��� ������� ������ � ����������.
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //�������� ����������� ��� ������ �����.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //���� ������ �����?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //�� ����� ������ �� ������������� ��� ����������� � ���� �� ���� �� �������. �� ����� �� ��� ��� ����� �� ����.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //��� �� ������ ����� ��������� ���������. � ���� �� ���� ������� ������� ��.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //��� ���� �������?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //����� ������������� � ��� �� ���� �� ���, ���� �������� �������� ��� ������.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //��� ���� ���� ������ ���� �����������. �� ��������� ���� �� ��������, � ������� � ������ ����� ������ ����.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //�, �� ����� �������� �������.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //����, ���� ������� ����� �������� �������.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //��, � ����� �� � ����� �� �������� � ���������� �����.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //�� ����������� ���� �����, ������� �������� � �������� ������ �����.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //�������, � ���� ����� �������, ��� ��.
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ������� ���������� ��� �������� ������� ������ ���� �������?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //�� ��� ������� ���������� ��� �������� ������� ������ ���� �������?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //��, ��� ��� ������. �� ���� �� �� ������� ��� ��������.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //������?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //��� ������ ��������� ������� ���, � �� ����� ��� �� ������ ������� ��� ��� ���������� �������.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //��� �, ��� �������� ����� ����, ��� ������ ��� ������.
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //������ ���������� � ����� ���� ��� ��� ����� ����. ��� ���� �����������!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ��� ��� � �� ����� ������������ �������!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //�� ��� ��� � �� ����� ������������ �������!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //� ���� ���� ������...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //�� ������� ���������� ���� ����. ����� � �������� ���� �� ����.
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ������� �������!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //� ������� �������!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //����������! ��� ����� ����� �� �����, ��� � � ���� ������ ��������. ������ � ���� ���� ���� �� ����� ������ ����� � ����!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige L�sung f�r�s Ich-brauch-Orc-Statue-Massaker ***Bj�rn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� �������, ��� � ����� ������������ �������, ���� ������ �����."; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //�� �������, ��� � ����� ������������ �������, ���� ���� ���� �����.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //�������� �� ����. ��� ����� ������ ������ - ����� ��������� ������ �� ������.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //�� ������ � ���� ��� ���� ����.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //���� � ���� ���� ������, � ����� ������� �� ���� ����, ������� ����� �������� ����� ���������� ����.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //���������� ���� �� �������?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //��� ���� ������� �������� ����� ������ ��� ��, ��� ��� ������ �� ���.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //�� ���� ���� �������: ���� ���� ������� ����� ����� ������������ ����� �������������� ����!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "������, ������ ������ �� �������!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //������, ������ ������ �� �������!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //�� �� ��� �� �������� � ������ ���� �����!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //��� ����� ����������� ��������� ����. �� ������������� ������, ����� � ����� ������?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"��, � ���� �����!"				,	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"���, �� ����� ����� ������!"	,	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //��, � ���� �����!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //� ������, ��� �� �������. ���, ������ ��� � ����!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items �bergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,	"������� ������� ���������� ������ �� ���� �������. ������ ��� ���� ���� �������� � ����, ��������� �� ����� �����.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //���, �� ����� ����� ������!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //�� ����� ���. ����� ��� �������� ���� ���������� ����.
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//�� ������ ������� ���� ����-������?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //� ������� ���� � ����� ������� ����� �����.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //���� ��, ��� ������ ���������� ���� ����� ������ ���������� � ������ ����. ��� ������ ������� ��, ��� ����� ��������� ������ �����.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //���� ���� - ����������� ������.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //������� �������� ������� �����, �� ������� ������ ���������� ����� ����.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //�� �� �������, ��� �� ����� ������ ����, � �� - �����.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() �bergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem f�r Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//���, �� ��� �� �����. � ���� ���� ������, �� �� ������� �����. ��� � ��������, �� ������� ����.
		
		AI_StopProcessInfos	( self );
	};
};

	
