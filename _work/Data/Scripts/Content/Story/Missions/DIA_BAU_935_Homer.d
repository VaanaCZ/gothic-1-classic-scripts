// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Homer_EXIT (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 999;
	condition	= DIA_Homer_EXIT_Condition;
	information	= DIA_Homer_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Homer_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Homer_Hello (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_Hello_Condition;
	information	= DIA_Homer_Hello_Info;
	permanent	= 0;
	description = "Szukasz czego�?";
};                       

FUNC INT DIA_Homer_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_Hello_Info()
{	
	AI_Output (other, self,"DIA_Homer_Hello_15_00"); //Szukasz czego�?
	AI_Output (self, other,"DIA_Homer_Hello_02_01"); //Szukam p�kni�� w tamie. Chyba jaki� topielec podgryza jej fundamenty.
	AI_Output (self, other,"DIA_Homer_Hello_02_02"); //Paskuda uszkadza z�bami i pazurami kamienie i drewniane pale pod wod�.
	AI_Output (self, other,"DIA_Homer_Hello_02_03"); //Je�li nie przestanie, ca�� tam� trafi szlag!
};

// ************************************************************
// 						Damm gebaut
// ************************************************************

INSTANCE DIA_Homer_BuiltDam (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_BuiltDam_Condition;
	information	= DIA_Homer_BuiltDam_Info;
	permanent	= 0;
	description = "Czy to TY zbudowa�e� t� tam�?";
};                       

FUNC INT DIA_Homer_BuiltDam_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Homer_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_BuiltDam_Info()
{	
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //Czy to TY zbudowa�e� t� tam�?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Tak. Zbudowa�em j� dawno temu, gdy Nowy Ob�z dopiero powstawa�.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //Oczywi�cie wszyscy pomagali, ale to ja nadzorowa�em budow�.
};

// ************************************************************
// 						Kann ich helfen?
// ************************************************************
	var int Homer_DamLurker;
// ************************************************************

INSTANCE DIA_Homer_WannaHelp (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_WannaHelp_Condition;
	information	= DIA_Homer_WannaHelp_Info;
	permanent	= 0;
	description = "Mo�e mog� ci jako� pom�c?";
};                       

FUNC INT DIA_Homer_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Homer_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_WannaHelp_Info()
{	
	AI_Output (other, self,"DIA_Homer_WannaHelp_15_00"); //Mo�e mog� ci jako� pom�c?
	AI_Output (self, other,"DIA_Homer_WannaHelp_02_01"); //Jasne. Spraw, �eby ta bestia przesta�a pod�era� moj� tam�.
	
	Homer_DamLurker = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_DamLurker, LOG_MISSION);
	Log_SetTopicStatus	(CH1_DamLurker, LOG_RUNNING);
	B_LogEntry			(CH1_DamLurker,"Homer opowiedzia� mi o topielcu, kt�ry podkopuje jego tam�. Je�li uda mi si� powstrzyma� potwora, tam� z pewno�ci� uda si� naprawi�.");

};

// ************************************************************
// 						Running
// ************************************************************

INSTANCE DIA_Homer_Running (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_Running_Condition;
	information	= DIA_Homer_Running_Info;
	permanent	= 0;
	description = "Gdzie mog� j� znale��?";
};                       

FUNC INT DIA_Homer_Running_Condition()
{
	if (Homer_DamLurker == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Running_Info()
{	
	AI_Output (other, self,"DIA_Homer_Running_15_00"); //Gdzie mog� j� znale��?
	AI_Output (self, other,"DIA_Homer_Running_02_01"); //Rozejrzyj si� po drugiej stronie jeziora. Nikt tam nigdy nie zagl�da. Za�o�� si�, �e tam ma swoje le�e!
	
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry	(CH1_DamLurker,"Topielec musi mie� swoje le�e w nieucz�szczanej cz�ci zbiornika.");
	
};

// ************************************************************
// 						Success
// ************************************************************

INSTANCE DIA_Homer_Success (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_Success_Condition;
	information	= DIA_Homer_Success_Info;
	permanent	= 0;
	description = "Zabi�em besti�!";
};                       

FUNC INT DIA_Homer_Success_Condition()
{
	var C_NPC lurker; lurker = Hlp_GetNpc(DamLurker);
	PrintDebugString(PD_MISSION, "name: ", lurker.name);
	PrintDebugInt	(PD_MISSION, "hp: ", lurker.attribute[ATR_HITPOINTS]);
	if	(Homer_DamLurker==LOG_RUNNING)
	//&&	(Npc_IsDead(lurker))					//SN: auskommentiert, da Hlp_GetNpc() die C_NPC lurker nicht initialisieren kann!
	&&	(Npc_HasItems(hero,ItAt_DamLurker_01))		//SN: Workaround!
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Success_Info()
{	
	AI_Output			(other, self,"DIA_Homer_Success_15_00"); //Zabi�em besti�!
	AI_Output			(self, other,"DIA_Homer_Success_02_01"); //�wietnie! �ci�gn��em tu kilku ludzi Ry�owego Ksi�cia, kt�rzy pomogli mi naprawi� uszkodzenia.
	AI_Output			(self, other,"DIA_Homer_Success_02_02"); //Nareszcie mog� si� porz�dnie wyspa�.
		
	Homer_DamLurker = 	LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_DamLurker,	LOG_SUCCESS);
	B_LogEntry			(CH1_DamLurker,"Topielec nie �yje. Homer mo�e ju� spa� spokojnie.");
	B_GiveXP			(XP_ReportDeadDamLurker);
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"START");
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Homer_PERM (C_INFO)
{
	npc			= Bau_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_PERM_Condition;
	information	= DIA_Homer_PERM_Info;
	permanent	= 1;
	description = "Z tam� wszystko w porz�dku?";
};                       

FUNC INT DIA_Homer_PERM_Condition()
{
	if (Homer_DamLurker ==LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_PERM_Info()
{	
	AI_Output (other, self,"DIA_Homer_PERM_15_00"); //Z tam� wszystko w porz�dku?
	AI_Output (self, other,"DIA_Homer_PERM_02_01"); //Mocna jak ska�a. Nic jej nie zaszkodzi!
};

