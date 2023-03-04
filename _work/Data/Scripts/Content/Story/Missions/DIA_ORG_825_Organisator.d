// **************************************************
//						 EXIT 
// **************************************************

instance  Org_825_Organisator_Exit (C_INFO)
{
	npc			= Org_825_Organisator;
	nr			= 999;
	condition	= Org_825_Organisator_Exit_Condition;
	information	= Org_825_Organisator_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_825_Organisator_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_825_Organisator_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						PERM
// **************************************************

instance  Org_825_Organisator_PERM (C_INFO)
{
	npc			= Org_825_Organisator;
	nr			= 1;
	condition	= Org_825_Organisator_PERM_Condition;
	information	= Org_825_Organisator_PERM_Info;
	permanent	= 1;
	description = "Que gardes-tu ?";
};                       

FUNC int  Org_825_Organisator_PERM_Condition()
{
	return 1;
};

FUNC VOID  Org_825_Organisator_PERM_Info()
{
	AI_Output (other, self,"Org_825_Organisator_PERM_15_00"); //Que gardes-tu ?
	AI_Output (self, other,"Org_825_Organisator_PERM_07_01"); //Nous veillons à ce qu'aucune personne de la bande de Lee ou de celle de Gomez n'approche trop près de Lares.
	AI_StopProcessInfos	(self);
};
