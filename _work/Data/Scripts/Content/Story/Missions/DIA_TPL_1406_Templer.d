// **************************************************
//						EXIT 
// **************************************************

instance  DIA_KalomsGuard_Exit (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 999;
	condition	= DIA_KalomsGuard_Exit_Condition;
	information	= DIA_KalomsGuard_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						PERM
// **************************************************

instance  DIA_KalomsGuard_PERM (C_INFO)
{
	npc			= Tpl_1406_Templer;
	nr			= 1;
	condition	= DIA_KalomsGuard_PERM_Condition;
	information	= DIA_KalomsGuard_PERM_Info;
	permanent	= 1;
	description	= "Estoy seguro de que no te importa que entre...";
};                       

FUNC int  DIA_KalomsGuard_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_KalomsGuard_PERM_Info()
{
	AI_Output (other, self,"DIA_KalomsGuard_PERM_15_00"); //No te importará que entre ahí, ¿verdad?
	AI_Output (self, other,"DIA_KalomsGuard_PERM_13_01"); //Si le faltas al respeto a mi amo, te mataré.
	AI_StopProcessInfos	( self );
};

