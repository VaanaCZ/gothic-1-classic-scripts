// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Falle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Falle_Condition;
	information		= DIA_Grim_Falle_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grim_Falle_Condition()
{	
	if	(Grim_ProtectionBully == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Falle_Info()
{
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Эй, ты! Я слышал, ты хочешь присоединиться к нашему лагерю?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //Да, и что из того?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Я могу помочь тебе...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Как помочь?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //За воротами лагеря сидят два рудокопа. Они украли кое-что у Баронов. В общем они украли один амулет, который пришел с последним грузом.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Наверное, этот амулет они держат при себе. Если мы вместе нападем на них, мы с ними быстро справимся. Одному мне это не под силу. Что скажешь?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Мне это не нужно. Пусть этим займется кто-нибудь еще."	,DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"А что будет, когда мы заберем у них амулет?"	,DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"Я готов."							,DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //Мне это не нужно. Пусть этим займется кто-нибудь еще.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //С таким отношением к делу ты здесь долго не протянешь. Если передумаешь, ты знаешь, где меня найти.
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //А что будет, когда мы заберем у них амулет?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //Это просто! Я верну амулет и получу награду. Ну, еще я упомяну там, что ты помогал мне. И ты будешь у Гомеза на хорошем счету.
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Мне это не нужно. Пусть этим займется кто-нибудь еще."	,DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Я не согласен. Ты даешь мне половину награды..."	,DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"Да, можешь."							,DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Я не согласен. Ты даешь мне половину награды, или разбирайся с ними сам!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Ладно, как хочешь, пополам так пополам. Награды должно хватить на двоих. Ну, я могу на тебя рассчитывать?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //Я готов.
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //Хорошо. 
	Info_ClearChoices	(DIA_Grim_Falle );
};

// **************************************************
// 				Bereit fьr Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Я готов пойти с тобой за амулетом!";
};

FUNC INT DIA_Grim_ReadyToGo_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_ReadyToGo_Info()
{
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Я готов пойти с тобой за амулетом!
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Ладно, иди за мной...
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"GUIDE");
};	

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance  DIA_Grim_AtOCdraussen(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 3;
	condition	= DIA_Grim_AtOCdraussen_Condition;
	information	= DIA_Grim_AtOCdraussen_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_AtOCdraussen_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Grim_AtOCdraussen_Info()
{
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Вот мы и на месте. Твой друг Диего не скоро здесь появится.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Бладвин просил передать тебе свой горячий привет!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Бладвин просил меня передать тебе привет!
	};

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	
	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);
	
	if ( (Npc_GetDistToNpc(self,Bu520)<1000) && (!Npc_IsDead(Bu520)) )
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};
	
	if ( (Npc_GetDistToNpc(self,Bu534)<1000) && (!Npc_IsDead(Bu534)) )
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
};

// **************************************************
// 				NACH Falle
// **************************************************

INSTANCE DIA_Grim_NACHFalle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_NACHFalle_Condition;
	information		= DIA_Grim_NACHFalle_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grim_NACHFalle_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_NACHFalle_Info()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Так ты заманил меня в ловушку, предатель!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Эй! Пойми меня правильно. Мне ведь совсем не хочется навечно застрять в шахте.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Если я хорошо справлюсь с этим заданием, меня примут в лагерь.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Ты ведь сам виноват в том, что мне поручили убрать именно тебя. Не стоило тебе ссориться со стражниками.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Лично я против тебя ничего не имею. Так что мы решим - драться или разойтись с миром?
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Думаю, мирным путем этот вопрос не решить!"	,DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Давай разойдемся с миром!"			,DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Думаю, мирным путем этот вопрос не решить!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Не самое лучшее решение, но пусть будет так.
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Давай разойдемся с миром!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Я рад, что ты понимаешь меня. Забудем об этом. Теперь я буду на твоей стороне.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Если у тебя возникнут неприятности, ты можешь на меня рассчитывать, я же твой должник.
	Info_ClearChoices	(DIA_Grim_NACHFalle );

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver;				
// **************************************************

INSTANCE DIA_Grim_Hallo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 1;
	condition		= DIA_Grim_Hallo_Condition;
	information		= DIA_Grim_Hallo_Info;
	permanent		= 0;
	description		= "Я новенький.";
};

FUNC INT DIA_Grim_Hallo_Condition()
{	
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};
	
	if (FirstOver == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Hallo_Info()
{
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Я новенький.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Ты недавно здесь, верно? Я Грим. Меня забросили сюда с прошлым караваном.
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_Leben (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Leben_Condition;
	information		= DIA_Grim_Leben_Info;
	permanent		= 0;
	description		= "И как здесь живется?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //И как здесь живется?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Довольно сносно, если платишь стражникам за защиту.
};

// **************************************************
// 						Aufnahme
// **************************************************

INSTANCE DIA_Grim_Aufnahme (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Aufnahme_Condition;
	information		= DIA_Grim_Aufnahme_Info;
	permanent		= 0;
	description		= "Я хочу быть принятым в этот лагерь. Что мне нужно сделать?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Я хочу быть принятым в этот лагерь. Что мне нужно сделать?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Сначала ты должен стать Призраком. Для этого тебе стоит заручиться поддержкой одного из влиятельных людей.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //На твоем месте я бы обратился к Диего. Кстати, я так и сделал. Здесь его уважают.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //Каждому, кто к нему обратится, он дает какое-нибудь важное задание. У некоторых Призраков тоже найдутся для тебя поручения.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Если ты справишься, тебя примут в лагерь.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

INSTANCE DIA_Grim_HowFarAreYou (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_HowFarAreYou_Condition;
	information		= DIA_Grim_HowFarAreYou_Info;
	permanent		= 1;
	description		= "Как проходит твое испытание?";
};

FUNC INT DIA_Grim_HowFarAreYou_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_HowFarAreYou_Info()
{
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //Как проходит твое испытание?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Я уже разговаривал с Декстером, Слаем и Фингерсом. 
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC, "Декстер, Слай и Фингерс самые влиятельные из Призраков.");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_YourPDV (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 5;
	condition		= DIA_Grim_YourPDV_Condition;
	information		= DIA_Grim_YourPDV_Info;
	permanent		= 0;
	description		= "В чем заключается твое испытание?";
};

FUNC INT DIA_Grim_YourPDV_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_YourPDV_Info()
{
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //В чем заключается твое испытание?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Этого я не могу тебе сказать. О таких вещах здесь не говорят!
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMO(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMO_Condition;
	information	= DIA_Grim_INEXTREMO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_INEXTREMO_Condition()
{
	if	(Kapitel == 2) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Эй, слышал новость?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //Здесь In Extremo! Они будут выступать на сцене.
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Торопись! Жаль будет пропустить их выступление.

	Npc_ExchangeRoutine	(self,	"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMOAWAY_Condition;
	information	= DIA_Grim_INEXTREMOAWAY_Info;
	permanent	= 0;
	important 	= 0;
	description = "А где In Extremo?";
};                       

FUNC int  DIA_Grim_INEXTREMOAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Grim_INEXTREMO)
	&&	(Kapitel == 3) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //А где In Extremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Они уже уехали. А я уже так привык сидеть по вечерам перед сценой.

	AI_StopProcessInfos	(self);
};

