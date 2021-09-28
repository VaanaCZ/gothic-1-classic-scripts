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
	description = "Ich gr��e dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Ich gr��e dich, Magier.
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum st�rst du den H�ter des Erzes?
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
	description = "M�m dopis pro Velk�ho m�ga Kruhu ohn�.";
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
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //M�m dopis pro Velk�ho m�ga Kruhu ohn�.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Jsme m�gov� Kruhu vody. M�gov� Kruhu ohn� �ij� ve Star�m t�bo�e.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //J� se ale nedostanu na hrad. M��e� mi pomoci?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Dobr�, ob�as vys�l�me k bratr�m do Star�ho t�bora kur�ry...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ti ov�em mohou ty dopisy pouze p�edat Laresov�m mu��m. B�hem mnoha let, co to takhle d�l�me, se na�i kur��i bezpe�n� vracej� zp�tky.
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
	description = "Chcete rozb�t Bari�ru - jak se to p�esn� chyst�te ud�lat?";
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
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Chcete rozb�t Bari�ru - jak se to p�esn� chyst�te ud�lat?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Pot�ebujeme velk� mno�stv� magick� rudy.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //P�i velk�m magick�m ob�adu uvoln�me v�echnu magickou s�lu, kter� rozbije Bari�ru.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Takov� velk� mno�stv� magick� rudy ov�em samoz�ejm� p�il�k� spoustu zlod�j� a dareb�k�!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Proto pot�ebujeme n�koho, kdo n� pl�n ochr�n�.
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
	description = "Cht�l bych se k v�m p�idat!";
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
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Cht�l bych se k v�m p�idat!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Jestli se k n�m chce� p�idat, m�l bys zaj�t za Leem nebo Laresem.
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
	description = "Cht�l bych se st�t m�gem!";
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
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Cht�l bych se st�t m�gem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nem��eme dopustit, aby se na�e v�domosti dostaly k na�im nep��tel�m.
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Nem��eme t� ani cvi�it, dokud n�m neprok�e� svoji oddanost.
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
	description = "Jsem te� jedn�m z Laresov�ch mu��. Nem� n�jakou zpr�vu pro m�gy Ohn�?";
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
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Jsem te� jedn�m z Laresov�ch mu��. Nem� n�jakou zpr�vu pro m�gy Ohn�?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //Opravdu. Bude� ale pot�ebovat znamen� na�ich kur�r�, jinak t� Gomezovi mu�i nepust� na hrad.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Tady je dopis a znamen�. A te� u� posp�chej!
	
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
	description = "P�edal jsem tu zpr�vu!";
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
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //P�edal jsem tu zpr�vu!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //�, v�born�! Tady je mal� odm�na za tvoji snahu!
	
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
	description = "M�m d�le�itou zpr�vu pro Saturase!";
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
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //M�m d�le�itou zpr�vu pro Saturase!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Co m��e b�t tak d�le�it�, aby n� duchovn� v�dce kv�li tomu p�eru�il sv� d�le�it� studium?
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
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opustil spolu s n�kolika fanatick�mi templ��i Bratrstvo!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Chce na vlastn� p�st naj�t Sp��e a za ka�dou cenu ho probudit.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nikdy jsem mu nev��il. A� u� je Druh� Guru guru nebo ne, je dom��liv�, z�ke�n� a v�ehoschopn�.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Bratrstvu bez n�j bude l�p!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //�eknu o tom Saturasovi, jakmile k tomu dostanu p��le�itost. Te� jdi!

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
	description = "Y�Berion, v�dce Sektovn�ho t�bora, je mrtev!";
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
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y�Berion, v�dce Sektovn�ho t�bora, je mrtev!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //CO�EEE??? Jak se to stalo?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Bratrstvo prov�d�lo ob�ad, p�i kter�m vz�valo sv�ho boha.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //My�lenkov� nap�t� v�ak bylo pro Y�Beriona p��li� velk�.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //To je velmi smutn�. Y�Berion byl spolehliv� spojenec.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Nen� to ale d�vod, kter� by ospravedlnil p�eru�en� Saturasova studia.

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
	description = "Guru zjistili, �e se modl� ke zl�mu arcid�monovi!";
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
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Guru zjistili, �e se modl� ke zl�mu arcid�monovi!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //V�ichni za�ali najednou v��it, �e je jejich Sp�� d�mon?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //Vypad� to na dal�� ��len� v�mysl Bratrstva, ale...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...mo�n� maj� pravdu... v�ichni tady v kolonii bysme se mohli ocitnout ve velk�m nebezpe��.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Mus� to ihned sd�lit Saturasovi. Mus� rozhodnout, co bude t�eba ud�lat.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Kde najdu Saturase?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Jdi do horn� roviny. �ekni str��m, �e m� m� povolen� ke vstupu.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Heslo je TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturase najde� u velk�ho pentagramu.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Tr�v� tam v�t�inu �asu a zkoum�, jak odp�lit velkou rudnou haldu.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos mi dal svolen� nav�t�vit Saturase v horn� rovin�. Velk�ho m�ga Kruhu vody lze obvykle naj�t u pentagramu. Heslo pro str� zn�... Sakra, jak to jen bylo?");

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
	description = "Jak�e bylo to heslo?";
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
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Jak�e bylo to heslo?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Jsi je�t� roztr�it�j�� ne� moje b�ba. Zn� 'TETRIANDOCH'.
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
	description = "Saturas �ekl, �e m� m� odm�nit.";
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
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas �ekl, �e m� m� odm�nit.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Jako str�ce magick� rudy bych ti za tvoje velk� �iny pro n� t�bor cht�l  d�t tro�ku na�� rudy.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Douf�m, �e ho pou�ije�, jak nejl�pe bude� um�t!

	B_LogEntry		(CH3_BringFoci,"Cronos mi dal velk� mno�stv� rudy, kter� dost zmen�� tu obrovitou rudnou haldu.");
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
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Tvoje rozhodnut� p�idat se m�g�m Vody bylo spr�vn�. Bu� v�t�n, brat�e!
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
	description		= "Pot�ebuji v�ce magick� moci."; 
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
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Pot�ebuju v�ce magick� s�ly.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //M��u ti pomoci zv�t�it tvoji s�lu. U��vej ji moud�e.
	
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
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //R�d bych z�skal magick� spisy.
	
};  
/*------------------------------------------------------------------------
						BEGR�SSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Bu� zdr�v, m�gu."; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Bu� pozdraven, m�gu.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //K� je Adanosovo po�ehn�n� s tebou. M��u ti pomoci zv�t�it tv� magick� s�ly, nebo ti d�t p�r u�ite�n�ch v�c�.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Co pro tebe m��u ud�lat?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos prod�v� magick� p�edm�ty jako RUNY, SVITKY a PRSTENY. M��u ho ve dne v noci naj�t u m��e nad velkou rudnou haldou."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos mi m��e pomoci zv��it MAGICKOU ENERGII. M��u ho ve dne v noci naj�t u m��e nad velkou rudnou haldou.");
};
