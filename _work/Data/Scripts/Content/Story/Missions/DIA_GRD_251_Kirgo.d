// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_What_Condition;
	information		= Info_Kirgo_What_Info;
	permanent		= 0;
	description 	= "������! � ���������.";
};                       

FUNC INT Info_Kirgo_What_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func VOID Info_Kirgo_What_Info()
{
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //������! � ���������.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //�������! �������� ��� ���-������ � ������� ����. � ��� ����� ����� �� ������� ������ ������� ��������.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //� �����. � �������� � ���� �� �����.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Good_Condition;
	information		= Info_Kirgo_Good_Info;
	permanent		= 0;
	description 	= "� ��� �������� ���� ���?";
};                       

FUNC INT Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Good_Info()
{
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //� ��� �������� ���� ���?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //��� �� �����? � ������ ������� ����� ���� ����������, �� �� ���� ��� ���� ���� ������!
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Charge_Condition;
	information		= Info_Kirgo_Charge_Info;
	permanent		= 0;
	description 	= "� ������� ���� �� ���! ������, �������� �� �����!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1))	// Kapitelfix   ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //� ������� ���� �� ���! �������� �� �����!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //���? �� ������ ��� �� ������� �������. ������ ����� ������ ����, � �� ���������� ���, ��� �������� � �������.
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"���! � ���� �������. ������!"		,Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"�����, ����� ������ ����! "						,Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //���! � ���� �������. ������!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //��� ���������... � �����, �����, ����� ��������.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //�����, ����� ������ ����! 
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //��� ����!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //�������! �����, � �� ������� ����� ����� ���������� � ������� ����. ���� ��� ������ ������� � ���, ����� ��� ��� ��������� ����.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //����... ��, ��� �... ��� ��������, ������� ��� ������ ������� � ���, �� ��������� ����� �������.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //���������� �������� ����� � � ����������.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //����� ���� ������� � ����� �� ���?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //� ����, ����� ��� ��� ������ � ������.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //�� ������, ��������? ��, �� ���� �� ����� ����������� ����� �������� ������...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //�� ���� �� ������������� ������ ���������� ��� ����������, �� ������ �������� ������. ����� ������, ���� � ��� �� ����������!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //���� �� ��� ��� ������ ��������� �� ����, ����� ���. �� ��� �� ����� ������� �������� ����.
	
	CreateInvItem (other, ItFoBeer);
	B_GiveInvItems (other, self, ItFoBeer, 1);
	
	self.npctype = npctype_FRIEND;
	
	Info_ClearChoices	(Info_Kirgo_Charge );
};

// **************************************
//				Fordern REAL
// **************************************
	var int Kirgo_Charged;
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_ChargeREAL_Condition;
	information		= Info_Kirgo_ChargeREAL_Info;
	permanent		= 0;
	description 	= "�� ����� ���������, �� �����?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Bj�rn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //�� ����� ���������, �� �����?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //������ �� ����!
	
	AI_StopProcessInfos	( self );
	
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ( (Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 1)			//Fix f�r sp�tere Kapitel ****Bj�rn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //����, ������. ����� ������� ����������!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //����� ������� �� ���� �����, �����?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















