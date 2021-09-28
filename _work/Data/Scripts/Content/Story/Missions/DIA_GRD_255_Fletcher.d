// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Эй, ты!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Кто? Я?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Ты сам знаешь, к кому я обращаюсь!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Вот что я тебе скажу, сынок - это МОЙ район. И мне не нужны неприятности!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Но новички, вроде тебя, всегда становятся их причиной - особенно когда шляются без дела по ночам.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Так почему бы тебе не отправиться домой и не позаботиться о том чтобы я больше тебя здесь не видел? Как раз напротив арены есть пустой дом - ты узнаешь его по навесу. Отправляйся спать.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //И если я поймаю тебя в какой-нибудь другой хижине, я лично прослежу за тем, чтобы ты очень пожалел об этом.
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Эй, ты!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Если собираешься заплатить за защиту, ты выбрал для этого неправильный день. 
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Да? И почему?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Потому что меня здесь нет.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Понятно.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Тогда почему же я с тобой разговариваю?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"А-а. И где же ты в таком случае?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //А-а. И где же ты в таком случае?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Я в замке, сижу возле большого костра, в руках кубок с пивом.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Тогда почему же я с тобой разговариваю?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Да потому что Нек пропал, а это его район.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //И до тех пор, пока он не появится, Торус приказал МНЕ стоять на страже.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Понятно.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "Не знаешь, где сейчас может быть Нек?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Не знаешь, где сейчас может быть Нек?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Не знаю, да и узнать неоткуда.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //По-любому, местные рудокопы должны что-то знать, вот только не будут они говорить со стражником.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Особенно сейчас - ведь они знают, как я ненавижу эту чертову работу. Уверен, они смеются у меня за спиной! 
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Может, копатели в районе арены знают, куда пропал Нек.");
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "Почему бы тебе в отместку не собрать с них еще денег за защиту?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Почему бы тебе в отместку не собрать с них еще денег за защиту?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Нек уже сделал обход, прежде чем исчезнуть. Теперь у них в карманах пусто.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "Я по поводу Нека...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Я по поводу Нека...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Да?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Думаю, я нашел его.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Что? Где он?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Кормит крыс...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //О, нет! Проклятье! Значит, теперь я останусь здесь насовсем. Я так надеялся, что он вернется!
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Теперь у меня появилась проблема.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //Никаких новостей.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Держи меня в курсе.
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "Эй, в чем проблема?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Какая проблема?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Я по уши в долгах перед Скатти. Теперь он узнает, что я занял место Нека, и будет приходить сюда каждый день...
};	












//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Ты быстро нашел здесь свое место. Добро пожаловать в Стражу!
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
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Предатель! Подумать только - мы позволили тебе стать одним из стражников!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //Это один из предателей-магов!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Привет, предатель! Пусть ты и один из Призраков Гомеза - тебе это не поможет!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Эй, Флетчер, о чем ты говоришь?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Ты в сговоре с этим отребьем из Нового Лагеря, ведь так?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Постой...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Полагаю, ты думал, что никто и не догадается, а?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Ух ты... Попридержи-ка коней!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Нет, лучше уж ты попридержи свою голову - потому что скоро ты ее лишишься!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //УМРИ, ПРЕДАТЕЛЬ!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Бладвин окопался у задних ворот. Он отреагировал точно так же, как и Флетчер. Я не знаю точно, почему, должно быть, это как-то связано с моими поисками юнитора для Нового Лагеря.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Флетчер, охраняющий основные ворота, назвал меня предателем и перебежчиком. Он не стал слушать меня и тут же напал!");
			B_LogEntry			(CH4_BannedFromOC,"Похоже, меня изгнали из Старого Лагеря!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Ты только посмотри - парень из Нового Лагеря!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Ты только посмотри - парень из Болотного Лагеря!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //И что? Какое тебе до этого дело?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Скоро нам будет принадлежать ваша шахта.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Да? Мечтай дальше!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Но сам понимаешь - теперь я не могу позволить тебе болтать об этом на каждом углу!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Постой, мне не нужны неприятности.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Тебе стоило подумать об этом, прежде чем приходить сюда!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Эй, какого...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Вперед, парни, взять его!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verstдrkung vor das Haupttor (Anfьhrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstдrkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstдrkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstдrkung vor das Haupttor (Fernkдmpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regulдre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regulдre Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Ворота Старого Лагеря теперь закрыты и охраняются стражниками. Они атакуют любого, кто подходит близко.");
	};
	
	AI_StopProcessInfos	(self);
};

