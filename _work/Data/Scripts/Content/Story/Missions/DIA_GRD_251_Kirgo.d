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
	description 	= "Zdar! Jsem tady nový.";
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
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Zdar! Jsem tu nový.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Neøíkej! Øekni mi nìco o vnìjším svìtì! Už jsem o tom, co se dìje venku, neslyšel pøes mìsíc.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Jsem Kirgo. Bojuju v arénì.
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
	description 	= "A jsi dobrý? Myslím v boji, chápeš?";
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
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //A jsi dobrý?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //V boji? Už jsem dlouho nebojoval, ale zatím jsem v souboji vždycky zvítìzil!
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
	description 	= "Chtìl bych tì vyzvat na souboj v arénì!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1))	// Kapitelfix   ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Chtìl bych tì vyzvat na souboj v arénì!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Cože? Ale já bojovat nechci. Proè si radìji nedáme pivo a nepopovídáme o vnìjším svìtì?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Ne! Chci bojovat. Teï!",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Dobøe, pak mám u tebe pivo!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Ne! Chci bojovat. Teï!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //V tom pøípadì... Jestli jsi pøipraven, já taky.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Dobøe, pak mám u tebe pivo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Tady je!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Díky! Obávám se, že ti toho o vnìjším svìtì nebudu moci tolik øíci - drželi mì skoro dva mìsíce zamknutého v tmavé díøe, než mì uvrhli sem.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //To je ostuda... No, nezlob se... Hej, na nìkoho, kdo byl dva mìsíce pod zámkem, ale vypadáš docela dobøe.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //Jsem rád, že to takhle dopadlo.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //Proè potom trváš na tom, abysme se spolu utkali?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Chci, aby se o mnì v táboøe vìdìlo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //Myslíš Scattyho? Hm, to je jeden z nejvýznamnìjších mužù z Vnìjšího okruhu... Když mì porazíš, urèitì si toho všimne...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Ale jestli ho doopravdy chceš zaujmout, pak potøebuješ porazit Kharima. Akorát mám obavu, že na tebe bude pøíliš silný!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Jestli chceš ještì poøád bojovat se mnou, dej mi vìdìt. Nebudu mít ale radost z toho, až tì skolím.
	
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
	description 	= "Tak pojïme bojovat - jsi pøipraven?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Björn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Tak pojïme bojovat - jsi pøipraven?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Pojï za mnou!
	
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
	if (Kapitel <= 1)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Dobøe, pojïme do toho. A vyhraje ten nejlepší!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Dobrá, zapomeòme na tuhle hádku, dobrý?
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















