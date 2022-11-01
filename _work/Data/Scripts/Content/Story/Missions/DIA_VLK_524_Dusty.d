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
	description		= "Cześć, jestem tu nowy. Jak leci?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Cześć, jestem tu nowy. Jak leci?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Zejdź mi z oczu. Harowałem pod ziemią przez ostatnie dwa tygodnie. I za co?!
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Parę nędznych bryłek rudy - nic ponad to! Większość z tego musiałem wydać na żywność.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Rozmawiałem niedawno z Baal Parvezem. Opowiedział mi wiele ciekawych rzeczy o Obozie Sekty.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Podobno jest tam o wiele lepiej. Przynajmniej nie trzeba harować na tych darmozjadów Gomeza.
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
	description		= "Nie podoba ci się tutaj? To dlaczego po prostu nie odejdziesz?";
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
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Nie podoba ci się tutaj? To dlaczego po prostu nie odejdziesz?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Bo nie wiem, co mnie tam czeka. Miałem tutaj kumpla - nazywał się Melvin. Poszedł do obozu na bagnie jakiś tydzień temu.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Ale od tej pory nie mam od niego żadnych wieści. Dopóki się do mnie nie odezwie, wolę się stąd nie ruszać!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, Kopacz ze Starego Obozu, ma już dość pracy w kopalni. Zastanawia się nad przejściem do Bractwa Śniącego.");
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
	description		= "Byłem w Obozie Sekty i rozmawiałem z Melvinem.";
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
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Byłem w Obozie Sekty i rozmawiałem z Melvinem.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //Naprawdę?! I co powiedział?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Najwyraźniej przedkłada życie w Bractwie nad ciągłe zatargi ze Strażnikami.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //No nie! Ten stary cap wyleguje się, podczas gdy ja muszę tu tyrać jak wół! Już ja mu pokażę... Ale nie uda mi się opuścić tego obozu.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Dlaczego nie?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Strażnicy dowiedzieli się, że zamierzam stąd odejść. Chyba za dużo o tym gadałem.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Potrzebuję przynajmniej 100 bryłek rudy, żeby ich przekupić.
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
	description		= "A gdybym tak dał ci te 100 bryłek?";
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
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //A gdybym tak dał ci te 100 bryłek?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //Zrobiłbyś to? Ale dlaczego?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Cóż, powiedzmy, że nie tylko ty wolisz życie w Bractwie od Starego Obozu.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //To znaczy, że chcesz pójść ze mną?
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
	description		= "To znaczy, że odprowadzę cię do obozu Bractwa.";
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
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //To znaczy, że odprowadzę cię do obozu Bractwa.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //To wspaniale! Jestem gotowy do drogi. Możemy ruszać w każdej chwili.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Ale nie zapominaj - potrzebujemy 100 bryłek rudy dla Strażników.

	B_LogEntry	(CH1_RecruitDusty,"Udało mi się przekonać Kopacza imieniem Dusty do przejścia do Bractwa. Najpierw będę jednak musiał przekupić Strażników przy bramie. Potem zabiorę go prosto do Baal Tondrala.");
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
	description		= "Jestem gotowy - możemy ruszać.";
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
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Jestem gotowy - możemy ruszać.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Dobra - wyjdźmy południową bramą. Przy północnym wyjściu nic nie wskóramy. Tamtejsi Strażnicy są nieprzekupni.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Wolałbym, żebyś to ty zajął się całą tą sprawą z rudą. Ja się nie nadaję do takich rzeczy.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Dobrze - ruszajmy!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty radził mi ominąć północną bramę. Strażnicy na południu są ponoć bardziej przekupni.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

