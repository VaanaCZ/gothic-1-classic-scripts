// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Идем!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Да хранит тебя Спящий!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Ты обратился к Гуру! Никогда больше не делай этого! Это большой грех! Если господин захочет поговорить с тобой, он САМ обратится к тебе.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Как тебя зовут?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Кто ты?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Меня зовут Лестер. Я занимаюсь прибывающими сюда чужеземцами.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Хорошо, что ты не заговорил с Идолом Намибом. Посторонним не позволено обращаться к Гуру.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Но я хочу поговорить с твоим господином.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Но я хочу поговорить с твоим господином.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Лучше забудь об этом! Уверен, что я смогу помочь тебе не хуже.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Расскажи мне об этом Лагере.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Расскажи мне об этом Лагере.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Что ты хочешь узнать?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Расскажи мне о гильдиях.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Расскажи мне о Спящем.",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Расскажи мне о болотнике.",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Расскажи мне о гильдиях.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Верховную гильдию представляют Гуру. В них живет дух нашего Лагеря, им дарована великая сила. Следом идут Стражи. Их сила находит применение в боях во славу Спящего.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Стражи славятся неукротимой силой духа. БОЙСЯ встать у них на пути! Я же являюсь послушником. Мы молимся Спящему и выполняем всю работу по Лагерю.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Некоторым послушникам удается стать Гуру, но для того чтобы достичь этого, необходимо учиться долгие годы.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Расскажи мне о Спящем.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Спящий - божественное существо. Он дарует людям видения - правда, этой чести удостаиваются лишь Гуру.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Мы молимся ему, и он ниспошлет нам свободу.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //И ты веришь во все это?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Послушай, я пробыл здесь уже два года. Знаешь ли ты, каково это - прожить ДВА ГОДА внутри Барьера?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Ты просто не представляешь, во что я готов поверить, ради того чтобы убраться отсюда!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Расскажи мне о болотнике.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Болотник растет на болотах - это все знают. Разумеется, прежде чем курить, его нужно обработать должным образом. Этим как раз занимаются послушники.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Болотник расслабляет тело и успокаивает сознание, помогает сосредоточиться на главном и способствует познанию истины. 
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Мы обмениваем его на товары из Старого Лагеря и нанимаем с его помощью новых людей.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Конечно, кто-то присоединяется к нам только из-за болотника. Что ж, по крайней мере, они помогают нам в работе по Лагерю.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "Я хочу стать членом Братства!";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Я хочу стать членом Братства!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Готов ты к этому или нет, будет решать Кор Галом.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Но он прислушивается и к мнению других Гуру - Идола Намиба, например. 
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Ты должен доказать свою преданность, и рано или поздно кто-то из Гуру направит тебя к Кор Галому.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "Но что я могу сделать, если никто из Гуру не говорит со мной?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Но что я могу сделать, если никто из Гуру не желает со мной разговаривать?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Тебе только так кажется. Гуру наблюдают за всем, что происходит в Лагере.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Если они решат, что ты достоин стать членом Братства, они заговорят с тобой.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Тебе придется ждать подходящего случая, чтобы доказать им свою преданность.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Если я хочу присоединиться к Братству Болотного Лагеря, то мне нужно произвести впечатление на Гуру. К сожалению, они не разговаривают с незнакомцами. Лестер, тоже новичок, сказал мне, что они будут наблюдать за мной, и поэтому надо стараться произвести на них впечатление. Не имею ни малейшего представления, как это сделать! Пока же стоит осмотреться получше в Лагере.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "Как заставить твоего господина заговорить со мной?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Как заставить твоего господина заговорить со мной?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Нужно знать, что он хочет от тебя услышать.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //И что же?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Слушай. Когда в следующий раз увидишь нас вместе, заговори со мной.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Идол Намиб беспокоится из-за того, что многие послушники молятся не только Спящему, но и своим старым богам.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Ты скажешь мне, что отрекся от старых богов, и что отныне ты будешь молиться только Спящему. 
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Когда я спрошу, почему ты решил так поступить, ответишь, что тебе было видение, в котором Спящий призвал тебя.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Его это заинтересует. Ты справишься?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Без проблем.
	
	B_LogEntry	(CH1_JoinPsi,"Чтобы произвести впечатление на Идола Намиба, надо завести с с Лестером разговор о старых богах и Спящем, когда он будет рядом.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //А-А! РАД ВИДЕТЬ ТЕБЯ СНОВА. КАК ТВОИ ДЕЛА?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "Я ОТРЕКСЯ ОТ СТАРЫХ БОГОВ.";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //Я ОТРЕКСЯ ОТ СТАРЫХ БОГОВ.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //В САМОМ ДЕЛЕ? ПОЧЕМУ ТЫ РЕШИЛ ТАК ПОСТУПИТЬ?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //МНЕ БЫЛО ВИДЕНИЕ: СПЯЩИЙ ГОВОРИЛ СО МНОЙ.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //ЧТО ОН СКАЗАЛ?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //ОН СКАЗАЛ: ИДИ В ЛАГЕРЬ НА БОЛОТАХ И СТАНЬ ЧЛЕНОМ БРАТСТВА.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //ТЫ СКАЗОЧНО БОГАТ, НЕЗНАКОМЕЦ: НЕМНОГИМ ЛЮДЯМ СПЯЩИЙ ДАРУЕТ ТАКУЮ НАГРАДУ.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "Как ориентироваться здесь, в Лагере?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Как ориентироваться здесь, в Лагере?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Я могу показать тебе основные места.
};

