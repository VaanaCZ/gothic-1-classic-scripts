// ************************************************************************************************
// Wert von Tiertrophдen
// ************************************************************************************************

// FIXME: welche Trophдe wann freigeschaltet? Wert tunen!
const int	Value_Zдhne				=	10;
const int	Value_Krallen			=	15;

const int	Value_Wolfsfell			=	10;
const int	Value_Orkhundfell		=	15;

const int	Value_Panzerplatte		=	50;
const int	Value_Crawlerzangen		=	10;

const int	Value_Shadowbeastfell	=	100;

const int	Value_Lurkerklaue		=	15;
const int	Value_Lurkerhaut		=	25;

const int	Value_Sumpfhaihaut		=	200;

const int	Value_Trollfell			=	300;

// Bloodfly
const int	Value_Flьgel			=	15;
const int	Value_Stachel			=	25;

// Durch Ulu-Mulu freigeschaltet
// bei Auftragsvergabe werden je 3 neue Monster gespawnt
const int	Value_Feuerzunge		=	500;
const int	Value_Sumpfhaizдhne		=	500;
const int	Value_Shadowbeasthorn	=	500;
const int	Value_Trollhauer		=	500;

// Golems beim Dдmonenbeschwцrer
const int	Value_Steinherz			=	1000;
const int	Value_Feuerherz			=	1000;
const int	Value_Eisherz			=	1000;
const int	Value_Eistueck			=	100;


/*
So in der Tasche
----------------
ItAt_Meatbug_01 	//Meatbug			Kцrper (Essen)		(Item-Instanz in Food.d)
ItFoMuttonRaw		//Scavenger			2 Bollen			OK
					//Molerats			2 Bollen			OK
					//Shadowbeast		4 Bollen			OK

ItAt_Bloodfly_01 	//Bloodfly			Flьgel				OK

Durch Jдger freigeschaltet (noch nicht verteilt)
--------------------------
ItAt_Teeth_01 		//Wolf				2 Zдhne				OK
					//Schwarzer Wolf	2 Zдhne				OK
					//Snapper			10 Zдhne			OK
					//Orcbiter			2 Zдhne				OK
					//Shadowbeast		4 Zдhne				OK
					//Bloodhound		4 Zдhne				OK
//--------------------------------------------------------------
ItAt_Claws_01 		//Waran				4 Klauen			OK
					//Feuerechse		4 Klauen			OK
					//Snapper			3 Klauen			OK
					//Razor				3 Klauen			OK
					//Beisser			2 Klauen			OK
ItAt_Lurker_01 		//Lurker 			2 Klauen			OK
//--------------------------------------------------------------
ItAt_Wolf_01 		//Wolf	 			Wolfsfell			OK
ItAt_Wolf_02 		//Orkhund	 		Orkhundfell			OK
ItAt_Shadow_01 		//Shadowbeast		Shadowbeast-Fell	OK
ItAt_Troll_01 		//Troll				Trollfell			OK
//--------------------------------------------------------------
ItAt_Swampshark_01 	//Sumpfhai			Haut des Sumpfhais	OK
ItAt_Lurker_02 		//Lurker			Haut des Lurkers	OK

Durch Templer / Kalom freigeschaltet (noch nicht verteilt)
------------------------------------
ItAt_Crawler_01 	//Crawler		 	Zangen				OK
ItAt_Bloodfly_02 	//Bloodfly			Stachel				OK

Durch ORG_855_Wolf freigeschaltet
------------------------
ItAt_Crawler_02 	//Crawler			Panzerplatten		OK

Durch Ulu-Mulu freigeschaltet
-----------------------------
ItAt_Waran_01 		//Feuerechse		Flammenzunge		OK
ItAt_Swampshark_02 	//Sumpfhai			Zдhne des Sumpfhais	OK
ItAt_Shadow_02 		//Shadowbeast		Horn				OK
ItAt_Troll_02 		//Troll				Hauer				OK
*/

/******************************************************************************************/
INSTANCE ItAt_Teeth_01 (C_Item)
{
	name 				=	"Клык";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Zдhne;

	visual 				=	"ItAt_Teeth_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Zдhne;
};

/******************************************************************************************/
INSTANCE ItAt_Wolf_01 (C_Item)
{
	name 				=	"Волчья шкура";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wolfsfell;

	visual 				=	"ItAt_Wolf_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Wolfsfell;
};
/******************************************************************************************/
INSTANCE ItAt_Wolf_02 (C_Item)
{
	name 				=	"Шкура орочей гончей";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Orkhundfell;

	visual 				=	"ItAt_Wolf_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Orkhundfell;
};
/******************************************************************************************/
INSTANCE ItAt_Waran_01 (C_Item)
{
	name 				=	"Язык огня";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Feuerzunge;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Feuerzunge;
};
/******************************************************************************************/
INSTANCE ItAt_Claws_01 (C_Item)
{
	name 				=	"Когти";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Krallen;

	visual 				=	"ItAt_Claws_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Krallen;
};
/******************************************************************************************/
INSTANCE ItAt_Crawler_02 (C_Item)
{
	name 				=	"Пластина панциря";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Panzerplatte;

	visual 				=	"ItAt_Crawler_02.3DS";
	material 			=	MAT_WOOD;

	description			= "Пластина панциря ползуна-воина";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Panzerplatte;
};

