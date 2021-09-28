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
//					Erste Begr�ssung
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
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Niech �ni�cy b�dzie z tob�, nieznajomy.
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Jestem tu, by wskaza� ci w�a�ciw� �cie�k�.
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
	description = "A kt�ra �cie�ka jest w�a�ciwa?";
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
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //A kt�ra �cie�ka jest w�a�ciwa?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //�cie�ka �ni�cego, oczywi�cie. Tylko on mo�e nas st�d uwolni�.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Guru przygotowuj� w naszym obozie rytua� wielkiego przyzwania. Zamierzaj� nawi�za� kontakt ze �ni�cym.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Do tej pory przemawia� do nas wy��cznie za po�rednictwem wizji, ale ju� wkr�tce stanie przed nami w pe�ni swej chwa�y.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Jednak aby to osi�gn��, potrzebujemy jak najwi�kszej rzeszy wyznawc�w. Jednocz�c nasze si�y duchowe uda nam si� nawi�za� z nim kontakt.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Nasz ob�z znajduje si� do�� daleko st�d - na wielkim bagnie. Mog� ci� tam zaprowadzi�, je�li chcesz.
};

// **************************************************
//					Vorteile f�r mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Co mi przyjdzie z przy��czenia si� do was?";
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
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co mi przyjdzie z przy��czenia si� do was?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Mo�e oka�esz si� jednym z wybra�c�w, kt�rzy otrzymuj� od �ni�cego dar magii.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //A mo�e dost�pisz zaszczytu s�u�by w �wi�tynnej Stra�y. Tylko najlepsi spo�r�d wojownik�w mog� nale�e� do Stra�nik�w.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Je�li �ni�ce b�dzie ci szczeg�lnie sprzyja� - mo�e dane ci b�dzie po��czy� jedno z drugim! Najlepsi Stra�nicy otrzymuj� r�wnie� dar magii!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Jak widzisz, nasze Bractwo otwiera przed tob� wielkie mo�liwo�ci!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Pami�taj o tym zanim zdecydujesz si� przy��czy� do kt�rego� z innych oboz�w!
};

// **************************************************
//					Schl�fer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest �ni�cy?";
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
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //�ni�cy przemawia do nas poprzez sny i wizje.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Przewodzi nam odk�d nawi�za� pierwszy kontakt z Y'Berionem, pi�� lat temu.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Wszyscy wyznawcy Bractwa wyrzekli si� trzech bog�w. Teraz modlimy si� o zbawienie tylko do �ni�cego.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Zbawienie od czego?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Od tego przekl�tego miejsca, naturalnie! �ni�cy wska�e nam drog� do wolno�ci!
};

// **************************************************
//			Was hat Schl�fer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Co powiedzia� wam �ni�cy?";
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
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co powiedzia� wam �ni�cy?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Zaprowadzi� nas na bagna, na ruiny starej �wi�tyni. Tam zbudowali�my nasz ob�z.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Da� nam niezale�no�� - �aden z nas nie musi pracowa� pod ziemi�.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Pokaza� nam jaka moc drzemie w bagiennym zielu. Teraz sprzedajemy je innym obozom, otrzymuj�c w zamian wszystko, czego nam potrzeba.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Wreszcie obdarzy� niekt�rych z nas darem magii. Magii staro�ytnej i pot�nej. R�nej od tej, kt�r� wykorzystywali dot�d magowie tego kr�lestwa.
};

// **************************************************
//		Erz�hl mir von der MAgie des Schl�fers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o magii �ni�cego.";
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
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Opowiedz mi jeszcze o magii �ni�cego.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Magia �ni�cego pozwala ci kontrolowa� rzeczy si�� twojej woli.
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
	description = "Zaprowad� mnie do waszego obozu. Chcia�bym si� tam rozejrze�.";
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
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Zaprowad� mnie do waszego obozu. Chcia�bym si� tam rozejrze�.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez jest wys�annikiem obozu Bractwa. Kr��y po Starym Obozie werbuj�c nowych cz�onk�w sekty. Mo�e mnie zaprowadzi� do obozu na bagnie, gdzie rezyduj� wyznawcy �NI�CEGO!");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //To wspaniale. Chod� za mn�!
	
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
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Jeste�my na miejscu. Tam le�y ob�z Bractwa �ni�cego.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Nie spieszy�e� si� zbytnio, bracie! Przed nami ob�z wyznawc�w �ni�cego!
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Przejd� przez bram� i porozmawiaj z moimi bra�mi. Gwarantuj� ci, �e nie przyszed�e� tu na pr�no.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Zapytaj o Cor Kaloma. To on opiekuje si� Nowicjuszami.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Ja wr�c� teraz do Starego Obozu. Wielu niewiernych potrzebuje wci�� pomocy w odnalezieniu w�a�ciwej �cie�ki.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Powodzenia!

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"Przede mn� rozci�ga si� ob�z bractwa. M�j przewodnik poradzi� mi, bym odwiedzi� niejakiego Cor Kaloma. To opiekun wszystkich nowoprzyby�ych.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


