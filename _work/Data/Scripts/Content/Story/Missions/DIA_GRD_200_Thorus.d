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
	description = "Pewnie nie b�dziesz chcia� wpu�ci� mnie do zamku?";
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
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Pewnie nie b�dziesz chcia� wpu�ci� mnie do zamku?
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Tylko ludzie Gomeza maj� prawo wst�pu.
};

// ************************************************************
// 					Ich will f�r Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Chc� pracowa� dla Gomeza.";
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
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Chc� pracowa� dla Gomeza.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Czy�by? A czemu my�lisz, �e Gomez chcia�by, �eby kto� taki jak ty dla niego pracowa�?
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
	description = "Diego m�wi, �e to TY podejmujesz takie decyzje.";
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
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego powiedzia�, �e to TY podejmujesz takie decyzje.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Huh... Je�li Diego uwa�a, �e jeste� w porz�dku, to czemu SAM si� tob� nie zajmie?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //S�uchaj uwa�nie: Diego podda ci� najpierw testowi. Je�li ON uzna, �e si� nadajesz, ja wpuszcz� ci� do zamku na spotkanie z Gomezem.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //To, co b�dzie p�niej, zale�y ju� tylko od ciebie, jasne?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Porozmawiam z Diego.
	
	B_LogEntry(CH1_JoinOC,"Thorus poradzi� mi, bym porozmawia� z Diego. To on oceni, czy nadaj� si� na cz�onka Starego Obozu.");
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
	description = "Dlaczego sam nie poddasz mnie pr�bie?";
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
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Dlaczego sam nie poddasz mnie pr�bie?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //To nie takie proste, ch�opcze. Nowy, kt�ry chce tu do czego� doj��, potrzebuje opiekuna.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Tym opiekunem musi by� jeden z ludzi Gomeza. I to w�a�nie on podda ci� pr�bie.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //A je�li narobisz k�opot�w to on poniesie za nie odpowiedzialno��. Takie s� tutaj zasady.
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
	description = "Na pewno znajdzie si� dla mnie jakie� zadanie...";
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
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Na pewno znajdzie si� dla mnie jakie� zadanie...
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Nie. Rzeczy, kt�rymi zajmuj� si� Stra�nicy przerastaj� twoje mo�liwo�ci, ch�opcze.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Trzymaj si� polece� swojego opiekuna.
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
	description = "Potrafi� sprosta� ka�demu zadaniu, kt�re mi powierzysz.";
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
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Potrafi� sprosta� ka�demu zadaniu, kt�re mi powierzysz.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Och? A� tak ci zale�y na wpadce? Hmm. Jest jedna rzecz, kt�r� mo�e si� zaj�� wy��cznie cz�owiek nie b�d�cy w s�u�bie Gomeza.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale uprzedzam ci�: jak to schrzanisz, b�dziesz mia� nie lada k�opoty.
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
	description = "Jestem got�w.";
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
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Jestem got�w.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ci za chwil� powiem, musi pozosta� mi�dzy nami, rozumiemy si�?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasne.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Pewien cz�owiek z Nowego Obozu sprawia nam problemy. Nazywa si� Mordrag i przyw�aszczy� sobie kilka rzeczy nale��cych do Magnat�w.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Oczywi�cie to samo mo�na powiedzie� o wielu Szkodnikach z Nowego Obozu, ale Mordrag ma czelno�� zjawia� si� w NASZYM obozie i odsprzedawa� NASZE rzeczy NASZYM ch�opcom!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //A to ju� za wiele. Niestety, �ajdak wie, �e nie mog� z tym nic zrobi�.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Dlaczego?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Bo jest pod opiek� Mag�w.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Zajm� si� tym.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Chcesz, �ebym go zabi�, tak?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Gdzie znajd� Mordraga?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Dlaczego Magowie broni� Mordraga?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Widz�, �e masz troch� problem�w z Magami...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus poprosi� mnie, bym usun�� z obozu Szkodnika imieniem Mordrag. Nie interesuje go jak tego dokonam, byleby tylko nikt si� nie dowiedzia�, �e on macza� w tym palce.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Zajm� si� tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chcesz, �ebym go zabi�, tak?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chc� mie� pewno��, �e ju� nigdy wi�cej si� tu nie pojawi. Jak to osi�gniesz - to ju� twoja sprawa.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Gdzie znajd� Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Kr�ci si� przy po�udniowej bramie, po przeciwnej stronie zamku, tu� za wej�ciem. Sukinsyn boi si� pojawia� bli�ej centrum.
	B_LogEntry(CH1_MordragKO,"Mordrag urz�duje przy po�udniowej bramie, za zamkiem.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Dlaczego Magowie broni� Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Bo s�u�y im za pos�a�ca. Nasi magowie utrzymuj� kontakty z czarodziejami z Nowego Obozu. Cz�sto wymieniaj� informacje za po�rednictwem go�c�w.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Podejrzewam, �e nie�le si� wkurz� na wie��, �e co� przydarzy�o si� ich kurierowi.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co ze mn�? Co Magowie mog� mi zrobi�?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jeste� tu nowy, nic ci nie b�dzie. Ale ja odpowiadam za wszystko, co robi� moi ludzie. Dlatego musisz trzyma� j�zyk za z�bami.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Widz�, �e masz troch� problem�w z Magami...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Tak. I to problem�w, kt�re nie �atwo rozwi�za�. Kilka lat temu jeden z Cieni pr�bowa� zasztyletowa� we �nie Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Faceta znaleziono potem w Zewn�trznym Pier�cieniu. Je�li chodzi o �cis�o�� - rozsmarowanego PO CA�YM Zewn�trznym Pier�cieniu.
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
	description = "Wracaj�c do Mordraga...";
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
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Zajm� si� tym.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"Gdzie znajd� Mordraga?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Mordrag ju� nigdy nikogo nie okradnie!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Facet ju� nigdy si� tu nie poka�e!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Zajm� si� tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag ju� nigdy nikogo nie okradnie!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Chcesz powiedzie�, �e go pokona�e�? Nie�le, ch�opcze.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus jest mi wdzi�czny za usuni�cie Mordraga. Zyska�em wp�ywowego przyjaciela.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Facet ju� nigdy si� tu nie poka�e!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Wola�bym, �eby� go zabi�.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus ucieszy� si�, �e Mordraga nie ma ju� w obozie.");
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
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Ty ofiaro! Kaza�em ci TRZYMA� J�ZYK ZA Z�BAMI!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Spartaczy�e� spraw�! Zapomnij o wszystkim, co ci powiedzia�em. Nie pr�buj ju� nic wi�cej zdzia�a� w tej sprawie!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Thorusowi nie spodoba�o si�, �e wspomnia�em o nim Mordragowi. Lepiej b�dzie nie pokazywa� mu si� teraz na oczy.");
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
	description = "Czy za odpowiedni� sumk� m�g�by� mnie wpu�ci� do zamku?";
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
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Czy za odpowiedni� sumk� m�g�by� mnie wpu�ci� do zamku?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Za odpowiedni� sumk�...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Ile?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //No c� - liczenie rudy musi potrwa� odpowiednio d�ugo. Do�� d�ugo, �eby ca�kowicie poch�on�� uwag� moj� i moich ch�opc�w. Korzystaj�c z naszej nieuwagi, m�g�by� przemkn�� si� do �rodka...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Czyli ile konkretnie?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //My�l�, �e przeliczenie 1000 bry�ek zajmie nam wystarczaj�co du�o czasu.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 bry�ek?!
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //C�, gdyby� do��czy� do Gomeza, m�g�by� wej�� do zamku za darmo.
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
	description = "Masz tu swoje 1000 bry�ek rudy, a teraz pozw�l mi przej��.";
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
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Masz tu swoje 1000 bry�ek rudy, a teraz pozw�l mi przej��.
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //W porz�dku, id�. Tylko jak ju� b�dziesz w �rodku, nie wywi� czego� g�upiego, dobra?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Pr�bujesz mnie okpi�, ch�opcze? Nie masz 1000 bry�ek rudy!
	};
};
		
