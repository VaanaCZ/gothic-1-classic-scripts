// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Balor_Exit (C_INFO)
{
	npc			=  Nov_1304_Balor;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Balor_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Kraut abholen
// **************************************************
	var int Balor_BotenDay;
// **************************************************

instance  DIA_Balor_FetchWeed (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_FetchWeed_Condition;
	information	= DIA_Balor_FetchWeed_Info;
	permanent	= 0;
	description	= "Mi manda Baal Orun. Devo prendere tutta l'erba di palude.";
};                       

FUNC int  DIA_Balor_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Mi manda Baal Orun. Devo prendere tutta l'erba di palude.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Ottimo, così non dovrò portarla io. Ecco, prendila.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Non dimenticare di recarti da Varan, dall'altro lato della palude, se non l'hai già fatto.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Altrimenti il tuo carico sarà un po' piccolo e la gente potrebbe pensare che tu ne abbia venduta la metà. He he he.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor mi ha consegnato il raccolto odierno d'erba di palude, da portare a Cor Kalom.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Balor sostiene che esista un secondo gruppo di mietitori, che lavorano dall'altra parte della palude. Non posso rivolgere alcuna domanda a Baal Orun, quindi dovrò cercarli da solo, che mi piaccia o no."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verhökern?
// **************************************************
	var int Balor_PlayerCheating;
// **************************************************

instance  DIA_Balor_SellUnder (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_SellUnder_Condition;
	information	= DIA_Balor_SellUnder_Info;
	permanent	= 0;
	description	= "E a chi potrei venderla?";
};                       

FUNC int  DIA_Balor_SellUnder_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_SellUnder_Info()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //E a chi potrei venderla?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //Oh-ho! Ti ho dato un'idea, vero?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Lascia stare, era solo un dubbio.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Se conosci qualcuno... Potremmo dividerci i profitti.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"No. Dimmi chi.",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Lascia stare, era solo un dubbio.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Sei conosci qualcuno... Potremmo dividerci i profitti.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Beh, sì. A dire il vero conosco qualcuno, a Campo Nuovo, che sarebbe interessato...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ma se i guru ti scoprono, sarai cibo per squali di palude! Io non so nulla, d'accordo?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //No. Dimmi chi.
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Tu hai qualcosa in mente! Ascolta: se la roba non arriva a Cor Kalom, siamo entrambi nei guai!
};

// **************************************************
//				Name des Dealers
// **************************************************
	var int Balor_TellsNCDealer;
// **************************************************

instance  DIA_Balor_TellDealer (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_TellDealer_Condition;
	information	= DIA_Balor_TellDealer_Info;
	permanent	= 1;
	description	= "D'accordo. Chi è l'acquirente di Campo Nuovo?";
};                       

FUNC int  DIA_Balor_TellDealer_Condition()
{
	if ( (Balor_PlayerCheating==TRUE) && (Balor_TellsNCDealer==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_TellDealer_Info()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //D'accordo. Chi è l'acquirente di Campo Nuovo?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Ma cosa credi? Che ti dica il nome, così puoi correre da lui con l'erba? Scordatelo!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Voglio 50 pezzi di metallo anticipati, poi si vedrà.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Lascia stare.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Mi sembra un prezzo ragionevole. Eccoli.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //Mi sembra un prezzo ragionevole. Eccoli.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Bene... Ascolta. Il suo nome è Cipher. Probabilmente lo troverai alla taverna sul lago.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Stai attento a non farti fregare da nessuno.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor ha menzionato un uomo di nome Cipher, che è interessato all'erba di palude. Lo troverò al bar sul lago di Campo Nuovo. Mi metterò in grossi guai coi guru.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher compra e vende ogni tipo di merce, nel bar sul lago. Soprattutto, è interessato alle grosse quantità d'erba di palude.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Non vedo 50 pezzi di metallo. 50 e non uno di meno, capito?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Lascia stare.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Non penserai di entrare a Campo Nuovo e venderla al primo che capita! Se non conosci il nome, non te ne libererai mai.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Finché un ladro non ti darà un bel colpo in testa.
	Info_ClearChoices 	(DIA_Balor_TellDealer);
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Balor_RipOff (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 5;
	condition	= DIA_Balor_RipOff_Condition;
	information	= DIA_Balor_RipOff_Info;
	permanent	= 0;
	description	= "Sono tornato a prendere l'altro raccolto per Cor Kalom.";
};                       

FUNC int  DIA_Balor_RipOff_Condition()
{
	if ( (Balor_BotenDay<=(Wld_GetDay()-2)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_RipOff_Info()
{
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //Sono tornato per prendere l'altro raccolto.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Come no! Per rivenderlo ancora a Campo Nuovo!
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Voglio i miei 50 pezzi di metallo anticipati, come al solito.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Ancora tu? Va bene, ecco, prendila. Ma non fare stupidaggini, d'accordo?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //Non ci penso nemmeno.
		CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
		B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
	};
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Balor_Perm (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_Perm_Condition;
	information	= DIA_Balor_Perm_Info;
	permanent	= 1;
	description	= "Continua a darci sotto!";
};                       

FUNC int  DIA_Balor_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_Perm_Info()
{
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Continua a darci sotto!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //Che cosa pensi che faccia? Non mi sto grattando le palle!
};
