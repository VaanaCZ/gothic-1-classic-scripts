// ****************************** 
//				EXIT 
// ******************************

INSTANCE   ORG_801_Lares_Exit (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 999;
	condition	= ORG_801_Lares_Exit_Condition;
	information	= ORG_801_Lares_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  ORG_801_Lares_Exit_Condition()
{
	return 1;
};

FUNC VOID  ORG_801_Lares_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************** 
//			Wie hier rein?
// ******************************
	var int Lares_vorbeigemogelt;
// ******************************

INSTANCE ORG_801_Lares_YouHere (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 1;
	condition	= ORG_801_Lares_YouHere_Condition;
	information	= ORG_801_Lares_YouHere_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC int ORG_801_Lares_YouHere_Condition()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ( (Roscoe.aivar[AIV_PASSGATE]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_YouHere_Info()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ( (Npc_IsInState(Roscoe, ZS_MagicSleep)) || (Npc_GetTempAttitude(Roscoe,other)==ATT_FRIENDLY) )
	{
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_00"); //Jak ses sem dostal? Co se stalo s Roscoem?
		AI_Output	(other, self,"ORG_801_Lares_YouHere_15_01"); //NemÏl chuù mÏ zastavit.
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_02"); //Co chceö?
		Roscoe.aivar[AIV_PASSGATE] = TRUE;
		Lares_vorbeigemogelt = TRUE;
		B_GiveXP	(XP_CheatedIntoLaresHut);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	};
};

// ****************************** 
//			Wanna Join
// ******************************

INSTANCE ORG_801_Lares_WannaJoin (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 1;
	condition	= ORG_801_Lares_WannaJoin_Condition;
	information	= ORG_801_Lares_WannaJoin_Info;
	permanent	= 0;
	description = "Chci se p¯idat k tvojÌ tlupÏ!";
};                       

FUNC int ORG_801_Lares_WannaJoin_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_WannaJoin_Info()
{
	AI_Output (other, self,"ORG_801_Lares_WannaJoin_15_00"); //Chci se p¯idat k tvojÌ tlupÏ!
	AI_Output (self, other,"ORG_801_Lares_WannaJoin_11_01"); //Coûe? Proto ses tady uk·zal?
};

// ****************************** 
//			Bring List
// ******************************
	var int Lares_BringListBack;
// ******************************

INSTANCE   ORG_801_Lares_BringList (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringList_Condition;
	information	= ORG_801_Lares_BringList_Info;
	permanent	= 0;
	description = "M·m s sebou seznam poûadavk˘ ze StarÈho dolu.";
};                       

FUNC int ORG_801_Lares_BringList_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Npc_HasItems(hero,TheList)) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringList_Info()
{
	AI_Output (other, self,"ORG_801_Lares_BringList_15_00"); //M·m s sebou seznam poûadavk˘ ze StarÈho dolu.
	AI_Output (self, other,"ORG_801_Lares_BringList_11_01"); //Ne! Tomu nevÏ¯Ìm! MusÌm ale ¯Ìci, ûe m·ö pevnÈ nervy!
	AI_Output (self, other,"ORG_801_Lares_BringList_11_02"); //Ukaû mi to!
	AI_Output (other, self,"ORG_801_Lares_BringList_15_03"); //Tady je...
	B_UseFakeScroll();
	AI_Output (self, other,"ORG_801_Lares_BringList_11_04"); //Opravdu! VÌö, co s tÌm udÏl·me? JeötÏ tam nÏco p¯ipÌöeme a poöleme ten seznam zp·tky do StarÈho t·bora!
	AI_Output (self, other,"ORG_801_Lares_BringList_11_05"); //Potom, aû ty vÏci p¯inesou do dolu, p¯epadneme je a vöechno si nacpeme do pytl˘! Nebude to trvat ani minutku... Ha! Tady je ten seznam. VÌö, co m·ö dÏlat.
	//AI_Output (self, other,"ORG_801_Lares_BringList_11_06"); //Das haben wir gleich ... So! Hier ist die Liste. Du weiﬂt, was du zu tun hast.
	
	Points_NC = Points_NC + 10;
	
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem		(hero,	TheList);
	CreateInvItem			(hero,	TheListNC);
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Lares, v˘dce bandit˘, byl velmi p¯ekvapen, kdyû uvidÏl seznam poûadavk˘. P¯ipsal dalöÌ poloûky a j· jej teÔ nesu Diegovi.");		
	B_GiveXP				(XP_GiveListToLares);	
};

// ****************************** 
//		List an Diego!
// ******************************

INSTANCE ORG_801_Lares_BringListBack (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringListBack_Condition;
	information	= ORG_801_Lares_BringListBack_Info;
	permanent	= 0;
	description = "P¯inesl jsem Diegovi seznam.";
};                       

FUNC int ORG_801_Lares_BringListBack_Condition()
{
	if ( (Lares_BringListBack==LOG_RUNNING) && (Diego_BringList==LOG_SUCCESS) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringListBack_Info()
{
	AI_Output			(other, self,"ORG_801_Lares_BringListBack_15_00"); //P¯inesl jsem Diegovi seznam.
	AI_Output			(self, other,"ORG_801_Lares_BringListBack_11_01"); //Dob¯e! RozmÌstil jsem p·r muû˘ po cestÏ ke StarÈmu dolu. Thorusovi str·ûci uû teÔ leûÌ mrtvÌ v lese.
		
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;

	B_LogEntry			(CH1_JoinNC,"Lares jiû p¯epadl konvoje StarÈho t·bora. Z¯ejmÏ se mu nechtÏlo Ëekat, dokud... nebo spÌöe POKUD se vr·tÌm. ");		

	B_GiveXP			(XP_ReportListDeliveryToLares);
};

// ****************************** 
//		Anteil wegen BringList
// ******************************

INSTANCE   ORG_801_Lares_BringListAnteil (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringListAnteil_Condition;
	information	= ORG_801_Lares_BringListAnteil_Info;
	permanent	= 0;
	description = "Uû p¯epadli konvoj? Kde je m˘j podÌl?";
};                       

FUNC int ORG_801_Lares_BringListAnteil_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack)) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringListAnteil_Info()
{
	AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_00"); //Uû p¯epadli konvoj? Kde je m˘j podÌl?
	AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_01"); //BÏû za Gornem. NÏco ti d·...
	var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	if (gorn.aivar[AIV_FINDABLE]==TRUE)
	{
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_02"); //Zn·m Gorna. NenÌ Ëlenem tlupy. Je to ûold·k, co pracuje pro m·gy!
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_03"); //Jo, to je pravda!
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_04"); //Je do tohohle podniku zapojen˝?
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_05"); //Kdo moc vÌ, nenÌ pro n·s dobr˝. BÏû za nÌm a vyber si sv˘j podÌl.
	};
	B_LogEntry(CH1_JoinNC,"éold·k Gorn se tajnÏ ˙Ëastnil ˙toku na konvoj. Dostanu od nÏj sv˘j podÌl.");
	gorn.aivar[AIV_FINDABLE]==TRUE;
};

// ****************************** 
//		Mordrag schickt mich
// ******************************

INSTANCE ORG_801_Lares_MordragSentMe (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_MordragSentMe_Condition;
	information	= ORG_801_Lares_MordragSentMe_Info;
	permanent	= 0;
	description = "Poslal mÏ Mordrag. Dal mi pro tebe prsten.";
};                       

FUNC int ORG_801_Lares_MordragSentMe_Condition()
{
	if 	Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)
	&&	Npc_HasItems(hero,MordragsRing)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_MordragSentMe_Info()
{
    B_GiveInvItems (other,self, MordragsRing, 1);
    
	AI_Output (other, self,"ORG_801_Lares_MordragSentMe_15_00"); //Poslal mÏ Mordrag. Dal mi pro tebe prsten.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_01"); //N·dhern˝ kousek! To je Ë·st zdejöÌho obvyklÈho postupu, ûe dÌl ko¯isti p¯ipadne v˘dci tlupy.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_02"); //Ale to, ûe on dal prsten TOBÃ, svÏdËÌ o tom, ûe m· o tobÏ dobrÈ mÌnÏnÌ.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_03"); //Chci, abys za nÌm zaöel a nÏco mu vy¯Ìdil.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_04"); //ÿekni mu, ûe chci mÌt nÏkoho v SektovnÌm t·bo¯e. Bratrstvo pl·nuje nÏco velkÈho - a j· chci vÏdÏt p¯esnÏ, co to bude.
	
	Lares_InformMordrag = LOG_RUNNING;
		
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Lares mÏ vyslal za Mordragem. Chce, abych mu ¯ekl, ûe do Sekt·¯skÈho t·bora bude vysl·n zvÏd, aby zjistil, co chyst· Bratrstvo.");	
	B_GiveXP				(XP_GiveRingToLares);	
		
	Points_NC = Points_NC + 10;
};

// ****************************** 
//		Immerhin vorbeigemogelt
// ******************************

INSTANCE   ORG_801_Lares_Vorbeigemogelt (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_Vorbeigemogelt_Condition;
	information	= ORG_801_Lares_Vorbeigemogelt_Info;
	permanent	= 0;
	description = "Poda¯ilo se mi dostat p¯es tvoje str·ûe.";
};                       

FUNC int  ORG_801_Lares_Vorbeigemogelt_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Lares_vorbeigemogelt == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_Vorbeigemogelt_Info()
{
	AI_Output (other, self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //Poda¯ilo se mi dostat p¯es tvoje str·ûe.
	AI_Output (self, other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //To je v po¯·dku. To ale samo o sobÏ nestaËÌ.
		
	Points_NC = Points_NC + 10;
};

// ****************************** 
//		Baal Isidro - Get Kraut
// ******************************
	var int Lares_Get400Ore;
// ******************************

INSTANCE   ORG_801_Lares_GetKraut (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 10;
	condition	= ORG_801_Lares_GetKraut_Condition;
	information	= ORG_801_Lares_GetKraut_Info;
	permanent	= 0;
	description = "Co m·m jeötÏ udÏlat?";
};                       

FUNC int  ORG_801_Lares_GetKraut_Condition()
{
	if	(Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_Vorbeigemogelt) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_GetKraut_Info()
{
	AI_Output (other, self,"ORG_801_Lares_GetKraut_15_00"); //Co m·m jeötÏ udÏlat?
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_01"); //Baal Isidro ze SektovnÌho t·bora m· u sebe drogu v cenÏ aspoÚ 400 nuget˘. Chci ji od nÏj mÌt. Je mi jedno, jak to provedeö.
	
	if ( (BaalIsidro_DealerJob==LOG_RUNNING) || (BaalIsidro_DealerJob==LOG_SUCCESS) )
	{
		AI_Output (other, self,"ORG_801_Lares_GetKraut_15_02"); //Jestli myslÌö tu velkou hromadu drogy, tak tu uû m·m.
		AI_Output (self, other,"ORG_801_Lares_GetKraut_11_03"); //Vypad· to, ûe jsi skuteËnÏ Ëipern˝!
	};
	
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_04"); //Jestli tu drogu m·ö, prodej ji. P¯ines mi 400 nuget˘.
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_05"); //Pak si znovu promluvÌme o tvÈm p¯ijetÌ do tlupy.
	Lares_Get400Ore = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"M·m p¯evzÌt drogu Baala Isidra a prodat ji za 400 nuget˘.V˝tÏûek dostane Lares.");	
};

// ****************************** 
//			400 Ore
// ******************************

INSTANCE   ORG_801_Lares_400Ore (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_400Ore_Condition;
	information	= ORG_801_Lares_400Ore_Info;
	permanent	= 1;
	description = "M·m tÏch 400 nuget˘.";
};                       

FUNC int  ORG_801_Lares_400Ore_Condition()
{
	if ( (Lares_Get400Ore == LOG_RUNNING) && ((BaalIsidro_DealerJob==LOG_RUNNING)||(BaalIsidro_DealerJob==LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_400Ore_Info()
{
	AI_Output			(other, self,"ORG_801_Lares_400Ore_15_00"); //M·m tÏch 400 nuget˘.
	if (Npc_HasItems(other,itminugget)>=400)
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_11_01"); //V˝bornÏ! Velmi dob¯e! MyslÌm, ûe to by mÏlo staËit.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		
		B_GiveInvItems	(other, self, ItMiNugget, 400);
	    B_LogEntry		(CH1_JoinNC,"Lares byl zjevnÏ spokojen˝, kdyû jsem mu p¯edal tÏch 400 nuget˘, kterÈ jsem utrûil prodejem drogy Baala Isidra.");	
		B_GiveXP		(XP_BaalIsidroPayLares);	
	}
	else
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_NOORE_11_00"); //PoËÌtej znovu. Douf·m, ûe jsi neutratil polovinu za chlast.
	};
};

// ****************************** 
//		Reicht das jetzt???
// ******************************

INSTANCE   ORG_801_Lares_Reicht (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 5;
	condition	= ORG_801_Lares_Reicht_Condition;
	information	= ORG_801_Lares_Reicht_Info;
	permanent	= 1;
	description = "StaËÌ to, abych se mohl p¯idat?";
};                       

FUNC int  ORG_801_Lares_Reicht_Condition()
{
	if ( Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) 
	&& ( Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList) )
	&& (Npc_GetTrueGuild(other)==GIL_NONE) && (Kapitel <2) )
	
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_Reicht_Info()
{
	AI_Output (other, self,"ORG_801_Lares_Reicht_15_00"); //StaËÌ to, abych se mohl p¯idat?
	
	if ( (Points_NC >= 30) && (hero.level >= 5) )
	{
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //To bych ¯ekl!
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //A m·m pro tebe d·rek. LepöÌ zbroj. NenÌ to moc, ale vydÏlal sis na ni.
	
		hero.guild = GIL_ORG;
		Npc_SetTrueGuild	(hero,GIL_ORG );
		CreateInvItem		(hero,ORG_ARMOR_L);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
		B_GiveXP			(XP_BecomeBandit);	

		B_LogEntry			(CH1_JoinNC,"Lares mÏ p¯ijal za Ëlena svÈ tlupy. TeÔ je Nov˝ t·bor m˝m domovem!");
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_SUCCESS);

		// Canceln der anderen Aufnahmen
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"»len Laresovy tlupy se nem˘ûe p¯idat ke StarÈmu t·boru. To je nemoûnÈ.");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry			(CH1_JoinPsi,"Bratrstvo se bude muset beze mÏ obejÌt, protoûe jsem nynÌ doma v NovÈm t·bo¯e.");
		
		Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
	}
	else
	{
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_MordragSentMe))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_02"); //Mordrag se za tebe p¯imluvil.
		};
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_BringList))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_03"); //Stal jsi se oblÌben˝m od okamûiku, kdy jsi sem donesl ten seznam.
		};
		AI_Output (self, other,"ORG_801_Lares_Reicht_11_04"); //Nejsi ale jeötÏ p¯ipraven˝. ProveÔ svÈ ˙koly.
		
		B_PrintGuildCondition(5);
	};
};

