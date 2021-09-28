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
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Pojïme!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Kéž tì Spáè ochrání!
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
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Oslovil jsi Guru! Už to nikdy nedìlej! Je to svatokrádež! Když bude s tebou chtít mistr mluvit, ON osloví TEBE.
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
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Jsem Lester. Starám se o cizince, kteøí sem pøijdou.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Máš štìstí, že jsi nemluvil s Baalem Namibem. Žádný cizinec nesmí mluvit s Guru.
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
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Zapomeò na to! Mùžu ti pomoci s jakýmkoliv tvým problémem!
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
	description	= "Øekni mi nìco o táboøe.";
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
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Øekni mi nìco o táboru.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Co chceš vìdìt?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Øekni mi o spoleèenství.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mi mùžeš øíci o Spáèovi?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Co víš o droze z bažin?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Øekni mi o spoleèenství.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Guru tvoøí nejvyšší spoleèenství. Jsou duchem tábora a jeho velkou silou. Templáøi používají svoji duchovní sílu v boji.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Mají nezkrotnou divokou sílu. NIKDY by ses s nimi nemìl dostat do problému. Já osobnì patøím k novicùm. Modlíme se ke Spáèovi a pracujeme v táboøe.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Nìkteøí novici se smìjí pøidat ke Guru, ale aby jim to bylo povoleno, musejí dlouhá léta studovat.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Co mi mùžeš øíci o Spáèovi?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Spáè je duchovní bytost. Vytváøí vize - aspoò pro Guru.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Modlíme se k nìmu, aby nám dal svobodu.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //A vìøíte tomu?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hej, jsem v Bariéøe už dva roky. Dokážeš si pøedstavit, jak dlouhé mùžou DVA ROKY být?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Nedokážeš si pøedstavit, v co jsem ochotný vìøit a co udìlat, jen abych se odtud dostal pryè!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Co víš o droze z bažin?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //No, tahle droga roste v bažinách. Pøed tím, než se mùže kouøit, se samozøejmì musí zpracovat. To dìlají novici.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Droga má uklidòující a osvìžující úèinek. Pomáhá pøi koncentraci a umocòuje vìdomí.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Vymìòujeme ji za zboží ze Starého tábora a také ji používáme pro získávání nových lidí.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Nìkteøí lidé se však k nám pøidávají jen kvùli té droze. Ale tak nám aspoò pomáhají s prací v táboøe.
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
	description	= "Chci se stát èlenem Bratrstva!";
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
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Chci se stát èlenem Bratrstva!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom rozhodne, jestli jsi hoden vstoupit do Bratrstva.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Spoléhá se ale na radu Guru. Baal Namib, támhle ten, je jedním z nich.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Nejprve musíš dokázat, že jsi toho hoden a pak tì jeden z Guru pošle za Corem Kalomem.
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
	description	= "Jak to asi probìhne, pokud se za mì ani jeden z Guru nepøimluví?";
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
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Jak to asi probìhne, pokud se za mì ani jeden z Guru nepøimluví?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //To nevím, ale Guru sledují všechno, co tady v táboøe dìláš.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Pokud si myslí, že si zasloužíš stát se èlenem komunity, pak se za tebe pøimluví.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //V táboøe máš spoustu možností, jak dokázat, že jsi toho hoden.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Pokud se budu chtít pøidat k Bratrstvu v táboøe v bažinách, budu muset udìlat dojem na guru. Ti však bohužel nemluví s novými pøíchozími. Novic Lester mi øekl, že mì pøesto pozorují, a že budu potøebovat nìjak ukázat, jak bych jim mohl být užiteèný. Nemám nejmenší pøedstavu o tom, jak to udìlat! Radìji bych se mìl dobøe porozhlédnout po Táboøe v bažinách.");

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
	description	= "Co musím udìlat, aby se za mì tvùj mistr pøimluvil?";
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
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Co musím udìlat, aby se za mì tvùj mistr pøimluvil?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Musíš vìdìt, co chce slyšet.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //A to je?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Poslouchej: až u nìho pøíštì budeme, oslovíš mì a povedeme spolu krátký hovor.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib má obavy z toho, že se mnozí novici nemodlí jen ke Spáèovi, ale také ke svým døívìjším bohùm.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Ty mi øekneš, že jsi se starých bohù zøekl a že se už nadále budeš modlit výhradnì ke Spáèovi.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Pak se tì zeptám, proè jsi se takhle rozhodl a ty øekneš, že jsi mìl vizi, ve které tì k tomu Spáè vyzval.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Pak projeví zájem. Myslíš, že to zvládneš?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Bez problémù.
	
	B_LogEntry	(CH1_JoinPsi,"Abych udìlal dojem na Baala Namiba, mìl bych v blízkosti tohoto guru oslovit Lestera a vyprávìt mu o starých bozích a Spáèovi.");

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
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //AAH! RÁD TÌ ZASE VIDÍM. JAK SE TI VEDE?
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
	description	= "Zøekl jsem se starých bohù.";
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
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //ZØEKL JSEM SE STARÝCH BOHÙ.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //OPRAVDU? CO TÌ K TOMU PØIMÌLO?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //MÌL JSEM VIZI: PROMLUVIL KE MNÌ SPÁÈ.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //CO TI ØÍKAL?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //ØEKL: JDI DO TÁBORA V BAŽINÁCH A PØIDEJ SE K BRATRSTVU.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //JSI VELMI ŠASTNÝ MUŽ, CIZINÈE: SPÁÈ TAKTO NEPROMLOUVÁ K MNOHA LIDEM.

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
	description	= "Jak se mám tady v táboøe vyznat?";
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
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Jak se mám tady v táboøe vyznat?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Mùžu ti ukázat nejdùležitìjší místa.
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
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Když se mì pøestaneš ptát, budeme moci jít rychleji.
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
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Doufám, že víš, kde mì najdeš.
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
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zpátky k hlavní bránì",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do kováøství",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do chrámu",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"k uèitelùm",PC_Psionic_GUIDEFIRST_TRAIN);
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
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...do kováøského krámu.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Pojï za mnou!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...do chrámu.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Pojï za mnou!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...k uèitelùm.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Pojï za mnou!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...do alchymistické dílny.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Pojï za mnou!
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
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Dole najdeš Baala Cadara. Vyuèuje novice.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Když vylezeš po tomhle žebøíku, dostaneš se na templáøské cvièištì. Budu tady na tebe èekat. Kdyby ses zpozdil, budu zase u Baala Namiba u vchodu do tábora.

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
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Tohle je chrám! Poèkám na tebe, ale když ti to bude moc dlouho trvat, pùjdu zpátky k Baalu Namibovi.

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
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Tohle je kovárna. Rozhlédni se tu. Poèkám na tebe asi hodinu, pak pùjdu pryè.
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
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Když vylezeš po tomhle žebøíku, dostaneš se k alchymistovi Corovi Kalomovi. Dole je Fortuno, obchodník s drogou.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Poèkám tu na tebe. Nebuï tam ale moc dlouho, jinak se vrátím zpátky.
	
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
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Naše Bratrstvo plánuje nesmírnì velkou vìc.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Co plánuje? Prolomení?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Guru se pokoušejí spojit se se Spáèem. Potøebují ale nìjak sjednotit své síly.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //No a?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Potøebují magický pøedmìt, ohnisko.

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
	description		= "A co já s tím mám dìlat?"; 
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
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //A co já s tím mám dìlat?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Promluv s Y´Berionem. Je tady nejmocnìjší muž. Je to možnost, jak u nìj dosáhnout obliby.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Kde ho najdu?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Jdi do chrámu. Zøídkakdy ho opouští. Zøejmì se v tìch chladných zdech cítí být blíž Spáèovi.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Novic Lester mi øekl, že se Y´Berion shání po kouzelném ohniskovém kameni. Guru je v chrámové hoøe.");

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
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hej, co tady dìláš?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Pøišel jsem na rozkaz mágù Vody. Hledám kouzelné artefakty, takzvané ohniskové kameny.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Hledáš ohniskové kameny? Jsi opravdu smìlý.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas a ostatní mágové z Nového tábora je chtìjí použít k rozboøení Bariéry, aby nás osvobodili z našeho uvìznìní.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Tomu uvìøím, jedinì až to uvidím na vlastní oèi.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Taky to tak cítím. Ale øekni mi, proè jsi sem pøišel?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Zvažuju, jestli má cenu se vydat na návštìvu horské pevnosti.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Víš... existuje jeden dokument, který bych rád získal. Na druhou stranu je to nebezpeèné, tam chodit.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak se ti podaøilo pøejít pøes ty hory?"; 
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
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Jak se ti podaøilo pøejít pøes ty hory?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Hodnì jsem se toho nauèil od Guru. Jejich kouzla mùžou být opravdu užiteèná.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ten dokument, co ho chceš... co je to zaè?"; 
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
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Ten dokument, co ho chceš... co je to zaè?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Pøed mnoha lety žil v té horské pevnosti pán této oblasti. Mìl pod kontrolou zem i doly.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Tak jako ostatní šlechtici i on samozøejmì mìl dokument, který potvrzoval jeho lenní majetek. A právì to je ten dokument.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Ale od té doby, co jsme tu drženi Bariérou, už není k nièemu užiteèný.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //To je pravda. Pokud se ale mágùm Vody podaøí znièit Bariéru, dokument znovu nabude znaèné hodnoty.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mohli bychom se podívat na tu pevnost spoleènì."; 
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
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Mohli bysme se podívat na tu pevnost spoleènì.
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //To je dobrý nápad. Jdi první, zùstanu blízko tebe.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"Pøed mohutnou pevností, která byla vybudována v horách, jsem se setkal s novicem Lesterem z Tábora v bažinách. Rozhlížel se v budovì po nìjaké listinì a pøidal se ke mnì pøi hledání ohniska.");

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

	B_LogEntry		(CH3_Fortress,"Ohnisko, které hledám, stojí na podstavci. Je však pøíliš vysoko, než abych pro nìj mohl vylézt. Musím najít nìjaký zpùsob, jak tento artefakt získat.");	
	
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
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Kam jdeš? Ještì jsme tady neskonèili!
	
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
	description		= "Jsem ranìný. Mùžeš mi pomoci?"; 
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
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Jsem ranìný. Mùžeš mi pomoci?
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
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Hej, dobrá práce. Vezmi si za odmìnu tyto kouzelné svitky. S nimi se dostaneš k tomu ohnisku.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Poèkám na tebe dole u té ohniskové roviny.

	B_LogEntry		(CH3_Fortress,"Listina, po které se shánìl Lester, byla v jedné truhlici. Výmìnou mi dal ètyøi kouzelné svitky telekineze, pomocí kterých dostanu to ohnisko.");
	
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
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Mistr Y´Berion obvykle øíká: žák zkouší vìcmi pohybovat pomocí rukou a nohou, mistr jimi pohybuje duchovní silou.
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
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Zùstanu tady, abych našel ten dokument.
	
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
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Pùjdu a porozhlédnu se tady.
	
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
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Ještì nemáme oba to, co jsme chtìli. Já zùstanu tady, abych si pøeèetl ty staré knihy.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Dobøe, ještì se sejdeme.

	B_LogEntry		(CH3_Fortress,"Získal jsem ohnisko. Lester se chce ještì porozhlédnout po knihovnì v pevnosti. Doufám, že se s ním ještì uvidím.");

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
	description		= "Našel jsi nìco?"; 
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
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Našel jsi nìco?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Ta truhla je zamèená. Možná k ní najdeme klíè nìkde v pevnosti.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Už jsi našel ten dokument?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Ještì ne.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Hledal jsi v knihovnì?
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
	description		= "Prozkoumáme pevnost spoleènì."; 
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
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Prozkoumáme pevnost spoleènì.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Dobøe, jdi první!
 
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
	description = "Potkal jsem pøes Starým táborem Diega a Miltena!";
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
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hej, co tady dìláš?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Starý dùl se zhroutil potom, co ho zatopila voda!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//No a?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Všichni mágové Ohnì jsou mrtví!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez je povraždil.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//To nebude snadné napravit!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Potkal jsem pøes Starým táborem Diega a Miltena!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Chtìli se s tebou setkat. Na obvyklém místì.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Už bylo na èase!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//Co se dìje?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Zùstanu tady, abych si pøeèetl ty staré knihy.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Uch... Nerozumím...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Mistr Y´Berion obvykle øíká: žák zkouší vìcmi pohybovat pomocí rukou a nohou, mistr jimi pohybuje duchovní silou.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Dobøe, dobøe. Dám si pozor.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Opatruj se.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Dìkuju. Pùjdu si svou cestou.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Kéž tì Spáè ochrání!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Øekl jsem Lesterovi a Gornovi o setkání s jejich pøáteli. Teï už to není moje vìc. Dál si poradí sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
