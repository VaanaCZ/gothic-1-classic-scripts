// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hej, nowa twarz! Jestem Mordrag. Zapamiêtaj sobie to imiê - u mnie kupisz wszystko, czego potrzebujesz za niewielk¹ cenê!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Poka¿ mi, co masz do zaoferowania.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Poka¿ mi co masz do zaoferowania.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Wybierz coœ...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Mordrag handluje kradzionymi dobrami na targowisku.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Naprawdê jesteœ kurierem Magów?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Naprawdê jesteœ kurierem Magów?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //A jeœli jestem?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Chcia³bym porozmawiaæ z którymœ z magów. Muszê dostaæ siê do zamku.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Ka¿dy kurier magów ma przy sobie magiczn¹ pieczêæ, dziêki której mo¿e wejœæ do zamku. Gdybyœ by³ jednym z nas, móg³byœ tak¹ zdobyæ.
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "Masz problem.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Masz problem.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Czy¿by? A jaki?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //S¹ w tym obozie osoby, które maj¹ ciê ju¿ serdecznie dosyæ.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Tak? To powiedz im, ¿eby przys³a³y tutaj kogoœ, kto spróbuje mnie st¹d przepêdziæ!
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Sk¹d pewnoœæ, ¿e nie przys³a³y w³aœnie mnie?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Bo myœlê, ¿e jesteœ na to zbyt m¹dry. Wkrótce przekonasz siê, ¿e s¹ w tej kolonii ciekawsze rzeczy do roboty ni¿ us³ugiwanie Gomezowi.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //Nowy Obóz potrzebuje zdolnych ludzi. Tam przynajmniej nikt nam nie mówi co mamy robiæ.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Opowiedz mi o Nowym Obozie.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Opowiedz mi o Nowym Obozie.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Tylko tam znajdziesz prawdziw¹ wolnoœæ... jak na koloniê karn¹, oczywiœcie. Nie ma tam ¿adnych Magnatów ani Guru, którzy mogliby tob¹ pomiataæ.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Mamy w³asn¹ kopalniê, ale nie sprzedajemy ani grama rudy temu zramola³emu królowi!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //Wiêc do czego j¹ wykorzystujecie?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Nasi magowie opracowuj¹ plan ucieczki z kolonii. Zbieranie rudy jest czêœci¹ tego planu.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Gomez i jego ludzie p³awi¹ siê w luksusie, a my ciê¿ko pracujemy, ¿eby siê st¹d wydostaæ. Tak to wygl¹da!
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "A gdybym chcia³ do³¹czyæ do Nowego Obozu... móg³byœ mi pomóc?";//könntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //A gdybym chcia³ do³¹czyæ do Nowego Obozu... móg³byœ mi pomóc?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Jeœli myœlisz o tym powa¿nie, mo¿emy wyruszyæ od razu. Zaprowadzê ciê do Laresa. To szef naszej bandy.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Ale gdybyœ chcia³ wyrzuciæ mnie z Obozu si³¹ - mo¿esz spróbowaæ.
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "ChodŸmy do Nowego Obozu!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //ChodŸmy do Nowego Obozu!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Dobra! ChodŸ za mn¹!
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag zgodzi³ siê zaprowadziæ mnie do Nowego Obozu. Mam tylko nadziejê, ¿e to nie jakaœ pu³apka!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //No to jesteœmy.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Myœla³em, ¿e ju¿ tu nie dotrzesz! Zreszt¹ niewa¿ne - jesteœmy na miejscu!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Za t¹ bram¹ rozci¹ga siê Nowy Obóz. Porozmawiaj z Laresem, on ci pomo¿e. Daj mu ten cenny pierœcieñ.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //To twoja przepustka do Laresa. Trzeba mieæ nie lada powód, ¿eby siê z nim spotkaæ.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Wiesz co? Po zastanowieniu - chyba posiedzê tu parê dni. Zarobi³em ju¿ niez³¹ sumkê, a w Starym Obozie zaczyna robiæ siê trochê za gor¹co.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Jak byœ czegoœ potrzebowa³ - znajdziesz mnie w karczmie na œrodku jeziora. Uwa¿aj na siebie!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Do zobaczenia.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Stoimy przed g³ówn¹ bram¹ Nowego Obozu. Mordrag da³ mi pierœcieñ, który mam przekazaæ Laresowi, przywódcy Szkodników. Ma mi to pomóc w zostaniu cz³onkiem Nowego Obozu. Mordrag przez jakiœ czas zostanie w karczmie na jeziorze.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "W tym obozie nie ma miejsca dla ludzi takich jak ty!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //W tym obozie nie ma miejsca dla ludzi takich jak ty!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //S³ucham?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"Wynoœ siê st¹d i nigdy nie wracaj!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Nie tolerujemy tu ludzi, którzy okradaj¹ Magnatów!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Przysy³a mnie Thorus. Mam siê ciebie pozbyæ raz na zawsze.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Wynoœ siê st¹d i nigdy nie wracaj!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Wielkie s³owa ma³ego cz³owieczka...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Nie tolerujemy tu ludzi, którzy okradaj¹ Magnatów!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Ach, wiêc o to ci chodzi! Dlaczego nie powiedzia³eœ tak od razu...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Przysy³a mnie Thorus. Mam siê ciebie pozbyæ raz na zawsze.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Thorus? Naprawdê? Có¿, to wszystko co chcia³em wiedzieæ...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Wynoœ siê st¹d...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Pokona³em Mordraga i kaza³em mu nigdy wiêcej nie pokazywaæ siê w Starym Obozie.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares ma dla ciebie wiadomoœæ.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares ma dla ciebie wiadomoœæ.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Czego chce?
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Interesuj¹ go ostatnie wydarzenia w obozie Sekty. Mam ci przekazaæ, ¿e to twoje zadanie.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Mam wra¿enie, ¿e ten problem sam siê wkrótce rozwi¹¿e...

	B_LogEntry	(CH1_JoinNC,"Przekaza³em Mordragowi polecenie Laresa. Mamrota³ trochê o sprawach, które same siê wyjaœni¹. Nie bardzo wiem, co mia³ na myœli!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares powiedzia³, ¿e mam ci pomóc w tej sprawie.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares powiedzia³, ¿e mam ci pomóc w tej sprawie.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Widzisz! Wiedzia³em, ¿e nie bêdê musia³ sam siê z tym mêczyæ!
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Chcesz ¿ebym zaj¹³ siê tym w pojedynkê?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Na pewno jakoœ sobie poradzisz. S³uchaj: musisz koniecznie wywêszyæ, co siê kryje za t¹ ca³¹ histori¹ z przywo³aniem.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Wiem, ¿e te œwiry z sekty przygotowuj¹ siê do wielkiego przywo³ania, i choæ sam nie wierzê w Œni¹cego powiem ci jedno:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Guru dysponuj¹ potê¿n¹ magi¹, dlatego tak uwa¿nie musimy im patrzeæ na palce. Nad¹¿asz?

	B_LogEntry			(CH1_GotoPsiCamp,"Mordrag sprytnie zrzuci³ na mnie obowi¹zek szpiegowania w obozie Bractwa. Guru zdaj¹ siê przygotowywaæ do wielkiego przyzwania Œni¹cego. Moim zadaniem jest poznanie szczegó³ów.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Nie masz dla mnie ¿adnych dok³adniejszych wskazówek?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Zobaczê co siê da zrobiæ.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Nie masz dla mnie ¿adnych dok³adniejszych wskazówek?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Porozmawiaj z Lesterem. Spêdzi³em kiedyœ sporo czasu w obozie sekty, a on mi pomóg³. Goœæ jest w porz¹dku.
	B_LogEntry(CH1_GotoPsiCamp,"W obozie Bractwa mam porozmawiaæ z Nowicjuszem imieniem Lester. Ponoæ mo¿na mu zaufaæ - ju¿ wczeœniej pomaga³ Mordragowi.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Zobaczê co siê da zrobiæ.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Jak tylko dowiesz siê czegoœ o ich zamiarach, zg³oœ siê do mnie.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "Jeœli chodzi o tê sprawê z sekt¹...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //Jeœli chodzi o tê sprawê z sekt¹...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Tak?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Odby³o siê wielkie przywo³anie.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Niemo¿liwe! Chcesz powiedzieæ, ¿e bra³eœ w tym udzia³?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Bractwo zamierza wzmocniæ swoje si³y duchowe przy pomocy potê¿nego eliksiru wytwarzanego z jaj pe³zaczy. Dziêki temu maj¹ nadziejê nawi¹zaæ kontakt ze Œni¹cym.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Banda idiotów! Te œwiry naprawdê wierz¹ w te brednie, co?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Jestem ciekaw co z tego wszystkiego wyjdzie.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Ja te¿. Daj mi znaæ, gdy Guru zb³aŸni¹ siê ju¿ ca³kowicie.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag prawie umar³ ze œmiechu, gdy opowiedzia³em mu o jajach pe³zaczy. Jednak chyba straci³ zainteresowanie dalszym szpiegowaniem Guru. To znaczy, ¿e moja robota skoñczona.");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Niczego siê jeszcze nie dowiedzia³em.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Wiêc bierz siê do roboty!
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
