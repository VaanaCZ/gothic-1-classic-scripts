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
	description 	= "Jestem tu nowy. A ty kim jesteœ?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Jestem tu nowy. A ty kim jesteœ?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Jestem Kharim! Widzê, ¿e trafi³eœ tu niedawno, inaczej ju¿ byœ o mnie us³ysza³!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Jestem najlepszym wojownikiem jakiego ten zawszony Obóz kiedykolwiek ogl¹da³.
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
	description 	= "Wyzywam ciê na pojedynek! ChodŸmy na arenê!";
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
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Wyzywam ciê na pojedynek! ChodŸmy na arenê!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //TY?! Takich jak ty zjadam na œniadanie!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Dobrze ci radzê, ch³optasiu - SPADAJ ST¥D!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Dobra, spokojnie. Zapomnijmy o ca³ej sprawie!",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Boisz siê, ¿e oberwiesz, tchórzu?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Dobra, spokojnie. Zapomnijmy o ca³ej sprawie!
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Boisz siê, ¿e oberwiesz, tchórzu?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Nie staæ ciê na nic lepszego, ch³opcze?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Przyszed³eœ tutaj tylko dlatego, ¿eby móc poca³owaæ Gomeza w dupê!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"To mo¿e tak: Twój ojciec zabawia³ siê z owcami...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Nie przychodzi mi do g³owy nic, co by³byœ w stanie zrozumieæ.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Chcia³em powiedzieæ coœ o twoich ramionach, ale zobaczy³em twoj¹ mordê.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Dobra, spokojnie. Zapomnijmy o ca³ej sprawie!",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //To mo¿e tak: twój ojciec zabawia³ siê z owcami...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Có¿, by³y takie plotki...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Powiedzmy sobie szczerze: przyszed³eœ tutaj tylko dlatego, ¿eby móc poca³owaæ Gomeza w dupê!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //CO!?! Ty gnido! Nie wiesz o czym mówisz! Nowy Obóz ma was gdzieœ!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //A poza tym jest tylko jeden powód, dla którego tutaj przyszed³em: zamierzam publicznie upokorzyæ ka¿dego miêczaka, który oœmieli siê wyzwaæ mnie na pojedynek.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Ale ciebie za³atwiê z wyj¹tkow¹ przyjemnoœci¹! Czekam na ciebie na arenie!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Pomyœlmy... Nie, nie przychodzi mi do g³owy nic, co by³byœ w stanie zrozumieæ.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Mo¿e jednak powinieneœ spróbowaæ.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Z pocz¹tku chcia³em powiedzieæ coœ o twoich w¹t³ych ramionach, ale potem zobaczy³em twoj¹ paskudn¹ mordê.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //To twoja ostatnia szansa, ¿eby odejœæ st¹d o w³asnych si³ach!
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
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Ból to tylko kwestia si³y woli!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Mo¿e zapomnimy o naszej ma³ej sprzeczce...
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
