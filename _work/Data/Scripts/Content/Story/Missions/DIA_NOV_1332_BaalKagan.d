// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Ty jsi ze Sektovního tábora, viï?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Ty jsi ze Sektovního tábora, viï?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Øíkáme tomu Bratrstvo.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Jsem Baal Kagan. Spáè buï s tebou.
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Co tady dìláš?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Co tady dìláš?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Pùvodnì jsem sem byl vyslán, abych pøesvìdèoval lidi, aby se pøidali k našemu Bratrstvu.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ti barbaøi ale nemají vùbec zájem o duchovní osvìtu. Proto jsem se omezil na prodej drogy z bažiny.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //A to je tady oblíbené zamìstnání. Pøíliš oblíbené. Sotva staèím uspokojovat poptávku.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan prodává lodyhy drogy banditùm a žoldákùm v Novém táboøe.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Ukaž mi svoje zboží.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Ukaž mi svoje zboží.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Jak chceš.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "Proè sem nepošlou jednoho muže navíc?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Proè sem nepošlou jednoho muže navíc?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro mi chtìl pomáhat, ale pak se zasekl na celý den v baru na jezeøe a všechnu drogu vymìnil za rýžovou pálenku.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Stal se obìtí té lihoviny. Obávám se, že s jeho pomocí nemùžu poèítat.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro sedí v baru na jezeøe a celé dny pije.");	
	};
};

// ************************************************************
// 					Ich könnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Mohl bych ti pomoci prodávat tvou drogu lidem.";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Mohl bych ti pomoci prodávat tvou drogu lidem.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Takové množství drogy mùžu svìøit jedinì nìkomu z èlenù Bratrstva.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Mohl bys mi ale pomoci rozdávat dary.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Moje zboží ještì neokusili všichni. Jakmile jednou okusí tu drogu, budou chtít víc a víc, což pro mì bude znamenat lepší obchod.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Myslel jsem si, že se ti sotva podaøí vykonat tvùj úkol TEÏ.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //O Baala Isidra bude brzy postaráno. Už jsem poslal Cor Kalomovi zprávu.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "Co dostanu, když budu za tebe roznášet tu drogu?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Co dostanu, když bude za tebe roznášet tu drogu?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Mùže tì odmìnit rùznými zpùsoby.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Mùžeš ode mì dostat magické svitky, které v sobì mají silné Spáèovo kouzlo.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Nebo ti mùžu pomoci pøidat se k naší komunitì, pokud bys to chtìl. Mám velmi dobré kontakty s Cor Kalomem a Baalem Tyonem.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Oba mají velmi blízko k Y´Berionovi, našemu mistrovi.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Mùžu ti ale také zaplatit pøímo rudou, když budeš chtít. 100 nugetù by ti za tvou snahu mìlo staèit.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "Dobrá, dej mi tu drogu. Komu chceš, abych ji pøedal?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Dobrá, dej mi tu drogu. Komu chceš, abych ji pøedal?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Jistì nìkoho najdeš, kdo ji bude chtít. Øekni lidem. Ale dávej pouze po JEDNÉ lodyze na osobu.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //A ještì dùležitá vìc: jestli si tu drogu necháš od nìkoho sebrat, nebo ji vykouøíš sám, naše domluva padá.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Jistì.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Novic Baal Kagan mi pøedal 10 lodyh drogy od mladých novicù, které musím rozdat v Novém táboøe. ");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "Rozdal jsem všechnu drogu.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Rozdal jsem všechnu drogu.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //První noví zákazníci mì už navštívili. Odvedl jsi výbornou práci.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Co budeš chtít za odmìnu?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Vezmu si rudu.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Pomoz mi vstoupit do Bratrstva.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Tyto kouzelné svitky jsou také docela zajímavé - jaký druh kouzla mají?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan má nové zákazníky a já svoji odmìnu.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Nevidìl jsem žádného nového zákazníka. Rozdej ještì další.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Tyto kouzelné svitky jsou také docela zajímavé - jaký druh kouzla mají?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Vìtrnou pìst, telekinezi, pyrokinezi a spánek. Mùžeš si vybrat tøi z nich.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Vezmu si tøi kouzelné svitky.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Pomoz mi vstoupit do Bratrstva.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Tvùj požadavek je malièkost. Pomùžu ti, tak mì poslouchej. Baal Tyon je jedním z Guru - právì tak jako já.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y´Berion ho jmenoval jedním ze svých rádcù. To se nemìlo stát.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Myslí si teï, že je velmi dùležitý, a proto nemluví s nikým jiným než se svými žáky.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Když mu dáš tohle, rozváže mu to jazyk.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Baal Kagan mi pøedal speciální PØIVOLÁVAÈ SNÙ pro Baala Tyona. To mi pomùže pøidat se k sektì Bratrstva.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Vezmu si tìch 100 nugetù.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Velmi dobøe. Tady.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Vezmu si ty kouzelné svitky.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Dobré rozhodnutí. Vem si tøi.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Úder vìtru",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Telekineze",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pyrokineze",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Spánek",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Šarm",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou tøi. Užívej je moudøe.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou tøi. Užívej je moudøe.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou tøi. Užívej je moudøe.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou tøi. Užívej je moudøe.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou tøi. Užívej je moudøe.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




