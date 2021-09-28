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
	AI_Output (self, other,"GUR_1201_CorKalom_FIRST_10_00"); //Co chce�?
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
	description		= "Chci se p�idat k Bratrstvu."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Chci se p�idat k Bratrstvu.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Sly�el jsem, �e jsi vedouc� novic� a �e rozhoduje� o tom, kdo se m��e p�idat.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Nem�m �as! M� experimenty jsou p��li� d�le�it�, ne� abych ztr�cel �as s nov�mi novici.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Budu spol�hat na n�zor Baal�. A� �eknou, �e jsi hoden nosit roucho novice, p�ij� znovu.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Cor Kalom m� nech� p�idat se k Bratrstvu, pokud se mi poda�� p�esv�d�it �ty�i z Baal�, aby se za m� p�imluvili.");
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
	description		= "Jeden z obchodn�k� ze Star�ho t�bora by cht�l recept na hojiv� lektvar."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //Jeden z obchodn�k� ze Star�ho t�bora by cht�l recept na hojiv� lektvar.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //M� recepty nejsou na prodej!

	B_LogEntry	(CH1_KalomsRecipe,"Cor Kalom mi ned� ten recept. V jeho d�ln� jsou v�ak truhlice... a vypad�, �e bude m�t docela ru�no...");
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
	description		= "Jak� druh experiment� prov�d�?"; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Experimente_15_00"); //Jak� druh experiment� prov�d�?
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //M� v�zkumy jsou na takov� �rovni, �e bys jim sotva porozum�l, chlap�e. Tak m� p�esta� zdr�ovat!
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
	description		= "Nesu denn� sklize� drogy z ba�in!"; 
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
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //Nesu denn� sklize� drogy z ba�in!

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //A TOMUHLE ty ��k� n�jak� mno�stv�??? O�ek�v�m CELOU sklize�, co� znamen� aspo� 100 lodyh!!!
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ach jo, dej mi to. A te� se mi ztra� z o��!

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,"Cor Kalom byl jako obvykle nesnesiteln�, kdy� jsem mu p�ed�val sklize� drogy z ba�in.");
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
	description		= "M�m pro tebe �elisti �erv�..."; 
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
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //M�m pro tebe �elisti �erv�...
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //V�born�. D�m ti za n� p�r sv�ch nejlep��ch lektvar�.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Dob�e. D�m ti za to p�r lektvar�.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hmm. To je v�echno? Tady je lektvar many a zmiz.
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
	description		= "Mysl�m, �e jsem p�esv�d�il Baaly!"; 
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
	counter = 0;	//Counter l�schen, da er noch den Stand der letzten Analyse hat!
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //Mysl�m, �e jsem p�esv�d�il Baaly!
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun ��k�, �e jsem usp�l jako dobr� slu�ebn�k Sp��e.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Pokra�uj...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar m� pova�uje za vn�mav�ho ��ka.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib m� pova�uje za pravov�rce.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //D�ky mn� m�l Baal Tyon vidinu.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //No a?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral ��k�, �e bych m�l obdr�et roucho. P�ivedl jsem mu nov�ho ��ka.
		counter = counter + 1;
	};
	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Dob�e. Jestli m� podporu Baal�, tak mi to sta��.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Tady, vem si to. A te� b� a sna� se b�t u�ite�n�.
	
			// Ernennung zum Novizen
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,"Dnes m� Cor Kalom p�ijal jako novice. Byl jako obvykle nesnesiteln�, ale kone�n� pat��m mezi Bratrstvo Sp��e z T�bora v ba�in�ch.");
			B_LogEntry			(GE_TraderPSI,"Dostanu od Baala Namiba lep�� NOVICKOU ZBROJ.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinOC,"Proto�e jsem se nakonec rozhodl p�idat k Bratrstvu Sp��e T�bora v ba�in�ch, nemohu se st�t jedn�m z Gomezov�ch St�n�.");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinNC,"Nemohu se u� p�idat k tlup� Nov�ho t�bora, proto�e moje nov� m�sto je te� v Bratrstvu Sp��e.");
			
			//Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //No a?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //To bylo v�echno.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Okr�d� m� o drahocenn� �as! Vra� se, a� �ty�i z Baal� rozhodnou, �e jsi zp�sobil�.
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
	description		= "To bylo v�echno? ��dn� p�iv�t�n�, nic?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //To bylo v�echno? ��dn� p�iv�t�n�, nic?
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //V�tej.
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //To zn� l�p.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Nemotej se tady! D�lej n�co! Vezmi tuhle drogu a dones ji Gomezovi do Star�ho t�bora.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Kdy� t� jeho posluhova�i nebudou cht�t pustit, �ekni, �e t� pos�l� Cor Kalom.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,"Cor Kalom m� vyslal s dod�vkou drogy z ba�in za Gomezem do Star�ho t�bora."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Co�e, ty jsi je�t� tady?
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
	description = "M� pro m� je�t� jin� �kol?";
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
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //M� pro m� je�t� jin� �kol?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //V Nov�m t�bo�e je mal� skupinka lid�, kte�� za�ali vyr�b�t svoji vlastn� drogu z ba�in.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Dohl�dni na to, aby tu produkci ukon�ili.
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Jak...
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //Neobt�uj m� s podrobnostmi!
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //T�bor m�cha�� drogy mus� b�t n�kde mimo Nov� t�bor. V�, co m� d�lat.

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,"Cor Kalom chce, abych zastavil konkuren�n� produkci drogy v Nov�m t�bo�e. Nev�m p�esn� kde m�m hledat, ale snad bych mohl za��t P�ED Nov�m t�borem.");

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
	description = "Co se t�k� produkce drogy v Nov�m t�bo�e...";
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
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //Co se t�k� produkce drogy v Nov�m t�bo�e...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //Ano?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //Nem��u ty mu�e naj�t.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //Nic jin�ho jsem od tebe neo�ek�val.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Jsou pry�.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //P�ekvapuje� m�. Podcenil jsem tvoje kvality. Mo�n� bys p�ece jen mohl b�t u�ite�n�.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,"Informoval jsem Cora Kaloma, �e konkuren�n� produkce drogy v Nov�m t�bo�e je zastavena. Jeho odezva byla 'p��telsk�' jako v�dy.");
		Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_SUCCESS);
		B_GiveXP			(XP_DrugMonopol);
	};
};

