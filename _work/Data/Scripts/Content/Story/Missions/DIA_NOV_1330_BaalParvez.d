// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Niech Śniący będzie z tobą, nieznajomy.
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Jestem tu, by wskazać ci właściwą ścieżkę.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "A która ścieżka jest właściwa?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //A która ścieżka jest właściwa?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Ścieżka Śniącego, oczywiście. Tylko on może nas stąd uwolnić.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Guru przygotowują w naszym obozie rytuał wielkiego przyzwania. Zamierzają nawiązać kontakt ze Śniącym.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Do tej pory przemawiał do nas wyłącznie za pośrednictwem wizji, ale już wkrótce stanie przed nami w pełni swej chwały.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Jednak aby to osiągnąć, potrzebujemy jak największej rzeszy wyznawców. Jednocząc nasze siły duchowe uda nam się nawiązać z nim kontakt.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Nasz obóz znajduje się dość daleko stąd - na wielkim bagnie. Mogę cię tam zaprowadzić, jeśli chcesz.
};

// **************************************************
//					Vorteile für mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Co mi przyjdzie z przyłączenia się do was?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co mi przyjdzie z przyłączenia się do was?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Może okażesz się jednym z wybrańców, którzy otrzymują od Śniącego dar magii.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //A może dostąpisz zaszczytu służby w Świątynnej Straży. Tylko najlepsi spośród wojowników mogą należeć do Strażników.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Jeśli Śniące będzie ci szczególnie sprzyjał - może dane ci będzie połączyć jedno z drugim! Najlepsi Strażnicy otrzymują również dar magii!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Jak widzisz, nasze Bractwo otwiera przed tobą wielkie możliwości!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Pamiętaj o tym zanim zdecydujesz się przyłączyć do któregoś z innych obozów!
};

// **************************************************
//					Schläfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest Śniący?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Kim jest Śniący?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Śniący przemawia do nas poprzez sny i wizje.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Przewodzi nam odkąd nawiązał pierwszy kontakt z Y'Berionem, pięć lat temu.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Wszyscy wyznawcy Bractwa wyrzekli się trzech bogów. Teraz modlimy się o zbawienie tylko do Śniącego.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Zbawienie od czego?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Od tego przeklętego miejsca, naturalnie! Śniący wskaże nam drogę do wolności!
};

// **************************************************
//			Was hat Schläfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Co powiedział wam Śniący?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co powiedział wam Śniący?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Zaprowadził nas na bagna, na ruiny starej świątyni. Tam zbudowaliśmy nasz obóz.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Dał nam niezależność - żaden z nas nie musi pracować pod ziemią.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Pokazał nam jaka moc drzemie w bagiennym zielu. Teraz sprzedajemy je innym obozom, otrzymując w zamian wszystko, czego nam potrzeba.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Wreszcie obdarzył niektórych z nas darem magii. Magii starożytnej i potężnej. Różnej od tej, którą wykorzystywali dotąd magowie tego królestwa.
};

// **************************************************
//		Erzähl mir von der MAgie des Schläfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o magii Śniącego.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Opowiedz mi jeszcze o magii Śniącego.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Magia Śniącego pozwala ci kontrolować rzeczy siłą twojej woli.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Jednak tylko wtajemniczeni Guru poznali tajniki tej magii.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Zaprowadź mnie do waszego obozu. Chciałbym się tam rozejrzeć.";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Zaprowadź mnie do waszego obozu. Chciałbym się tam rozejrzeć.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez jest wysłannikiem obozu Bractwa. Krąży po Starym Obozie werbując nowych członków sekty. Może mnie zaprowadzić do obozu na bagnie, gdzie rezydują wyznawcy ŚNIĄCEGO!");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //To wspaniale. Chodź za mną!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Jesteśmy na miejscu. Tam leży obóz Bractwa Śniącego.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Nie spieszyłeś się zbytnio, bracie! Przed nami obóz wyznawców Śniącego!
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Przejdź przez bramę i porozmawiaj z moimi braćmi. Gwarantuję ci, że nie przyszedłeś tu na próżno.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Zapytaj o Cor Kaloma. To on opiekuje się Nowicjuszami.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Ja wrócę teraz do Starego Obozu. Wielu niewiernych potrzebuje wciąż pomocy w odnalezieniu właściwej ścieżki.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Powodzenia!

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"Przede mną rozciąga się obóz bractwa. Mój przewodnik poradził mi, bym odwiedził niejakiego Cor Kaloma. To opiekun wszystkich nowoprzybyłych.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