// ****************************** 
//			Goto Kalom
// ******************************

INSTANCE   ORG_801_Lares_GotoKalom (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 10;
	condition	= ORG_801_Lares_GotoKalom_Condition;
	information	= ORG_801_Lares_GotoKalom_Info;
	permanent	= 0;
	description = "A co se oËek·v·, ûe m·m udÏlat?";
};                       

FUNC int  ORG_801_Lares_GotoKalom_Condition()
{
	if ( Npc_GetTrueGuild(other)==GIL_ORG )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_GotoKalom_Info()
{
	AI_Output (other, self,"ORG_801_Lares_GotoKalom_15_00"); //A co se oËek·v·, ûe m·m udÏlat?
	AI_Output (self, other,"ORG_801_Lares_GotoKalom_11_01"); //Jsi teÔ Ëlenem naöÌ tlupy. M˘ûeö si dÏlat, co chceö.
		
	Log_CreateTopic		(CH1_GotoPsiCamp,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_RUNNING);
	B_LogEntry			(CH1_GotoPsiCamp,"Bratrstvo z t·bora v baûin·ch pl·nuje nÏco velkÈho. Lares, v˘dce bandit˘, chce vÏdÏt, co to je.");

	if	(Lares_InformMordrag == LOG_RUNNING)
	{	
		AI_Output 		(self, other,"ORG_801_Lares_GotoKalom_11_02"); //Jestli chceö b˝t uûiteËn˝, jdi za Mordragem a pomoz mu s tou akcÌ se sekt·¯i.
		B_LogEntry		(CH1_GotoPsiCamp,"Pom˘ûu Mordragovi zjistit, o co tam jde.");
	}
	else
	{
		var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
		if (Npc_IsDead(Mordrag))
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_03"); //Mordrag, jeden z naöich lidÌ, byl ve StarÈm t·bo¯e zabit. Neû zem¯el, poslal n·m zpr·vu. ÿÌk·, ûe se v SektovnÌm t·bo¯e chyst· nÏco obrovskÈho.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_04"); //Jdi t·bora Bratrstva a zjisti, co se tam dÏje.
			B_LogEntry	(CH1_GotoPsiCamp,"Poslal mÏ p¯Ìmo do t·bora Bratrstva.");
		}
		else
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_05"); //Mordrag, jeden z naöich lidÌ, se vr·til zp·tky ze StarÈho t·bora.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_06"); //BÏû za nÌm. ÿekni mu, ûe chci mÌt nÏkoho v SektovnÌm t·bo¯e. Bratrstvo pl·nuje nÏco velkÈho - a j· chci p¯esnÏ vÏdÏt co.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_07"); //Pomoz mu.
			B_LogEntry	(CH1_GotoPsiCamp,"Bandita jmÈnem Mordrag m· tu vÏc na starosti a j· ho najdu v baru na jeze¯e NovÈho t·bora.");
			
			B_ExchangeRoutine(Org_826_Mordrag,"START");
			Lares_InformMordrag = LOG_RUNNING;
		};
	};
};



