// ************************ EXIT **************************
instance  KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int  KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneIceCube))
	{
	CreateInvItem (self, ItArRuneIceCube);
	};
	if (!Npc_HasItems (self,ItArRuneThunderbolt))
	{
	CreateInvItem (self, ItArRuneThunderbolt);
	};
};

/*
// *****************************************
//					Greet
// *****************************************

instance  KDW_604_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Greet_Condition;
	information	=  KDW_604_Cronos_Greet_Info;
	permanent	=  0;
	description = "Ich grüße dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Ich grüße dich, Magier.
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum störst du den Hüter des Erzes?
};
*/

// *****************************************
//					Brief
// *****************************************

instance  KDW_604_Cronos_Brief (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Brief_Condition;
	information	=  KDW_604_Cronos_Brief_Info;
	permanent	=  0;
	description = "Mám dopis pro Velkého mága Kruhu ohně.";
};                       

FUNC int  KDW_604_Cronos_Brief_Condition()
{
	if	Npc_KnowsInfo(hero, KDW_604_Cronos_Greet)
	&&	(Npc_GetTrueGuild(hero) != GIL_STT)
	&&	(Npc_GetTrueGuild(hero) != GIL_KDF)
	&&	(hero.level < 10)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Brief_Info()
{
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Mám dopis pro Velkého mága Kruhu ohně.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Jsme mágové Kruhu vody. Mágové Kruhu ohně žijí ve Starém táboře.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Já se ale nedostanu na hrad. Můžeš mi pomoci?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Dobrá, občas vysíláme k bratrům do Starého tábora kurýry...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ti ovšem mohou ty dopisy pouze předat Laresovým mužům. Během mnoha let, co to takhle děláme, se naši kurýři bezpečně vracejí zpátky.
};

// *****************************************
//					Barrier
// *****************************************

instance  KDW_604_Cronos_Barrier (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  KDW_604_Cronos_Barrier_Condition;
	information	=  KDW_604_Cronos_Barrier_Info;
	permanent	=  0;
	description = "Chcete rozbít Bariéru - jak se to přesně chystáte udělat?";
};                       

FUNC int  KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Barrier_Info()
{
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Chcete rozbít Bariéru - jak se to přesně chystáte udělat?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Potřebujeme velké množství magické rudy.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Při velkém magickém obřadu uvolníme všechnu magickou sílu, která rozbije Bariéru.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Takové velké množství magické rudy ovšem samozřejmě přiláká spoustu zlodějů a darebáků!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Proto potřebujeme někoho, kdo náš plán ochrání.
};

// *****************************************
//					WannaJoin
// *****************************************

instance  KDW_604_Cronos_WannaJoin (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaJoin_Condition;
	information	=  KDW_604_Cronos_WannaJoin_Info;
	permanent	=  0;
	description = "Chtěl bych se k vám přidat!";
};                       

FUNC int  KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Chtěl bych se k vám přidat!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Jestli se k nám chceš přidat, měl bys zajít za Leem nebo Laresem.
};

// *****************************************
//					WannaMage
// *****************************************

instance  KDW_604_Cronos_WannaMage (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage_Condition;
	information	=  KDW_604_Cronos_WannaMage_Info;
	permanent	=  0;
	description = "Chtěl bych se stát mágem!";
};                       

FUNC int  KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Chtěl bych se stát mágem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nemůžeme dopustit, aby se naše vědomosti dostaly k našim nepřátelům.
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Nemůžeme tě ani cvičit, dokud nám neprokážeš svoji oddanost.
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
//					Bandit --> Messenger
// *****************************************

instance  KDW_604_Cronos_Bandit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  KDW_604_Cronos_Bandit_Condition;
	information	=  KDW_604_Cronos_Bandit_Info;
	permanent	=  0;
	description = "Jsem teď jedním z Laresových mužů. Nemáš nějakou zprávu pro mágy Ohně?";
};                       

