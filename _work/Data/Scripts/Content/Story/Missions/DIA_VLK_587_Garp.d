
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
	description		= "To tu robi ten Ork?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //To tu robi ten Ork?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Z�apali go nasi stra�nicy. Od tej pory pracuje dla nas.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Przecie� nie jest nawet skuty �a�cuchami. Czemu po prostu nie ucieknie?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Raz spr�bowa�. Stra�nicy tak go urz�dzili, �e nie m�g� si� ruszy� przez par� tygodni. Od tej pory nigdy wi�cej si� nie buntowa�.
};  




