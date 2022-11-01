// ****************************************
// 					FIRST 
// ****************************************

instance  GUR_1201_CorKalom_FIRST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_FIRST_Condition;
	information		= GUR_1201_CorKalom_FIRST_Info;
	permanent		= 1;
	important		= 1;
};

FUNC int  GUR_1201_CorKalom_FIRST_Condition()
{
	if (Npc_IsInState(self,ZS_TALK))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIRST_Info()
{
	AI_Output (self, other,"GUR_1201_CorKalom_FIRST_10_00"); //Czego chcesz?
	Kalom_TalkedTo = TRUE;
};  

// ****************************************
// 				Wanna Join
// ****************************************

instance  GUR_1201_CorKalom_WannaJoin (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_WannaJoin_Condition;
	information		= GUR_1201_CorKalom_WannaJoin_Info;
	permanent		= 0;
	description		= "Chciałbym przyłączyć się do Bractwa."; 
};

FUNC int  GUR_1201_CorKalom_WannaJoin_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_WannaJoin_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Chciałbym przyłączyć się do Bractwa.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Podobno jesteś zwierzchnikiem Nowicjuszy i to ty decydujesz kto zostanie przyjęty.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Nie mam teraz czasu! Moje eksperymenty są zbyt ważne, bym mógł zawracać sobie głowę nowoprzybyłymi!
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Zdam się na osąd Baalów. Jeśli oni uznają, że jesteś gotów, by do nas dołączyć zgłoś się do mnie ponownie.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Cor Kalom pozwoli mi zostać Nowicjuszem Bractwa, jeśli uda mi się przekonać do siebie czterech Baalów.");
};  

// ****************************************
// 				Kaloms Recipe
// ****************************************

instance  GUR_1201_CorKalom_Recipe (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 20;
	condition		= GUR_1201_CorKalom_Recipe_Condition;
	information		= GUR_1201_CorKalom_Recipe_Info;
	permanent		= 0;
	description		= "Kupiec ze Starego Obozu jest zainteresowany twoją recepturą."; 
};

FUNC int  GUR_1201_CorKalom_Recipe_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Recipe_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //Jeden z kupców ze Starego Obozu jest zainteresowany twoją recepturą na napój uzdrawiający.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //Moje receptury nie są na sprzedaż!

	B_LogEntry	(CH1_KalomsRecipe,"Cor Kalom nie chce dać mi swojej receptury. Ale w jego laboratorium stoją wielkie skrzynie... a on sam wyglądał na bardzo zajętego...");
};  

// ****************************************
// 				Experimente (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Experimente (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_Experimente_Condition;
	information		= GUR_1201_CorKalom_Experimente_Info;
	permanent		= 1;
	description		= "Jakie eksperymenty przeprowadzasz?"; 
};

FUNC int  GUR_1201_CorKalom_Experimente_Condition()
{
	if	(Kapitel <= 2)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Experimente_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Experimente_15_00"); //Jakie eksperymenty przeprowadzasz?
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //Moje badania dotyczą spraw, o których nie masz najmniejszego pojęcia, chłopcze, więc przestań zawracać mi głowę!
};  

// ****************************************
// Info BRINGWEED
// ****************************************

instance  GUR_1201_CorKalom_BRINGWEED (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_BRINGWEED_Condition;
	information		= GUR_1201_CorKalom_BRINGWEED_Info;
	permanent		= 1;
	description		= "Przynoszę codzienną porcję ziela!"; 
};

FUNC int  GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if	(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  GUR_1201_CorKalom_BRINGWEED_Info()
{
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //Przynoszę codzienną porcję ziela!

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //TO ma być WSZYSTKO? Masz mi przynieść przynajmniej 100 sztuk!
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ach, daj mi to. A teraz zejdź mi z oczu!

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,"Cor Kalom był równie nieprzyjemny, co zwykle. Oddałem mu zebrane na bagnach ziele.");
		Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_SUCCESS);
		B_GiveXP			(XP_DeliveredWeedHarvest);
		
		BaalOrun_FetchWeed = LOG_SUCCESS;		
		AI_StopProcessInfos	(self);
	};
};  

