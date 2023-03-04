// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tpl_1416_Torwache_Exit (C_INFO)
{
	npc			= Tpl_1416_Templer;
	nr			= 999;
	condition	= DIA_Tpl_1416_Torwache_Exit_Condition;
	information	= DIA_Tpl_1416_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tpl_1416_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tpl_1416_Torwache_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Wie ist das Leben hier
// **************************************************

INSTANCE DIA_Tpl_1416_Torwache_Life (C_INFO)
{
	npc				= Tpl_1416_Templer;
	nr				= 1;
	condition		= DIA_Tpl_1416_Torwache_Life_Condition;
	information		= DIA_Tpl_1416_Torwache_Life_Info;
	permanent		= 1;
	description		= "Comment est la vie quand on est un des gardes de la Confrérie ?";
};

FUNC INT DIA_Tpl_1416_Torwache_Life_Condition()
{	
	return 1;
};

FUNC VOID DIA_Tpl_1416_Torwache_Life_Info()
{
	AI_Output (other, self,"DIA_Tpl_1416_Torwache_Life_15_00"); //Comment est la vie quand on est un des gardes de la Confrérie ?
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_01"); //J'ai une tâche importante. l'Unique Clairvoyant et ses disciples comptent sur moi.
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_02");	//Ma vie précédente fait partie du passé maintenant. Dorénavant, je suis un GOR NA - un templier du Dormeur.
};
