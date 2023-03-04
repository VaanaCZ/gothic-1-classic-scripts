
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
	description		= "Que fait chaman est-il banni ici ?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //Que fait chaman est-il banni ici ?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Les gardes l'ont attrapé. Depuis il est aux travaux forcés.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Il n'ait même pas enchaîné. Pourquoi il ne s'enfuit pas, simplement ?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Une fois il a essayé. Les gardes l'ont tellement tabassé qu'il n'a plus put marcher pendant deux semaines. Depuis lors, il n'a jamais réessayé.
};  




