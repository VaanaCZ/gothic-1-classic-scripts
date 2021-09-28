/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_Exit (C_INFO)
{
	npc			=  Nov_1371_BaalNetbek;
	nr			=  999;
	condition	=  Nov_1371_BaalNetbek_Exit_Condition;
	information	=  Nov_1371_BaalNetbek_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = "���������";
};                       

FUNC int  Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							G�RTNER								
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_CRAZY (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_CRAZY_Condition;
	information		= Nov_1371_BaalNetbek_CRAZY_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ���� �����?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //��� ��?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //� ����, ���� ������. ��� ����� ����� ���� ���� ������.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //�����? � �� ���� ������� ����!
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //��� �������. �������! ��� ����� � ����, � �������...
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //... �, �������. �����, ��� ����...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //������, �� ������ ������ ���! � ��������� ���������� ��� ������ � ���������� �������� ���!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //�����, �� ���� ������� ��� ����, � �... � ����� �������.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //�� �� ���������� ���� ������ �����...
	AI_StopProcessInfos	( self );
};  
/*------------------------------------------------------------------------
							AGAIN							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_AGAIN (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_AGAIN_Condition;
	information		= Nov_1371_BaalNetbek_AGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= "��, ��� ����?"; 
};

FUNC int  Nov_1371_BaalNetbek_AGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};

};
FUNC void  Nov_1371_BaalNetbek_AGAIN_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //��, ��� ����?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //���������� �� ��������� ����� ���� ��������!
};  
