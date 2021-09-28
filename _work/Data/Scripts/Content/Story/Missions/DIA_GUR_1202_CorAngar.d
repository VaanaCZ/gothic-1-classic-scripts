//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Später Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Puoi addestrarmi?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Vuoi addestrarmi?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Vuoi diventare un potente guerriero e cerchi qualcuno che t'istruisca, vero?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //Encomiabile desiderio. Ma non sono io l'uomo che cerchi.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Io mi dedico esclusivamente ai seguaci del Sacro Circolo dei Templari.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Come posso diventare un templare?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Come posso diventare un templare?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Prima devi servire un certo tempo come novizio, per dimostrare la tua fede nel Dormiente.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //A qual punto torna da me e ti addestrerò.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Puoi aumentare la mia forza e destrezza?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Puoi aumentare la mia forza e la mia destrezza?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Ogni guerriero ha bisogno di forza e destrezza.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Voglio diventare un templare!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Voglio diventare un templare!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Non sei ancora pronto. Potrai unirti a noi solo quando avrai acquisito abbastanza esperienza.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //È arrivato il momento di unirti a noi.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Ricorda che un templare non è solo un bravo guerriero e il custode del campo. Noi siamo i prescelti dal Dormiente, i guardiani dello spirito.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Noi sfruttiamo sia la forza fisica, sia quella spirituale. Solo coloro i cui corpi vibrano all'unisono con lo spirito, possono diventare templari.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Sono contento che tu sia riuscito a raggiungere tale equilibrio in così poco tempo. Ora sei pronto a unirti a noi.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Ricorda: uno spirito attento e un corpo addestrato possono affrontare qualsiasi minaccia.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Ora vai da Gor Na Toth, nel campo di addestramento. TI darà una nuova armatura.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"Oggi Cor Angar mi ha accettato fra i templari. Gor Na Toth mi darà una nuova armatura. Di solito, si trova al campo d'addestramento.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"Cor Angar insegna a migliorare FORZA e DESTREZZA e a combattere con le ARMI A DUE MANI. Potrò apprendere quest'ultima tecnica, solo quando sarò diventato esperto nei combattimenti con le ARMI A UNA MANO. Di solito, Cor Angar si trova al campo d'addestramento dei templari, al secondo livello delle passerelle.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Voglio imparare a usare una spada a due mani.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Combattere con una spada a due mani richiede un certo livello di forza e destrezza.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Per impugnare un'arma a due mani, non solo devi essere padrone del tuo corpo, ma anche della tua mente.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Solo se saprai controllare entrambi, sarai in grado d'imparare.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //La chiave è la concentrazione. Corpo e mente uniti nella concentrazione.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Voglio imparare di più riguardo le armi a due mani.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Ora che sei in grado di far danzare la tua lama, ti mostrerò come diventare un guerriero esperto.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Usa la forza spirituale per anticipare i movimenti e gli attacchi del nemico.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Conoscere la strategia di combattimento del nemico significa avere la vittoria quasi in pugno.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Sii veloce: i tuoi movimenti devono essere improvvisi e fluidi, i colpi precisi e pesanti.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Impara a ignorare il dolore. Il combattente dalla volontà più salda sarà quello che uscirà vincitore dallo scontro.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Resta calmo. Solo se inizierai il combattimento con calma e concentrazione potrai sopravvivere.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Usa le tue abilità con cautela e ricorda: causa un combattimento e perirai in esso.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der großen Beschwörung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ora cosa succede?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Ora cosa succede?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //La visione era molto vaga, ci ha portato più enigmi che risposte.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ma una cosa era perfettamente chiara: ho visto un orco in una caverna. C'è un vecchio luogo sacro degli orchi, qui vicino.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Essi erano soliti seppellirvi i propri defunti, per questo chiamiamo quel sistema di caverne il 'cimitero degli orchi'.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Il guru Baal Lukor è andato lì con alcuni templari. Forse troveremo qualcosa che ci aiuti a capire la visione.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Ho bisogno che qualcuno vada a perlustrare la zona e mi descriva la situazione.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Perché non ci vai da solo? Sei il capo dei templari!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Il mio compito è proteggere l'Illuminato. Devo restare qui con Y'Berion e fare la guardia.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Hai reso un ottimo servizio al campo. Sei il mio uomo più fidato.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Ti chiedo di recarti al cimitero degli orchi e riferirmi cosa hanno trovato i templari.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Cosa avrò in cambio?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Mi metto subito in cammino!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //Cosa avrò in cambio?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Vuoi del metallo? Forse ti avevo giudicato male, dopo tutto. Ma ho bisogno di te. Ecco: prendi questi 100 pezzi di metallo, non uno di più!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Mi metto subito in cammino!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Prima prendi questo anello. Ti proteggerà in battaglia!
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dove si trova il cimitero degli orchi?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Dove si trova il cimitero degli orchi?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Non lontano da qui. Talas il novizio conosce la strada. Lo troverai nel cortile del tempio, ti guiderà.

	B_LogEntry		(CH3_OrcGraveyard,"Talas il novizio mi indicherà la via per raggiungere il cimitero degli orchi. Mi sta aspettando al piazzale davanti al tempio.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sono stato al cimitero degli orchi."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Sono stato al cimitero degli orchi e non ho trovato NULLA: niente Dormiente, niente segno, niente di niente.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //E Baal Lukor e i templari?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Tutti morti.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Morti? Ma cosa è successo?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //L'intero sistema di caverne brulica di orchi. Hanno ucciso loro tutti i templari.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Solo io e Baal Lukor siamo sopravvissuti, ma improvvisamente lui è impazzito.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Ha urlato che il Dormiente gli aveva ordinato di uccidermi e intendeva obbedire al suo comando.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Non ha sopportato il fatto di non aver trovato nulla.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Non credo che l'influenza del Dormiente possa scatenare simili azioni violente.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //Non può... non può... è IRRILEVANTE!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //La cosa importante è che Baal Lukor non ha avuto successo nella sua follia.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Ora è Y'Berion la nostra sola speranza.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Cosa sta facendo Y'Berion?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Cosa sta facendo Y'Berion?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Non si sveglierà da solo ed è sempre più debole. So come destarlo, ma ho bisogno del tuo aiuto.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Cosa vuoi che faccia?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Portami le erbe curative della palude. Saranno sufficienti cinque piante fra le più forti.
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Sbrigati!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"Y'Berion non ha ancora ripreso conoscenza. Cor Angar mi ha chiesto di recuperare cinque erbe curative molto potenti.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "Dove le trovo queste piante?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Dove le trovo queste piante?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Cercale nella palude dietro il campo. Devi addentrarti molto, ma stai attento agli squali di palude!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //E non perdere tempo. Vai!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Le erbe curative necessarie a Y'Berion crescono nella palude dietro il campo della Fratellanza. Purtroppo, quel luogo è infestato dagli squali di palude. Farò meglio a tenere gli occhi aperti.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Come riconoscerò le erbe?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Come riconoscerò le erbe?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Sembrano stelle, con otto foglie verdi e arancio.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ora vai.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Le erbe curative hanno l'aspetto di una stella, con quattro petali verdi e altrettanti color arancio.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Non ho ancora trovato erbe curative a sufficienza.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Non ho ancora trovato erbe curative a sufficienza.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Forse Fortuno, il commerciante di erbe, ne ha alcune in magazzino.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Sbrigati. Me ne servono cinque. A Y'Berion non resta molto tempo.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"Fortuno, il commerciante d'erbe della Fratellanza, potrebbe avere ciò che cerco.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Ho le erbe curative per Y'Berion.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Ho le erbe curative per Y'Berion.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Ben fatto. Mentre eri via, si è risvegliato per un istante.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Ha detto qualcosa?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Sì, che il Dormiente non è colui che pensiamo. Non dobbiamo più provare a svegliarlo.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Ora dobbiamo solo sperare che non sia troppo tardi per Y'Berion.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"Ho consegnato a Cor Angar le erbe curative. Ora possiamo solo sperare che non sia troppo tardi.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION È MORTO. Il nostro capo spirituale ci ha lasciati!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Anche se sei stato rapido, non hai potuto impedire che morisse.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //E adesso, Cor Angar?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Ho sempre avuto fiducia in Y'Berion, Poco prima che morisse, ha riposto la propria fiducia nel piano di fuga dei Maghi dell'Acqua.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Allora dovremmo aiutarli.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Hanno bisogno dell'almanacco e della pietra focalizzatrice. Entrambe sono ancora in possesso di Cor Kalom.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Dove si trova Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //In un attacco d'ira, ha preso una coppia di templari e si è incamminato per cercare il Dormiente.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Maledizione, come facciamo a riprendere la pietra?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Credo che l'abbia lasciata nel suo laboratorio, assieme all'almanacco. Ecco la chiave dello scrigno.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Un momento!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Sì?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Prendi questa runa magica, come segno di gratitudine.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Essa ti permetterà di teletrasportarti al cortile del tempio, rapidamente e con facilità.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Grazie!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
