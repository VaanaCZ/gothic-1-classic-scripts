// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Combien de fois j'ai dit aux bâtards de ton espèce de ne pas passer par ma cabane !
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "Quel est ton problème ?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Quel est ton problème ?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Laisse-moi seul, mec ! Chacun est un problème pour MOI !
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Tout a commencé quand j'ai construit ma cabane.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Ne construit pas ta cabane près du fossé, ils m'ont dit.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Mais aucun de ces bâtards ne m'a dit ce qui arriverait si je le faisais.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Quand je suis revenu de la mine il y a quelques jours, j'avais une deuxième porte.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Ces porcs. Je les déteste. Je ne peux pas te dire combien je les déteste.
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Maintenant tout le monde passe par ma cabane. Tous les idiots.
};

	
	
	
	
	


















