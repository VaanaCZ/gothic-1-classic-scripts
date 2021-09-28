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
	description 	= "Cze��! Jestem tu nowy.";
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
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Cze��! Jestem tu nowy.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Naprawd�? Opowiedz mi co� o zewn�trznym �wiecie! Ju� od miesi�ca nie mia�em �adnych wie�ci z zewn�trz.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Jestem Kirgo. Walcz� na arenie.
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
	description 	= "Jeste� dobry?";
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
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Jeste� dobry?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //W walce? Nie zajmuj� si� tym zbyt d�ugo, ale wygra�em ju� swoj� pierwsz� walk�!
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
	description 	= "Chcia�bym ci� wyzwa� na pojedynek na arenie!";
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
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Chcia�bym ci� wyzwa� na pojedynek na arenie!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Co? Ale ja nie chc� z tob� walczy�! Mo�e napijemy si� po prostu piwa i pogadamy o zewn�trznym �wiecie?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Nie! Chc� si� bi�! Teraz!",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Dobra, daj mi piwo!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Nie! Chc� si� bi�! Natychmiast!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //W takim razie... Mo�emy zaczyna�, jak tylko b�dziesz got�w.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Dobra, daj mi piwo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Prosz� bardzo!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Dzi�ki! Obawiam si�, �e nie mog� ci zbyt wiele powiedzie� o wydarzeniach na zewn�trz. Prawie dwa miesi�ce przesiedzia�em w ciemnicy. Zaraz potem trafi�em tutaj.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //Wielka szkoda... C�, trudno... Ca�kiem nie�le si� trzymasz, jak na kogo�, kto przesiedzia� w celi dwa miesi�ce.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //I zamierzam si� postara�, �eby tak zosta�o.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //To dlaczego tak ci zale�y na walce z jednym z nas?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Chc� zas�u�y� na szacunek w Obozie.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //To znaczy, �e chcesz przekona� do siebie Scatty'ego, tak? To jeden z bardziej wp�ywowych ludzi w Zewn�trznym Pier�cieniu... Mo�e b�dzie pod wra�eniem, je�li uda ci si� mnie pokona�...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Ale je�li naprawd� chcesz go do siebie przekona�, powiniene� stawi� czo�a Kharimowi. Tylko obawiam si�, �e on mo�e by� dla ciebie za dobry!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Je�li nadal chcesz ze mn� walczy�, daj mi zna�! Chocia� nie chcia�bym ci robi� krzywdy.
	
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
	description 	= "Chc� z tob� walczy� - jeste� got�w?";
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
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Chc� z tob� walczy� - jeste� got�w?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Chod� za mn�!
	
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
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Dobra, zaczynajmy! Niech wygra najlepszy!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Mo�e zapomnijmy o naszej ma�ej sprzeczce, dobra?	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















