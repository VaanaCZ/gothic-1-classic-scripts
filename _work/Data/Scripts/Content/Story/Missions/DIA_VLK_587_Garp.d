
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
	description		= "�Qu� hace aqu� el orco?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //�Qu� hace aqu� ese orco?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Lo capturaron los guardias. Desde entonces se ha visto forzado a trabajar aqu�.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Ni siquiera est� encadenado. �Por qu� no se escapa?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Lo intent� una vez. Los guardias le apalearon de tal manera que se pas� dos semanas sin poder andar. Desde entonces no ha vuelto a intentarlo.
};  