// ****************************************
// 				Crawlerzangen (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Crawlerzangen (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 800;
	condition		= GUR_1201_CorKalom_Crawlerzangen_Condition;
	information		= GUR_1201_CorKalom_Crawlerzangen_Info;
	permanent		= 1;
	description		= "Mam dla ciebie wnętrzności pełzaczy..."; 
};

FUNC int  GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if (Npc_HasItems(other, ItAt_Crawler_01)>0)
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_Crawlerzangen_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //Przyniosłem ci wnętrzności pełzaczy.
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Wspaniale. W nagrodę możesz sobie wziąć jeden z moich najlepszych wywarów.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Świetnie. Weź sobie w nagrodę kilka moich wywarów.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. Tylko tyle? Masz tu napój mana i zejdź mi z oczu.
		CreateInvItems(self, ItFo_Potion_Mana_01, 1);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_01, 1);
		AI_StopProcessInfos(self);
	};
	
	B_GiveInvItems(other, self, ItAt_Crawler_01, Npc_HasItems(other,ItAt_Crawler_01));
}; 




// ****************************************
// 				Join PSI
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI_Condition;
	information		= GUR_1201_CorKalom_JoinPSI_Info;
	permanent		= 1;
	description		= "Chyba udało mi się przekonać Baalów!"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	Npc_KnowsInfo(hero, GUR_1201_CorKalom_WannaJoin) 
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	counter = 0;	//Counter löschen, da er noch den Stand der letzten Analyse hat!
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //Chyba udało mi się przekonać Baalów!
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun uważa, że jestem godnym sługą Śniącego.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Mów dalej...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar ma mnie za pojętnego ucznia.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib jest przekonany co do szczerości mojej wiary.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Dzięki mnie, Baal Tyon przeżył objawienie.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //I?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral uważa, że powinienem zostać przyjęty. Przyprowadziłem mu nowego ucznia.
		counter = counter + 1;
	};
	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Dobrze. Jeśli Baalowie przemawiają za tobą, to mi wystarczy.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Masz. Załóż to. A teraz idź robić coś pożytecznego.
	
			// Ernennung zum Novizen
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,"Dziś Cor Kalom przyjął mnie w poczet Nowicjuszy. Był jak zwykle wredny, ale teraz jestem przynajmniej pełnoprawnym członkiem Bractwa Śniącego.");
			B_LogEntry			(GE_TraderPSI,"Powinienem odebrać szatę Nowicjusza u Baal Namiba.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinOC,"Odkąd zgodziłem się przystać do Bractwa Śniącego nie mogę już liczyć na zostanie przyjętym Cieni Gomeza.");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinNC,"Nie mogę dołączyć do Szkodników z Nowego Obozu. Moje miejsce jest w Bractwie Śniącego.");
			
			//Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //I?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //To już wszystko.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Marnujesz tylko mój cenny czas. Wróć kiedy uda ci się przekonać do siebie co najmniej czterech Baalów!
		};
	}
	else
	{	
		B_PrintGuildCondition(5);
	};
};

// ****************************************
// 				Join PSI2
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI2 (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI2_Condition;
	information		= GUR_1201_CorKalom_JoinPSI2_Info;
	permanent		= 0;
	description		= "Tylko tyle? Żadnego powitania, ani nic?"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI2_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //Tylko tyle? Żadnego powitania, ani nic?
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Witamy.
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //O wiele lepiej.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Przestań się tu kręcić. Zrób coś pożytecznego. Zanieś to ziele do Starego Obozu i daj je Gomezowi.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Gdyby jego siepacze stwarzali ci jakieś problemy, powiedz, że przysyła cię Cor Kalom.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,"Cor Kalom kazał mi dostarczyć partię bagiennego ziela do Gomeza ze Starego Obozu."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Jeszcze tu jesteś?!
	AI_StopProcessInfos	(self);
};  