// ************************************************************
// 					Brief f�r Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "Musz� si� dosta� do zamku. Mam list do Arcymistrza Mag�w Ognia.";
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
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Musz� si� dosta� do zamku. Mam list do Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //I my�lisz, �e wpuszcz� ci� tak po prostu do �rodka, �eby� odda� list i zgarn�� nagrod�?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Tak.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Dobra, poka� ten list.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Nie ma mowy. Zapomnij o tym!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //W porz�dku. Ju� zapomnia�em.
};

// ************************************************************
// 					Bereit f�r Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego powiedzia�, �e jestem ju� got�w, by spotka� si� z Gomezem.";
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
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego powiedzia�, �e jestem ju� got�w, by spotka� si� z Gomezem.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //To ja o tym zadecyduj�!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //I co zdecydowa�e�?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Musz� przyzna�, �e ca�kiem nie�le sobie poradzi�e�.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Niech b�dzie! Mo�esz stan�� przed Gomezem. On podejmie ostateczn� decyzj� co do twojego przyj�cia.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Od tej pory musisz radzi� sobie sam, ch�opcze.
				
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
	description = "Mam tu parti� bagiennego ziela dla Gomeza, od Cor Kaloma.";
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
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Mam tu parti� bagiennego ziela dla Gomeza, od Cor Kaloma.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Poka�!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //W porz�dku, mo�esz i��. Udaj si� prosto do siedziby Magnat�w i porozmawiaj z Bartholo.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Jak na pos�a�ca masz przy sobie troch� za ma�o ziela! Mam nadziej�, �e nie sprzeda�e� go komu� innemu! Wr��, jak b�dziesz mia� ca�� parti�.
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
	description = "Jestem pos�a�cem Mag�w Wody. Musz� si� dosta� do zamku.";
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
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Jestem pos�a�cem Mag�w Wody. Musz� si� dosta� do zamku.
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Masz przy sobie amulet kuriera. Stra�nicy nie b�d� ci� zatrzymywali.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Nie chc� mie� nic wsp�lnego z magami! Przesta� mi wreszcie zawraca� g�ow�, dobrze?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //No jaaasne... A amulet pewnie zgubi�e�, co? Albo ci ukradli, h�?
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
	description = "Uda�o mi si�. Zosta�em przyj�ty do Obozu!";
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
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Uda�o mi si�. Zosta�em przyj�ty do Obozu!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Gratuluj�, ch�opcze. Dobrze ci radz�, trzymaj si� blisko Diego.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Do Gomeza lub Kruka id�, tylko je�li masz co� NAPRAWD� wa�nego do powiedzenia.
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
	description = "Jak si� masz?";
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
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak si� masz?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Nowy Ob�z nie sprawia nam zbyt wielu k�opot�w. Bardziej martwi� mnie te �wiry z Sekty.
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
	description		= "Chcia�e� mi co� powiedzie�?"; 
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
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chcia�e� mi co� powiedzie�?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Tak. To, co pokaza�e� w kopalni, �wiadczy nie tylko o twojej odwadze, ale r�wnie� o niepospolitej sile i umiej�tno�ciach.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Ch�tnie bym ci� widzia� w szeregach stra�y.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale zanim to nast�pi musisz jeszcze troch� popracowa� nad swoimi umiej�tno�ciami. Tylko najlepsi mog� zosta� stra�nikami.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Daj� ci niepowtarzaln� szans�. Co ty na to?
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
	description		= "Chc� zosta� stra�nikiem."; 
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
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chc� zosta� Stra�nikiem!
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Mi�o mi to s�ysze�, ale najpierw musz� ci powiedzie� to, co m�wi� wszystkim nowym rekrutom. S�uchaj uwa�nie, bo nie b�d� si� powtarza�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Do tej pory �y�e� na w�asny rachunek, ale to si� od dzi� zmieni. Moi ludzie trzymaj� si� razem. Do Stra�nik�w nale�y dbanie o bezpiecze�stwo Magnat�w, rudy, obozu i kopalni.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Ruda wydobywana jest przez Kopaczy, ale to my pilnujemy, �eby nie po�ar�y ich pe�zacze. Pertraktacje z kr�lem prowadz� Magnaci, ale to my dbamy o ich bezpiecze�stwo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Dniem i noc� strze�emy korytarzy kopalni. Dniem i noc� pilnujemy bram Obozu i pozwalamy jego mieszka�com wie�� spokojne �ycie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Na pocz�tku byli�my tylko bez�adn� zgraj�, ale stali�my si� si��, z kt�r� ka�dy musi si� liczy�. Ci�ko pracowali�my, by zas�u�y� na t� reputacj�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od moich ludzi oczekuj� wi�c wy��cznie jednego: lojalno�ci. Tylko stoj�c rami� w rami� b�dziemy w stanie obroni� to, co nale�y do nas...
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //...i przetrwa�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Pozosta�ych rzeczy dowiesz si� w swoim czasie. B�d� got�w do pomocy ka�demu, kto jej potrzebuje, niewa�ne jak trudne i niebezpieczne to zadanie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Id� do Stone'a i popro� go o zbroj� i miecz.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Znajdziesz go w ku�ni, w Wewn�trznym Pier�cieniu.

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
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //A, i jeszcze co�...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Witamy w Stra�y...
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Dzi� Thorus przyj�� mnie w poczet Stra�nik�w. Mog� teraz odebra� nale�ny mi pancerz. Dostan� go od Smitha, w zamku.");
	
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
	description		= "Interesuje mnie �cie�ka magii..."; 
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
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Interesuje mnie �cie�ka magii...
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //W takim razie powiniene� porozmawia� z Corristo. To on uczy� Miltena. Chyba nie powinno by� �adnych przeciwwskaza�.

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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Mog� ci pom�c w rozwini�ciu twoich umiej�tno�ci i si�y.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus pomo�e mi popracowa� nad moj� si�� i zr�czno�ci�.");
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
		B_LogEntry			(GE_TeacherOC,"Thorus mo�e mnie nauczy� walki dwur�cznym or�em, gdy tylko poznam tajniki walki broni� jednor�czn�.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chcia�bym nauczy� si� pos�ugiwa� dwur�cznym mieczem.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dobrze, najpierw zajmiemy si� podstawami.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
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
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chcia�bym dowiedzie� si� czego� wi�cej o walce dwur�cznym mieczem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Musisz si� nauczy� p�ynnie przenosi� �rodek ci�ko�ci. Trzymaj miecz pionowo. Obie d�onie mocno zaci�nij na jego r�koje�ci i przesu� go nieco w bok.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od g�ry, i pozw�l klindze pow�drowa� nad twoje rami�. Teraz mo�esz wyprowadzi� szybkie ci�cie na prawo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Tw�j przeciwnik nie b�dzie mia� okazji podej�� bli�ej.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Albo spr�buj wyprowadzi� z lewej strony cios do przodu, aby odrzuci� od siebie rywala. 
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Teraz obr�t, �eby kolejny cios nabra� odpowiedniej mocy. Przy odrobinie szcz�cia wr�g nie prze�yje tego uderzenia.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //A je�li i to nie wystarczy, wykorzystaj reszt� si�y zamachowej, by ponownie unie�� miecz do g�ry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Po sko�czonym ataku wykonaj zas�on� i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ci�g�a zmiana pozycji i umiej�tne wykorzystanie bezw�adno�ci broni.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
