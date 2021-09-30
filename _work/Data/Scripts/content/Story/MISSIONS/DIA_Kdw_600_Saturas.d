// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Надеюсь, у тебя все получится!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Что ты здесь делаешь? Тебе сюда нельзя! Уходи!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "У меня есть важные новости из лагеря Братства!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //У меня есть важные новости из лагеря Братства!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Если тебе сам Кронос дал разрешение на встречу со мной, значит, случилось что-то действительно важное!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Юберион умер! Это случилось после Церемонии вызова Спящего!";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Юберион умер! Это случилось после великой Церемонии вызова Спящего!
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Это худшая новость из всех возможных.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Кто же возглавил братство? Не этот ли безумный властолюбец Кор Галом?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Нет! Кор Галом отвернулся от Братства. Он взял с собой нескольких Стражей и ушел неизвестно куда.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Как странно! Он же должен был стать преемником Юбериона!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Эти события убедили Гуру в том, что они ошиблись, избрав Спящего своим богом. Он оказался злым демоном.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Один из Гуру попытался убить меня, подпав под влияние Спящего, хотя перед этим я спас ему жизнь.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Кор Галом был единственным Гуру, который не отказался от своей веры в Спящего, несмотря на его истинную природу. Поэтому он покинул Болотный лагерь.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Все ясно! Что ж, я думаю, это к лучшему. Кор Ангар хороший человек, строгий, но честный.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Если кому-нибудь и удастся наладить ситуацию в Братстве после такой духовной катастрофы, то только ему.

	B_LogEntry		(CH3_EscapePlanNC,	"Я сообщил Сатурасу о событиях в Болотном лагере. Он обрадовался тому, что теперь Братство будет возглавлять Кор Ангар, а не Кор Галом.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "У меня есть альманах...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //У меня есть альманах...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Юберион использовал его для того, чтобы зарядить юнитор.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Очень хорошо. Нам понадобится эта книга, чтобы зарядить все пять камней-юниторов.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Я возьму ее!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "У меня есть один юнитор...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //У меня есть один юнитор...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //У тебя есть ключ, с помощью которого мы разрушим наши оковы.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //Это один из камней-юниторов, который помог создать магический Барьер.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //Если объединить все пять камней, то мы сможем пробить эту магическую стену.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Но для этого нам понадобится вся наша магическая сила!
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //Ты прав. Именно с этой целью мы собирали руду, а не отдавали ее королю в обмен на какие-то безделушки.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Как ты уже знаешь, каждый кусок руды содержит немного магической энергии. Всей энергии этой горы должно хватить на то, чтобы разрушить Барьер.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //Кажется, это будет опасно.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //Это будет не обычный взрыв, а магический. Он изменит только то, что имеет магическую природу. Для людей он не представляет никакой угрозы.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Вот, возьми юнитор. Надеюсь, он поможет нам выйти на свободу.

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ты используешь юнитор и альманах прямо сейчас?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Ты используешь юнитор и альманах прямо сейчас?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //До этого еще далеко. Мне нужны остальные камни-юниторы.
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //К сожалению, их у нас еще нет.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Я помогу тебе найти эти четыре камня.";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Я помогу тебе найти эти четыре камня.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Ведь я и сам хочу выбраться отсюда.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Ты должен знать, что эти поиски будут и трудными, и опасными.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //А так как наши отношения со Старым лагерем сейчас ухудшились, я не смогу дать тебе в помощь ни одного человека.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Тебе придется положиться только на свои силы.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Что ж... переживу. Я уже привык делать все сам.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Твоя уверенность похвальна, но кое-что тебе все же может пригодиться.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Возьми это карту. Она довольно старая, поэтому на ней можно найти места, в которых располагались юниторы до того, как мы создали этот Барьер.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Тебе понадобится это заклинание, оно поможет быстрее вернуться в лагерь.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //И еще: поговори с Риорданом. Он готовит для нас зелья.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Его дом ты найдешь на верхнем уровне.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Хм, хорошее начало! Не ожидал.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Но нужно найти еще три камня.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Иди и попытайся их раздобыть.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Хорошо, это уже второй камень. 
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Скоро мы сможем осуществить наш план.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Смело иди вперед и достань нам еще два камня.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Невероятно! У нас есть целых четыре камня!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Нам не хватает всего одного. Когда их будет пять, мы сможем приступить к делу.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Ты оказал нам неоценимую услугу. Но найди нам последний камень, и мы сможем освободиться из этой тюрьмы.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Отлично! У нас есть все пять камней!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Наш лагерь в неоплатном долгу перед тобой. Ты заслуживаешь мою вечную благодарность.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Сходи к Риордану. Конечно, его награда будет мала по сравнению с тем, что ты сделал для нас, но она того стоит.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Кронос тоже хотел тебя видеть. Он приготовил тебе небольшой подарок.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,	"Мне удалось найти все четыре юнитора. Сатурас доволен, как никогда. Ну, на этот раз мне удалось сделать что-то действительно полезное...");
		B_LogEntry		(CH3_BringFoci,	"У Кроноса и Риордана есть для меня небольшие подарки за то, что я нашел юниторы. Мне стоит встретиться с ними.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Auftrдge bekam.    ***Bjцrn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Ты прочитал заклинание телепортации, как я вижу. Возьми еще одно, вдруг пригодится.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "Я нашел юнитор в ущелье троллей!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Я нашел юнитор в ущелье троллей!

	B_LogEntry		(CH3_TrollCanyon,	"Я отдал Сатурасу юнитор из ущелья тролля.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "В горном форте я нашел один из юниторов.";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //В горном форте я нашел один из юниторов.

	B_LogEntry		(CH3_Fortress,		"Теперь у Сатураса есть юнитор из горного форта.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "Я нашел один из юниторов в разрушенном монастыре!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Я нашел один из юниторов в разрушенном монастыре!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Там я встретил наемника Горна, и он помог мне в поисках.

	B_LogEntry		(CH3_MonasteryRuin,	"Мне удалось принести Сатурасу юнитор из развалин монастыря.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "Я нашел юнитор в гробнице под каменным кольцом!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Я нашел юнитор в гробнице под каменным кольцом!

	B_LogEntry		(CH3_Stonehenge,	"Я принес Сатурасу юнитор из склепа под кругом камней.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Теперь мы можем взорвать рудную гору?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Теперь мы можем взорвать рудную гору?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Теперь у нас есть все необходимое, чтобы осуществить задуманное.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Только вот Барьер был сотворен двенадцатью магами.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //Чтобы направить эту огромную энергию туда, куда нужно, магов Круга Воды недостаточно.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //Что же здесь можно сделать?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Ты уже сделал для нас очень много, и мы в долгу перед тобой...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //... но если ты согласишься на мое предложение, ты спасешь всех жителей этой колонии.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "На какое предложение?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //На какое предложение?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Сходи в Старый лагерь и попытайся уговорить некоторых магов Круга Огня помочь нам.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //Магов Круга Огня? Не думаю, что они согласятся с твоим предложением.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //Если Барьер будет разрушен, они лишатся всей своей власти.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //Именно по этой причине я предлагаю тебе выполнить эту работу. У тебя есть знакомые во всех лагерях.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Скажи магам Огня, что мы все еще помним те старые добрые времена, когда мы вместе изучали магическое искусство.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "Что ж, я попытаюсь уговорить магов Огня.";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //Что ж, я попытаюсь уговорить магов Огня.
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Но я ничего не обещаю. По-моему, это почти невозможно.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Все же попробуй. Если тебе не удастся это сделать, то останется еще одно...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Лишь одно...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //... одно что?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Неважно! Ты должен уговорить их.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Возьми эту руну. Передай ее Корристо, верховному магу Круга Огня. Это знак нашего доверия.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Руна поможет ему перенестись ко мне, минуя стражу.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Думаю, это будет хорошим доказательством нашей дружбы.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Хорошо, что ты вернулся. Нас постигло большое несчастье!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Ну-ка, я попробую угадать, что случилось. Свободная шахта была захвачена стражниками Старого лагеря. Никто не видел, как они подошли к лагерю...
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Подожди... а откуда... ну, конечно... ты узнал это еще в Старом лагере!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Прямо перед тобой сюда пришел Горн.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Почему Гомез решился на этот шаг? Почему он захотел выместить на нас всю свою злобу?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Он же должен понимать, что его поступок может вызвать войну в колонии!
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Старая шахта обрушилась, после того как ее залила вода!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Старая шахта обрушилась, после того как ее залила вода!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //... Обрушилась... конечно... тогда все понятно.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Гомез лишился свой шахты и стал гораздо опаснее. Ему уже терять нечего, так что теперь он способен на все.
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Гомез убил всех магов Круга Огня!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Гомез убил всех магов Круга Огня!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //Убил всех?! Но зачем? Зачем он это сделал?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Они не покорились Гомезу и выступили против нападения на Свободную шахту.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Значит, мы обречены. Направлять энергию рудной горы можно только в кругу из двенадцати магов. А нас всего шесть.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Несмотря на то, что ты принес эту печальную весть, я благодарю тебя.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,	"Сатурас был расстроен моим сообщением о последних событиях в Старом лагере. Что будет дальше с его планом разрушения Барьера... Что ж, ему больше не придется рассчитывать на помощью магов Огня.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Меня изгнали из Старого лагеря за то, что я помог вам!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Меня изгнали из Старого лагеря за то, что я помог вам!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Изгнали из Старого лагеря, говоришь?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Мы с радостью примем тебя!

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,	"После того как меня прогнали из Старого лагеря, Сатурас пригласил меня присоединиться к Новому лагерю.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Значит ли это, что вы примите меня в наемники?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Значит ли это, что вы примите меня в наемники?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Об этом лучше поговорить с Ли. Приходи ко мне, когда этот вопрос будет решен.

	B_LogEntry			(CH4_BannedFromOC,	"Ли, лидер наемников, хочет поговорить со мной. После разговора с ним я должен вернуться к Сатурасу."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Значит ли это, что я буду принят в гильдию магов Круга Воды?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Значит ли это, что я буду принят в гильдию магов Круга Воды?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Нет. Сначала ты должен принести клятву воды.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Но я уже поклялся служить Огню!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Хм...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Твоя клятва Огню не будет нарушена!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Но... я не понимаю...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //К прежней клятве ты принесешь новую и станешь магом двух стихий!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Сила Огня и Знания Воды будут подвластны тебе!

	B_LogEntry			(CH4_BannedFromOC,	"Сатурас предложил мне вступить в Круг магов Воды. При этом моя клятва Огню не будет нарушена."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я готов принести клятву."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Я готов принести клятву.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Служитель Огня, приготовься получить благословение Воды!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Повторяй за мной слова клятвы:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Ich schwцre bei den Mдchten der Gцtter ... 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Ich schwцre bei den Mдchten der Gцtter ... 
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... und bei der Kraft des heiligen Wassers ... 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... und bei der Kraft des heiligen Wassers ... 
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Эта клятва соединила в тебе силу Огня и благословение Воды.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Соединила то, что до тебя было несоединимым. Отныне твоя жизнь будет знаком объединения стихий.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Возьми это одеяние и носи его в знак союза со священной Водой и с Аданосом. 

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,	"Он принял меня в Круг магов Воды. Теперь я принадлежу двум магическим школам одновременно."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты можешь стать моим учителем?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Ты можешь стать моим учителем?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Тебе еще многому нужно научиться. Приходи ко мне, когда будешь готов.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Я могу посвятить тебя в тот Круг магии, который тебе еще неизвестен, но только тогда, когда ты будешь готов.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Ты уже посвящен в Пятый Круг магии! Наши знания равны.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Я не смогу ничему научить тебя.
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Сатурас, глава магов Воды, может посвятить меня в тайны Кругов магии. Я смогу найти его у пентаграммы на втором уровне Нового лагеря.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Я готов вступить в Первый Круг.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Вступление в Первый Круг магии даст тебе умение использовать магические руны.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Каждая руна содержит в себе одно магическое заклинание.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Используя свою магическую силу, ты сможешь прочитать это заклинание.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Но в отличие от магических свитков, которые теряют свою силу после первого прочтения, заклинание руны можно читать снова и снова, и оно не иссякнет. 
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Каждая руна является источником магической силы, которая может быть задействована в любое время.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Как я уже сказал, при прочтении заклинания руны или свитка будет расходоваться твоя магическая сила.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Знания каждого нового Круга помогут тебе читать более сложные заклинания рун.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Используя силу рун, ты сможешь узнать, какой силой обладаешь сам.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Я готов к посвящению во Второй Круг.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Ты уже научился читать заклинания рун. Пришло время углубить твои знания.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Второй Круг магии даст тебе возможность читать сильные боевые заклинания, но самое главное, ты сможешь исцелять болезни.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Но тебе предстоит еще многому научиться, чтобы познать истинные тайны магии.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Ты уже знаешь, что можешь использовать любую руну, пока на это хватит твоей личной силы.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Но это крайний случай, и он не всегда оправдан. Тебе дана сила, которая может приносить смерть и разрушение.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Истинный маг использует ее лишь тогда, когда это действительно необходимо.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Внимательно следи за тем, что происходит вокруг, и тогда ты сможешь познать силу рун.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Я готов получить знания Третьего Круга.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Третий Круг - очень важная часть пути, который проходит каждый маг. Его постижением завершается твой поиск.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Ты уже на середине пути познания магии. Ты уже умеешь читать заклинания рун.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Это знание станет основой для дальнейшего совершенствования. Подумай, прежде чем использовать ту или иную руну.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Ты можешь читать ее или не читать, но твой выбор должен быть осознан.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Если ты сделал выбор, ты должен следовать ему не раздумывая.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Познай свой путь, и ты познаешь силу своих решений.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Я готов вступить в Четвертый Круг.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Тебе уже открыты знания трех Кругов магии. Пришло время познать ее тайны.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Магия руны сокрыта в камне. Камень этот получают при шлифовке магической руды.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Такой руды, которую добывают в здешних шахтах. Камень наделяется магической энергией в особых храмах. Так он становится орудием нашей силы.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Все руны, которые ты можешь использовать, открывают тебе доступ к знаниям и могуществу наших храмов.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Теперь ты выучил все, что знаю я сам.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Познай магию, и ты познаешь тайну своей силы.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FЬNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Я готов вступить в Пятый Круг.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Да будет так. Я открою тебе истинный смысл Пятого круга.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Посвященный в знания Пятого Круга может читать заклинания рун Огненный Шторм, Ледяная Волна и Истребление Нежити.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Но самым сильным заклинанием Пятого Круга является Волна Смерти. Если ты найдешь эту руну, в твоих руках окажется источник ужасных разрушительных сил.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Используй ее только в случае смертельной опасности, ведь она была дана богом Тьмы.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Теперь ты выучил все, что знаю я сам.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Узнай пределы возможного, и ты познаешь свою истинную силу.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Я хочу носить одеяние верховных магов Воды.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Ты еще не можешь носить такое облачение. Время еще не пришло.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Тебе не хватает руды.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Я вижу, что ты уже достоин носить облачение верховного мага Круга Воды.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Ли принял меня в наемники.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Ли принял меня в наемники.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Хорошо. Теперь ты один из нас, ты принадлежишь нашему лагерю.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Добро пожаловать!

	B_LogEntry			(CH4_BannedFromOC,	"Сатурас поздравил меня с тем, что я стал наемником.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Отправляя меня к магам Огня, ты сказал, что есть одно... что-то.";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Bjцrn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Bjцrn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Когда ты отправил меня к магам Огня, ты сказал, что есть еще одно... что-то.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Да, я надеялся, что нам не придется идти на эту меру... обращаться к нему... но все складывается так...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //К кому обращаться?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Хорошо, я скажу тебе!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Много лет назад...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Пожалуйста, без предыстории!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Не торопи меня! Все мы, двенадцать магов, вместе создавали Барьер, но наши силы объединял и направлял тринадцатый маг.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Тринадцатый? Я всегда думал, что вас было только двенадцать!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Большинство людей, пришедших в колонию после создания Барьера, думают точно также.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Тот тринадцатый маг был нашим предводителем. Это было еще до того, как мы разделились на магов Огня и Воды.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Но однажды он покинул Старый лагерь, который тогда был единственным в колонии.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "А как звали этого тринадцатого мага?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //А как звали этого тринадцатого мага?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Его звали Ксардас. Сейчас уже мало кто помнит, что это был за человек.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //А те, кто помнит, называют его повелителем демонов, некромантом!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Почему он ушел из Старого лагеря?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Почему он ушел из Старого лагеря?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Он стал изучать заклинания, призывающие нежить и дающие власть над магическими существами.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Его опыты не понравились Гомезу, и не только ему. Многие маги отвернулись от него и больше не признавали за ним власти.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //А что было потом?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //В отличие от Гомеза Ксардас не был грубым мясником и ушел из лагеря, чтобы избежать конфликта.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "А где он живет сейчас?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //А где он живет сейчас?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Он живет в уединении в башне, стоящей на земле орков.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //Их город находится на юге колонии.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Я найду Ксардаса и попрошу его о помощи!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Я найду Ксардаса и попрошу его о помощи!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Теперь только он сможет помочь нам.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Но если он не знает, как это сделать, или просто не захочет...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //Захочет!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Но есть еще одна проблема...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Проблема?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Проблема?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Да. Мы много раз пытались связаться с Ксардасом, но нам это ни разу не удалось.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Нам кажется, что он хочет, чтобы его оставили в покое.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Что ты имеешь в виду?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Никто из наших гонцов не вернулся из его башни.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Ты должен узнать, как можно пройти мимо его ужасных созданий.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Все интереснее и интереснее!
	
	B_LogEntry			(CH4_FindXardas,	"Сатурас сказал мне, что Ксардаса охраняют магические существа.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "И как же мне пройти мимо них?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //И как же мне пройти мимо них?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Я бы сказал тебе, если бы сам знал!
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Мой совет, поищи ответ на это в нашей библиотеке.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Может быть, в старых книгах есть что-то о силе и слабостях существ, порожденных магией.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Я просмотрю всю библиотеку. И не волнуйся...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Я еще вернусь!

	B_LogEntry			(CH4_FindXardas,	"В библиотеке магов Воды есть пергаменты, в которых описываются магические существа. Мне следует ознакомиться с ними.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlьsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Ты говорил с Ксардасом?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Ну..."										,KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Нет..."										,KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Все совсем не так, как ты думаешь..."	,KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Ну...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Ну?.. Ну что?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Дh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dьrfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Нет...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Почему?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Я пока не смог найти его башню...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Тебе надо найти его и спросить совета!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Все совсем не так, как ты думаешь...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Что ты имеешь в виду? Он должен найти способ взорвать эту железную гору.
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Рудная гора... э... она уже очень высокая!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Найди Ксардаса, он должен помочь нам!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Нефариус сказал, что я уже готов носить одеяние мага Воды."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Нефариус сказал, что я уже готов носить одеяние мага Воды.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Мы с радостью примем тебя!
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Значит ли это, что я буду принят в гильдию магов Круга Воды?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Нет. Сначала ты должен принести клятву воды. 
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Я готов принести клятву."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Я готов принести клятву.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Повторяй за мной слова клятвы:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Клянусь могуществом богов...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Клянусь могуществом богов...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... и силой священной Воды...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... и силой священной Воды...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...что знания и действия мои будут служить Воде отныне и до скончания веков...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...что знания и действа мои будут служить Воде отныне и до скончания веков...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Возьми это одеяние и носи его в знак союза со священной Водой и с Аданосом. 

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,	"Сатурас принял меня в Круг магов Воды.");

	AI_StopProcessInfos	(self);
};

