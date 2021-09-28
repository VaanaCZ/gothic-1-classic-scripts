// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Эй, ты!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Что тебе?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Просто хочу предупредить тебя. Дальше начинаются наши охотничьи угодья.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "А на кого вы охотитесь?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //А на кого вы охотитесь?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //В основном, на падальщиков. Много мяса - и не так уж сложно с ними справиться. Если, конечно, знаешь - как.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //В самом деле? И как же?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Спроси у моего приятеля Дракса - он знает об этом больше, чем кто бы то ни было.
};

// **************************************************
//					Warum gefдhrlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Почему это место настолько опасно?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Почему это место настолько опасно?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Ты новенький, да? Каждое место в колонии опасно... так или иначе.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Безопасны лишь дороги между Лагерями - да и здесь можно набрести на волков, которые посчитают тебя легкой добычей.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //И ты действительно ею станешь, если не подберешь себе нормальное оружие и доспехи.
};

// **************************************************
//					Wo Ausrьstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Где можно найти хорошее оружие?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Где можно найти хорошее оружие?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Ближайшее место - Старый Лагерь. Просто иди по тропинке - она приведет тебя туда.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Но в нашем Новом Лагере можно достать вещи дешевле - если, конечно, знаешь нужных людей.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Если окажешься в Старом Лагере, разыщи Мордрага. Он один из нас. Немного руды, и он продаст тебе все, что нужно.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Вор Мордраг в Старом Лагере продает различные товары по приемлемым ценам.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Расскажи мне что-нибудь о колонии.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Расскажи мне что-нибудь о колонии.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Для того чтобы добраться от одного Лагеря до другого нужна карта - сэкономишь время и не будешь без толку плутать по дорогам.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Тупик может оказаться опасным ущельем, где обитают твари, которых лучше обходить стороной.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Не приближайся к старым развалинам. Их здесь много вокруг. Большинство из них - обломки укреплений времен первой войны с орками. Попадаются и брошенные оркские норы.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Среди развалин можно встретить орков - а иногда кое-кого и похуже. Я стараюсь не ходить туда, особенно ночью.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //И еще один совет: не стоит заходить в лес!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Где я могу раздобыть карту?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Где я могу раздобыть карту?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Расспроси людей в Старом Лагере. Где-то там должен жить картограф.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Может, тебе даже удастся стянуть у него одну из карт. Если получится, прихвати одну для меня, ладно?
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Я бы взял столько, сколько смог унести.",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Зачем? Эти карты - разве он не продает их?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Если предоставится возможность взять их, не заплатив, то я наберу столько, сколько смогу унести.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //А ты ничего. Тебе стоит подумать о том, чтобы присоединиться к Новому Лагерю. Если вдруг окажешься там, найди Ларса. Уверен, он подыщет тебе работу.
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Зачем? Эти карты - разве он не продает их? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Ну, если у тебя есть чем заплатить...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Я благодарю тебя за помощь.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Благодарю за помощь.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Не думай, что все будут такими же дружелюбными, парень.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Карманы у новичков обычно пусты, но кое-кто мог бы убить тебя даже ради простой кирки.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Я буду иметь это в виду.
};











