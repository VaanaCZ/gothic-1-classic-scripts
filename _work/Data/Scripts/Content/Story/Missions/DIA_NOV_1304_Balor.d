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
	description	= "Przysy³a mnie Baal Orun. Mam dostarczyæ do obozu zebrane przez was ziele.";
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
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Przysy³a mnie Baal Orun. Mam dostarczyæ do obozu zebrane przez was ziele.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Œwietnie. Nie bêdê musia³ sam tego dŸwigaæ.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Nie zapomnij zajrzeæ do Virana, po drugiej stronie bagna, jeœli jeszcze ciê tam nie by³o.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //W przeciwnym razie dostawa bêdzie zbyt ma³a i ktoœ móg³by pomyœleæ, ¿e sprzeda³eœ czêœæ towaru komuœ innemu, he he.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor da³ mi dzisiejszy zbiór ziela dla Cor Kaloma.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Wed³ug Balora, po przeciwnej stronie bagna znajduje siê druga grupa zbieraczy ziela. Jako, ¿e nie dane mi by³o zapytaæ o nic Baal Oruna, muszê ich odnaleŸæ, czy mi siê to podoba czy nie."); 
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
	description	= "Komu niby mia³bym sprzedaæ to ziele?";
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
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Komu niby mia³bym sprzedaæ to ziele?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //Oho! Podsun¹³em ci niez³y pomys³, co?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Gdybyœ kogoœ zna³, moglibyœmy podzieliæ siê po po³owie.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Nie, powiedz mi - komu?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Niewa¿ne, tak tylko pomyœla³em.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Gdybyœ kogoœ zna³, moglibyœmy podzieliæ siê po po³owie.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Có¿, znam pewnego cz³owieka w Nowym Obozie. Pewnie zainteresowa³oby go nasze ziele...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ale gdyby Guru z³apali ciê na gor¹cym uczynku, rzuciliby ciê na po¿arcie wê¿om! Ja o niczym nie wiem, jasne?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Nie, powiedz mi - komu?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Widzê, ¿e coœ knujesz. Pos³uchaj: jeœli ten towar nie dotrze do Cor Kaloma, obydwaj wpadniemy w nie lada k³opoty!
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
	description	= "Dobra. Kto bêdzie odbiorc¹ w Nowym Obozie?";
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
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Dobra. Kto bêdzie odbiorc¹ w Nowym Obozie?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Myœlisz, ¿e podam ci imiê, a ty ulotnisz siê z ca³ym towarem? Tak ³atwo ci nie pójdzie!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Chcê 50 bry³ek rudy zaliczki. Wtedy pogadamy.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Zapomnij o tym.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50 bry³ek to uczciwa cena. Proszê bardzo.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50 bry³ek to uczciwa cena. Proszê bardzo.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Dobra, s³uchaj. Facet nazywa siê Cipher. Znajdziesz go pewnie w karczmie na jeziorze,
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //B¹dŸ ostro¿ny i nie daj siê zrobiæ w konia.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor wspomnia³ coœ o mê¿czyŸnie imieniem Cypher, który móg³by kupiæ ode mnie trochê ziela. Znajdê go w karczmie na jeziorze, w Nowym Obozie. W ten sposób powa¿nie nara¿ê siê wszystkim Guru. Co robiæ?");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher handluje przeró¿nymi dobrami w barze na jeziorze. Interesuj¹ go zw³aszcza du¿e dostawy bagiennego ziela.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Nie widzê tu ¿adnych 50 bry³ek. Chcê 50 i ani sztuki mniej, jasne?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Zapomnij o tym.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Tylko nie wyobra¿aj sobie, ¿e mo¿esz tak po prostu pójœæ do Nowego Obozu i sprzedaæ towar byle komu! Jeœli nie trafisz na w³aœciwego cz³owieka, nigdy siê go nie pozbêdziesz.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //No chyba, ¿e jakiœ Szkodnik ci go zabierze.
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
	description	= "To ja, wróci³em. Przychodzê po nastêpn¹ dostawê.";
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
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //To ja, wróci³em. Przychodzê po nastêpn¹ dostawê.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Jasne! ¯eby sprzedaæ j¹ znowu w Nowym Obozie!
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Najpierw moje 50 bry³ek zaliczki!
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Znowu ty? No dobra, bierz. Tylko nie próbuj wywin¹æ jakiegoœ numeru, jasne?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //Gdzie¿bym œmia³!
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
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //A myœlisz, ¿e co ja robiê? Grzebiê sobie w jajach?
};
