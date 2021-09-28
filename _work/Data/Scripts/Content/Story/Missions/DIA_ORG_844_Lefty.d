// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "Cosa stai facendo?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Cosa stai facendo?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Lavoro per il Signore del Riso.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //Hai del lavoro per me?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Ti parlerò più tardi.
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Ehi! Sei appena arrivato? Abbiamo bisogno che qualcuno porti l'acqua ai contadini nelle risaie.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //In questo modo potrai farti degli amici. Cosa ne pensi?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lefty, un presuntuoso ladro di Campo Nuovo, vuole che porti acqua ai contadini della risaia.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Forse più tardi.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Portagliela da solo!",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Certo, sono felice di rendermi utile.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Certo, sono felice di rendermi utile.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Ottimo! Vai dal Signore del Riso: ti darà l'acqua e ti dirà tutto ciò che devi sapere. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Anche se si tratta di un lavoro stupido, ho accettato. Forse, in questo modo potrò farmi degli amici. Devo prendere l'acqua dal cosiddetto 'Signore del Riso'.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Portagliela da solo!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //Questo non è il modo di trattare gli amici! Dovrò insegnarti le buone maniere!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Quando ho rifiutato la sua 'offerta', Lefty è rimasto molto deluso! E io pensavo che Campo Vecchio fosse un posto difficile!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Forse più tardi.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Ma più tardi non mi servirai più. Ho bisogno di te ORA. Vuoi aiutarmi o no?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //Ehi, tu!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Sei fortunato! Ti offro una seconda possibilità.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Cerca di non fare casino, stavolta! Vai dal Signore del Riso e porta l'acqua ai contadini, capito?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"Ho incontrato Lefty di nuovo! Vuole che mi rechi dal Signore del Riso e prenda l'acqua per i contadini della risaia.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Ti ho detto di portare l'acqua ai contadini!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Non mi piace la gente che non mantiene le promesse!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"Lefty è andato su tutte le furie, quando ha visto che non ho ancora distribuito l'acqua! Forse posso divertirmi un po', con questo tizio.");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Ben fatto! Dopo tutto, servi a qualcosa.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Questo è proprio il compito adatto a te. D'ora in poi, lo farai ogni giorno. Torna al lavoro, adesso.
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"Non ci credo! Dopo che ho finito di distribuire tutta l'acqua, Lefty mi ha ordinato di ripetere la stessa operazione ogni giorno, d'ora in avanti. Devo dire due paroline a quest'idiota!");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "D'ora in poi, l'acqua te la porti da solo.";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //D'ora in poi, l'acqua te la porti da solo.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Oh? Hai di meglio da fare?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Credo di doverti ricordare chi è il capo!
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "Come va, amico?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Come va, amico?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Cosa vuoi?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"Ho spiegato a Lefty che farà meglio a non disturbarmi più con le sue teorie sul trasporto dell'acqua. Con certa gente, devi usare la forza per farti capire.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Volevo solo sapere come stai.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"I contadini hanno sete.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"Ho avuto una pessima giornata. Devo allentare la tensione... Resta fermo.",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Ho avuto una pessima giornata e ho bisogno di allentare la tensione... Resta così per un minuto.
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //I contadini hanno sete.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Me ne occuperò... non preoccuparti.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Volevo solo sapere come stai.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
