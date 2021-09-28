// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Эй, будь осторожен!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Ты хочешь пройти в эти ворота, да?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //А ты хочешь меня остановить?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Нет, но тебе следует знать, что тебя за ними ждет. Это не Старый лагерь и не Лагерь сумасшедших сектантов.
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //И как здесь живется?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //У нас нет охранников или Стражей, которые следят за порядком. Здесь каждый сам за себя. Только мы, наемники, стоим друг за друга.
};

// ************************************************************
// 						Sцldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "А чем занимаются наемники?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //А чем занимаются наемники?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Мы служим магам Воды. Мы их защищаем.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Все, что мы хотим, - это вырваться из этой колонии. У нас тяжелая работа, но мы не хотим променять на 'удобную' жизнь под крылышком Гомеза, чьи люди живут за счет рудокопов.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //Наш лидер Ли. Он великий человек. Только благодаря ему наш лагерь еще не развалился.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "А что делают здесь маги?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //А что делают здесь маги?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Они изучают магические свойства руды, которую добывают наши рудокопы.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //Насколько я знаю, они хотят взорвать эту гору руды, которую мы уже собрали. Они думают, что этот взрыв уничтожит Барьер.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //Наверное, это будет очень опасно.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Они говорят, что такой взрыв не опасен для людей.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "Здесь есть большая гора руды?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Здесь есть большая гора руды?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Я бы сказал, да. Думаю, нашей руды хватит даже на то, чтобы купить королеву.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Но мы ни за что не отдадим свою руду этому старику. Мы готовы заплатить эту цену за нашу свободу.
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "А где находится рудная гора?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //А где находится рудная гора?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Ты хочешь увидеть целую гору руды? Всю нашу руду мы складываем в центре пещеры.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Но к горе никому нельзя приближаться. Ее постоянно охраняют маги и наемники.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Да я просто так спросил.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "А кто еще живет в лагере?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //А кто еще живет в лагере?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //В основном здесь живут воры. Порядок в лагере их не беспокоит. Я бы им даже охрану ворот не доверил, по-моему, от крестьян гораздо больше пользы, чем от них.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "Как идут дела?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Как идут дела?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Как обычно рудокопы добывают руду. Когда ее будет достаточно, мы взорвем гору.
};

/*------------------------------------------------------------------------
//							SЦLDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Эй, я слышал, что ползунов в шахте стало гораздо меньше. И все благодаря тебе.
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Думаю, Ли с радостью примет тебя к себе. Поговори с ним об этом.

	self.flags = 0;		// Immortal-Flag lцschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Я должен поговорить с Ли. Может быть, он возьмет меня к себе в наемники.");
};






	


