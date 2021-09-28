
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
	description		= "Что здесь делает орк?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //Что здесь делает орк?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //Он работает здесь, с тех пор как его поймали стражники.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //Его даже не заковали в цепи. Почему он просто не убежит?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //Один раз он уже пытался. Стражники так отделали его, что он не мог ходить несколько недель. С тех пор он уже не помышляет о побеге.
};  




