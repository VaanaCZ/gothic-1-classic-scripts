//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Spдter Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Ты можешь научить меня чему-нибудь?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Хочешь стать хорошим воином? Да, тебе действительно нужно найти опытного учителя.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //Хорошо. Но, к сожалению, я не тот, кто сможет помочь тебе.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Я обучаю лишь тех, кто входит в священный круг Стражей.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Как мне стать одним из Стражей?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Как мне стать одним из Стражей?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Для этого тебе нужно доказать веру в Спящего и преданность ему, став послушником.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //После этого приходи ко мне, и я буду учить тебя.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STДRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Как я могу увеличить силу и ловкость?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Как я могу увеличить силу и ловкость?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Ловкость и сила очень важные характеристики воина.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Я хочу стать Стражем!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Я хочу стать Стражем!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Ты еще к этому не готов. Я смогу принять только тогда, когда у тебя будет больше опыта.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Твое время пришло, ты можешь присоединиться к нам.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Ты должен знать, что Страж не просто защитник лагеря и хороший воин. Мы избранные Стражи Спящего, Стражи духа.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Мы в равной мере используем силу тела и силу духа. Настоящим Стражем может стать только тот, чье тело и дух пребывают в гармонии.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Я рад, что ты добился таких хороших результатов, затратив на это так мало времени. Ты готов быть принятым в круг Стражей.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Запомни, когда твой дух силен и тело закалено, ты можешь отразить любую угрозу.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Сходи к Гор На Тофу на тренировочную площадку. Он даст тебе твои новые доспехи.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,	"Сегодня Кор Ангар назначил меня Стражем. Я смогу взять свой новый доспех у Гор На Тофа. Обычно он стоит на тренировочной площадке.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,		"Кор Ангар может помочь мне увеличить силу и ловкость и научить обращаться с двуручным мечом. Но это произойдет после того, как я освою бой с одноручным оружием. Я смогу найти его на тренировочной площадке Стражей, на втором уровне.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Научи меня вести бой двуручным мечом.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Чтобы овладеть техникой боя с двуручным мечом, нужна определенная сила и ловкость.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Ты справишься с таким оружием только тогда, когда сможешь управлять не только своим телом, но и духом.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Пройдя эту ступень подготовки, закалив свое тело и дух, ты сможешь справиться с мечом.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Ключ к этому - умение сосредоточиться. В нем тело и дух становятся единым целым.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Я хочу научиться еще лучше обращаться с двуручным мечом.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Ты уже освоил основы владения этим оружием. Теперь я научу тебя приемам, достойным мастера.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Сила твоего духа поможет тебе предугадывать движения противника до того, как он нанесет удар.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Если ты знаешь тактику противника, то победа уже наполовину в твоих руках.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Скорость - твое преимущество. Старайся, чтобы движения были плавными и неожиданными, а удары - точными и сильными.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Учись не обращать внимания на боль. Исход битвы будет зависеть от твоей силы воли.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Сохраняй спокойствие духа. Ты сможешь победить противника, если будешь идти в бой спокойным и сосредоточенным.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Используй свою силу осторожно и помни: тебя легче убить, если ты сам стал причиной поединка.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der groЯen Beschwцrung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Что же нам теперь делать?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Что же нам теперь делать?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Наше видение было очень неясным. Оно принесло нам больше вопросов, чем ответов.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Но одно стало ясно: мы видели орка в темной пещере. Недалеко отсюда есть заброшенный храм орков.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Раньше орки хоронили там умерших, поэтому это место называлось у них кладбищем орков.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Гуру Идол Люкор взял с собой нескольких Стражей и направился туда. Может быть, там мы найдем то, что послужит ответом на наши вопросы.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Мне нужен человек, который сможет пойти к ним, а затем вернуться ко мне и рассказать о том, что увидит.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Почему ты не можешь пойти туда сам? Ты же предводитель Стражей!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Моя задача - защищать Просвещенного. Я останусь здесь с Юберионом и буду охранять его.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Ты уже хорошо послужил нашему лагерю. Я доверяю тебе больше, чем кому бы-то ни было.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Поэтому я прошу тебя, отправляйся на кладбище орков и расскажи мне, что удалось найти нашим Стражам.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"А что я за это получу?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Я сейчас же пойду туда!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //А что я за это получу?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Тебе нужна руда? Наверное, я ошибся в тебе. Но мне все равно нужна твоя помощь. Вот сто кусков руды. Больше у меня нет!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Я сейчас же пойду туда!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Возьми вот это кольцо. Оно сможет защитить тебя в битве!
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Где находится кладбище орков?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Где находится кладбище орков?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Это недалеко. Послушник Талас знает дорогу. Ты сможешь найти его на площади перед Храмом. Он укажет тебе путь.

	B_LogEntry		(CH3_OrcGraveyard,	"Послушник Талас сможет показать мне дорогу на кладбище орков. Он ждет меня на площади перед Храмом.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я был на кладбище орков. Мы не смогли там ничего найти..."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Я был на кладбище орков. Мы не смогли там ничего найти. Никаких знаков, указывающих на Спящего.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //А что с Идолом Люкором и Стражами?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Они все мертвы.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Мертвы? Но почему, кто смел убить их?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //В пещерах очень много орков. Это они убили всех Стражей.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Идол Люкор смог спастись от них, но, к несчастью, он сошел с ума.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Он стал кричать, что Спящий приказал ему убить меня, и попытался выполнить этот приказ.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Наверное, его ум помутился из-за большого разочарования. Он так хотел найти что-нибудь там.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Я не верю, что его поступок был вызван волей Спящего.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //Такого не может... невозможно... Неважно!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Главное, что Идол Люкор не смог осуществить свое намерение.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Теперь вся наша надежда на Юбериона.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Как дела у Юбериона?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Как дела у Юбериона?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Сам он не сможет проснуться. Он быстро слабеет. Я знаю, что может его разбудить, но для этого мне нужна твоя помощь.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Как я могу ему помочь?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Найди мне болотные целебные травы. Принеси мне пять самых действенных из них.
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //И, пожалуйста, поторопись!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,	"Юберион все еще без сознания. Кор Ангар попросил меня найти для него пять кустов самых сильных лечебных трав.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "А где растут эти травы?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //А где растут эти травы?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Поищи в болотах за лагерем. Они растут достаточно далеко отсюда, но будь осторожен, там тебя могут поджидать болотожоры.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //Не стоит терять времени. Иди же!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Эти травы я смогу найти далеко на болотах за лагерем Братства. Там обитают опасные болотожоры. Я должен быть очень осторожен.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Как мне узнать те травы, которые помогут Юбериону?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Как мне узнать те травы, которые помогут Юбериону?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Они похожи на звезды из восьми зеленых и оранжевых лучей-листьев.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //А теперь иди.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Лечебные травы похожи на звезды из четырех зеленых и четырех оранжевых листьев.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Тех трав, которые я нашел, будет недостаточно.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Тех трав, которые я нашел, будет недостаточно.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Может быть, Фортуно сможет тебе помочь? Он же травник.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Тебе нужно торопиться. Принеси пять кустов. Юберион не может ждать ни минуты.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Krдuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,	"Такие травы могут быть припасены у Фортуно.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Я добыл целебные травы для Юбериона.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Я добыл целебные травы для Юбериона.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Отлично. Когда ты уходил, Юберион очнулся ненадолго.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Он что-нибудь сказал?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Да, он сказал, что Спящий на самом деле не является тем, что мы о нем думаем. Мы не должны пытаться разбудить его.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Теперь нам остается надеяться на то, что Юбериона можно вылечить.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,	"Я передал Кор Ангару лечебные травы. Теперь можно только надеяться на то, что еще не слишком поздно.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Юберион умер. Наш духовный учитель оставил нас!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Даже твоя помощь не смогла отвратить от него смерть!
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //Что же теперь будет, Кор Ангар?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Я всегда доверял Юбериону. Перед смертью он сказал мне, что теперь нам остается надеяться только на магов Воды.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Значит, нам нужно помочь магам Воды.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Да, им нужен будет юнитор и альманах. И то, и другое находится у Кор Галома.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //А где сейчас Кор Галом?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //После слов Юбериона он ужасно рассердился и отправился сам искать путь к Спящему, взяв с собой нескольких Стражей.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Как же мы теперь сможем забрать юнитор?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Я думаю, он оставил юнитор и книгу в своей лаборатории. Вот тебе ключ от его сундука.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Подожди!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //В чем дело?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Возьми эту руну в знак нашей благодарности за твою помощь.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Она даст тебе возможность быстро перенестись на площадь перед нашим Храмом.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Спасибо тебе!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
