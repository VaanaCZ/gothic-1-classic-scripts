// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Я могу что-нибудь сделать для тебя?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Кто ты?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Кто ты?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Я Равен, первый помощник Гомеза. Все, кто хочет встретиться с ним, сначала говорят со мной.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "Я от Кор Галома. У меня есть немного болотника для Гомеза.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Я от Кор Галома. У меня есть немного болотника для Гомеза.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Поговори об этом с Бартоло. Гомез не разговаривает с посыльными.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Бартоло ты найдешь в комнатке справа от входа или на кухне в большой башне.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Ночью он, конечно же, спит. И лучше тебе в это время его не беспокоить.

	B_LogEntry			(CH1_KrautBote,	"Болотник для Гомеза я должен отдать Бартоло. Он находится в доме Баронов.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Я хочу видеть Гомеза. Торус сказал, что я могу стать Призраком.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Я хочу видеть Гомеза. Торус сказал, что меня могут взять в Призраки.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Надежные люди нам всегда нужны. А на тебя можно положиться, раз тебя прислал Торус. Думаю, ты нам подойдешь.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Я отведу тебя к Гомезу. Иди за мной. Только ничего не трогай!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Вон там сидит Гомез. Если ты выберешь неверный тон, я лично научу тебя хорошим манерам, ясно?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "Как идет добыча руды?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Как идет добыча руды?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //Рудокопы на Старой шахте потрудились на славу. Последний груз из внешнего мира был довольно большим.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Гомез сказал, что теперь я работаю на вас.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Гомез сказал, что теперь я работаю на вас.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Хорошо. У меня как раз есть для тебя одно задание.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Если у тебя действительно хорошие связи, у тебя с ним не возникнет никаких проблем.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "Что я должен сделать?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Что я должен сделать?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Мы ведем торговлю с Братством. Это, конечно, не значит, что мы доверяем этой болотной братии.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Пойди в их лагерь.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Когда ты будешь там, следи за всем, что там происходит. Запоминай все, что увидишь и услышишь. Это может нам пригодиться.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //И чем больше ты узнаешь, тем лучше. Ты должен действовать осторожно. Думаю, ты понимаешь, что я имею в виду?
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Будь спокоен, я постараюсь не ссориться с ними.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Я знал, что ты поймешь меня правильно.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Равен послал меня в лагерь на болотах. Я должен разузнать, что готовят Гуру. Может быть, я смогу найти что-то полезное для Баронов.");
};

// *********************************************
// 				Ausrьstung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Где здесь можно найти хорошее снаряжение?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Где здесь можно найти хорошее снаряжение?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Иди к Диего. Он даст тебе один из доспехов. Он будет служить тебе опознавательным знаком и защитой от врагов.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //В нем ты сможешь ходить по всему лагерю. Никто не будет тебя останавливать.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //А если тебе нужно оружие, поговори со Скипом. Ты найдешь его в большом сарае во внутреннем дворе замка, слева от ворот.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,	"У Диего можно найти хорошие доспехи для Призраков. Днем он стоит у входа в замок.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,	"Стражник Скип со двора замка продает оружие. Но только людям Гомеза.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Я подумал, что мне стоит доложить о своем приходе.";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Я подумал, что мне стоит доложить о своем приходе.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Хорошо. Мне нужно знать все, что происходит вокруг.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //Они провели Великую Церемонию.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Ты хорошо поработал.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Равен отблагодарил меня на словах! Честно говоря, у меня несколько иные понятия о благодарности. Теперь я буду действовать только по своему усмотрению.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Им нужны яйца ползунов, чтобы получить особое зелье. С его помощью они хотят укрепить силу духа и вызвать Спящего. Я добыл яйца у королевы ползунов.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Интересно. Хотелось бы узнать, сработает ли все это. Отнеси яйца в храм.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Ты хорошо поработал.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Равен отблагодарил меня на словах! Честно говоря, у меня несколько иные понятия о благодарности. Теперь я буду действовать только по своему усмотрению.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Я еще не знаю, что они там собираются делать.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Так зачем же ты меня отвлекаешь?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


