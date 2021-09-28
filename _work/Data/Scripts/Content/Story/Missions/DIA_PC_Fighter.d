//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Do boje!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Ještì se uvidíme.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begrüßung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hej. Nová tváø.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kdo jsi?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Jsem Gorn, žoldák mágù.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "Co musíš dìlat jako žoldák mágù?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Co musíš dìlat jako žoldák mágù?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee uzavøel s mágy smlouvu. Pronajímá nejlepší bojovníky, jaké je možné v kolonii najít. Tedy nás.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Staráme se o to, aby rudaøi mohli tìžit rudu a nebyli pøitom obtìžováni a chráníme mágy pøed nesnázemi.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Mágové se postarají, abychom odsud mohli odejít. A my dostáváme malý podíl rudy jako plat.
};

//*************************************
//			Hütte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "Mùžu tu nìkde zùstat?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Mùžu tu nìkde zùstat, aniž bych musel nìkoho vykopnout z jeho chatrèe?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Myslím, že ne. Ale jestli to opravdu chceš, zajdi za Shrikem.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Má chatrè úplnì vpøedu, u vchodu do jeskynì. Byla prázdná - ale vlastnì patøila nám.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Nám?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Ano, nám žoldákùm. Žoldáci a bandité tu žijí zvláš. A nikdo z Laresovy tlupy by tady, na stranì velké propasti, nemìl co pohledávat.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //Ve skuteènosti v tom není velký rozdíl. On se ale nikoho nezeptal. A tìmhle banditùm nesmíš nechat úplnì všechno projít, protože se z nich pak stanou opravdoví nafoukanci!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Žoldák Gorn mi øekl, že mu Shrike bez dovolení zabral jeho chatrè. Požádal jsem Gorna, aby nikdo ze žoldákù nezasahoval, dokud 'nepøesvìdèím' Shrika, aby si našel jinou chatrè.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			Hütte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Shrike se pøestìhoval do jiné chatrèe.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike se pøestìhoval do jiné chatrèe.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Dobøe. Torlof mi právì øekl, že by si chtìl s tím chlapíkem promluvit.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Gorn byl velmi potìšen, když jsem Shrika vyrazil z jeho chatrèe. Myslím, že je to ten nejèestnìjší chlapík. Mìl bych s ním v budoucnu držet.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			Söldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Co musím udìlat, abych se mohl pøidat k Novému táboru?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Co musím udìlat, abych se mohl pøidat k Novému táboru?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Než tì Lee uzná, musíš se nauèit lépe bojovat. Nezáleží na tom, jakou zbraò používáš, ale ty sám musíš být dobrý.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Kromì toho bys mìl mít velké zkušenosti se zdejším životem a tak.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Jestli nebudeš chtít do jiných táborù, mohl by ses zkusit pøidat k banditùm, než zaèneš jako žoldák.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Máš ještì víc tohohle zboží?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Spousty. Chceš udìlat obchod?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Proè ses zúèastnil útoku té tlupy?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Proè ses zúèastnil útoku té tlupy?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //Kdo to øíkal?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Kde bys teda potom vzal tolik toho zboží, kdyby to nebyla pravda?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Nemysli si, že je to všechno z JEDNÉ várky.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //Úèastnil ses útokù pravidelnì?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Kdyby ano, tak bych ti to stejnì neøekl. Leeovi by se to pranic nelíbilo.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Aha.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig für Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Áhh, to jsi ty! Mùj pøítel Lester z tábora z bažin mi øekl všechno o tom, cos tam dìlal.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Na nìkoho, kdo tu ještì není dlouho, máš už docela rozhled.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Už jsem mìl taky párkrát namále, abych se nestal žrádlem pro èervy.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Mám dùležitou zprávu pro mágy Vody!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //Mám dùležitou zprávu pro mágy Vody!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Pak bys mìl mluvit se Saturasem. Je nejvyšší z mágù Vody a celé dny tráví studiemi nìjakých písemností nebo tak.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Bez ohledu na závažnost té zprávy tì však stráže z horní roviny za ním nepustí.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Nemùžeš se za mì pøimluvit?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Já ne, ale Cronos, strážce rudy, by ti mohl udìlit povolení.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Kde najdu toho 'strážce rudy'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Kde najdu toho 'strážce rudy'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Když vyjdeš odtud, projdeš velkou obytnou jeskyní za hrází.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos obvykle bývá u møíže pøed velkou haldou rudy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Je ale trochu arogantní. Budeš ho muset pøesvìdèit, že je tvá zpráva dùležitá.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn mi poradil, abych šel pøímo za nejvyšším mágem Vody, Saturasem. Cronos, držitel rudy, mì vyslechne. Cronose je možné najít v chrámu u møíže nad rudnou haldou."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Zdar, zelenáèi. Jak vidíš, kolonie je malá vesnice.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Není možné jít a nikoho nepotkat.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co tady dìláš?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Co tady dìláš?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Och, pokouším se vystopovat starou legendu.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Legendu?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Ano, Milten, mùj kamarád ze Starého tábora, mi øekl, že tady kdysi žili mniši.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Samozøejmì, už dávno pøedtím, než tady byla Bariéra.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Øíká se, že uctívali boha, který jim dával moc promìòovat se ve zvíøata.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Jsem pøesvìdèený, že tady jsou stále ty poklady ze starých dob.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //Co tì sem pøivedlo?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Hledám magické ohnisko.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Hledám magické ohnisko.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Musí tady nìkde být.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Ta vìc, kterou hledáš, by mohla být ve zøíceninì kláštera za kaòonem.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mohli bychom pokraèovat spoleènì.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Mohli bysme pokraèovat spoleènì.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Dobrý nápad. Tahle oblast se hemží kousavci.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Samotní nejsou pro zkušeného lovce problém, ale vìtšinou loví ve smeèkách.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //Smeèka mùže dokonce i toho nejudatnìjšího šermíøe roztrhat na kusy.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Tak pùjdeme spolu?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Dobøe, ale ještì než vyrazíme, chtìl bych prozkoumat ten kaòon. Rád vím, co mám za zádama.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Pojï se mnou, našel jsem cestu, po které pùjdeme.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"Když jsem se pøiblížil k rozvalinám kláštera, potkal jsem žoldáka Gorna. Vypravil se sem, aby tu hledal  starý poklad.");
	B_LogEntry			(CH3_MonasteryRuin,"Budeme pokraèovat v pátrání spoleènì. Gorn mì varoval pøed velkými smeèkami chòapavcù, které se v této oblasti vyskytují.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Tomu se øíká štìstí. Urèitì tu bývala zásobní jeskynì.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Tak si teï pøevezmi vedení, chtìl bych mít jistotu, že na zpáteèní cestì nezažijeme nìjaké pøekvapení.

	B_LogEntry		(CH3_MonasteryRuin,"Nalezli jsme tajnou zásobovací jeskyni. Kromì toho jeden klíè a dva kouzelné svitky, které vypadaly velmi zajímavì.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Myslím, že už tì ta zøícenina kláštera pøestala zajímat.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Budu pokraèovat sám.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Jestli si to rozmyslíš, tak jdi za mnou.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Ta proklatá brána. Øíkají, že ji nikdo z kolonie nedokáže otevøít.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Ty malé bestie jsou zøejmì jediné, co se dokáže dostat do vnitøního prostoru.

	B_LogEntry		(CH3_MonasteryRuin,"Stojíme pøímo pøed zavøenou bránou. Vypadá to, že zvenèí nepùjde otevøít.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak to dopadlo?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //Co se dìje?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Musíš najít cestu na druhou stranu brány.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Tamhle nahoøe je nìjaká plošina. Ale vypadá to, že je moc vysoko, aby se na ní dalo vyšplhat.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Musíme najít jinou cestu.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Vypadá to jako podstavec pro nìco.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Snad ten artefakt, který hledáš, ležel právì tady.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Doopravdy se podaøilo tu bránu otevøít. To tvoje kouzlo bylo skuteènì šikovné.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //A mùžeme jít dál.

	B_LogEntry		(CH3_MonasteryRuin,"Pomocí kouzelného svitku ze zásobovací jeskynì jsem se promìnil ve žravou štìnici a mohl jsem proklouznout škvírou ve zdi.");
	B_LogEntry		(CH3_MonasteryRuin,"Vrata jsou nyní otevøena.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Myslím, že už tì ta zøícenina kláštera pøestala zajímat.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Budu pokraèovat sám.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Jestli si to rozmyslíš, tak jdi za mnou.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //Tak jsi našel svùj kouzelný artefakt!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Ano. Musím ohnisko pøedat mágùm Vody. Potøebují ho.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Budu tì chvíli doprovázet.

	B_LogEntry		(CH3_MonasteryRuin,"V jakési studovnì jsem našel ohnisko. Gorn mì bude ještì doprovázet.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //K ÈERTU!!! Co je to tady za pøíšeru?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Kde se TO tu vzalo?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //Vypadá to jako jeden z tìch nepøemožitelných trolù. Jen trochu menší!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Jestli se ale chceme odtud dostat, musíme každopádnì pøes tu pøíšeru pøejít.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //To byla døina.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Dobøe, porazili jsme tu pøíšeru. Jestli to ale byl jenom mladý trol...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //...pak bysme se radìji nemìli potkat s jeho rodièi, co?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Tak nìjak.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Tady se naše cesty rozdìlí. Chci tady chvíli zùstat a porozhlédnout se kolem.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Jsem si ale jistý, že se ještì potkáme. Tak na vidìnou, pøíteli.

	B_LogEntry		(CH3_MonasteryRuin,"Na zpáteèní cestì na klášternímu nádvoøí jsme potkali mladého trola. Došlo k tvrdému boji, ve kterém jsme však zvítìzili.");
	B_LogEntry		(CH3_MonasteryRuin,"Má pou s Gornem nyní skonèila. Mám pocit, že jej zase brzy potkám.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Potkal jsem pøes Starým táborem Diega a Miltena!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Potkal jsem pøes Starým táborem Diega a Miltena!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //To jsou dobré zprávy!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Chtìjí navštívit tebe a Lestera. Na vašem obvyklém místì.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Díky. Ve špatných èasech, jako jsou teï, není nic cennìjšího než dobøí pøátelé.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Teï už jsi témìø jedním z nás. Jsi spolehlivý!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"Øekl jsem Lesterovi a Gornovi o setkání s jejich pøáteli. Teï už to není moje vìc. Dál si poradí sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co jsi vidìl ve Svobodném dole?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Co jsi vidìl ve Svobodném dole?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Když jsem se vrátil z rozboøeného kláštera, chtìl jsem se zastavit u Okyla, šéfa Svobodného dolu.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Když jsem ale pøišel, všude se povalovaly mrtvoly.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Zahlédl jsem akorát nìkolik strážcù, kteøí se opevnili u vchodu do dolu.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Jak mohly pouhé dva tucty stráží porazit tolik žoldákù?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //Pøipadalo mi to jako léèka. Nikdo nepøedpokládal, že by útoèníci pøekroèili hory.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Prvek pøekvapení mùže mnohonásobnì zvýšit sílu bojovníka.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co máš teï v plánu?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Co máš teï v plánu?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Celá naše obranná strategie se musí zmìnit. To zabere nìjaký èas.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Dokud Lee a jeho lidé nebudou pøipraveni, pøidám se ke Cordovì provizorní stráži.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Chystáš protiútok?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Zatím ne, ale ten den pøijde.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Jestli mì nìkdy budeš hledat, jdi odtud smìrem k dolu. Budu tam na stráži.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Jak to jde?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Všude klid. Ve Svobodném dole se nic nedìje.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee je poøád zaneprázdnìný organizací naší obrany.
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Jdeš právì vèas. Pøipravujeme protiútok.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //V první fázi pøevezmeme zpìt Svobodný dùl.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Plánuješ jeho pøevzetí jenom se ètyømi muži? Kde jsou všichni žoldáci?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Plánuješ jeho pøevzetí jenom se ètyømi muži? Kde jsou všichni žoldáci?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Èelní útok není dobrý! Gomezovi lidé jsou na to pøíliš dobøe opevnìní!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Mohli bysme ale zahájit tajnou misi a likvidovat jednoho muže po druhém - to by fungovalo.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee mì požádal, abych ti pøedal zprávu.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Jako jeden ze ètyø nejlepších žoldákù jsi byl vybrán, abys vykonal tuhle misi.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Jako mág Kruhu vody a zkušený bojovník jsi byl vybrán, abys vykonal tuhle misi.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Jako jeden z nejlepších banditù jsi byl vybrán, abys vykonal tuhle misi.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //I když nejsi jedním z nás, vykonal jsi pro náš tábor velikou službu a vícekrát jsi dokázal svou kvalitu.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Nabízíme ti pøíležitost, abys vykonal tuhle misi.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Pùjdu s tebou. Dohromady se nám to podaøí!
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "První fáze? Co bude druhá?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //První fáze? Co bude druhá?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Jakmile bude dùl zase náš, zaèneme hledat horský prùsmyk, pøes který pøešli Gomezovi lidé, aby nás napadli!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Když bude ten prùsmyk uzavøený, situace bude zase pod naší kontrolou.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Aha.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Proè právì já?";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Proè právì já?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Už jsi vícekrát dokázal, že jsi souèasnì odvážný i chytrý!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //A kromì toho znáš Starý tábor a jeho stráže líp než kdokoliv z nás.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Pro tenhle úkol jsi nejlepší muž!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Dobrá, tak pojïme dát našim nevítaným hostùm do dolu poøádnou lekci!";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //Dobrá, tak pojïme dát našim nevítaným hostùm do dolu poøádnou lekci!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Neèekal jsem, že øekneš nìco jiného!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Tady je klíè. Je od vrátnice pøed vstupem do dolu.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Proè ne. Potøebuju se stejnì dostat do dolu!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Proè ne. Potøebuju se stejnì dostat do dolu!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //A už máš k tomu jakýkoliv dùvod, jsem rád, že jsme se v téhle vìci spolu dohodli!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Tady je klíè. Je od vrátnice pøed vstupem do dolu.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Och, málem jsem zapomnìl!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Bandita Wolf chce s tebou nutnì mluvit, ještì než odejdeš do dolu.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"Mùže poèkat, máme na práci dùležitìjší vìci.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Pak tam radìji pùjdu hned.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Bandita Wolf chce se mnou mluvit ještì pøedtím, než se vydáme na cestu do dolu. Pùjdu ho navštívit.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Mùže poèkat, máme na práci dùležitìjší vìci.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Jak øíkáš!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Pak tam radìji pùjdu hned.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Udìlej to. Poèkám tady na tebe.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Vypadá to, že chceš mluvit s Wolfem!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //To je špatný smìr! Musíme jít k dolu!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Poèkám na tebe u provizorní strážnice!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Pojïme k dolu!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Pojïme k dolu!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Nejvyšší èas vyhnat odtud stráže!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Jdi napøed, pùjdu za tebou!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //POZOR, NEBEZPEÈÍ!!!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Loví ve smeèkách jako kousavci, ale koušou daleko hùø!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Mìli bysme je sprovodit ze svìta. Znáš mì, mám rád, když vím, co mám za zády.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Zadrž, vidíš všechny ty mrtvoly?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Jdi ke vchodu do dolu, já zùstanu tady a ohlídám, abysme nebyli zezadu nemile zaskoèeni.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Až budeš dole, pùjdu za tebou.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Slyšel jsem, jak bojuješ, a tak jsem za tebou ihned vyrazil.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Starý známý... Ale úèet je srovnaný!
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Dobrá, otevøi ta vrata, já budu hlídat.

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Ach, èlovìèe. To byl opravdu tvrdý boj.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nikdy bych si nebyl pomyslel, že by Gomezovy stráže dokázaly klást takový odpor.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Hlavní je, že jsme je vyhnali z našeho dolu.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Jsem poøád tady a hlídám situaci!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee über die befreite Mine informieren.     ***Björn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jaká je situace?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Jaká je situace?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Všude klid. Ve Svobodném dole se nic nedìje.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Už to nebude dlouho trvat, než sem dorazí posily, které vyslal Lee.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Do té doby bych už byl dávno doma.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //To je zajímavá skøetí standarta, co tady máš.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Patøila tomu skøetímu otrokovi z dolu?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //Je to skøetí symbol pøátelství. Chci s ním jít do skøetího mìsta.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Doufám, že budeš mít štìstí a že budou skøeti respektovat tuhle... VÌC!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








