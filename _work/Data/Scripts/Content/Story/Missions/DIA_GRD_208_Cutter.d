//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "����� ������� �����.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //����� ������� �����.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //�������, ������ � ���� �� �����. �� ���?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //� ���������. ������ ����� ������� �����������.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 10;
	description = "�� ������ ���������� ��� � �����?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //�� ������ ���������� ��� � �����?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //����� ��������� ��� ����� ����� �� ����� ������.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //������ ����� ���� �� �� ������� - ��� � ���� �����.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //���� ����� �� ������ � ����������� � ����������� � ������, ����������� ����������� ����������� ��� ��������.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //������, ��� ������ ���� ����������?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //��, �� ������ ��� �������. ���� ���� ����� �� ��������� ����� ���������.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "������ ��� - ���� ����������?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //������ ��� - ���� ����������?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //�������� ����� ��������. �� ����� � ����� ������� � ������� ������ �������. ����� �� ����� ������� �� ���.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //�������.
	AI_StopProcessInfos	(self);
};

	














/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //�� ������ ���������� �����. ���� ���������� ���� ����������!
	AI_StopProcessInfos	(self);
};
