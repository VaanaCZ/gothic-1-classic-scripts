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
	description = "Кто ты такой?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Кто ты такой?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Торлоф.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Я был одним из главных организаторов мятежа на одном из военных кораблей. 
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //Не стоило этого затевать. Большая часть команды была на стороне капитана.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //Вот поэтому я и попал сюда.
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
	description = "Я хочу стать одним из вас.";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Я хочу стать одним из вас.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Ли не возьмет к себе неизвестно кого. Сначала ты должен показать, на что ты способен.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //А до этого тебе придется иметь дело с Ларсом и его шайкой.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Если хочешь, послушайся моего совета: укради что-нибудь ценное из Старого лагеря или из Старой шахты.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Если воры из шайки Ларса поймут, что ты тоже против Гомеза, тебя легко примут в наш лагерь.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //А как мне украсть что-то ценное?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Сначала постарайся войти к ним в доверие, а потом ты запросто сможешь их ограбить!
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
	description = "Was kannst du mir ьber dieses Lager sagen?";
};                       

FUNC int DIA_Torlof_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_PERM_Info()
{
	AI_Output (other, self,"DIA_Torlof_PERM_15_00"); //Was kannst du mir ьber dieses Lager sagen?
	AI_Output (self, other,"DIA_Torlof_PERM_04_01"); //Ist wie auf'm Piratenschiff, Junge. Solange ab und zu ein fetter Fischzug gegen Gomez drin ist, sind die Banditen zufrieden.
	AI_Output (self, other,"DIA_Torlof_PERM_04_02"); //Wenn sie kein Erz mehr haben, um sich in der Kneipe vollaufen zu lassen, gibt's ne Menge Schlдgereien.
};

*/














