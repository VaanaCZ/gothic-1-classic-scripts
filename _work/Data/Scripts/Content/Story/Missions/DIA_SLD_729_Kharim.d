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
	description 	= "Jestem tu nowy. A ty kim jeste�?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Jestem tu nowy. A ty kim jeste�?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Jestem Kharim! Widz�, �e trafi�e� tu niedawno, inaczej ju� by� o mnie us�ysza�!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Jestem najlepszym wojownikiem jakiego ten zawszony Ob�z kiedykolwiek ogl�da�.
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
	description 	= "Wyzywam ci� na pojedynek! Chod�my na aren�!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Wyzywam ci� na pojedynek! Chod�my na aren�!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //TY?! Takich jak ty zjadam na �niadanie!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Dobrze ci radz�, ch�optasiu - SPADAJ ST�D!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Dobra, spokojnie. Zapomnijmy o ca�ej sprawie!",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Boisz si�, �e oberwiesz, tch�rzu?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Dobra, spokojnie. Zapomnijmy o ca�ej sprawie!
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Boisz si�, �e oberwiesz, tch�rzu?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Nie sta� ci� na nic lepszego, ch�opcze?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Przyszed�e� tutaj tylko dlatego, �eby m�c poca�owa� Gomeza w dup�!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"To mo�e tak: Tw�j ojciec zabawia� si� z owcami...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Nie przychodzi mi do g�owy nic, co by�by� w stanie zrozumie�.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Chcia�em powiedzie� co� o twoich ramionach, ale zobaczy�em twoj� mord�.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Dobra, spokojnie. Zapomnijmy o ca�ej sprawie!",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //To mo�e tak: tw�j ojciec zabawia� si� z owcami...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //C�, by�y takie plotki...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Powiedzmy sobie szczerze: przyszed�e� tutaj tylko dlatego, �eby m�c poca�owa� Gomeza w dup�!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //CO!?! Ty gnido! Nie wiesz o czym m�wisz! Nowy Ob�z ma was gdzie�!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //A poza tym jest tylko jeden pow�d, dla kt�rego tutaj przyszed�em: zamierzam publicznie upokorzy� ka�dego mi�czaka, kt�ry o�mieli si� wyzwa� mnie na pojedynek.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Ale ciebie za�atwi� z wyj�tkow� przyjemno�ci�! Czekam na ciebie na arenie!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Pomy�lmy... Nie, nie przychodzi mi do g�owy nic, co by�by� w stanie zrozumie�.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Mo�e jednak powiniene� spr�bowa�.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Z pocz�tku chcia�em powiedzie� co� o twoich w�t�ych ramionach, ale potem zobaczy�em twoj� paskudn� mord�.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //To twoja ostatnia szansa, �eby odej�� st�d o w�asnych si�ach!
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
	if (Kapitel <= 1)				// Kapitelfix ***Bj�rn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //B�l to tylko kwestia si�y woli!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Mo�e zapomnimy o naszej ma�ej sprzeczce...
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