/******************************************************************************************/
INSTANCE ItAt_Crawler_01 (C_Item)
{
	name 				=	"Челюсти ползуна";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Crawlerzangen;

	visual 				=	"ItAt_Crawler_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Crawlerzangen;
};

/******************************************************************************************/
INSTANCE ItAt_Shadow_01 (C_Item)
{
	name 				=	"Шкура";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shadowbeastfell;

	visual 				=	"ItAt_Shadowbeast_01.3DS";
	material 			=	MAT_LEATHER;

	description			= "Шкура мракориса";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Shadowbeastfell;
};

/******************************************************************************************/
INSTANCE ItAt_Shadow_02 (C_Item)
{
	name 				=	"Рог";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shadowbeasthorn;

	visual 				=	"ItAt_Shadowbeast_02.3DS";
	material 			=	MAT_LEATHER;

	description			= "Рог мракориса";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Shadowbeasthorn;
};

/******************************************************************************************/
INSTANCE ItAt_Lurker_01 (C_Item)
{
	name 				=	"Когти шныги";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lurkerklaue;

	visual 				=	"ItAt_Lurker_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Lurkerklaue;
};

/******************************************************************************************/
INSTANCE ItAt_Lurker_02 (C_Item)
{
	name 				=	"Шкура шныги";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lurkerhaut;

	visual 				=	"ItAt_Lurker_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Lurkerhaut;
};

/******************************************************************************************/
INSTANCE ItAt_Troll_02 (C_Item)
{
	name 				=	"Клык тролля";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollhauer;

	visual 				=	"ItAt_Troll_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollhauer;
};

/******************************************************************************************/
INSTANCE ItAt_Troll_01 (C_Item)
{
	name 				=	"Шкура тролля";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollfell;

	visual 				=	"ItAt_Troll_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollfell;
};
/******************************************************************************************/
INSTANCE ItAt_Swampshark_01 (C_Item)
{
	name 				=	"Шкура болотожора";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfhaihaut;

	visual 				=	"ItAt_Swampshark_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Sumpfhaihaut;
};
/******************************************************************************************/
INSTANCE ItAt_Swampshark_02 (C_Item)
{
	name 				=	"Зуб болотожора";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfhaizдhne;

	visual 				=	"ItAt_Swampshark_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Sumpfhaizдhne;
};
/******************************************************************************************/
INSTANCE ItAt_Bloodfly_01 (C_Item)
{
	name 				=	"Крылья";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Flьgel;

	visual 				=	"ItAt_Bloodfly_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Flьgel;
};
/******************************************************************************************/
INSTANCE ItAt_Bloodfly_02 (C_Item)
{
	name 				=	"Жало шершня";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Stachel;

	visual 				=	"ItAt_Bloodfly_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Stachel;
};



/******************************************************************************************/
INSTANCE ItAt_StoneGolem_01 (C_Item)
{
	name 				=	"Сердце каменного голема";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_WINDFIST;

	value 				=	Value_Steinherz;

	visual 				=	"ItAt_StoneGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Это сердце побежденного в бою";
	TEXT[1]				= "голема. Оно обладает";
	TEXT[2]				= "силой швырять противника"; 
	TEXT[3]				= "через воздух.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steinherz;
};

/******************************************************************************************/
INSTANCE ItAt_FireGolem_01 (C_Item)
{
	name 				=	"Сердце огненного голема";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_FIREBALL;

	value 				=	Value_Feuerherz;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Это сердце побежденного в бою";
	TEXT[1]				= "голема. Оно обладает";
	TEXT[2]				= "силой поджигать ";
	TEXT[3]				= "противника.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolem_01 (C_Item)
{
	name 				=	"Сердце ледяного голема";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_ICECUBE;

	value 				=	Value_Eisherz;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Это сердце побежденного в бою";
	TEXT[1]				= "голема. Оно обладает";
	TEXT[2]				= "силой замораживать противника.";
	//TEXT[3]				= "zu Eis erstarren zu lassen.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Eisherz;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolem_02 (C_Item)
{
	name 				=	"Частица ледяного голема";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	spell				= 	SPL_THUNDERBOLT;

	value 				=	Value_Eistueck;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	500;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Это частица побежденного";
	TEXT[1]				= "ледяного голема.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Eistueck;
};
