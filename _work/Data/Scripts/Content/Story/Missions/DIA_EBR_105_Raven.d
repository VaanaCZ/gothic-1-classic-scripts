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
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Тебе что-нибудь нужно?
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
	description	= "Как тебя зовут?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Ты кто?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Я Равен, правая рука Гомеза. Прежде чем увидеть Гомеза, ты должен поговорить со мной. Это касается всех.
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
	description	= "Кор Галом прислал Гомезу болотник.";
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
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Кор Галом прислал Гомезу болотник.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Этим у нас занимается Бартоло. Гомеза не общается с мальчиками на побегушках.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Ты найдешь его в комнате справа от входа или на кухне в большой башне.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Ночью он, понятное дело, спит и на твоем месте я бы не стал его беспокоить.

	B_LogEntry			(CH1_KrautBote,"Запас болотника для Гомеза надо оставить у Бартоло. Я смогу найти его в доме Баронов.");
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
	description	= "Я хочу увидеть Гомеза.";
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
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Я хочу увидеть Гомеза. Торус сказал, что меня должны зачислить в Призраки.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Хорошие люди нужны везде. Ты не похож на придурка. Думаю, все у тебя будет в порядке.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Иди за мной - я отведу тебя к Гомезу. И ничего не трогай!
	
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
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Гомез сидит там. Если не будешь проявлять к нему уважение, он лично начнет учить тебя хорошим манерам, усек?
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
	description	= "Как идет обмен?";
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
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Как идет обмен?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //На Старой Шахте хорошо потрудились. Последний груз из внешнего мира был очень большим.
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
	description	= "Гомез сказал, я теперь с вами.";
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
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Гомез сказал, я теперь с вами.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Здорово! Ну, раз так, ты можешь доказать свою преданность, выполнив это задание.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Для тебя это должно быть не слишком сложно, особенно если ты не врешь по поводу своих связей.

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
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Мы ведем большой обмен с Братством. Но это совсем не значит, что мы им доверяем.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Отправляйся на болото.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Когда доберешься до Лагеря, смотри в оба. Все, что ты найдешь, может оказаться полезным для нас.  
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Чем больше ты принесешь, тем лучше. Действуй с умом... если ты, конечно, понимаешь, о чем я говорю.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Расслабься, я не собираюсь их злить.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Я знал, что ты поймешь.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Равен послал меня к Братству в Болотный Лагерь от лица Старого Лагеря. Я должен осмотреться и держать уши настороже. Возможно подвернется какая-то ценная для Баронов информация.");
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
	description	= "Где можно найти хорошее оружие?";
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
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Где мне найти снаряжение получше?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Поговори с Диего - он подберет тебе какие-нибудь доспехи. Так у тебя будет больше шансов уцелеть, да и за опознавательный знак он вполне сойдет.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Эти доспехи позволят тебе беспрепятственно ходить повсюду.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Если тебе нужно оружие, поговори со Скипом. Ты найдешь его в дальней части большого сарая, что находится слева во внутреннем дворе замка.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"У Диего есть доспехи получше для людей Гомеза. Он поджидает у входа в замок.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"Стражник Скип приторговывает оружием на заднем дворе. Но только для людей Гомеза.");
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
	description	= "Я подумал, мне стоит доложить о прибытии. ";
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
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Я подумал, мне стоит доложить о прибытии. 
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Хорошо. Я хочу быть в курсе всего происходящего.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //Состоялась Великая Церемония.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Ты хорошо поработал.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Равен наговорил мне всякой чуши! Я не стану мириться с таким отношением. Это не по мне. С этого момента буду делать то, что сам захочу.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Теперь им нужны яйца, которые откладывает королева ползунов, чтобы сварить эликсир и вступить в контакт со Спящим. Эти яйца у меня с собой.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Очень интересно. Вот только сработает ли. Отнеси яйца в храм.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Ты хорошо поработал.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Равен наговорил мне всякой чуши! Я не стану мириться с таким отношением. Это не по мне. С этого момента буду делать то, что сам захочу.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Я пока еще не знаю, что они собираются делать. 
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Тогда зачем ты меня отрываешь от дел?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


