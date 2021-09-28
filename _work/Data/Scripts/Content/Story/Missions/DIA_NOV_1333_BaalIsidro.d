// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalIsidro_EXIT(C_INFO)
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 999;
	condition	= DIA_BaalIsidro_EXIT_Condition;
	information	= DIA_BaalIsidro_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalIsidro_Hello(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Hello_Condition;
	information	= DIA_BaalIsidro_Hello_Info;
	permanent	= 0;
	description = "Nie wygl�dasz mi na zbyt zadowolonego.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Nie wygl�dasz mi na zbyt zadowolonego.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Bo nie jestem!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Musz� si� pozby� du�ego �adunku ziela.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //Sprzedajesz towary z obozu Bractwa?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Tak, ale nie idzie mi najlepiej.
};

// ************************************************************
// 					 	TRADE
// ************************************************************

INSTANCE DIA_BaalIsidro_TRADE(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 800;
	condition	= DIA_BaalIsidro_TRADE_Condition;
	information	= DIA_BaalIsidro_TRADE_Info;
	permanent	= 1;
	description = "Poka� mi co tam masz...";
	trade 		= 1;
};                       

FUNC INT DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_TRADE_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Poka� mi co tam masz...
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Prosz�...
};

// ************************************************************
// 					 Ich verkaufe f�r dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "M�g�bym pom�c ci sprzeda� to ziele. Oczywi�cie za drobn� prowizj�.";
};                       

FUNC INT DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //M�g�bym pom�c ci sprzeda� to ziele. Oczywi�cie za drobn� prowizj�.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Zapomnij o tym. Nie jestem a� tak pijany. Da�by� nog� z ca�ym towarem.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Nowicjusz Baal Isidro kr�ci si� w pobli�u karczmy na jeziorze, nie trze�wiej�c ca�ymi dniami. Nie radzi sobie najlepiej ze sprzeda�� swojej porcji ziela. Mo�e uda mi si� przekona� go, �eby zda� si� na mnie. Tylko jak to zrobi�?"); 
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

INSTANCE DIA_BaalIsidro_Problem(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Problem_Condition;
	information	= DIA_BaalIsidro_Problem_Info;
	permanent	= 0;
	description = "Masz przechlapane. Baal Kagan znajdzie kogo� innego na twoje miejsce.";
};                       

FUNC INT DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Problem_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Wiesz co? Masz nie�le przechlapane. Baal Kagan znajdzie sobie kogo� innego na twoje miejsce.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Co? Na pot�g� �ni�cego! Musz� si� koniecznie pozby� tego towaru!
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro by� zdenerwowany, gdy dowiedzia� si� o planach zast�pienia go kim� innym. Mimo to nie zgodzi� si� odda� mi ziela.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Plany Baal Kagana, by zast�pi� moczymord� kim� innym, ostatecznie go dobi�y. Chyba wreszcie przyjmie moj� ofert�!");
	};	
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
	var int BaalIsidro_GotDrink;
// ************************************************************

INSTANCE DIA_BaalIsidro_Drink(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Drink_Condition;
	information	= DIA_BaalIsidro_Drink_Info;
	permanent	= 1;
	description = "Prosz�, �yknij sobie! Ja stawiam.";
};                       

FUNC INT DIA_BaalIsidro_Drink_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Drink_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Prosz�, �yknij sobie! Ja stawiam.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Dzi�ki, kolego. Twoje zdrowie!

		if 		(Npc_HasItems(other,ItFoBooze))
		{
			B_GiveInvItems	(other,self,ItFoBooze,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBooze);		
		}
		else if (Npc_HasItems(other,ItFoBeer))
		{
			B_GiveInvItems	(other,self,ItFoBeer,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBeer);		
		}
		else if (Npc_HasItems(other,ItFoWine))
		{
			B_GiveInvItems	(other,self,ItFoWine,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoWine);		
		};
		
		BaalIsidro_GotDrink = TRUE;

		if	Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem)
		{
		    B_LogEntry	(CH1_DealerJob,"Ostatni �yk mojej hojnej oferty zgasi� ca�kowicie p�omie� oporu Baala Isidro. Chyba wreszcie przyjmie moj� ofert�.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidrio ochoczo przyj�� trunek, ale mimo to nie chce odda� mi swojego ziela.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); //Co? Gdzie?
	};
};

// ************************************************************
// 					 �brleg's dir!
// ************************************************************
	var int BaalIsidro_DealerJob;
// ************************************************************

INSTANCE DIA_BaalIsidro_ThinkAgain(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_ThinkAgain_Condition;
	information	= DIA_BaalIsidro_ThinkAgain_Info;
	permanent	= 1;
	description = "Sam pomy�l - dasz mi ziele i podzielimy si� zyskami.";
};                       

FUNC INT DIA_BaalIsidro_ThinkAgain_Condition()
{
	if	( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob!=LOG_RUNNING)&&(BaalIsidro_DealerJob!=LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_ThinkAgain_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Sam pomy�l - dasz mi ziele i podzielimy si� zyskami.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Stary, musz� koniecznie sprzeda� ten towar! Chyba nie chcesz mnie wystrychn�� na dudka, co?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Masz moje s�owo.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Dobrze, oto ziele... Powiniene� za nie dosta� jakie� 400 bry�ek. To b�dzie po 200 bry�ek na g�ow�. Zaczekam na ciebie tutaj. Wr��, jak tylko uda ci si� sprzeda� towar.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Wiesz mo�e, kto mo�e tutaj kupi� wi�ksz� ilo�� ziela?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Gdybym wiedzia�, sam bym je dawno sprzeda�, nie s�dzisz?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Poczu�em si� lepiej po pozbyciu si� tego ziela, wiesz?
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro da� mi swoj� porcj� ziela. Je�li uda mi si� je sprzeda�, otrzymam po�ow� zysku, czyli jakie� 200 bry�ek rudy.");	
	
		//Item�bergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items �bergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Nie, jako� sobie poradz�...
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

INSTANCE DIA_BaalIsidro_RUNNING(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_RUNNING_Condition;
	information	= DIA_BaalIsidro_RUNNING_Info;
	permanent	= 0;
	description = "Sprzeda�em ca�e ziele.";
};                       

FUNC INT DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_RUNNING_Info()
{	
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //Sprzeda�em ca�e ziele.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //A moje 200 bry�ek?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Prosz� bardzo. 
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //�wietnie... Teraz Baal Kagan mo�e mi... No wiesz (Pijacki �miech)
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Mi�o by�o robi� z tob� interesy.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro z ulg� przyj�� swoje 200 bry�ek.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Nie mam ich przy sobie.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //To lepiej je szybko przynie�!
		AI_StopProcessInfos	(self);
	};
};

