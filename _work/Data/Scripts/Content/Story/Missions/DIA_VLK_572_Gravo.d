// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "Как идут дела?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Как идут дела?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //С тех пор как я перестал гнуть спину на шахте, пожаловаться не на что.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //На что же ты живешь?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Я помогаю людям решать их проблемы.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Если ты перейдешь дорогу кому-нибудь из больших шишек здесь, в Лагере, я постараюсь уладить это.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "То есть, если возникнут проблемы, ты сможешь помочь? Но как?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //То есть, если возникнут проблемы, ты сможешь помочь? Но как?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //Ну, допустим, ты поссорился с Торусом. Вообще-то, ссориться с ним совсем не стоит, но не будем зарекаться.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Торус у нас довольно упрямый: если ты хоть один раз подвел его, он ставит на тебе крест. А это плохо.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Ты новичок, ты от него зависишь. И вот ты приходишь ко мне и просишь помочь. А я знаю многих людей, к чьему мнению Торус прислушивается.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Они замолвят за тебя словечко, и вот вы с Торусом снова друзья. Разумеется, делать они это будут не бесплатно, так что тебе придется раскошелиться.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //Ну а я забочусь о том, чтобы твоя руда попала в нужные руки...

	B_LogEntry(GE_TraderOC,"Рудокоп Граво предлагает специальные услуги. Если я попаду в неприятности в Лагере, то я могу заплатить ему за их решение.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Да, ты у него на плохом счету.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Есть у меня пара человек... В общем, за 100 кусков руды можно решить эту проблему.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Посмотрим, что у тебя есть... Ага! Этого должно хватить. Можешь считать, что вопрос решен.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //И никому не говори об этом! Веди себя так, будто ничего не случилось.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //I don't have that much.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Then I can't do anything for you - I'm sorry, boy.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //И ты называешь это 'проблемой'?! Слабо сказано, приятель! За это он порубит тебя на куски.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Убедить людей встать на твою защиту в таком деле - это будет нелегко. И недешево. Готовь как минимум пять сотен.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Посмотрим, что у тебя есть... Парень, да ты богат! Я забираю 500 кусков и улаживаю твою проблему.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //И запомни: никто не должен об этом знать. 
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //У меня столько нет...
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Мне очень жаль, парень, но тогда я ничего не смогу для тебя сделать.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Насколько мне известно, у вас и так все в порядке. Не волнуйся попусту, парень.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "Кажется, у меня возникла проблема. Ты можешь мне помочь?";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Кажется, у меня возникла проблема. Ты можешь мне помочь?
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Думаю, что да. Но моя помощь стоит недешево - от 100 до 500 кусков руды.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Я поссорился с Диего.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Я поссорился с Торусом.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Я поссорился с Гомезом.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Я поссорился с Диего.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Я поссорился с Торусом.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Я поссорился с Гомезом.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 1;
	description 	= "Ты можешь сказать мне, кто из Призраков здесь самый главный?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Ты можешь сказать мне, кто из Призраков здесь самый главный?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Хочешь произвести впечатление на нужных людей, а?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Главный среди Призраков - Диего. Он доверяет Фингерсу, Уистлеру и Слаю.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Декстер и Фиск продают свой товар на рыночной площади. Среди их покупателей попадаются даже стражники, так что их тоже можно назвать влиятельными людьми.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //Еще есть Скатти. Он присматривает за ареной и назначает бои. Здесь многие должны ему, так что он тоже важная персона.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Декстер и Фиск торгуют различными товарами на рыночной площади.");

	
};











