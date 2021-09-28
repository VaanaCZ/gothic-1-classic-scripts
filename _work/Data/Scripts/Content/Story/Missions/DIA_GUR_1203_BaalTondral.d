// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "������ �� ������.";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //�� �� ����� �� ��� �����, ��� ���������� ���� �������.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //�� ������ ����� �� �������� - �������� �������� ����. ����� �� �������� �� ������ �������� ����� - ��, ��� �� ���� ���� ����� �� �����?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //����, ���� ������� �������� - ���� �� ������ � ���, ��� �������� �������� ���� ����������� �������? � �� ������, ������ ������� ��� ��������. ��� ��� ����!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //���� ��� ���� ������ ��� ����, ��� ���� �����. �� ���� ��� ������� ������� ���� ���!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //����� �� �������� �� ���������� � ������� - �����������, ��������? ����� �� ���������� ��, ��� ���� ��� ��� ��� ���������� ��� �������, ��� ���������� ��� ���� ���? �������� ���!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //������, ��� �� �������, ����� ��������� �������� ���? �� ���������� ����������� ����, ���������� ����! �� �������� ������ ����������� ��� ����� ������!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //�������� ����. �� ������ ������! ������ ����������! �� ��������� ����  � ������ ���� ���������-��������!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //��� ����, ������ ������, �������� ��� �� ����� ����. ��� ����� ������ � ������ ������������ �� ����, �� ����� ��� ������� ������.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //��� �������� ����. �������� ����� ������. � ������ �������.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "��! �� ��������� �� ����. ���� � ���������� � ����?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //��! �� ��������� �� ����. �� ������ �� ���, ��� ������ � � ���� ���������� � ����?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //�� ���������� ���� �������. ��� ���������.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //� ������ � ���� ������� �������� ����! ����� �� ������ ������� � ���� ���������.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //� ��������� � �����, ���� ���� ���� ���� �������� ����.
};

// **************************************************
// 				Loyalit�t beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "��� � ���� �������� ���� �����������?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //��� � ���� �������� ���� �����������?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //������ ����� �� ��������� � ����� �����, ��������� ������ � ���������� � ���� ��������.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //���� �� ������� ������ �� �������� �������������� � ������ ������, ���� �� �������� ���� ���������� ������� ��������.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"���� ������� ������ ���� � ������ ������, ����� ������ ������ �������� ��� ��������. ��� ������� ���� ��������� ��� ������������.");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "��� ��� ����� ������ ��������?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //��� ��� ����� ������ ��������?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //����� ����� ��� ����� �������� ������ ������. ���� ��� ������ �� ������ � ���. ���� �� ������ ������������ � ���������.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //� �����, ��� � ����� ������ �� ���� �� ��������� ������. ��� ����� ��������� �������.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "������ ��� ��� ����� ����� ����?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //������ ��� ��� ����� ����� ����?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //������ ������� ���� ������� - � ��� ������� ������. � ����������� ���� ��� ��� ������ ���������.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //�� �� ��� �� ����� � ������ ����. ��� ������ ��� ����� ���� ������, ��� ���� ����� �������� � ����.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //��� �� ��������� � ������� ���������, � ��� ������ ����� ������ � ��� �������, ��� ������ ���� ����� �� �����.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //���� �� ������ ������ ������, ��� �� ������� ����� ������. �� �� �������� ������� �� ��� �����������!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "���� ������� ���� ������ ������������, �������� ���!";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //���� ������� ���� ������ ������������, �������� ���!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //���� �� ������ �� ���? ������� �� ��?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //��� ��������, �� ��������� � �������� ����������, ��������.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //����� ������. � ����� ������� �� ����� ����� �� ���� ��������.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //�� ������ ��������� �� ��� ������ ���� � ������� ��, ��� � ����� ����. ���� ���� ��� ����� ���� �������. 

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Hei�t das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC l�sen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal l�schen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,"����� ������ �������� �������� ����� ��������. � �������� �������.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "��������! � ���� ����� ����� �� ������ ��������.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //��������! � ���� ����� ����� �� ������ �������� � ���� ���� � ���������. 
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //�� �������� ��. ��� � ��� ������ � ����� � ���� ���� ����������.

	B_LogEntry(CH1_JoinPsi,"���� ������� �������, ��� � ������� ������ ���� ����������!");
};








