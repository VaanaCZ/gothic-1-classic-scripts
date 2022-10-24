
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Где-то здесь должно быть логово ползунов."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Где-то здесь должно быть логово ползунов.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Да, эта гора и есть одно большое логово ползунов!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Почему эта шахта перекрыта?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Ползунов развелось слишком много, сколько бы мы их не били.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Кажется, логово должно быть где-то недалеко. Открой для меня эти ворота!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Нет! Их можно открыть только с разрешения Яна! Без его приказа я даже с места не сдвинусь. 
	
	B_LogEntry		(CH2_MCEggs,	"Асгхан, глава стражников шахты, отказывается открывать мне ворота. Он хочет, чтобы я спросил у Яна разрешение на это.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Эй, Асгхан, ты можешь открыть ворота!"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Эй, Асгхан, ты можешь открыть ворота!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Я уже сказал: только с разрешения Яна...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Асгхан... Все будет в порядке... и привет тебе от Яна.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Ну, если Ян согласен за это отвечать... Но есть одно условие!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //И что это за условие?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Мне нужна помощь. Двух-трех стражей будет достаточно. А то не хочется приветствовать всех этих ползунов в одиночестве!
	
	B_LogEntry		(CH2_MCEggs,	"Ян разрешил мне зайти в Заброшенную шахту. Но мне нужно еще заручиться поддержкой нескольких Стражей. Тогда Асгхан откроет мне ворота.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Теперь все готово. Можно открыть ворота!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Теперь все готово. Можно открыть ворота!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Давай, открывай. Представление начинается!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,	"Я собрал нескольких Стражей у ворот в Заброшенную шахту. Что ждет нас впереди?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ползуны больше не будут угрожать рудокопам!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Ползуны больше не будут угрожать рудокопам!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Отличная новость. Надо сообщит это Торусу!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz lдuft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Эй, как дела?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Эй, как дела?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Хорошо... пока никто не стремится выпустить ползунов и мне не надо никого калечить.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //А что же скрывается за этими воротами?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Ползуны. Здоровые, мерзкие хищники. И их здесь очень, очень много.
};  



































