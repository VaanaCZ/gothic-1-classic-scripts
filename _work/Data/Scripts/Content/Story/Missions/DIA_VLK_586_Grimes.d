// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //����� �����!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //� ���� ���� ��, �������.
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ����� ����� ������?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //�� ����� ����� ������?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //��, � ��� ��� 10 ����� ����. � ������, �� ��� ����� � ������� �������� � ������ �������.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //� ����� ������ ������������ � �� �������, ��, ��� ������, � ��� ��� ���.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //�����-�� ������-����� �� �������� �� �����... ������ ��� ���������, �� � �����, ��������, ��� ����� ����������...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //��, ��� ���� �����...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "������ ����, �� ������ ������ � ������ ������ ������ �� �������."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //������ ����, �� ��� ������ ������ � ������ ������ ������ �� �������.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //��������, ������, � ������� ���� ������� ��������� ������. �� ��� ����� - ������ �� ����.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //����� � �� ����� � ������. � ����� ���, ��� ������� ������ ����� ������.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //�� �������� �� ������. ������ ������ �� ��������.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //� ��� ����� �� ������ �������� ��������� ������ ��� � ���� �����!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //�� ������ - �� ����. ��������, �����-������ �� ������ ������� ���������, ��� �����.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //��, ������ ������� �� ����� ��� �� ������, �� ���� ��� ����� ���������.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //���������! �� ���� ������� �����-������?
};  
