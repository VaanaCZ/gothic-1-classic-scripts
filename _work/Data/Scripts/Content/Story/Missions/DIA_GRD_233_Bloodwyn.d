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
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Увидимся.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Береги себя, малыш.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Ты теперь ни о чем не волнуйся. Мы приглядим за тобой.
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
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //Это ты мне говоришь?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Я предупреждаю тебя! Такие типы, как ты, очень быстро попадают здесь в неприятности!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //Сюда бросают, в основном, законченных ублюдков.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //И они думают, что могут делать с тобой все, что хотят. Но мы им этого не позволим.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Гомез хочет, чтобы в Лагере был мир, и мы, стражники, следим за этим. Но эта работа обходится нам недешево.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Вот почему я предлагаю тебе поделиться запасом руды. Скажем так, в знак дружбы. Ты помогаешь нам, мы помогаем тебе. И если у тебя будут проблемы, мы придем на помощь.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Почему бы и нет? Сколько ты хочешь получить?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Я сам могу о себе позаботиться!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Это угроза?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //Ты предлагаешь мне платить деньги за защиту? Нет, спасибо, я сам могу о себе позаботиться!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Решать тебе, малыш. Скоро ты пожалеешь о том, что отверг мое дружеское предложение.
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Это угроза?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Совсем наоборот! Это предложение дружбы!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Почему бы и нет? Сколько ты хочешь получить?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Немного. Десять кусков будет вполне достаточно.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"У меня нет десяти кусков руды.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Вот твоя руда. Дружба всегда в цене.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Вот твоя руда. Дружба всегда в цене.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Похоже, ты умный парень. С этого момента мы будем защищать тебя.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Но это не значит, что ты можешь делать все, что захочешь - из некоторых неприятностей даже мы не сможем тебя вытащить.
	
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
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //У меня нет десяти кусков руды.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Давай сколько есть, а остальное отдашь потом.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Посмотрим...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Ты только поглади на это... Похоже, кто-то не умеет считать до десяти, а?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Пожалуй, я заберу все, что у тебя есть. Может быть тогда я сумею забыть, что ты пытался обмануть меня.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Мало - лучше, чем ничего. Спасибо за руду, малыш!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //С этого момента я буду приглядывать за тобой, пока ты находишься в Лагере.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Похоже, у тебя сейчас не лучшие времена, приятель. Ну ничего, как-нибудь в другой раз...
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
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //А, рад тебя видеть, дружище!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //Как насчет дневной платы? Ты должен десять кусков, помнишь?
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Вот, возьми. Для друга и 10 кусков не жалко.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Я не буду платить.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Эй, ты!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Что еще?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Пришло время доказать, что мы на самом деле друзья.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Всего десять кусков руды - что скажешь?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Вот, возьми. Для друга и десяти кусков не жалко.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Я так и думал - мы друзья!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Я не буду платить - ты и так получил с меня более чем достаточно.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Ты меня разочаровал. Больше мы не друзья. Сам гляди теперь, чтобы никто тебя не обидел и не ограбил.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Не волнуйся, я могу о себе позаботиться.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Посмотрим...
	
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
	description = "Я передумал. Вот десять кусков руды. ";
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
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Я передумал. Вот десять кусков руды. 
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Вот это другое дело! Видишь - ты МОЖЕШЬ принимать правильные решения.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Теперь ты будешь платить мне каждый день, так?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Возвращайся, когда у тебя будет чем заплатить.
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
	description = "Джесс просил заплатить за него десять кусков руды.";
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
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Джесс просил заплатить за него десять кусков руды.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Мне кажется, прежде ты должен заплатить СВОИ десять кусков.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Забудь про Джесса. Он неудачник и все равно долго не протянет.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Нет, я заплачу за него. Возьми десять кусков и оставь его в покое.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Ладно, парень, как хочешь.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Черт! Кажется, у меня не хватает руды.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //Это знак свыше, парень! Подумай еще раз! Зачем тебе тратить руду на этого лодыря?
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
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Теперь ты один из нас. Хорошо. Страже нужны такие парни, как ты.
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
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //Предатель в наших рядах! ТЬФУ! И мы называли тебя стражником!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Похоже, мы засекли одного из мятежных магов Огня!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //Нас предал один из Призраков!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Погоди. О чем ты говоришь, Бладвин?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Связался с Новым Лагерем, да?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Нет, постой, я...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Похоже. ты думал, что сможешь бесконечно пудрить нам мозги.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Что за чушь...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Предатели должны умереть.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //УМРИ, ПРЕДАТЕЛЬ!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Флетчер, охраняющий основные ворота, отреагировал так же, как и Бладвин. Не знаю точно, почему, но, должно быть, это как-то связано с моими поисками юнитора для Нового Лагеря.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Бладвин, охраняющий задние ворота Старого Лагеря, назвал меня предателем и перебежчиком. Он не хотел слушать меня и сразу же напал!");
			B_LogEntry			(CH4_BannedFromOC,"Похоже, меня изгнали из Старого Лагеря!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Так ты решил высунуть нос из своего Нового Лагеря? Это было очень глупо с твоей стороны!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //О, так ты решил высунуть нос из своего болота? Это было очень глупо с твоей стороны!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Что?! Что ты имеешь в виду?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Ты что, не слышал о нападении на шахте?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Что...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Прости, но мы не можем позволить тебе болтать об этом направо и налево.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Эй, я не хочу неприятностей...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Тебе стоило подумать об этом раньше!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Все, с меня довольно...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //С меня тоже! УБЕЙТЕ ЕГО!
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
		B_LogEntry		(CH4_Firemages,"Ворота Старого Лагеря теперь закрыты и охраняются стражниками. Они атакуют любого, кто подходит близко.");
	};
	
	AI_StopProcessInfos	(self);
};

