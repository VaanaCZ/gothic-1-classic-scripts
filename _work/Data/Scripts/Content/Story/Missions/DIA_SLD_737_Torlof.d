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
	description = "Kdo jsi?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Kdo jsi?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Jsem Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Zapletl jsem se do vzpoury jako d�stojn�k kr�lovsk� flotily.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //Nebyl to dobr� n�pad. Velk� ��st pos�dky st�la na stran� kapit�na.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //Proto jsem tady.
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
	description = "R�d bych se k v�m p�idal.";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //R�d bych se k v�m p�idal.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Lee t� nep�ijme, dokud nebude m�t opravdov� d�vod, to ti ��k�m rovnou.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //A do t� doby bys m�l b�t s Laresem a jeho lidmi zadob�e.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Jestli chce� dobrou radu, chlap�e: ukradni n�co cenn�ho ze Star�ho t�bora nebo ze Star�ho dolu.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Jakmile chlapi zjist�, �e jsi proti Gomezovi, nebude� tu m�t ��dn� probl�my.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //A jak to m�m ud�lat?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Pot�ebuje� si z�skat jejich D�V�RU - a pak se jich zbav�!
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














