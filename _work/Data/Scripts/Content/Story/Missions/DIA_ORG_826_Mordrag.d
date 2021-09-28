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
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hej, ty novej! Já jsem Mordrag. To jméno by sis mìl zapamatovat - ode mì mùžeš koupit jakékoliv zboží za dobrou cenu!
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
	description = "Ukaž mi svoje zboží.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Ukaž mi tvoje zboží.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Nìco si vyber...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Bandita Mordrag prodává na tržišti kradené zboží.");
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
	description = "Jsi doopravdy kurýr mágù?";
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
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Jsi doopravdy kurýr mágù?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //A co když jsem?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Potøeboval bych si promluvit s mágy. Musím se dostat do hradu.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Kurýøi mágù nosí znak, který jim umožní vstup na hrad. Jestli jsi jeden z nás, pak bys mìl mít takový znak...
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
	description = "Máš problém.";
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
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Máš problém.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Opravdu? Co se dìje?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Jsou tady lidi, kteøí se tì chtìjí zbavit.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Opravdu? Pak jim mùžeš øíci, že by mìli nìkoho vyslat, aby jim splnil jejich pøání.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Jak si mùžeš být tak jistý, že nejsem ten, kdo to má udìlat?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Protože si myslím, že na to jsi pøíliš bystrý, chlapèe. Brzy si uvìdomíš, že je lepší stát proti Gomezovi, než pro nìj pracovat.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //V Novém táboøe hodnì potøebujeme schopné lidi a nikdo ti tam nebude pøikazovat, co máš dìlat.
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
	description = "Povìz mi víc o Novém táboøe.";
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
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Povìz mi víc o Novém táboøe.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Je to tábor, ve kterém máš nejvìtší svobodu v celé kolonii. Nemáme žádné Rudobarony ani Guru, kteøí by nám šéfovali.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Máme vlastní dùl. Ale ruda, kterou vyrábíme, neputuje k žádnému zpropadenému králi!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //Tak k èemu se používá?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Naši mágové pracují na plánu, jak prolomit Bariéru. Všechna ruda se shromažïuje pro tento plán.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Zatímco se Gomez a jeho lidé povalují, my se døeme za svobodu - to je to, co se dìje.
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
	description = "A kdybych se chtìl pøidat k Novému táboru... mohl bys mi pomoci?";//könntest du mir dabei helfen... ZU LANG
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
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //A kdybych se chtìl pøidat k Novému táboru... mohl bys mi pomoci?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Jestli to myslíš vážnì, mùžeme hned jít! Zavedu tì k Laresovi. Je hlavou tlupy.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Ale jestli mì chceš radìji zmlátit nìkde mimo tábor... Dobrá, do toho!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Tak pojïme do Nového tábora!";
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
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Tak pojïme do Nového tábora!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Dobøe! Následuj mì.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag mi slíbil, že mi ukáže cestu do Nového tábora. Doufám, že to není léèka!");

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
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Tak, a jsme tady.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Myslel jsem, že už nikdy nepøijdeš! Nevadí - jsme tady!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Jakmile projdeš branou, budeš v Novém táboøe. Promluv si s Laresem. Pomùže ti. Dej mu tohle. Je to nádherný prsten.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //To je tvoje vstupenka k Laresovi. Musíš mít dobrý dùvod, abys ho mohl navštívit.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Dobrá, jak o tom pøemýšlím, myslím, že tady na nìjaký èas zùstanu. Už jsem vydìlal dost a ve Starém táboøe je teï trochu dusno.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Jestli chceš, pøijï za mnou do baru - to je ta chatrè na jezeøe. Dávej pozor!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Uvidíme se!
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Stojíme u pøední brány Nového tábora a Mordrag mi dal prsten, který mám ukázat vùdci banditù Laresovi, pokud se chci pøidat k Novému táboru. Mordrag se chce na chvilku zastavit v baru na jezeøe.");
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
	description = "Tenhle tábor není pro nás dva dost velký!";
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
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //Tenhle tábor není pro nás dva dost velký!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Co prosím?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"Prostì odsud vypadni!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Tady není místo pro lidi, kteøí kradou u Rudobaronù!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Poslal mì Thorus. Chce, abych tì provždy odstranil.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Prostì odsud vypadni!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Velký slova malýho chlapa...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Tady není místo pro lidi, kteøí kradou u Rudobaronù!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Á, tak tohle máš na mysli! Proè neøekneš rovnou...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Poslal mì Thorus. Chce, abych tì provždy odstranil.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Opravdu? Thorus? To je všechno, co jsem chtìl vìdìt...
	
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
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Tak odsud vypadni...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Vybìhl jsem s Mordragem a øekl mu, že ho už nikdy nechci ve Starém táboøe vidìt.");

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
	description = "Lares má pro tebe zprávu.";
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
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares má pro tebe zprávu.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Øekni mi o tom.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Chce vìdìt, co se dìje v Sektovním táboøe a chce, abys mu to zjistil ty.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Mám pocit, že se ten problém vyøeší sám...

	B_LogEntry	(CH1_JoinNC,"Øekl jsem Mordragovi, co po mnì Lares chtìl. Mumlal nìco o tom, že se vìci vyvrbí samy. Nemám tušení, co tím mìl na mysli!");
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
	description = "Lares mi øekl, abych ti pomohl s tou sektáøskou záležitostí.";
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
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares mi øekl, abych ti pomohl s tou sektáøskou záležitostí.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Vidíš... Vìdìl jsem, že se o to nebudu muset starat sám.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Chceš, abych ten pøípad vyøešil celý já sám?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Jsem si jistý, že to zvládneš. Poslouchej: dùležité je zjistit, co je pravdy na tìch povìstech o vzývání.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Vím, ti sektáøští blázni plánují velké vzývání. Co se mì týèe, já ve Spáèe nevìøím - jedna vìc je ale jistá:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Guru mají ve své moci silná kouzla. Proto bude lepší vìdìt, o co pùjde. Rozumíš mi?

	B_LogEntry			(CH1_GotoPsiCamp,"Mordrag provedl svùj výzvìdný úkol v táboøe v bažinách docela chytøe. Guru se zøejmì pøipravují k velkému vzývání, já bych chtìl ale znát další podrobnosti.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Mùžeš mi dát nìjaké podrobnìjší pokyny?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Uvidím, co budu moci udìlat.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Mùžeš mi dát nìjaké podrobnìjší pokyny?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Øekni Lesterovi. Kdysi jsem strávil dlouhou dobu v Sektovním táboøe a on mi tam pomáhal. Patøí k tìm dobrým chlapùm.
	B_LogEntry(CH1_GotoPsiCamp,"V táboøe Bratrstva si mám promluvit s novicem Lesterem. Zdá se, že je dùvìryhodný, protože kdysi pomohl Mordragovi.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Uvidím, co budu moci udìlat.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Jakmile se dozvíš o jejich plánech, vra se a podej mi hlášení.
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
	description = "O té sektáøské záležitosti...";
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
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //O té sektáøské záležitosti...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Cože?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Nadešlo velké vzývání.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Ne! Zúèastnil ses toho jejich bláznovství?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Mají v úmyslu kontaktovat Spáèe prostøednictvím lektvaru, který vyrobili z vajíèek dùlních èervù.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Jak pošetilé! Ty šílené hlavy tomu všemu opravdu vìøí, že jo?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Jsem zvìdavý, co z toho vzejde.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Já taky. Dej mi vìdìt, až z toho Guru koneènì úplnì zešílí.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag se mohl potrhat smíchy, když jsem mu øekl o vajíèkách dùlního èerva. Vypadá to, že už ho vyzvídání u guru pøíliš nezajímá. Shledávám že záležitost je vyøešena!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Nic jsme neobjevil.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Tak v tom pokraèuj...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
