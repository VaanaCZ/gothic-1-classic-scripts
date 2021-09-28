// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"��� ���� �����?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //��� ��?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //� ��������, ��� ����� ����.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"��� ��� ����� ��������?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //��� ��� ����� ��������?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //��� � ������� ������� ������. ��� �� � ������� ���.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"� ���� ����� ����� ����� ����!";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //� ���� ����� ����� ����� ����!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //(�� ������) �� ��� ������, ��� �������!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //������ ��� �� �������� ������� �������������� � ���, �� ������ �������� ���� � �����-������ ������� ������.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //� �� ������ ������� ��� �����-�� �����.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //���� �� �������� � ����� ����������, �� ������ ����� ����� �� ����� ���������. ��� �� ������� ������� ���.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //� ����� ���� ������� ���� ������������ ���� ������� ���-�� �������.
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"� ����� �������������� � ����� ����?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //� ����� �������������� � ����� ����?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //����� ����� �� ����� ���������, � ��� ���������...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //����, �� ���� ����� �� ����� ���������. ����� ������, ����� ������...
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //������ ���� �� ��������...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //���� �����-������ ������� �� ����� ������ �� ������� ������?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //����� ����������� � ������ ����!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //���! ������! � ������������ �������� - ��� ������ ��������! �� ������ ���������� �� ���� ��������!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //�������!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //���� ��� �� ������� ����� ���������� � �������� �� ��������.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //�����, ��� ������ �� ����� ������ ������� ����� ����.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //�� ������ �� ������ ���������� � ���������! ��������!
	};
	AI_StopProcessInfos	(self);
};
