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
	description	= "Pøišel jsem nabídnout své služby.";
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
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Pøišel jsem nabídnout své služby.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //Tak ty jsi sem pøišel a myslíš si, že se o tebe budu zajímat, ty èerve? STRÁŽE!
	
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
	description	= "Pøišel jsem nabídnout své služby.";
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
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //Pøišel jsem nabídnout své služby.
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //Proè si myslíš, že bysme mìli mít o tvoje služby zájem?
	
	Info_ClearChoices	(DIA_Gomez_Hello);																			
	Info_AddChoice		(DIA_Gomez_Hello,"Doufám, že ti nebudu muset useknout hlavu, abych ti ukázal, že se umím...",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Tady jsou jenom hòupové.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"Chodil jsem po všech táborech a ve všech mám známé.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice		(DIA_Gomez_Hello,"Složil jsem zkoušku poctivosti.",DIA_Gomez_Hello_ThorusSays);
	
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Složil jsem zkoušku poctivosti a Thorus øíkal, že právem.
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Kdyby to tak opravdu nebylo, nebyl by ses sem dostal živý. Doufám ale, že to nebylo všechno, co umíš.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //Chodil jsem po všech táborech a ve všech mám známé.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //Tak to by bylo užiteèné. S kým jsi ve spojení?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"To byly ty dùležité.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Pár pøechovávaèù v Novém táboøe.",DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice		(DIA_Gomez_Hello,"Lares.",DIA_Gomez_Hello_Kontakte_Lares);
	//Info_AddChoice		(DIA_Gomez_Hello,"Zu Lee."	,DIA_Gomez_Hello_Kontakte_Lee);
	Info_AddChoice		(DIA_Gomez_Hello,"Pár Baalù v táboøe Bratrstva.",DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice		(DIA_Gomez_Hello,"Cor Kalom.",DIA_Gomez_Hello_Kontakte_Kalom);
	
	if (gomez_kontakte < 3)
	{
	Info_AddChoice		(DIA_Gomez_Hello,"Y'Berion.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Jsou tu jenom hòupové, kteøí všechnu práci jenom pøehazují na nováèky, místo aby ji dìlali sami.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //To je, až na pár výjimek, pravda. Není to ale vùbec dùvod najímat další hòupy.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //Doufám, že ti nebudu muset useknout hlavu, abych ti ukázal, že se umím ohánìt se zbraní.
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Mezi hrdinstvím a pitomostí je jen velmi malý rozdíl.
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------


func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Y'Berion.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion neztrácí èas s chlapíky jako jsi ty.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Lžeš mi, jako bych byl nìjaký idiot.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Mrzí mì, když vidím, že mì máš za HLUPÁKA.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Nerad se cítím zklamaný.
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //Cor Kalom.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //No a?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //Pár Baalù v táboøe Bratrstva.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //No a?
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
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //Lares.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //No a?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Nìkolik pøekupníkù v Novém táboøe.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //No a?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //To byly ty dùležité.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //To není špatné - na zaèáteèníka.
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Mìl bys dostat šanci.
		Info_ClearChoices	(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //Myslíš si, že mì TOHLE dojme? To máme KOPÁÈE s lepšími kontakty!
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
	description	= "Znamená to, že jsem pøijat?";
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
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //Znamená to, že jsem pøijat?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //Pøesnì tak. Jsi jedním z nás, hochu.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Raven tì do všeho zasvìtí.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry			(CH1_JoinOC,"Ode dneška pracuji pro Gomeze a Starý tábor. Raven mi øekne vše potøebné!");
	Log_SetTopicStatus	(CH1_JoinOC,	LOG_SUCCESS);

	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,"Od doby, co patøím ke Gomezovým lidem, nemùžu být pøijat do Laresovy tlupy.");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,"Nyní je Starý tábor mým novým domovem. Bratrstvo Spáèe si bude muset poradit beze mì.");
	
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
	description	= "Chci ti podat hlášení.";
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
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Chci ti podat hlášení.
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //Tak jdi a navštiv Ravena. A nikdy už na mì nemluv, dokud tì nevybídnu!
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
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Jak ses sem dostal?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Stùj! Nejsi ty ten, co bojoval s našimi muži v Svobodném dole?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Tví muži nemìli právo je napadnout! Jen jsem ztrestal jejich megalomanský útok!
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Máš odvahu, takhle se mnou - GOMEZEM - mluvit. Ale bylo od tebe dost hloupé, takhle sem vpadnout.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Osobnì dohlédnu, abys mi už nikdy nezkøížil cestu.
	
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	( self, GIL_EBR );	
};
