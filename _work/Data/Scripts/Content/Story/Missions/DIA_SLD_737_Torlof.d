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
	description = "�Qui�n eres?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //�Qui�n eres t�?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Soy Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Particip� en un mot�n como primer oficial de un barco de guerra del rey.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //No fue una buena idea. La mayor parte de la tripulaci�n estaba de parte del capit�n.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //As� fue como llegu� aqu�.
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
	description = "Me gustar�a unirme a vosotros.";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Me gustar�a unirme a vosotros.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Te advierto que Lee no te aceptar� hasta que hayas mejorado mucho.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //Y, hasta que eso ocurra, ser� mejor que tengas buenas relaciones con Lares y su gente.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Si quieres un consejo, muchacho, roba algo importante en el Campamento Viejo o la Vieja Mina.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //En cuanto los chicos comprendan que est�s en contra de G�mez, ya no tendr�s m�s problemas aqu�.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //�Y c�mo lo hago?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Necesitas ganarte su confianza. �Luego podr�s timarles!
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
	description = "Was kannst du mir �ber dieses Lager sagen?";
};                       

FUNC int DIA_Torlof_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_PERM_Info()
{
	AI_Output (other, self,"DIA_Torlof_PERM_15_00"); //Was kannst du mir �ber dieses Lager sagen?
	AI_Output (self, other,"DIA_Torlof_PERM_04_01"); //Ist wie auf'm Piratenschiff, Junge. Solange ab und zu ein fetter Fischzug gegen Gomez drin ist, sind die Banditen zufrieden.
	AI_Output (self, other,"DIA_Torlof_PERM_04_02"); //Wenn sie kein Erz mehr haben, um sich in der Kneipe vollaufen zu lassen, gibt's ne Menge Schl�gereien.
};

*/














