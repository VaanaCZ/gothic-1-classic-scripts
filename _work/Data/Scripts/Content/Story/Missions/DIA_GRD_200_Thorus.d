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
	description = "Pewnie nie bêdziesz chcia³ wpuœciæ mnie do zamku?";
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
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Pewnie nie bêdziesz chcia³ wpuœciæ mnie do zamku?
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Tylko ludzie Gomeza maj¹ prawo wstêpu.
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
	description = "Chcê pracowaæ dla Gomeza.";
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
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Chcê pracowaæ dla Gomeza.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Czy¿by? A czemu myœlisz, ¿e Gomez chcia³by, ¿eby ktoœ taki jak ty dla niego pracowa³?
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
	description = "Diego mówi, ¿e to TY podejmujesz takie decyzje.";
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
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego powiedzia³, ¿e to TY podejmujesz takie decyzje.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Huh... Jeœli Diego uwa¿a, ¿e jesteœ w porz¹dku, to czemu SAM siê tob¹ nie zajmie?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //S³uchaj uwa¿nie: Diego podda ciê najpierw testowi. Jeœli ON uzna, ¿e siê nadajesz, ja wpuszczê ciê do zamku na spotkanie z Gomezem.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //To, co bêdzie póŸniej, zale¿y ju¿ tylko od ciebie, jasne?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Porozmawiam z Diego.
	
	B_LogEntry(CH1_JoinOC,"Thorus poradzi³ mi, bym porozmawia³ z Diego. To on oceni, czy nadajê siê na cz³onka Starego Obozu.");
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
	description = "Dlaczego sam nie poddasz mnie próbie?";
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
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Dlaczego sam nie poddasz mnie próbie?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //To nie takie proste, ch³opcze. Nowy, który chce tu do czegoœ dojœæ, potrzebuje opiekuna.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Tym opiekunem musi byæ jeden z ludzi Gomeza. I to w³aœnie on podda ciê próbie.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //A jeœli narobisz k³opotów to on poniesie za nie odpowiedzialnoœæ. Takie s¹ tutaj zasady.
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
	description = "Na pewno znajdzie siê dla mnie jakieœ zadanie...";
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
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Na pewno znajdzie siê dla mnie jakieœ zadanie...
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Nie. Rzeczy, którymi zajmuj¹ siê Stra¿nicy przerastaj¹ twoje mo¿liwoœci, ch³opcze.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Trzymaj siê poleceñ swojego opiekuna.
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
	description = "Potrafiê sprostaæ ka¿demu zadaniu, które mi powierzysz.";
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
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Potrafiê sprostaæ ka¿demu zadaniu, które mi powierzysz.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Och? A¿ tak ci zale¿y na wpadce? Hmm. Jest jedna rzecz, któr¹ mo¿e siê zaj¹æ wy³¹cznie cz³owiek nie bêd¹cy w s³u¿bie Gomeza.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale uprzedzam ciê: jak to schrzanisz, bêdziesz mia³ nie lada k³opoty.
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
	description = "Jestem gotów.";
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
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Jestem gotów.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ci za chwilê powiem, musi pozostaæ miêdzy nami, rozumiemy siê?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasne.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Pewien cz³owiek z Nowego Obozu sprawia nam problemy. Nazywa siê Mordrag i przyw³aszczy³ sobie kilka rzeczy nale¿¹cych do Magnatów.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Oczywiœcie to samo mo¿na powiedzieæ o wielu Szkodnikach z Nowego Obozu, ale Mordrag ma czelnoœæ zjawiaæ siê w NASZYM obozie i odsprzedawaæ NASZE rzeczy NASZYM ch³opcom!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //A to ju¿ za wiele. Niestety, ³ajdak wie, ¿e nie mogê z tym nic zrobiæ.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Dlaczego?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Bo jest pod opiek¹ Magów.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Zajmê siê tym.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Chcesz, ¿ebym go zabi³, tak?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Gdzie znajdê Mordraga?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Dlaczego Magowie broni¹ Mordraga?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Widzê, ¿e masz trochê problemów z Magami...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus poprosi³ mnie, bym usun¹³ z obozu Szkodnika imieniem Mordrag. Nie interesuje go jak tego dokonam, byleby tylko nikt siê nie dowiedzia³, ¿e on macza³ w tym palce.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Zajmê siê tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chcesz, ¿ebym go zabi³, tak?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chcê mieæ pewnoœæ, ¿e ju¿ nigdy wiêcej siê tu nie pojawi. Jak to osi¹gniesz - to ju¿ twoja sprawa.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Gdzie znajdê Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Krêci siê przy po³udniowej bramie, po przeciwnej stronie zamku, tu¿ za wejœciem. Sukinsyn boi siê pojawiaæ bli¿ej centrum.
	B_LogEntry(CH1_MordragKO,"Mordrag urzêduje przy po³udniowej bramie, za zamkiem.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Dlaczego Magowie broni¹ Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Bo s³u¿y im za pos³añca. Nasi magowie utrzymuj¹ kontakty z czarodziejami z Nowego Obozu. Czêsto wymieniaj¹ informacje za poœrednictwem goñców.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Podejrzewam, ¿e nieŸle siê wkurz¹ na wieœæ, ¿e coœ przydarzy³o siê ich kurierowi.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co ze mn¹? Co Magowie mog¹ mi zrobiæ?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jesteœ tu nowy, nic ci nie bêdzie. Ale ja odpowiadam za wszystko, co robi¹ moi ludzie. Dlatego musisz trzymaæ jêzyk za zêbami.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Widzê, ¿e masz trochê problemów z Magami...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Tak. I to problemów, które nie ³atwo rozwi¹zaæ. Kilka lat temu jeden z Cieni próbowa³ zasztyletowaæ we œnie Arcymistrza Magów Ognia.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Faceta znaleziono potem w Zewnêtrznym Pierœcieniu. Jeœli chodzi o œcis³oœæ - rozsmarowanego PO CA£YM Zewnêtrznym Pierœcieniu.
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
	description = "Wracaj¹c do Mordraga...";
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
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Zajmê siê tym.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"Gdzie znajdê Mordraga?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Mordrag ju¿ nigdy nikogo nie okradnie!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Facet ju¿ nigdy siê tu nie poka¿e!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Zajmê siê tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag ju¿ nigdy nikogo nie okradnie!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Chcesz powiedzieæ, ¿e go pokona³eœ? NieŸle, ch³opcze.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus jest mi wdziêczny za usuniêcie Mordraga. Zyska³em wp³ywowego przyjaciela.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Facet ju¿ nigdy siê tu nie poka¿e!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Wola³bym, ¿ebyœ go zabi³.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus ucieszy³ siê, ¿e Mordraga nie ma ju¿ w obozie.");
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
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Ty ofiaro! Kaza³em ci TRZYMAÆ JÊZYK ZA ZÊBAMI!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Spartaczy³eœ sprawê! Zapomnij o wszystkim, co ci powiedzia³em. Nie próbuj ju¿ nic wiêcej zdzia³aæ w tej sprawie!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Thorusowi nie spodoba³o siê, ¿e wspomnia³em o nim Mordragowi. Lepiej bêdzie nie pokazywaæ mu siê teraz na oczy.");
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
	description = "Czy za odpowiedni¹ sumkê móg³byœ mnie wpuœciæ do zamku?";
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
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Czy za odpowiedni¹ sumkê móg³byœ mnie wpuœciæ do zamku?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Za odpowiedni¹ sumkê...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Ile?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //No có¿ - liczenie rudy musi potrwaæ odpowiednio d³ugo. Doœæ d³ugo, ¿eby ca³kowicie poch³on¹æ uwagê moj¹ i moich ch³opców. Korzystaj¹c z naszej nieuwagi, móg³byœ przemkn¹æ siê do œrodka...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Czyli ile konkretnie?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //Myœlê, ¿e przeliczenie 1000 bry³ek zajmie nam wystarczaj¹co du¿o czasu.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 bry³ek?!
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Có¿, gdybyœ do³¹czy³ do Gomeza, móg³byœ wejœæ do zamku za darmo.
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
	description = "Masz tu swoje 1000 bry³ek rudy, a teraz pozwól mi przejœæ.";
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
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Masz tu swoje 1000 bry³ek rudy, a teraz pozwól mi przejœæ.
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //W porz¹dku, idŸ. Tylko jak ju¿ bêdziesz w œrodku, nie wywiñ czegoœ g³upiego, dobra?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Próbujesz mnie okpiæ, ch³opcze? Nie masz 1000 bry³ek rudy!
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
	description = "Muszê siê dostaæ do zamku. Mam list do Arcymistrza Magów Ognia.";
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
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Muszê siê dostaæ do zamku. Mam list do Arcymistrza Magów Ognia.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //I myœlisz, ¿e wpuszczê ciê tak po prostu do œrodka, ¿ebyœ odda³ list i zgarn¹³ nagrodê?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Tak.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Dobra, poka¿ ten list.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Nie ma mowy. Zapomnij o tym!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //W porz¹dku. Ju¿ zapomnia³em.
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
	description = "Diego powiedzia³, ¿e jestem ju¿ gotów, by spotkaæ siê z Gomezem.";
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
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego powiedzia³, ¿e jestem ju¿ gotów, by spotkaæ siê z Gomezem.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //To ja o tym zadecydujê!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //I co zdecydowa³eœ?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Muszê przyznaæ, ¿e ca³kiem nieŸle sobie poradzi³eœ.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Niech bêdzie! Mo¿esz stan¹æ przed Gomezem. On podejmie ostateczn¹ decyzjê co do twojego przyjêcia.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Od tej pory musisz radziæ sobie sam, ch³opcze.
				
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
	description = "Mam tu partiê bagiennego ziela dla Gomeza, od Cor Kaloma.";
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
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Mam tu partiê bagiennego ziela dla Gomeza, od Cor Kaloma.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Poka¿!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //W porz¹dku, mo¿esz iœæ. Udaj siê prosto do siedziby Magnatów i porozmawiaj z Bartholo.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Jak na pos³añca masz przy sobie trochê za ma³o ziela! Mam nadziejê, ¿e nie sprzeda³eœ go komuœ innemu! Wróæ, jak bêdziesz mia³ ca³¹ partiê.
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
	description = "Jestem pos³añcem Magów Wody. Muszê siê dostaæ do zamku.";
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
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Jestem pos³añcem Magów Wody. Muszê siê dostaæ do zamku.
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Masz przy sobie amulet kuriera. Stra¿nicy nie bêd¹ ciê zatrzymywali.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Nie chcê mieæ nic wspólnego z magami! Przestañ mi wreszcie zawracaæ g³owê, dobrze?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //No jaaasne... A amulet pewnie zgubi³eœ, co? Albo ci ukradli, hê?
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
	description = "Uda³o mi siê. Zosta³em przyjêty do Obozu!";
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
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Uda³o mi siê. Zosta³em przyjêty do Obozu!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Gratulujê, ch³opcze. Dobrze ci radzê, trzymaj siê blisko Diego.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Do Gomeza lub Kruka idŸ, tylko jeœli masz coœ NAPRAWDÊ wa¿nego do powiedzenia.
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
	description = "Jak siê masz?";
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
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak siê masz?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Nowy Obóz nie sprawia nam zbyt wielu k³opotów. Bardziej martwi¹ mnie te œwiry z Sekty.
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
	description		= "Chcia³eœ mi coœ powiedzieæ?"; 
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
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chcia³eœ mi coœ powiedzieæ?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Tak. To, co pokaza³eœ w kopalni, œwiadczy nie tylko o twojej odwadze, ale równie¿ o niepospolitej sile i umiejêtnoœciach.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Chêtnie bym ciê widzia³ w szeregach stra¿y.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale zanim to nast¹pi musisz jeszcze trochê popracowaæ nad swoimi umiejêtnoœciami. Tylko najlepsi mog¹ zostaæ stra¿nikami.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Dajê ci niepowtarzaln¹ szansê. Co ty na to?
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
	description		= "Chcê zostaæ stra¿nikiem."; 
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
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chcê zostaæ Stra¿nikiem!
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Mi³o mi to s³yszeæ, ale najpierw muszê ci powiedzieæ to, co mówiê wszystkim nowym rekrutom. S³uchaj uwa¿nie, bo nie bêdê siê powtarza³.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Do tej pory ¿y³eœ na w³asny rachunek, ale to siê od dziœ zmieni. Moi ludzie trzymaj¹ siê razem. Do Stra¿ników nale¿y dbanie o bezpieczeñstwo Magnatów, rudy, obozu i kopalni.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Ruda wydobywana jest przez Kopaczy, ale to my pilnujemy, ¿eby nie po¿ar³y ich pe³zacze. Pertraktacje z królem prowadz¹ Magnaci, ale to my dbamy o ich bezpieczeñstwo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Dniem i noc¹ strze¿emy korytarzy kopalni. Dniem i noc¹ pilnujemy bram Obozu i pozwalamy jego mieszkañcom wieœæ spokojne ¿ycie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Na pocz¹tku byliœmy tylko bez³adn¹ zgraj¹, ale staliœmy siê si³¹, z któr¹ ka¿dy musi siê liczyæ. Ciê¿ko pracowaliœmy, by zas³u¿yæ na tê reputacjê.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od moich ludzi oczekujê wiêc wy³¹cznie jednego: lojalnoœci. Tylko stoj¹c ramiê w ramiê bêdziemy w stanie obroniæ to, co nale¿y do nas...
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //...i przetrwaæ.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Pozosta³ych rzeczy dowiesz siê w swoim czasie. B¹dŸ gotów do pomocy ka¿demu, kto jej potrzebuje, niewa¿ne jak trudne i niebezpieczne to zadanie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //IdŸ do Stone'a i poproœ go o zbrojê i miecz.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Znajdziesz go w kuŸni, w Wewnêtrznym Pierœcieniu.

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
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //A, i jeszcze coœ...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Witamy w Stra¿y...
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Dziœ Thorus przyj¹³ mnie w poczet Stra¿ników. Mogê teraz odebraæ nale¿ny mi pancerz. Dostanê go od Smitha, w zamku.");
	
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
	description		= "Interesuje mnie œcie¿ka magii..."; 
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
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Interesuje mnie œcie¿ka magii...
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //W takim razie powinieneœ porozmawiaæ z Corristo. To on uczy³ Miltena. Chyba nie powinno byæ ¿adnych przeciwwskazañ.

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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Mogê ci pomóc w rozwiniêciu twoich umiejêtnoœci i si³y.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus pomo¿e mi popracowaæ nad moj¹ si³¹ i zrêcznoœci¹.");
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
		B_LogEntry			(GE_TeacherOC,"Thorus mo¿e mnie nauczyæ walki dwurêcznym orê¿em, gdy tylko poznam tajniki walki broni¹ jednorêczn¹.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chcia³bym nauczyæ siê pos³ugiwaæ dwurêcznym mieczem.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dobrze, najpierw zajmiemy siê podstawami.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
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
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o walce dwurêcznym mieczem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Musisz siê nauczyæ p³ynnie przenosiæ œrodek ciê¿koœci. Trzymaj miecz pionowo. Obie d³onie mocno zaciœnij na jego rêkojeœci i przesuñ go nieco w bok.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powêdrowaæ nad twoje ramiê. Teraz mo¿esz wyprowadziæ szybkie ciêcie na prawo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie bêdzie mia³ okazji podejœæ bli¿ej.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadziæ z lewej strony cios do przodu, aby odrzuciæ od siebie rywala. 
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Teraz obrót, ¿eby kolejny cios nabra³ odpowiedniej mocy. Przy odrobinie szczêœcia wróg nie prze¿yje tego uderzenia.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //A jeœli i to nie wystarczy, wykorzystaj resztê si³y zamachowej, by ponownie unieœæ miecz do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Po skoñczonym ataku wykonaj zas³onê i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci¹g³a zmiana pozycji i umiejêtne wykorzystanie bezw³adnoœci broni.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