// **************************************************************************
// 							MISSION: 	Drug Monopol
// **************************************************************************



// --------------------------------------------------------------------------

INSTANCE Info_Kalom_DrugMonopol (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_DrugMonopol_Condition;
	information	= Info_Kalom_DrugMonopol_Info;
	permanent 	= 0; 
	description = "Masz dla mnie jeszcze jakieś zadanie?";
};


FUNC INT Info_Kalom_DrugMonopol_Condition()
{
	if (Npc_GetTrueGuild(other)==GIL_NOV)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_DrugMonopol_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //Masz dla mnie jeszcze jakieś zadania?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //W Nowym Obozie kilku ludzi zaczęło uprawę ziela na własną rękę.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Chcę, żebyś położył temu kres.
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Jak...
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //To już nie moja sprawa!
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //Ich obozowisko musi znajdować się gdzieś w pobliżu Nowego Obozu. Wiesz, co masz zrobić...

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,"Cor Kalom kazał mi przeciwdziałać wytwarzaniu ziela w Nowym Obozie. Nie wiem jeszcze gdzie mam zacząć, ale powinienem czym prędzej udać się do Nowego Obozu.");

	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

// **************************************************************************
// 							SUCCESS
// **************************************************************************

INSTANCE Info_Kalom_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_Success_Condition;
	information	= Info_Kalom_Success_Info;
	permanent	= 1;
	description = "Wracając do produkcji ziela w Nowym Obozie...";
};


FUNC INT Info_Kalom_Success_Condition()
{
	if	(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_Success_Info()
{
	var C_NPC Killian; 	Killian = Hlp_GetNpc(ORG_861_Killian);
	var C_NPC Renyu; 	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	var C_NPC Jacko; 	Jacko = Hlp_GetNpc(ORG_862_Jacko);
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //Wracając do produkcji ziela w Nowym Obozie...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //Tak?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //Nie mogę znaleźć tych ludzi.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //Cóż, mogłem się tego po tobie spodziewać.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Już po kłopocie.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //Zaskakujesz mnie. Chyba cię trochę niedoceniałem. Może jednak będzie z ciebie jakiś pożytek.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,"Poinformowałem Cor Kaloma o powstrzymaniu konkurencyjnej produkcji ziela. Był równie 'miły' jak zwykle.");
		Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_SUCCESS);
		B_GiveXP			(XP_DrugMonopol);
	};
};

// ****************************************************************
// 							KRAUTBOTE ZURÜCK
// ****************************************************************

INSTANCE Info_Kalom_KrautboteBACK(C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr 			= 1;
	condition	= Info_Kalom_KrautboteBACK_Condition;
	information	= Info_Kalom_KrautboteBACK_Info;
	permanent 	= 1;
	description = "Dostarczyłem przesyłkę.";
};

func INT Info_Kalom_KrautboteBACK_Condition()
{
	if	Kalom_DeliveredWeed
	{
		return TRUE;
	};
};

FUNC VOID Info_Kalom_KrautboteBACK_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //Dostarczyłem przesyłkę.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //To dobrze. Poszukaj sobie jakiegoś nowego zajęcia.

		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,"Cor Kalom otrzymał pieniądze za bagienne ziele dostarczone przeze mnie do Starego Obozu.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Gdzie jest 500 bryłek rudy, chłopcze? Lepiej się pospiesz. Nie będę długo czekał.
	}; 
};














// **************************************************************************
//
// 									KAPITEL 2
//
// **************************************************************************
instance Info_CorKalom_BringFocus (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringFocus_Condition;
	information	= Info_CorKalom_BringFocus_Info;
	permanent	= 0;
	important 	= 0;
	description = "Przysyła mnie Y'Berion. Mam kamień ogniskujący.";
};