FUNC int  KDW_604_Cronos_Bandit_Condition()
{
	if ( (Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Bandit_Info()
{
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Jsem teď jedním z Laresových mužů. Nemáš nějakou zprávu pro mágy Ohně?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //Opravdu. Budeš ale potřebovat znamení našich kurýrů, jinak tě Gomezovi muži nepustí na hrad.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Tady je dopis a znamení. A teď už pospíchej!
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	
	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
//					BriefBack
// *****************************************

instance  KDW_604_Cronos_BriefBack (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_BriefBack_Condition;
	information	=  KDW_604_Cronos_BriefBack_Info;
	permanent	=  0;
	description = "Předal jsem tu zprávu!";
};                       

FUNC int  KDW_604_Cronos_BriefBack_Condition()
{
	if (Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_BriefBack_Info()
{
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Předal jsem tu zprávu!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Á, výborně! Tady je malá odměna za tvoji snahu!
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	B_GiveXP(XP_CronosLetter);
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS (C_INFO)
{
	npc			= KDW_604_Cronos;
	condition	= Info_Cronos_NEWS_Condition;
	information	= Info_Cronos_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mám důležitou zprávu pro Saturase!";
};

FUNC INT Info_Cronos_NEWS_Condition()
{	
	if	(CorAngar_SendToNC==TRUE)
	&&	!Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_NEWS_Info()
{
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Mám důležitou zprávu pro Saturase!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Co může být tak důležité, aby náš duchovní vůdce kvůli tomu přerušil své důležité studium?
};

//***************************************************************************
//	Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 10;
	condition	= Info_Cronos_KALOM_Condition;
	information	= Info_Cronos_KALOM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Cor Kalom opustil Bratrstvo!";
};

FUNC INT Info_Cronos_KALOM_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_KALOM_Info()
{
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opustil spolu s několika fanatickými templáři Bratrstvo!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Chce na vlastní pěst najít Spáče a za každou cenu ho probudit.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nikdy jsem mu nevěřil. Ať už je Druhý Guru guru nebo ne, je domýšlivý, zákeřný a všehoschopný.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Bratrstvu bez něj bude líp!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Řeknu o tom Saturasovi, jakmile k tomu dostanu příležitost. Teď jdi!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 20;
	condition	= Info_Cronos_YBERION_Condition;
	information	= Info_Cronos_YBERION_Info;
	permanent	= 0;
	important 	= 0;
	description = "Y´Berion, vůdce Sektovního tábora, je mrtev!";
};

FUNC INT Info_Cronos_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_YBERION_Info()
{
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y´Berion, vůdce Sektovního tábora, je mrtev!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //COŽEEE??? Jak se to stalo?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Bratrstvo provádělo obřad, při kterém vzývalo svého boha.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Myšlenkové napětí však bylo pro Y´Beriona příliš velké.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //To je velmi smutné. Y´Berion byl spolehlivý spojenec.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Není to ale důvod, který by ospravedlnil přerušení Saturasova studia.

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_SLEEPER_Condition;
	information	= Info_Cronos_SLEEPER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Guru zjistili, že se modlí ke zlému arcidémonovi!";
};

FUNC INT Info_Cronos_SLEEPER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_SLEEPER_Info()
{
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Guru zjistili, že se modlí ke zlému arcidémonovi!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Všichni začali najednou věřit, že je jejich Spáč démon?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //Vypadá to na další šílený výmysl Bratrstva, ale...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...možná mají pravdu... všichni tady v kolonii bysme se mohli ocitnout ve velkém nebezpečí.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Musíš to ihned sdělit Saturasovi. Musí rozhodnout, co bude třeba udělat.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Kde najdu Saturase?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Jdi do horní roviny. Řekni strážím, že máš mé povolení ke vstupu.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Heslo je TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturase najdeš u velkého pentagramu.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Tráví tam většinu času a zkoumá, jak odpálit velkou rudnou haldu.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos mi dal svolení navštívit Saturase v horní rovině. Velkého mága Kruhu vody lze obvykle najít u pentagramu. Heslo pro stráž zní... Sakra, jak to jen bylo?");

	B_GiveXP			(XP_GetCronosPermission);

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_PAROLE_Condition;
	information	= Info_Cronos_PAROLE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jakže bylo to heslo?";
};

FUNC INT Info_Cronos_PAROLE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_PAROLE_Info()
{
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Jakže bylo to heslo?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Jsi ještě roztržitější než moje bába. Zní 'TETRIANDOCH'.
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_REWARD_Condition;
	information	= Info_Cronos_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas řekl, že mě máš odměnit.";
};

FUNC INT Info_Cronos_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_REWARD_Info()
{
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas řekl, že mě máš odměnit.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Jako strážce magické rudy bych ti za tvoje velké činy pro náš tábor chtěl  dát trošku naší rudy.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Doufám, že ho použiješ, jak nejlépe budeš umět!

	B_LogEntry		(CH3_BringFoci,"Cronos mi dal velké množství rudy, které dost zmenší tu obrovitou rudnou haldu.");
	if	Npc_KnowsInfo(hero, Info_Riordian_REWARD)
	{
		Log_SetTopicStatus	(CH3_BringFoci,	LOG_SUCCESS);
	};
	
	CreateInvItems		(self, ItMiNugget,	1000);
	B_GiveInvItems (self, hero, ItMiNugget,	1000);
};
/*------------------------------------------------------------------------
//						NACH DER WEIHE							//
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_WELCOME_Condition;
	information		= KDW_604_Cronos_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_604_Cronos_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void  KDW_604_Cronos_WELCOME_Info()
{
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Tvoje rozhodnutí přidat se mágům Vody bylo správné. Buď vítán, bratře!
	AI_StopProcessInfos	( self );  
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDW_604_Cronos_MANA (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 800;
	condition		= KDW_604_Cronos_MANA_Condition;
	information		= KDW_604_Cronos_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potřebuji více magické moci."; 
};

FUNC int  KDW_604_Cronos_MANA_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Potřebuju více magické síly.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Můžu ti pomoci zvětšit tvoji sílu. Užívej ji moudře.
	
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices	(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Cronos_SELLSTUFF (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 900;
	condition		= KDW_604_Cronos_SELLSTUFF_Condition;
	information		= KDW_604_Cronos_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Cronos_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Rád bych získal magické spisy.
	
};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Buď zdráv, mágu."; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Buď pozdraven, mágu.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Kéž je Adanosovo požehnání s tebou. Můžu ti pomoci zvětšit tvé magické síly, nebo ti dát pár užitečných věcí.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Co pro tebe můžu udělat?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos prodává magické předměty jako RUNY, SVITKY a PRSTENY. Můžu ho ve dne v noci najít u mříže nad velkou rudnou haldou."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos mi může pomoci zvýšit MAGICKOU ENERGII. Můžu ho ve dne v noci najít u mříže nad velkou rudnou haldou.");
};
