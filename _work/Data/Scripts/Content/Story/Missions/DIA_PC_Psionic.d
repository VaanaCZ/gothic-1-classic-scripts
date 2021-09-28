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
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Poj�me!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //K� t� Sp�� ochr�n�!
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
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Oslovil jsi Guru! U� to nikdy ned�lej! Je to svatokr�de�! Kdy� bude s tebou cht�t mistr mluvit, ON oslov� TEBE.
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
	description = "Kdo jsi?";
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
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Kdo jsi?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Jsem Lester. Star�m se o cizince, kte�� sem p�ijdou.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //M� �t�st�, �e jsi nemluvil s Baalem Namibem. ��dn� cizinec nesm� mluvit s Guru.
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
	description	= "J� ale chci mluvit s tv�m mistrem.";
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
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //J� ale chci mluvit s tv�m mistrem.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Zapome� na to! M��u ti pomoci s jak�mkoliv tv�m probl�mem!
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
	description	= "�ekni mi n�co o t�bo�e.";
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
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //�ekni mi n�co o t�boru.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Co chce� v�d�t?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"�ekni mi o spole�enstv�.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Co mi m��e� ��ci o Sp��ovi?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Co v� o droze z ba�in?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //�ekni mi o spole�enstv�.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Guru tvo�� nejvy��� spole�enstv�. Jsou duchem t�bora a jeho velkou silou. Templ��i pou��vaj� svoji duchovn� s�lu v boji.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Maj� nezkrotnou divokou s�lu. NIKDY by ses s nimi nem�l dostat do probl�mu. J� osobn� pat��m k novic�m. Modl�me se ke Sp��ovi a pracujeme v t�bo�e.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //N�kte�� novici se sm�j� p�idat ke Guru, ale aby jim to bylo povoleno, musej� dlouh� l�ta studovat.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Co mi m��e� ��ci o Sp��ovi?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Sp�� je duchovn� bytost. Vytv��� vize - aspo� pro Guru.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Modl�me se k n�mu, aby n�m dal svobodu.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //A v���te tomu?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hej, jsem v Bari��e u� dva roky. Dok�e� si p�edstavit, jak dlouh� m��ou DVA ROKY b�t?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Nedok�e� si p�edstavit, v co jsem ochotn� v��it a co ud�lat, jen abych se odtud dostal pry�!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Co v� o droze z ba�in?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //No, tahle droga roste v ba�in�ch. P�ed t�m, ne� se m��e kou�it, se samoz�ejm� mus� zpracovat. To d�laj� novici.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Droga m� uklid�uj�c� a osv�uj�c� ��inek. Pom�h� p�i koncentraci a umoc�uje v�dom�.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Vym��ujeme ji za zbo�� ze Star�ho t�bora a tak� ji pou��v�me pro z�sk�v�n� nov�ch lid�.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //N�kte�� lid� se v�ak k n�m p�id�vaj� jen kv�li t� droze. Ale tak n�m aspo� pom�haj� s prac� v t�bo�e.
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
	description	= "Chci se st�t �lenem Bratrstva!";
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
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Chci se st�t �lenem Bratrstva!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom rozhodne, jestli jsi hoden vstoupit do Bratrstva.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Spol�h� se ale na radu Guru. Baal Namib, t�mhle ten, je jedn�m z nich.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Nejprve mus� dok�zat, �e jsi toho hoden a pak t� jeden z Guru po�le za Corem Kalomem.
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
	description	= "Jak to asi prob�hne, pokud se za m� ani jeden z Guru nep�imluv�?";
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
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Jak to asi prob�hne, pokud se za m� ani jeden z Guru nep�imluv�?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //To nev�m, ale Guru sleduj� v�echno, co tady v t�bo�e d�l�.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Pokud si mysl�, �e si zaslou�� st�t se �lenem komunity, pak se za tebe p�imluv�.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //V t�bo�e m� spoustu mo�nost�, jak dok�zat, �e jsi toho hoden.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Pokud se budu cht�t p�idat k Bratrstvu v t�bo�e v ba�in�ch, budu muset ud�lat dojem na guru. Ti v�ak bohu�el nemluv� s nov�mi p��choz�mi. Novic Lester mi �ekl, �e m� p�esto pozoruj�, a �e budu pot�ebovat n�jak uk�zat, jak bych jim mohl b�t u�ite�n�. Nem�m nejmen�� p�edstavu o tom, jak to ud�lat! Rad�ji bych se m�l dob�e porozhl�dnout po T�bo�e v ba�in�ch.");

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
	description	= "Co mus�m ud�lat, aby se za m� tv�j mistr p�imluvil?";
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
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Co mus�m ud�lat, aby se za m� tv�j mistr p�imluvil?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Mus� v�d�t, co chce sly�et.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //A to je?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Poslouchej: a� u n�ho p��t� budeme, oslov� m� a povedeme spolu kr�tk� hovor.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib m� obavy z toho, �e se mnoz� novici nemodl� jen ke Sp��ovi, ale tak� ke sv�m d��v�j��m boh�m.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Ty mi �ekne�, �e jsi se star�ch boh� z�ekl a �e se u� nad�le bude� modlit v�hradn� ke Sp��ovi.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Pak se t� zept�m, pro� jsi se takhle rozhodl a ty �ekne�, �e jsi m�l vizi, ve kter� t� k tomu Sp�� vyzval.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Pak projev� z�jem. Mysl�, �e to zvl�dne�?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Bez probl�m�.
	
	B_LogEntry	(CH1_JoinPsi,"Abych ud�lal dojem na Baala Namiba, m�l bych v bl�zkosti tohoto guru oslovit Lestera a vypr�v�t mu o star�ch boz�ch a Sp��ovi.");

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
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //AAH! R�D T� ZASE VID�M. JAK SE TI VEDE?
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
	description	= "Z�ekl jsem se star�ch boh�.";
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
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //Z�EKL JSEM SE STAR�CH BOH�.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //OPRAVDU? CO T� K TOMU P�IM�LO?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //M�L JSEM VIZI: PROMLUVIL KE MN� SP��.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //CO TI ��KAL?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //�EKL: JDI DO T�BORA V BA�IN�CH A P�IDEJ SE K BRATRSTVU.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //JSI VELMI ��ASTN� MU�, CIZIN�E: SP�� TAKTO NEPROMLOUV� K MNOHA LIDEM.

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
	description	= "Jak se m�m tady v t�bo�e vyznat?";
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
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Jak se m�m tady v t�bo�e vyznat?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //M��u ti uk�zat nejd�le�it�j�� m�sta.
};

