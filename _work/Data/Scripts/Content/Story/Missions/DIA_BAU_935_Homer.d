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
	description = "Hledáš nìco?";
};                       

FUNC INT DIA_Homer_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_Hello_Info()
{	
	AI_Output (other, self,"DIA_Homer_Hello_15_00"); //Hledáš nìco?
	AI_Output (self, other,"DIA_Homer_Hello_02_01"); //Hledám praskliny v hrázi. Øekl bych, že budou nìkde u základù.
	AI_Output (self, other,"DIA_Homer_Hello_02_02"); //Ta bestie narušuje svými zuby a drápy kameny a døevìné trámy pod vodou.
	AI_Output (self, other,"DIA_Homer_Hello_02_03"); //Jestli to bude pokraèovat, celá hráz bude co nevidìt podhrabaná.
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
	description = "TY jsi tu hráz stavìl?";
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
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //TY jsi tu hráz stavìl?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Ano. Stavìl jsem ji tehdy, když jsme zakládali Nový tábor.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //Všichni samozøejmì pomáhali, ale já byl stavební mistr.
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
	description = "Je tu nìco, s èím bych mohl pomoci?";
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
	AI_Output (other, self,"DIA_Homer_WannaHelp_15_00"); //Je tu nìco, s èím bych mohl pomoci?
	AI_Output (self, other,"DIA_Homer_WannaHelp_02_01"); //Jistì, zaøiï, aby ta bestie pøestala podhlodávat moji hráz.
	
	Homer_DamLurker = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_DamLurker, LOG_MISSION);
	Log_SetTopicStatus	(CH1_DamLurker, LOG_RUNNING);
	B_LogEntry			(CH1_DamLurker,"Homer mi øekl, že èíhavec rozhlodává hráz. Pokud se mi ho podaøí zastavit, budou hráz moci opravit.");

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
	AI_Output (self, other,"DIA_Homer_Running_02_01"); //Já bych na ní šel na druhou stranu jezera. Tam nikdo nechodí. Tam budou mít nejspíš doupì.
	
	Homer_DamLurker = LOG_RUNNING;
	B_LogEntry	(CH1_DamLurker,"Ten èíhavec musí mít své hnízdo nìkde na druhé stranì hráze. ");
	
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
	AI_Output			(self, other,"DIA_Homer_Success_02_01"); //Skvìlé! Vezmu nìkoho z mužù Rýžového Lorda, aby mi pomohl opravit nìco z toho, co ponièila.
	AI_Output			(self, other,"DIA_Homer_Success_02_02"); //A teï mùžu jít koneènì spát.
		
	Homer_DamLurker = 	LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_DamLurker,	LOG_SUCCESS);
	B_LogEntry			(CH1_DamLurker,"Èíhavec je pryè a Homer mùže zase klidnì spát.");
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
	description = "Je s hrází všechno v poøádku?";
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
	AI_Output (other, self,"DIA_Homer_PERM_15_00"); //Je s hrází všechno v poøádku?
	AI_Output (self, other,"DIA_Homer_PERM_02_01"); //Je pevná jako hrad, nic ji nerozboøí.
};

