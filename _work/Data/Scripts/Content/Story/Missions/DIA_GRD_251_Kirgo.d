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
	description 	= "Czeœæ! Jestem tu nowy.";
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
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Czeœæ! Jestem tu nowy.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Naprawdê? Opowiedz mi coœ o zewnêtrznym œwiecie! Ju¿ od miesi¹ca nie mia³em ¿adnych wieœci z zewn¹trz.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Jestem Kirgo. Walczê na arenie.
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
	description 	= "Jesteœ dobry?";
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
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Jesteœ dobry?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //W walce? Nie zajmujê siê tym zbyt d³ugo, ale wygra³em ju¿ swoj¹ pierwsz¹ walkê!
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
	description 	= "Chcia³bym ciê wyzwaæ na pojedynek na arenie!";
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
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Chcia³bym ciê wyzwaæ na pojedynek na arenie!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Co? Ale ja nie chcê z tob¹ walczyæ! Mo¿e napijemy siê po prostu piwa i pogadamy o zewnêtrznym œwiecie?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Nie! Chcê siê biæ! Teraz!",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Dobra, daj mi piwo!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Nie! Chcê siê biæ! Natychmiast!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //W takim razie... Mo¿emy zaczynaæ, jak tylko bêdziesz gotów.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Dobra, daj mi piwo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Proszê bardzo!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Dziêki! Obawiam siê, ¿e nie mogê ci zbyt wiele powiedzieæ o wydarzeniach na zewn¹trz. Prawie dwa miesi¹ce przesiedzia³em w ciemnicy. Zaraz potem trafi³em tutaj.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //Wielka szkoda... Có¿, trudno... Ca³kiem nieŸle siê trzymasz, jak na kogoœ, kto przesiedzia³ w celi dwa miesi¹ce.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //I zamierzam siê postaraæ, ¿eby tak zosta³o.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //To dlaczego tak ci zale¿y na walce z jednym z nas?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Chcê zas³u¿yæ na szacunek w Obozie.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //To znaczy, ¿e chcesz przekonaæ do siebie Scatty'ego, tak? To jeden z bardziej wp³ywowych ludzi w Zewnêtrznym Pierœcieniu... Mo¿e bêdzie pod wra¿eniem, jeœli uda ci siê mnie pokonaæ...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Ale jeœli naprawdê chcesz go do siebie przekonaæ, powinieneœ stawiæ czo³a Kharimowi. Tylko obawiam siê, ¿e on mo¿e byæ dla ciebie za dobry!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Jeœli nadal chcesz ze mn¹ walczyæ, daj mi znaæ! Chocia¿ nie chcia³bym ci robiæ krzywdy.
	
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
	description 	= "Chcê z tob¹ walczyæ - jesteœ gotów?";
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
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Chcê z tob¹ walczyæ - jesteœ gotów?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //ChodŸ za mn¹!
	
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
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Dobra, zaczynajmy! Niech wygra najlepszy!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo¿e zapomnijmy o naszej ma³ej sprzeczce, dobra?	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