// ****************************** 
//			Wo lernen?
// ******************************

instance  ORG_801_Lares_WhereLearn (C_INFO)
{
	npc				= ORG_801_Lares;
	nr				= 20;
	condition		= ORG_801_Lares_WhereLearn_Condition;
	information		= ORG_801_Lares_WhereLearn_Info;
	permanent		= 0;
	description		= "Kde se m˘ûu nÏco nauËit?"; 
};

FUNC int  ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

FUNC void  ORG_801_Lares_WhereLearn_Info()
{
	AI_Output 		(other, self,"ORG_801_Lares_WhereLearn_Info_15_01"); //Kde se m˘ûu nÏco nauËit?
	AI_Output 		(self, other,"ORG_801_Lares_WhereLearn_Info_11_02"); //U mÏ. M˘ûu ti pomoci procviËit tvou obratnost a sÌlu.
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Lares mÏ m˘ûe nauËit, jak zlepöit svou ZRU»NOST a SÕLU.");

};  
// ******************************
// 		STR + DEX LERNEN
// ******************************
INSTANCE ORG_801_Lares_Teach(C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 20;
	condition	= ORG_801_Lares_Teach_Condition;
	information	= ORG_801_Lares_Teach_Info;
	permanent	= 1;
	description = "Chci se zlepöit.";
};                       

FUNC INT ORG_801_Lares_Teach_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_801_Lares_WhereLearn))
	{
		return TRUE;
	};
};
FUNC VOID ORG_801_Lares_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //Chci se zlepöit.
	
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_BACK()
{
	Info_ClearChoices	(ORG_801_Lares_Teach);
};

func void ORG_801_Lares_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};
