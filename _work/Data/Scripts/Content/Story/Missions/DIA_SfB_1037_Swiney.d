// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "��� ��?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //��� ��?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //� ������ ��������� � ���� ��������� �������. 
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //���� �� �� �, �������� ����� ��������� ����� �� �������� ��� ��������. ���� ��� �� ����� ������, ��� �� ����� ������ ������.
};

// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "� ���� ����� ���������, ����� ��� ��.";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //� ���� ����� ���������, ����� ��� ��.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //�� �� ������? �� �����, ��� ��� ���������� �����. ��� ������ ���� � ����, � ��� ��������� ����� �������� ������.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //�� ������ ������, ������ �� �����? �� ��������, ��� ���� ������ ������� ��� ������������ �� ����� �����.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //��� ������� ���� �� ���������� � ����� �����. ��� � ����� ������ �� ��� �������� 50 ������ ����, ����� ��������� ��� �������.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //��� ����� ������, ��� ���� ������� �����.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //�� ���� �����-������ ���� � ���� �����?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer, "���."	,Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "��." 		,Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //��.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //������! ����� �� ��� ������, ��� ����� ������. ��� ���� ������� ������. ����� ���� �������� ����� ������. �����!
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //���.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //�������, ���! � ������ �? ������. ������. ������ ��� ������� ������ � ������ �� ����� ������.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //���� �� ����� �� ��������, �� ����� ������ ������ ���������� ����. � ��� �� ���������� �� ����, �� ���. ����� ����� �� ���� ����� ������?
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //���-�� ���������� � ����� ���� ������ �����.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //������ �� � ��� ����� �� �����������, ��, ��� �...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "�� ��� ����� ���� �������?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //�� ��� ����� ���� �������?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //���� �������, ��� ����� ����� �� ����� ����������. �� ������� ������� � ����� ������ � ������� ���� ���� ������ �������.
	AI_StopProcessInfos	(self);
};


