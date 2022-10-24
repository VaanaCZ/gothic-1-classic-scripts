
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Могу осмотреть шахту?
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Только не создавай нам лишних проблем.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты Ян, главный человек в этой шахте?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Ты Ян, главный человек в этой шахте?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Да, меня зовут Ян. Это моя шахта. Тебе лучше ничего здесь не трогать, и постарайся ничего не сломать.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я думал, что эта шахта принадлежит Гомезу."; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Я думал, что эта шахта принадлежит Гомезу.
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Конечно, эта шахта принадлежит Старому лагерю, но здесь, внизу, вся власть принадлежит мне и больше никому.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты можешь рассказать мне о добыче руды?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Ты можешь рассказать мне о добыче руды?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Рудокопы добывают здесь руду днем и ночью. Наша выработка составляет 220 мешков руды, 20 из них идет на переплавку. 
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Из всей руды, которую мы поставляем королю, можно выковать не одну сотню клинков.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я слышал, что это не простая руда... Ты можешь рассказать о ней?"; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //Я слышал, что это не простая руда, а магическая. Ты можешь рассказать мне о ней?
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Магическая руда обладает особыми свойствами. Оружие из нее никогда не ломается, а клинки выходят гораздо острее, чем из обычного железа. 
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Армия солдат с таким оружием имеет серьезное преимущество в любой битве.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "А ты знаешь о руде еще что-нибудь?"; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //А ты знаешь о руде еще что-нибудь?
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //К сожалению, руда теряет магические свойства при переплавке. Только в плавильнях Нордмара знают правильный способ. 
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Но даже в этом случае оружие из нашей руды превосходит обычное оружие по многим параметрам и наносит больший урон врагу.  
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Расскажи мне об этой шахте."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Расскажи мне об этой шахте.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Если ты захочешь осмотреть шахту, тебе не следует далеко отходить от основного ствола. В дальних забоях обитает очень много ползунов.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //И постарайся не отвлекать стражников. Большую часть времени они ничего не делают, но уж если поблизости окажется ползун, они смогут тебя защитить.  
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Хорошо, я это запомню.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Ладно, у меня еще много дел. Но помни, не мешай моим людям работать.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Я просто посмотрю шахту.   
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Мне нужно забрать список для лагеря."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Мне нужно забрать список для лагеря.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Так это каждый может сказать. Убирайся!
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Диего прислал меня сюда. Я должен забрать список."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Диего прислал меня сюда. Я должен забрать список.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //Понятно, вот тебе список. Они должны поторопиться с доставкой.
	B_LogEntry  (CH1_BringList,"Ян без проблем передал мне список для Диего.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Где-то здесь должно быть логово ползунов.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Где-то в этой шахте есть гнездо или логово ползунов.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Я думаю, в шахте очень много их гнезд.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Слушай, мне нужно найти одно из них...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //У меня сейчас нет на это времени. У нас пресс сломался. Пару часов назад сломалась шестеренка. Вся работа стоит. 
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //И я не знаю, где здесь можно найти новую.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Но если ты поможешь починить пресс. Я помогу тебе.

	B_LogEntry		(CH2_MCEggs,	"Ян не будет помогать мне искать логово ползунов. Сначала я должен найти ему новую шестеренку. Он сказал, что следует посмотреть в одной из заброшенных штолен. Где-то там должен стоять старый пресс.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "А где я могу найти эту самую шестеренку?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel:", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //А где я могу найти эту самую шестеренку?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Понятия не имею. Я знаю столько же, сколько и ты.
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //Правда, по-моему, в одной из штолен есть старый сломанный пресс.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я нашел шестеренку.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Пресс");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Я нашел шестеренку.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //О! Отличная работа! Думаю, она как раз подойдет. Что ж, вернемся к твоей проблеме. Ты искал логово ползунов, да? Хм...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Сходи к Асгхану, он откроет тебе ворота. Возможно, то, что ты ищешь, находится именно там.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Скажи ему: 'Все будет в порядке'. Так он узнает, что я дал свое согласие.

	B_LogEntry		(CH2_MCEggs,	"Я принес Яну шестеренку, снятую со старого рудного пресса. Он сказал, что когда я буду говорить с Асгханом, я должен сообщить ему слова 'Все будет в порядке'. Тогда он откроет ворота в Заброшенную шахту.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я все еще не нашел логово ползунов!";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Я все еще не нашел логово ползунов!
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Я же сказал, пойди к Асгхану. Он возглавляет стражников. Ты найдешь его на нижнем горизонте.

	B_LogEntry		(CH2_MCEggs,	"Если я хочу найти логово ползунов, я должен поговорить с Асгханом.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я нашел логово ползунов!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Я нашел логово ползунов!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //В шахте снова будет тихо и спокойно!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Ладно, не обижайся. Ты хорошо поработал! 
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Вот, возьми себе этот ящик пива. Это твоя награда.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я нашел логово ползунов. А еще в нем были вот эти яйца.";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Я нашел логово ползунов. А еще в нем были вот эти яйца.
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Что? Ты нашел так мало яиц? Ну, что ж, ты хотя бы доказал, что умеешь драться.
};
