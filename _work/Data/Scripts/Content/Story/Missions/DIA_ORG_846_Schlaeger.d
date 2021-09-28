// **************************************
//					EXIT 
// **************************************

instance DIA_846_Exit (C_INFO)
{
	npc			= Org_846_Schlaeger;
	nr			= 999;
	condition	= DIA_846_Exit_Condition;
	information	= DIA_846_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_846_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_846_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				Hallo
// **************************************

instance DIA_846_Hello (C_INFO)
{
	npc			= Org_846_Schlaeger;
	nr			= 1;
	condition	= DIA_846_Hello_Condition;
	information	= DIA_846_Hello_Info;
	permanent	= 0;
	description	= "Co tu robisz?";
};                       

FUNC int DIA_846_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_846_Hello_Info()
{
	AI_Output (other, self,"DIA_846_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracujê dla Ry¿owego Ksiêcia.
	
	var C_NPC Lefty; Lefty = Hlp_GetNpc (Org_844_Lefty);
	if (!Npc_IsDead(Lefty))
	{
		AI_Output (self, other,"DIA_846_Hello_07_02"); //Jakbyœ czegoœ potrzebowa³, zapytaj Lewusa.
	};
};
