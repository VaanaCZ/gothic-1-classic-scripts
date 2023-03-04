// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "Qui es-tu ?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Qui es-tu ?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Ils m'appellent Scar.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "Quel est ton travail ?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Quel est ton travail ?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Arto et moi veillons a ce que personne ne puisse voir Gomez sans y être invité.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Et je m'assure que les femmes ne s'impatientent pas.
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "Quand ils m'ont amené ici, j'ai vu une femme par terre...";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Quand ils m'ont jeté ici, j'ai vu une femme en train de descendre des provisions.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //Et alors?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Elle est là?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Ecoute, au cas où elle t'intéresserais, laisse-moi te donner un bon conseil : oublie-la.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Elle est juste venue ici et Gomez l'a enfermée à clef dans sa chambre.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Quand il a eu fini avec elle, il l'a emmené en bas. Mais maintenant, elle est À LUI - aussi tu ferais mieux de ne plus y penser.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 1;
	description = "C'est tout ce que tu peux me dire sur Gomez ?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //C'est tout ce que tu peux me dire sur Gomez ?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //Tout ce que tu dois savoir est qu'il est l'homme le plus puissant de la colonie.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Il peut avoir tout ce qu'il veut, mais ce qu'il veut vraiment c'est le pouvoir
};

