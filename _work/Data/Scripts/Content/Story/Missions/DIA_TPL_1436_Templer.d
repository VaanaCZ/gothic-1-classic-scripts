
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
	description		= "�Qu� pasa?"; 
};

FUNC int  Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

FUNC void  Tpl_1436_Templer_CRAWLER_Info()
{
	AI_Output (other, self,"Tpl_1436_Templer_CRAWLER_Info_15_01"); //�Qu� pasa?
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_02"); //Hemos venido a cazar reptadores. El efecto secundario de proteger a los cavadores tambi�n es bastante popular.
	AI_Output (self, other,"Tpl_1436_Templer_CRAWLER_Info_13_03"); //Pero, en realidad, lo que queremos es la secreci�n de los reptadores. Cor Kalorn, nuestro Gur�, elabora pociones m�gicas con la secreci�n de las mand�bulas de los reptadores.
};  

  




