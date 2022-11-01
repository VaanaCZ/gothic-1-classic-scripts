// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Chodźmy.
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Niech Śniący ma cię w swojej opiece!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Odezwałeś się do Guru! Nigdy więcej tego nie rób, to bluźnierstwo! Jeśli jakiś mistrz zechce z tobą rozmawiać, sam się do ciebie odezwie.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Kim jesteś?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Kim jesteś?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Nazywam się Lester. Zajmuję się naszymi nowymi gośćmi.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Masz szczęście, że nie odezwałeś się do Baal Namiba. Obcym nie wolno rozmawiać z Guru.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Ale ja muszę porozmawiać z twoim mistrzem.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Ale ja muszę porozmawiać z twoim mistrzem.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Nie próbuj! Gwarantuję ci, że potrafię udzielić ci wszystkich potrzebnych informacji.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Opowiedz mi o waszym obozie.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Opowiedz mi o waszym obozie.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //A co chcesz wiedzieć?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Opowiedz mi o tutejszych kastach.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Co możesz mi powiedzieć o Śniącym?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Co możesz mi powiedzieć o bagiennym zielu?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Opowiedz mi o tutejszych kastach.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Najwyższą kastę stanowią Guru. To niezwykle potężni duchowi przywódcy naszego obozu. Strażnicy Świątyni wykorzystują siłę swego ducha w walce.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Ich ciało i duch funkcjonują w idealnej harmonii. Lepiej nie wchodź im w drogę. Ja natomiast jestem Nowicjuszem. Naszym zadaniem jest wykonywanie wszystkich pomniejszych zadań, no i oczywiście żarliwa modlitwa do Śniącego.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Niektórzy Nowicjusze dostąpili zaszczytu pobierania nauk u Guru, ale aby to osiągnąć, trzeba służyć w Obozie przynajmniej kilka lat.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Co możesz mi powiedzieć o Śniącym?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Śniący to boska istota, która zsyła nam wizje objawiające jego wolę. W każdym razie zsyła je Guru.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Modlimy się do niego, bo obiecał zwrócić nam wolność.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //I wierzycie mu?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hej, jestem w tej kolonii od dwóch lat. Wiesz jak długie mogą się wydać DWA LATA w więzieniu?!
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Nie wyobrażasz sobie w co byłbym w stanie uwierzyć, byle tylko wydostać się z tego przeklętego miejsca!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Co możesz mi powiedzieć o bagiennym zielu?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Cóż, ziele rośnie wyłącznie na bagnach. Zanim da się je palić, trzeba je odpowiednio przetworzyć. Tym właśnie zajmują się Nowicjusze.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Ziele ma działanie relaksujące i uspokajające. Dzięki niemu można osiągnąć stan umysłu pozwalający na nawiązanie kontaktu ze Śniącym.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Część zebranego ziela wymieniamy ze Starym Obozem. Tam też pozyskujemy nowych członów Bractwa.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Wielu z nich dołącza do nas tylko ze względu na ziele, ale przynajmniej pomagają nam w pracy.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "Chciałbym zostać członkiem Bractwa.";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Chciałbym zostać członkiem Bractwa.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //O tym, czy możesz zostać jednym z nich zadecyduje Cor Kalom.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Ale on polega zwykle na opinii pozostałych Guru. Baal Namib na przykład jest jednym z nich.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Najpierw musisz udowodnić, że jesteś godny, by należeć do Bractwa. Dopiero wtedy Guru wyślą cię do Cor Kaloma.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "Jak mam tego dokonać, jeśli żaden z Guru nie chce się do mnie odezwać?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Jak mam tego dokonać, jeśli żaden z Guru nie chce się do mnie odezwać?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Chociaż trudno w to uwierzyć, Guru będą obserwowali każdy twój krok.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Jeśli uznają, że zasługujesz na zostanie jednym z nas, sami się do ciebie odezwą.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Z pewnością znajdziesz w Obozie wiele okazji, by udowodnić swoją przydatność.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Jeśli chcę dołączyć do Bractwa Śniącego, muszę przekonać do siebie kilu Guru. Niestety, ci nie chcą rozmawiać z nowoprzybyłymi. Nowicjusz Lester uprzedził mnie, że mimo to każdy mój ruch jest obserwowany i że powinienem spróbować zrobić na nich dobre wrażenie. Tylko jak niby mam to zrobić?! Na początek rozejrzę się trochę po obozie Bractwa.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "Jak mogę skłonić twojego mistrza do rozmowy ze mną?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Jak mogę skłonić twojego mistrza do rozmowy ze mną?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Musisz wiedzieć, co chciałby usłyszeć?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //A co chciałby usłyszeć?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Kiedy następnym razem będziemy blisko niego, zwrócisz się do mnie i porozmawiamy chwilę.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib martwi się, gdyż wielu Nowicjuszy oprócz modlitwy do Śniącego czci jeszcze starych bogów.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Powiesz mi, że wyrzekłeś się innych bóstw i od tej pory zamierzasz wznosić modły wyłącznie do Śniącego.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Wtedy ja zapytam dlaczego podjąłeś taką decyzję, a ty odpowiesz, że przeżyłeś wizję, w której Śniący wzywał cię do siebie.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //To go powinno zainteresować. Myślisz, że dasz sobie radę?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Oczywiście!
	
	B_LogEntry	(CH1_JoinPsi,"Aby przekonać do siebie Baal Namiba, mam zwrócić się do Lestera, gdy wielki Guru będzie w pobliżu porozmawiać z nim o bogach i Śniącym.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //ACH! MIŁO CIĘ ZNÓW WIDZIEĆ. CO U CIEBIE SŁYCHAĆ?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "WYRZEKŁEM SIĘ STARYCH BOGÓW!";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //WYRZEKŁEM SIĘ STARYCH BOGÓW!
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //CZYŻBY? CO CIĘ SKŁONIŁO DO TAK DRASTYCZNYCH KROKÓW?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //PRZEŻYŁEM OBJAWIENIE: ŚNIĄCY ZWRÓCIŁ SIĘ DO MNIE...
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //I CO POWIEDZIAŁ?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //POWIEDZIAŁ: IDŹ DO OBOZU NA BAGNIE I PRZYŁĄCZ SIĘ DO BRACTWA.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //JESTEŚ SZCZĘŚLIWYM CZŁOWIEKIEM, NIEZNAJOMY: TYLKO NIELICZNI DOSTĄPILI TAKIEJ NAGRODY.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "Jak znajdę najważniejsze miejsca w Obozie?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Jak znajdę najważniejsze miejsca w Obozie?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Mogę ci pokazać wszystko, co warto tu obejrzeć.
};

