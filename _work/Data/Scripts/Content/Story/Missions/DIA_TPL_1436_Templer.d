
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
	description		= "Ca va ?"; 
};

FUNC int  Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

FUNC void  Tpl_1436_Templer_CRAWLER_Info()
{
	AI_Output (other, self,"Tpl_1436_Templer_CRAWLER_Info_15_01"); //Ca va ?
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_02"); //Nous sommes ici pour chasser les Chenilles. Cela aura comme effet secondaire de protéger les mineurs, ce qui est tout à fait populaire.
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_03"); //Cependant, ce que nous voulons vraiment c'est uniquement la sécrétion des Chenilles. Notre sage Cor Kalom brasse les potions faites à partir de la sécrétion des mandibules inférieures de Chenille de mine.
};  

  




