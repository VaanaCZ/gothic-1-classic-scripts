// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "��� �����?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //��� ����?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //�� ��� �� �����. ���� ������ ������ ��������, � ���� ����� ����� ����� ������.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//������ ����������� ������� ���?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //�������.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//������, �� ��� �� ��� ������.
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="��� � ���� ��� ���� �������?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //��� � ���� ��� ���� �������?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //��, ������ ����, ������ ������ ������. � ���� ��� ����� ������: ���� �� ������ ����� �� ������� � ������� � �����.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //�� �������� ����� ������� ������, ���� ������� �������� ��� ���� ����� � ��������� ������ ������... � �����, ���� ����� ����������.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"�� ������, ����� ���� �������?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"������ �������.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //�� ������, ����� ���� �������?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //�� �� ������ ��� ����, ��, �� ������� ����, ��� �� �����������! �������, ���� ������� ��������� ��, � ��� � ������.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //� ��� �������� ������ �� ���������, �� �� ��� � �� ��������: ������, ������ � ����� ������.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"����� ����, ������� �� ������� ������ ������� ������, ������ ���� ��������� 3 ������ ���� � 5  ������ ������ ��� ������ ������ �������.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //������ �������.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //����� ��� � ��������� ��, � ��� � ���� ������.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //� ��� �������� ������ �� ���������, �� �� ��� � �� ��������: ������, ������ � ����� ������.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"����� ����, ������� �� ������� ������ ������� ������, ������ ���� ��������� 3 ������ ���� � 5  ������ ������ ��� ������ ������ �������. � ���� ����� ����������� ��� ������.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "� ������ ���, ��� ���� �����!";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //� ������ ���, ��� ���� �����!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //�������! �������� ������ �������� ��� � �����, � ���� ����� ������... ������...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items �bergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"���� ������� ������ ������� ������������ �������������.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"������ �� ������ ���� ����� ������ ��� ���� �� ������ �����.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "�� ������, ��� � ����� ����� �������, ������� ������...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //�� ������, ��� � ����� ����� �������, ������� ������...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //� � ���� �� �������. ���, ������� ��� ������.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //�������! �� ������� � ���� ��� ������ �� ��������. ������� ������.
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "��� ����� ����� ������ �����?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //��� ����� ����� ������ �����?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //�� �� ����� ������! ������� � ������ ���� � ����� ����� - ��� ��������� ������� �������.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //� ����� ���� �� ������� �� ���. ���� �� ��� ���������� - ������ ���������!
	
    B_LogEntry( CH1_SnafsRecipe,"������ ���� ������� ���������� �� ��������� ����� � ���� �����.");			
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "��� ������ ������ �����?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //��� ������ ������ �����?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //�������� ����� ����� ������ - ��� ��� ����������� ����� - � ����� ����� ����� ����� �������, �� ������� ������ �����.
	
	B_LogEntry( CH1_SnafsRecipe,"������ ����� ����� ����� �� ������ ����� ������� ������ � ����� �����.");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "��� ����� ���� �����, �������� �� ������� �� ����?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //��� ����� ���� �����, �������� �� ������� �� ����?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //���. �� ���-�� �� �������� �����. � �����, ������ �� ��� � ����� ������.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //� �������� ��� �������� ����� - �� �� ��� � �� ��������...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"����� ���� ����� ���� ��������� ���, ����� ��� ��� �������� �����.");
};







	
	 




