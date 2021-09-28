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
	description = "¿Quién eres?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //¿Quién eres tú?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Soy Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Participé en un motín como primer oficial de un barco de guerra del rey.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //No fue una buena idea. La mayor parte de la tripulación estaba de parte del capitán.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //Así fue como llegué aquí.
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
	description = "Me gustaría unirme a vosotros.";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Me gustaría unirme a vosotros.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Te advierto que Lee no te aceptará hasta que hayas mejorado mucho.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //Y, hasta que eso ocurra, será mejor que tengas buenas relaciones con Lares y su gente.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Si quieres un consejo, muchacho, roba algo importante en el Campamento Viejo o la Vieja Mina.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //En cuanto los chicos comprendan que estás en contra de Gómez, ya no tendrás más problemas aquí.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //¿Y cómo lo hago?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Necesitas ganarte su confianza. ¡Luego podrás timarles!
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














