// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //������� ����� ���������: ��� ��� �� ��������� ����!
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "� ���� �����-�� ��������?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //� ���� �����-�� ��������?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //������ ���� � �����! ����� �� ��� ��� ���� ���� ������� ��������!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //��� �������� � ����, ����� � ����� ��������� ���� ���.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //��� ���������� ��� �� ������� ��� ������ � ������.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //�� ����� �� ������ ������. � � ��� �� �������� ��� ������ �� ���� ������.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //� ����� � ����� ��������� ���� ������ �� �����, � ���� ��������� ������ �����.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //���������! � �� ��������! �� ���� ����������� ���� �� ������, ��� � �� ��������!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //� ������ ��� ��� ������ ����� ����� ��� ���. 
};

	
	
	
	
	


















