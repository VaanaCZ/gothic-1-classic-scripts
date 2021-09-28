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
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_00"); //Jak siê tu dosta³eœ? Co siê dzieje z Roscoe?
		AI_Output	(other, self,"ORG_801_Lares_YouHere_15_01"); //Wola³ nie próbowaæ mnie powstrzymywaæ!
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_02"); //Czego chcesz?
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
	description = "Chcê do was do³¹czyæ.";
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
	AI_Output (other, self,"ORG_801_Lares_WannaJoin_15_00"); //Chcê do was do³¹czyæ.
	AI_Output (self, other,"ORG_801_Lares_WannaJoin_11_01"); //Tak? A co takiego mo¿esz nam zaoferowaæ?
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
	description = "Mam przy sobie listê zamówieñ dla Starej Kopalni.";
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
	AI_Output (other, self,"ORG_801_Lares_BringList_15_00"); //Mam przy sobie listê zamówieñ dla Starej Kopalni.
	AI_Output (self, other,"ORG_801_Lares_BringList_11_01"); //O niech mnie... Albo jesteœ cholernie odwa¿ny, albo cholernie g³upi...
	AI_Output (self, other,"ORG_801_Lares_BringList_11_02"); //Poka¿!
	AI_Output (other, self,"ORG_801_Lares_BringList_15_03"); //Oto ona...
	B_UseFakeScroll();
	AI_Output (self, other,"ORG_801_Lares_BringList_11_04"); //Rzeczywiœcie! Wiesz, co z ni¹ teraz zrobimy? Dopiszemy parê rzeczy, a ty zaniesiesz j¹ do Starego Obozu!
	AI_Output (self, other,"ORG_801_Lares_BringList_11_05"); //A jak ju¿ dostarcz¹ wszystko do kopalni, obrabujemy ich ze wszystkiego! To nie zajmie d³ugo... Ha! Masz tu listê. Wiesz, co masz robiæ.
	//AI_Output (self, other,"ORG_801_Lares_BringList_11_06"); //Das haben wir gleich ... So! Hier ist die Liste. Du weißt, was du zu tun hast.
	
	Points_NC = Points_NC + 10;
	
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem		(hero,	TheList);
	CreateInvItem			(hero,	TheListNC);
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Przywódca szkodników by³ zaskoczony, gdy wrêczy³em mu listê zamówieñ. Doda³ do niej kilka rzeczy i kaza³ mi dostarczyæ j¹ Diego.");		
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
	description = "Przekaza³em listê Diego.";
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
	AI_Output			(other, self,"ORG_801_Lares_BringListBack_15_00"); //Przekaza³em listê Diego.
	AI_Output			(self, other,"ORG_801_Lares_BringListBack_11_01"); //Œwietnie! Rozmieœci³em paru ludzi na drodze do Starej Kopalni. Stra¿nicy Thorusa pewnie ju¿ gryz¹ ziemiê.
		
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;

	B_LogEntry			(CH1_JoinNC,"Ludzie Laresa obrabowali ju¿ konwój ze Starego Obozu. NajwyraŸniej przywódca Szkodników nie zamierza³ czekaæ do mojego... a raczej NA WYPADEK mojego powrotu!");		

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
	description = "Napadliœcie ju¿ na konwój?! A gdzie moja dola?!";
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
	AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_00"); //Napadliœcie ju¿ na konwój?! A gdzie moja dola?!
	AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_01"); //Pogadaj z Gornem. On ci coœ da.
	var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	if (gorn.aivar[AIV_FINDABLE]==TRUE)
	{
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_02"); //Znam Gorna, ale on nie nale¿y do waszej bandy. Jest Najemnikiem, pracuje dla Magów.
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_03"); //Zgadza siê.
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_04"); //To on te¿ macza³ w tym palce?
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_05"); //Czasem lepiej jest nie wiedzieæ za du¿o. IdŸ do niego po swoj¹ nagrodê.
	};
	B_LogEntry(CH1_JoinNC,"Gorn uczestniczy³ w jakiœ sposób w napadzie na konwój. Mam od niego odebraæ swoj¹ dolê.");
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
	description = "Przysy³a mnie Mordrag. Mam dla ciebie pierœcieñ.";
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
    
	AI_Output (other, self,"ORG_801_Lares_MordragSentMe_15_00"); //Przysy³a mnie Mordrag. Mam dla ciebie pierœcieñ.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_01"); //Cenna b³yskotka. To taki zwyczaj - czêœæ ³upu oddaje siê szefowi bandy.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_02"); //Ale skoro powierzy³ ci ten pierœcieñ, musi mieæ o tobie wysokie mniemanie.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_03"); //Chcê, ¿ebyœ poszed³ do niego i przekaza³ mu wiadomoœæ ode mnie.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_04"); //Powiedz mu, ¿e potrzebujê kogoœ w obozie na bagnie. Bractwo planuje coœ du¿ego, a ja chcê wiedzieæ, co siê tam bêdzie dzia³o.
	
	Lares_InformMordrag = LOG_RUNNING;
		
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Lares wys³a³ mnie do Mordraga. Mam mu przekazaæ, ¿e do obozu Bractwa nale¿y wys³aæ szpiega.");	
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
	description = "Uda³o mi siê omin¹æ twoje stra¿e.";
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
	AI_Output (other, self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //Uda³o mi siê omin¹æ twoje stra¿e.
	AI_Output (self, other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //Fakt. Ale to jeszcze za ma³o.
		
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
	description = "To co mam zrobiæ, ¿eby ciê przekonaæ?";
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
	AI_Output (other, self,"ORG_801_Lares_GetKraut_15_00"); //To co mam zrobiæ, ¿eby ciê przekonaæ?
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_01"); //Pewien cz³owiek z Sekty, niejaki Baal Isidro, ma przy sobie ziele warte co najmniej 400 bry³ek rudy. Chcê, ¿ebyœ mi je przyniós³. Jak tego dokonasz - to ju¿ twoja sprawa.
	
	if ( (BaalIsidro_DealerJob==LOG_RUNNING) || (BaalIsidro_DealerJob==LOG_SUCCESS) )
	{
		AI_Output (other, self,"ORG_801_Lares_GetKraut_15_02"); //Jeœli masz na myœli tê stertê trawy, to mam j¹ ju¿ od dawna.
		AI_Output (self, other,"ORG_801_Lares_GetKraut_11_03"); //Widzê, ¿e sprytny z ciebie ch³opak!
	};
	
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_04"); //Skoro masz ju¿ ziele, chcê, ¿ebyœ je sprzeda³. Przynieœ mi 400 bry³ek rudy.
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_05"); //Wtedy wrócimy do twojego cz³onkostwa w mojej bandzie.
	Lares_Get400Ore = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mam zabraæ partiê ziela Baalowi Isidro i sprzedaæ j¹ za 400 bry³ek rudy. Zyski maj¹ trafiæ do Laresa.");	
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
	description = "Mam dla ciebie 400 bry³ek.";
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
	AI_Output			(other, self,"ORG_801_Lares_400Ore_15_00"); //Mam dla ciebie 400 bry³ek.
	if (Npc_HasItems(other,itminugget)>=400)
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_11_01"); //Dobrze! Œwietnie! To mi chyba wystarczy.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		
		B_GiveInvItems	(other, self, ItMiNugget, 400);
	    B_LogEntry		(CH1_JoinNC,"Lares otrzyma³ swoje 400 bry³ek rudy ze sprzeda¿y ziela. Wydawa³ siê usatysfakcjonowany.");	
		B_GiveXP		(XP_BaalIsidroPayLares);	
	}
	else
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_NOORE_11_00"); //Lepiej przelicz jeszcze raz! Mam nadziejê, ¿e nie wyda³eœ ich na gorza³ê!
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
	description = "Czy to wystarczy, byœcie mnie przyjêli?";
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
	AI_Output (other, self,"ORG_801_Lares_Reicht_15_00"); //Czy to wystarczy, byœcie mnie przyjêli?
	
	if ( (Points_NC >= 30) && (hero.level >= 5) )
	{
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //Myœlê, ¿e tak!
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //I mam dla ciebie ma³y prezent! Lepszy pancerz. Mo¿e nie jest to szczyt marzeñ, ale zas³u¿y³eœ na niego.
	
		hero.guild = GIL_ORG;
		Npc_SetTrueGuild	(hero,GIL_ORG );
		CreateInvItem		(hero,ORG_ARMOR_L);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
		B_GiveXP			(XP_BecomeBandit);	

		B_LogEntry			(CH1_JoinNC,"Lares przyj¹³ mnie do swojej bandy. Od dziœ Nowy Obóz bêdzie moim nowym domem.");
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_SUCCESS);

		// Canceln der anderen Aufnahmen
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Cz³onek bandy Laresa nie mo¿e do³¹czyæ do Starego Obozu!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry			(CH1_JoinPsi,"Bractwo bêdzie musia³o radziæ sobie beze mnie. Od dziœ moim domem jest Nowy Obóz!");
		
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
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_02"); //Mordrag opowiedzia³ siê za tob¹.
		};
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_BringList))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_03"); //Sta³eœ siê bardzo popularny, odk¹d przynios³eœ nam tê listê.
		};
		AI_Output (self, other,"ORG_801_Lares_Reicht_11_04"); //Ale nie jesteœ gotowy. Popracuj nad sob¹ jeszcze trochê.
		
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
	description = "I co mam robiæ dalej?";
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
	AI_Output (other, self,"ORG_801_Lares_GotoKalom_15_00"); //I co mam robiæ dalej?
	AI_Output (self, other,"ORG_801_Lares_GotoKalom_11_01"); //Nale¿ysz teraz do naszej bandy. Mo¿esz robiæ, co ci siê ¿ywnie podoba.
		
	Log_CreateTopic		(CH1_GotoPsiCamp,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_RUNNING);
	B_LogEntry			(CH1_GotoPsiCamp,"Bractwo Œni¹cego planuje coœ du¿ego. Lares, przywódca Szkodników z Nowego Obozu, chce siê dowiedzieæ, co to jest.");

	if	(Lares_InformMordrag == LOG_RUNNING)
	{	
		AI_Output 		(self, other,"ORG_801_Lares_GotoKalom_11_02"); //Jeœli chcesz robiæ coœ po¿ytecznego, pogadaj z Mordragiem i pomó¿ mu w sprawie Sekty.
		B_LogEntry		(CH1_GotoPsiCamp,"Mam pomóc Mordragowi w wyjaœnieniu tej sprawy!");
	}
	else
	{
		var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
		if (Npc_IsDead(Mordrag))
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_03"); //Zgin¹³ Mordrag, jeden z naszych ludzi w Starym Obozie. Przed œmierci¹ zd¹¿y³ przys³aæ nam wiadomoœæ. Wygl¹da na to, ¿e w obozie Sekty dzieje siê coœ wa¿nego.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_04"); //Chcê, ¿ebyœ uda³ siê do obozu na bagnie i trochê tam powêszy³.
			B_LogEntry	(CH1_GotoPsiCamp,"Wys³a³ mnie wprost do obozu Bractwa.");
		}
		else
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_05"); //Wróci³ Mordrag, jeden z naszych ludzi w Starym Obozie.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_06"); //Chcê, ¿ebyœ z nim porozmawia³. Powiedz mu, ¿e potrzebujê wtyczki w obozie Sekty. Bractwo planuje coœ du¿ego, a ja chcê wiedzieæ, co siê tam dzieje.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_07"); //Masz mu pomóc.
			B_LogEntry	(CH1_GotoPsiCamp,"Ma siê tym zaj¹æ Szkodnik imieniem Mordrag. Znajdê go w karczmie na jeziorze.");
			
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
	description		= "Gdzie mogê siê tu czegoœ nauczyæ."; 
};

FUNC int  ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

FUNC void  ORG_801_Lares_WhereLearn_Info()
{
	AI_Output 		(other, self,"ORG_801_Lares_WhereLearn_Info_15_01"); //Gdzie mogê siê tu czegoœ nauczyæ.
	AI_Output 		(self, other,"ORG_801_Lares_WhereLearn_Info_11_02"); //Na przyk³ad u mnie. Mogê ci pokazaæ, jak zwiêkszyæ twoj¹ si³ê i zrêcznoœæ.
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Lares mo¿e mi pokazaæ, jak zwiêkszyæ moj¹ si³ê i umiejêtnoœci.");

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
	description = "Chcê nauczyæ siê czegoœ nowego.";
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
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //Chcê nauczyæ siê czegoœ nowego.
	
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
