// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "��� �����?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //��� ����?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //�� ���������, ��? �� ����������� ����� ��� ������.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //����� ��� ��������� ������ �� ������, ����� ���������, ����� �������� ������ ��������� ������ ����.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //��, ��! � ������, �� ��������� ������� �������� �� ������.
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //� ��� � ����?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //������ ���� ������������ ����. ������� �������� ������� �����������, ����� ��� ���������� ����.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //� �����, ��� �� ������������ � �������, � ��� �����, ���� �� ����� ���.
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //�� ������ ������... ���� �������������� ������ ���������.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //�� �� ��������� ����� ����-�� ���, ��� ��� ������ � ���!
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "������ �� ��������� ��� ��� ��������?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //������ �� ��������� ��� ��� ��������?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //������ ��� �� ����� ������� �������� ������. � �� ����� �� ��������, ������� �������� ���.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //� ����� ����, � ������ � ���� ���� ����������� ������ ���.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"������ �� ����. � ������ ���� �� ������!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"���� �� ������?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //��, � ���� ������ �� ������!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //��, ��� ���, ����������!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //���� �� ������?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //� ���� ������ �� �������� ����, �� � ������� ������� ���� ��� �����.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //� ��� �������� ��� 10 ������ ����. ��� ���, �� ��� �� �� ������ �� ��� �� ����?
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"����� � ������ �� ����?! � ������ ������!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"���������, ��� ��� ������� �������.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //�����, ���������.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //�������, �������! �� ��������� ���� ����! �������, ����� ��� ����� �������, �����?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //����� � ������ �� ����?! � ������ ������!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //�������, � � ���� ������. � ������� ������ �� ���� �� ������������.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "� �������� ��������!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //� �������� ��������!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //��? �������! ������ �� � ����� � �������.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"�����? � �������� 10 ������ ���� �� ��, ��� � ��� ��� ����?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"��. ������ �� ������.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //�����? � �������� 10 ������ ���� �� ��, ��� � ��� ��� ����?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //����������, ��� ���.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //��. ������ �� ������.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
