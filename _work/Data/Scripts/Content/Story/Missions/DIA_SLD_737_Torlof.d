// ********************************
// 				EXIT
// ********************************

instance DIA_Torlof_EXIT (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_EXIT_Condition;
	information	= DIA_Torlof_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Torlof_Hallo (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 1;
	condition	= DIA_Torlof_Hallo_Condition;
	information	= DIA_Torlof_Hallo_Info;
	permanent	= 0;
	description = "Qui es-tu ?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Qui es-tu ?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Je suis Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //J'ai été impliqué dans une mutinerie comme marin d'un vaisseau de guerre royal.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //Ce n'était pas une si bonne idée. Une grande partie de l'équipage était du côté du capitaine.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //C'est pourquoi je suis arrivé ici.
};

// ********************************
// 				Mitmachen
// ********************************

instance DIA_Torlof_Mitmachen (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 2;
	condition	= DIA_Torlof_Mitmachen_Condition;
	information	= DIA_Torlof_Mitmachen_Info;
	permanent	= 1;
	description = "Je voudrais vous rejoindre.";
};                       

FUNC int DIA_Torlof_Mitmachen_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	||	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Je voudrais vous rejoindre.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Lee ne te prendra pas tant que tu ne seras pas vraiment bon, je te le dis tout de suite.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //Et jusque-là tu ferais bien de rester en bons termes avec Lares et sa bande.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Tu veux un conseil, gamin : vole quelque chose d'important du Vieux camp ou de la vieille mine.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Dès que les gars verront que tu es contre Gomez, tu n'auras plus d'ennui.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //Et comment est-ce que je fais cela ?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Tu dois gagner leur CONFIANCE - et après tu peux les embrouiller !
};

/*

// ********************************
// 				PERM
// ********************************

instance DIA_Torlof_PERM (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 3;
	condition	= DIA_Torlof_PERM_Condition;
	information	= DIA_Torlof_PERM_Info;
	permanent	= 1;
	description = "Was kannst du mir über dieses Lager sagen?";
};                       

FUNC int DIA_Torlof_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_PERM_Info()
{
	AI_Output (other, self,"DIA_Torlof_PERM_15_00"); //Was kannst du mir über dieses Lager sagen?
	AI_Output (self, other,"DIA_Torlof_PERM_04_01"); //Ist wie auf'm Piratenschiff, Junge. Solange ab und zu ein fetter Fischzug gegen Gomez drin ist, sind die Banditen zufrieden.
	AI_Output (self, other,"DIA_Torlof_PERM_04_02"); //Wenn sie kein Erz mehr haben, um sich in der Kneipe vollaufen zu lassen, gibt's ne Menge Schlägereien.
};

*/














