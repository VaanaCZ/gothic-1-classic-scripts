// ************************************************************
// 							EXIT 
// ************************************************************
INSTANCE Info_BaalLukor_EXIT(C_INFO)
{
	npc				= GUR_1211_BaalLukor;
	nr				= 999;
	condition		= Info_BaalLukor_EXIT_Condition;
	information		= Info_BaalLukor_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BaalLukor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
INSTANCE Info_BaalLukor_MEET (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_MEET_Condition;
	information	= Info_BaalLukor_MEET_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_MEET_Info()
{
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Благодарю за помощь. Еще немного, и ты бы опоздал.
	
	B_GiveXP		(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
INSTANCE Info_BaalLukor_DEAD (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DEAD_Condition;
	information	= Info_BaalLukor_DEAD_Info;
	nr			= 20;
	permanent	= 0;
	important 	= 0;
	description = "Я видел убитых Стражей, когда шел сюда. Что здесь произошло?";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Я видел убитых Стражей, когда шел сюда. Что здесь произошло?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Учитель Кор Ангар прислал нас сюда, чтобы исследовать пещеры.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Мы думали, что не найдем здесь ничего, кроме мумий и забытых гробниц. 
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Но тьма вокруг нас внезапно наполнилась движением, и нас окружили орки! Я не знаю, что им нужно было в этой пещере, но мы совершенно не ожидали их там увидеть!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //А где Стражи, которые пошли с тобой?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); // Мертвы! Я стал причиной их смерти, когда повел их в эту ловушку. Да простит меня за это Спящий.

	B_LogEntry		(CH3_OrcGraveyard,	"Я спас Гуру Идола Люкора от орков на кладбище. Все Стражи, которые пошли вместе с ним, были убиты ими.");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
INSTANCE Info_BaalLukor_SUMMONING (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SUMMONING_Condition;
	information	= Info_BaalLukor_SUMMONING_Info;
	nr			= 10;
	permanent	= 0;
	important 	= 0;
	description = "Я от Кор Ангара! Вы нашли то, что поможет отыскать Спящего?";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Меня прислал Кор Ангар! Вы уже нашли что-нибудь, что помогло бы отыскать Спящего?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Нет, пока ничего не нашли. Но что с Юберионом? Он уже очнулся?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Нет, он так и не пришел в себя.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Мы должны узнать тайны этой пещеры. Мы слишком дорого заплатили за то, чтобы пробраться сюда. Наши жертвы будут напрасны, если мы уйдем отсюда с пустыми руками.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Но я не слишком хорошо обращаюсь с оружием, а мои заклинания действуют на орков не так сильно, как на людей Старого лагеря.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Если ты служишь Спящему, то, может быть, ты сможешь помочь мне закончить поиски в этой пещере.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
INSTANCE Info_BaalLukor_HELP (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HELP_Condition;
	information	= Info_BaalLukor_HELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Хорошо, я помогу тебе!";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Хорошо, я помогу тебе!
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Ты обрадовал меня. Здесь есть три туннеля. Нам нужно их осмотреть.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Ты иди вперед, а я пойду следом!

	B_LogEntry		(CH3_OrcGraveyard,	"Идол Люкор решил пойти со мной, чтобы разгадать загадку этого древнего культового сооружения.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDNONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDNONE_Condition;
	information	= Info_BaalLukor_FOUNDNONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Я ничего не могу найти!";
};

FUNC INT Info_BaalLukor_FOUNDNONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 0)
	&&		!Npc_HasItems(hero, OrkParchmentOne)
	&&		!Npc_HasItems(hero, OrkParchmentTwo)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //Я ничего не могу найти!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Наверное, ты осмотрел не все туннели.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bjцrn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDONE_Condition;
	information	= Info_BaalLukor_FOUNDONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "По-моему, мы не сможем найти вторую половину. Ее здесь нет!";
};

FUNC INT Info_BaalLukor_FOUNDONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(((BaalLukor_BringParchment==1) && !Npc_HasItems(hero, OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero, OrkParchmentOne)))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //По-моему, мы не сможем найти вторую половину. Ее здесь нет!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Нет, она должна быть. Смотри внимательнее. Она находится где-то здесь.
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bjцrn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTWAIT_Condition;
	information	= Info_BaalLukor_FIRSTWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_040")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Дальше мы не сможем пройти! Может быть, эти ниши помогут нам.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTSCROLL_Condition;
	information	= Info_BaalLukor_FIRSTSCROLL_Info;
	permanent	= 0;
	important 	= 0;
	description = "Я нашел обрывок свитка!";
};

FUNC INT Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentOne)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Я нашел обрывок свитка!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 ьbergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Отлично! Это и есть половина свитка с заклинанием орков.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Это свиток с заклинанием орков. Кто-то разорвал его на две части.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //У нас есть только одна из них. Нужно найти вторую.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 1;
	};
	
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDWAIT_Condition;
	information	= Info_BaalLukor_SECONDWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_SECONDWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_047")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Хм... там дальше тупик! Может быть, мы сможем найти что-то, что поможет нам в дальнейших поисках.

	if (!Npc_HasItems	(hero, OrkParchmentTwo)	) 
	{	
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine	(self, "WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDSCROLL_Condition;
	information	= Info_BaalLukor_SECONDSCROLL_Info;
	permanent	= 0;
	description = "Вот обрывок свитка!";
};

FUNC INT Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentTwo)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self,	hero);

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Вот обрывок свитка!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 ьbergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Отлично! Это и есть вторая половина свитка с заклинанием орков.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Это свиток с заклинанием орков. Кто-то разорвал его на две части.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //У нас есть только одна из них. Нужно найти вторую.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
INSTANCE Info_BaalLukor_BOTHSCROLLS (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_BOTHSCROLLS_Condition;
	information	= Info_BaalLukor_BOTHSCROLLS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Что же нам теперь делать с этим разорванным свитком?";
};

FUNC INT Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 3)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Что же нам теперь делать с этим разорванным свитком?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Если соединить эти части, мы получим целый свиток. Но я не смогу его расшифровать.

	B_LogEntry		(CH3_OrcGraveyard,	"Мы нашли две половины орочьего заклинания. Но Идол Люкор не может их перевести. Пока не может.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bjцrn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
INSTANCE Info_BaalLukor_RUNES (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_RUNES_Condition;
	information	= Info_BaalLukor_RUNES_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_RUNES_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_BOTHSCROLLS)
	&&		((Npc_GetDistToWP	(hero, "GRYD_025")<600)	|| (Npc_GetDistToWP(hero, "GRYD_048")<600))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_RUNES_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Подожди! Кажется, в этом что-то есть...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Мне это место совсем не кажется интересным.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Тише! Лучше присмотрись к этим рунам на стенах пещеры.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //С их помощью я смогу перевести свиток.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //Так я и думал! Это же свиток телепортации. Но, по-моему, его можно прочитать только в определенном месте.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Как странно!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-Ьbergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,	"С помощью настенных надписей в большой зале Идол Люкор смог прочитать свиток. Это оказался свиток телепортации, переносящий кого-либо на очень короткие дистанции."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Bjцrn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
INSTANCE Info_BaalLukor_WHATNOW (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_WHATNOW_Condition;
	information	= Info_BaalLukor_WHATNOW_Info;
	permanent	= 1;
	important 	= 0;
	description = "В каком это 'определенном месте'?";
};

FUNC INT Info_BaalLukor_WHATNOW_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_RUNES)
	&&		Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITHOUT)
	&&		!Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITH)		)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_WHATNOW_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //В каком это 'определенном месте'?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //Мне показалось, что... тот большой зал, в котором мы уже были... что-то с ним не так. Вернемся туда!

	Npc_ExchangeRoutine	(self, "Follow"); //Bjцrn: Patch2

};


