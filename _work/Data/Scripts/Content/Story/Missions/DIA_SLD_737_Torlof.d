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
	description = "Chi sei?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Chi sei?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Sono Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Sono stato coinvolto in un ammutinamento, in quanto secondo ufficiale di una nave da guerra Reale
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //Non è stata una buona idea. La maggior parte dell'equipaggio era dalla parte del capitano.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //Ecco perché mi trovo qui.
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
	description = "Vorrei unirmi a voi.";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Vorrei unirmi a voi.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Lee non ti prenderà con sé, finché non sarai diventato davvero in gamba.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //Fino ad allora, farai meglio a essere in buoni rapporti con Lares e la sua gente.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Ascolta il mio consiglio, ragazzo: ruba qualcosa d'importante da Campo Vecchio o dalla vecchia miniera.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Quando gli altri capiranno che sei contro Gomez, non ti daranno più problemi.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //E come faccio?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Devi conquistare la loro FIDUCIA e poi fregarli!
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














