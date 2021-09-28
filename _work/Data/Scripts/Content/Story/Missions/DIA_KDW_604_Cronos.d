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
	description = "Mam tu list dla Arcymistrza Mag�w Ognia.";
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
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Mam tu list dla Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //My jeste�my Magami Wody. Mag�w z Kr�gu Ognia znajdziesz w Starym Obozie.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Ale stra�nicy nie chc� mnie wpu�ci� do zamku? Mo�esz mi jako� pom�c?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //C�, co jaki� czas wysy�amy kurier�w do naszych braci ze Starego Obozu...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ale przesy�ki powierzamy wy��cznie ludziom Laresa. Od wielu lat jego ch�opcy dbaj� o to, by nasze przesy�ki dociera�y do Mag�w Ognia nienaruszone.
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
	description = "Chcecie pono� zniszczy� magiczn� Barier�. Jak zamierzacie tego dokona�?";
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
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Chcecie pono� zniszczy� magiczn� Barier�. Jak zamierzacie tego dokona�?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Pr�bujemy zgromadzi� w jednym miejscu mo�liwie du�� ilo�� magicznej rudy.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Podczas wielkiego rytua�u, ca�a skumulowana w rudzie magiczna energia zostanie wyzwolona i Bariera pry�nie jak mydlana ba�ka!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Naturalnie tak wielka ilo�� rudy przyci�ga tutaj r�nych w��cz�g�w i bandyt�w!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Dlatego potrzebujemy wielu ludzi do pilnowania naszych zapas�w.
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
	description = "Chcia�bym do was do��czy�!";
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
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Chcia�bym do was do��czy�!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Je�li chcesz zosta� jednym z nas, powiniene� porozmawia� z Lee albo z Laresem.
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
	description = "Chcia�bym zosta� magiem!";
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
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Chcia�bym zosta� magiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nie mo�emy dzieli� si� nasz� wiedz� z przeciwnikiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Dop�ki nie przekonasz nas o swojej lojalno�ci, nie masz nawet o czym marzy� - nie b�dziemy ci� uczyli!
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
	description = "Jestem teraz jednym z ludzi Laresa. Masz jak�� wiadomo�� dla Mag�w Ognia?";
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
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Jestem teraz jednym z ludzi Laresa. Masz jak�� wiadomo�� dla Mag�w Ognia, kt�r� m�g�bym dostarczy� do Starego Obozu?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //W rzeczy samej, mam. Ale bez specjalnego znaku kurierskiego ludzie Gomeza nie wpuszcz� ci� do zamku.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Masz, oto list i znak. Tylko si� pospiesz!
	
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
	description = "Dostarczy�em twoje pismo!";
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
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Dostarczy�em twoje pismo!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Ach, dobrze! Oto drobny prezent, w nagrod� za twoje trudy...
	
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
	description = "Mam wa�n� wiadomo�� dla Saturasa!";
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
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Mam wa�n� wiadomo�� dla Saturasa!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //C� mo�e by� tak wa�nego, by� mia� przeszkadza� naszemu wielkiemu przyw�dcy w jego badaniach?
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
	description = "Cor Kalom opu�ci� ob�z Bractwa!";
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
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opu�ci� ob�z Bractwa z grup� fanatycznych Stra�nik�w �wi�tynnych!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Zamierza na w�asn� r�k� odnale�� �ni�cego i przebudzi� go za wszelk� cen�.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nigdy nie ufa�em temu cz�owiekowi. Wielki Guru czy nie - to pr�ny i nieszczery cz�owiek zdolny do wszystkiego.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Bractwo da sobie rad� i bez niego!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Powt�rz� twoje informacje Saturasowi przy najbli�szej okazji. Mo�esz ju� odej��!

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
	description = "Y'Berion, duchowy przyw�dca Bractwa �ni�cego, nie �yje!";
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
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y'Berion, duchowy przyw�dca Bractwa �ni�cego, nie �yje!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //CO?!? Jak to si� sta�o?!
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Bractwo przeprowadzi�o rytua� przyzwania �ni�cego.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Wygl�da na to, �e Y'Berion nie by� w stanie wytrzyma� tak wielkiego obci��enia.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //To smutna wiadomo��. Na Y'Berionie zawsze mo�na by�o polega�.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Ale to jeszcze nie pow�d, �eby przeszkadza� Saturasowi.

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
	description = "Guru zorientowali si�, �e oddawali cze�� pot�nemu demonowi z piek�a rodem!";
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
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Guru zorientowali si�, �e oddawali cze�� pot�nemu demonowi z piek�a rodem!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Raptem doszli do wniosku, �e �ni�cy jest demonem?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //To mi wygl�da na kolejny szalony pomys� ludzi z Bractwa, ale...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...Gdyby okaza�o si�, �e maj� racj�... Ca�a kolonia znalaz�aby si� w �miertelnym niebezpiecze�stwie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Powt�rzysz te informacje samemu Saturasowi. On zdecyduje co nam wypada czyni�.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Gdzie znajd� Saturasa?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Wejd� na wy�szy poziom. Powiedz stra�nikom, �e pozwoli�em ci przej��.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Has�o brzmi TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturasa znajdziesz przy wielkim pentagramie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //W zasadzie si� stamt�d nie rusza. Ca�y czas obmy�la spos�b na wysadzenie kopca rudy.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos pozwoli� mi spotka� si� z Saturasem na g�rnym poziomie. Arcymistrz kr�gu Wody przebywa zwykle w pobli�u magicznego pentagramu. Has�o, kt�re mam poda� stra�nikowi brzmi... Cholera, jak to sz�o?!");

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
	description = "Jak brzmia�o to has�o?";
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
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Jak brzmia�o to has�o?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Ju� moja �wi�tej pami�ci babcia mia�a lepsz� pami�� od ciebie. Has�o brzmi "TETRIANDOCH".
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
	description = "Saturas powiedzia�, �e masz dla mnie nagrod�.";
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
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas powiedzia�, �e masz dla mnie nagrod�.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Jako stra�nik rudy, chcia�bym podarowa� ci cz�� naszego urobku jako nagrod� za zas�ugi dla Nowego Obozu.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Mam nadziej�, �e zrobisz z tej rudy r�wnie dobry u�ytek jak my!

	B_LogEntry		(CH3_BringFoci,"Dosta�em od Cronosa mn�stwo rudy, chocia� w por�wnaniu z wielkim kopcem nie jest to zbyt wiele.");
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
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //M�drze post�pi�e� przyst�puj�c do Mag�w Wody. B�d� pozdrowiony, bracie!
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
	description		= "Potrzebuj� wi�kszej mocy magicznej."; 
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
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Potrzebuj� wi�kszej mocy magicznej.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Mog� ci pokaza�, jak zwi�kszy� twoje zdolno�ci magiczne. Jak je wykorzystasz zale�y ju� tylko od ciebie.
	
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
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Poszukuj� magicznych ksi�g.
	
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
	description		= "Witaj, magu!"; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Witaj, magu!
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Niech b�ogos�awie�stwo Adanosa zawsze b�dzie z tob�. Mog� ci pom�c zwi�kszy� twoje magiczne moce lub zaopatrzy� ci� w kilka po�ytecznych przedmiot�w.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Co mog� dla ciebie zrobi�?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos sprzedaje magiczne przedmioty, takie jak runy, zwoje i pier�cienie. Znajd� go przy kracie nad wielkim kopcem rudy."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos mo�e mi pom�c w zwi�kszeniu mojej mana. Znajd� go przy kracie, nad wielkim kopcem rudy.");
};
