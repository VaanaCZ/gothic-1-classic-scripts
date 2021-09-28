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
	description = "Как тебя зовут?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Как тебя зовут?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Меня зовут Торлоф.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Я служил старшим помощником на военном корабле и принял участие в мятеже.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //Ничего из этой затеи не вышло. Большая часть команды оказалась на стороне капитана.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //Так я попал сюда.
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
	description = "Я хочу присоединиться к вам!";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Я хочу присоединиться к вам!
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Ли не примет тебя в отряд, пока не узнает, чего ты стоишь.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //А до тех пор тебе лучше поддерживать хорошие отношения с Ларсом и его шайкой.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Если нужен совет, я скажу тебе вот что: добудь что-нибудь важное из Старого Лагеря или Старой Шахты.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Как только эти парни поймут, что ты тоже против Гомеза, проблем у тебя станет значительно меньше.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //И как это провернуть?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Сначала тебе придется завоевать их ДОВЕРИЕ - и только потом ограбить.
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














