// **************************************
//					EXIT 
// **************************************

instance DIA_Gomez_Exit (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 999;
	condition	= DIA_Gomez_Exit_Condition;
	information	= DIA_Gomez_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gomez_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Gomez_Fault (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Fault_Condition;
	information	= DIA_Gomez_Fault_Info;
	permanent	= 0;
	description	= "Przychodz� zaoferowa� swoje us�ugi.";
};                       

FUNC int DIA_Gomez_Fault_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Fault_Info()
{
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Przychodz� zaoferowa� swoje us�ugi.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //�miesz tak po prostu tutaj wmaszerowa� i zawraca� mi g�ow�? Ty gnido! STRA�!
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

// **************************************
//				Hallo
// **************************************
	var int gomez_kontakte;
// **************************************
	

instance DIA_Gomez_Hello (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Hello_Condition;
	information	= DIA_Gomez_Hello_Info;
	permanent	= 1;
	description	= "Przychodz� zaoferowa� swoje us�ugi.";
};                       

FUNC int DIA_Gomez_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte<4) )
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Hello_Info()
{
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //Przychodz� zaoferowa� swoje us�ugi.
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //A dlaczego my�lisz, �e potrzebuj� twoich us�ug?
	
	Info_ClearChoices	(DIA_Gomez_Hello);																			
	Info_AddChoice		(DIA_Gomez_Hello,"Chyba nie musz� udowadnia�, �e potrafi� pos�ugiwa� si� broni�?",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Bo wi�kszo�� z twoich ludzi to leniwe ba�wany.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"Przemierzy�em spor� cz�� kolonii, i mam kontakty we wszystkich obozach.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice		(DIA_Gomez_Hello,"Przeszed�em test zaufania.",DIA_Gomez_Hello_ThorusSays);
	
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Przeszed�em test zaufania, a Thorus twierdzi, �e si� nadaj�.
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Gdyby tak nie by�o, nie dosta�by� si� tutaj �ywy. Mam nadziej�, �e sta� ci� jeszcze na wi�cej.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //Przemierzy�em spor� cz�� kolonii i mam kontakty we wszystkich obozach.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //No! To si� mo�e przyda�. Z kim konkretnie utrzymujesz kontakty?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"To ju� wszyscy, z tych wa�niejszych.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Z kilkoma �obuzami z Nowego Obozu.",DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice		(DIA_Gomez_Hello,"Z Laresem.",DIA_Gomez_Hello_Kontakte_Lares);
	//Info_AddChoice		(DIA_Gomez_Hello,"Zu Lee."	,DIA_Gomez_Hello_Kontakte_Lee);
	Info_AddChoice		(DIA_Gomez_Hello,"Z kilkoma Baalami w obozie Bractwa.",DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice		(DIA_Gomez_Hello,"Z Cor Kalomem",DIA_Gomez_Hello_Kontakte_Kalom);
	
	if (gomez_kontakte < 3)
	{
	Info_AddChoice		(DIA_Gomez_Hello,"Z Y'Berionem.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Bo wi�kszo�� z twoich ludzi to leniwe ba�wany czyhaj�ce na jakiego� ��todzioba, kt�ry odwali za nich czarn� robot�.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //Tak jest, poza pewnymi chlubnymi wyj�tkami. Ale to jeszcze nie pow�d, �eby zatrudni� kolejnego leniwego ba�wana.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //Mam nadziej�, �e nie b�d� musia� odr�ba� ci g�owy, �eby udowodni�, �e potrafi� pos�ugiwa� si� broni�.
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Pomi�dzy odwag� a g�upot� jest tylko cienka linia...
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------


func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Z Y'Berionem.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion nie traci czasu na rozmowy z lud�mi twojego pokroju.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Z twoich k�amstw wnosz�, �e masz mnie za idiot�!
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Przykro mi, �e masz mnie za takiego g�upca.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Nie lubi�, kiedy kto� sprawia mi przykro��.
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //Z Cor Kalomem
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //Z kilkoma Baalami w obozie Bractwa.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

/*
func void DIA_Gomez_Hello_Kontakte_Lee()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lee_15_00"); //Zu Lee.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_01"); //Lee ist also ein guter Freund von dir, ja?
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_02"); //Dann sieht die Sache nat�rlich ANDERS AUS (zornig am ENDE)

	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};
*/
func void DIA_Gomez_Hello_Kontakte_Lares()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //Z Laresem.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Z kilkoma �obuzami z Nowego Obozu.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //To ju� wszyscy, z tych wa�niejszych.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //Nie�le - jak na ��todzioba.
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Dostaniesz swoj� szans�.
		Info_ClearChoices	(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //I co? Mam by� pod wra�eniem?! Znam Kopaczy, kt�rzy maj� lepsze kontakty od ciebie!
		Info_ClearChoices	(DIA_Gomez_Hello);
	};
};

// **************************************
//				Bin ich dabei
// **************************************

instance DIA_Gomez_Dabei (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Dabei_Condition;
	information	= DIA_Gomez_Dabei_Info;
	permanent	= 0;
	description	= "To znaczy, �e jestem jednym z was!";
};                       

FUNC int DIA_Gomez_Dabei_Condition()
{
	if	(gomez_kontakte >= 3)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Dabei_Info()
{
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //To znaczy, �e jestem jednym z was?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //W�a�nie tak. Witaj w dru�ynie, ch�opcze.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Kruk wprowadzi ci� w szczeg�y.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry			(CH1_JoinOC,"Od dzi� pracuj� dla Gomeza w Starym Obozie. Kruk ma mi udzieli� wszystkich potrzebnych informacji!");
	Log_SetTopicStatus	(CH1_JoinOC,	LOG_SUCCESS);

	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,"Nie mog� zosta� przyj�ty do gangu Laresa, gdy� jestem jednym z ludzi Gomeza!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,"Stary Ob�z b�dzie od dzi� moim domem. Bractwo �ni�cego b�dzie musia�o obej�� si� jako� beze mnie.");
	
	AI_StopProcessInfos	(self);
};

// **************************************
//				Nur so (PERM)
// **************************************

instance DIA_Gomez_NurSo (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_NurSo_Condition;
	information	= DIA_Gomez_NurSo_Info;
	permanent	= 1;
	description	= "Pomy�la�em, �e zdam ci raport...";
};                       

FUNC int DIA_Gomez_NurSo_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_NurSo_Info()
{
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Pomy�la�em, �e zdam ci raport...
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //Id� porozmawia� z Krukiem. I nigdy wi�cej nie odzywaj si� do mnie bez pozwolenia!
};


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////////////////   	Kapitel 5        ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


// ***********************************************
// 				Wartet auf den SC
// ***********************************************

instance  DIA_EBR_100_Gomez_Wait4SC (C_INFO)
{
	npc				= EBR_100_Gomez;
	condition		= DIA_EBR_100_Gomez_Wait4SC_Condition;
	information		= DIA_EBR_100_Gomez_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_100_Gomez_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_100_Gomez_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Jak si� tu dosta�e�?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Czekaj no? Czy to nie ty walczy�e� z naszymi lud�mi w Wolnej Kopalni?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Twoi ludzie nie mieli prawa jej atakowa�. Musia�em zapobiec twoim szalonym zap�dom.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Rozmowa ze mn� takim tonem wymaga pewnej odwagi. Ale zjawianie si� tutaj tak po prostu to ju� zwyk�a g�upota.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Osobi�cie dopilnuj�, �eby� ju� nigdy nie wszed� mi w drog�.
	
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	( self, GIL_EBR );	
};
