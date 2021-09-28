// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 999;
	condition		= Info_Kharim_Exit_Condition;
	information		= Info_Kharim_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kharim_Exit_Condition()
{
	return 1;
};

func VOID Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "� ����� �������. �����, ��� ��?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //� ����� �������. �����, ��� ��?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //� �����. ��������, �� ������ ���� �������, ����� �� �� ��� ���� ����.
	AI_Output (self, other,"Info_Kharim_What_09_02"); //� ������ ���� �� ����, ���� ����������� � ���� ������.
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 2;
	condition		= Info_Kharim_Charge_Condition;
	information		= Info_Kharim_Charge_Info;
	permanent		= 1;
	description 	= "� ������� ���� �� ���! ������, �������� �� �����!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //� ������� ���� �� ���! ������, �������� �� �����!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //��?! �� � �� ���� ������� ����� �� �������!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //����� ������ �� ���� � �����, ���� � �� ���������!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"������, ������, � ��� ����� ��� �����."					,Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"��� �� �� ���������� �����, ����?!"	,Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //������, ������, � ��� ����� ��� �����.
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //��� �� �� ���������� �����, ����?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //�������� ���-������ �������!
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"�� ������ �������� ���� ����������� ����� �������!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"����� ��� ��� ���� �������: ���� ���� ���� ������ �� ����..."									,Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"� �� ���� ��������� ������, ��� ���� �� �������� ������ ������."				,Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"���� ����� ����� �� ���� �� � ����� ��������� � ����� �����."	,Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"������, ������, � ��� ����� ��� �����."													,Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //����� ��� ��� ���� �������: ���� ���� ���� ������ �� ����...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //�������, �� �� ������...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //�� ������ �������� ���� ����������� ����� �������!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //���?! �� ��, ������! �� �� ������ � ��� �� ������! ����� ������ �� ����������� ����� �������!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //�, ����� ����, � ����� �� ����� �������: ��� ������� �������� ���� �� ����� �������, ��� ��!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //� ������������� ����� ���� ��� ������! ����� ���� ���!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //�������� ������: � �� ���� ��������� ������ ������, ��� ���� �� �������� ������ ������.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //����� ����, ���� ����� ����������� ��� ���?
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //��, ������� � ����� �������� �������� �������� �� ���� ����� �����, �� ����� � ������ ���� ������� ����.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //�����, � ��� ���� ��� ���� ���� �������� ������ ��� ����� �������!
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1)				// Kapitelfix ***Bj�rn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //���� - ��� ��������� ���� ����!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //�����, ����� ������ �� ����...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
