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
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Я здесь, чтобы наставить тебя на путь истинный.
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
	description = "И каков этот истинный путь?";
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
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //И каков этот истинный путь?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Путь Спящего. Лишь в его силе освободить нас.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Гуру хотят призвать Спящего, и поэтому сейчас в нашем лагере готовится Великая Церемония.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //До сих пор он говорил с нами только в видениях, но пришло время увидеть его воочию.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Чтобы достичь этого, нам надо объединить всю нашу духовную силу. Для этого нам понадобится много последователей.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Наш лагерь недалеко отсюда, на болоте. Хочешь, я могу проводить тебя туда.
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
	description = "А какая мне польза от того, что я присоединюсь к вам?";
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
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //А какая мне польза от того, что я присоединюсь к вам?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Возможно, ты станешь одним из избранных, кто получит от Спящего магический дар.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Или ты сможешь достичь больших высот и стать Стражем. Только лучшие из нас могут добиться этого.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Если будет на то воля Спящего, ты можешь даже совместить оба этих занятия.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Видишь, наше Братство многое может предложить тебе.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Серьезно подумай об этом, прежде чем решить присоединиться к какому-нибудь другому лагерю!
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
	description = "Ты знаешь, кто такой Спящий?";
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
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Ты знаешь, кто такой Спящий?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Спящий говорит с нами во снах и видениях.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Вот уже пять лет, он ведет нас за собой, с тех пор как Юберион впервые услышал его.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Все члены Братства отвергают трех богов и молятся о спасении лишь Спящему.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Спасении? От чего?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //От этого проклятого места, конечно! Спящий укажет нам путь к свободе!
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
	description = "И что сказал Спящий?";
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
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //И что сказал Спящий?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Он привел нас к развалинам старого храма на болоте. Именно там мы построили свой лагерь.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Он даровал нам свободу действий - никто из нас не горбит спину на шахтах.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Он открыл нам силу болотника. Мы продаем его другим лагерям и взамен получаем все, что нам надо.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //А избранных он одарил магическим даром. Его магия более могущественная и древняя, чем та, что используется остальными.
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
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Этот дар позволяет человеку управлять силой своего разума.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Только Гуру посвящены в таинство магии Спящего.
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
	description = "Проводи меня в свой лагерь. Я хочу посмотреть на него!";
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
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Проводи меня в свой лагерь. Я хочу посмотреть на него!
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi, "Идол Парвез, миссионер из Братства, ищет последователей веры в Спящего в Старом лагере. Он предложил проводить меня в Болотный лагерь.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Очень хорошо! Я пойду впереди. Иди за мной!
	
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
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Вот, мы на месте. Дальше по дороге вниз находится лагерь Братства.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Видишь внизу? Это наш лагерь.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Заходи и поговори с моими братьями. Уверен, что, придя сюда, ты не потратил время зря.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Спроси Кор Галома. Он занимается учениками и их наставниками.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //А я возвращаюсь в лагерь. Там еще многим нужно помочь найти путь истины.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Удачи!

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi, "Передо мной Болотный лагерь. Мой проводник посоветовал мне поговорить с Гуру Кор Галомом. Он наблюдает за послушниками и наставниками.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


