// infos 
instance Info_TPL_1455_GorBoba (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba_Condition;
	information		= Info_TPL_1455_GorBoba_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1455_GorBoba_Condition()
{
	return TRUE;
};

func void Info_TPL_1455_GorBoba_Info()
{
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //����������! ���� ����� �� �����!
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "� �� ������ ���� ����������?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //� �� ������ ���� ����������?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //��! � ��������� ����, ����� �� �� ���� ������� ����� ������� ������. �� ��������� � ����������� �������.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //�� ������� �������� �� ����. ��������� ���� ������� ������ � ��� ����� ����� ����. �� ����� ������������.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //������ � ���� ������, ��������� �� ����������!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //����������� � ������� � ����������!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "���� �����", LOG_NOTE );
	B_LogEntry            ( "���� �����", "��� ���� ������ ���, ��� �� �������� ����������, � ��� ������ ����� �� ������. ��� ����� � ��� ������������� �������� ���� �� �������, � ������ �� ������ ����� ������������ �������." ); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
