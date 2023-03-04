// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_534_Exit (C_INFO)
{
	npc			= Vlk_534_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_534_Exit_Condition;
	information	= DIA_Vlk_534_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_534_LeaveMe (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_LeaveMe_Condition;
	information		= DIA_Vlk_534_LeaveMe_Info;
	permanent		= 1;
	description		= "Pourquoi es-tu ici et non dans le Camp ?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //Pourquoi es-tu ici et non dans le Camp ?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //J'attends un ami qui revient de la mine. Il me doit un peu de minerai.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Je ne peux pas retourner dans le camp sans minerai - je ne pourrais pas payer l'argent de protection des gardes et alors les choses deviendront difficiles pour moi.

	AI_StopProcessInfos	(self);
};
