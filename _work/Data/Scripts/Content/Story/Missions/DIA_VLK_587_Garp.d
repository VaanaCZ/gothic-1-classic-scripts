
// ************************ EXIT **************************

instance  Vlk_587_Garp_Exit (C_INFO)
{
	npc			=  Vlk_587_Garp;
	condition	=  Vlk_587_Garp_Exit_Condition;
	information	=  Vlk_587_Garp_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

FUNC VOID  Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Vlk_587_Garp_ORK (C_INFO)
{
	npc				= Vlk_587_Garp;
	condition		= Vlk_587_Garp_ORK_Condition;
	information		= Vlk_587_Garp_ORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cosa ci fa qui, quell'orco?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //Cosa ci fa qui quell'orco?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //È stato catturato dalle guardie. Da allora, è costretto a lavorare qui.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Non è incatenato. Perché non scappa?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Una volta ci ha provato. Le guardie gliene hanno date così tante che non ha potuto camminare per un paio di settimane. Da allora, non ha più tentato di fuggire.
};  




