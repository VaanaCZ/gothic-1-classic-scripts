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
	description 	= "Как дела?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Как дела?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Я ушел с шахты, и теперь мне живется очень неплохо. Так что жаловаться не на что.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //Чем же ты зарабатываешь на жизнь?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Я помогаю людям решать их проблемы.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Если ты поссоришься с кем-то из влиятельных людей, я могу позаботиться о том, чтобы об этой ссоре быстро забыли.
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
	description 	= "Если у меня возникнут проблемы, я могу обратиться к тебе? Как?";
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
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Значит, если у меня возникнут проблемы, я могу обратиться к тебе? Как?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //Ну, например, ты не угодишь Торусу, придешь ко мне... Но, знаешь, будет лучше, если ты с ним вообще не будешь ссориться, хотя кто знает, что может случиться.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Торус иногда бывает очень упрямым. Он никогда не разговариваем с теми, кто его хоть раз подвел. А это плохо.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Он решает, что делать с новичками. Так вот, приходишь ко мне, а я говорю с теми людьми, к мнению которых Торус прислушивается.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Они замолвят ему за тебя словечко, и он больше на тебя не в обиде. Конечно, бесплатно никто из них ничего не сделает. Все это будешь оплачивать ты.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //А я позабочусь о том, чтобы твоя руда попала в нужные руки...

	B_LogEntry(GE_TraderOC,	"Рудокоп Граво предлагает особую услугу. Если у меня случится ссора с кем-то из важных людей из Старого лагеря, я смогу заплатить ему, и он уладит проблему.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Да, я уже слышал его мнение о тебе. Он тобой недоволен.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Ладно, я позабочусь о том, чтобы с ним кое-кто переговорил. 100 кусков руды, и я улажу эту проблему.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Посмотрим, сколько у тебя есть... А! Этого вполне хватит. Считай, что дело сделано.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //И постарайся не проговориться. Веди себя так, будто ничего не случилось.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //So viel hab' ich nicht.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts fьr dich tun - tut mir Leid, Junge.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //По-моему, ты не совсем точно выразился! Да он же хочет оторвать тебе голову.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Я должен буду поговорить с некоторыми людьми, которых он послушает. Но его будет нелегко успокоить. Я возьмусь за это дело за 500 кусков руды.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Посмотрим, сколько у тебя есть... Да ты богат! Я возьму 500 кусков и улажу для тебя эту проблему.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //И еще кое-что: он ни в коем случае не должен узнать, что этим занимался я. Никому об этом не рассказывай!
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //У меня не так много руды.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Что ж, тогда ничего не получится. Очень жаль, но я ничего не могу сделать.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Насколько я знаю, у тебя с ним нормальные отношения. Не стоит волноваться.
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
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Думаю, могу. Но это будет стоить тебе от 100 до 500 кусков руды.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Диего сердится на меня."			,DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "У меня вышла ссора с Торусом."			,DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Я поссорился с Гомезом."			,DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Диего сердится на меня.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //У меня вышла ссора с Торусом.
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
	description 	= "Ты можешь назвать мне самых влиятельных из Призраков?";
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
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Ты можешь назвать мне самых влиятельных из Призраков.
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Хочешь подружиться с нужными людьми, да?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Самый влиятельный из Призраков - Диего. Он доверяет Фингерсу, Уистлеру и Слаю.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Декстер и Фиск продают товары на рыночной площади. У них много покупателей среди стражников, поэтому они тоже могут повлиять на некоторых людей.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //Еще здесь есть Скатти. Он организует сражения на арене. В лагере многие должны ему руду, так что я и его причисляю к влиятельным людям.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Декстер и Фиск торгуют различными товарами на рыночной площади.");

	
};











