// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Nevypadáš, jako bys každého pustil na hrad.";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Nevypadáš, jako bys každého pustil na hrad.
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Na hrad smìjí jenom Gomezovi muži.
};

// ************************************************************
// 					Ich will für Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Chci pro Gomeze pracovat.";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Chci pro Gomeze pracovat.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Vážnì? A proè si myslíš, že by ti Gomez chtìl dát práci?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Diego øekl, že ty rozhoduješ, kdo je pro Gomeze zajímavý.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego øíká, že TY rozhoduješ, o koho bude mít Gomez zájem.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //No... Jestli Diego øíká, že jsi v pohodì, proè se o tebe nepostará ON?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Poslouchej, vysvìtlím ti to. Diego si tì chce vyzkoušet. Jestli si ON myslí, že jsi dost dobrý, tak tì pustím na hrad, abys mohl navštívit Gomeze.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //Cokoliv se stane, je to na tebe, jasný?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Øeknu to Diegovi.
	
	B_LogEntry(CH1_JoinOC,"Thorus mi øekl, že jestli chci být pøijat do Starého tábora, mìl bych si promluvit s Diegem. Diego mì vyzkouší.");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "Proè mì nevyzkoušíš?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Proè mì nevyzkoušíš?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //To není tak jednoduché, chlapèe! Každý nováèek, který se chce kamkoliv dostat, musí mít ochránce.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //A tím ochráncem musí být nìkdo z Gomezových lidí. Vyzkouší tì sám.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //A jestli zklameš, je to na tvoje vlastní riziko - to je zdejší zákon.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Je tu urèitì nìco, co chceš udìlat.";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Je tu urèitì nìco, co chceš udìlat.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Ne. Vìci se mají tak, že my, strážci, jsme trochu víc než ty, hochu.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Ty akorát provedeš úkoly, které pro tebe tvùj ochránce pøichystal.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Jsem schopný udìlat cokoliv, co mi pøikážeš.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Jsem schopný udìlat cokoliv, co mi pøikážeš.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Eh? Vypadá to, že jsi odhodlaný, eh... Je tady jedna vìc, kterou mùže vìdìt jen nìkdo, kdo není s Gomezem.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale varuju tì: jestli to vyzradíš, mùžeš se dostat do pìkného maléru!
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Jsem pøipraven vykonat tvùj úkol.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Jsem pøipraven vykonat tvùj úkol.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ti teï povím, zùstane jenom mezi náma dvìma a nikdo jiný se o tom nesmí dozvìdìt, jasný?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasný.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Mám potíže s jedním chlapíkem z Nového tábora. Jmenuje se Mordrag. Kradl u Rudobaronù.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Samozøejmì máme v Novém táboøe hromadu zabijákù, ale ten chlapík mìl takové nervy, že pøišel do NAŠEHO tábora a prodával NAŠE zboží NAŠIM lidem!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Zašel moc daleko. Dobøe ale ví, že s tím nemùžu nic udìlat.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Jak to?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Protože je pod ochranou mágù.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Postarám se o to.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Chceš po mnì, abych toho chlapíka zabil?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Proè ho mágové ochraòují?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Zdá se, že ti mágové jsou pro tebe problém...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus mì požádal, abych z tábora vyhnal lumpa jménem Mordrag. Jak to udìlám, je prý má vìc. Nikdo však nesmí vìdìt, že za tím stojí Thorus.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Postarám se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chceš po mnì, abych toho chlapíka zabil?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chci, abys zaøídil, abych se už na nìj nikdy nemusel podívat. Je mi jedno, jak to udìláš.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Kde Mordraga najdu?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Najdeš ho u jižní brány na druhé stranì hradu, pøímo za vstupem. Ten bastard by se už nikdy nemìl odvážit pøijít do tábora.
	B_LogEntry(CH1_MordragKO,"Mordrag je u jižní brány za hradem.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Proè ho mágové ochraòují?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Protože jim slouží jako poslíèek. Naši kouzelníci jsou v kontaktu s mágy v Novém táboøe. Èasto posílají poslíèky tam a zpátky.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Byli by nejspíš HODNÌ rozzlobení, kdybych nìkterého z jejich poslíèkù vyhodil z tábora, nebo ho zabil.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co JÁ? Co myslíš, že udìlají MNÌ?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jsi tu nový, mùžeš být v klidu. Já ale zodpovídám za to, co dìlají moji chlapi. Proto je nesmírnì dùležité, abys držel jazyk za zuby.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Zdá se, že ti mágové jsou tvùj problém...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Jistì, ale jsou takovým problémem, který se tìžce øeší. Pøed pár lety se jeden ze Stínù pokusil ve spánku probodnout Velkého mága Ohnivého kruhu.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Potom ho našli na Vnìjším okruhu - po pravdì øeèeno, sbírali ho po CELÉM  Vnìjším okruhu.
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "O Mordragovi...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Postarám se o to.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Mordrag už nikdy nikomu nic neukradne!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Už se tu nikdy víc neukáže!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Postarám se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag už nikdy nikomu nic neukradne!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Myslíš tím, žes ho porazil? To není špatné, hochu.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus byl potìšen, že mu Mordrag zmizel z cesty. Výhoda pro mì.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Už se tu nikdy víc neukáže!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Byl bych radši, kdybys ho zabil.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus je rád, že už Mordrag není v táboøe.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Špatnì! Øíkal jsem ti NEVYSLOVUJ MOJE JMÉNO!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Vyzradil jsi to! Na všechno jsi zapomnìl! Neopovažuj se už nijak do té záležitosti znovu pouštìt!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Thorusovi se nelíbilo, že jsem Mordragovi øekl jeho jméno. Myslím, že bych mu chvíli nemìl chodit na oèi.");
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Kdybych ti dal urèité množství rudy, pustil bys mì na hrad?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Kdybych ti dal urèité množství rudy, pustil bys mì na hrad?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Za urèité množství...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Jak velké?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Dobrá - musí být takové, aby se muselo chvíli poèítat. Dost dlouho na to, aby bylo jisté, že já i mí chlapi budeme zamìstnaní jeho poèítáním, zatímco ty vklouzneš dovnitø.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Tak øekni kolik?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //1000 nugetù by mìlo staèit.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 nugetù?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Dobøe, tak se pøidej ke Gomezovi, a budeš mít vstup na hrad zdarma.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "Mám 1000 magických nugetù. Teï mì pus dovnitø!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Mám 1000 magických nugetù. Teï mì pus dovnitø!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //Dobrá, bìž pøímo rovnì. Mùžeš jít do hradu, ale žádné hlouposti, jasný?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Nezkoušej na mì žádné triky, chlapèe. Ty nemáš žádných 1000 magických nugetù!
	};
};
		
