// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Falle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Falle_Condition;
	information		= DIA_Grim_Falle_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grim_Falle_Condition()
{	
	if	(Grim_ProtectionBully == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Falle_Info()
{
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Ehi, tu! Non sei quello che voleva entrare far parte del campo?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //Allora?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Potrei aiutarti...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Come?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Ci sono due uomini, seduti da qualche parte fuori dal campo. Uno di loro ha derubato i baroni delle miniere. Si tratta di un prezioso amuleto, che dovrebbe essere arrivato con l'ultimo convoglio.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Uno di loro dovrebbe averlo ancora con sé. Se li attacchiamo insieme, possiamo farcela, da solo non ci riuscirei mai. Che ne dici?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Non m'interessa: dovrai cercare qualcun altro.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Cosa faremo quando avremo l'amuleto?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"Sono con te!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //Non m'interessa: dovrai cercare qualcun altro.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Non andrai molto lontano comportandoti in questo modo. Fammi sapere se cambi idea!
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //Cosa faremo quando avremo l'amuleto?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //Facile! Lo riporterò al proprietario e mi farò consegnare la ricompensa. Gli dirò che mi hai aiutato, così ti metterai in buona luce con Gomez... 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Non m'interessa: dovrai cercare qualcun altro.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"No! Dividiamo a metà, oppure te la cavi da solo.",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"Sono con te!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //No! Dividiamo a metà, oppure te la cavi da solo.
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Va bene, dividiamo. Penso che la ricompensa sarà sufficiente per entrambi. Allora: posso contarci?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //Sono con te!
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //Bene! Fammi sapere quando potremo partire!
	Info_ClearChoices	(DIA_Grim_Falle );
};

// **************************************************
// 				Bereit für Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Sono pronto: andiamo a prendere l'amuleto!";
};

FUNC INT DIA_Grim_ReadyToGo_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_ReadyToGo_Info()
{
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Sono pronto: andiamo a prendere l'amuleto!
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //D'accordo, andiamo...
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"GUIDE");
};	

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance  DIA_Grim_AtOCdraussen(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 3;
	condition	= DIA_Grim_AtOCdraussen_Condition;
	information	= DIA_Grim_AtOCdraussen_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_AtOCdraussen_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Grim_AtOCdraussen_Info()
{
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Eccoci arrivati, lontani dal tuo amico Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Ti portiamo i saluti di Bloodwyn!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Ti porto i saluti di Bloodwyn!
	};

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	
	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);
	
	if ( (Npc_GetDistToNpc(self,Bu520)<1000) && (!Npc_IsDead(Bu520)) )
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};
	
	if ( (Npc_GetDistToNpc(self,Bu534)<1000) && (!Npc_IsDead(Bu534)) )
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
};

// **************************************************
// 				NACH Falle
// **************************************************

INSTANCE DIA_Grim_NACHFalle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_NACHFalle_Condition;
	information		= DIA_Grim_NACHFalle_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grim_NACHFalle_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_NACHFalle_Info()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Così era una trappola...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Ehi, amico! Siamo nella stessa barca! Nemmeno io voglio finire in miniera.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Quindi faccio ciò che mi dicono le guardie, così mi accetteranno presto.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Il fatto che debba farti fuori è solo colpa tua. Perché ti sei messo nei guai con le guardie?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Personalmente, non mi dispiaci. Cosa dici? Preferisci la pace o continuare a combattere?
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Continua a combattere.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Pace.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Penso che combatterò!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Amico, mi deludi...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //La pace suona bene.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Sono felice che la vediamo allo stesso modo. Mettiamoci una pietra sopra. D'ora in poi, sarò dalla tua parte.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Se ti dovessi ritrovare nei guai, conta su di me. In fondo, ti devo un favore.
	Info_ClearChoices	(DIA_Grim_NACHFalle );

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver;				
// **************************************************

INSTANCE DIA_Grim_Hallo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 1;
	condition		= DIA_Grim_Hallo_Condition;
	information		= DIA_Grim_Hallo_Info;
	permanent		= 0;
	description		= "Sono nuovo di qui.";
};

FUNC INT DIA_Grim_Hallo_Condition()
{	
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};
	
	if (FirstOver == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Hallo_Info()
{
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Sono nuovo di qui.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Sei appena arrivato, vero? Io sono Grim e anch'io non sono qui da molto. Mi hanno gettato quaggiù col carico prima del tuo.
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_Leben (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Leben_Condition;
	information		= DIA_Grim_Leben_Info;
	permanent		= 0;
	description		= "Com'è la vita, da queste parti?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Com'è la vita da queste parti?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Scorre abbastanza tranquilla, se paghi la tassa di protezione alle guardie.
};

// **************************************************
// 						Aufnahme
// **************************************************

INSTANCE DIA_Grim_Aufnahme (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Aufnahme_Condition;
	information		= DIA_Grim_Aufnahme_Info;
	permanent		= 0;
	description		= "Cosa devo fare, per essere accettato da questo campo?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Cosa devo fare per essere accettato da questo campo?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Prima di tutto devi diventare un'Ombra. Per questo motivo devi trovare qualcuno che sia dalla tua parte, ti spieghi tutto e sia responsabile per te.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Se fossi in te, proverei con Diego. Anch'io ho fatto così: è un tipo a posto.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //Ti metterà alla prova col test della fiducia, che cambia di persona in persona. Poi dovrai compiere dei lavoretti per altre Ombre.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Se ce la farai, sarai uno di noi.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

INSTANCE DIA_Grim_HowFarAreYou (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_HowFarAreYou_Condition;
	information		= DIA_Grim_HowFarAreYou_Info;
	permanent		= 1;
	description		= "A che punto sei con le tue prove?";
};

FUNC INT DIA_Grim_HowFarAreYou_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_HowFarAreYou_Info()
{
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //A che punto sei con le tue prove?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Ho già parlato con Dexter, Sly e Fingers. Sono alcune fra le Ombre più influenti del campo.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Sly e Fingers sono Ombre influenti.");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_YourPDV (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 5;
	condition		= DIA_Grim_YourPDV_Condition;
	information		= DIA_Grim_YourPDV_Info;
	permanent		= 0;
	description		= "Qual era il TUO test della fiducia?";
};

FUNC INT DIA_Grim_YourPDV_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_YourPDV_Info()
{
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //Qual era il TUO test della fiducia?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Non posso dirtelo, amico. Devi tenere la bocca chiusa su certi argomenti!
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMO(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMO_Condition;
	information	= DIA_Grim_INEXTREMO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_INEXTREMO_Condition()
{
	if	((Kapitel == 2) && (InExtremoPlaying == true))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Ehi, hai sentito le novità?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //Gli 'In Extremo' sono qui, su quel palco!
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Corri, o perderai il concerto!

	Npc_ExchangeRoutine	(self,	"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMOAWAY_Condition;
	information	= DIA_Grim_INEXTREMOAWAY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Dove sono gli 'In Extremo'?";
};                       

FUNC int  DIA_Grim_INEXTREMOAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Grim_INEXTREMO)
	&&	(Kapitel == 3) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Dove sono gli 'In Extremo'?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Se ne sono andati. Che peccato, mi ero abituato ai pomeriggi sotto al palco.

	AI_StopProcessInfos	(self);
};