FUNC INT Info_CorKalom_BringFocus_Condition()
{	
	if  (YBerion_BringFocus == LOG_SUCCESS) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BringFocus_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Przysyła mnie Y'Berion. Mam kamień ogniskujący.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ach, kamień ogniskujący... Nareszcie mogę zbadać magiczną naturę tego artefaktu. 
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Gdybym tylko miał dość wydzieliny... Niech to piekło pochłonie!
	
	B_LogEntry		(CH2_Focus,"Dostarczyłem kamień ogniskujący Cor Kalomowi!");		
	Log_SetTopicStatus	(CH2_Focus,	LOG_SUCCESS);
	
	B_GiveInvItems	    (hero, self, Focus_1, 1);
	Npc_RemoveInvItem   (self, Focus_1);
	B_GiveXP			(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung für Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 10;
	condition	= Info_CorKalom_BLUFF_Condition;
	information	= Info_CorKalom_BLUFF_Info;
	permanent	= 0;
	description = "Y'Berion powiedział, że wynagrodzisz mnie za dostarczenie kamienia!";
};

FUNC INT Info_CorKalom_BLUFF_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringFocus)) 
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BLUFF_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y'Berion powiedział, że wynagrodzisz mnie za dostarczenie kamienia!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Czyżby? Tak powiedział? No tak. 50 bryłek rudy chyba wystarczy?
	
	CreateInvItems (self,Itminugget,50);
	B_GiveInvItems (self, other, Itminugget,50);
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_SACHE (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_SACHE_Condition;
	information		= GUR_1201_CorKalom_SACHE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wydzieliny?"; 
};

FUNC int  GUR_1201_CorKalom_SACHE_Condition()
{	
	if (Npc_KnowsInfo ( hero,Info_CorKalom_BringFocus))
	{
		return 1;
	};

};
FUNC VOID  GUR_1201_CorKalom_SACHE_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //Wydzieliny?
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Tak. Jak zapewne wiesz, przygotowuję magiczne wywary, które pozwolą nam nawiązać kontakt ze Śniącym. Jednak do tego celu potrzebuję dużych ilości wydzieliny z wnętrzności pełzaczy.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //Wiesz, co to są pełzacze, prawda?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Nie",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Tak.",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Nie.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //To bardzo groźne istoty zamieszkujące mroczne korytarze kopalni. Pełzacze często atakują pracujących tam górników.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Ich wnętrzności zawierają szczególną wydzielinę.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //Wykorzystuję ją do wytwarzania napoju, który otwiera przed nami duchową ścieżkę do Śniącego.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Tak.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //To świetnie!
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_VISION (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_VISION_Condition;
	information		= GUR_1201_CorKalom_VISION_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mów dalej..."; 
};

FUNC int  GUR_1201_CorKalom_VISION_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};

};
FUNC void  GUR_1201_CorKalom_VISION_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_01"); //Mów dalej...
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Cóż, jakiś czas temu Śniący objawił mi się osobiście i dał mi znak.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Dał mi do zrozumienia, że istnieje inny sposób, nie wymagający wydzieliny z wnętrzności pełzaczy.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //I wybrał mnie, bym przekazał komuś jego zalecenia. Nie wypełniasz tego zadania dla mnie! To polecenie samego Śniącego!
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //To niemożliwe!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Milcz, głupcze!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Dał mi do zrozumienia, że wybraliśmy właściwą drogę, ale dysponujemy niewystarczającymi środkami.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Oznacza to, że WŁAŚCIWE środki znajdziemy u pełzaczy, ale sama wydzielina z wnętrzności to za mało.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Musi być coś jeszcze.
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nie przeprowadzaliście żadnych badań na pełzaczach?"; 
};