// **************************************************
//				FÜHRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "Daleko jeszcze?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //Daleko jeszcze?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Jakbyś mi nie przeszkadzał, dawno bylibyśmy na miejscu.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ÄNDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "Rozmyśliłem się.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Rozmyśliłem się.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Wiesz, gdzie mnie znaleźć.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------FÜHRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Pokaż mi jak dojść..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Pokaż mi jak dojść...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...z powrotem do głównej bramy",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...do kuźni.",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...do świątyni.",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...do nauczycieli.",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...do laboratorium alchemicznego.",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... do kuźni.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Chodź za mną!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... do świątyni.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Chodź za mną!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //.. do nauczycieli.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Chodź za mną!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... do laboratorium alchemicznego.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Chodź za mną!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Tam znajdziesz Baal Cadara. To on naucza Nowicjuszy.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Nad nami znajduje się plac treningowy Świątynnych Strażników. Zaczekam na ciebie na dole, albo u Baal Namiba, przy wejściu do obozu.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Oto świątynia! Zaczekam na ciebie tutaj, ale gdybyś zamarudził, znajdziesz mnie przy wejściu do Obozu.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Jesteśmy w kuźni. Rozejrzyj się trochę. Będę czekał przez jakąś godzinę. Później znajdziesz mnie przy wejściu do obozu.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauthändler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Na górze tej drabiny znajdziesz laboratorium alchemiczne Cor Kaloma. Tu na dole rezyduje Fortuno, handlarz zielem.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Zaczekam na ciebie tutaj. Tylko nie marudź zbyt długo, bo wrócę do Baal Namiba.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral für alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Cieszę się, że cię widzę. Mam dla ciebie wiadomość.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Mam nadzieję, że dobrą?
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Nasze Bractwo przygotowuje się do wielkiego wydarzenia.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Jakiego wydarzenia? Planujecie ucieczkę?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Guru próbują skontaktować się ze Śniącym, ale potrzebują czegoś, co zjednoczy ich duchowe siły.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //I co dalej?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Poszukują magicznego artefaktu, kamienia ogniskującego.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czemu miałbym być tym zainteresowany?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Czemu miałbym być tym zainteresowany?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Porozmawiaj koniecznie z Jaśnie Oświeconym Y'Berionem. To twoja wielka szansa, żeby spojrzał na ciebie łaskawym okiem.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Gdzie mogę go znaleźć?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Idź do świątyni. Bardzo rzadko ją opuszcza. Pewnie w tych zimnych ruinach czuje się bliżej Śniącego niż gdzie indziej.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Nowicjusz Lester powiedział mi, że Y'Berion poszukuje magicznego kamienia ogniskującego. Guru przebywa wewnątrz świątynnego wzgórza.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hej, co tu robisz?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Przybywam z polecenia Magów Wody. Szukam magicznych artefaktów zwanych kamieniami ogniskującymi.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Szukasz kamieni ogniskujących, tak? Odważny jesteś.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas i pozostali magowie z Nowego Obozu zamierzają wykorzystać ich moc, by wysadzić w powietrze Barierę i zwrócić nam wolność.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Jak zobaczę to uwierzę...
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Tu się zgadzamy... Ale powiedz, czemu ty tu przyszedłeś?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Zastanawiam się, czy warto zaryzykować wyprawę do górskiej fortecy.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Wiesz... jest tam pewien dokument, który chciałbym odzyskać, ale taka wyprawa może się okazać bardzo niebezpieczna.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak ci się udało przejść przez tę żywą górę?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Jak ci się udało przejść przez tę żywą górę?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Pobierałem nauki u najlepszych Guru. Ich magia potrafi być bardzo przydatna.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ten dokument, którego szukasz... Co to jest?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Ten dokument, którego szukasz... Co to jest?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Wiele lat temu władca tych ziem rezydował w górskiej fortecy, skąd kontrolował kopalnię i okoliczne tereny.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Jak wszyscy możni, posiadał w swoich zbiorach dokument, który poświadczał jego prawo do tych ziem. Zamierzam odnaleźć to pismo.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Przecież tak długo, jak będziemy uwięzieni wewnątrz Bariery, ten dokument nie będzie wart złamanego grosza!
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Wiem. Ale prędzej czy później magowie zdołają przerwać Barierę. Wtedy ten kawałek papieru zapewni mi dostatnie życie na długie lata.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Moglibyśmy wspólnie rozejrzeć się po fortecy!"; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Moglibyśmy wspólnie rozejrzeć się po fortecy!
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Niezły pomysł. Prowadź. Pójdę za tobą.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"Przed potężną górską fortecą spotkałem Lestera. Szukał pewnego dokumentu i postanowił tymczasowo do mnie dołączyć.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Patrz, chyba miałeś rację co do tego kamienia ogniskującego.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Racja, to rzeczywiście wygląda na punkt ogniskujący... Ale nie łatwo go będzie dosięgnąć...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"Kamień, którego szukam, spoczywa na piedestale. Nie dam rady wdrapać się tam. Muszę znaleźć jakiś inny sposób na zdobycie artefaktu.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ÜBER DIE BRÜCKE OHNE DEN AUFTRAG ERFÜLLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Dokąd się wybierasz? Jeszcze nie skończyliśmy!
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem ranny. Możesz mi pomóc?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Jestem ranny. Możesz mi pomóc?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Weź ten napój uzdrawiający.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE FÜR LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalazłem dokument!"; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Znalazłem dokument!
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Dobra robota! Przyjmij te zwoje magiczne jako wyraz mojej wdzięczności. Przy ich pomocy uda ci się dotrzeć do kamienia.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Zaczekam na ciebie przy platformie.

	B_LogEntry		(CH3_Fortress,"Akt własności, którego szukał Lester, znajdował się w jednej ze skrzyń. Nowicjusz dał mi za niego cztery zwoje z zaklęciem telekinezy, które pomogą mi zdobyć kamień.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mam dosięgnąć kamienia?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Jak mam dosięgnąć tego kamienia?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Mistrz Y'Berion zwykł mawiać: Uczeń próbuje przesuwać przedmioty rękami i nogami. Mistrz porusza je siłą swego ducha.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Zostanę tutaj jeszcze trochę i poszukam dokumentu.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Pójdę rozejrzeć się na górze.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Teraz obaj mamy to, po co przyszliśmy. Chciałbym tu jeszcze trochę zostać, poczytać stare księgi.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Do następnego spotkania!

	B_LogEntry		(CH3_Fortress,"Zabrałem kamień. Lester chce się jeszcze trochę rozejrzeć po fortecy. Ciekawe, kiedy go znowu zobaczę.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalazłeś coś?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Znalazłeś coś?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Tamta skrzynia jest zamknięta. Może uda się nam gdzieś znaleźć klucz.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Znalazłeś już ten dokument?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Nie, jeszcze nie...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Zaglądałeś już do biblioteki?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przeszukajmy fortecę wspólnie."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Przeszukajmy tę fortecę razem.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Dobrze, idź przodem!
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Björn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Spotkałem Diego i Miltena przed Starym Obozem!";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Co słychać?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hej, co tu robisz?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Stara Kopalnia została zalana przez podziemną rzekę!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//I co z tego?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Wszyscy Magowie Ognia zginęli!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez kazał ich zamordować.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//Nie łatwo będzie to teraz odkręcić!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Spotkałem Diego i Miltena przed Starym Obozem!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Chce się z tobą spotkać, tam gdzie zawsze.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Najwyższy czas!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//I co teraz?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Zostanę tutaj, żeby przejrzeć stare księgi.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Eee... Nie rozumiem...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Mistrz Y'Berion zwykł mawiać: Uczeń próbuje przesuwać przedmioty rękami i nogami. Mistrz porusza je siłą swego ducha.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Dobrze, dobrze. Zrozumiałem aluzję.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Uważaj na siebie.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Dziękuję. Muszę już ruszać w dalszą drogę.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Niech Śniący ma cię w swojej opiece!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Poinformowałem Lestera i Gorna o spotkaniu z ich przyjaciółmi. Moje zadanie skończone. Dalej będą musieli radzić sobie sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
