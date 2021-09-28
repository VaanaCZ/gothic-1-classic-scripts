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
	description = "Hled� n�co?";
};                       

FUNC INT DIA_Homer_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_Hello_Info()
{	
	AI_Output (other, self,"DIA_Homer_Hello_15_00"); //Hled� n�co?
	AI_Output (self, other,"DIA_Homer_Hello_02_01"); //Hled�m praskliny v hr�zi. �ekl bych, �e budou n�kde u z�klad�.
	AI_Output (self, other,"DIA_Homer_Hello_02_02"); //Ta bestie naru�uje sv�mi zuby a dr�py kameny a d�ev�n� tr�my pod vodou.
	AI_Output (self, other,"DIA_Homer_Hello_02_03"); //Jestli to bude pokra�ovat, cel� hr�z bude co nevid�t podhraban�.
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
	description = "TY jsi tu hr�z stav�l?";
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
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //TY jsi tu hr�z stav�l?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Ano. Stav�l jsem ji tehdy, kdy� jsme zakl�dali Nov� t�bor.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //V�ichni samoz�ejm� pom�hali, ale j� byl stavebn� mistr.
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
	description = "Je tu n�co, s ��m bych mohl pomoci?";
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
	AI_Output (other, self,"DIA_Homer_WannaHelp_15_00"); //Je tu n�co, s ��m bych mohl pomoci?
	AI_Output (self, other,"DIA_Homer_WannaHelp_02_01"); //Jist�, za�i�, aby ta bestie p�estala podhlod�vat moji hr�z.
	
	Homer_DamLurker = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_DamLurker, LOG_MISSION);
	Log_SetTopicStatus	(CH1_DamLurker, LOG_RUNNING);
	B_LogEntry			(CH1_DamLurker,"Homer mi �ekl, �e ��havec rozhlod�v� hr�z. Pokud se mi ho poda�� zastavit, budou hr�z moci opravit.");

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
	description = "Kde tu bestii najdu?";
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
	AI_Output (other, self,"DIA_Homer_Running_15_00"); //Kde tu bestii najdu?
	AI_Output (self, other,"DIA_Homer_Running_02_01"); //J� bych na n� �el na druhou stranu jezera. Tam nikdo nechod�. Tam budou m�t nejsp� doup�.
	
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry	(CH1_DamLurker,"Ten ��havec mus� m�t sv� hn�zdo n�kde na druh� stran� hr�ze. ");
	
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
	description = "Zabil jsem tu bestii!";
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
	AI_Output			(other, self,"DIA_Homer_Success_15_00"); //Zabil jsem tu bestii!
	AI_Output			(self, other,"DIA_Homer_Success_02_01"); //Skv�l�! Vezmu n�koho z mu�� R��ov�ho Lorda, aby mi pomohl opravit n�co z toho, co poni�ila.
	AI_Output			(self, other,"DIA_Homer_Success_02_02"); //A te� m��u j�t kone�n� sp�t.
		
	Homer_DamLurker = 	LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_DamLurker,	LOG_SUCCESS);
	B_LogEntry			(CH1_DamLurker,"��havec je pry� a Homer m��e zase klidn� sp�t.");
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
	description = "Je s hr�z� v�echno v po��dku?";
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
	AI_Output (other, self,"DIA_Homer_PERM_15_00"); //Je s hr�z� v�echno v po��dku?
	AI_Output (self, other,"DIA_Homer_PERM_02_01"); //Je pevn� jako hrad, nic ji nerozbo��.
};

