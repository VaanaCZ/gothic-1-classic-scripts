// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //�! ���-�� ���������!
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //��� ���� �����?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //� ���� ���������� ���� ������. �� ����� ���������, � ������� ������ �������� � ������������... �� ������ �������� �� �� ����� ��������� ����.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //����� ������ ������ ����, ������! ����� ���� �������� �� � ���.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"� ��� ���� � �������� �������?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"� ��� � ������ �� ���?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"��� ������ ������. � �� ������ ������ ������ ���.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //��� ������ ������. � �� ������ ������ ������ ���, ���� � ���� ��������� ��������.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //���� � ���� ����������, ������ �� ���� ������������. ���� ������ ����� ����� ����� ������ � ������ ��������.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //������ ����� �������� ������� � �������.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //��, ���� �� ��������� ��������?! �����������, ����� � ���� ����� ����!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //� ��� � ������ �� ���?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //���� �� ���������� �� ���� ����������, � ���� �������� ����.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //���� � ���� ��������� �������� � ���-������ �� ������ ������ ��� �������� �������� ������ ����������� ���� �� �����, ������ �� ���� ������������.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //���� ����������� � ���-������ �� ���������, �� ������� �� ������� ����, ��� �������� - ������, ��� ��� ������.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //� ���� �� ��� ��������?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //����� �� ������ ����� ������ � ��������. �� ����� ����� ���������.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //� ��� ���� � �������� �������?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //��, ������, �� ���������� ���! �� ����� ��� �������, ���� ������ ��������� ������. � �� ���� �� ���� ������ - ������� ����, ���������, ����� ������ �����.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //�� ������ ������� ��� ����� ������, �� ����� � ���� - �� ����� ������������ �� ��� ������ �� ��� ���, ���� �� �� �������� ��� ���������� � �������� ���������.
	Info_AddChoice		(Info_Jackal_Hello,"��� ��������.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //��� ��������.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //�� ������ ������ ����!
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "� ��� ������� � ����� ����������� - ��� ������ ������ ����.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //� ��� ������� � ����� ����������� - ��� ������ ������ ����.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //�� ������ ���������� �����, ������! � ����� ������� � ���� ���� ��������!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //� ���-�� �� ���� ����, ������. �����������, ����� � ���� ����� ��� ���������.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "��� ����?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //�� � ��� ���� ����?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //�� ������ ������ ������������ �� ����, �����!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //� �����, �� ������ �������� �����! ��� �������, ������!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //��, �� ������ ��������! ��� ���� �� ��� ����������, ��� ������� � ������ ������!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //���� �� ������ ����������� � ����� ������������ - ����� �� �� �� ��� ��� ��� ���� ����� �� ���!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //��, �� ������ ��������! ��� ��� ����� ��� �� ������ ������, ��-�� �������� � ���������� ���� ���-���!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //���� �� ����� �� ���� ������� ��������� �������, ������ �� �� ��� �� ����� ������� - �� ������� �����������!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //���, �� ������ ������� �� ���. ��� ������ �� ��������� ������.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //�� ������� � ����� ���������� ��� �����, ��� � � ���� ���� ������� �����!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //���� �� ����, ������� �� �������� ��� �� ������, ������ ���� �� �������.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //���� ������ ��������� ���, ���� � ���� ��� ���� ����� �����������.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //�� ��������! ���� �� ������ �������� �� ����!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //� ��� �� �����, ��� ���������� ��� ������ �����. ����� ���� ��� �� ��������, ������!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //��, �����! ����� ���!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

