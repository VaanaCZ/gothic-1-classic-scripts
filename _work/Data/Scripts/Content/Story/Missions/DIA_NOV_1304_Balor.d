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
	description	= "Przysyła mnie Baal Orun. Mam dostarczyć do obozu zebrane przez was ziele.";
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
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Przysyła mnie Baal Orun. Mam dostarczyć do obozu zebrane przez was ziele.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Świetnie. Nie będę musiał sam tego dźwigać.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Nie zapomnij zajrzeć do Virana, po drugiej stronie bagna, jeśli jeszcze cię tam nie było.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //W przeciwnym razie dostawa będzie zbyt mała i ktoś mógłby pomyśleć, że sprzedałeś część towaru komuś innemu, he he.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor dał mi dzisiejszy zbiór ziela dla Cor Kaloma.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Według Balora, po przeciwnej stronie bagna znajduje się druga grupa zbieraczy ziela. Jako, że nie dane mi było zapytać o nic Baal Oruna, muszę ich odnaleźć, czy mi się to podoba czy nie."); 
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
	description	= "Komu niby miałbym sprzedać to ziele?";
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
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Komu niby miałbym sprzedać to ziele?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //Oho! Podsunąłem ci niezły pomysł, co?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Gdybyś kogoś znał, moglibyśmy podzielić się po połowie.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Nie, powiedz mi - komu?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Nieważne, tak tylko pomyślałem.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Gdybyś kogoś znał, moglibyśmy podzielić się po połowie.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Cóż, znam pewnego człowieka w Nowym Obozie. Pewnie zainteresowałoby go nasze ziele...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ale gdyby Guru złapali cię na gorącym uczynku, rzuciliby cię na pożarcie wężom! Ja o niczym nie wiem, jasne?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Nie, powiedz mi - komu?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Widzę, że coś knujesz. Posłuchaj: jeśli ten towar nie dotrze do Cor Kaloma, obydwaj wpadniemy w nie lada kłopoty!
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
	description	= "Dobra. Kto będzie odbiorcą w Nowym Obozie?";
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
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Dobra. Kto będzie odbiorcą w Nowym Obozie?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Myślisz, że podam ci imię, a ty ulotnisz się z całym towarem? Tak łatwo ci nie pójdzie!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Chcę 50 bryłek rudy zaliczki. Wtedy pogadamy.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Zapomnij o tym.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50 bryłek to uczciwa cena. Proszę bardzo.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50 bryłek to uczciwa cena. Proszę bardzo.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Dobra, słuchaj. Facet nazywa się Cipher. Znajdziesz go pewnie w karczmie na jeziorze,
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Bądź ostrożny i nie daj się zrobić w konia.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor wspomniał coś o mężczyźnie imieniem Cypher, który mógłby kupić ode mnie trochę ziela. Znajdę go w karczmie na jeziorze, w Nowym Obozie. W ten sposób poważnie narażę się wszystkim Guru. Co robić?");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher handluje przeróżnymi dobrami w barze na jeziorze. Interesują go zwłaszcza duże dostawy bagiennego ziela.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Nie widzę tu żadnych 50 bryłek. Chcę 50 i ani sztuki mniej, jasne?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Zapomnij o tym.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Tylko nie wyobrażaj sobie, że możesz tak po prostu pójść do Nowego Obozu i sprzedać towar byle komu! Jeśli nie trafisz na właściwego człowieka, nigdy się go nie pozbędziesz.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //No chyba, że jakiś Szkodnik ci go zabierze.
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
	description	= "To ja, wróciłem. Przychodzę po następną dostawę.";
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
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //To ja, wróciłem. Przychodzę po następną dostawę.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Jasne! Żeby sprzedać ją znowu w Nowym Obozie!
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Najpierw moje 50 bryłek zaliczki!
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Znowu ty? No dobra, bierz. Tylko nie próbuj wywinąć jakiegoś numeru, jasne?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //Gdzieżbym śmiał!
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
	description	= "Nie przeszkadzaj sobie w pracy!";
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
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Nie przeszkadzaj sobie w pracy!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //A myślisz, że co ja robię? Grzebię sobie w jajach?
};
