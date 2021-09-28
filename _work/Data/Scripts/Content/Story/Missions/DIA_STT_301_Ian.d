
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
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Я просто осмотрюсь немного.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Только чтобы от тебя не было никаких проблем!
	
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
	description		= "Ты ведь Ян, начальник шахты?"; 
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
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Ты ведь Ян, начальник шахты?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Да, я - Ян. И это моя шахта, так что ничего здесь не трогай и ничего не сломай!
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Разве эта шахта принадлежит не Гомезу?"; 
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
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Разве эта шахта принадлежит не Гомезу?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Да, конечно, это шахта Старого Лагеря. Но здесь есть только один босс - и это я.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Может расскажешь, как здесь добывается руда?"; 
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
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Может расскажешь, как здесь добывается руда?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Руду здесь добывают днем и ночью. Каждый месяц мы отправляем 200 мешков на склад и еще 20 - на переплавку.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Из той руды, что мы поставляем королю, можно выплавить не одну сотню клинков.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я слышал, у этой руды есть и магические свойства."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //Я слышал, у этой руды есть и магические свойства. Можешь рассказать мне об этом?
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Да, у магической руды есть особые свойства. Оружие, которое из нее выплавляют, никогда не ломается, и клинки выходят куда острее, чем обычные.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //У армии, вооруженной такими мечами, будет серьезное преимущество в бою.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Можешь рассказать еще что-нибудь о руде?"; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Можешь рассказать еще что-нибудь о руде?
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //К сожалению, магические свойства руды пропадают при переплавке. Как избежать этого знают только в плавильнях Нордмара.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Но даже и без магии оружие, выкованное из этой руды, куда прочнее и острее обычных клинков.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Расскажи мне о шахте."; 
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
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Расскажи мне о шахте.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Если захочешь побродить здесь, смотри в оба. В пещерах полно ползунов, так что лучше оставаться в главной шахте.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //И не приставай к Стражам. Пусть даже они просто шляются здесь с важным видом - все равно нет никого лучше них, когда дело доходит до драки с ползунами.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Буду иметь в виду.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Ладно, у меня есть дела. И вот еще что: не отвлекай моих парней от работы!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Я просто поброжу здесь немного.
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
	description		= "Я пришел, чтобы забрать список припасов для шахты."; 
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
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Я пришел, чтобы забрать список припасов для шахты.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Ну надо же. Проваливай!
	 
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
	description		= "Меня прислал Диего. Я должен забрать список."; 
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
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Меня прислал Диего. Я должен забрать список.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //Хорошо, вот тебе список. Скажи им, чтобы поторопились с доставкой.
	B_LogEntry  (CH1_BringList,"Ян дал мне список без всяких проблем.");
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
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Где-то здесь должно быть логово ползунов.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Я думаю, таких здесь не меньше дюжины.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Слушай, мне нужно добраться до логова ползунов...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //У меня сейчас нет времени. Пресс не работает. Чертова шестеренка сломалась пару часов назад.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //И я понятия не имею, где искать новую.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Давай так: ты находишь мне шестеренку, а я помогаю тебе.

	B_LogEntry		(CH2_MCEggs,"Ян, начальник шахты, не будет мне помогать в поисках гнезда. Лучше бы мне поторопиться и раздобыть ему шестеренку для пресса. Он что-то говорил о старых прессах в заброшенных боковых туннелях.");

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
	description = "Шестеренку? И где мне ее искать?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Шестеренку? И где мне ее искать?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Представления не имею, так же, как и ты. 
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //Но в боковой шахте есть старый пресс. Может, нам повезет и там есть такая же?
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я достал шестеренку.";
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
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Я достал шестеренку.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Эй, отличная работа! Думаю, она подойдет. Ладно, ты, кажется, искал логово ползунов... Х-мм...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Сходи к Асгхану и попроси его открыть ворота, чтобы ты мог поискать в темных шахтах.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Скажи ему: 'Все будет нормально', - так он будет знать, что это я дал тебе разрешение.

	B_LogEntry		(CH2_MCEggs,"Я принес Яну шестеренку от старого пресса. Он поведал мне, что Асгхану следует сказать ВСЕ БУДЕТ В ПОРЯДКЕ. Каким-то образом это заставит его открыть ворота.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я так и не нашел логово этих тварей.";
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
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Я так и не нашел логово этих тварей.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Я же говорил тебе: сходи к Асгхану. Он командует стражниками. Ты найдешь его на нижнем уровне.

	B_LogEntry		(CH2_MCEggs,"Если я хочу разыскать кладку яиц ползунов, то мне надо поговорить с Асгханом.");
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
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //И в шахте теперь будет тихо и спокойно. Ха-ха-ха!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Ладно, я не хотел тебя обидеть. Молодец, парень!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Вот, возьми себе этот ящик пива за труды.
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
	description = "Я нашел логово ползунов! И яйца, отложенные их королевой!";
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
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Я нашел логово ползунов! И яйца, отложенные их королевой!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Что? Это все яйца, которые ты нашел? Ну что ж, ты доказал, что умеешь драться.
};
