// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Pojďme!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Kéž tě Spáč ochrání!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Oslovil jsi Guru! Už to nikdy nedělej! Je to svatokrádež! Když bude s tebou chtít mistr mluvit, ON osloví TEBE.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Kdo jsi?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Kdo jsi?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Jsem Lester. Starám se o cizince, kteří sem přijdou.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Máš štěstí, že jsi nemluvil s Baalem Namibem. Žádný cizinec nesmí mluvit s Guru.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Já ale chci mluvit s tvým mistrem.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Já ale chci mluvit s tvým mistrem.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Zapomeň na to! Můžu ti pomoci s jakýmkoliv tvým problémem!
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Řekni mi něco o táboře.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Řekni mi něco o táboru.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Co chceš vědět?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Řekni mi o společenství.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mi můžeš říci o Spáčovi?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Co víš o droze z bažin?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Řekni mi o společenství.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Guru tvoří nejvyšší společenství. Jsou duchem tábora a jeho velkou silou. Templáři používají svoji duchovní sílu v boji.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Mají nezkrotnou divokou sílu. NIKDY by ses s nimi neměl dostat do problému. Já osobně patřím k novicům. Modlíme se ke Spáčovi a pracujeme v táboře.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Někteří novici se smějí přidat ke Guru, ale aby jim to bylo povoleno, musejí dlouhá léta studovat.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Co mi můžeš říci o Spáčovi?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Spáč je duchovní bytost. Vytváří vize - aspoň pro Guru.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Modlíme se k němu, aby nám dal svobodu.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //A věříte tomu?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hej, jsem v Bariéře už dva roky. Dokážeš si představit, jak dlouhé můžou DVA ROKY být?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Nedokážeš si představit, v co jsem ochotný věřit a co udělat, jen abych se odtud dostal pryč!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Co víš o droze z bažin?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //No, tahle droga roste v bažinách. Před tím, než se může kouřit, se samozřejmě musí zpracovat. To dělají novici.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Droga má uklidňující a osvěžující účinek. Pomáhá při koncentraci a umocňuje vědomí.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Vyměňujeme ji za zboží ze Starého tábora a také ji používáme pro získávání nových lidí.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Někteří lidé se však k nám přidávají jen kvůli té droze. Ale tak nám aspoň pomáhají s prací v táboře.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "Chci se stát členem Bratrstva!";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Chci se stát členem Bratrstva!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom rozhodne, jestli jsi hoden vstoupit do Bratrstva.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Spoléhá se ale na radu Guru. Baal Namib, támhle ten, je jedním z nich.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Nejprve musíš dokázat, že jsi toho hoden a pak tě jeden z Guru pošle za Corem Kalomem.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "Jak to asi proběhne, pokud se za mě ani jeden z Guru nepřimluví?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Jak to asi proběhne, pokud se za mě ani jeden z Guru nepřimluví?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //To nevím, ale Guru sledují všechno, co tady v táboře děláš.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Pokud si myslí, že si zasloužíš stát se členem komunity, pak se za tebe přimluví.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //V táboře máš spoustu možností, jak dokázat, že jsi toho hoden.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Pokud se budu chtít přidat k Bratrstvu v táboře v bažinách, budu muset udělat dojem na guru. Ti však bohužel nemluví s novými příchozími. Novic Lester mi řekl, že mě přesto pozorují, a že budu potřebovat nějak ukázat, jak bych jim mohl být užitečný. Nemám nejmenší představu o tom, jak to udělat! Raději bych se měl dobře porozhlédnout po Táboře v bažinách.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "Co musím udělat, aby se za mě tvůj mistr přimluvil?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Co musím udělat, aby se za mě tvůj mistr přimluvil?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Musíš vědět, co chce slyšet.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //A to je?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Poslouchej: až u něho příště budeme, oslovíš mě a povedeme spolu krátký hovor.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib má obavy z toho, že se mnozí novici nemodlí jen ke Spáčovi, ale také ke svým dřívějším bohům.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Ty mi řekneš, že jsi se starých bohů zřekl a že se už nadále budeš modlit výhradně ke Spáčovi.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Pak se tě zeptám, proč jsi se takhle rozhodl a ty řekneš, že jsi měl vizi, ve které tě k tomu Spáč vyzval.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Pak projeví zájem. Myslíš, že to zvládneš?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Bez problémů.
	
	B_LogEntry	(CH1_JoinPsi,"Abych udělal dojem na Baala Namiba, měl bych v blízkosti tohoto guru oslovit Lestera a vyprávět mu o starých bozích a Spáčovi.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //AAH! RÁD TĚ ZASE VIDÍM. JAK SE TI VEDE?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "Zřekl jsem se starých bohů.";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //ZŘEKL JSEM SE STARÝCH BOHŮ.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //OPRAVDU? CO TĚ K TOMU PŘIMĚLO?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //MĚL JSEM VIZI: PROMLUVIL KE MNĚ SPÁČ.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //CO TI ŘÍKAL?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //ŘEKL: JDI DO TÁBORA V BAŽINÁCH A PŘIDEJ SE K BRATRSTVU.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //JSI VELMI ŠŤASTNÝ MUŽ, CIZINČE: SPÁČ TAKTO NEPROMLOUVÁ K MNOHA LIDEM.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "Jak se mám tady v táboře vyznat?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Jak se mám tady v táboře vyznat?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Můžu ti ukázat nejdůležitější místa.
};