//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITHOUT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITHOUT_Condition;
	information	= Info_BaalLukor_HALLWITHOUT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITHOUT_Condition()
{
	if (	!Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		(Npc_GetDistToWP(hero, "GRYD_055")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop		(hero);
	AI_SetWalkmode	(self,	NPC_WALK);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //В этом месте... Я не могу этого объяснить, но что-то в этом месте...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //О, забудь об этом. Наверное, на меня подействовала мрачная атмосфера этой пещеры.

	B_LogEntry	(CH3_OrcGraveyard,	"Когда мы вошли в большую прямоугольную залу, Гуру что-то почувствовал. Но он не мог сказать, что именно.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bjцrn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITH (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITH_Condition;
	information	= Info_BaalLukor_HALLWITH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITH_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		Npc_GetDistToWP	(hero, "GRYD_055")<500			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //В этом месте особая аура... аура чего-то необъяснимого.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Это место... Оно же из нашего видения! Мы видели его во время Церемонии.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //Видения... Мы очень близки к нашей цели...

	B_LogEntry		(CH3_OrcGraveyard,	"Некое необъяснимое чувство привело Идола Люкора к одной из стен залы с колоннами.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
INSTANCE Info_BaalLukor_DOOR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DOOR_Condition;
	information	= Info_BaalLukor_DOOR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_DOOR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HALLWITH)
	&&		Npc_GetDistToWP	(hero, "GRYD_060")<500				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_DOOR_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //За этой стеной... должно быть, это здесь!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Мне не хватит силы прочитать заклинание.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Прочти его сам. Встань перед этой стеной.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport ьbergeben
	
	AI_StopProcessInfos	(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
INSTANCE Info_BaalLukor_TELEPORT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_TELEPORT_Condition;
	information	= Info_BaalLukor_TELEPORT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_TELEPORT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_DOOR)
	&&		Npc_CanSeeNpcFreeLOS(self,	hero)	
	&&		Npc_GetDistToWP	(hero, "GRYD_072")<550				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Это место было сокрыто. Ты нашел его. Моя интуиция меня не подвела.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //И что, здесь действительно можно найти то, что поможет призвать Спящего?
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //Это место больше похоже на какую-то гробницу.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Пойдем дальше.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Ты иди вперед, а я пойду следом!

	B_LogEntry		(CH3_OrcGraveyard,	"С помощью оркского свитка телепортации я попал в тайную пещеру, выходящую из большой залы с колоннами.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
INSTANCE Info_BaalLukor_ALTAR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_ALTAR_Condition;
	information	= Info_BaalLukor_ALTAR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_ALTAR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_TELEPORT)
	&&		Npc_GetDistToWP	(hero, "GRYD_082")<400
	&&		Npc_CanSeeNpcFreeLOS(self,hero)						)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_ALTAR_Info()
{
	B_FullStop			(hero);
	AI_GotoWP			(hero, "GRYD_081");
	AI_AlignToWP		(hero);

	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //Нет! Этого не может быть! Здесь же только какие-то кости... кругом столько пыли.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //Нет!  
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //Господин мой, я взываю к тебе!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //Пробудись, яви свою силу! Нет!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //Нет!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //Ну, вот. Теперь он окончательно сошел с ума!

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //Это ты во всем виноват. Ты осквернил это место. Ты вызвал гнев Спящего, нашего господина!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Теперь я должен расплатиться за это святотатство!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Я принесу жертву нашему богу. Человеческую жертву!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Тогда он просветит меня. Я буду одним из его пророков.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //Умри, неверный!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); // 

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,	"Идол Люкор потерял разум, когда стало ясно, что мы совершенно ничего не нашли. Он напал на меня. Кор Ангару не понравится та новость, которую я сообщу.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





