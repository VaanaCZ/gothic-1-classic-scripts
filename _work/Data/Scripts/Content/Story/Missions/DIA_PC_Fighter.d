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
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Оружие к бою!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Еще увидимся.
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
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Эй, новые лица.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Кто ты?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Я Горн. Наемник магов.
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
	description		= "А что должны делать наемники?";
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
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //А что должны делать наемники?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Ли заключил с магами сделку. Он нанял всех лучших бойцов колонии, то есть нас.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Мы следим за тем, чтобы никто не мешал рудокопам добывать руду и охраняем магов.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //А маги делают все, чтобы мы смогли освободиться отсюда. За наши услуги нам отдают часть добытой руды.
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
	description		= "Могу я где-нибудь здесь остановиться?..";
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
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Могу я где-нибудь здесь остановиться, так чтобы не пришлось никого выгонять из дома?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Не думаю. Но если уж так хочется, поговори со Шрайком.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Он занял первый дом, прямо напротив входа в пещеру. Он пустовал, но вообще-то он принадлежит нам.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Нам?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Ну, да, наемникам. Мы живем отдельно от воров. И обычно никто из шайки Ларса не появляется на нашей половине пещеры.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //Для нас это не так важно, но Шрайк никого не спрашивал. А ворам ничего нельзя спускать с рук, иначе они наглеют!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,	"Наемник Горн рассказал мне, что Шрайк без разрешения вселился в один из домов наемников. Так как я спросил разрешения у Горна, никто из наемников не помешает мне, если я попрошу Шрайка найти себе что-то другое.");
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
	description		= "Шрайк нашел себе другой дом.";
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
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Шрайк нашел себе другой дом.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Хорошо. Только что со мной говорил Тарлоф. Он хочет сам переговорить с этим парнем.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,	"Горну понравилось, как я выкинул Шрайка из пустого дома. Думаю, ему можно доверять. Постараюсь в будущем держаться к нему поближе.");
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
	description		= "Что я должен сделать, чтобы меня приняли в Новый лагерь?";
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
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Что я должен сделать, чтобы меня приняли в Новый лагерь?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Ты должен научиться хорошо владеть оружием, чтобы Ли взял тебя на службу. Неважно, какое оружие ты будешь использовать.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Еще ты должен знать наши законы и разбираться в жизни лагеря.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Если ты не собираешься присоединяться к другому лагерю, обратись к ворам, и только потом приходи к нам.
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
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //А у тебя еще много таких вещей?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Много. Хочешь купить?
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
	description		= "Почему ты участвовал в налете, который устроила шайка воров?";
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
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Почему ты участвовал в налете, который устроила шайка воров?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //А кто сказал, что я в нем участвовал?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Почему же у тебя так много товара?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Ну, разве можно было забрать все это за один раз?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //Так ты постоянно участвуешь в налетах?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //А если и так, я все равно ничего не буду тебе рассказывать. Ли не держит болтливых людей.
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

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //А, это ты! Лестер, мой друг из Болотного лагеря, рассказывал мне о том, что ты там сделал.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Неплохо для человека, который провел здесь так мало времени.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Да, если бы мне не так везло, я бы уже давно стал кормом для червей.
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
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Поговори об этом с Сатурасом. Он среди них главный. Целыми днями он изучает какие-то свитки.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Вот только наемники, которые охраняют магов, не пропустят тебя к нему.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Ты можешь замолвить за меня словечко?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Я - нет. Но вот Кронос, хранитель руды, - он может дать тебе разрешение.
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
	description	= "А где я смогу найти этого 'хранителя руды'?";
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
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //А где я смогу найти этого 'хранителя руды'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Пройдешь дальше по дороге, и за дамбой увидишь большую пещеру.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //В центре пещеры лежит руда. Там ты и найдешь его.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Одно плохо: Кронос слишком высокомерен. Ты должен будешь доказать ему, что твое послание очень важно.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,	"Горн посоветовал мне обратиться к верховному магу Круга Воды. Его зовут Сатурас. Кронос, хранитель руды, может дать мне разрешение на проход к магам. Я смогу найти его в центре пещеры, возле рудной горы."); 

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

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Привет! Как видишь, наша колония не так уж велика.
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
	description = "Что привело тебя сюда?";
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
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Что привело тебя сюда?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //О, я хочу найти здесь следы одной легенды.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Легенды?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Да. Мильтен, один из моих друзей в Старом лагере, рассказывал мне, что когда-то здесь жили монахи.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Конечно, это было еще до появления Барьера.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Они почитали бога, который награждал своих приверженцев даром превращения в животных.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Я думаю, здесь должны были сохраниться некоторые из их сокровищ.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //А что ты здесь ищешь?
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
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Наверное, эта штука находится в руинах старого монастыря по ту сторону ущелья.
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
	description = "Мы можем пойти туда вместе.";
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
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Мы можем пойти туда вместе.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Хорошая идея. Здесь же так много глорхов.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Опытный охотник без труда справится с ними по одиночке, но обычно они охотятся стаями.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //А стая расправится с любым воином в два счета.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Мы идем вместе?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Да, но сначала я осмотрю ущелье, а уж потом перейду на другую сторону. Лучше всегда знать, что у тебя за спиной.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Идем, я нашел дорогу.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,	"По дороге к развалинам монастыря я встретил наемника Горна. Его привело сюда желание найти древние сокровища.");
	B_LogEntry			(CH3_MonasteryRuin,	"Мы решили вместе продолжить наши поиски. Горн сказал мне, что впереди нас ждет стая зверюг, которые гораздо сильнее глорхов.");

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

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Вот это удача. Кажется, эта пещера раньше была складом.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Теперь ты иди вперед. А я хочу убедиться, что наш отход будет безопасным.

	B_LogEntry		(CH3_MonasteryRuin,	"Мы нашли пещеру, в которой раньше устраивали склад. Там я взял ключ и два свитка.");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Мне кажется, руины тебе больше неинтересны.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Я пойду один.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Следуй за мной, если передумаешь.

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

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Эти чертовы ворота! Мне говорили, что еще ни один человек не смог их открыть.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Только эти мелкие твари проникли во внутренний двор монастыря.

	B_LogEntry		(CH3_MonasteryRuin,	"Мы стоим перед запертыми воротами. Кажется, мы не сможем открыть их снаружи.");

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
	description = "Что нам делать теперь?";
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
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //Что нам делать теперь?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Ты должен найти способ пробраться через эти ворота.
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

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Там, наверху, есть небольшая площадка. Но, кажется, она слишком высоко.
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

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Это похоже на какой-то пьедестал.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Возможно, как раз здесь лежал тот предмет, который ты ищешь.

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

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Тебе удалось открыть ворота. Как вовремя ты использовал это заклинание!
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //Нам нужно идти дальше.

	B_LogEntry		(CH3_MonasteryRuin,	"Я прочитал найденный на складе свиток и превратился в жука. Конечно же, мне удалось пролезть в узкую щель и попасть во внутренний двор.");
	B_LogEntry		(CH3_MonasteryRuin,	"Теперь проход открыт.");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Мне кажется, руины тебе больше неинтересны.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Я пойду один.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Следуй за мной, если передумаешь.

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

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //Так ты нашел свой артефакт!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Да. Я должен отнести его магам Воды.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Я еще немного провожу тебя.

	B_LogEntry		(CH3_MonasteryRuin,	"В помещении, похожем на учебный класс, я нашел один из юниторов. Горн решил сопровождать меня еще немного.");

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

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //О, черт! Что это за великан впереди?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Откуда взялось это чудовище?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //Он похож на одного из неуязвимых троллей. Только он не такой большой.
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Вот как всегда, если хочешь куда-нибудь пройти, какая-то тварь преграждает дорогу.

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

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Это было нелегко.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Вот это да! Мы победили это чудовище. Но это был еще молодой тролль...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... тогда нам лучше уйти отсюда побыстрее, иначе мы станем добычей его родителей.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Кажется, ты прав.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Здесь наши пути расходятся. Я хочу еще немного изучить это место.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Но мы еще увидимся, я уверен. До встречи, друг.

	B_LogEntry		(CH3_MonasteryRuin,	"Когда мы вернулись во двор монастыря, мы столкнулись с молодым троллем. Нам удалось победить его.");
	B_LogEntry		(CH3_MonasteryRuin,	"Потом наши с Горном пути разошлись. Но мне кажется, что я его еще увижу.");

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
	description = "Недалеко от Старого лагеря я встретил Диего и Мильтена.";
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
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Недалеко от Старого лагеря я встретил Диего и Мильтена.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //Это хорошая новость!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Они хотят видеть тебя и Лестера. На вашем обычном месте.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Спасибо. Дружба - самое ценное, что у нас осталось.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Ты уже почти один из нас. Ты заслужил наше доверие.

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"Я рассказал Лестеру и Горну о том, что друзья хотят их видеть. Они сами знают, где именно состоится эта встреча."); 
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
	description = "Что ты видел в Свободной шахте?";
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
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Что ты видел в Свободной шахте?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //После осмотра руин я вернулся туда и захотел зайти к Окилу, хозяину Свободной шахты.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Но там я увидел только трупы.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Еще я заметил, как стражники строили укрепления у входа в шахту.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //А как две дюжины стражников справились с гарнизоном наемников?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //Мне показалось, что это было нападение из засады. Никто не ожидал, что стражники придут со стороны гор.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //А внезапность, как известно, является очень большим преимуществом.
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
	description = "Что ты собираешься делать теперь?";
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
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Что ты собираешься делать теперь?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Нужно заново организовать систему безопасности лагеря. А это займет много времени.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //До того как придет Ли со своими людьми, я присоединюсь к отряду Корда.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //А вы собираетесь нанести Гомезу ответный удар?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Еще нет, но этот день не за горами.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Если захочешь меня найти, иди в сторону шахты. Там и будет находиться мой пост.

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
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Кругом тихо, словно в Свободной шахте не осталось живых.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Ли все еще занят организацией обороны.
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

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Ты пришел вовремя. Мы готовимся нанести ответный удар.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Сперва мы хотим отвоевать Свободную шахту.
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
	description = "Отвоевать вчетвером? А остальные что делать будут?";
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
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Отвоевать вчетвером? А остальные что делать будут?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Лобовая атака ничего нам не даст. Люди Гомеза слишком хорошо подготовились к ней!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Мы хотим перебить их по одному, незаметно. Думаю, нам это удастся.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Ли просил меня передать тебе кое-что.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Возглавлять операцию он поручает тебе, ты ведь один из лучших наемников.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Тебе будет поручено провести эту операцию. Ты же один из сильнейших магов Воды и у тебя богатый опыт сражений.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Он поручает тебе провести эту операцию, так как ты один из лучших воров лагеря.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Ты не из нашего лагеря, но ты показал, что достоит нашего доверия.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Мы предлагаем тебе провести эту операцию.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Я пойду с тобой. Вместе мы справимся.
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
	description = "Сперва шахта, а что потом?";
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
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Сперва шахта, а что потом?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Как только мы захватим шахту, мы будем искать тот проход в горах, которым воспользовались люди Гомеза.
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Когда мы его перекроем, мы снова сможем контролировать ситуацию.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Понятно.  
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
	description = "Но почему здесь понадобился именно я?";
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
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Но почему здесь понадобился именно я?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Ты уже много раз доказывал нам свою храбрость и способность мыслить.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Кроме того, ты лучше всех знаешь Старый лагерь и его стражников.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Думаю, только ты можешь справиться с этим ответственным заданием.
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
	description = "Ладно, пойдем, покажем этим непрошенным гостям...";
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
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //Ладно, пойдем, покажем этим непрошенным гостям, что значит зариться на чужое добро!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Я так и думал, что ты согласишься!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Вот, возьми этот ключ. Он открывает дверь в караульную у входа в шахту.

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
	description = "Почему бы и нет. Мне все равно нужно попасть в шахту!";
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
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Почему бы и нет. Мне все равно нужно попасть в шахту!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Я так и думал, что ты согласишься!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Вот, возьми этот ключ. Он открывает дверь в караульную у входа в шахту.

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
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Вор по имени Волк хотел встретиться с тобой перед тем, как мы пойдем в шахту.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF, "Он может подождать. Нам предстоят более важные дела.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF, "Что ж, пойду узнаю, что он хотел.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,	"Волк, один из воров, хочет поговорить со мной, перед тем как мы спустимся в шахту. Мне нужно его увидеть.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Он может подождать. Нам предстоят более важные дела.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Как хочешь!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Что ж, пойду узнаю, что он хотел.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Хорошо. Я подожду тебя здесь.

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
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Мне кажется, ты хочешь поговорить с Волком!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Нет, нам не туда. Пойдем к шахте.
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Я буду ждать тебя здесь.

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
	description = "Пойдем в шахту!";
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
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Пойдем в шахту!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Пришло время расправиться с этими стражниками.
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Иди вперед, а я пойду за тобой!

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

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //Осторожно.
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Они тоже охотятся стаями, как и глорхи, только они гораздо опаснее.
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Мы должны убить их. Ты же знаешь, я не люблю, когда за спиной остаются враги.

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

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Подожди-ка, видишь эти тела?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Иди к входу в шахту, а я буду тебя прикрывать. 
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Когда ты спустишься, я пойду за тобой.

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

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Я слышал, как на тебя кто-то напал, и пришел на помощь.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //А, это был один старый знакомый... Но с ним уже разобрались.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Хорошо. Открывай ворота, а я прослежу за ситуацией.

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

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //О, нелегко нам далась эта битва.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Никогда бы не подумал, что люди Гомеза способны так обороняться.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Главное, что мы смогли освободить от них нашу шахту.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Я останусь здесь и буду следить за тем, чтобы никто чужой сюда не прошел.

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
	description = "Как дела?";
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
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Как дела?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Кругом тихо, словно в Свободной шахте не осталось живых.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Но если Ли не пришлет подкрепление, то эта тишина продлится недолго.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Ну а я пока постараюсь расположиться поудобнее.
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

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Какая странная у тебя штуковина на руке. Кажется, ее сделали орки.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Неужели ты взял ее у тех орков, что были рабами на Старой шахте?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //У орков он считается знаком дружбы. Я хочу с ним зайти в город орков.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Очень надеюсь, что орки не трогают тех, кто носит этот... предмет!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








