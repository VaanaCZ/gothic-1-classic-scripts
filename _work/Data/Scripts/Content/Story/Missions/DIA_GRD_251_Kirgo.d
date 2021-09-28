// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_What_Condition;
	information		= Info_Kirgo_What_Info;
	permanent		= 0;
	description 	= "Zdar! Jsem tady nov�.";
};                       

FUNC INT Info_Kirgo_What_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func VOID Info_Kirgo_What_Info()
{
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Zdar! Jsem tu nov�.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Ne��kej! �ekni mi n�co o vn�j��m sv�t�! U� jsem o tom, co se d�je venku, nesly�el p�es m�s�c.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Jsem Kirgo. Bojuju v ar�n�.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Good_Condition;
	information		= Info_Kirgo_Good_Info;
	permanent		= 0;
	description 	= "A jsi dobr�? Mysl�m v boji, ch�pe�?";
};                       

FUNC INT Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Good_Info()
{
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //A jsi dobr�?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //V boji? U� jsem dlouho nebojoval, ale zat�m jsem v souboji v�dycky zv�t�zil!
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Charge_Condition;
	information		= Info_Kirgo_Charge_Info;
	permanent		= 0;
	description 	= "Cht�l bych t� vyzvat na souboj v ar�n�!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1))	// Kapitelfix   ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Cht�l bych t� vyzvat na souboj v ar�n�!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Co�e? Ale j� bojovat nechci. Pro� si rad�ji ned�me pivo a nepopov�d�me o vn�j��m sv�t�?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Ne! Chci bojovat. Te�!",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Dob�e, pak m�m u tebe pivo!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Ne! Chci bojovat. Te�!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //V tom p��pad�... Jestli jsi p�ipraven, j� taky.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Dob�e, pak m�m u tebe pivo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Tady je!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //D�ky! Ob�v�m se, �e ti toho o vn�j��m sv�t� nebudu moci tolik ��ci - dr�eli m� skoro dva m�s�ce zamknut�ho v tmav� d��e, ne� m� uvrhli sem.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //To je ostuda... No, nezlob se... Hej, na n�koho, kdo byl dva m�s�ce pod z�mkem, ale vypad� docela dob�e.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //Jsem r�d, �e to takhle dopadlo.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //Pro� potom trv� na tom, abysme se spolu utkali?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Chci, aby se o mn� v t�bo�e v�d�lo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //Mysl� Scattyho? Hm, to je jeden z nejv�znamn�j��ch mu�� z Vn�j��ho okruhu... Kdy� m� poraz�, ur�it� si toho v�imne...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Ale jestli ho doopravdy chce� zaujmout, pak pot�ebuje� porazit Kharima. Akor�t m�m obavu, �e na tebe bude p��li� siln�!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Jestli chce� je�t� po��d bojovat se mnou, dej mi v�d�t. Nebudu m�t ale radost z toho, a� t� skol�m.
	
	CreateInvItem (other, ItFoBeer);
	B_GiveInvItems (other, self, ItFoBeer, 1);
	
	self.npctype = npctype_FRIEND;
	
	Info_ClearChoices	(Info_Kirgo_Charge );
};

// **************************************
//				Fordern REAL
// **************************************
	var int Kirgo_Charged;
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_ChargeREAL_Condition;
	information		= Info_Kirgo_ChargeREAL_Info;
	permanent		= 0;
	description 	= "Tak poj�me bojovat - jsi p�ipraven?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Bj�rn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Tak poj�me bojovat - jsi p�ipraven?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Poj� za mnou!
	
	AI_StopProcessInfos	( self );
	
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ( (Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 1)			//Fix f�r sp�tere Kapitel ****Bj�rn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Dob�e, poj�me do toho. A� vyhraje ten nejlep��!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Dobr�, zapome�me na tuhle h�dku, dobr�?
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















