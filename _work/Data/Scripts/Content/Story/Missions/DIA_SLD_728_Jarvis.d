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
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Эй, сзади!
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
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Ты собираешься пройти через эти ворота?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //А ты собираешься остановить меня?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Нет, но ты должен знать, что тебя там ожидает. Это тебе не Старый Лагерь, да и с сектой болотных придурков у нас мало общего.
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //Так что же меня там ожидает?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Здесь нет ни охранников, ни Стражей, чтобы присматривать за порядком. Здесь каждый сам за себя. Вместе держимся только мы, наемники.
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
	description	= "Чем занимаются наемники?";
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
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Чем занимаются наемники?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Мы - наемники на службе у магов Воды.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Наша главная цель - вырваться отсюда. Мы много работаем и не собираемся расслабляться, как те типы из Старого Лагеря, что живут за счет рудокопов.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //Мы все подчиняемся Ли. Он великий человек. Он один из тех, кто поддерживает порядок в этом чертовом Лагере.
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
	description	= "Чем занимаются маги?";
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
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Чем занимаются маги?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Они изучают магические свойства руды, которую 'скребки' добывают в шахте.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //Насколько мне известно, они собираются взорвать всю чертову гору руды, чтобы уничтожить Барьер и выбраться отсюда.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //Это должно быть опасно.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Они говорят, что мы не должны волноваться.
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
	description	= "У вас большие запасы руды?";
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
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //У вас большие запасы руды?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Можно сказать и так. Мы называем их железной горой. На нее можно купить даже жену короля.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Но мы не собираемся отдавать свою руду этому старому пердуну. Мы хотим ВЫБРАТЬСЯ ОТСЮДА!
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
	description	= "Где находится эта железная гора?";
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
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Где находится эта железная гора?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Никогда не видел целую гору руды, а? В центре пещеры есть большая дыра - руду сбрасывают туда.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Но близко к ней тебе все равно не подобраться. И маги, и наши люди - все охраняют руду и днем, и ночью.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Да я просто спросил.
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
	description	= "Что насчет остальных людей?";
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
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //Что насчет остальных людей?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Одно жулье - все, без исключения. На Лагерь им наплевать с высокого холма. Я бы скорее поручил какому-нибудь крестьянину охранять эти ворота, чем кому-нибудь из них.
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
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Скребки по-прежнему добывают руду. Когда они наберут достаточно, мы взорвем всю железную гору.
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
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Эй, я слышал, ты задал жару ползунам в шахте!
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Думаю, Ли с радостью примет тебя в ряды наемников. Просто поговори с ним.

	self.flags = 0;		// Immortal-Flag lцschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Я должен поговорить с Ли. Может быть, он позволит мне присоединиться к наемникам.");
};






	


