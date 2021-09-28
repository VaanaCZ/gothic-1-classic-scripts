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
	AI_Output (self, other,"GUR_1201_CorKalom_FIRST_10_00"); //Co chceö?
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
	description		= "Chci se p¯idat k Bratrstvu."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Chci se p¯idat k Bratrstvu.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Slyöel jsem, ûe jsi vedoucÌ novic˘ a ûe rozhodujeö o tom, kdo se m˘ûe p¯idat.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Nem·m Ëas! MÈ experimenty jsou p¯Ìliö d˘leûitÈ, neû abych ztr·cel Ëas s nov˝mi novici.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Budu spolÈhat na n·zor Baal˘. Aû ¯eknou, ûe jsi hoden nosit roucho novice, p¯ijÔ znovu.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Cor Kalom mÏ nech· p¯idat se k Bratrstvu, pokud se mi poda¯Ì p¯esvÏdËit Ëty¯i z Baal˘, aby se za mÏ p¯imluvili.");
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
	description		= "Jeden z obchodnÌk˘ ze StarÈho t·bora by chtÏl recept na hojiv˝ lektvar."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //Jeden z obchodnÌk˘ ze StarÈho t·bora by chtÏl recept na hojiv˝ lektvar.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //MÈ recepty nejsou na prodej!

	B_LogEntry	(CH1_KalomsRecipe,"Cor Kalom mi ned· ten recept. V jeho dÌlnÏ jsou vöak truhlice... a vypad·, ûe bude mÌt docela ruöno...");
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
	description		= "Jak˝ druh experiment˘ prov·dÌö?"; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Experimente_15_00"); //Jak˝ druh experiment˘ prov·dÌö?
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //MÈ v˝zkumy jsou na takovÈ ˙rovni, ûe bys jim sotva porozumÏl, chlapËe. Tak mÏ p¯estaÚ zdrûovat!
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
	description		= "Nesu dennÌ sklizeÚ drogy z baûin!"; 
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
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //Nesu dennÌ sklizeÚ drogy z baûin!

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //A TOMUHLE ty ¯Ìk·ö nÏjakÈ mnoûstvÌ??? OËek·v·m CELOU sklizeÚ, coû znamen· aspoÚ 100 lodyh!!!
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ach jo, dej mi to. A teÔ se mi ztraù z oËÌ!

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,"Cor Kalom byl jako obvykle nesnesiteln˝, kdyû jsem mu p¯ed·val sklizeÚ drogy z baûin.");
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
	description		= "M·m pro tebe Ëelisti Ëerv˘..."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //M·m pro tebe Ëelisti Ëerv˘...
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //V˝bornÏ. D·m ti za nÏ p·r sv˝ch nejlepöÌch lektvar˘.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Dob¯e. D·m ti za to p·r lektvar˘.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hmm. To je vöechno? Tady je lektvar many a zmiz.
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
	description		= "MyslÌm, ûe jsem p¯esvÏdËil Baaly!"; 
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
	counter = 0;	//Counter lˆschen, da er noch den Stand der letzten Analyse hat!
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //MyslÌm, ûe jsem p¯esvÏdËil Baaly!
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun ¯Ìk·, ûe jsem uspÏl jako dobr˝ sluûebnÌk Sp·Ëe.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //PokraËuj...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar mÏ povaûuje za vnÌmavÈho û·ka.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib mÏ povaûuje za pravovÏrce.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //DÌky mnÏ mÏl Baal Tyon vidinu.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //No a?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral ¯Ìk·, ûe bych mÏl obdrûet roucho. P¯ivedl jsem mu novÈho û·ka.
		counter = counter + 1;
	};
	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Dob¯e. Jestli m·ö podporu Baal˘, tak mi to staËÌ.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Tady, vem si to. A teÔ bÏû a snaû se b˝t uûiteËn˝.
	
			// Ernennung zum Novizen
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,"Dnes mÏ Cor Kalom p¯ijal jako novice. Byl jako obvykle nesnesiteln˝, ale koneËnÏ pat¯Ìm mezi Bratrstvo Sp·Ëe z T·bora v baûin·ch.");
			B_LogEntry			(GE_TraderPSI,"Dostanu od Baala Namiba lepöÌ NOVICKOU ZBROJ.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinOC,"Protoûe jsem se nakonec rozhodl p¯idat k Bratrstvu Sp·Ëe T·bora v baûin·ch, nemohu se st·t jednÌm z Gomezov˝ch StÌn˘.");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinNC,"Nemohu se uû p¯idat k tlupÏ NovÈho t·bora, protoûe moje novÈ mÌsto je teÔ v Bratrstvu Sp·Ëe.");
			
			//Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //No a?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //To bylo vöechno.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Okr·d·ö mÏ o drahocenn˝ Ëas! Vraù se, aû Ëty¯i z Baal˘ rozhodnou, ûe jsi zp˘sobil˝.
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
	description		= "To bylo vöechno? é·dnÈ p¯ivÌt·nÌ, nic?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //To bylo vöechno? é·dnÈ p¯ivÌt·nÌ, nic?
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //VÌtej.
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //To znÌ lÌp.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Nemotej se tady! DÏlej nÏco! Vezmi tuhle drogu a dones ji Gomezovi do StarÈho t·bora.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Kdyû tÏ jeho posluhovaËi nebudou chtÌt pustit, ¯ekni, ûe tÏ posÌl· Cor Kalom.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,"Cor Kalom mÏ vyslal s dod·vkou drogy z baûin za Gomezem do StarÈho t·bora."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Coûe, ty jsi jeötÏ tady?
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
	description = "M·ö pro mÏ jeötÏ jin˝ ˙kol?";
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
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //M·ö pro mÏ jeötÏ jin˝ ˙kol?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //V NovÈm t·bo¯e je mal· skupinka lidÌ, kte¯Ì zaËali vyr·bÏt svoji vlastnÌ drogu z baûin.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //DohlÈdni na to, aby tu produkci ukonËili.
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Jak...
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //NeobtÏûuj mÏ s podrobnostmi!
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //T·bor mÌchaË˘ drogy musÌ b˝t nÏkde mimo Nov˝ t·bor. VÌö, co m·ö dÏlat.

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,"Cor Kalom chce, abych zastavil konkurenËnÌ produkci drogy v NovÈm t·bo¯e. NevÌm p¯esnÏ kde m·m hledat, ale snad bych mohl zaËÌt PÿED Nov˝m t·borem.");

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
	description = "Co se t˝k· produkce drogy v NovÈm t·bo¯e...";
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
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //Co se t˝k· produkce drogy v NovÈm t·bo¯e...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //Ano?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //Nem˘ûu ty muûe najÌt.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //Nic jinÈho jsem od tebe neoËek·val.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Jsou pryË.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //P¯ekvapujeö mÏ. Podcenil jsem tvoje kvality. Moûn· bys p¯ece jen mohl b˝t uûiteËn˝.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,"Informoval jsem Cora Kaloma, ûe konkurenËnÌ produkce drogy v NovÈm t·bo¯e je zastavena. Jeho odezva byla 'p¯·telsk·' jako vûdy.");
		Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_SUCCESS);
		B_GiveXP			(XP_DrugMonopol);
	};
};

