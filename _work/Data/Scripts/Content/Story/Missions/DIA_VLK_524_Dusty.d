// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "Привет! Я здесь новенький. Как идут дела?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Привет! Я здесь новенький. Как идут дела?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Проваливай! Я две недели горбатился в шахте - и чего ради?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Несколько жалких кусков руды - вот все, что я получил. Большую часть мне придется потратить на еду!
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Там, внизу, я разговаривал с Идолом Парвезом. Он рассказал мне много интересного про Лагерь Сектантов.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Наверное, нужно отправиться туда, вместо того чтобы пахать на Гомеза.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "Тебе здесь не нравится? Тогда почему ты не уходишь?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Тебе здесь не нравится? Тогда почему ты не уходишь?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Потому что я не знаю, что меня там ждет. У меня был здесь приятель - Мелвин. Он ушел в Лагерь Сектантов еще неделю назад.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //И с тех пор о нем ни слуху ни духу. Пока я не получу от него весточки, я с места не сдвинусь!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Рудокоп из Старого Лагеря по имени Дасти больше не хочет жить там. Он подумывает о присоединении к Лагерю Братства.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "Я был в Лагере Сектантов и видел там Мелвина.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Я был в Лагере Сектантов и видел там Мелвина.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //Да? И что он говорит?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Кажется, работать там ему нравится намного больше, чем получать тычки от стражников здесь.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //Эй, парень! Он что, думает, он один такой умный? Я тоже туда пойду. Но мне же не выбраться из Лагеря...
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Правда? Почему?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Похоже, я слишком много болтал. Стражники знают, что я хочу удрать отсюда.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Для того чтобы подкупить их, мне нужно как минимум 100 кусков руды.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "А что если я дам тебе эти 100 кусков?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //А что если я дам тебе эти 100 кусков?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //Правда? Но почему?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Ну, скажем, ты не единственный из тех, кто хочет побродить по Лагерю Сектантов.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //То есть ты хочешь пойти со мной, да?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "Я ПОЙДУ с тобой в Лагерь Сектантов.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //Я ПОЙДУ с тобой в Лагерь Сектантов.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //Ну это же здорово, дружище! Я готов. Мы можем отправиться, когда захочешь.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Но не забудь - нам нужно 100 кусков руды для стражников.

	B_LogEntry	(CH1_RecruitDusty,"Я сумел уговорить рудокопа Дасти присоединиться к Братству. Но мне придется отдать некоторое количество руды стражникам. Самого же Дасти лучше прямиком отвести к Идолу Тондралу.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "Я готов. Пошли!";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Я готов. Пошли!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Ладно, пойдем к южным воротам. Стражники возле северных совсем не берут взяток.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //И рудой, наверное, тоже стоит заниматься тебе - я в таких делах не мастак.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Ладно, идем.

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Дасти предостерег меня от прохода через северные ворота. Похоже, что подкупить стражников легче у ворот южных.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