FUNC int  GUR_1201_CorKalom_NEST_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_VISION))
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_NEST_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Nie przeprowadzaliście żadnych badań na pełzaczach? Może jakaś część ich ciała zawiera większe ilości wydzieliny od innych?
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Oczywiście, zbadaliśmy kilka martwych pełzaczy, ale wydzielina zdaje się być gromadzona wyłącznie w ich gruczołach jadowych.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //To musi być coś innego. Znajdź ich gniazdo, a poznasz odpowiedź!

	CorKalom_BringMCQBalls = LOG_RUNNING;

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,"Guru Cor Kalom poprosił mnie, bym odnalazł dla niego silniejszą wydzielinę pełzaczy. Do tej pory pozyskiwano ją z wnętrzności potworów, ale Kalom uważa, że można ją pozyskać w inny sposób.");

	if (PresseTourJanuar2001)
	{
		CreateInvItems	(hero,	ItAt_Crawlerqueen,	3);
	};
};


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_WEG (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_WEG_Condition;
	information		= GUR_1201_CorKalom_WEG_Info;
	nr				= 21;
	important		= 0;
	permanent		= 0;
	description		= "To ci dopiero będzie mroczna wyprawa."; 
};

FUNC int  GUR_1201_CorKalom_WEG_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_RAT)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_WEG_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //To ci dopiero będzie mroczna wyprawa.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Weź te zwoje. Znajdziesz na nich magiczne formuły zaklęcia Światła. Przydadzą ci się w nieoświetlonych szybach.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Świątynni Strażnicy z kopalni będą ci służyć pomocą.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //Oby Śniący dodał ci sił. Niech jego blask rozświetla twą drogę, gdziekolwiek się udajesz!

	CreateInvItems		(self, ItArScrollLight, 5);
	B_GiveInvItems      (self, other, ItArScrollLight, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RAT (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RAT_Condition;
	information		= GUR_1201_CorKalom_RAT_Info;
	nr				= 20;
	important		= 0;
	permanent		= 0;
	description		= "Widzę, że nie obejdzie się bez przelewu krwi."; 
};

FUNC int  GUR_1201_CorKalom_RAT_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_WEG)) 
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_RAT_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Widzę, że nie obejdzie się bez rozlewu krwi.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Weź ze sobą te wywary.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Nie dostajesz ich ode mnie dlatego, że zależy mi na twoim życiu, tylko ze względu na rangę zadania.

	CreateInvItems		(self, ItFo_Potion_Health_02, 5);
	B_GiveInvItems      (self, other, ItFo_Potion_Health_02, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RUN (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RUN_Condition;
	information		= GUR_1201_CorKalom_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie znajdę te pełzacze?"; 
};

FUNC int  GUR_1201_CorKalom_RUN_Condition()
{	
	if ((CorKalom_BringMCQBalls == LOG_RUNNING) 
	&&	(Npc_HasItems(hero, ItAt_Crawlerqueen)< 1)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_RUN_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Gdzie znajdę te pełzacze?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //W Starej Kopalni.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //A gdzie leży Stara Kopalnia?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Weź tę mapę. Zaznaczono na niej wszystkie ważniejsze miejsca wewnątrz Bariery.
		CreateInvItem	(self,ItWrWorldmap);   
		B_GiveInvItems  (self, other, ItWrWorldmap, 1);
	};
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_CRAWLER (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_CRAWLER_Condition;
	information		= GUR_1201_CorKalom_CRAWLER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak należy walczyć z pełzaczami?"; 
};

FUNC int  GUR_1201_CorKalom_CRAWLER_Condition()
{
	if Npc_KnowsInfo (hero, GUR_1201_CorKalom_RUN)
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
	return 1;
	};
};


FUNC void  GUR_1201_CorKalom_CRAWLER_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Jak należy walczyć z pełzaczami?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //W kopalni spotkasz kilku naszych Strażników polujących na pełzacze dla ich wydzieliny. Porozmawiaj z Gor Na Videm, on ci pomoże.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mam odnaleźć gniazdo pełzaczy?"; 
};