// ****************************************************************
// 							KRAUTBOTE ZUR�CK
// ****************************************************************

INSTANCE Info_Kalom_KrautboteBACK(C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr 			= 1;
	condition	= Info_Kalom_KrautboteBACK_Condition;
	information	= Info_Kalom_KrautboteBACK_Info;
	permanent 	= 1;
	description = "Doru�il jsem tu drogu.";
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
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //Doru�il jsem tu drogu.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Dob�e. Dostane� dal�� �kol n�kde jinde.

		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,"Cor Kalom p�ijal pen�ze za dod�vku drogy Rudobaron�m.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Kde je t�ch 500 nuget�, chlap�e? Zajisti, abych je hodn� rychle dostal!
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
	description = "Poslal m� Y�Berion. M�m to ohnisko.";
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
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Poslal m� Y�Berion. M�m to ohnisko.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Aaahh - to ohnisko... Kone�n�. Te� m��u studovat kouzlo t�chto artefakt�.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Kdybych jen m�l dostatek v�m�ku... sakra!
	
	B_LogEntry		(CH2_Focus,"Nechal jsem u Cora Kaloma zlov�stn� ohnisko!");		
	Log_SetTopicStatus	(CH2_Focus,	LOG_SUCCESS);
	
	B_GiveInvItems	    (hero, self, Focus_1, 1);
	Npc_RemoveInvItem   (self, Focus_1);
	B_GiveXP			(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung f�r Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 10;
	condition	= Info_CorKalom_BLUFF_Condition;
	information	= Info_CorKalom_BLUFF_Info;
	permanent	= 0;
	description = "Y�Berion �ekl, �e mi m� zaplatit, a� ti to ohnisko donesu!";
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
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y�Berion �ekl, �e mi m� zaplatit, a� ti to ohnisko donesu!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Opravdu? To, �e �ekl? Dobr� tedy. P�edpokl�d�m, �e 50 nuget� by m�lo sta�it!
	
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
	description		= "V�m�ek?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //V�m�ek?
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Ano... Jak jist� v�, vyr�b�m magick� lektvar pro vz�v�n� Sp��e. Pro tento ��el pot�ebuji v�m�ek z �elist� d�ln�ch �erv�.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //V� p�ece, co jsou d�ln� �ervi, ne?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Ne",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Ano.",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Ne.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //Jsou to nebezpe�n� bestie, kter� se pl�� temn�mi doly a se�erou v�echno lidsk� maso, na kter� p�ijdou.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Jejich �elisti obsahuj� zvl�tn� v�m�ek.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //Pou��v�m ho k v�rob� lektvaru, kter� prov�d� po duchovn� cest� ke Sp��ovi.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Ano.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //V�born�!
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
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_01"); //Mluv d�l!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Dobr�, p�ed ned�vnem jsem m�l s�m vidinu Sp��e. Dal mi znamen�.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Sd�lil mi, �e existuje je�t� jin� prost�edek, ne� ten v�m�ek z �elist�.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //A vybral m�, abych p�edal toto poselstv�. Toto poselstv� nen� ode m�. Toto poselstv� je od Sp��e!
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //To nen� mo�n�!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Ticho, hlup�ku!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Srozum�l m�, �e cesta, na kterou jsem se dal, je ta prav�, ale ten prost�edek v lektvaru nen� dostate�n� siln�.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Spr�vn� prost�edek m��eme naj�t v �ervech, ale �elisti na to nesta��.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Mus� tu b�t je�t� n�co jin�ho.
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Vy jste d�ln� �ervy nikdy nezkoumali?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Vy jste d�ln� �ervy nikdy nezkoumali? Mysl�m, �e je�t� n�jak� jin� ��st jejich t�la obsahuje v�ce toho v�m�ku.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Samoz�ejm� jsme n�kolik d�ln�ch �erv� pitvali, ale zd� se, �e jedin� �elisti obsahuj� ten v�m�ek.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //Mus� tu b�t je�t� n�co jin�ho. Najdi jejich hn�zdo a tam najde� odpov��!

	CorKalom_BringMCQBalls = LOG_RUNNING;

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,"Guru Cor Kalom m� po��dal, abych nalezl zdroj v�m�ku d�ln�ch �erv� ve Star�m dole. Doposud se pou��valy �elisti t�ch oblud a j� m�m objevit jin� zdroj, kter� obsahuje siln�j�� v�m�ek.");

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
	description		= "To vypad� na temn� a zlov�stn� p�tr�n�!"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //To vypad� na temn� a zlov�stn� p�tr�n�!
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Vezmi si tyhle kouzeln� sv�teln� svitky - v temn�ch �acht�ch ti m��ou b�t velmi u�ite�n�.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Templ��i v dolech ti pom��ou.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //A� ti Sp�� dod� s�lu, a� ti sv�t� na cestu a osv�t� ducha a nech� pos�l� tvoji mysl!

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
	description		= "Uv�dom si, �e by to mohlo b�t docela krvav� dobrodru�stv�!"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Uv�dom si, �e by to mohlo b�t docela krvav� dobrodru�stv�!
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Vezmi si sebou tyhle lektvary.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Ned�v�m ti je, proto�e bych cht�l, abys z�stal na�ivu, ale proto�e se tento �kol mus� splnit.

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
	description		= "Kde najdu d�ln� �ervy?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Kde najdu d�ln� �ervy?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //Ve Star�m dole.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //Kde je Star� d�l?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Vem si tuhle mapu! Jsou na n� vyzna�ena v�echna d�le�it� m�sta uvnit� Bari�ry.
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
	description		= "Jak� je nejlep�� zp�sob boje s d�ln�mi �ervy?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Jak� je nejlep�� zp�sob boje s d�ln�mi �ervy?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //V dole jsou templ��i. Lov� �ervy kv�li �elistem. Zeptej se Gora Na Vida. Pom��e ti.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak najdu v dole hn�zdo?"; 
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
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Jak najdu v dole hn�zdo?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //To je nejobt�n�j�� bod tv�ho posl�n�. Ne�eknu ti, kde je hledat, ani co v nich hledat. Sp�� v�ak bude p�i tob�.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //Dobr�, to je �t�cha.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "Na�el jsem vaj��ka �erv� kr�lovny.";
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
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Na�el jsem vaj��ka �erv� kr�lovny.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Zn�m je. M� vidina byla znamen�. Kr�lovnina vaj��ka mus� obsahovat ten v�m�ek.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //V�born�, s t�m vytvo��m ten lektvar pro spojen� se Sp��em.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //A co m� odm�na?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Spr�vn�... D�kuju ti.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Myslel jsem HMATATELNOU odm�nu.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Dob�e, dob�e. Co bys cht�l?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,"Dal jsem Cor Kalomovi t�i vaj��ka d�ln�ch �erv�. Tv��il se velmi nep��telsky a j� ho musel po��dat o svoji hubenou odm�nu.");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp,"Mysl�m, �e toho o z�m�rech sekty v�m ji� dost, a tak o tom m��u podat zpr�vu Mordragovi. ");
	B_LogEntry	(CH1_GotoPsi,"Mysl�m, �e toho o z�m�rech sekty v�m ji� dost. Jakmile budu ve Star�m t�bo�e, m�l bych se o tom zm�nit Ravenovi.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Runu.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"N�jakou zbra�.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Hojiv� lektvar.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Rudu.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Manu.",Info_CorKalom_BringMCQBalls_Success_MANA);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Runu.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //A� ti tato runa osv�t� cestu!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //N�jakou zbra�.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //K� tato zbra� zni�� tv� nep��tele!
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Hojiv� lektvar.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //K� ti tento lektvar prodlou�� �ivot!
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Ruda.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Vem si tuhle rudu jako znamen� vd��nosti cel�ho Bratrstva!
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Manu.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //K� tento lektvar probud� kouzlo, kter� v tob� d��m�!
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
	description = "M��eme za��t vz�vat Sp��e?";
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
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //M��eme za��t vz�vat Sp��e?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //Ne! Nena�el jsem je�t� zp�sob, jak pou��vat to ohnisko.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Pozbyli jsme prastar� znalosti o t�chto artefaktech.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //Chce� ��ci, �e jsem sb�ral ta vaj��ka nadarmo?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //Ne, poslouchej m�. Existuje jeden almanach, ve kter�m je v�e, co pot�ebujeme v�d�t.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Koupili jsme tu knihu od m�ga Corrista ze Star�ho t�bora.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //Byla v�ak ukradena, kdy� se j� sem pokou�eli ze Star�ho t�bor p�in�st.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //Pov��il jsem novice Talase, aby ji pro m� vyzvedl, ale on byl p�epaden.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Zklamal m�, ale j� mu dal je�t� jednu �anci. Mus� p�in�st ukraden� almanach zp�tky.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Promluv si s n�m. Bude pot�ebovat ka�dou pomocnou ruku.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,"Cor Kalom pot�ebuje pro vz�v�n� Sp��e posledn� p�edm�t. Je to kniha o pou�it� ohniskov�ch kamen�. Novic Talas byl tak neopatrn�, �e si ten rukopis nechal ukr�st gobliny. Nyn� hled� v chr�mov�m dvo�e n�koho, kdo by mu pomohl z�skat knihu zp�t.");

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
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Je na n�dvo�� u chr�mov�ho vr�ku, kde se sna�� z�skat lidi, aby mu pomohli.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //Kdo ukradl ten almanach?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas ��kal, �e mu ho ukradl �ern� goblin. Zn� to podivn�, ale nen� to nemo�n�.
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //Co za to dostanu?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //To jsem ti je�t� neprok�zal dost velkomyslnosti? Dostane� odm�nu.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "Na�el jsem tu knihu.";
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
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //Na�el jsem tu knihu.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //V�born� pr�ce. M�me v�e, co pot�ebujeme.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //Te� dokon��m p��pravy.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //Kdy bude prob�hat vz�v�n�?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //P�ij� v noci na chr�mov� n�dvo��. Budeme se soust�edit na vyvol�n� v�emohouc�ho Sp��e.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

	B_LogEntry		(CH2_Book,"P�edal jsem rukopis Coru Kalomovi, kter� te� Bratrstvo p�ipravuje na velk� vz�v�n� Sp��e. To se bude se odehr�vat na n�dvo�� chr�mu.");
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
	description = "A co moje odm�na?";
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
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//A co moje odm�na?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//Co bys cht�l?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Kouzeln� svitek",Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Ruda",Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Lektvar many",Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Dej mi tyhle �arovn� svitky.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//U��vej tyto svitky moud�e.
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Dej mi rudu.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//To by m�lo nasytit tv�j hlad po rud�.
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Lektvar many.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//K� ti tento lektvar d� s�lu!
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
	AI_Output			(other, self,"GUR_1201_CorKalom_Exit_15_01"); //Uvid�me se.
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //K� t� Sp�� osv�t�.
	
	AI_StopProcessInfos	( self );
};
// *******************************************************************************************************