// ************************************************************
// 					Brief für Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "Potøebuju se dostat do hradu! Nesu dopis pro nejvyššího Mága Ohnì.";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Potøebuju se dostat do hradu! Nesu dopis pro nejvyššího Mága Ohnì.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //A ty si myslíš, že tì pustím do hradu, abys ho pøedal a shrábl odmìnu?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Tak.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Dobrá, ukaž mi tu zprávu.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Nemùžu ji ukázat TOBÌ - zapomeò na to!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //Dobøe, zapomnìl jsem.
};

// ************************************************************
// 					Bereit für Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego øíká, že mùžu vidìt Gomeze!";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego øíká, že mùžu vidìt Gomeze!
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //O tom rozhoduju já!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //A jak ses rozhodl?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Musím pøipustit, že svoji práci dìláš opravdu dobøe.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Dobrá! Mùžeš za Gomezem. Sám rozhodne, jestli se k nám pøidáš, nebo ne.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Od teïka jsi jedním z nás, hochu.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "Mám tady od Cora Kaloma zásilku drogy z bažin pro Gomeze.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Mám tady od Cora Kaloma pro Gomeze zásilku drogy z bažin.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Ukaž mi ji!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //Dobrá! Mùžeš dál. Jdi pøímo do Rudobaronova domu. Bartholo tì tam bude èekat.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Na poslíèka té drogy moc nemáš! Doufám, žes tu zásilku už nerozprodal nìkde jinde! Vra se, až budeš mít to správné množství!
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Jsem posel mágù Vody. Potøebuju se dostat na hrad!";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Jsem posel mágù Vody. Potøebuju se dostat na hrad!
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Máš sebou amulet kurýra. S tím projdeš skrze stáže.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //S mágy nechci mít nic spoleèného. Pøestaò mì obtìžovat, jo?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //To jistì jsi. Ale asi jsi musel nìkde zapomenout amulet kurýra, viï?
	};
};

// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Vyøízeno. Teï jsem èlenem tábora.";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Vyøízeno. Teï jsem èlenem tábora.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Gratuluju, hochu! Ode dneška se radìji drž v blízkosti Diega.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Musím jen nìco OPRAVDU dùležitého øíci Gomezovi nebo Ravenovi.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Jak to jde?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak se máš?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //S Novým táborem nemáme tolik starostí. Spíš mám obavy z tìch sektáøských bláznù.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chceš mi nìco øíci?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chceš mi nìco øíci?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Ano. To, jak sis poèínal v dolech, nejen dokázalo urèitou odvahu, ale také prokázalo tvoji sílu a umìní v boji.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Jsem rozhodnutý tì pøijmout mezi své stráže.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale nejsi zatím úplnì pøipravený stát se strážcem. Potøebuješ ještì získat trochu zkušeností, než tì budu moci koneènì pøijmout.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Dávám ti šanci. Co na to øíkáš?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Chci se stát strážcem."; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chci se stát strážcem.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //To rád slyším. Nejprve ti ale musím øíci nìco, co øíkám všem adeptùm. Poslouchej dobøe, protože to budu øíkat jenom jednou.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Dosud ses jenom pokoušel stát se jedním z nás. Ty dny jsou už pryè. Mí chlapi drží pohromadì. My, strážci, chráníme Rudobarony, tábor a dùl.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Kopáèi dobývají rudu a my je za to nenecháme sežrat èervùm. Rudobaroni vyjednávají s králem, ale my jsme ti, co je chrání.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Ve dne v noci jsme v dole. Ve dne v noci støežíme bránu tábora a staráme se, aby lidi mohli v klidu spát.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Kdysi jsme byli divoká smeèka, ale teï jsme síla, se kterou se poèítá. Tvrdì pracujeme a dáváme své životy za životy druhých.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od svých chlapù oèekávám jednu vìc: že budou držet spolu. Jedinì spolu dokážeme to, co dokázat musíme.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //Potom pøežijeme.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Všechno ostatní se nauèíš bìhem výcviku. Buï pøipravený pomáhat kdekoliv to bude zapotøebí a dìlat cokoliv, co bude tøeba.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Zajdi za Stonem, aby ti dal nìjakou zbroj a meè.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Stonea najdeš v kováøském obchodì na Vnitøním okruhu.

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Jo, a ještì jednu vìc...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Vítej mezi strážemi.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Dnes mì Thorus pøijal mezi stráže. Mám si na hradì u kováøe Stonea vyzvednout svoji novou zbroj.");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Zajímá mì cesta magie."; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Zajímá mì cesta magie.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Dobrá, pak by sis mìl možná promluvit s Corristem. Vyuèoval Miltena. Jsem si jistý, že ti nic nestojí v cestì.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "Mohl bys mì uèit?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Mohl bys mì uèit?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Mùžu ti ukázat, jak nabýt sílu a zlepšit umìní boje.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus mi pomùže zdokonalit mou SÍLU a OBRATNOST.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus mì mùže nauèit bojovat s OBOURUÈNÍMI ZBRANÌMI, jen co zvládnu boj s JEDNORUÈNÍMI ZBRANÌMI.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chci se nauèit zacházet s obouruèním meèem.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dobøe, ale nejdøív musíme probrat základy.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Meè musíš držet vodorovnì. Potøebuješ silnìjší rozmach, abys mohl na nepøítele zaútoèit takovou tìžkou zbraní.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Zvedni ruku a rozmáchni se rovnou dolu. To obvykle staèí na to, abys nepøítele srazil k zemi.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Toho momentu pak využiješ k novému rozmáchnutí.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Obouruèní meèe jsou ideální k zasazování boèních úderù, kterými si nepøítele udržíš od tìla.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To by mohlo pro zaèátek staèit. Trénuj.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chci se dozvìdìt víc o boji s obouruèním meèem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Ze všeho nejdøíve musíš zaujmout základní postoj. Meè musíš držet svisle, stranou od tìla a údery vést silnì obìma rukama.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Švihnout rychle dolu a ostøí vést pøes rameno. Pak máš šanci provést rychlý švih napravo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Tvùj protivník nebude mít šanci se k tobì dostat.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Nebo meèem švihni z levé horní strany smìrem dopøedu, abys odrazil protivníka dozadu.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Poøád se otáèej, abys následnému švihu vždy dodával potøebnou sílu, která protivníka srazí.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Pokud to nebude staèit, zbylý švih využij k novému napøáhnutí meèe.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Až útok dokonèíš, zneškodni protivníka a vyèkej na další souboj.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Klíèem k úspìchu je mìnit postoje a polohy.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
