// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrьssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Да пребудет с тобой Спящий, незнакомец!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Я здесь, для того чтобы наставить тебя на путь истинный.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "И какой же это путь?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //И какой же это путь?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Путь Спящего. Лишь он способен сделать нас свободными.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //В нашем Лагере Гуру готовят Великую Церемонию. Они хотят призвать Спящего.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //До сих пор он говорил с нами в видениях, но теперь пришло время увидеть его воочию.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Для этого нам понадобится много последователей. Объединив их духовную силу, мы пробьемся к нему.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Наш Лагерь находится недалеко отсюда, на болотах. Если хочешь, я могу отвести тебя туда.
};

// **************************************************
//					Vorteile fьr mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Какой мне резон присоединяться к вам?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Какой мне резон присоединяться к вам?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Возможно, ты станешь одним из избранных, кто получит от Спящего магический дар.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Или ты достоин высшей чести - стать Стражем. Только лучшие из воинов могут носить это звание.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Если будет на то воля Спящего, ты можешь даже совместить оба этих занятия: лучшие из Стражей также обладают магическим даром.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Как видишь, наше Братство предоставит тебе массу возможностей.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Стоит подумать об этом, прежде чем ты решишь присоединиться к какому-нибудь другому Лагерю.
};

// **************************************************
//					Schlдfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Кто такой Спящий?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Кто такой Спящий?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Спящий говорит с нами во снах и видениях.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Он указывает нам путь с тех самых пор, как Ю`Берион впервые услышал его голос. Это было пять лет назад.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Все члены Братства отвергают трех богов. Мы молимся о спасении лишь Спящему.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //О спасении от чего?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //О спасении из этого проклятого места, разумеется! Спящий укажет нам путь к свободе!
};

// **************************************************
//			Was hat Schlдfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "И что говорит вам Спящий?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //И что говорит вам Спящий?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Он привел нас на болота, к руинам старого храма. Там мы построили новый Лагерь.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Он даровал нам свободу - никто из нас не гнет спину в шахтах.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Он открыл нам волшебную силу болотника. Мы продаем его другим Лагерям, и в обмен получаем все, что нам нужно.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Некоторых из нас он наградил магическим даром. Эта магия куда более древняя и могущественная, чем та, к которой привыкли жители колонии.
};

// **************************************************
//		Erzдhl mir von der MAgie des Schlдfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Расскажи мне о магии Спящего.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Расскажи мне о магии Спящего.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Этот дар позволит тебе силой разума творить чудеса.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Лишь Гуру нашего Братства посвящены в секреты магии Спящего.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Отведи меня в свой Лагерь. Я хочу посмотреть на него.";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Отведи меня в свой Лагерь. Я хочу посмотреть на него.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Идол Парвез является посланником Братства. Он остается в Старом Лагере, чтобы искать новых последователей Спящего. Он предложил проводить меня до Болотного Лагеря, дома Братства.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Очень хорошо! Я пойду впереди. Следуй за мной.
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Вот мы и пришли. Перед нами находится Лагерь Братства.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Не спеши, брат! Вот и наш Лагерь.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Заходи в ворота и поговори с моими братьями. Увидишь, что придя сюда, ты не потратил время впустую.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Спроси Кор Галома. Он занимается учениками и их наставниками.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Я же возвращаюсь в Старый Лагерь. Есть еще много неверных, которых необходимо наставить на истинный путь.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Удачи тебе!

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"Болотный Лагерь передо мной. Мой компаньон посоветовал поговорить с Кор Галомом. Он заведует обучением новичков.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


