
// ************************ EXIT **************************

instance  Tpl_1436_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1436_Templer;
	nr			=  999;
	condition	=  Tpl_1436_Templer_Exit_Condition;
	information	=  Tpl_1436_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1436_Templer_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Tpl_1436_Templer_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Tpl_1436_Templer_CRAWLER (C_INFO)
{
	npc				= Tpl_1436_Templer;
	condition		= Tpl_1436_Templer_CRAWLER_Condition;
	information		= Tpl_1436_Templer_CRAWLER_Info;
	important		= 0;
	permanent		= 1;
	description		= "Co se dìje?"; 
};

FUNC int  Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

FUNC void  Tpl_1436_Templer_CRAWLER_Info()
{
	AI_Output (other, self,"Tpl_1436_Templer_CRAWLER_Info_15_01"); //Co se dìje?
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_02"); //Lovíme tady èervy. Vedlejším efektem je ochrana kopáèù, což je taky docela dobré.
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_03"); //Hlavní vìc, kterou chceme, je výmìšek èervù. Náš Guru Cor Kalom pøipravuje magické lektvary z výmìškù z èelistí dùlních èervù.
};  

  