FUNC int  GUR_1201_CorKalom_FIND_Condition()
{
	if ( Npc_KnowsInfo (hero, GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIND_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Jak mam odnaleźć gniazdo pełzaczy?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //To najtrudniejsza część zadania. Nie wiem, gdzie powinieneś szukać, ani czego. Ale Śniący wskaże ci drogę w odpowiednim momencie.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //To ci dopiero pocieszenie.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "Znalazłem jaja złożone przez królową pełzaczy.";
};                       

FUNC INT Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if (  Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3 )
	{
		return 1;
	};
};
FUNC VOID Info_CorKalom_BringMCQBalls_Success_Info()
{	
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Znalazłem jaja złożone przez królową pełzaczy.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Wiedziałem! Moja wizja była znakiem od Śniącego! Te jaja z pewnością zawierają silną wydzielinę!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //Świetnie. Dzięki nim przygotuję napój, który pozwoli nam nawiązać kontakt ze Śniącym!
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //A co z moją nagrodą?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //A, tak... Dziękuję.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Wolałbym jakąś NAMACALNĄ nagrodę!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Dobrze już! Czego chcesz?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,"Dałem Cor Kalomowi trzy jaja pełzaczy. Był wyjątkowo nieprzyjemny. Musiałem się domagać należnej mi nagrody!");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp,"Chyba wiem już wystarczająco wiele o wydarzeniach w obozie Bractwa. Powinienem skontaktować się z Mordragiem.");
	B_LogEntry	(CH1_GotoPsi,"Chyba wiem już wystarczająco wiele o wydarzeniach w obozie Bractwa. Powinienem skontaktować się z Krukiem.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi runę.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi oręż.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi napój uzdrawiający.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Wystarczy mi ruda.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Może być mana.",Info_CorKalom_BringMCQBalls_Success_MANA);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Daj mi jakąś runę.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //Niech ta runa rozświetla twą drogę!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Daj mi jakiś oręż.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //Niech ten oręż sieje śmierć w szeregach twoich wrogów!
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Daj mi napój uzdrawiający.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //Niech ten napój przedłuży twoje życie.
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Wystarczy mi ruda.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Przyjmij tę rudę jako oznakę wdzięczności całego Bractwa!
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Może być mana.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //Niech ten napój wzmocni drzemiącą w tobie magię.
	CreateInvItem		(self,ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	

// **************************************************************************
// 				MISSION: Bring Book
// **************************************************************************
INSTANCE Info_CorKalom_BringBook (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Condition;
	information	= Info_CorKalom_BringBook_Info;
	permanent	= 0;
	description = "Czy możemy teraz przystąpić do przywołania Śniącego?";
};

func INT Info_CorKalom_BringBook_Condition()
{
	if ( CorKalom_BringMCQBalls == LOG_SUCCESS )
	{
		return 1;
	};	
};
func VOID Info_CorKalom_BringBook_Info()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //Czy możemy teraz przystąpić do przywołania Śniącego?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //Nie! Nie udało mi się jeszcze znaleźć sposobu na naładowanie kamienia ogniskującego.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Niestety, nie dysponujemy starożytną wiedzą na temat tych artefaktów.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //Chcesz powiedzieć, że zdobyłem te jaja na próżno?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //Nie. Posłuchaj: istnieje prastary almanach zawierający potrzebne nam informacje.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Odkupiliśmy go od Corristo, jednego z Magów Ognia ze Starego Obozu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //Niestety, został nam skradziony w drodze ze Starego Obozu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //Kazałem Talasowi, jednemu z Nowicjuszy, dostarczyć mi tę księgę, ale ten głupiec pozwolił się okraść.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Zawiódł mnie, ale postanowiłem dać mu drugą szansę. Ma odzyskać almanach.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Porozmawiaj z nim. Przyda mu się każda pomoc.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,"Cor Kalom potrzebuje jeszcze jednego artefaktu, by ukończyć swe dzieło. To starożytna księga zawierająca wskazówki dotyczące kamieni ogniskujących. Niestety, przenoszący ją Nowicjusz Talas pozwolił się okraść goblinom. Teraz kręci się po świątynnym dziedzińcu szukając kogoś, kto pomoże mu odzyskać księgę.");

	Info_ClearChoices (Info_CorKalom_BringBook);
	
	Info_Addchoice(Info_CorKalom_BringBook,DIALOG_BACK						,Info_CorKalom_BringBook_BACK);
	Info_Addchoice(Info_CorKalom_BringBook,"Co dostanę w zamian?",Info_CorKalom_BringBook_EARN);
	Info_Addchoice(Info_CorKalom_BringBook,"Kto ukradł tę księgę?",Info_CorKalom_BringBook_WHO);
	Info_Addchoice(Info_CorKalom_BringBook,"Gdzie znajdę Talasa?",Info_CorKalom_BringBook_WHERE);
};
func void Info_CorKalom_BringBook_BACK ()
{
	Info_ClearChoices (Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Where_15_01"); //Gdzie znajdę Talasa?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Powinien być u stóp świątyni. Próbuje zjednać sobie kogoś do pomocy.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //Kto ukradł tę księgę?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas twierdzi, że został obrabowany przez Czarne Gobliny. Brzmi nieprawdopodobnie, ale mogło się tak zdarzyć...
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //Co dostanę w zamian?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //Czyż nie przekonałem cię już o mojej hojności? Otrzymasz nagrodę odpowiednią do rangi zadania.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "Znalazłem twoją księgę.";
};                       

FUNC INT Info_CorKalom_BringBook_Success_Condition()
{	
	if (	Npc_HasItems (Hero,ItWrFokusbuch)
	&&		(CorKalom_BringBook==LOG_RUNNING)	)
	{
		return 1 ; 
	};
};
FUNC VOID Info_CorKalom_BringBook_Success_Info()
{	
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //Znalazłem twoją księgę.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //Dobra robota. Teraz mamy wszystkie potrzebne składniki.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //Zajmę się teraz przygotowaniami.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //Kiedy odbędzie się wielkie przywołanie?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //Zaczekaj do wieczora, wtedy przyjdź na dziedziniec świątyni. Tam się zbierzemy i spróbujemy przywołać Śniącego.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

	B_LogEntry		(CH2_Book,"Zaniosłem almanach Cor Kalomowi, który przygotowuje teraz Bractwo do rytuału przyzwania Śniącego. Ceremonia odbędzie się w nocy, na świątynnym dziedzińcu.");
	Log_SetTopicStatus	(CH2_Book,	LOG_SUCCESS);

	//-------- Gurus und Novizen auf dem Tempelvorplatz versammeln --------
	AI_StopProcessInfos	(self);

	B_Story_PrepareRitual();
};


// ----------------------------BELOHNUNG ---------------------------------------
instance Info_CorKalom_Belohnung (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 1;
	condition	= Info_CorKalom_Belohnung_Condition;
	information	= Info_CorKalom_Belohnung_Info;
	permanent	= 0;
	description = "Co z moją zapłatą?";
};                       

FUNC INT Info_CorKalom_Belohnung_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringBook_Success) )
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_Belohnung_Info()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//Co z moją zapłatą?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//A czego chcesz?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Daj mi te zwoje z zaklęciami.",Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Wystarczy mi ruda.",Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Daj mi napoje mana.",Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Daj mi te zwoje z zaklęciami.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Wykorzystaj je mądrze.
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Wystarczy mi ruda.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//To powinno zaspokoić twoją chciwość.
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Daj mi napoje mana.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//Niech te napoje dodadzą ci sił!
	CreateInvItems 		(self,ItFo_Potion_Mana_02,5);
	B_GiveInvItems      (self,hero,ItFo_Potion_Mana_02,5);
	Info_ClearChoices	(Info_CorKalom_Belohnung);
};

// ************************ EXIT **************************************************************************

instance  GUR_1201_CorKalom_Exit (C_INFO)
{
	npc			=  GUR_1201_CorKalom;
	nr			=  999;
	condition	=  GUR_1201_CorKalom_Exit_Condition;
	information	=  GUR_1201_CorKalom_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

FUNC VOID  GUR_1201_CorKalom_Exit_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_Exit_15_01"); //Do zobaczenia.
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //Oby Śniący wskazał ci właściwą drogę.
	
	AI_StopProcessInfos	( self );
};
// *******************************************************************************************************