// ****************************************************************
// 							KRAUTBOTE ZUR‹CK
// ****************************************************************

INSTANCE Info_Kalom_KrautboteBACK(C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr 			= 1;
	condition	= Info_Kalom_KrautboteBACK_Condition;
	information	= Info_Kalom_KrautboteBACK_Info;
	permanent 	= 1;
	description = "DoruËil jsem tu drogu.";
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
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //DoruËil jsem tu drogu.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Dob¯e. Dostaneö dalöÌ ˙kol nÏkde jinde.

		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,"Cor Kalom p¯ijal penÌze za dod·vku drogy Rudobaron˘m.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Kde je tÏch 500 nuget˘, chlapËe? Zajisti, abych je hodnÏ rychle dostal!
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
	description = "Poslal mÏ Y¥Berion. M·m to ohnisko.";
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
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Poslal mÏ Y¥Berion. M·m to ohnisko.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Aaahh - to ohnisko... KoneËnÏ. TeÔ m˘ûu studovat kouzlo tÏchto artefakt˘.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Kdybych jen mÏl dostatek v˝mÏöku... sakra!
	
	B_LogEntry		(CH2_Focus,"Nechal jsem u Cora Kaloma zlovÏstnÈ ohnisko!");		
	Log_SetTopicStatus	(CH2_Focus,	LOG_SUCCESS);
	
	B_GiveInvItems	    (hero, self, Focus_1, 1);
	Npc_RemoveInvItem   (self, Focus_1);
	B_GiveXP			(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung f¸r Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 10;
	condition	= Info_CorKalom_BLUFF_Condition;
	information	= Info_CorKalom_BLUFF_Info;
	permanent	= 0;
	description = "Y¥Berion ¯ekl, ûe mi m·ö zaplatit, aû ti to ohnisko donesu!";
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
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y¥Berion ¯ekl, ûe mi m·ö zaplatit, aû ti to ohnisko donesu!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Opravdu? To, ûe ¯ekl? Dobr· tedy. P¯edpokl·d·m, ûe 50 nuget˘ by mÏlo staËit!
	
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
	description		= "V˝mÏöek?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //V˝mÏöek?
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Ano... Jak jistÏ vÌö, vyr·bÌm magick˝ lektvar pro vz˝v·nÌ Sp·Ëe. Pro tento ˙Ëel pot¯ebuji v˝mÏöek z ËelistÌ d˘lnÌch Ëerv˘.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //VÌö p¯ece, co jsou d˘lnÌ Ëervi, ne?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Ne",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Ano.",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Ne.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //Jsou to nebezpeËnÈ bestie, kterÈ se plÌûÌ temn˝mi doly a seûerou vöechno lidskÈ maso, na kterÈ p¯ijdou.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Jejich Ëelisti obsahujÌ zvl·ötnÌ v˝mÏöek.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //PouûÌv·m ho k v˝robÏ lektvaru, kter˝ prov·dÌ po duchovnÌ cestÏ ke Sp·Ëovi.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Ano.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //V˝bornÏ!
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
	description		= "Mluv!"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_01"); //Mluv d·l!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Dobr·, p¯ed ned·vnem jsem mÏl s·m vidinu Sp·Ëe. Dal mi znamenÌ.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //SdÏlil mi, ûe existuje jeötÏ jin˝ prost¯edek, neû ten v˝mÏöek z ËelistÌ.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //A vybral mÏ, abych p¯edal toto poselstvÌ. Toto poselstvÌ nenÌ ode mÏ. Toto poselstvÌ je od Sp·Ëe!
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //To nenÌ moûnÈ!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Ticho, hlup·ku!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //SrozumÏl mÏ, ûe cesta, na kterou jsem se dal, je ta prav·, ale ten prost¯edek v lektvaru nenÌ dostateËnÏ siln˝.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Spr·vn˝ prost¯edek m˘ûeme najÌt v Ëervech, ale Ëelisti na to nestaËÌ.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //MusÌ tu b˝t jeötÏ nÏco jinÈho.
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Vy jste d˘lnÌ Ëervy nikdy nezkoumali?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Vy jste d˘lnÌ Ëervy nikdy nezkoumali? MyslÌm, ûe jeötÏ nÏjak· jin· Ë·st jejich tÏla obsahuje vÌce toho v˝mÏöku.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Samoz¯ejmÏ jsme nÏkolik d˘lnÌch Ëerv˘ pitvali, ale zd· se, ûe jedinÏ Ëelisti obsahujÌ ten v˝mÏöek.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //MusÌ tu b˝t jeötÏ nÏco jinÈho. Najdi jejich hnÌzdo a tam najdeö odpovÏÔ!

	CorKalom_BringMCQBalls = LOG_RUNNING;

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,"Guru Cor Kalom mÏ poû·dal, abych nalezl zdroj v˝mÏöku d˘lnÌch Ëerv˘ ve StarÈm dole. Doposud se pouûÌvaly Ëelisti tÏch oblud a j· m·m objevit jin˝ zdroj, kter˝ obsahuje silnÏjöÌ v˝mÏöek.");

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
	description		= "To vypad· na temnÈ a zlovÏstnÈ p·tr·nÌ!"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //To vypad· na temnÈ a zlovÏstnÈ p·tr·nÌ!
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Vezmi si tyhle kouzelnÈ svÏtelnÈ svitky - v temn˝ch öacht·ch ti m˘ûou b˝t velmi uûiteËnÈ.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Templ·¯i v dolech ti pom˘ûou.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //Aù ti Sp·Ë dod· sÌlu, aù ti svÌtÌ na cestu a osvÌtÌ ducha a nechù posÌlÌ tvoji mysl!

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
	description		= "UvÏdom si, ûe by to mohlo b˝t docela krvavÈ dobrodruûstvÌ!"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //UvÏdom si, ûe by to mohlo b˝t docela krvavÈ dobrodruûstvÌ!
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Vezmi si sebou tyhle lektvary.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Ned·v·m ti je, protoûe bych chtÏl, abys z˘stal naûivu, ale protoûe se tento ˙kol musÌ splnit.

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
	description		= "Kde najdu d˘lnÌ Ëervy?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Kde najdu d˘lnÌ Ëervy?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //Ve StarÈm dole.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //Kde je Star˝ d˘l?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Vem si tuhle mapu! Jsou na nÌ vyznaËena vöechna d˘leûit· mÌsta uvnit¯ BariÈry.
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
	description		= "Jak˝ je nejlepöÌ zp˘sob boje s d˘lnÌmi Ëervy?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Jak˝ je nejlepöÌ zp˘sob boje s d˘lnÌmi Ëervy?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //V dole jsou templ·¯i. LovÌ Ëervy kv˘li Ëelistem. Zeptej se Gora Na Vida. Pom˘ûe ti.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak najdu v dole hnÌzdo?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Jak najdu v dole hnÌzdo?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //To je nejobtÌûnÏjöÌ bod tvÈho posl·nÌ. Ne¯eknu ti, kde je hledat, ani co v nich hledat. Sp·Ë vöak bude p¯i tobÏ.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //Dobr·, to je ˙tÏcha.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "Naöel jsem vajÌËka ËervÌ kr·lovny.";
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
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Naöel jsem vajÌËka ËervÌ kr·lovny.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Zn·m je. M· vidina byla znamenÌ. Kr·lovnina vajÌËka musÌ obsahovat ten v˝mÏöek.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //V˝bornÏ, s tÌm vytvo¯Ìm ten lektvar pro spojenÌ se Sp·Ëem.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //A co m· odmÏna?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Spr·vnÏ... DÏkuju ti.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Myslel jsem HMATATELNOU odmÏnu.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Dob¯e, dob¯e. Co bys chtÏl?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,"Dal jsem Cor Kalomovi t¯i vajÌËka d˘lnÌch Ëerv˘. Tv·¯il se velmi nep¯·telsky a j· ho musel poû·dat o svoji hubenou odmÏnu.");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp,"MyslÌm, ûe toho o z·mÏrech sekty vÌm jiû dost, a tak o tom m˘ûu podat zpr·vu Mordragovi. ");
	B_LogEntry	(CH1_GotoPsi,"MyslÌm, ûe toho o z·mÏrech sekty vÌm jiû dost. Jakmile budu ve StarÈm t·bo¯e, mÏl bych se o tom zmÌnit Ravenovi.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Runu.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"NÏjakou zbraÚ.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Hojiv˝ lektvar.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Rudu.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Manu.",Info_CorKalom_BringMCQBalls_Success_MANA);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Runu.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //Aù ti tato runa osvÌtÌ cestu!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //NÏjakou zbraÚ.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //KÈû tato zbraÚ zniËÌ tvÈ nep¯·tele!
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Hojiv˝ lektvar.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //KÈû ti tento lektvar prodlouûÌ ûivot!
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Ruda.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Vem si tuhle rudu jako znamenÌ vdÏËnosti celÈho Bratrstva!
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Manu.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //KÈû tento lektvar probudÌ kouzlo, kterÈ v tobÏ d¯Ìm·!
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
	description = "M˘ûeme zaËÌt vz˝vat Sp·Ëe?";
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
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //M˘ûeme zaËÌt vz˝vat Sp·Ëe?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //Ne! Nenaöel jsem jeötÏ zp˘sob, jak pouûÌvat to ohnisko.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Pozbyli jsme prastarÈ znalosti o tÏchto artefaktech.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //Chceö ¯Ìci, ûe jsem sbÌral ta vajÌËka nadarmo?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //Ne, poslouchej mÏ. Existuje jeden almanach, ve kterÈm je vöe, co pot¯ebujeme vÏdÏt.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Koupili jsme tu knihu od m·ga Corrista ze StarÈho t·bora.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //Byla vöak ukradena, kdyû se jÌ sem pokouöeli ze StarÈho t·bor p¯inÈst.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //PovÏ¯il jsem novice Talase, aby ji pro mÏ vyzvedl, ale on byl p¯epaden.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Zklamal mÏ, ale j· mu dal jeötÏ jednu öanci. MusÌ p¯inÈst ukraden˝ almanach zp·tky.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Promluv si s nÌm. Bude pot¯ebovat kaûdou pomocnou ruku.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,"Cor Kalom pot¯ebuje pro vz˝v·nÌ Sp·Ëe poslednÌ p¯edmÏt. Je to kniha o pouûitÌ ohniskov˝ch kamen˘. Novic Talas byl tak neopatrn˝, ûe si ten rukopis nechal ukr·st gobliny. NynÌ hled· v chr·movÈm dvo¯e nÏkoho, kdo by mu pomohl zÌskat knihu zpÏt.");

	Info_ClearChoices (Info_CorKalom_BringBook);
	
	Info_Addchoice(Info_CorKalom_BringBook,DIALOG_BACK						,Info_CorKalom_BringBook_BACK);
	Info_Addchoice(Info_CorKalom_BringBook,"Co za to dostanu?",Info_CorKalom_BringBook_EARN);
	Info_Addchoice(Info_CorKalom_BringBook,"Kdo ukradl ten almanach?",Info_CorKalom_BringBook_WHO);
	Info_Addchoice(Info_CorKalom_BringBook,"Kde najdu Talase?",Info_CorKalom_BringBook_WHERE);
};
func void Info_CorKalom_BringBook_BACK ()
{
	Info_ClearChoices (Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Where_15_01"); //Kde najdu Talase?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Je na n·dvo¯Ì u chr·movÈho vröku, kde se snaûÌ zÌskat lidi, aby mu pomohli.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //Kdo ukradl ten almanach?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas ¯Ìkal, ûe mu ho ukradl Ëern˝ goblin. ZnÌ to podivnÏ, ale nenÌ to nemoûnÈ.
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //Co za to dostanu?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //To jsem ti jeötÏ neprok·zal dost velkomyslnosti? Dostaneö odmÏnu.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "Naöel jsem tu knihu.";
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
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //Naöel jsem tu knihu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //V˝born· pr·ce. M·me vöe, co pot¯ebujeme.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //TeÔ dokonËÌm p¯Ìpravy.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //Kdy bude probÌhat vz˝v·nÌ?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //P¯ijÔ v noci na chr·movÈ n·dvo¯Ì. Budeme se soust¯edit na vyvol·nÌ vöemohoucÌho Sp·Ëe.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

	B_LogEntry		(CH2_Book,"P¯edal jsem rukopis Coru Kalomovi, kter˝ teÔ Bratrstvo p¯ipravuje na velkÈ vz˝v·nÌ Sp·Ëe. To se bude se odehr·vat na n·dvo¯Ì chr·mu.");
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
	description = "A co moje odmÏna?";
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
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//A co moje odmÏna?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//Co bys chtÏl?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Kouzeln˝ svitek",Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Ruda",Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Lektvar many",Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Dej mi tyhle ËarovnÈ svitky.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//UûÌvej tyto svitky moud¯e.
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Dej mi rudu.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//To by mÏlo nasytit tv˘j hlad po rudÏ.
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Lektvar many.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//KÈû ti tento lektvar d· sÌlu!
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
	AI_Output			(other, self,"GUR_1201_CorKalom_Exit_15_01"); //UvidÌme se.
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //KÈû tÏ Sp·Ë osvÌtÌ.
	
	AI_StopProcessInfos	( self );
};
// *******************************************************************************************************



