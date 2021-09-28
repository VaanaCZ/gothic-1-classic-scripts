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
	description = "Mam tu list dla Arcymistrza Magów Ognia.";
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
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Mam tu list dla Arcymistrza Magów Ognia.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //My jesteœmy Magami Wody. Magów z Krêgu Ognia znajdziesz w Starym Obozie.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Ale stra¿nicy nie chc¹ mnie wpuœciæ do zamku? Mo¿esz mi jakoœ pomóc?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Có¿, co jakiœ czas wysy³amy kurierów do naszych braci ze Starego Obozu...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ale przesy³ki powierzamy wy³¹cznie ludziom Laresa. Od wielu lat jego ch³opcy dbaj¹ o to, by nasze przesy³ki dociera³y do Magów Ognia nienaruszone.
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
	description = "Chcecie ponoæ zniszczyæ magiczn¹ Barierê. Jak zamierzacie tego dokonaæ?";
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
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Chcecie ponoæ zniszczyæ magiczn¹ Barierê. Jak zamierzacie tego dokonaæ?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Próbujemy zgromadziæ w jednym miejscu mo¿liwie du¿¹ iloœæ magicznej rudy.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Podczas wielkiego rytua³u, ca³a skumulowana w rudzie magiczna energia zostanie wyzwolona i Bariera pryœnie jak mydlana bañka!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Naturalnie tak wielka iloœæ rudy przyci¹ga tutaj ró¿nych w³óczêgów i bandytów!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Dlatego potrzebujemy wielu ludzi do pilnowania naszych zapasów.
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
	description = "Chcia³bym do was do³¹czyæ!";
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
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Chcia³bym do was do³¹czyæ!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Jeœli chcesz zostaæ jednym z nas, powinieneœ porozmawiaæ z Lee albo z Laresem.
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
	description = "Chcia³bym zostaæ magiem!";
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
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Chcia³bym zostaæ magiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nie mo¿emy dzieliæ siê nasz¹ wiedz¹ z przeciwnikiem!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Dopóki nie przekonasz nas o swojej lojalnoœci, nie masz nawet o czym marzyæ - nie bêdziemy ciê uczyli!
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
	description = "Jestem teraz jednym z ludzi Laresa. Masz jak¹œ wiadomoœæ dla Magów Ognia?";
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
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Jestem teraz jednym z ludzi Laresa. Masz jak¹œ wiadomoœæ dla Magów Ognia, któr¹ móg³bym dostarczyæ do Starego Obozu?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //W rzeczy samej, mam. Ale bez specjalnego znaku kurierskiego ludzie Gomeza nie wpuszcz¹ ciê do zamku.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Masz, oto list i znak. Tylko siê pospiesz!
	
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
	description = "Dostarczy³em twoje pismo!";
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
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Dostarczy³em twoje pismo!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Ach, dobrze! Oto drobny prezent, w nagrodê za twoje trudy...
	
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
	description = "Mam wa¿n¹ wiadomoœæ dla Saturasa!";
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
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Mam wa¿n¹ wiadomoœæ dla Saturasa!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Có¿ mo¿e byæ tak wa¿nego, byœ mia³ przeszkadzaæ naszemu wielkiemu przywódcy w jego badaniach?
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
	description = "Cor Kalom opuœci³ obóz Bractwa!";
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
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom opuœci³ obóz Bractwa z grup¹ fanatycznych Stra¿ników Œwi¹tynnych!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Zamierza na w³asn¹ rêkê odnaleŸæ Œni¹cego i przebudziæ go za wszelk¹ cenê.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Nigdy nie ufa³em temu cz³owiekowi. Wielki Guru czy nie - to pró¿ny i nieszczery cz³owiek zdolny do wszystkiego.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Bractwo da sobie radê i bez niego!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Powtórzê twoje informacje Saturasowi przy najbli¿szej okazji. Mo¿esz ju¿ odejœæ!

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
	description = "Y'Berion, duchowy przywódca Bractwa Œni¹cego, nie ¿yje!";
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
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y'Berion, duchowy przywódca Bractwa Œni¹cego, nie ¿yje!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //CO?!? Jak to siê sta³o?!
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Bractwo przeprowadzi³o rytua³ przyzwania Œni¹cego.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Wygl¹da na to, ¿e Y'Berion nie by³ w stanie wytrzymaæ tak wielkiego obci¹¿enia.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //To smutna wiadomoœæ. Na Y'Berionie zawsze mo¿na by³o polegaæ.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Ale to jeszcze nie powód, ¿eby przeszkadzaæ Saturasowi.

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
	description = "Guru zorientowali siê, ¿e oddawali czeœæ potê¿nemu demonowi z piek³a rodem!";
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
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Guru zorientowali siê, ¿e oddawali czeœæ potê¿nemu demonowi z piek³a rodem!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Raptem doszli do wniosku, ¿e Œni¹cy jest demonem?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //To mi wygl¹da na kolejny szalony pomys³ ludzi z Bractwa, ale...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...Gdyby okaza³o siê, ¿e maj¹ racjê... Ca³a kolonia znalaz³aby siê w œmiertelnym niebezpieczeñstwie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Powtórzysz te informacje samemu Saturasowi. On zdecyduje co nam wypada czyniæ.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Gdzie znajdê Saturasa?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //WejdŸ na wy¿szy poziom. Powiedz stra¿nikom, ¿e pozwoli³em ci przejœæ.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Has³o brzmi TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturasa znajdziesz przy wielkim pentagramie.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //W zasadzie siê stamt¹d nie rusza. Ca³y czas obmyœla sposób na wysadzenie kopca rudy.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos pozwoli³ mi spotkaæ siê z Saturasem na górnym poziomie. Arcymistrz krêgu Wody przebywa zwykle w pobli¿u magicznego pentagramu. Has³o, które mam podaæ stra¿nikowi brzmi... Cholera, jak to sz³o?!");

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
	description = "Jak brzmia³o to has³o?";
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
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Jak brzmia³o to has³o?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Ju¿ moja œwiêtej pamiêci babcia mia³a lepsz¹ pamiêæ od ciebie. Has³o brzmi "TETRIANDOCH".
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
	description = "Saturas powiedzia³, ¿e masz dla mnie nagrodê.";
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
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas powiedzia³, ¿e masz dla mnie nagrodê.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Jako stra¿nik rudy, chcia³bym podarowaæ ci czêœæ naszego urobku jako nagrodê za zas³ugi dla Nowego Obozu.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Mam nadziejê, ¿e zrobisz z tej rudy równie dobry u¿ytek jak my!

	B_LogEntry		(CH3_BringFoci,"Dosta³em od Cronosa mnóstwo rudy, chocia¿ w porównaniu z wielkim kopcem nie jest to zbyt wiele.");
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
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //M¹drze post¹pi³eœ przystêpuj¹c do Magów Wody. B¹dŸ pozdrowiony, bracie!
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
	description		= "Potrzebujê wiêkszej mocy magicznej."; 
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
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Potrzebujê wiêkszej mocy magicznej.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Mogê ci pokazaæ, jak zwiêkszyæ twoje zdolnoœci magiczne. Jak je wykorzystasz zale¿y ju¿ tylko od ciebie.
	
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
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Poszukujê magicznych ksi¹g.
	
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
	description		= "Witaj, magu!"; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Witaj, magu!
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Niech b³ogos³awieñstwo Adanosa zawsze bêdzie z tob¹. Mogê ci pomóc zwiêkszyæ twoje magiczne moce lub zaopatrzyæ ciê w kilka po¿ytecznych przedmiotów.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Co mogê dla ciebie zrobiæ?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos sprzedaje magiczne przedmioty, takie jak runy, zwoje i pierœcienie. Znajdê go przy kracie nad wielkim kopcem rudy."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos mo¿e mi pomóc w zwiêkszeniu mojej mana. Znajdê go przy kracie, nad wielkim kopcem rudy.");
};
