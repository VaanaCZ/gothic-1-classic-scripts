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
	description = "Szukasz czegoœ?";
};                       

FUNC INT DIA_Homer_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_Hello_Info()
{	
	AI_Output (other, self,"DIA_Homer_Hello_15_00"); //Szukasz czegoœ?
	AI_Output (self, other,"DIA_Homer_Hello_02_01"); //Szukam pêkniêæ w tamie. Chyba jakiœ topielec podgryza jej fundamenty.
	AI_Output (self, other,"DIA_Homer_Hello_02_02"); //Paskuda uszkadza zêbami i pazurami kamienie i drewniane pale pod wod¹.
	AI_Output (self, other,"DIA_Homer_Hello_02_03"); //Jeœli nie przestanie, ca³¹ tamê trafi szlag!
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
	description = "Czy to TY zbudowa³eœ tê tamê?";
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
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //Czy to TY zbudowa³eœ tê tamê?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Tak. Zbudowa³em j¹ dawno temu, gdy Nowy Obóz dopiero powstawa³.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //Oczywiœcie wszyscy pomagali, ale to ja nadzorowa³em budowê.
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
	description = "Mo¿e mogê ci jakoœ pomóc?";
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
	AI_Output (other, self,"DIA_Homer_WannaHelp_15_00"); //Mo¿e mogê ci jakoœ pomóc?
	AI_Output (self, other,"DIA_Homer_WannaHelp_02_01"); //Jasne. Spraw, ¿eby ta bestia przesta³a pod¿eraæ moj¹ tamê.
	
	Homer_DamLurker = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_DamLurker, LOG_MISSION);
	Log_SetTopicStatus	(CH1_DamLurker, LOG_RUNNING);
	B_LogEntry			(CH1_DamLurker,"Homer opowiedzia³ mi o topielcu, który podkopuje jego tamê. Jeœli uda mi siê powstrzymaæ potwora, tamê z pewnoœci¹ uda siê naprawiæ.");

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
	description = "Gdzie mogê j¹ znaleŸæ?";
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
	AI_Output (other, self,"DIA_Homer_Running_15_00"); //Gdzie mogê j¹ znaleŸæ?
	AI_Output (self, other,"DIA_Homer_Running_02_01"); //Rozejrzyj siê po drugiej stronie jeziora. Nikt tam nigdy nie zagl¹da. Za³o¿ê siê, ¿e tam ma swoje le¿e!
	
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry	(CH1_DamLurker,"Topielec musi mieæ swoje le¿e w nieuczêszczanej czêœci zbiornika.");
	
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
	description = "Zabi³em bestiê!";
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
	AI_Output			(other, self,"DIA_Homer_Success_15_00"); //Zabi³em bestiê!
	AI_Output			(self, other,"DIA_Homer_Success_02_01"); //Œwietnie! Œci¹gn¹³em tu kilku ludzi Ry¿owego Ksiêcia, którzy pomogli mi naprawiæ uszkodzenia.
	AI_Output			(self, other,"DIA_Homer_Success_02_02"); //Nareszcie mogê siê porz¹dnie wyspaæ.
		
	Homer_DamLurker = 	LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_DamLurker,	LOG_SUCCESS);
	B_LogEntry			(CH1_DamLurker,"Topielec nie ¿yje. Homer mo¿e ju¿ spaæ spokojnie.");
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
	description = "Z tam¹ wszystko w porz¹dku?";
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
	AI_Output (other, self,"DIA_Homer_PERM_15_00"); //Z tam¹ wszystko w porz¹dku?
	AI_Output (self, other,"DIA_Homer_PERM_02_01"); //Mocna jak ska³a. Nic jej nie zaszkodzi!
};

