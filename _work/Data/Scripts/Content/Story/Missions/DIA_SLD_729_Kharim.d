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
	description 	= "Jsem tady nový. Kdo jsi?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Jsem tady nový. Kdo jsi ty?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Já jsem Kharim! Ty tady musíš být úplnì nový - jinak bys už o mnì slyšel!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Jsem nejlepší bojovník, jakého kdy tenhle zpropadený tábor vidìl.
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
	description 	= "Vyzývám tì na souboj! Pojïme do arény!";
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
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Vyzvu tì na souboj! Pojïme do arény!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //TY?! Dám si tì k snídani, mazánku!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Udìlej si pro sebe laskavost a ztra se!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Dobøe, dobøe, zapomeneme na to!",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Ne tak zhurta, ty zbabìlèe?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Dobøe, dobøe, zapomeneme na to!
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Ne tak zhurta, ty zbabìlèe?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Nemáš žádný lepší nápad, chlapeèku?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Jsi tady akorát proto, abys dostal pøíležitost políbit Gomezovi zadek!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"Jako tøeba: tvoje matka obcuje s každým...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Tak se nad tím zamysli: ne, není co si rozmýšlet, jestli jsi to pochopil.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Máš tenký paže, ale pak jsem uvidìl tvùj hnusný ciferník.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Dobøe, dobøe, zapomeneme na to!",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Jako tøeba: tvoje matka obcuje s každým...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Jasnì, tušil jsem to...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Jsi tady akorát proto, abys dostal pøíležitost políbit Gomezovi zadek!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //COŽE?! Ty èerve! Nic o nás nevíš! Nový tábor je NEZÁVISLÝ na všem tady!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //A kromì toho mám jediný dùvod, proè tady jsem: abych mohl vyrazit mozek z takovejch oslù, jako seš ty.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Bude mi potìšením udìlat to samý TOBÌ! Tvùj osud tì èeká v arénì!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Tak se nad tím zamysli: ne, není co si rozmýšlet, jestli jsi to pochopil.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Možná by ses o to mohl pokusit.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Zaprvé, chtìl jsem nìco øíci o tvých tenkých pažích, ale pak jsem uvidìl tvùj hnusný ciferník.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //Myslím, že máš poslední šanci ihned ZMIZET!
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
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Bolest je otázkou síly vùle!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus können wir unseren Streit vergessen ...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
