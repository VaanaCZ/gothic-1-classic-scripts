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
	description = "Pewnie nie będziesz chciał wpuścić mnie do zamku?";
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
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Pewnie nie będziesz chciał wpuścić mnie do zamku?
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Tylko ludzie Gomeza mają prawo wstępu.
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
	description = "Chcę pracować dla Gomeza.";
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
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Chcę pracować dla Gomeza.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Czyżby? A czemu myślisz, że Gomez chciałby, żeby ktoś taki jak ty dla niego pracował?
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
	description = "Diego mówi, że to TY podejmujesz takie decyzje.";
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
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego powiedział, że to TY podejmujesz takie decyzje.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Huh... Jeśli Diego uważa, że jesteś w porządku, to czemu SAM się tobą nie zajmie?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Słuchaj uważnie: Diego podda cię najpierw testowi. Jeśli ON uzna, że się nadajesz, ja wpuszczę cię do zamku na spotkanie z Gomezem.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //To, co będzie później, zależy już tylko od ciebie, jasne?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Porozmawiam z Diego.
	
	B_LogEntry(CH1_JoinOC,"Thorus poradził mi, bym porozmawiał z Diego. To on oceni, czy nadaję się na członka Starego Obozu.");
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
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //To nie takie proste, chłopcze. Nowy, który chce tu do czegoś dojść, potrzebuje opiekuna.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Tym opiekunem musi być jeden z ludzi Gomeza. I to właśnie on podda cię próbie.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //A jeśli narobisz kłopotów to on poniesie za nie odpowiedzialność. Takie są tutaj zasady.
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
	description = "Na pewno znajdzie się dla mnie jakieś zadanie...";
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
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Na pewno znajdzie się dla mnie jakieś zadanie...
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Nie. Rzeczy, którymi zajmują się Strażnicy przerastają twoje możliwości, chłopcze.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Trzymaj się poleceń swojego opiekuna.
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
	description = "Potrafię sprostać każdemu zadaniu, które mi powierzysz.";
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
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Potrafię sprostać każdemu zadaniu, które mi powierzysz.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Och? Aż tak ci zależy na wpadce? Hmm. Jest jedna rzecz, którą może się zająć wyłącznie człowiek nie będący w służbie Gomeza.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale uprzedzam cię: jak to schrzanisz, będziesz miał nie lada kłopoty.
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
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ci za chwilę powiem, musi pozostać między nami, rozumiemy się?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasne.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Pewien człowiek z Nowego Obozu sprawia nam problemy. Nazywa się Mordrag i przywłaszczył sobie kilka rzeczy należących do Magnatów.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Oczywiście to samo można powiedzieć o wielu Szkodnikach z Nowego Obozu, ale Mordrag ma czelność zjawiać się w NASZYM obozie i odsprzedawać NASZE rzeczy NASZYM chłopcom!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //A to już za wiele. Niestety, łajdak wie, że nie mogę z tym nic zrobić.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Dlaczego?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Bo jest pod opieką Magów.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Zajmę się tym.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Chcesz, żebym go zabił, tak?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Gdzie znajdę Mordraga?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Dlaczego Magowie bronią Mordraga?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Widzę, że masz trochę problemów z Magami...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus poprosił mnie, bym usunął z obozu Szkodnika imieniem Mordrag. Nie interesuje go jak tego dokonam, byleby tylko nikt się nie dowiedział, że on maczał w tym palce.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Zajmę się tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chcesz, żebym go zabił, tak?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chcę mieć pewność, że już nigdy więcej się tu nie pojawi. Jak to osiągniesz - to już twoja sprawa.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Gdzie znajdę Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Kręci się przy południowej bramie, po przeciwnej stronie zamku, tuż za wejściem. Sukinsyn boi się pojawiać bliżej centrum.
	B_LogEntry(CH1_MordragKO,"Mordrag urzęduje przy południowej bramie, za zamkiem.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Dlaczego Magowie bronią Mordraga?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Bo służy im za posłańca. Nasi magowie utrzymują kontakty z czarodziejami z Nowego Obozu. Często wymieniają informacje za pośrednictwem gońców.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Podejrzewam, że nieźle się wkurzą na wieść, że coś przydarzyło się ich kurierowi.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co ze mną? Co Magowie mogą mi zrobić?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jesteś tu nowy, nic ci nie będzie. Ale ja odpowiadam za wszystko, co robią moi ludzie. Dlatego musisz trzymać język za zębami.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Widzę, że masz trochę problemów z Magami...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Tak. I to problemów, które nie łatwo rozwiązać. Kilka lat temu jeden z Cieni próbował zasztyletować we śnie Arcymistrza Magów Ognia.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Faceta znaleziono potem w Zewnętrznym Pierścieniu. Jeśli chodzi o ścisłość - rozsmarowanego PO CAŁYM Zewnętrznym Pierścieniu.
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
	description = "Wracając do Mordraga...";
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
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Zajmę się tym.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"Gdzie znajdę Mordraga?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Mordrag już nigdy nikogo nie okradnie!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Facet już nigdy się tu nie pokaże!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Zajmę się tym.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag już nigdy nikogo nie okradnie!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Chcesz powiedzieć, że go pokonałeś? Nieźle, chłopcze.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus jest mi wdzięczny za usunięcie Mordraga. Zyskałem wpływowego przyjaciela.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Facet już nigdy się tu nie pokaże!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Wolałbym, żebyś go zabił.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus ucieszył się, że Mordraga nie ma już w obozie.");
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
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Ty ofiaro! Kazałem ci TRZYMAĆ JĘZYK ZA ZĘBAMI!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Spartaczyłeś sprawę! Zapomnij o wszystkim, co ci powiedziałem. Nie próbuj już nic więcej zdziałać w tej sprawie!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Thorusowi nie spodobało się, że wspomniałem o nim Mordragowi. Lepiej będzie nie pokazywać mu się teraz na oczy.");
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
	description = "Czy za odpowiednią sumkę mógłbyś mnie wpuścić do zamku?";
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
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Czy za odpowiednią sumkę mógłbyś mnie wpuścić do zamku?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Za odpowiednią sumkę...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Ile?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //No cóż - liczenie rudy musi potrwać odpowiednio długo. Dość długo, żeby całkowicie pochłonąć uwagę moją i moich chłopców. Korzystając z naszej nieuwagi, mógłbyś przemknąć się do środka...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Czyli ile konkretnie?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //Myślę, że przeliczenie 1000 bryłek zajmie nam wystarczająco dużo czasu.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 bryłek?!
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Cóż, gdybyś dołączył do Gomeza, mógłbyś wejść do zamku za darmo.
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
	description = "Masz tu swoje 1000 bryłek rudy, a teraz pozwól mi przejść.";
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
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Masz tu swoje 1000 bryłek rudy, a teraz pozwól mi przejść.
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //W porządku, idź. Tylko jak już będziesz w środku, nie wywiń czegoś głupiego, dobra?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Próbujesz mnie okpić, chłopcze? Nie masz 1000 bryłek rudy!
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
	description = "Muszę się dostać do zamku. Mam list do Arcymistrza Magów Ognia.";
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
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Muszę się dostać do zamku. Mam list do Arcymistrza Magów Ognia.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //I myślisz, że wpuszczę cię tak po prostu do środka, żebyś oddał list i zgarnął nagrodę?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Tak.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Dobra, pokaż ten list.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Nie ma mowy. Zapomnij o tym!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //W porządku. Już zapomniałem.
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
	description = "Diego powiedział, że jestem już gotów, by spotkać się z Gomezem.";
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
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego powiedział, że jestem już gotów, by spotkać się z Gomezem.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //To ja o tym zadecyduję!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //I co zdecydowałeś?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Muszę przyznać, że całkiem nieźle sobie poradziłeś.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Niech będzie! Możesz stanąć przed Gomezem. On podejmie ostateczną decyzję co do twojego przyjęcia.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Od tej pory musisz radzić sobie sam, chłopcze.
				
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
	description = "Mam tu partię bagiennego ziela dla Gomeza, od Cor Kaloma.";
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
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Mam tu partię bagiennego ziela dla Gomeza, od Cor Kaloma.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Pokaż!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //W porządku, możesz iść. Udaj się prosto do siedziby Magnatów i porozmawiaj z Bartholo.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Jak na posłańca masz przy sobie trochę za mało ziela! Mam nadzieję, że nie sprzedałeś go komuś innemu! Wróć, jak będziesz miał całą partię.
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
	description = "Jestem posłańcem Magów Wody. Muszę się dostać do zamku.";
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
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Jestem posłańcem Magów Wody. Muszę się dostać do zamku.
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Masz przy sobie amulet kuriera. Strażnicy nie będą cię zatrzymywali.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Nie chcę mieć nic wspólnego z magami! Przestań mi wreszcie zawracać głowę, dobrze?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //No jaaasne... A amulet pewnie zgubiłeś, co? Albo ci ukradli, hę?
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
	description = "Udało mi się. Zostałem przyjęty do Obozu!";
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
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Udało mi się. Zostałem przyjęty do Obozu!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Gratuluję, chłopcze. Dobrze ci radzę, trzymaj się blisko Diego.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Do Gomeza lub Kruka idź, tylko jeśli masz coś NAPRAWDĘ ważnego do powiedzenia.
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
	description = "Jak się masz?";
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
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak się masz?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Nowy Obóz nie sprawia nam zbyt wielu kłopotów. Bardziej martwią mnie te świry z Sekty.
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
	description		= "Chciałeś mi coś powiedzieć?"; 
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
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chciałeś mi coś powiedzieć?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Tak. To, co pokazałeś w kopalni, świadczy nie tylko o twojej odwadze, ale również o niepospolitej sile i umiejętnościach.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Chętnie bym cię widział w szeregach straży.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale zanim to nastąpi musisz jeszcze trochę popracować nad swoimi umiejętnościami. Tylko najlepsi mogą zostać strażnikami.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Daję ci niepowtarzalną szansę. Co ty na to?
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
	description		= "Chcę zostać strażnikiem."; 
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
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chcę zostać Strażnikiem!
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Miło mi to słyszeć, ale najpierw muszę ci powiedzieć to, co mówię wszystkim nowym rekrutom. Słuchaj uważnie, bo nie będę się powtarzał.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Do tej pory żyłeś na własny rachunek, ale to się od dziś zmieni. Moi ludzie trzymają się razem. Do Strażników należy dbanie o bezpieczeństwo Magnatów, rudy, obozu i kopalni.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Ruda wydobywana jest przez Kopaczy, ale to my pilnujemy, żeby nie pożarły ich pełzacze. Pertraktacje z królem prowadzą Magnaci, ale to my dbamy o ich bezpieczeństwo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Dniem i nocą strzeżemy korytarzy kopalni. Dniem i nocą pilnujemy bram Obozu i pozwalamy jego mieszkańcom wieść spokojne życie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Na początku byliśmy tylko bezładną zgrają, ale staliśmy się siłą, z którą każdy musi się liczyć. Ciężko pracowaliśmy, by zasłużyć na tę reputację.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od moich ludzi oczekuję więc wyłącznie jednego: lojalności. Tylko stojąc ramię w ramię będziemy w stanie obronić to, co należy do nas...
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //...i przetrwać.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Pozostałych rzeczy dowiesz się w swoim czasie. Bądź gotów do pomocy każdemu, kto jej potrzebuje, nieważne jak trudne i niebezpieczne to zadanie.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Idź do Stone'a i poproś go o zbroję i miecz.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Znajdziesz go w kuźni, w Wewnętrznym Pierścieniu.

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
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //A, i jeszcze coś...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Witamy w Straży...
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Dziś Thorus przyjął mnie w poczet Strażników. Mogę teraz odebrać należny mi pancerz. Dostanę go od Smitha, w zamku.");
	
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
	description		= "Interesuje mnie ścieżka magii..."; 
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
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Interesuje mnie ścieżka magii...
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //W takim razie powinieneś porozmawiać z Corristo. To on uczył Miltena. Chyba nie powinno być żadnych przeciwwskazań.

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
	description = "Możesz mnie czegoś nauczyć?";
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
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Możesz mnie czegoś nauczyć?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Mogę ci pomóc w rozwinięciu twoich umiejętności i siły.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus pomoże mi popracować nad moją siłą i zręcznością.");
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
		B_LogEntry			(GE_TeacherOC,"Thorus może mnie nauczyć walki dwuręcznym orężem, gdy tylko poznam tajniki walki bronią jednoręczną.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chciałbym nauczyć się posługiwać dwuręcznym mieczem.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dobrze, najpierw zajmiemy się podstawami.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Wyciągnij miecz przed siebie. Aby zaatakować wroga tak ciężką bronią, musisz mocniej się zamachnąć.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Unieś ramię i zdecydowanie opuść miecz. To powinno wystarczyć, żeby powalić przeciwnika na ziemię.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Wykorzystaj bezwładność broni, by unieść ją ponownie do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Dwuręczne miecze świetnie sprawdzają się przy zadawaniu ciosów z boku. W ten sposób możesz trzymać przeciwnika na dystans.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To ci powinno wystarczyć na początek. Teraz trochę poćwicz.
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
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chciałbym dowiedzieć się czegoś więcej o walce dwuręcznym mieczem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Musisz się nauczyć płynnie przenosić środek ciężkości. Trzymaj miecz pionowo. Obie dłonie mocno zaciśnij na jego rękojeści i przesuń go nieco w bok.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Teraz uderz szybko od góry, i pozwól klindze powędrować nad twoje ramię. Teraz możesz wyprowadzić szybkie cięcie na prawo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Twój przeciwnik nie będzie miał okazji podejść bliżej.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Albo spróbuj wyprowadzić z lewej strony cios do przodu, aby odrzucić od siebie rywala. 
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Teraz obrót, żeby kolejny cios nabrał odpowiedniej mocy. Przy odrobinie szczęścia wróg nie przeżyje tego uderzenia.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //A jeśli i to nie wystarczy, wykorzystaj resztę siły zamachowej, by ponownie unieść miecz do góry.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Po skończonym ataku wykonaj zasłonę i wypatruj luki w obronie przeciwnika.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kluczem do sukcesu jest ciągła zmiana pozycji i umiejętne wykorzystanie bezwładności broni.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