// **************************************************
//				FЬHRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "Мы уже пришли?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //Мы уже пришли?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Если ты будешь каждую минуту останавливать меня, мы никогда туда не доберемся.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ДNDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "Я передумал.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Я передумал.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Если что, ты знаешь, где меня найти.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------FЬHRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Где находится..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Где находится...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... вход в Лагерь?",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... кузница?",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... храм?",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... обитель наставников?",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"... лаборатория?",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... кузница.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Иди за мной!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... храм.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Иди за мной!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //... наставники.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Иди за мной!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... лаборатория.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Иди за мной!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Здесь ты найдешь Идола Кадара. Он обучает послушников.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Поднимайся по лестнице к тренировочной площадке Стражей. Я буду ждать тебя здесь. Если опоздаешь, ищи меня у входа в Лагерь - я буду там с Идолом Намибом.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Это храм. Я подожду тебя, но если ты задержишься надолго, мне придется вернуться к Идолу Намибу.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Это кузница. Я могу ждать тебя не больше часа, потом мне придется уйти.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauthдndler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Если поднимешься по этой лестнице, то попадешь к Кор Галому, алхимику. Внизу живет Фортуно, он торгует болотником.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Я буду ждать тебя здесь. Только не долго, а то мне нужно уходить.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral fьr alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Как хорошо, что ты здесь. У меня для тебя есть новости.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Хорошие новости, я надеюсь.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //У Братства есть большие планы.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Планы? Какие? Вырваться на свободу?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Гуру пытаются призвать спящего. Но необходимо нечто, что объединит их усилия.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //Да, и...
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Им нужен магический артефакт, называемый юнитор.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Но какое отношение это имеет ко мне?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Но какое отношение это имеет ко мне?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Поговори с Ю`Берионом. Он самый могущественный человек в Братстве. Используй эту возможность, чтобы завоевать его расположение.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Где мне его искать?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Отправляйся в храм. Он редко покидает его. Возможно, он чувствует себя ближе к Спящему среди холодных камней.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Лестер сказал мне, что Ю'Берион ищет магический камень-юнитор. Гуру можно найти внутри храмовой горы.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Эй, что ты здесь делаешь?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Я здесь по приказу магов Воды. Я ищу магические камни, называемые также юниторами.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Ты ищешь юниторы? Храбрый парень.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Сатурас и другие маги из Нового Лагеря хотят использовать их для того, чтобы взорвать Барьер и освободить нас из заточения.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Я поверю в это, только когда увижу своими собственными глазами.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Могу сказать то же самое. Но как ты оказался здесь?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Я тут размышляю, не зглянуть ли мне в старый форт в горах.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Знаешь... Мне бы весьма пригодился один документ... С другой стороны, отправляться туда одному довольно опасно. 
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Как ты сумел миновать эту живую гору?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Как ты сумел миновать эту живую гору?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Я многому научился у Гуру. Мне поможет магия.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Что за документ ты разыскиваешь?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Что за документ ты разыскиваешь?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Много лет назад в форте жил правитель этих земель. Он владел землей и всеми шахтами.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Разумеется, у него был документ, подтверждающий право владения - как и у любого аристократа. Эту бумагу я и хочу отыскать.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Но здесь, внутри Барьера, от нее не будет никакого прока.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Верно. Но если магам Воды удастся уничтожить Барьер, этот документ вновь обретет свою цену.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Мы могли бы заглянуть в форт вместе!"; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Мы могли бы заглянуть в форт вместе!
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Хорошая идея. Иди вперед, я буду рядом.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"Я встретил Лестера из Болотного Лагеря перед крепостью, которая просто вросла в гору. Он разыскивает в здании документ и присоединился к моим поискам юнитора.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Похоже, твой юнитор там, наверху.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Да, действительно похоже. Х-м... Добраться до него не так-то легко...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"Юнитор, который я разыскивал, покоится на пьедестале. Он слишком высок, чтобы на него взобраться. Надо найти другой путь.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ЬBER DIE BRЬCKE OHNE DEN AUFTRAG ERFЬLLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Куда ты? Мы еще не закончили поиски.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я ранен. Ты можешь мне помочь?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Я ранен. Ты можешь мне помочь?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Возьми целебный эликсир.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE FЬR LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я нашел твою бумагу."; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Я нашел твою бумагу.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Отлично! Возьми эти свитки. Они помогут тебе добраться до юнитора.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Я буду ждать тебя внизу, у пьедестала.

	B_LogEntry		(CH3_Fortress,"Документ на право собственности, который искал Лестер, был в сундуке. В обмен на него парень дал мне четыре свитка с заклинанием телекинеза. Я смогу использовать их, чтобы добраться до юнитора.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Как добраться до юнитора?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Как добраться до юнитора?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Господин Ю`Берион однажды сказал: 'Невежда передвигает предметы руками, а мастер - силой своего духа'.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Я останусь здесь и поищу бумагу.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Пойду поищу наверху.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Теперь мы оба нашли то, что хотели. Я останусь здесь и буду изучать старые книги.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Мы еще встретимся.

	B_LogEntry		(CH3_Fortress,"Юнитор в моих руках. Лестер хочет еще немного побродить по библиотеке крепости. Интересно, когда наши пути вновь пересекутся?");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Нашел что-нибудь?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Нашел что-нибудь?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Этот сундук закрыт. Может быть мы сможем найти ключ в форте.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Еще не нашел свою бумагу?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Нет, пока еще нет...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Ты уже был в библиотеке?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Давай осмотрим форт вместе."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Давай осмотрим форт вместе.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Хорошо, иди первым.
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Bjцrn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Возле Старого Лагеря я встретил Диего и Мильтена!";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Как дела?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Эй, что ты здесь делаешь?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Старую Шахту залило водой, и она обрушилась!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//И что с того?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Все маги Огня мертвы.
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Их убил Гомез.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//Тебе будет нелегко оправдаться!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Возле Старого Лагеря я встретил Диего и Мильтена!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Они хотят встретиться с тобой и с Лестером. Там же, где и всегда.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Как раз вовремя!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//Что случилось?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Я останусь здесь и буду изучать старые книги.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Ух... Я не понимаю...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Господин Ю`Берион однажды сказал: 'Невежда передвигает предметы руками, а мастер - силой своего духа'.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Ладно, ладно, я все понял.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Береги себя.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Спасибо. Я пойду.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Да хранит тебя Спящий!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Я рассказал Лестеру и Горну о встрече с их друзьями. Дальше это уже не мое дело. Они сами разберутся, что делать теперь…"); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
