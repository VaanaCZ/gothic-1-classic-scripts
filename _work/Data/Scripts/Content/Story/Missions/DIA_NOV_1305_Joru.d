// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "Cosa stai facendo?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Che cosa stai facendo?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Insegno la parola del Dormiente ai novizi.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Anch'io sono ancora un novizio, ma presto sar� un Baal. Uno dei guru!
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Ho persino parlato con Y'Berion, il prescelto. Mi ha assicurato che, se lavoro sodo, posso diventare anch'io un maestro.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Ma io me la prendo con calma. Non c'� alcuna fretta, capisci? Posso diventare un maestro in qualsiasi momento.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //Per ora, sono molto contento del mio lavoro attuale.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "Qual � il tuo compito?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Qual � il tuo compito?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Io e i miei amici proviamo le nuove sostanze create da Cor Kalom nel suo laboratorio alchemico.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Il suo braccio destro ci porta qualcosa di nuovo ogni giorno e noi lo proviamo.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Quest'erba ti apre lo spirito. Assumendone la giusta quantit�, puoi entrare in contatto col Dormiente.
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "Siete mai riusciti a parlare col Dormiente?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //Siete mai riusciti a parlare col Dormiente?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Non ancora, ma solo perch� non abbiamo mai abbastanza erba.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom vuole sempre che gli siano riferiti gli effetti dell�erba, ma ho l'impressione che non sia per nulla interessato alla mia opinione.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Se penso che la roba sia stimolante, lui la passa direttamente ai guru...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Ma presto anch'io sar� un guru: potr� oltrepassare i miei limiti e ascoltare la voce del Dormiente!
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "Vorrei entrare a far parte di questo campo. Puoi aiutarmi?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Vorrei entrare a far parte di questo campo. Puoi aiutarmi?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Vuoi unirti a noi? Ottimo! Aspetta... S�, credo di poterti aiutare.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Non sono ancora un guru, ma ho un certo peso all'interno della Fratellanza.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Devi farmi un favore. Hai gi� incontrato Fortuno?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"No.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"S�.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Quindi hai gi� ricevuto la razione giornaliera. Dammela e siamo pari.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Ci penser�.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Allora vai da lui e fatti dare la tua razione giornaliera. Se mi passerai tutta l'erba di palude che ti avr� consegnato, saremo pari.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Ci penser�.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Joru vorrebbe che gli regalassi la mia razione quotidiana d'erba di Fortuno.");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "Ho dell'erba di palude con me. Puoi prenderla.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Ho dell'erba di palude con me. Puoi prenderla.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Bene! Avrai notato che nessun guru ti parla.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Puoi cambiare le cose, impressionandoli favorevolmente. TI dir� io come fare.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Abbiamo pattuito tre 'Buio del Nord' e nient'altro! Portami l'erba e POI ti aiuter�!
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "Come posso fare buona impressione sui guru?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Come posso fare buona impressione sui guru?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar istruisce i novizi ai segreti della magia del Dormiente.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Se vuoi attirare la sua attenzione, usa la magia.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Ma non usare il 'Colpo di vento' su di lui! Addormenta uno dei suoi studenti, o qualcosa del genere.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib si trova all'ingresso principale ed � uno dei tipi pi� duri. Credo che Lester possa aiutarti a trattare con lui. Parlagli non appena il suo maestro si sar� allontanato.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Gli altri guru sono tipi a posto. Basta solo che ti renda utile.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Grazie per il consiglio.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Ehi! Un patto � un patto!
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"Per fare colpo su Baal Cadar, devo lanciare un incantesimo del sonno su uno dei suoi discepoli.");
		B_LogEntry	(CH1_JoinPsi,"Chieder� al novizio Lester come fare colpo su Baal Namib al cancello principale, ma devo stare attento che non ci siano guru nelle vicinanze!");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "Come posso ricevere la magia del Dormiente?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,"Baal Cadar vende RUNE e INCANTESIMI.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Come posso ricevere la magia del Dormiente?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar vende rune e incantesimi, ma se non ti parla � tutto inutile.
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Forse un altro guru pu� aiutarti.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Wei�t du, es ist ziemlich gut. Es �ffnet deinen Geist f�r die Worte des Schl�fers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit f�r eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










