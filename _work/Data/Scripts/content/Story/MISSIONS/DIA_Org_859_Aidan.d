// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "��� �� ����� �������?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //��� �� ����� �������?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //� �������. ������� ����� � �����, ��� � ����.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //�� ��� ������ ������?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //��, ����� ������� ������������, ���� �����, ��� ����������� ������.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,	"�����, �������, ������� ����� ������ � ����� ��������, ����� ������� ���� ����������� ������.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "� ���� ��������� ��������� ����������� ������.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //� ���� ��������� ��������� ����������� ������.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //� ���� �� ������ ���������?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures, "������ ������ (����: 1 ���� ��������, 50 ������ ����)" 		,Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "������ ���� (����: 1 ���� ��������, 100 ������ ����)"			,Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "������ ������ (����: 1 ���� ��������, 50 ������ ����)" 		,Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "������ ���� �������� (����: 1 ���� ��������, 100 ������ ����)"	,Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //� ������ ���� �����, ��� ���� ���.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //��� �������� �����?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("�����: ������ ������", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //�� ������ ������� �� ���, ����� ����� �� ���������. ����� ����� ��������, ��������� ����� ������ ���.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //����� ����� ��������� ����� ������, ������� � ����������.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ������: ����, ������ ������, �����, ����, ���-��������, ��������.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //������� ������� ���. ��� ���������, ����� ���� ����.
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //��� ������� �����?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("�����: ������ ����", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //����� �����, ��� �������� ����������� ���� ������� � ������. ����� ����� ������ �������, ������� ������� �� ��������� �� ��� ������.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //�� ���� ������ � ���������� ���� ������� ������. � ��������� � ���� ������ ������ ������������, ������� �� ��� ���� ����� �� ������ ��� ���.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ����: ����, ������ ������, ��������, ������.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //������� ������� ���. ��� ���������, ����� ���� ����.
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("�����: ������ ������", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //����� ���� �������� �����.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //��� �����, ��� ������� �� ������ ������. ����� �������� ������ ������, �� ��� ���� �� �������� ��� ��������� � �� �������� �����.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //�������, ��������� ����� ����� ������ �� � ������� �����. ������ � ���� ���� ����� ������.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ������: �������, �����, ����, ����, ����.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //������� ������� ���. ��� ���������, ����� ���� ����.
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("�����: ������ ���� ��������", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //��� ��� ����� �����, ����� �������� ����� ��������?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //��� ����� �������� �� ������ ��������, � ���� ����� � ����������.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //���� �� ��������� ����� �� �����, �� �� ������� ����� �� �����. ������ �� ������� ����� ����������� � ���� �������.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"����� ������ ���� ��������: ����, ���������.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen	("������������ ����� ��������!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //������� ������� ���. ��� ���������, ����� ���� ����.
	};
};
