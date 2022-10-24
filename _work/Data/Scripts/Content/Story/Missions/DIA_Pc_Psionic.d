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
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Пойдем!
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
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Ты захотел поговорить с Гуру! Этого нельзя делать! Это святотатство. Когда учитель захочет, он сам обратится к тебе.
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
	description = "Кто ты?";
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
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Я Лестер. Я забочусь о тех, кто приходит в этот лагерь.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Ты не стал обращаться к Идолу Намибу. Это хороший знак. Ни один неверный не может говорить с Гуру.
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
	description	= "Но мне нужно с ним поговорить.";
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
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Но мне нужно с ним поговорить.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Не стоит! Я уверен, что сам смогу помочь тебе решить твои проблемы.
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
	description	= "Расскажи мне что-нибудь о лагере.";
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
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Расскажи мне что-нибудь о лагере.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Что ты хочешь знать?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Расскажи мне о гильдиях.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Кто такой Спящий?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Что ты знаешь о болотнике?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Расскажи мне о гильдиях.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Гуру входят в верховную Гильдию. Они представляют дух нашего лагеря и их сила велика. Следом идут Стражи, которые используют свою духовную силу в бою.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Их воля несокрушима. Лучше не вставать у них на пути. Сам я послушник. Мы возносим молитвы Спящему и выполняем всю работу в лагере.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Некоторые из послушников могут стать Гуру, но для этого они должны многому научиться.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Кто такой Спящий?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Спящий - наш бог. Он посылает нам видения. Но не каждый достоин такой чести. Лишь Гуру получают от него этот дар.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Мы молимся ему, потому что знаем, что он сможет освободить нас.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //И ты в это веришь?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Эй, я провел здесь уже два года. Ты знаешь, что это такое - прожить два года в этой тюрьме?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Ты даже представить не можешь, чему я готов поверить, лишь бы уйти из этого места.
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Что ты знаешь о болотнике?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Ну, болотник мы собираем на болотах, это всем известно. После сбора он подвергается правильной обработке, чтобы его можно было курить. Эту работу выполняют послушники.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Болотник помогает расслабиться и успокаивает, дает возможность сосредоточиться на главном и раскрывает сознание.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Мы меняем его на товары из других лагерей и используем для привлечения новых людей в Братство.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Конечно, некоторые присоединяются к нам только из-за него. Ну, они хотя бы соглашаются выполнять некоторые работы в лагере.
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
	description	= "Я хочу присоединиться к Братству!";
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
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Я хочу присоединиться к Братству!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Только Кор Галом может решать, готов ли ты вступить в наше Братство.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Но он полагается и на мнение других Гуру. Он ценит мнение Идола Намиба.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Сначала ты должен доказать свою преданность, после этого один из Гуру направит тебя к Кор Галому.
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
	description	= "Как же это сделать? Никто из них не хочет со мной разговаривать?";
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
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Как же это сделать, если никто из них не хочет со мной разговаривать?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Быть может, ты не будешь этого замечать, но за тобой всегда будут наблюдать Гуру.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Когда они решат, что ты достоин быть принятым, они скажут тебе об этом.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Я думаю, тебе очень скоро предоставится возможность доказать свою преданность нашему лагерю.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Если я хочу присоединиться к братьям из Болотного лагеря, я должен произвести впечатление на Гуру. Они не разговаривают с новичками. Но, как сказал Лестер, они будут наблюдать за мной, и когда я буду находиться недалеко от них, я должен вести себя достойно. Правда, я еще не понимаю, что это значит! Лучше я осмотрю Болотный лагерь.");

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
	description	= "Как мне поговорить с твоим учителем?";
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
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Как мне поговорить с твоим учителем?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Ты должен знать, что он хочет от тебя услышать.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //И что же?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Будь внимателен. Когда мы в следующий раз подойдем к нему, обратись ко мне, и мы немного поговорим.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Сейчас у Идола Намиба очень много забот, ведь наши послушники все еще не отвыкли молиться старым богам.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Ты скажешь мне, что отрекаешься от старой веры и отныне будешь уповать на милость Спящего.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Я спрошу тебя, что заставило тебя прийти к такому решению, а ты ответишь, что тебе было видение, в котором Спящий призвал тебя к себе.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Он не останется равнодушным. Ты сможешь с этим справиться?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Смогу.
	
	B_LogEntry	(CH1_JoinPsi, "Чтобы удивить Идола Намиба, я должен сказать Лестеру, что принимаю веру в Спящего и отказываюсь от старых богов, так чтобы он это слышал.");

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
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //Ах! Как я рад нашей встрече. Как у тебя дела?
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
	description	= "Я отрекся от старых богов.";
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
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //Я отрекся от старых богов.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); // Правда? А почему ты так решил?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //Мне было видение. Спящий говорил со мной.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //И что он сказал?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //Он сказал: иди в лагерь на болотах и стань одним из братьев.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //Тебе несказанно повезло, незнакомец, немногие могут удостоиться такой чести!

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
	description	= "Как мне ориентироваться в этом лагере?";
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
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Как мне ориентироваться в этом лагере?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Я могу тебе показать наш лагерь.
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
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Если ты не будешь задавать много вопросов, мы с этим быстро справимся.
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
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Ты знаешь, где меня найти.
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
	description		= "Как пройти..."; 
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
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Как пройти...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...назад к главным воротам?",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...к кузнице?",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...к Храму?",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...к наставникам?",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...в лабораторию?",PC_Psionic_GUIDEFIRST_HERB);

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
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...к кузнице.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Следуй за мной!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...к Храму.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Следуй за мной!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...к наставникам.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Следуй за мной!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...в лабораторию.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Следуй за мной!
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
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Здесь внизу ты найдешь Идола Кадара. Он обучает послушников.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Эта лестница ведет на тренировочную площадку Стражей. Я подожду тебя здесь. Если ты задержишься, ты сможешь найти меня у входа в лагерь.

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
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Это наш Храм. Ты можешь осмотреться здесь, но долго не задерживайся, иначе я вернусь к Идолу Намибу.

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
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Вот наша кузница! Осмотрись, у тебя есть ровно час. Потом я вернусь к Идолу Намибу.
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
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Эта лестница ведет в лабораторию Кор Галома, алхимика. А внизу живет Фортуно, торговец болотником.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Я буду ждать тебя здесь в течение часа. А потом мне придется уйти.
	
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
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Хорошо, что ты пришел. У меня для тебя новость.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Расскажи.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Гуру нашего Братства ожидают великого события.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Да? Они хотят выйти отсюда?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Они хотят призвать Спящего. Но им нужно что-то, что поможет объединить их духовные силы.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //Да? 
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Для этого нужен магический артефакт, который они называют юнитором.

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
	description		= "А я что могу сделать?"; 
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
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //А я что могу сделать?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Поговори с Юберионом. Он наш Учитель и самый могущественный из нас. У тебя будет возможность заслужить его доверие.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Где я могу его найти?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Иди к Храму. Он редко покидает его. Наверное, в этом холодном здании он чувствует себя ближе к Спящему.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,	"Послушник Лестер рассказал мне, что Юбериону нужен юнитор. Учителя я смогу найти в храме на холме.");

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
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Я выполняю задание магов Воды. Им нужны магические артефакты, называемые юниторами.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Ты хочешь найти юнитор, да? Храбрости тебе не занимать.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //С его помощью Сатурас и другие маги из Нового лагеря хотят разрушить Барьер и освободить колонию.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Я поверю тебе, только когда увижу его собственными глазами.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Я тоже. Но скажи мне, зачем ты здесь?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Я как раз думаю над тем, не пойти ли мне в горный форт.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Есть один документ, который бы мне хотелось взять себе. С другой стороны, дорога туда очень опасна.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Как тебе удалось пробраться через эту живую гору?"; 
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
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Как тебе удалось пробраться через эту живую гору?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Я многому научился у Гуру. Их магия бывает весьма полезна.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Что за документ ты хочешь найти?"; 
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
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Что за документ ты хочешь найти?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Когда-то давно в этом форте жил правитель этих земель. Ему принадлежала эта земля и все шахты.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Как у всякого дворянина, у него был документ, подтверждающий право собственности на землю. Он то мне и нужен.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Но пока мы находимся за Барьером, он будет совершенно бесполезен.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Ты прав. Но если маги Воды смогу разрушить Барьер, этот документ снова вступит в силу.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Мы можем вместе осмотреть этот форт."; 
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
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Мы можем вместе осмотреть этот форт.
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Отличное предложение. Иди вперед, а я пойду следом.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,	"Недалеко от огромного форта на горе я встретил послушника Лестера из Болотного лагеря. Сам он ищет здесь один документ. Он решил присоединиться ко мне.");

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
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Посмотри-ка, кажется, это и есть юнитор.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Да, кажется, ты прав, хм... Его не так-то легко достать...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,	"Юнитор, который мне нужен, находится на пьедестале. Сам я не смогу его достать. Но мне придется найти способ сделать это.");	
	
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
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Куда же ты? Наши поиски еще не закончены.
	
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
	description		= "Я ранен. Ты можешь помочь мне?"; 
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
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Я ранен. Ты можешь помочь мне?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Вот, возьми это зелье лечения.
	
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
	description		= "Я нашел документ."; 
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
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Я нашел документ.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Отлично! Возьми эти свитки в качестве награды. Они помогут тебе добраться до юнитора.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Я подожду тебя внизу, у пьедестала.

	B_LogEntry		(CH3_Fortress,	"Завещание, которое искал Лестер, находилось в ящике. В обмен на него он дал мне четыре свитка телекинеза. С их помощью я смогу достать юнитор.");
	
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
	description		= "Как же мне достать этот юнитор?"; 
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
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Как же мне достать этот юнитор?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Как сказал Учитель Юберион: 'Невежда старается передвигать предметы руками, а мастер использует силу своего духа'.
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
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Я останусь здесь и поищу документ.
	
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
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Пойду, посмотрю, что там есть.
	
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
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Мы нашли то, что искали. Я останусь здесь ненадолго, хочу изучить старинные книги.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Мы еще встретимся.

	B_LogEntry		(CH3_Fortress,	"Я достал юнитор. Лестер захотел еще ненадолго остаться в форте, чтобы посмотреть библиотеку. Интересно, встретимся ли мы еще когда-нибудь?");

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
	description		= "Ты нашел что-нибудь?"; 
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
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Ты нашел что-нибудь?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Сундук закрыт. Быть может, его хозяева оставили ключ где-то поблизости.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Ты документ нигде не видишь?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Нет, пока не вижу...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //А в библиотеке ты не смотрел?
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
	description		= "Мы можем осмотреть этот форт вместе."; 
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
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Мы можем осмотреть этот форт вместе.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Хорошо, ты иди вперед.
 
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
	description = "Как жизнь?";
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
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Как жизнь?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Эй, что ты здесь делаешь?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Старая шахта обрушилась, после того как ее залила вода!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//И что?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Все маги Круга Огня мертвы!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Убиты по приказу Гомеза.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//Не хотел бы я попасть в подобную переделку!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Недалеко от Старого лагеря я встретил Диего и Мильтена.
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Они хотят встретиться с тобой. На вашем обычном месте.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Как удачно!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//Что нам делать теперь?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Я еще немного побуду здесь, посмотрю старые книги.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Но... я не понимаю...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Как сказал Учитель Юберион: 'Невежда старается передвигать предметы руками, а мастер использует силу своего духа'.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Хорошо, хорошо. Я все понял.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Будь осторожен.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Спасибо. А теперь мне нужно уходить.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Да хранит тебя Спящий!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Я сказал Лестеру и Горну, что их друзья хотят с ними встретиться. Место встречи они знают сами."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