// **************************************************
//				FÜHRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "Už tam budeme?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //Už tam budeme?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Když se mě přestaneš ptát, budeme moci jít rychleji.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ÄNDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "Rozmyslel jsem se.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Rozmyslel jsem se.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Doufám, že víš, kde mě najdeš.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------FÜHRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ukaž mi cestu..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Ukaž mi cestu...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zpátky k hlavní bráně",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do kovářství",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do chrámu",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"k učitelům",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do alchymistické dílny",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...do kovářského krámu.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Pojď za mnou!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...do chrámu.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Pojď za mnou!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...k učitelům.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Pojď za mnou!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...do alchymistické dílny.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Pojď za mnou!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Dole najdeš Baala Cadara. Vyučuje novice.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Když vylezeš po tomhle žebříku, dostaneš se na templářské cvičiště. Budu tady na tebe čekat. Kdyby ses zpozdil, budu zase u Baala Namiba u vchodu do tábora.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Tohle je chrám! Počkám na tebe, ale když ti to bude moc dlouho trvat, půjdu zpátky k Baalu Namibovi.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Tohle je kovárna. Rozhlédni se tu. Počkám na tebe asi hodinu, pak půjdu pryč.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauthändler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Když vylezeš po tomhle žebříku, dostaneš se k alchymistovi Corovi Kalomovi. Dole je Fortuno, obchodník s drogou.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Počkám tu na tebe. Nebuď tam ale moc dlouho, jinak se vrátím zpátky.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral für alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Jsem rád, že jsi tady. Mám pro tebe noviny.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Doufám, že dobré.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Naše Bratrstvo plánuje nesmírně velkou věc.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Co plánuje? Prolomení?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Guru se pokoušejí spojit se se Spáčem. Potřebují ale nějak sjednotit své síly.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //No a?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Potřebují magický předmět, ohnisko.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "A co já s tím mám dělat?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //A co já s tím mám dělat?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Promluv s Y´Berionem. Je tady nejmocnější muž. Je to možnost, jak u něj dosáhnout obliby.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Kde ho najdu?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Jdi do chrámu. Zřídkakdy ho opouští. Zřejmě se v těch chladných zdech cítí být blíž Spáčovi.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Novic Lester mi řekl, že se Y´Berion shání po kouzelném ohniskovém kameni. Guru je v chrámové hoře.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hej, co tady děláš?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Přišel jsem na rozkaz mágů Vody. Hledám kouzelné artefakty, takzvané ohniskové kameny.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Hledáš ohniskové kameny? Jsi opravdu smělý.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas a ostatní mágové z Nového tábora je chtějí použít k rozboření Bariéry, aby nás osvobodili z našeho uvěznění.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Tomu uvěřím, jedině až to uvidím na vlastní oči.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Taky to tak cítím. Ale řekni mi, proč jsi sem přišel?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Zvažuju, jestli má cenu se vydat na návštěvu horské pevnosti.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Víš... existuje jeden dokument, který bych rád získal. Na druhou stranu je to nebezpečné, tam chodit.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak se ti podařilo přejít přes ty hory?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Jak se ti podařilo přejít přes ty hory?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Hodně jsem se toho naučil od Guru. Jejich kouzla můžou být opravdu užitečná.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ten dokument, co ho chceš... co je to zač?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Ten dokument, co ho chceš... co je to zač?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Před mnoha lety žil v té horské pevnosti pán této oblasti. Měl pod kontrolou zem i doly.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Tak jako ostatní šlechtici i on samozřejmě měl dokument, který potvrzoval jeho lenní majetek. A právě to je ten dokument.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Ale od té doby, co jsme tu drženi Bariérou, už není k ničemu užitečný.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //To je pravda. Pokud se ale mágům Vody podaří zničit Bariéru, dokument znovu nabude značné hodnoty.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mohli bychom se podívat na tu pevnost společně."; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Mohli bysme se podívat na tu pevnost společně.
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //To je dobrý nápad. Jdi první, zůstanu blízko tebe.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"Před mohutnou pevností, která byla vybudována v horách, jsem se setkal s novicem Lesterem z Tábora v bažinách. Rozhlížel se v budově po nějaké listině a přidal se ke mně při hledání ohniska.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Podívej, tohle vypadá jako to ohnisko, co hledáš.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Ano, vypadá to jako ohnisková rovina, hmm... Není snadné se k tomu dostat...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"Ohnisko, které hledám, stojí na podstavci. Je však příliš vysoko, než abych pro něj mohl vylézt. Musím najít nějaký způsob, jak tento artefakt získat.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ÜBER DIE BRÜCKE OHNE DEN AUFTRAG ERFÜLLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Kam jdeš? Ještě jsme tady neskončili!
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jsem raněný. Můžeš mi pomoci?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Jsem raněný. Můžeš mi pomoci?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Vezmi si tenhle hojivý lektvar.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE FÜR LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Našel jsem ten dokument."; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Našel jsem ten dokument.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Hej, dobrá práce. Vezmi si za odměnu tyto kouzelné svitky. S nimi se dostaneš k tomu ohnisku.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Počkám na tebe dole u té ohniskové roviny.

	B_LogEntry		(CH3_Fortress,"Listina, po které se sháněl Lester, byla v jedné truhlici. Výměnou mi dal čtyři kouzelné svitky telekineze, pomocí kterých dostanu to ohnisko.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak se dostanu k tomu ohnisku?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Jak se dostanu k tomu ohnisku?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Mistr Y´Berion obvykle říká: žák zkouší věcmi pohybovat pomocí rukou a nohou, mistr jimi pohybuje duchovní silou.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Zůstanu tady, abych našel ten dokument.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Půjdu a porozhlédnu se tady.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Ještě nemáme oba to, co jsme chtěli. Já zůstanu tady, abych si přečetl ty staré knihy.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Dobře, ještě se sejdeme.

	B_LogEntry		(CH3_Fortress,"Získal jsem ohnisko. Lester se chce ještě porozhlédnout po knihovně v pevnosti. Doufám, že se s ním ještě uvidím.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Našel jsi něco?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Našel jsi něco?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Ta truhla je zamčená. Možná k ní najdeme klíč někde v pevnosti.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Už jsi našel ten dokument?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Ještě ne.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Hledal jsi v knihovně?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Prozkoumáme pevnost společně."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Prozkoumáme pevnost společně.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Dobře, jdi první!
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Björn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Potkal jsem přes Starým táborem Diega a Miltena!";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Jak se máš?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hej, co tady děláš?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Starý důl se zhroutil potom, co ho zatopila voda!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//No a?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Všichni mágové Ohně jsou mrtví!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez je povraždil.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//To nebude snadné napravit!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Potkal jsem přes Starým táborem Diega a Miltena!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Chtěli se s tebou setkat. Na obvyklém místě.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Už bylo na čase!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//Co se děje?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Zůstanu tady, abych si přečetl ty staré knihy.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Uch... Nerozumím...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Mistr Y´Berion obvykle říká: žák zkouší věcmi pohybovat pomocí rukou a nohou, mistr jimi pohybuje duchovní silou.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Dobře, dobře. Dám si pozor.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Opatruj se.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Děkuju. Půjdu si svou cestou.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Kéž tě Spáč ochrání!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Řekl jsem Lesterovi a Gornovi o setkání s jejich přáteli. Teď už to není moje věc. Dál si poradí sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
