// *********************** PRIESTER 1 ***********************

INSTANCE Info_HighPriest1 (C_INFO)
{
	npc			= ORC_Priest_1;
	nr			= 1;
	condition	= Info_HighPriest1_Condition;
	information	= Info_HighPriest1_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest1_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest1_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output 			(self, other,"Info_HighPriest1_17_01"); //����������������!
	AI_Output 			(self, other,"Info_HighPriest1_17_02"); //��� �� ������ ����������� ����!
	AI_Output 			(self, other,"Info_HighPriest1_17_03"); //�������� � ������!
	AI_Output 			(other, self,"Info_HighPriest1_15_04"); //�� ��� ���������, ���� ������� ���������� � ������, ��, ������ ����!
	
	B_LogEntry			(CH4_EnterTemple,	"������-�����, ���� �� ���� �����-�������, ������� ������� ������� � ���� ����, ����� ������ ����. � ������ ��� �������� ���� �� ���� �����.");

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

