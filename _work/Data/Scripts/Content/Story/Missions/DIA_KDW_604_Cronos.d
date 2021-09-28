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
	description = "Ich gr¸ﬂe dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Ich gr¸ﬂe dich, Magier.
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum stˆrst du den H¸ter des Erzes?
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
	description = "M·m dopis pro VelkÈho m·ga Kruhu ohnÏ.";
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
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //M·m dopis pro VelkÈho m·ga Kruhu ohnÏ.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Jsme m·govÈ Kruhu vody. M·govÈ Kruhu ohnÏ ûijÌ ve StarÈm t·bo¯e.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //J· se ale nedostanu na hrad. M˘ûeö mi pomoci?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Dobr·, obËas vysÌl·me k bratr˘m do StarÈho t·bora kur˝ry...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ti ovöem mohou ty dopisy pouze p¯edat Laresov˝m muû˘m. BÏhem mnoha let, co to takhle dÏl·me, se naöi kur˝¯i bezpeËnÏ vracejÌ zp·tky.
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
	description = "Chcete rozbÌt BariÈru - jak se to p¯esnÏ chyst·te udÏlat?";
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
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Chcete rozbÌt BariÈru - jak se to p¯esnÏ chyst·te udÏlat?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Pot¯ebujeme velkÈ mnoûstvÌ magickÈ rudy.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //P¯i velkÈm magickÈm ob¯adu uvolnÌme vöechnu magickou sÌlu, kter· rozbije BariÈru.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //TakovÈ velkÈ mnoûstvÌ magickÈ rudy ovöem samoz¯ejmÏ p¯il·k· spoustu zlodÏj˘ a dareb·k˘!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Proto pot¯ebujeme nÏkoho, kdo n·ö pl·n ochr·nÌ.
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
	description = "ChtÏl bych se k v·m p¯idat!";
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
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //ChtÏl bych se k v·m p¯idat!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Jestli se k n·m chceö p¯idat, mÏl bys zajÌt za Leem nebo Laresem.
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
	description = "ChtÏl bych se st·t m·gem!";
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
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //ChtÏl bych se st·t m·gem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nem˘ûeme dopustit, aby se naöe vÏdomosti dostaly k naöim nep¯·tel˘m.
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Nem˘ûeme tÏ ani cviËit, dokud n·m neprok·ûeö svoji oddanost.
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
	description = "Jsem teÔ jednÌm z Laresov˝ch muû˘. Nem·ö nÏjakou zpr·vu pro m·gy OhnÏ?";
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
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Jsem teÔ jednÌm z Laresov˝ch muû˘. Nem·ö nÏjakou zpr·vu pro m·gy OhnÏ?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //Opravdu. Budeö ale pot¯ebovat znamenÌ naöich kur˝r˘, jinak tÏ Gomezovi muûi nepustÌ na hrad.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Tady je dopis a znamenÌ. A teÔ uû pospÌchej!
	
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
	description = "P¯edal jsem tu zpr·vu!";
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
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //P¯edal jsem tu zpr·vu!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //¡, v˝bornÏ! Tady je mal· odmÏna za tvoji snahu!
	
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
	description = "M·m d˘leûitou zpr·vu pro Saturase!";
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
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //M·m d˘leûitou zpr·vu pro Saturase!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Co m˘ûe b˝t tak d˘leûitÈ, aby n·ö duchovnÌ v˘dce kv˘li tomu p¯eruöil svÈ d˘leûitÈ studium?
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
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opustil spolu s nÏkolika fanatick˝mi templ·¯i Bratrstvo!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Chce na vlastnÌ pÏst najÌt Sp·Ëe a za kaûdou cenu ho probudit.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nikdy jsem mu nevÏ¯il. Aù uû je Druh˝ Guru guru nebo ne, je dom˝öliv˝, z·ke¯n˝ a vöehoschopn˝.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Bratrstvu bez nÏj bude lÌp!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //ÿeknu o tom Saturasovi, jakmile k tomu dostanu p¯Ìleûitost. TeÔ jdi!

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
	description = "Y¥Berion, v˘dce SektovnÌho t·bora, je mrtev!";
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
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y¥Berion, v˘dce SektovnÌho t·bora, je mrtev!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //COéEEE??? Jak se to stalo?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Bratrstvo prov·dÏlo ob¯ad, p¯i kterÈm vz˝valo svÈho boha.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //MyölenkovÈ napÏtÌ vöak bylo pro Y¥Beriona p¯Ìliö velkÈ.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //To je velmi smutnÈ. Y¥Berion byl spolehliv˝ spojenec.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //NenÌ to ale d˘vod, kter˝ by ospravedlnil p¯eruöenÌ Saturasova studia.

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
	description = "Guru zjistili, ûe se modlÌ ke zlÈmu arcidÈmonovi!";
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
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Guru zjistili, ûe se modlÌ ke zlÈmu arcidÈmonovi!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Vöichni zaËali najednou vÏ¯it, ûe je jejich Sp·Ë dÈmon?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //Vypad· to na dalöÌ öÌlen˝ v˝mysl Bratrstva, ale...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...moûn· majÌ pravdu... vöichni tady v kolonii bysme se mohli ocitnout ve velkÈm nebezpeËÌ.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //MusÌö to ihned sdÏlit Saturasovi. MusÌ rozhodnout, co bude t¯eba udÏlat.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Kde najdu Saturase?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Jdi do hornÌ roviny. ÿekni str·ûÌm, ûe m·ö mÈ povolenÌ ke vstupu.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Heslo je TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturase najdeö u velkÈho pentagramu.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Tr·vÌ tam vÏtöinu Ëasu a zkoum·, jak odp·lit velkou rudnou haldu.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos mi dal svolenÌ navötÌvit Saturase v hornÌ rovinÏ. VelkÈho m·ga Kruhu vody lze obvykle najÌt u pentagramu. Heslo pro str·û znÌ... Sakra, jak to jen bylo?");

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
	description = "Jakûe bylo to heslo?";
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
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Jakûe bylo to heslo?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Jsi jeötÏ roztrûitÏjöÌ neû moje b·ba. ZnÌ 'TETRIANDOCH'.
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
	description = "Saturas ¯ekl, ûe mÏ m·ö odmÏnit.";
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
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas ¯ekl, ûe mÏ m·ö odmÏnit.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Jako str·ûce magickÈ rudy bych ti za tvoje velkÈ Ëiny pro n·ö t·bor chtÏl  d·t troöku naöÌ rudy.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Douf·m, ûe ho pouûijeö, jak nejlÈpe budeö umÏt!

	B_LogEntry		(CH3_BringFoci,"Cronos mi dal velkÈ mnoûstvÌ rudy, kterÈ dost zmenöÌ tu obrovitou rudnou haldu.");
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
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Tvoje rozhodnutÌ p¯idat se m·g˘m Vody bylo spr·vnÈ. BuÔ vÌt·n, brat¯e!
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
	description		= "Pot¯ebuji vÌce magickÈ moci."; 
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
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Pot¯ebuju vÌce magickÈ sÌly.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //M˘ûu ti pomoci zvÏtöit tvoji sÌlu. UûÌvej ji moud¯e.
	
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
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //R·d bych zÌskal magickÈ spisy.
	
};  
/*------------------------------------------------------------------------
						BEGR‹SSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "BuÔ zdr·v, m·gu."; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //BuÔ pozdraven, m·gu.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //KÈû je Adanosovo poûehn·nÌ s tebou. M˘ûu ti pomoci zvÏtöit tvÈ magickÈ sÌly, nebo ti d·t p·r uûiteËn˝ch vÏcÌ.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Co pro tebe m˘ûu udÏlat?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos prod·v· magickÈ p¯edmÏty jako RUNY, SVITKY a PRSTENY. M˘ûu ho ve dne v noci najÌt u m¯Ìûe nad velkou rudnou haldou."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos mi m˘ûe pomoci zv˝öit MAGICKOU ENERGII. M˘ûu ho ve dne v noci najÌt u m¯Ìûe nad velkou rudnou haldou.");
};
