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
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //ChodŸmy.
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Niech Œni¹cy ma ciê w swojej opiece!
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
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Odezwa³eœ siê do Guru! Nigdy wiêcej tego nie rób, to bluŸnierstwo! Jeœli jakiœ mistrz zechce z tob¹ rozmawiaæ, sam siê do ciebie odezwie.
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
	description = "Kim jesteœ?";
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
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Nazywam siê Lester. Zajmujê siê naszymi nowymi goœæmi.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Masz szczêœcie, ¿e nie odezwa³eœ siê do Baal Namiba. Obcym nie wolno rozmawiaæ z Guru.
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
	description	= "Ale ja muszê porozmawiaæ z twoim mistrzem.";
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
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Ale ja muszê porozmawiaæ z twoim mistrzem.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Nie próbuj! Gwarantujê ci, ¿e potrafiê udzieliæ ci wszystkich potrzebnych informacji.
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
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //A co chcesz wiedzieæ?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Opowiedz mi o tutejszych kastach.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mo¿esz mi powiedzieæ o Œni¹cym?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mo¿esz mi powiedzieæ o bagiennym zielu?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Opowiedz mi o tutejszych kastach.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Najwy¿sz¹ kastê stanowi¹ Guru. To niezwykle potê¿ni duchowi przywódcy naszego obozu. Stra¿nicy Œwi¹tyni wykorzystuj¹ si³ê swego ducha w walce.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Ich cia³o i duch funkcjonuj¹ w idealnej harmonii. Lepiej nie wchodŸ im w drogê. Ja natomiast jestem Nowicjuszem. Naszym zadaniem jest wykonywanie wszystkich pomniejszych zadañ, no i oczywiœcie ¿arliwa modlitwa do Œni¹cego.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Niektórzy Nowicjusze dost¹pili zaszczytu pobierania nauk u Guru, ale aby to osi¹gn¹æ, trzeba s³u¿yæ w Obozie przynajmniej kilka lat.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Co mo¿esz mi powiedzieæ o Œni¹cym?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Œni¹cy to boska istota, która zsy³a nam wizje objawiaj¹ce jego wolê. W ka¿dym razie zsy³a je Guru.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Modlimy siê do niego, bo obieca³ zwróciæ nam wolnoœæ.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //I wierzycie mu?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hej, jestem w tej kolonii od dwóch lat. Wiesz jak d³ugie mog¹ siê wydaæ DWA LATA w wiêzieniu?!
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Nie wyobra¿asz sobie w co by³bym w stanie uwierzyæ, byle tylko wydostaæ siê z tego przeklêtego miejsca!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Co mo¿esz mi powiedzieæ o bagiennym zielu?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Có¿, ziele roœnie wy³¹cznie na bagnach. Zanim da siê je paliæ, trzeba je odpowiednio przetworzyæ. Tym w³aœnie zajmuj¹ siê Nowicjusze.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Ziele ma dzia³anie relaksuj¹ce i uspokajaj¹ce. Dziêki niemu mo¿na osi¹gn¹æ stan umys³u pozwalaj¹cy na nawi¹zanie kontaktu ze Œni¹cym.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Czêœæ zebranego ziela wymieniamy ze Starym Obozem. Tam te¿ pozyskujemy nowych cz³onów Bractwa.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Wielu z nich do³¹cza do nas tylko ze wzglêdu na ziele, ale przynajmniej pomagaj¹ nam w pracy.
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
	description	= "Chcia³bym zostaæ cz³onkiem Bractwa.";
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
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Chcia³bym zostaæ cz³onkiem Bractwa.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //O tym, czy mo¿esz zostaæ jednym z nich zadecyduje Cor Kalom.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Ale on polega zwykle na opinii pozosta³ych Guru. Baal Namib na przyk³ad jest jednym z nich.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Najpierw musisz udowodniæ, ¿e jesteœ godny, by nale¿eæ do Bractwa. Dopiero wtedy Guru wyœl¹ ciê do Cor Kaloma.
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
	description	= "Jak mam tego dokonaæ, jeœli ¿aden z Guru nie chce siê do mnie odezwaæ?";
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
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Jak mam tego dokonaæ, jeœli ¿aden z Guru nie chce siê do mnie odezwaæ?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Chocia¿ trudno w to uwierzyæ, Guru bêd¹ obserwowali ka¿dy twój krok.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Jeœli uznaj¹, ¿e zas³ugujesz na zostanie jednym z nas, sami siê do ciebie odezw¹.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Z pewnoœci¹ znajdziesz w Obozie wiele okazji, by udowodniæ swoj¹ przydatnoœæ.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Jeœli chcê do³¹czyæ do Bractwa Œni¹cego, muszê przekonaæ do siebie kilu Guru. Niestety, ci nie chc¹ rozmawiaæ z nowoprzyby³ymi. Nowicjusz Lester uprzedzi³ mnie, ¿e mimo to ka¿dy mój ruch jest obserwowany i ¿e powinienem spróbowaæ zrobiæ na nich dobre wra¿enie. Tylko jak niby mam to zrobiæ?! Na pocz¹tek rozejrzê siê trochê po obozie Bractwa.");

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
	description	= "Jak mogê sk³oniæ twojego mistrza do rozmowy ze mn¹?";
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
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Jak mogê sk³oniæ twojego mistrza do rozmowy ze mn¹?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Musisz wiedzieæ, co chcia³by us³yszeæ?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //A co chcia³by us³yszeæ?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Kiedy nastêpnym razem bêdziemy blisko niego, zwrócisz siê do mnie i porozmawiamy chwilê.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib martwi siê, gdy¿ wielu Nowicjuszy oprócz modlitwy do Œni¹cego czci jeszcze starych bogów.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Powiesz mi, ¿e wyrzek³eœ siê innych bóstw i od tej pory zamierzasz wznosiæ mod³y wy³¹cznie do Œni¹cego.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Wtedy ja zapytam dlaczego podj¹³eœ tak¹ decyzjê, a ty odpowiesz, ¿e prze¿y³eœ wizjê, w której Œni¹cy wzywa³ ciê do siebie.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //To go powinno zainteresowaæ. Myœlisz, ¿e dasz sobie radê?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Oczywiœcie!
	
	B_LogEntry	(CH1_JoinPsi,"Aby przekonaæ do siebie Baal Namiba, mam zwróciæ siê do Lestera, gdy wielki Guru bêdzie w pobli¿u porozmawiaæ z nim o bogach i Œni¹cym.");

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
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //ACH! MI£O CIÊ ZNÓW WIDZIEÆ. CO U CIEBIE S£YCHAÆ?
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
	description	= "WYRZEK£EM SIÊ STARYCH BOGÓW!";
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
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //WYRZEK£EM SIÊ STARYCH BOGÓW!
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //CZY¯BY? CO CIÊ SK£ONI£O DO TAK DRASTYCZNYCH KROKÓW?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //PRZE¯Y£EM OBJAWIENIE: ŒNI¥CY ZWRÓCI£ SIÊ DO MNIE...
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //I CO POWIEDZIA£?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //POWIEDZIA£: ID DO OBOZU NA BAGNIE I PRZY£¥CZ SIÊ DO BRACTWA.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //JESTEŒ SZCZÊŒLIWYM CZ£OWIEKIEM, NIEZNAJOMY: TYLKO NIELICZNI DOST¥PILI TAKIEJ NAGRODY.

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
	description	= "Jak znajdê najwa¿niejsze miejsca w Obozie?";
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
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Jak znajdê najwa¿niejsze miejsca w Obozie?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Mogê ci pokazaæ wszystko, co warto tu obejrzeæ.
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
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Jakbyœ mi nie przeszkadza³, dawno bylibyœmy na miejscu.
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
	description = "Rozmyœli³em siê.";
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
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Rozmyœli³em siê.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Wiesz, gdzie mnie znaleŸæ.
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
	description		= "Poka¿ mi jak dojœæ..."; 
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
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Poka¿ mi jak dojœæ...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...z powrotem do g³ównej bramy",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...do kuŸni.",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"...do œwi¹tyni.",PC_Psionic_GUIDEFIRST_TEMPEL);
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
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... do kuŸni.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //ChodŸ za mn¹!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... do œwi¹tyni.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //ChodŸ za mn¹!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //.. do nauczycieli.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //ChodŸ za mn¹!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... do laboratorium alchemicznego.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //ChodŸ za mn¹!
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
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Nad nami znajduje siê plac treningowy Œwi¹tynnych Stra¿ników. Zaczekam na ciebie na dole, albo u Baal Namiba, przy wejœciu do obozu.

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
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Oto œwi¹tynia! Zaczekam na ciebie tutaj, ale gdybyœ zamarudzi³, znajdziesz mnie przy wejœciu do Obozu.

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
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Jesteœmy w kuŸni. Rozejrzyj siê trochê. Bêdê czeka³ przez jak¹œ godzinê. PóŸniej znajdziesz mnie przy wejœciu do obozu.
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
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Zaczekam na ciebie tutaj. Tylko nie marudŸ zbyt d³ugo, bo wrócê do Baal Namiba.
	
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
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Cieszê siê, ¿e ciê widzê. Mam dla ciebie wiadomoœæ.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Mam nadziejê, ¿e dobr¹?
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Nasze Bractwo przygotowuje siê do wielkiego wydarzenia.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Jakiego wydarzenia? Planujecie ucieczkê?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Guru próbuj¹ skontaktowaæ siê ze Œni¹cym, ale potrzebuj¹ czegoœ, co zjednoczy ich duchowe si³y.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //I co dalej?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Poszukuj¹ magicznego artefaktu, kamienia ogniskuj¹cego.

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
	description		= "Czemu mia³bym byæ tym zainteresowany?"; 
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
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Czemu mia³bym byæ tym zainteresowany?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Porozmawiaj koniecznie z Jaœnie Oœwieconym Y'Berionem. To twoja wielka szansa, ¿eby spojrza³ na ciebie ³askawym okiem.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Gdzie mogê go znaleŸæ?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //IdŸ do œwi¹tyni. Bardzo rzadko j¹ opuszcza. Pewnie w tych zimnych ruinach czuje siê bli¿ej Œni¹cego ni¿ gdzie indziej.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Nowicjusz Lester powiedzia³ mi, ¿e Y'Berion poszukuje magicznego kamienia ogniskuj¹cego. Guru przebywa wewn¹trz œwi¹tynnego wzgórza.");

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
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Przybywam z polecenia Magów Wody. Szukam magicznych artefaktów zwanych kamieniami ogniskuj¹cymi.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Szukasz kamieni ogniskuj¹cych, tak? Odwa¿ny jesteœ.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas i pozostali magowie z Nowego Obozu zamierzaj¹ wykorzystaæ ich moc, by wysadziæ w powietrze Barierê i zwróciæ nam wolnoœæ.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Jak zobaczê to uwierzê...
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Tu siê zgadzamy... Ale powiedz, czemu ty tu przyszed³eœ?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Zastanawiam siê, czy warto zaryzykowaæ wyprawê do górskiej fortecy.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Wiesz... jest tam pewien dokument, który chcia³bym odzyskaæ, ale taka wyprawa mo¿e siê okazaæ bardzo niebezpieczna.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak ci siê uda³o przejœæ przez tê ¿yw¹ górê?"; 
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
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Jak ci siê uda³o przejœæ przez tê ¿yw¹ górê?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Pobiera³em nauki u najlepszych Guru. Ich magia potrafi byæ bardzo przydatna.
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
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Wiele lat temu w³adca tych ziem rezydowa³ w górskiej fortecy, sk¹d kontrolowa³ kopalniê i okoliczne tereny.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Jak wszyscy mo¿ni, posiada³ w swoich zbiorach dokument, który poœwiadcza³ jego prawo do tych ziem. Zamierzam odnaleŸæ to pismo.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Przecie¿ tak d³ugo, jak bêdziemy uwiêzieni wewn¹trz Bariery, ten dokument nie bêdzie wart z³amanego grosza!
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Wiem. Ale prêdzej czy póŸniej magowie zdo³aj¹ przerwaæ Barierê. Wtedy ten kawa³ek papieru zapewni mi dostatnie ¿ycie na d³ugie lata.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Moglibyœmy wspólnie rozejrzeæ siê po fortecy!"; 
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
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Moglibyœmy wspólnie rozejrzeæ siê po fortecy!
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Niez³y pomys³. ProwadŸ. Pójdê za tob¹.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"Przed potê¿n¹ górsk¹ fortec¹ spotka³em Lestera. Szuka³ pewnego dokumentu i postanowi³ tymczasowo do mnie do³¹czyæ.");

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
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Patrz, chyba mia³eœ racjê co do tego kamienia ogniskuj¹cego.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Racja, to rzeczywiœcie wygl¹da na punkt ogniskuj¹cy... Ale nie ³atwo go bêdzie dosiêgn¹æ...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"Kamieñ, którego szukam, spoczywa na piedestale. Nie dam rady wdrapaæ siê tam. Muszê znaleŸæ jakiœ inny sposób na zdobycie artefaktu.");	
	
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
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Dok¹d siê wybierasz? Jeszcze nie skoñczyliœmy!
	
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
	description		= "Jestem ranny. Mo¿esz mi pomóc?"; 
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
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Jestem ranny. Mo¿esz mi pomóc?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //WeŸ ten napój uzdrawiaj¹cy.
	
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
	description		= "Znalaz³em dokument!"; 
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
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Znalaz³em dokument!
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Dobra robota! Przyjmij te zwoje magiczne jako wyraz mojej wdziêcznoœci. Przy ich pomocy uda ci siê dotrzeæ do kamienia.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Zaczekam na ciebie przy platformie.

	B_LogEntry		(CH3_Fortress,"Akt w³asnoœci, którego szuka³ Lester, znajdowa³ siê w jednej ze skrzyñ. Nowicjusz da³ mi za niego cztery zwoje z zaklêciem telekinezy, które pomog¹ mi zdobyæ kamieñ.");
	
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
	description		= "Jak mam dosiêgn¹æ kamienia?"; 
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
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Jak mam dosiêgn¹æ tego kamienia?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Mistrz Y'Berion zwyk³ mawiaæ: Uczeñ próbuje przesuwaæ przedmioty rêkami i nogami. Mistrz porusza je si³¹ swego ducha.
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
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Zostanê tutaj jeszcze trochê i poszukam dokumentu.
	
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
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Pójdê rozejrzeæ siê na górze.
	
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
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Teraz obaj mamy to, po co przyszliœmy. Chcia³bym tu jeszcze trochê zostaæ, poczytaæ stare ksiêgi.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Do nastêpnego spotkania!

	B_LogEntry		(CH3_Fortress,"Zabra³em kamieñ. Lester chce siê jeszcze trochê rozejrzeæ po fortecy. Ciekawe, kiedy go znowu zobaczê.");

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
	description		= "Znalaz³eœ coœ?"; 
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
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Znalaz³eœ coœ?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Tamta skrzynia jest zamkniêta. Mo¿e uda siê nam gdzieœ znaleŸæ klucz.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Znalaz³eœ ju¿ ten dokument?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Nie, jeszcze nie...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Zagl¹da³eœ ju¿ do biblioteki?
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
	description		= "Przeszukajmy fortecê wspólnie."; 
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
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Przeszukajmy tê fortecê razem.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Dobrze, idŸ przodem!
 
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
	description = "Spotka³em Diego i Miltena przed Starym Obozem!";
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
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Co s³ychaæ?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hej, co tu robisz?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Stara Kopalnia zosta³a zalana przez podziemn¹ rzekê!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//I co z tego?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Wszyscy Magowie Ognia zginêli!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez kaza³ ich zamordowaæ.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//Nie ³atwo bêdzie to teraz odkrêciæ!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Spotka³em Diego i Miltena przed Starym Obozem!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Chce siê z tob¹ spotkaæ, tam gdzie zawsze.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Najwy¿szy czas!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//I co teraz?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Zostanê tutaj, ¿eby przejrzeæ stare ksiêgi.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Eee... Nie rozumiem...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Mistrz Y'Berion zwyk³ mawiaæ: Uczeñ próbuje przesuwaæ przedmioty rêkami i nogami. Mistrz porusza je si³¹ swego ducha.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Dobrze, dobrze. Zrozumia³em aluzjê.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Uwa¿aj na siebie.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Dziêkujê. Muszê ju¿ ruszaæ w dalsz¹ drogê.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Niech Œni¹cy ma ciê w swojej opiece!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Poinformowa³em Lestera i Gorna o spotkaniu z ich przyjació³mi. Moje zadanie skoñczone. Dalej bêd¹ musieli radziæ sobie sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
