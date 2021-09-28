//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Защищайся!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Увидимся.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. BegrьЯung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Эй. Новые лица.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Ты кто?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Я - Горн, наемник на службе у магов.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "И в чем заключаются твои обязанности?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //И в чем заключаются твои обязанности?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Ли заключил с магами сделку. Он нанял лучших бойцов в колонии - то есть нас.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Мы охраняем магов и заботимся о том, чтобы рудокопы могли работать спокойно.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Маги должны позаботиться о том, чтобы рано или поздно все мы смогли убраться отсюда. А еще мы получаем малую толику руды в качестве платы за службу. 
};

//*************************************
//			Hьtte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "Можно где-нибудь здесь остановиться?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Можно где-нибудь здесь остановиться - так, чтобы не пришлось никого выкидывать из дома?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Не думаю. Но если так уж приспичило, поговори со Шрайком.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Он занял дом напротив, рядом со входом в пещеру. Дом был пустой - но принадлежал-то он нам.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Нам?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Ну, нам, наемникам. Наемники и воры живут раздельно, и ни один из шайки Ларса не должен появляться по эту сторону от большой дыры.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //На самом деле, разницы никакой. Но Шрайк никого и не спрашивал. А ворам нельзя позволять делать все, что заблагорассудится, иначе они наглеют!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Наемник Горн сказал мне, что Шрайк занял хижину без спроса. Поскольку я поговорил с Горном, то остальные наемники не будут мне мешать беседовать со Шрайком по душам.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			Hьtte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Шрайк переехал в другой дом.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Шрайк переехал в другой дом.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Хорошо. Торлоф только что сказал мне, что хочет переговорить с парнем.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Горн удивился, когда узнал, что я сумел убедить Шрайка покинуть дом. Думаю, он честный парень. Крутой, но справедливый. Надо будет продолжить наше знакомство в будущем.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			Sцldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Что нужно сделать, чтобы присоединиться к Новому Лагерю?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Что нужно сделать для того, чтобы присоединиться к Новому Лагерю?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Прежде чем говорить об этом с Ли, ты должен научиться хорошо драться - неважно, каким оружием.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Помимо этого, ты должен знать все про здешнюю жизнь и ее законы.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Если ты не собираешься появляться в других Лагерях, стоит попробовать присоединиться к воровской шайке, прежде чем пытаться стать наемником.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Сколько у тебя этого добра?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Полно. Хочешь купить?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Зачем ты участвовал в налете?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Зачем ты участвовал в налете?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //Кто сказал, что я участвовал?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Если это не так, откуда у тебя столько товара?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Не думаешь же ты, что все это - ОДИН улов?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //Так ты постоянно участвуешь в налетах?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Если и так, тебе я об этом не скажу. Ли это не понравится.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Понятно.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig fьr Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //А-а, это ты! Мой друг Лестер из Болотного Лагеря рассказал мне о твоих подвигах.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Совсем неплохо для человека, который появился здесь не так уж давно.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Да, но несколько раз я был совсем близок к тому, чтобы отправиться на корм червям.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "У меня важное послание для магов Воды!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //У меня важное послание для магов Воды!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Тогда тебе нужно поговорить с Сатурасом. Он главный среди водяных магов, все дни проводит за какими-то письменами или чем-то еще.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Но стражники на верхнем уровне не пропустят тебя к нему, каким бы важным ни было твое послание.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Не замолвишь за меня словечко?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Я - нет, но ты можешь получить разрешение у Кроноса, хранителя руды.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Где мне искать этого 'хранителя руды'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Где мне искать этого 'хранителя руды'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Если пойдешь отсюда, за дамбой увидишь большую пещеру.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Кронос обычно стоит у решетки возле железной горы.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Но наш хранитель - довольно высокомерный тип. Тебе придется убедить его в том, что твое послание действительно важно.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Горн порекомендовал мне пойти прямо к главному магу воды по имени Сатурас. Кронос, хранитель руды, может устроить мне эту аудиенцию. Его можно найти в центре Лагеря, у решетки над горой руды."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Привет, салага! Как видишь, этот мир тесен, и колония не является исключением.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Все время натыкаешься на своих знакомых.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Чем ты занимаешься?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Что ты здесь делаешь?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //А-а, пытаюсь поймать за хвост одну старую легенду.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Легенду?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Да, мой приятель из Старого Лагеря, Мильтен, говорил мне, что когда-то здесь жили монахи.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Конечно, это было задолго до того, как появился Барьер.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Говорят, они молились богу, который даровал им способность превращаться в животных.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Уверен, со старых времен здесь должна была сохраниться куча сокровищ.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //Что привело тебя сюда?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я ищу юнитор.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Я ищу юнитор.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Он должен быть где-то здесь.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Эта штука может быть в руинах старого монастыря по ту сторону ущелья.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Мы могли бы пойти вместе.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Мы могли бы пойти вместе.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Хорошая идея. Тут полно глорхов.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Один глорх - не проблема для опытного охотника, но, к сожалению, чаще всего они охотятся стаями.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //А стая глорхов без труда порвет на тряпки самого опытного воина.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Так мы идем вместе?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Да, но прежде чем идти, я хочу осмотреть ущелье. Не люблю оставлять врага за спиной.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Идем, я нашел дорогу.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"Когда я подходил к руинам монастыря, то встретился с наемником Горном. Он ищет здесь клады.");
	B_LogEntry			(CH3_MonasteryRuin,"Мы продолжим поиски вместе. Горн предупредил о больших стаях гролхов, бродящих по округе.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Вот это я называю удачей. Похоже, эту пещеру использовали как склад.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Почему бы тебе не пойти вперед? Хочу убедиться, что никто не будет поджидать нас на обратном пути.

	B_LogEntry		(CH3_MonasteryRuin,"Мы нашли потайную пещеру, использовавшуюся как склад. По крайней мере один ключ и два свитка с заклинаниями оказались достойными внимания.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Кажется, ты потерял интерес к монастырским руинам.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Я пойду один.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Если передумаешь, ступай следом.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Эти чертовы ворота! Говорят, что еще никому в колонии не удавалось открыть их.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Только этим мелким тварям удается без труда проникать во внутренний двор.

	B_LogEntry		(CH3_MonasteryRuin,"Мы стоим прямо перед воротами. Похоже, что открыть их снаружи нельзя.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "Что теперь?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //Что случилось?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Нужно найти способ, как перебраться через ворота.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Видишь эту площадку, вон там? Но она высоко, не забраться.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Придется поискать другой путь.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Похоже на какой-то пьедестал.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Похоже, тот артефакт, который ты ищешь, лежал здесь.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Ты все-таки открыл эти ворота! Хитрое заклинание!
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //Идем дальше.

	B_LogEntry		(CH3_MonasteryRuin,"При помощи найденного в пещере свитка я превратился в жука. Так я смог пробраться через щель в стене.");
	B_LogEntry		(CH3_MonasteryRuin,"Ворота теперь открыты.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Кажется, ты потерял интерес к монастырским руинам.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Я пойду один.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Если передумаешь, ступай следом.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //Ты все-таки нашел свой артефакт!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Ага. Я должен отнести его магам Воды. 
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Я составлю тебе кампанию еще на какое-то время.

	B_LogEntry		(CH3_MonasteryRuin,"Я нашел юнитор в зале, похожей на класс. Горн пока останется со мной.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //О, ЧЕРТ!!! Что это за тварь там?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Откуда взялось ЭТО?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //Похоже на одного из этих неуязвимых троллей, только размером поменьше!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Что бы это ни было, если мы хотим убраться отсюда, нам придется разделаться с этой тварью.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Непростая работенка.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Уф! С чудовищем мы разобрались, но если это был всего лишь МОЛОДОЙ тролль...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //…тогда нам лучше не попадаться на глаза его родителям, верно?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Что-то вроде того.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Здесь наши пути расходятся. Я еще ненадолго останусь - хочу осмотреть окрестности.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Но думаю, мы еще встретимся. Увидимся, друг мой!

	B_LogEntry		(CH3_MonasteryRuin,"По дороге обратно, во двор монастыря, нам встретился молодой тролль. Бой был жестоким, но мы сумели победить.");
	B_LogEntry		(CH3_MonasteryRuin,"Наши с Горном пути разошлись. Но меня не покидает чувство, что скоро мы снова встретимся.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Возле Старого Лагеря я встретил Диего и Мильтена!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Возле Старого Лагеря я встретил Диего и Мильтена!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //Хорошие новости!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Они хотят встретиться с тобой и с Лестером. Там же, где и всегда.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Спасибо. В наши времена нет ничего ценнее друзей.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Ты уже почти стал одним из нас. На тебя можно положиться!

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

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Что происходит в Свободной Шахте?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Что происходит в Свободной Шахте?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //После того как я вернулся с монастырских руин, я захотел заглянуть к Окилу, хозяину Свободной Шахты.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Но там я нашел только трупы...
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Я видел, как стражники строят укрепления неподалеку от входа в шахту.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Как могли два десятка стражников справиться со всеми наемниками?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //Это похоже на засаду. Никто не ожидал атаки со стороны гор.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Ты же знаешь: внезапность увеличивает силу нападающих.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Что ты теперь собираешься делать?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Что ты теперь собираешься делать?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Придется пересмотреть всю нашу систему обороны. На это потребуется время.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //До тех пор пока не подтянется Ли со своими ребятами, я присоединюсь к отряду Корда.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Не собираетесь в контратаку?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Пока еще нет, но дай срок.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Если я тебе зачем-то понадоблюсь, иди отсюда по направлению к шахте. Я буду там, на страже.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Как дела?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Все тихо. Свободная Шахта словно вымерла.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Ли по-прежнему занят организацией обороны.
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Ты как раз вовремя! Мы готовимся к контратаке.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Первый шаг - отвоевать Свободную Шахту.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ты планируешь захватить ее с отрядом из четырех человек?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Ты планируешь захватить ее с отрядом из четырех человек? Где все наемники?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Атаковать в лоб не годится. Люди Гомеза слишком хорошо подготовились к этому!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Но мы собираемся проделать все незаметно. Будем снимать врагов одного за другим - это может сработать. 
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Ли просил меня передать тебе кое-что.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Ты был избран для этого задания как один из лучших наемников.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Ты был избран для этого задания как опытный воин и один из магов Круга Воды.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Ты был избран для этого задания как один из лучших воров.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Несмотря на то что ты не один из нас, ты не раз помогал нашему Лагерю и всецело доказал свою преданность.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Мы даем тебе шанс выполнить еще одно задание!
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Я пойду с тобой. Вместе мы сможем сделать это!
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "Это первый шаг. А второй?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Это первый шаг. А второй?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Как только шахта снова будет у нас, мы начнем искать проход в горах, которым воспользовались люди Гомеза.
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Когда этот путь будет отрезан, ситуация снова будет у нас под контролем.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Понимаю.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Почему вы выбрали именно меня?";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Почему вы выбрали именно меня?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Ты уже не раз доказывал, что тебе присущи одновременно и трезвость ума, и бесшабашная храбрость!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Помимо этого, ты знаешь Старый Лагерь и его стражников лучше, чем кто-либо из нас.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Ты лучше всех можешь справиться с этим непростым заданием.
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ладно, пойдем покажем, на что способны свободные люди!";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //Ладно, пойдем покажем непрошенным гостям, на что способны свободные люди!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Ничего другого я от тебя и не ожидал!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Вот, возьми этот ключ. Он от двери караульной у входа в шахту.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Почему бы и нет. Мне же все равно нужно попасть в шахту!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Почему бы и нет. Мне же все равно нужно попасть в шахту!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Понимаю, что у тебя на то есть СВОИ причины, но все-таки я рад, что мы вместе!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Вот, возьми этот ключ. Он от двери караульной у входа в шахту.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Да, чуть не забыл!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //До отхода с тобой хотел поговорить один из воров, Волк.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"Он может подождать, у нас сейчас есть дела поважнее.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Тогда я лучше пойду к нему.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Волк хочет поговорить со мной до того, как я пойду в шахту. Надо его найти.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Он может подождать, у нас сейчас есть дела поважнее.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Как скажешь!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Тогда я лучше пойду к нему.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Хорошо. Я буду ждать тебя здесь.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Похоже, ты все-таки хочешь поговорить с Волком!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Не туда! Мы должны идти к шахте!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Я буду ждать тебя у поста.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Отправляемся в шахту!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Отправляемся в шахту!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Настало время выбить оттуда стражников!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Иди вперед, я пойду следом!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //БЕРЕГИСЬ!!!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Они охотятся стаями, как и глорхи, но их укусы будут пострашнее!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Мы должны избавиться от них. Ты меня знаешь, я не люблю оставлять врага за спиной.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Постой-ка, ты видишь эти тела?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Иди ко входу в шахту, а я останусь здесь и прослежу за тем, чтобы никто не напал сзади.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Я подойду, когда ты спустишься.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Я услышал звуки боя и сразу пошел за тобой.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Старый знакомый... Но этот счет уже оплачен.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Хорошо. Открывай ворота, я прикрою.

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Ох, парень. Это был непростой бой.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Никогда бы не подумал, что люди Гомеза способны так драться.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Главное - это то, что мы все-таки выбили их из шахты.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Я останусь здесь и прослежу, чтобы они не вернулись.

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee ьber die befreite Mine informieren.     ***Bjцrn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "Как обстановка?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Как обстановка?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Все тихо. Свободная Шахта словно вымерла.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Но долго это не продлится, если Ли не пошлет сюда подкрепление.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Ну а пока я попробую расположиться поудобнее.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Забавная у тебя штуковина. Похоже, это орочья работа.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Тебе его дал раб из шахты?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //Это оркский знак дружбы. С ним я хочу войти в город орков.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Надеюсь, что орки поймут этот... ЗНАК!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








