// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Sono nuovo di qui. Tu chi sei?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Sono nuovo di qui. Come ti chiami?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Io sono Baal Taran, della Fratellanza del Dormiente.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Cos'è la Fratellanza del Dormiente?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Cos'è la Fratellanza del Dormiente?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Siamo una comunità di credenti in una nuova fede.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Il nostro campo si trova a est, nella palude. Sono venuto a portare la parola del Dormiente agli stranieri come te.
};

// **************************************************
//					Wer ist der Schläfer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Chi è il Dormiente?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Chi è il Dormiente?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Il nostro redentore, che si è rivelato cinque anni fa al nostro capo Y'Berion.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Da allora, abbiamo rinnegato le tre divinità e tu dovresti fare lo stesso.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Gli dei sono rimasti a guardare, mentre venivamo esiliati in questa prigione, invece il Dormiente ci condurrà alla libertà.
};

// **************************************************
//					Lehre des Schläfers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Parlami degli insegnamenti del Dormiente.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Parlami degli insegnamenti del Dormiente.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Il Dormiente è un essere potente, forse ancor più di Innos, il dio della luce.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Il suo spirito è sempre con noi, ma il suo potere è ancora limitato. Ha dormito per mille anni, ma finalmente il momento del risveglio è vicino.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Ci ha scelti per testimoniare il suo risveglio e divulgare il suo verbo.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Ascolta: tutti coloro che crederanno nel Dormiente avranno la vita eterna, mentre i suoi nemici saranno puniti.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Ma il Dormiente è misericordioso e fornisce prove della propria esistenza a tutti coloro che non credono in lui.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "Come è fatta la via per la libertà?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Come è fatta la via per la libertà?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Stiamo preparando una grande evocazione, durante la quale tutti i novizi stabiliranno un contatto col Dormiente.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //Durante la cerimonia, il Dormiente ci rivelerà la via per la libertà.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "Come fa il vostro dio a dimostrare la propria grandezza?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Come fa il vostro dio a dimostrare la propria grandezza?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Ci parla durante le visioni. Chiunque ne ascolti la voce, non ha più dubbi riguardo la sua grandezza.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Usa l'erba che cresce nella palude per avvicinarti al Dormiente e ascoltarne la voce. Alcuni vedono anche delle immagini.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Capisco.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Come faccio a raggiungere il campo della Fratellanza?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Come faccio a raggiungere il campo della Fratellanza?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Io ho da fare, ma Baal Parvez dovrebbe trovarsi da queste parti.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //È vicino alla piazza del mercato, dall'altra parte del castello. Credo che abbia una sua capanna.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Un novizio di nome Baal Parvez può condurmi alla Fratellanza di Campo Palude. Lo troverò alla piazza del mercato, dietro il castello di Campo Vecchio.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Devo entrare nel castello. Puoi aiutarmi?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Devo entrare nel castello. Puoi aiutarmi?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Temo di no, fratello. Gli unici tra noi che possono sono coloro che consegnano l'erba a Gomez.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Raccogliamo l'erba di palude e ne vendiamo una parte a Campo Vecchio, in cambio di merci provenienti dal mondo esterno.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Se fossi uno dei corrieri di Cor Kalom, potresti entrare nel castello. Però dovresti essere uno di noi.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //E poi cosa vorresti fare nel castello?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Devo incontrare una persona.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Ho una lettera per il Gran Mago del Circolo di Fuoco.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Devo incontrare una persona.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Tu? E chi? E perché non puoi semplicemente aspettare che esca?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Non sono affari tuoi.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"È un mago.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Ho una lettera per il Gran Mago del Circolo di Fuoco.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Oh? E dove l'hai presa? Te l'hanno data i maghi prima di gettarti quaggiù, vero?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Sei uno stupido a parlarne in giro. Non preoccuparti: non lo dirò a nessuno.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Segui il mio consiglio: non parlarne più con nessuno. La gente di qui è capace di tagliarti la gola pur di entrarne in possesso.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //La ricompensa che otterrai per aver consegnato una missiva del mondo esterno fa gola a molti.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //È un mago.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Oh! Beh, loro non lasciano mai il castello. Devi per forza entrare.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Ma cosa vuoi da loro? Rune magiche? Pozioni?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Non sono affari tuoi.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Esattamente.",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Non sono affari tuoi.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //D'accordo, amico. Volevo solo aiutarti...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Esatto.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Lo sapevo! Uno come te cos'altro poteva volere dai maghi!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Ti do un consiglio: scordati i maghi. Vogliono troppo metallo per la loro roba.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Le rune magiche e le pozioni costano molto meno nel nostro campo.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
