// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //До встречи!
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Будь осторожен здесь!
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Ни о чем не беспокойся. Мы позаботимся о твоей безопасности.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Эй, ты!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //Ты хочешь поговорить?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Хочу предупредить тебя! Постарайся не делать глупостей, хорошо?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //Большинство тех, кто сюда попадает, бандиты и убийцы.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Они думают, что им все позволено. Но мы стараемся пресечь своеволие.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Гомeз хочет, чтобы в лагере было спокойно, и мы следим за этим. Но эта работа не из легких.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Вот поэтому я предлагаю тебе поделиться по- дружески рудой в награду за наши труды. Ты поможешь нам - мы поможем тебе, если у тебя возникнут проблемы.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Почему бы и нет? Сколько руды тебе нужно?"	,Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Я должен платить деньги за защиту? Нет уж..."	,Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Ты мне угрожаешь?"	,Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //Я должен платить деньги за защиту? Нет уж, спасибо, я и сам о себе позабочусь!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Как хочешь. Быть может, ты еще пожалеешь, что отказался от моего дружеского предложения.
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Ты мне угрожаешь?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Наоборот! Я предлагаю тебе дружбу!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Почему бы и нет? Сколько руды тебе нужно?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Не так много. Всего десять кусков.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Сейчас у меня нет десяти кусков."	,Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Вот тебе руда. Друг всегда может пригодиться."	,Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Вот тебе руда. Друг всегда может пригодиться.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //А ты умный парень. Теперь ты можешь на меня положиться. Я буду защищать тебя.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Но это еще не значит, что тебе здесь будет все позволено, это понятно? 
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Сейчас у меня нет десяти кусков.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Ну, тогда я возьму у тебя те, что есть. Остальное отдашь в следующий раз.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Ну-ка, посмотрим...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Что у нас тут есть? Здесь кто-то не умеет считать до десяти, да?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Я просто возьму все, что у тебя есть. Тогда я забуду, что ты пытался меня обмануть.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Ну, у тебя мало руды, но мне хватит и этого. Главное, ты согласился платить. Спасибо.
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Теперь я буду приглядывать за тобой, пока ты будешь в лагере.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //У тебя совсем ничего нет... Ну, как я сказал, заплатишь в следующий раз...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Хорошо, что я тебя встретил!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //Ты должен мне десять кусков за защиту - дневную плату. Ты будешь платить?
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Вот, возьми десять кусков. Для друга не жалко."	,Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Я больше не буду платить. Ты и так получил с меня слишком много."	,Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Эй, ты!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Что еще тебе от меня нужно?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //У тебя есть возможность доказать, что мы друзья.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Всего-то десять кусков руды, ты согласен?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Вот, возьми десять кусков. Для друга не жалко.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Я тоже так думаю.
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Я больше не буду платить. Ты и так получил с меня слишком много.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Ты меня разочаровал. С нашей дружбой покончено. Теперь тебе самому придется защищать себя от тех, кто захочет ограбить или убить тебя.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Я и сам смогу защитить себя.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Это мы посмотрим...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "Я передумал. Я заплачу тебе десять кусков руды.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Я передумал. Я заплачу тебе десять кусков руды.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Вот видишь! Ты все-таки можешь принимать правильные решения.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //И теперь ты будешь платить мне за защиту каждый день, да? 
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Так приходи, когда наступит время платить еще.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Джесс просил меня заплатить за него десять кусков руды.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Джесс просил меня заплатить за него десять кусков руды.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Ты бы лучше сначала за себя заплатил.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Забудь об этом Джессе. Он же конченый человек, неудачник.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Нет, я все же заплачу за него. Вот тебе десять кусков и оставь его в покое.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Как хочешь, дело твое.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //О! Кажется, моей руды не хватит.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //Да, тебе дали второй шанс. Подумай хорошенько, зачем тебе тратить руду на какого-то неудачника?
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Теперь ты один из нас. Отлично. Нам нужны такие люди как ты.
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //Среди нас появился предатель! И мы еще называли тебя стражником!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Похоже, одного их мятежных магов Огня мы пропустили!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //Один из Призраков оказался предателем!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Погоди. Бладвин, о чем ты говоришь?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Ты ведешь какие-то дела с Новым лагерем, да?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Постой, но я все еще...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //А ты думал, что так будет продолжаться вечно?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Прекрати нести весь этот вздор...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Предателей обычно убивают.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //Так умри, предатель!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Флетчер, который сейчас охраняет главные ворота, повел себя точно так же, как и Бладвин. Он что-то знает о том, что я ищу юниторы для Нового лагеря.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Бладвин, который теперь вместе с группой стражников охраняет северные ворота, назвал меня предателем и перебежчиком. Без дальнейших разговоров он напал на меня!");
			B_LogEntry			(CH4_BannedFromOC,	"Кажется, меня прогнали из Старого лагеря!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //И как это ты осмелился выйти из Нового лагеря? Неразумный поступок!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //И ты решился выйти из своего Болотного лагеря? Как глупо с твоей стороны!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Что такое? О чем ты говоришь?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Так ты ничего не слышал о нападении на Новую шахту, да?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //О чем ты...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Прости, но мы не можем позволить тебе разгуливать здесь. Ты знаешь слишком много!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Эй, я не хочу драться с тобой...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Об этом раньше нужно было думать!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Все, с меня хватит...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //И правда, хватит! Убить его!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstдrkung vor das Hinterem Tor (Anfьhrer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstдrkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstдrkung vor das Hinterem Tor (Fernkдmpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// regulдre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// regulдre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Ворота в Старый лагерь закрыты и охраняются стражниками. Они нападают на любого, кто окажется слишком неосторожен, чтобы подойти к ним.");
	};
	
	AI_StopProcessInfos	(self);
};

