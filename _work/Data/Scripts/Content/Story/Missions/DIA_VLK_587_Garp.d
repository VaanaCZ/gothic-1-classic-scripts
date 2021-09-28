
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
	description		= "Co tady dìlá skøet?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //Co tady dìlá skøet?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Zadržela ho stráž. Od té doby tady musí pracovat.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Není ani v železech. Jak to, že neuteèe?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Jednou se o to pokusil. Stráž mu dala co proto, takže nemohl pár týdnù chodit. Od té doby se o to už nikdy nepokusil.
};  




