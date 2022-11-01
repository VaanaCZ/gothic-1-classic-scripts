// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 999;
	condition		= Info_Kharim_Exit_Condition;
	information		= Info_Kharim_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kharim_Exit_Condition()
{
	return 1;
};

func VOID Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Jestem tu nowy. A ty kim jesteś?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Jestem tu nowy. A ty kim jesteś?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Jestem Kharim! Widzę, że trafiłeś tu niedawno, inaczej już byś o mnie usłyszał!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Jestem najlepszym wojownikiem jakiego ten zawszony Obóz kiedykolwiek oglądał.
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 2;
	condition		= Info_Kharim_Charge_Condition;
	information		= Info_Kharim_Charge_Info;
	permanent		= 1;
	description 	= "Wyzywam cię na pojedynek! Chodźmy na arenę!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Wyzywam cię na pojedynek! Chodźmy na arenę!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //TY?! Takich jak ty zjadam na śniadanie!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Dobrze ci radzę, chłoptasiu - SPADAJ STĄD!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Dobra, spokojnie. Zapomnijmy o całej sprawie!",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Boisz się, że oberwiesz, tchórzu?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Dobra, spokojnie. Zapomnijmy o całej sprawie!
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Boisz się, że oberwiesz, tchórzu?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Nie stać cię na nic lepszego, chłopcze?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Przyszedłeś tutaj tylko dlatego, żeby móc pocałować Gomeza w dupę!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"To może tak: Twój ojciec zabawiał się z owcami...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Nie przychodzi mi do głowy nic, co byłbyś w stanie zrozumieć.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Chciałem powiedzieć coś o twoich ramionach, ale zobaczyłem twoją mordę.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Dobra, spokojnie. Zapomnijmy o całej sprawie!",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //To może tak: twój ojciec zabawiał się z owcami...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Cóż, były takie plotki...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Powiedzmy sobie szczerze: przyszedłeś tutaj tylko dlatego, żeby móc pocałować Gomeza w dupę!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //CO!?! Ty gnido! Nie wiesz o czym mówisz! Nowy Obóz ma was gdzieś!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //A poza tym jest tylko jeden powód, dla którego tutaj przyszedłem: zamierzam publicznie upokorzyć każdego mięczaka, który ośmieli się wyzwać mnie na pojedynek.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Ale ciebie załatwię z wyjątkową przyjemnością! Czekam na ciebie na arenie!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Pomyślmy... Nie, nie przychodzi mi do głowy nic, co byłbyś w stanie zrozumieć.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Może jednak powinieneś spróbować.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Z początku chciałem powiedzieć coś o twoich wątłych ramionach, ale potem zobaczyłem twoją paskudną mordę.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //To twoja ostatnia szansa, żeby odejść stąd o własnych siłach!
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1)				// Kapitelfix ***Björn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Ból to tylko kwestia siły woli!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Może zapomnimy o naszej małej sprzeczce...
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
