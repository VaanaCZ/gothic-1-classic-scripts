// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "��� �� �����������?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //��� �� �������?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //������� ������� �����, ������.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //���, ������ ������. ������ �� ������ ������.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "��� ���� ����?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //��� ���� ����?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //� ���� �������� � ����� ������. ����, ������� �� ��� ����!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //�� ��� � �������. ���� � ����� �����, ������ ������ ����� ��������� ��� �� ������.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "�������� ��� � �����.";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //�������� ��� � �����.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //��������� ������! ��� ���������� �������� ���, ��� ��������, � ���������� �� �������� �� �����.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //������������, ��� ��� �� ������������� ���, - ��� �������.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //� ������ �������, ��� �� �������, ��� � ������������� ���� �� ����� ������ ������ ����� � ����� �� ����� ���... �� �� ������� ����� �� �������.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //��� ������ ��� ���������.
};

