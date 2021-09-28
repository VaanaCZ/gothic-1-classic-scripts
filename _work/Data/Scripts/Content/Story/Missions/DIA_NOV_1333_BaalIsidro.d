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
	description = "Nie wygl¹dasz mi na zbyt zadowolonego.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Nie wygl¹dasz mi na zbyt zadowolonego.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Bo nie jestem!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Muszê siê pozbyæ du¿ego ³adunku ziela.
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
	description = "Poka¿ mi co tam masz...";
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
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Poka¿ mi co tam masz...
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Proszê...
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
	description = "Móg³bym pomóc ci sprzedaæ to ziele. Oczywiœcie za drobn¹ prowizjê.";
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
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Móg³bym pomóc ci sprzedaæ to ziele. Oczywiœcie za drobn¹ prowizjê.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Zapomnij o tym. Nie jestem a¿ tak pijany. Da³byœ nogê z ca³ym towarem.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Nowicjusz Baal Isidro krêci siê w pobli¿u karczmy na jeziorze, nie trzeŸwiej¹c ca³ymi dniami. Nie radzi sobie najlepiej ze sprzeda¿¹ swojej porcji ziela. Mo¿e uda mi siê przekonaæ go, ¿eby zda³ siê na mnie. Tylko jak to zrobiæ?"); 
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
	description = "Masz przechlapane. Baal Kagan znajdzie kogoœ innego na twoje miejsce.";
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
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Wiesz co? Masz nieŸle przechlapane. Baal Kagan znajdzie sobie kogoœ innego na twoje miejsce.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Co? Na potêgê Œni¹cego! Muszê siê koniecznie pozbyæ tego towaru!
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro by³ zdenerwowany, gdy dowiedzia³ siê o planach zast¹pienia go kimœ innym. Mimo to nie zgodzi³ siê oddaæ mi ziela.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Plany Baal Kagana, by zast¹piæ moczymordê kimœ innym, ostatecznie go dobi³y. Chyba wreszcie przyjmie moj¹ ofertê!");
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
	description = "Proszê, ³yknij sobie! Ja stawiam.";
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
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Proszê, ³yknij sobie! Ja stawiam.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Dziêki, kolego. Twoje zdrowie!

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
		    B_LogEntry	(CH1_DealerJob,"Ostatni ³yk mojej hojnej oferty zgasi³ ca³kowicie p³omieñ oporu Baala Isidro. Chyba wreszcie przyjmie moj¹ ofertê.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidrio ochoczo przyj¹³ trunek, ale mimo to nie chce oddaæ mi swojego ziela.");
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
	description = "Sam pomyœl - dasz mi ziele i podzielimy siê zyskami.";
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
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Sam pomyœl - dasz mi ziele i podzielimy siê zyskami.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Stary, muszê koniecznie sprzedaæ ten towar! Chyba nie chcesz mnie wystrychn¹æ na dudka, co?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Masz moje s³owo.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Dobrze, oto ziele... Powinieneœ za nie dostaæ jakieœ 400 bry³ek. To bêdzie po 200 bry³ek na g³owê. Zaczekam na ciebie tutaj. Wróæ, jak tylko uda ci siê sprzedaæ towar.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Wiesz mo¿e, kto mo¿e tutaj kupiæ wiêksz¹ iloœæ ziela?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Gdybym wiedzia³, sam bym je dawno sprzeda³, nie s¹dzisz?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Poczu³em siê lepiej po pozbyciu siê tego ziela, wiesz?
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro da³ mi swoj¹ porcjê ziela. Jeœli uda mi siê je sprzedaæ, otrzymam po³owê zysku, czyli jakieœ 200 bry³ek rudy.");	
	
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
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Nie, jakoœ sobie poradzê...
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
	description = "Sprzeda³em ca³e ziele.";
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
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //Sprzeda³em ca³e ziele.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //A moje 200 bry³ek?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Proszê bardzo. 
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Œwietnie... Teraz Baal Kagan mo¿e mi... No wiesz (Pijacki œmiech)
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Mi³o by³o robiæ z tob¹ interesy.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro z ulg¹ przyj¹³ swoje 200 bry³ek.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Nie mam ich przy sobie.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //To lepiej je szybko przynieœ!
		AI_StopProcessInfos	(self);
	};
};

