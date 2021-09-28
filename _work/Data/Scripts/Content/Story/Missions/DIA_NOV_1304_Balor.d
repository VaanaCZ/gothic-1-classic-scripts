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
	description	= "Przysy�a mnie Baal Orun. Mam dostarczy� do obozu zebrane przez was ziele.";
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
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Przysy�a mnie Baal Orun. Mam dostarczy� do obozu zebrane przez was ziele.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //�wietnie. Nie b�d� musia� sam tego d�wiga�.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Nie zapomnij zajrze� do Virana, po drugiej stronie bagna, je�li jeszcze ci� tam nie by�o.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //W przeciwnym razie dostawa b�dzie zbyt ma�a i kto� m�g�by pomy�le�, �e sprzeda�e� cz�� towaru komu� innemu, he he.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor da� mi dzisiejszy zbi�r ziela dla Cor Kaloma.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Wed�ug Balora, po przeciwnej stronie bagna znajduje si� druga grupa zbieraczy ziela. Jako, �e nie dane mi by�o zapyta� o nic Baal Oruna, musz� ich odnale��, czy mi si� to podoba czy nie."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verh�kern?
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
	description	= "Komu niby mia�bym sprzeda� to ziele?";
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
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Komu niby mia�bym sprzeda� to ziele?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //Oho! Podsun��em ci niez�y pomys�, co?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Gdyby� kogo� zna�, mogliby�my podzieli� si� po po�owie.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Nie, powiedz mi - komu?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Niewa�ne, tak tylko pomy�la�em.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Gdyby� kogo� zna�, mogliby�my podzieli� si� po po�owie.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //C�, znam pewnego cz�owieka w Nowym Obozie. Pewnie zainteresowa�oby go nasze ziele...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ale gdyby Guru z�apali ci� na gor�cym uczynku, rzuciliby ci� na po�arcie w�om! Ja o niczym nie wiem, jasne?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Nie, powiedz mi - komu?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Widz�, �e co� knujesz. Pos�uchaj: je�li ten towar nie dotrze do Cor Kaloma, obydwaj wpadniemy w nie lada k�opoty!
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
	description	= "Dobra. Kto b�dzie odbiorc� w Nowym Obozie?";
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
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Dobra. Kto b�dzie odbiorc� w Nowym Obozie?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //My�lisz, �e podam ci imi�, a ty ulotnisz si� z ca�ym towarem? Tak �atwo ci nie p�jdzie!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Chc� 50 bry�ek rudy zaliczki. Wtedy pogadamy.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Zapomnij o tym.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50 bry�ek to uczciwa cena. Prosz� bardzo.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50 bry�ek to uczciwa cena. Prosz� bardzo.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Dobra, s�uchaj. Facet nazywa si� Cipher. Znajdziesz go pewnie w karczmie na jeziorze,
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //B�d� ostro�ny i nie daj si� zrobi� w konia.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor wspomnia� co� o m�czy�nie imieniem Cypher, kt�ry m�g�by kupi� ode mnie troch� ziela. Znajd� go w karczmie na jeziorze, w Nowym Obozie. W ten spos�b powa�nie nara�� si� wszystkim Guru. Co robi�?");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher handluje przer�nymi dobrami w barze na jeziorze. Interesuj� go zw�aszcza du�e dostawy bagiennego ziela.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Nie widz� tu �adnych 50 bry�ek. Chc� 50 i ani sztuki mniej, jasne?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Zapomnij o tym.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Tylko nie wyobra�aj sobie, �e mo�esz tak po prostu p�j�� do Nowego Obozu i sprzeda� towar byle komu! Je�li nie trafisz na w�a�ciwego cz�owieka, nigdy si� go nie pozb�dziesz.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //No chyba, �e jaki� Szkodnik ci go zabierze.
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
	description	= "To ja, wr�ci�em. Przychodz� po nast�pn� dostaw�.";
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
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //To ja, wr�ci�em. Przychodz� po nast�pn� dostaw�.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Jasne! �eby sprzeda� j� znowu w Nowym Obozie!
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Najpierw moje 50 bry�ek zaliczki!
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Znowu ty? No dobra, bierz. Tylko nie pr�buj wywin�� jakiego� numeru, jasne?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //Gdzie�bym �mia�!
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
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //A my�lisz, �e co ja robi�? Grzebi� sobie w jajach?
};
