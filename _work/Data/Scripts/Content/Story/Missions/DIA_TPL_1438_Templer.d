instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //��������.
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //�� ���������� ������!
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ������ ������ � �����?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //��� ������ ������ � �����?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //�� �������� �� ��������. �� ����� ����������� � ������ - ��� ����������.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "����� �� ��������� �� ��������?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //����� �� ��������� �� ��������?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //��� ����� �� �������. � �������� ����� ������ �����.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //����� ����� �����?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //��������. � ������ ��� ����� �����, ��� �������� �� ��� ��������.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ����� ��� �����?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //��� ����� ��� �����?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //��� ���� �� ����� ����������� ����� �� ���� ��������. �� ����� ��������� ����. �������, �� ���� ����� ������ ����� �����.
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //�� ������ ����� �����, �� ��� � �������. �� ������� ��������, ��������� ������� ���� ����������� ����� �������� �� ������. �� �� ������ ������� � ������! ��� ������ ����� ����� ����.
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //� ������� �� ����.
};  
//---------------------WENN DIE EIERSUCHE L�UFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "� ��� ������ ��������."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //� ��� ������ ��������.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //�������� � ��� �� �����, ��� �� ����� � ��� �� �����. ��� ����� � �������� ���� ������, ��� �.

	B_LogEntry		(CH2_MCEggs,"� ������� � ������ � ����� � ������ ����� � ������ ��������. �� ������� ���� � ������ �������: ��� �� ����, ��� �� ���� � ��� �� ����. ���������, ��� �� �� �������� ���������� ������������� ����� ������������ ����?");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ���������� ������� ��������?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //��� ���������� ������� ��������?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //��� �� ���-�� ������. �� � ���� ���� �������.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "��������� �������� ������� (1 ��. ��������)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //�� ������ ������� ���� �������� ������� ��������?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //������ ����� ����� ������� �������� ������. �� ���� ���������, ����� �� ��������� ������, - ����� ����� ������� ���� �� ����.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //��� ������ ���� ���������.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //��� � ����. �� �������� �����-������ ������� ����������, ����������� �������� �� ��������? �� ��, ��� �� ���� ��� �� ����, ��� �� �������� �����. �����, ���� ������...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //������� ������ ������ ������� �����, �������� �������� ������� ����������, � ����� ��������� �� ������ � ���������. ���� �������� ���, ��� � ������, ������� ���� �� ������.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"��� ������� ������� ��������");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("�������: �������� �������� ��������", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
