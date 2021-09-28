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
	description	= "Przychodzê zaoferowaæ swoje us³ugi.";
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
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Przychodzê zaoferowaæ swoje us³ugi.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //Œmiesz tak po prostu tutaj wmaszerowaæ i zawracaæ mi g³owê? Ty gnido! STRA¯!
	
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
	description	= "Przychodzê zaoferowaæ swoje us³ugi.";
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
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //Przychodzê zaoferowaæ swoje us³ugi.
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //A dlaczego myœlisz, ¿e potrzebujê twoich us³ug?
	
	Info_ClearChoices	(DIA_Gomez_Hello);																			
	Info_AddChoice		(DIA_Gomez_Hello,"Chyba nie muszê udowadniaæ, ¿e potrafiê pos³ugiwaæ siê broni¹?",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Bo wiêkszoœæ z twoich ludzi to leniwe ba³wany.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"Przemierzy³em spor¹ czêœæ kolonii, i mam kontakty we wszystkich obozach.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice		(DIA_Gomez_Hello,"Przeszed³em test zaufania.",DIA_Gomez_Hello_ThorusSays);
	
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Przeszed³em test zaufania, a Thorus twierdzi, ¿e siê nadajê.
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Gdyby tak nie by³o, nie dosta³byœ siê tutaj ¿ywy. Mam nadziejê, ¿e staæ ciê jeszcze na wiêcej.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //Przemierzy³em spor¹ czêœæ kolonii i mam kontakty we wszystkich obozach.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //No! To siê mo¿e przydaæ. Z kim konkretnie utrzymujesz kontakty?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"To ju¿ wszyscy, z tych wa¿niejszych.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Z kilkoma ³obuzami z Nowego Obozu.",DIA_Gomez_Hello_Kontakte_NLHehler);
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
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Bo wiêkszoœæ z twoich ludzi to leniwe ba³wany czyhaj¹ce na jakiegoœ ¿ó³todzioba, który odwali za nich czarn¹ robotê.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //Tak jest, poza pewnymi chlubnymi wyj¹tkami. Ale to jeszcze nie powód, ¿eby zatrudniæ kolejnego leniwego ba³wana.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //Mam nadziejê, ¿e nie bêdê musia³ odr¹baæ ci g³owy, ¿eby udowodniæ, ¿e potrafiê pos³ugiwaæ siê broni¹.
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Pomiêdzy odwag¹ a g³upot¹ jest tylko cienka linia...
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------


func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Z Y'Berionem.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion nie traci czasu na rozmowy z ludŸmi twojego pokroju.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Z twoich k³amstw wnoszê, ¿e masz mnie za idiotê!
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Przykro mi, ¿e masz mnie za takiego g³upca.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Nie lubiê, kiedy ktoœ sprawia mi przykroœæ.
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
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_02"); //Dann sieht die Sache natürlich ANDERS AUS (zornig am ENDE)

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
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Z kilkoma ³obuzami z Nowego Obozu.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //I?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //To ju¿ wszyscy, z tych wa¿niejszych.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //NieŸle - jak na ¿ó³todzioba.
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Dostaniesz swoj¹ szansê.
		Info_ClearChoices	(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //I co? Mam byæ pod wra¿eniem?! Znam Kopaczy, którzy maj¹ lepsze kontakty od ciebie!
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
	description	= "To znaczy, ¿e jestem jednym z was!";
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
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //To znaczy, ¿e jestem jednym z was?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //W³aœnie tak. Witaj w dru¿ynie, ch³opcze.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Kruk wprowadzi ciê w szczegó³y.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry			(CH1_JoinOC,"Od dziœ pracujê dla Gomeza w Starym Obozie. Kruk ma mi udzieliæ wszystkich potrzebnych informacji!");
	Log_SetTopicStatus	(CH1_JoinOC,	LOG_SUCCESS);

	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,"Nie mogê zostaæ przyjêty do gangu Laresa, gdy¿ jestem jednym z ludzi Gomeza!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,"Stary Obóz bêdzie od dziœ moim domem. Bractwo Œni¹cego bêdzie musia³o obejœæ siê jakoœ beze mnie.");
	
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
	description	= "Pomyœla³em, ¿e zdam ci raport...";
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
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Pomyœla³em, ¿e zdam ci raport...
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //IdŸ porozmawiaæ z Krukiem. I nigdy wiêcej nie odzywaj siê do mnie bez pozwolenia!
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
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Jak siê tu dosta³eœ?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Czekaj no? Czy to nie ty walczy³eœ z naszymi ludŸmi w Wolnej Kopalni?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Twoi ludzie nie mieli prawa jej atakowaæ. Musia³em zapobiec twoim szalonym zapêdom.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Rozmowa ze mn¹ takim tonem wymaga pewnej odwagi. Ale zjawianie siê tutaj tak po prostu to ju¿ zwyk³a g³upota.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Osobiœcie dopilnujê, ¿ebyœ ju¿ nigdy nie wszed³ mi w drogê.
	
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	( self, GIL_EBR );	
};
