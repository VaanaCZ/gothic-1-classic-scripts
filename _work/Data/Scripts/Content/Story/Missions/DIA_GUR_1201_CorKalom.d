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
	description		= "Chcia³bym przy³¹czyæ siê do Bractwa."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Chcia³bym przy³¹czyæ siê do Bractwa.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Podobno jesteœ zwierzchnikiem Nowicjuszy i to ty decydujesz kto zostanie przyjêty.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Nie mam teraz czasu! Moje eksperymenty s¹ zbyt wa¿ne, bym móg³ zawracaæ sobie g³owê nowoprzyby³ymi!
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Zdam siê na os¹d Baalów. Jeœli oni uznaj¹, ¿e jesteœ gotów, by do nas do³¹czyæ zg³oœ siê do mnie ponownie.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Cor Kalom pozwoli mi zostaæ Nowicjuszem Bractwa, jeœli uda mi siê przekonaæ do siebie czterech Baalów.");
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
	description		= "Kupiec ze Starego Obozu jest zainteresowany twoj¹ receptur¹."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //Jeden z kupców ze Starego Obozu jest zainteresowany twoj¹ receptur¹ na napój uzdrawiaj¹cy.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //Moje receptury nie s¹ na sprzeda¿!

	B_LogEntry	(CH1_KalomsRecipe,"Cor Kalom nie chce daæ mi swojej receptury. Ale w jego laboratorium stoj¹ wielkie skrzynie... a on sam wygl¹da³ na bardzo zajêtego...");
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
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //Moje badania dotycz¹ spraw, o których nie masz najmniejszego pojêcia, ch³opcze, wiêc przestañ zawracaæ mi g³owê!
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
	description		= "Przynoszê codzienn¹ porcjê ziela!"; 
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
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //Przynoszê codzienn¹ porcjê ziela!

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //TO ma byæ WSZYSTKO? Masz mi przynieœæ przynajmniej 100 sztuk!
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ach, daj mi to. A teraz zejdŸ mi z oczu!

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,"Cor Kalom by³ równie nieprzyjemny, co zwykle. Odda³em mu zebrane na bagnach ziele.");
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
	description		= "Mam dla ciebie wnêtrznoœci pe³zaczy..."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //Przynios³em ci wnêtrznoœci pe³zaczy.
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Wspaniale. W nagrodê mo¿esz sobie wzi¹æ jeden z moich najlepszych wywarów.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Œwietnie. WeŸ sobie w nagrodê kilka moich wywarów.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. Tylko tyle? Masz tu napój mana i zejdŸ mi z oczu.
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
	description		= "Chyba uda³o mi siê przekonaæ Baalów!"; 
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
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //Chyba uda³o mi siê przekonaæ Baalów!
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun uwa¿a, ¿e jestem godnym s³ug¹ Œni¹cego.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Mów dalej...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar ma mnie za pojêtnego ucznia.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib jest przekonany co do szczeroœci mojej wiary.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Dziêki mnie, Baal Tyon prze¿y³ objawienie.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //I?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral uwa¿a, ¿e powinienem zostaæ przyjêty. Przyprowadzi³em mu nowego ucznia.
		counter = counter + 1;
	};
	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Dobrze. Jeœli Baalowie przemawiaj¹ za tob¹, to mi wystarczy.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Masz. Za³ó¿ to. A teraz idŸ robiæ coœ po¿ytecznego.
	
			// Ernennung zum Novizen
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,"Dziœ Cor Kalom przyj¹³ mnie w poczet Nowicjuszy. By³ jak zwykle wredny, ale teraz jestem przynajmniej pe³noprawnym cz³onkiem Bractwa Œni¹cego.");
			B_LogEntry			(GE_TraderPSI,"Powinienem odebraæ szatê Nowicjusza u Baal Namiba.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinOC,"Odk¹d zgodzi³em siê przystaæ do Bractwa Œni¹cego nie mogê ju¿ liczyæ na zostanie przyjêtym Cieni Gomeza.");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinNC,"Nie mogê do³¹czyæ do Szkodników z Nowego Obozu. Moje miejsce jest w Bractwie Œni¹cego.");
			
			//Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //I?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //To ju¿ wszystko.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Marnujesz tylko mój cenny czas. Wróæ kiedy uda ci siê przekonaæ do siebie co najmniej czterech Baalów!
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
	description		= "Tylko tyle? ¯adnego powitania, ani nic?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //Tylko tyle? ¯adnego powitania, ani nic?
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Witamy.
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //O wiele lepiej.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Przestañ siê tu krêciæ. Zrób coœ po¿ytecznego. Zanieœ to ziele do Starego Obozu i daj je Gomezowi.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Gdyby jego siepacze stwarzali ci jakieœ problemy, powiedz, ¿e przysy³a ciê Cor Kalom.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,"Cor Kalom kaza³ mi dostarczyæ partiê bagiennego ziela do Gomeza ze Starego Obozu."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Jeszcze tu jesteœ?!
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
	description = "Masz dla mnie jeszcze jakieœ zadanie?";
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
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //Masz dla mnie jeszcze jakieœ zadania?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //W Nowym Obozie kilku ludzi zaczê³o uprawê ziela na w³asn¹ rêkê.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Chcê, ¿ebyœ po³o¿y³ temu kres.
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Jak...
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //To ju¿ nie moja sprawa!
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //Ich obozowisko musi znajdowaæ siê gdzieœ w pobli¿u Nowego Obozu. Wiesz, co masz zrobiæ...

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,"Cor Kalom kaza³ mi przeciwdzia³aæ wytwarzaniu ziela w Nowym Obozie. Nie wiem jeszcze gdzie mam zacz¹æ, ale powinienem czym prêdzej udaæ siê do Nowego Obozu.");

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
	description = "Wracaj¹c do produkcji ziela w Nowym Obozie...";
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
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //Wracaj¹c do produkcji ziela w Nowym Obozie...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //Tak?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //Nie mogê znaleŸæ tych ludzi.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //Có¿, mog³em siê tego po tobie spodziewaæ.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Ju¿ po k³opocie.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //Zaskakujesz mnie. Chyba ciê trochê niedocenia³em. Mo¿e jednak bêdzie z ciebie jakiœ po¿ytek.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,"Poinformowa³em Cor Kaloma o powstrzymaniu konkurencyjnej produkcji ziela. By³ równie 'mi³y' jak zwykle.");
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
	description = "Dostarczy³em przesy³kê.";
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
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //Dostarczy³em przesy³kê.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //To dobrze. Poszukaj sobie jakiegoœ nowego zajêcia.

		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,"Cor Kalom otrzyma³ pieni¹dze za bagienne ziele dostarczone przeze mnie do Starego Obozu.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Gdzie jest 500 bry³ek rudy, ch³opcze? Lepiej siê pospiesz. Nie bêdê d³ugo czeka³.
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
	description = "Przysy³a mnie Y'Berion. Mam kamieñ ogniskuj¹cy.";
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
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Przysy³a mnie Y'Berion. Mam kamieñ ogniskuj¹cy.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ach, kamieñ ogniskuj¹cy... Nareszcie mogê zbadaæ magiczn¹ naturê tego artefaktu. 
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Gdybym tylko mia³ doœæ wydzieliny... Niech to piek³o poch³onie!
	
	B_LogEntry		(CH2_Focus,"Dostarczy³em kamieñ ogniskuj¹cy Cor Kalomowi!");		
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
	description = "Y'Berion powiedzia³, ¿e wynagrodzisz mnie za dostarczenie kamienia!";
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
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y'Berion powiedzia³, ¿e wynagrodzisz mnie za dostarczenie kamienia!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Czy¿by? Tak powiedzia³? No tak. 50 bry³ek rudy chyba wystarczy?
	
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
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Tak. Jak zapewne wiesz, przygotowujê magiczne wywary, które pozwol¹ nam nawi¹zaæ kontakt ze Œni¹cym. Jednak do tego celu potrzebujê du¿ych iloœci wydzieliny z wnêtrznoœci pe³zaczy.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //Wiesz, co to s¹ pe³zacze, prawda?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Nie",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Tak.",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Nie.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //To bardzo groŸne istoty zamieszkuj¹ce mroczne korytarze kopalni. Pe³zacze czêsto atakuj¹ pracuj¹cych tam górników.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Ich wnêtrznoœci zawieraj¹ szczególn¹ wydzielinê.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //Wykorzystujê j¹ do wytwarzania napoju, który otwiera przed nami duchow¹ œcie¿kê do Œni¹cego.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Tak.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //To œwietnie!
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
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Có¿, jakiœ czas temu Œni¹cy objawi³ mi siê osobiœcie i da³ mi znak.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Da³ mi do zrozumienia, ¿e istnieje inny sposób, nie wymagaj¹cy wydzieliny z wnêtrznoœci pe³zaczy.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //I wybra³ mnie, bym przekaza³ komuœ jego zalecenia. Nie wype³niasz tego zadania dla mnie! To polecenie samego Œni¹cego!
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //To niemo¿liwe!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Milcz, g³upcze!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Da³ mi do zrozumienia, ¿e wybraliœmy w³aœciw¹ drogê, ale dysponujemy niewystarczaj¹cymi œrodkami.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Oznacza to, ¿e W£AŒCIWE œrodki znajdziemy u pe³zaczy, ale sama wydzielina z wnêtrznoœci to za ma³o.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Musi byæ coœ jeszcze.
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nie przeprowadzaliœcie ¿adnych badañ na pe³zaczach?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Nie przeprowadzaliœcie ¿adnych badañ na pe³zaczach? Mo¿e jakaœ czêœæ ich cia³a zawiera wiêksze iloœci wydzieliny od innych?
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Oczywiœcie, zbadaliœmy kilka martwych pe³zaczy, ale wydzielina zdaje siê byæ gromadzona wy³¹cznie w ich gruczo³ach jadowych.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //To musi byæ coœ innego. ZnajdŸ ich gniazdo, a poznasz odpowiedŸ!

	CorKalom_BringMCQBalls = LOG_RUNNING;

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,"Guru Cor Kalom poprosi³ mnie, bym odnalaz³ dla niego silniejsz¹ wydzielinê pe³zaczy. Do tej pory pozyskiwano j¹ z wnêtrznoœci potworów, ale Kalom uwa¿a, ¿e mo¿na j¹ pozyskaæ w inny sposób.");

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
	description		= "To ci dopiero bêdzie mroczna wyprawa."; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //To ci dopiero bêdzie mroczna wyprawa.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //WeŸ te zwoje. Znajdziesz na nich magiczne formu³y zaklêcia Œwiat³a. Przydadz¹ ci siê w nieoœwietlonych szybach.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Œwi¹tynni Stra¿nicy z kopalni bêd¹ ci s³u¿yæ pomoc¹.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //Oby Œni¹cy doda³ ci si³. Niech jego blask rozœwietla tw¹ drogê, gdziekolwiek siê udajesz!

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
	description		= "Widzê, ¿e nie obejdzie siê bez przelewu krwi."; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Widzê, ¿e nie obejdzie siê bez rozlewu krwi.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //WeŸ ze sob¹ te wywary.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Nie dostajesz ich ode mnie dlatego, ¿e zale¿y mi na twoim ¿yciu, tylko ze wzglêdu na rangê zadania.

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
	description		= "Gdzie znajdê te pe³zacze?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Gdzie znajdê te pe³zacze?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //W Starej Kopalni.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //A gdzie le¿y Stara Kopalnia?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //WeŸ tê mapê. Zaznaczono na niej wszystkie wa¿niejsze miejsca wewn¹trz Bariery.
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
	description		= "Jak nale¿y walczyæ z pe³zaczami?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Jak nale¿y walczyæ z pe³zaczami?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //W kopalni spotkasz kilku naszych Stra¿ników poluj¹cych na pe³zacze dla ich wydzieliny. Porozmawiaj z Gor Na Videm, on ci pomo¿e.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mam odnaleŸæ gniazdo pe³zaczy?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Jak mam odnaleŸæ gniazdo pe³zaczy?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //To najtrudniejsza czêœæ zadania. Nie wiem, gdzie powinieneœ szukaæ, ani czego. Ale Œni¹cy wska¿e ci drogê w odpowiednim momencie.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //To ci dopiero pocieszenie.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "Znalaz³em jaja z³o¿one przez królow¹ pe³zaczy.";
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
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Znalaz³em jaja z³o¿one przez królow¹ pe³zaczy.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Wiedzia³em! Moja wizja by³a znakiem od Œni¹cego! Te jaja z pewnoœci¹ zawieraj¹ siln¹ wydzielinê!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //Œwietnie. Dziêki nim przygotujê napój, który pozwoli nam nawi¹zaæ kontakt ze Œni¹cym!
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //A co z moj¹ nagrod¹?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //A, tak... Dziêkujê.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Wola³bym jak¹œ NAMACALN¥ nagrodê!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Dobrze ju¿! Czego chcesz?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,"Da³em Cor Kalomowi trzy jaja pe³zaczy. By³ wyj¹tkowo nieprzyjemny. Musia³em siê domagaæ nale¿nej mi nagrody!");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp,"Chyba wiem ju¿ wystarczaj¹co wiele o wydarzeniach w obozie Bractwa. Powinienem skontaktowaæ siê z Mordragiem.");
	B_LogEntry	(CH1_GotoPsi,"Chyba wiem ju¿ wystarczaj¹co wiele o wydarzeniach w obozie Bractwa. Powinienem skontaktowaæ siê z Krukiem.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi runê.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi orê¿.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Daj mi napój uzdrawiaj¹cy.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Wystarczy mi ruda.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Mo¿e byæ mana.",Info_CorKalom_BringMCQBalls_Success_MANA);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Daj mi jak¹œ runê.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //Niech ta runa rozœwietla tw¹ drogê!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Daj mi jakiœ orê¿.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //Niech ten orê¿ sieje œmieræ w szeregach twoich wrogów!
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Daj mi napój uzdrawiaj¹cy.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //Niech ten napój przed³u¿y twoje ¿ycie.
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Wystarczy mi ruda.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Przyjmij tê rudê jako oznakê wdziêcznoœci ca³ego Bractwa!
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Mo¿e byæ mana.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //Niech ten napój wzmocni drzemi¹c¹ w tobie magiê.
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
	description = "Czy mo¿emy teraz przyst¹piæ do przywo³ania Œni¹cego?";
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
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //Czy mo¿emy teraz przyst¹piæ do przywo³ania Œni¹cego?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //Nie! Nie uda³o mi siê jeszcze znaleŸæ sposobu na na³adowanie kamienia ogniskuj¹cego.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Niestety, nie dysponujemy staro¿ytn¹ wiedz¹ na temat tych artefaktów.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //Chcesz powiedzieæ, ¿e zdoby³em te jaja na pró¿no?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //Nie. Pos³uchaj: istnieje prastary almanach zawieraj¹cy potrzebne nam informacje.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Odkupiliœmy go od Corristo, jednego z Magów Ognia ze Starego Obozu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //Niestety, zosta³ nam skradziony w drodze ze Starego Obozu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //Kaza³em Talasowi, jednemu z Nowicjuszy, dostarczyæ mi tê ksiêgê, ale ten g³upiec pozwoli³ siê okraœæ.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Zawiód³ mnie, ale postanowi³em daæ mu drug¹ szansê. Ma odzyskaæ almanach.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Porozmawiaj z nim. Przyda mu siê ka¿da pomoc.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,"Cor Kalom potrzebuje jeszcze jednego artefaktu, by ukoñczyæ swe dzie³o. To staro¿ytna ksiêga zawieraj¹ca wskazówki dotycz¹ce kamieni ogniskuj¹cych. Niestety, przenosz¹cy j¹ Nowicjusz Talas pozwoli³ siê okraœæ goblinom. Teraz krêci siê po œwi¹tynnym dziedziñcu szukaj¹c kogoœ, kto pomo¿e mu odzyskaæ ksiêgê.");

	Info_ClearChoices (Info_CorKalom_BringBook);
	
	Info_Addchoice(Info_CorKalom_BringBook,DIALOG_BACK						,Info_CorKalom_BringBook_BACK);
	Info_Addchoice(Info_CorKalom_BringBook,"Co dostanê w zamian?",Info_CorKalom_BringBook_EARN);
	Info_Addchoice(Info_CorKalom_BringBook,"Kto ukrad³ tê ksiêgê?",Info_CorKalom_BringBook_WHO);
	Info_Addchoice(Info_CorKalom_BringBook,"Gdzie znajdê Talasa?",Info_CorKalom_BringBook_WHERE);
};
func void Info_CorKalom_BringBook_BACK ()
{
	Info_ClearChoices (Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Where_15_01"); //Gdzie znajdê Talasa?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Powinien byæ u stóp œwi¹tyni. Próbuje zjednaæ sobie kogoœ do pomocy.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //Kto ukrad³ tê ksiêgê?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas twierdzi, ¿e zosta³ obrabowany przez Czarne Gobliny. Brzmi nieprawdopodobnie, ale mog³o siê tak zdarzyæ...
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //Co dostanê w zamian?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //Czy¿ nie przekona³em ciê ju¿ o mojej hojnoœci? Otrzymasz nagrodê odpowiedni¹ do rangi zadania.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "Znalaz³em twoj¹ ksiêgê.";
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
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //Znalaz³em twoj¹ ksiêgê.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //Dobra robota. Teraz mamy wszystkie potrzebne sk³adniki.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //Zajmê siê teraz przygotowaniami.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //Kiedy odbêdzie siê wielkie przywo³anie?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //Zaczekaj do wieczora, wtedy przyjdŸ na dziedziniec œwi¹tyni. Tam siê zbierzemy i spróbujemy przywo³aæ Œni¹cego.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

	B_LogEntry		(CH2_Book,"Zanios³em almanach Cor Kalomowi, który przygotowuje teraz Bractwo do rytua³u przyzwania Œni¹cego. Ceremonia odbêdzie siê w nocy, na œwi¹tynnym dziedziñcu.");
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
	description = "Co z moj¹ zap³at¹?";
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
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//Co z moj¹ zap³at¹?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//A czego chcesz?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Daj mi te zwoje z zaklêciami.",Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Wystarczy mi ruda.",Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Daj mi napoje mana.",Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Daj mi te zwoje z zaklêciami.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Wykorzystaj je m¹drze.
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Wystarczy mi ruda.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//To powinno zaspokoiæ twoj¹ chciwoœæ.
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Daj mi napoje mana.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//Niech te napoje dodadz¹ ci si³!
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
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //Oby Œni¹cy wskaza³ ci w³aœciw¹ drogê.
	
	AI_StopProcessInfos	( self );
};
// *******************************************************************************************************