// **************************************************
//				F�HRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "U� tam budeme?";
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
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //U� tam budeme?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Kdy� se m� p�estane� pt�t, budeme moci j�t rychleji.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE �NDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "Rozmyslel jsem se.";
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
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Rozmyslel jsem se.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Douf�m, �e v�, kde m� najde�.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------F�HRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Uka� mi cestu..."; 
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
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Uka� mi cestu...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zp�tky k hlavn� br�n�",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do kov��stv�",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do chr�mu",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"k u�itel�m",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"do alchymistick� d�lny",PC_Psionic_GUIDEFIRST_HERB);

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
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...do kov��sk�ho kr�mu.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Poj� za mnou!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...do chr�mu.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Poj� za mnou!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...k u�itel�m.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Poj� za mnou!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...do alchymistick� d�lny.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Poj� za mnou!
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
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Dole najde� Baala Cadara. Vyu�uje novice.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Kdy� vyleze� po tomhle �eb��ku, dostane� se na templ��sk� cvi�i�t�. Budu tady na tebe �ekat. Kdyby ses zpozdil, budu zase u Baala Namiba u vchodu do t�bora.

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
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Tohle je chr�m! Po�k�m na tebe, ale kdy� ti to bude moc dlouho trvat, p�jdu zp�tky k Baalu Namibovi.

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
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Tohle je kov�rna. Rozhl�dni se tu. Po�k�m na tebe asi hodinu, pak p�jdu pry�.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauth�ndler ****************************************// 
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
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Kdy� vyleze� po tomhle �eb��ku, dostane� se k alchymistovi Corovi Kalomovi. Dole je Fortuno, obchodn�k s drogou.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Po�k�m tu na tebe. Nebu� tam ale moc dlouho, jinak se vr�t�m zp�tky.
	
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
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral f�r alle SC-Gilden!!!
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
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Jsem r�d, �e jsi tady. M�m pro tebe noviny.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Douf�m, �e dobr�.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Na�e Bratrstvo pl�nuje nesm�rn� velkou v�c.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Co pl�nuje? Prolomen�?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Guru se pokou�ej� spojit se se Sp��em. Pot�ebuj� ale n�jak sjednotit sv� s�ly.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //No a?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Pot�ebuj� magick� p�edm�t, ohnisko.

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
	description		= "A co j� s t�m m�m d�lat?"; 
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
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //A co j� s t�m m�m d�lat?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Promluv s Y�Berionem. Je tady nejmocn�j�� mu�. Je to mo�nost, jak u n�j dos�hnout obliby.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Kde ho najdu?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Jdi do chr�mu. Z��dkakdy ho opou�t�. Z�ejm� se v t�ch chladn�ch zdech c�t� b�t bl� Sp��ovi.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Novic Lester mi �ekl, �e se Y�Berion sh�n� po kouzeln�m ohniskov�m kameni. Guru je v chr�mov� ho�e.");

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
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hej, co tady d�l�?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //P�i�el jsem na rozkaz m�g� Vody. Hled�m kouzeln� artefakty, takzvan� ohniskov� kameny.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Hled� ohniskov� kameny? Jsi opravdu sm�l�.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas a ostatn� m�gov� z Nov�ho t�bora je cht�j� pou��t k rozbo�en� Bari�ry, aby n�s osvobodili z na�eho uv�zn�n�.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Tomu uv���m, jedin� a� to uvid�m na vlastn� o�i.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Taky to tak c�t�m. Ale �ekni mi, pro� jsi sem p�i�el?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Zva�uju, jestli m� cenu se vydat na n�v�t�vu horsk� pevnosti.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //V�... existuje jeden dokument, kter� bych r�d z�skal. Na druhou stranu je to nebezpe�n�, tam chodit.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak se ti poda�ilo p�ej�t p�es ty hory?"; 
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
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Jak se ti poda�ilo p�ej�t p�es ty hory?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Hodn� jsem se toho nau�il od Guru. Jejich kouzla m��ou b�t opravdu u�ite�n�.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ten dokument, co ho chce�... co je to za�?"; 
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
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Ten dokument, co ho chce�... co je to za�?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //P�ed mnoha lety �il v t� horsk� pevnosti p�n t�to oblasti. M�l pod kontrolou zem i doly.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Tak jako ostatn� �lechtici i on samoz�ejm� m�l dokument, kter� potvrzoval jeho lenn� majetek. A pr�v� to je ten dokument.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Ale od t� doby, co jsme tu dr�eni Bari�rou, u� nen� k ni�emu u�ite�n�.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //To je pravda. Pokud se ale m�g�m Vody poda�� zni�it Bari�ru, dokument znovu nabude zna�n� hodnoty.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mohli bychom se pod�vat na tu pevnost spole�n�."; 
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
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Mohli bysme se pod�vat na tu pevnost spole�n�.
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //To je dobr� n�pad. Jdi prvn�, z�stanu bl�zko tebe.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"P�ed mohutnou pevnost�, kter� byla vybudov�na v hor�ch, jsem se setkal s novicem Lesterem z T�bora v ba�in�ch. Rozhl�el se v budov� po n�jak� listin� a p�idal se ke mn� p�i hled�n� ohniska.");

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
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Pod�vej, tohle vypad� jako to ohnisko, co hled�.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Ano, vypad� to jako ohniskov� rovina, hmm... Nen� snadn� se k tomu dostat...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"Ohnisko, kter� hled�m, stoj� na podstavci. Je v�ak p��li� vysoko, ne� abych pro n�j mohl vyl�zt. Mus�m naj�t n�jak� zp�sob, jak tento artefakt z�skat.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL �BER DIE BR�CKE OHNE DEN AUFTRAG ERF�LLT ZU HABEN--------
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
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Kam jde�? Je�t� jsme tady neskon�ili!
	
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
	description		= "Jsem ran�n�. M��e� mi pomoci?"; 
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
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Jsem ran�n�. M��e� mi pomoci?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Vezmi si tenhle hojiv� lektvar.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE F�R LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Na�el jsem ten dokument."; 
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
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Na�el jsem ten dokument.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Hej, dobr� pr�ce. Vezmi si za odm�nu tyto kouzeln� svitky. S nimi se dostane� k tomu ohnisku.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Po�k�m na tebe dole u t� ohniskov� roviny.

	B_LogEntry		(CH3_Fortress,"Listina, po kter� se sh�n�l Lester, byla v jedn� truhlici. V�m�nou mi dal �ty�i kouzeln� svitky telekineze, pomoc� kter�ch dostanu to ohnisko.");
	
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
	description		= "Jak se dostanu k tomu ohnisku?"; 
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
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Jak se dostanu k tomu ohnisku?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Mistr Y�Berion obvykle ��k�: ��k zkou�� v�cmi pohybovat pomoc� rukou a nohou, mistr jimi pohybuje duchovn� silou.
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
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Z�stanu tady, abych na�el ten dokument.
	
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
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //P�jdu a porozhl�dnu se tady.
	
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
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Je�t� nem�me oba to, co jsme cht�li. J� z�stanu tady, abych si p�e�etl ty star� knihy.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Dob�e, je�t� se sejdeme.

	B_LogEntry		(CH3_Fortress,"Z�skal jsem ohnisko. Lester se chce je�t� porozhl�dnout po knihovn� v pevnosti. Douf�m, �e se s n�m je�t� uvid�m.");

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
	description		= "Na�el jsi n�co?"; 
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
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Na�el jsi n�co?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Ta truhla je zam�en�. Mo�n� k n� najdeme kl�� n�kde v pevnosti.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //U� jsi na�el ten dokument?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Je�t� ne.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Hledal jsi v knihovn�?
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
	description		= "Prozkoum�me pevnost spole�n�."; 
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
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Prozkoum�me pevnost spole�n�.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Dob�e, jdi prvn�!
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Bj�rn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Potkal jsem p�es Star�m t�borem Diega a Miltena!";
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
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Jak se m�?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hej, co tady d�l�?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Star� d�l se zhroutil potom, co ho zatopila voda!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//No a?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//V�ichni m�gov� Ohn� jsou mrtv�!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez je povra�dil.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//To nebude snadn� napravit!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Potkal jsem p�es Star�m t�borem Diega a Miltena!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Cht�li se s tebou setkat. Na obvykl�m m�st�.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//U� bylo na �ase!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//Co se d�je?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Z�stanu tady, abych si p�e�etl ty star� knihy.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Uch... Nerozum�m...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Mistr Y�Berion obvykle ��k�: ��k zkou�� v�cmi pohybovat pomoc� rukou a nohou, mistr jimi pohybuje duchovn� silou.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Dob�e, dob�e. D�m si pozor.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Opatruj se.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//D�kuju. P�jdu si svou cestou.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//K� t� Sp�� ochr�n�!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"�ekl jsem Lesterovi a Gornovi o setk�n� s jejich p��teli. Te� u� to nen� moje v�c. D�l si porad� sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
