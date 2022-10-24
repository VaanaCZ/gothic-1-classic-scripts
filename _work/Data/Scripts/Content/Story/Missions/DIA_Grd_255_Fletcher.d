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
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Ты меня зовешь?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Сам знаешь кого я зову!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Парень, послушай, что я тебе скажу: это мой район. И мне неприятности не нужны!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Но от новичков типа тебя всегда одни проблемы, особенно когда шныряют тут по ночам.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Думаю, тебе стоит отправиться домой и больше не показываться мне на глаза. Кажется, возле арены есть пустующий дом с навесом. Так что иди лучше спать.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Но если я поймаю тебя в чужом доме, будь уверен я позабочусь, чтобы ты об этом пожалел.
	
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
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Если хочешь заплатить за защиту, то сегодня не лучший для этого день.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Да? Это почему?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Потому что меня здесь нет.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Все понятно." 	,DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Почему же я, по-твоему, с тобой здесь разговариваю?"	,DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"А где ты есть?"	,DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //А где ты есть?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //На самом деле я в замке у большого костра, и в руке у меня кубок с пивом.   
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Почему же я, по-твоему, с тобой здесь разговариваю?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Потому что Нек пропал, а он ответственен за этот район.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //Торус приказал мне стоять на страже, пока он не объявится.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Все понятно.
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
	description		= "Ты знаешь, где сейчас может быть Нек?";
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
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Ты знаешь, где сейчас может быть Нек?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Нет, да и где узнать можно не знаю.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Так или иначе, местные рудокопы должны что-нибудь знать, да только со стражником они говорить не будут.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Тем более, сейчас. Они знают, как я ненавижу свою работу и уверен, они смеются у меня за спиной!
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,	"Говорят, что рудокопы возле арены могут знать, куда делся Нек.");
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
	description		= "Так почему бы тебе просто не забрать у них еще руду за защиту?";
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
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Так почему бы тебе просто не забрать у них еще руду за защиту?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Нек собрал плату перед тем как пропал. Так что сейчас с них нечего брать.
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
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //По-моему, я нашел его.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Что? И где он сейчас?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Стал кормом для крыс...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //О, нет! Черт! Теперь я точно останусь здесь навсегда. А я так надеялся на его возвращение.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Теперь я точно вляпался.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //Ничего нового.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Если что узнаешь, сразу говори.
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
	description		= "А в чем проблема?";
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
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //А в чем проблема?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Я серьезно задолжал Скатти. Теперь он узнает, что я вместо Нека, и будет каждый день ко мне приходить...
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
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Ты быстро освоился, молодчина. Добро пожаловать в Стражники!
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
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Предатель! Мы поверили тебе, позволили стать стражником!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //Это один из предателей, служащий магам Огня!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Привет, предатель! Хоть ты и Призрак Гомеза, тебе это все равно не поможет!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Флетчер, о чем ты говоришь?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Ты ведь за одно с этим мошенником из Нового лагеря, да?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Постой...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Что? Думал, никто и не догадается, а?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Тебе следовало бы попридержать свой язык!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Нет. Это тебе попридержать...попридержать свою голову, потому что скоро ее у тебя не будет.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //Умри, предатель!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Бладвин, который сейчас охраняет ворота, повел себя точно так же, как и Флетчер. Он что-то знает о том, что я ищу юниторы для Нового лагеря.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Флетчер, который теперь вместе с группой стражников охраняет главные ворота, назвал меня предателем и перебежчиком. Без дальнейших разговоров он напал на меня!");
			B_LogEntry			(CH4_BannedFromOC,	"Кажется, это значит, что меня прогнали из Старого лагеря!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Посмотри-ка. Паренек из Нового лагеря!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Посмотри-ка. Паренек из Болотного лагеря!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //Ну и что? Какое тебе до этого дело?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Скоро ваша шахта также будет принадлежать нам.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Да, да, мечтать не вредно.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Извини, но я не могу позволить тебе об этом всем разбалтывать повсюду.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Подожди, я не хотел неприятностей.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Надо было думать раньше, когда шел сюда!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Эй, что за...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Давай, парни, взять его!
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
		B_LogEntry		(CH4_Firemages,	"Ворота в Старый лагерь закрыты и охраняются стражниками. Они нападают на любого, кто окажется слишком неосторожен, чтобы подойти к ним.");
	};
	
	AI_StopProcessInfos	(self);
};

