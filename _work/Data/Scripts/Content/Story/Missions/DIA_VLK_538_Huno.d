// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "������, �� ������ ������ ���� ����.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //������, �� ������ ������ ���� ����.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //���� ��� ����� �� ���������.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //�� � ��� ����� ����������? ����� ������� ������ ����� ���� ���, � ������� ���� ����� ������ �.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "������� ������� ������ �� ������������ ������ ����?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //������� ������� ������ �� ������������ ������ ����?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //������ ����� ����� ���. ������� � ����� ����������� �����������.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //��, ����������, ���� ���� ���� ����������.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //�� � ������, ����� ��������, ���������� ����� ������, ��� ���� ���������.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //������? �� ���� ������?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //��� ��� ��������. �� ��������� ��� �� �������� ��� 150 ������ ����.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //����� �������� ��������� � ������ ����� ������, � ��� ����� ��������.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //��, �� �� ���� ������ �� ��������!
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "��� ����, ������?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //��� ����, ������?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //���������, ������ �� �����������...
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //�����, � ���� ���� ��� ���� ������.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //� ����� ����? � ����� ��?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //� ��� �������.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //�����������, ����� ���� �� ����� ���� ���-�� �����������, � ��������� ����������� ��� �� �����.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "� �� ���� ����� ����� ����������.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //� �� ���� ����� ����� ����������.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //�� �� ������� �� ��, ��� �������� ������ ������� ������?
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //��� � ������ ������?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //���, ���� ��������� � ��� �� � �����.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //����� ������ ���������� ��������, ����� ��� �� ����������.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //������� ��� ����� �������� � ����� � �����, ����� �������� ������.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //�� � ����� �� ����������� ��� �� ��������� �����.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //�������.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //��� ����� ����� ����������� ����������� - � � ���� ������� �� ����.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "��� ����� �����������!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //��� ����� �����������!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


