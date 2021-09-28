//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
instance  Info_Xardas_OT (C_INFO)
{
	npc				= Kdf_406_OTXardas;
	condition		= Info_Xardas_OT_Condition;
	information		= Info_Xardas_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_Xardas_OT_Condition()
{	
	if (Npc_GetDistToWP(self, "TPL_331") < 1000)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OT_Info()
{
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //� ��� �� ��� ����� �������, ��� ��� ������ �����������!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //��� ��...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //������ ��� �����. ��� ������ ������� ������ ��������� ����.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //� ������� ������� ����������� � �����, ��� ������ ���� ������.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //���� ������ ����������� ����� ������ ����� � ���� ���������.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //�������� ��� �������� �������, �� ������ ������� ������ � ����� ����� ������ ���������� ������.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //�� ������ ������ �������� ������ ����� ��������. ������ ��� ����� ������� ������� �� ����� ����.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //� �����!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //��������, �������� ��� ����� �� ������ ��������� ��� �����, � ����� ������ ����������.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //��� ��������� � � ���� �������.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //� ������ �������� �����. ������ ���� ��� ����� �� ���������!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //���� ������� ������, � � ��...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //��� � �����?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //�... ������...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"����� �������. �� ����� ������ ������� ���� ������ �������� ������ ������ �������. ������� �������� ���������� � ��� ��������� �������. ���� ������ ������� ������� ��������� � ����������. ��� ���� ��������� ������ ��������� �����. ��� ������������ ������ �������� �������. ������ �������� ������...");
	
	AI_StopProcessInfos	(self);
};		
