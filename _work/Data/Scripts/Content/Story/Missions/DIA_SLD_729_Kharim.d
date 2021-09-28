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
	description 	= "Jsem tady nov�. Kdo jsi?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Jsem tady nov�. Kdo jsi ty?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //J� jsem Kharim! Ty tady mus� b�t �pln� nov� - jinak bys u� o mn� sly�el!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Jsem nejlep�� bojovn�k, jak�ho kdy tenhle zpropaden� t�bor vid�l.
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
	description 	= "Vyz�v�m t� na souboj! Poj�me do ar�ny!";
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
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Vyzvu t� na souboj! Poj�me do ar�ny!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //TY?! D�m si t� k sn�dani, maz�nku!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Ud�lej si pro sebe laskavost a ztra� se!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Dob�e, dob�e, zapomeneme na to!",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Ne tak zhurta, ty zbab�l�e?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Dob�e, dob�e, zapomeneme na to!
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Ne tak zhurta, ty zbab�l�e?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Nem� ��dn� lep�� n�pad, chlape�ku?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Jsi tady akor�t proto, abys dostal p��le�itost pol�bit Gomezovi zadek!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"Jako t�eba: tvoje matka obcuje s ka�d�m...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Tak se nad t�m zamysli: ne, nen� co si rozm��let, jestli jsi to pochopil.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"M� tenk� pa�e, ale pak jsem uvid�l tv�j hnusn� cifern�k.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Dob�e, dob�e, zapomeneme na to!",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Jako t�eba: tvoje matka obcuje s ka�d�m...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Jasn�, tu�il jsem to...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Jsi tady akor�t proto, abys dostal p��le�itost pol�bit Gomezovi zadek!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //CO�E?! Ty �erve! Nic o n�s nev�! Nov� t�bor je NEZ�VISL� na v�em tady!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //A krom� toho m�m jedin� d�vod, pro� tady jsem: abych mohl vyrazit mozek z takovejch osl�, jako se� ty.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Bude mi pot�en�m ud�lat to sam� TOB�! Tv�j osud t� �ek� v ar�n�!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Tak se nad t�m zamysli: ne, nen� co si rozm��let, jestli jsi to pochopil.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Mo�n� by ses o to mohl pokusit.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Zaprv�, cht�l jsem n�co ��ci o tv�ch tenk�ch pa��ch, ale pak jsem uvid�l tv�j hnusn� cifern�k.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //Mysl�m, �e m� posledn� �anci ihned ZMIZET!
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
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Bolest je ot�zkou s�ly v�le!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus k�nnen wir unseren Streit vergessen ...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
