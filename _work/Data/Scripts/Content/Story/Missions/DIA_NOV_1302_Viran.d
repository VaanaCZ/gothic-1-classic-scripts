// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "Cosa state facendo?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Cosa state facendo?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Raccogliamo l'erba di palude che dovrà essere trattata dai nostri fratelli in modo da poter essere fumata.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Raccoglierla nella palude è molto rischioso, ma è solo qui che cresce. A dire il vero, questo è un bene.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Perché?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Così gli altri due campi non possono raccoglierla. Noi siamo gli unici produttori di erba di palude in tutta la colonia
	AI_Output (self, other,"DIA_Viran_What_07_05"); //La scambiamo con gli altri campi e facciamo NOI il prezzo.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Mi manda Baal Orun. Devo portare l'intero raccolto a Kalom.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Mi manda Baal Orun. Devo portare l'intero raccolto a Kalom.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //Pensi davvero sia così semplice?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Chiunque può arrivare qui, dire 'Mi manda Baal Orun' e WHOOSH! L'intero raccolto è perso per sempre.
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Vai a chiederglielo, se non mi credi!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Ma io sono stato mandato davvero da Baal Orun!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Ma io sono stato mandato davvero da Baal Orun!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Certo, come no.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Vai a chiederglielo, se non mi credi!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Ho un'idea migliore. Dimostrerai la tua lealtà, compiendo una piccola missione per noi!
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "Che cosa vuoi che faccia?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //Che cosa vuoi che faccia?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //Niente di speciale: lavora nella palude! È un po' rischioso, per non parlare delle maledette mosche vampiro.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Il lavoro sarebbe molto più semplice senza di loro! Mi segui?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran mi consegnerà l'erba di palude, a patto che distrugga tutte le mosche vampiro nel raggio di 20 passi.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "Non vedo altre mosche vampiro.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Non vedo altre mosche vampiro.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Ma ce ne sono altre nel raggio di venti passi!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Non te ne libererai tanto facilmente!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //Nessun insetto: hai fatto un ottimo lavoro!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Uno che lavora come te o è dalla nostra parte o è un completo idiota!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //E un idiota sarebbe troppo stupido per imbrogliarmi, giusto?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Ecco, prendi il raccolto e portalo a Cor Kalom.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Se si lamenta della quantità, digli di muovere il culo e venire a farsi un'idea di quanto sia difficile lavorare qui!
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi ha consegnato la seconda metà del raccolto odierno d'erba di palude. Vediamo se Cor Kalom è soddisfatto, stavolta.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi ha consegnato il raccolto odierno d'erba di palude. Non è molta. Forse esiste un secondo gruppo di mietitori.");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "Come va il raccolto?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Come va il raccolto?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Certo, certo! Prendimi pure in giro! Lo so che il tuo lavoro presso i guru è migliore.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Beh... Almeno non devo fare il lavoro sporco. A quello ci pensa la 'fanteria'! He he he.
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "Devo portare di nuovo il raccolto a Cor Kalom.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Devo portare di nuovo il raccolto a Cor Kalom.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Ancora?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Non vorrai che prima uccida tutti gli squali di palude, vero? Non ho proprio tempo.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //D'accordo, d'accordo! Ecco, prendi questa maledetta erba!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








