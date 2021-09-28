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
	description		= "Czeœæ, jestem tu nowy. Jak leci?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Czeœæ, jestem tu nowy. Jak leci?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //ZejdŸ mi z oczu. Harowa³em pod ziemi¹ przez ostatnie dwa tygodnie. I za co?!
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Parê nêdznych bry³ek rudy - nic ponad to! Wiêkszoœæ z tego musia³em wydaæ na ¿ywnoœæ.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Rozmawia³em niedawno z Baal Parvezem. Opowiedzia³ mi wiele ciekawych rzeczy o Obozie Sekty.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Podobno jest tam o wiele lepiej. Przynajmniej nie trzeba harowaæ na tych darmozjadów Gomeza.
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
	description		= "Nie podoba ci siê tutaj? To dlaczego po prostu nie odejdziesz?";
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
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Nie podoba ci siê tutaj? To dlaczego po prostu nie odejdziesz?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Bo nie wiem, co mnie tam czeka. Mia³em tutaj kumpla - nazywa³ siê Melvin. Poszed³ do obozu na bagnie jakiœ tydzieñ temu.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Ale od tej pory nie mam od niego ¿adnych wieœci. Dopóki siê do mnie nie odezwie, wolê siê st¹d nie ruszaæ!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, Kopacz ze Starego Obozu, ma ju¿ doœæ pracy w kopalni. Zastanawia siê nad przejœciem do Bractwa Œni¹cego.");
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
	description		= "By³em w Obozie Sekty i rozmawia³em z Melvinem.";
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
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //By³em w Obozie Sekty i rozmawia³em z Melvinem.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //Naprawdê?! I co powiedzia³?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //NajwyraŸniej przedk³ada ¿ycie w Bractwie nad ci¹g³e zatargi ze Stra¿nikami.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //No nie! Ten stary cap wyleguje siê, podczas gdy ja muszê tu tyraæ jak wó³! Ju¿ ja mu poka¿ê... Ale nie uda mi siê opuœciæ tego obozu.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Dlaczego nie?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Stra¿nicy dowiedzieli siê, ¿e zamierzam st¹d odejœæ. Chyba za du¿o o tym gada³em.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Potrzebujê przynajmniej 100 bry³ek rudy, ¿eby ich przekupiæ.
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
	description		= "A gdybym tak da³ ci te 100 bry³ek?";
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
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //A gdybym tak da³ ci te 100 bry³ek?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //Zrobi³byœ to? Ale dlaczego?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Có¿, powiedzmy, ¿e nie tylko ty wolisz ¿ycie w Bractwie od Starego Obozu.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //To znaczy, ¿e chcesz pójœæ ze mn¹?
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
	description		= "To znaczy, ¿e odprowadzê ciê do obozu Bractwa.";
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
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //To znaczy, ¿e odprowadzê ciê do obozu Bractwa.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //To wspaniale! Jestem gotowy do drogi. Mo¿emy ruszaæ w ka¿dej chwili.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Ale nie zapominaj - potrzebujemy 100 bry³ek rudy dla Stra¿ników.

	B_LogEntry	(CH1_RecruitDusty,"Uda³o mi siê przekonaæ Kopacza imieniem Dusty do przejœcia do Bractwa. Najpierw bêdê jednak musia³ przekupiæ Stra¿ników przy bramie. Potem zabiorê go prosto do Baal Tondrala.");
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
	description		= "Jestem gotowy - mo¿emy ruszaæ.";
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
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Jestem gotowy - mo¿emy ruszaæ.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Dobra - wyjdŸmy po³udniow¹ bram¹. Przy pó³nocnym wyjœciu nic nie wskóramy. Tamtejsi Stra¿nicy s¹ nieprzekupni.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Wola³bym, ¿ebyœ to ty zaj¹³ siê ca³¹ t¹ spraw¹ z rud¹. Ja siê nie nadajê do takich rzeczy.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Dobrze - ruszajmy!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty radzi³ mi omin¹æ pó³nocn¹ bramê. Stra¿nicy na po³udniu s¹ ponoæ bardziej przekupni.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

