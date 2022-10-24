
//-------------------- Intro ---------------------------

instance DIA_SLD_752_OKYL_INTRO (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INTRO_CONDITION;
	information		= DIA_SLD_752_OKYL_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_752_OKYL_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 250)
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //��, ��! ������ � ���� �� �����. ��� �� ����� �������?
};

//-------------------- Exit -----------------------------

instance DIA_SLD_752_OKYL_EXIT (C_INFO)
{
	nr				= 999;
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_EXIT_CONDITION;
	information		= DIA_SLD_752_OKYL_EXIT_INFO;
	important		= 0;
	permanent		= 1;
	description 	= "� ������ �������!";
};

FUNC int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //� �����, �����?
	AI_Output (self, other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//��� � ���������. ��� ����.
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_752_OKYL_UMSEHEN (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_UMSEHEN_CONDITION;
	information		= DIA_SLD_752_OKYL_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "� ������ ���� ������� ����������.";
};

FUNC int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //� ������ ���� ������� ����������.
	AI_Output (self, other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//����� ����� �� ���, ����� �� �������� � ������������, ����� �� ��������� � ������ ������, ��� ������� �������� �� ����. 
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information		= DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "��� �� �����?";
};

FUNC int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //��� �� �����?
	AI_Output (self, other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//� ����. � ����� �������.

};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INMINE_CONDITION;
	information		= DIA_SLD_752_OKYL_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "� ����� ������ ����������, ��� ��� � ��� � �����.";
};

FUNC int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //� ����� ������ ����������, ��� ��� � ��� � �����.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//�, ������ ��������� � �����.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//������, �� ���������� �� � ��� �� ������������. ����� �� ����� ������� � ����� ��� ����� ����������.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//������ ��� ���� �� ����. ���, ��� ������� � ����� ��� ����� ��������, ����� �� ��������!
};

//----------------------- Erlaubniss kriegen -------------------------

instance DIA_SLD_752_OKYL_PERMIT (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_PERMIT_CONDITION;
	information		= DIA_SLD_752_OKYL_PERMIT_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "� �� ������ ��������� ��� ����� ����?";
};

FUNC int DIA_SLD_752_OKYL_PERMIT_CONDITION()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_752_OKYL_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_PERMIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//� �� ������ ��������� ��� ����� ����?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//� � ���� �� ����, ��� ��. ������ � ������ ������ ���� ����� ����������?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//� ������, � ���� ����� ���. ����������.
	AI_StopProcessInfos (self);
};
