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
	description = "Nie wyglądasz mi na zbyt zadowolonego.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Nie wyglądasz mi na zbyt zadowolonego.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Bo nie jestem!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Muszę się pozbyć dużego ładunku ziela.
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
	description = "Pokaż mi co tam masz...";
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
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Pokaż mi co tam masz...
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Proszę...
};

// ************************************************************
// 					 Ich verkaufe für dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Mógłbym pomóc ci sprzedać to ziele. Oczywiście za drobną prowizję.";
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
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Mógłbym pomóc ci sprzedać to ziele. Oczywiście za drobną prowizję.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Zapomnij o tym. Nie jestem aż tak pijany. Dałbyś nogę z całym towarem.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Nowicjusz Baal Isidro kręci się w pobliżu karczmy na jeziorze, nie trzeźwiejąc całymi dniami. Nie radzi sobie najlepiej ze sprzedażą swojej porcji ziela. Może uda mi się przekonać go, żeby zdał się na mnie. Tylko jak to zrobić?"); 
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
	description = "Masz przechlapane. Baal Kagan znajdzie kogoś innego na twoje miejsce.";
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
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Wiesz co? Masz nieźle przechlapane. Baal Kagan znajdzie sobie kogoś innego na twoje miejsce.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Co? Na potęgę Śniącego! Muszę się koniecznie pozbyć tego towaru!
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro był zdenerwowany, gdy dowiedział się o planach zastąpienia go kimś innym. Mimo to nie zgodził się oddać mi ziela.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Plany Baal Kagana, by zastąpić moczymordę kimś innym, ostatecznie go dobiły. Chyba wreszcie przyjmie moją ofertę!");
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
	description = "Proszę, łyknij sobie! Ja stawiam.";
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
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Proszę, łyknij sobie! Ja stawiam.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Dzięki, kolego. Twoje zdrowie!

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
		    B_LogEntry	(CH1_DealerJob,"Ostatni łyk mojej hojnej oferty zgasił całkowicie płomień oporu Baala Isidro. Chyba wreszcie przyjmie moją ofertę.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidrio ochoczo przyjął trunek, ale mimo to nie chce oddać mi swojego ziela.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); //Co? Gdzie?
	};
};

// ************************************************************
// 					 Übrleg's dir!
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
	description = "Sam pomyśl - dasz mi ziele i podzielimy się zyskami.";
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
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Sam pomyśl - dasz mi ziele i podzielimy się zyskami.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Stary, muszę koniecznie sprzedać ten towar! Chyba nie chcesz mnie wystrychnąć na dudka, co?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Masz moje słowo.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Dobrze, oto ziele... Powinieneś za nie dostać jakieś 400 bryłek. To będzie po 200 bryłek na głowę. Zaczekam na ciebie tutaj. Wróć, jak tylko uda ci się sprzedać towar.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Wiesz może, kto może tutaj kupić większą ilość ziela?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Gdybym wiedział, sam bym je dawno sprzedał, nie sądzisz?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Poczułem się lepiej po pozbyciu się tego ziela, wiesz?
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro dał mi swoją porcję ziela. Jeśli uda mi się je sprzedać, otrzymam połowę zysku, czyli jakieś 200 bryłek rudy.");	
	
		//Itemübergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items übergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Nie, jakoś sobie poradzę...
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
	description = "Sprzedałem całe ziele.";
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
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //Sprzedałem całe ziele.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //A moje 200 bryłek?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Proszę bardzo. 
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Świetnie... Teraz Baal Kagan może mi... No wiesz (Pijacki śmiech)
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Miło było robić z tobą interesy.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro z ulgą przyjął swoje 200 bryłek.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Nie mam ich przy sobie.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //To lepiej je szybko przynieś!
		AI_StopProcessInfos	(self);
	};
};

