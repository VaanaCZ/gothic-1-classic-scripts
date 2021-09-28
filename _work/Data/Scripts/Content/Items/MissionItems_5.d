//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
// Skizze des Orctempels
//---------------------------------------------------------------------

INSTANCE ItWrTemplemap(C_Item)
{
	name 				=	"Mapa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	30;

	visual 				=	"ItWr_Map_01.3DS";
	material 			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	UseTemplemap;

	description			= "Náèrt chrámu";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

	FUNC VOID UseTemplemap()
	{
		var int nDocID;

		nDocID = 	Doc_CreateMap	()			  ;							// DocManager
//					Doc_SetLevel	( nDocID,	"ORCTEMPEL.ZEN" );		// Positionsanzeige funzt nicht!
					Doc_SetPages	( nDocID, 1 );
					Doc_SetPage 	( nDocID, 0, "Map_Temple.tga", 1	);  //  1 -> DO NOT SCALE
					Doc_Show		( nDocID 	);
	};


//---------------------------------------------------------------------
//	Alarmhorn der Orks
//---------------------------------------------------------------------
INSTANCE ItMiAlarmhorn (C_Item)
{
	name 				=	"Roh";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MISSION;

	value 				=	9;

	visual 				=	"ItMi_Alarmhorn_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"HORN";

	description			= name;
	//TEXT[0]			= "";
	////COUNT[0]		= ;
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Statuette für Tür zum Alten Tempel
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Idol_Sleeper_01 (C_Item)
{
	name 				=	"Figurka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Stuff_Idol_Sleeper_01.3DS";
	material 			=	MAT_CLAY;

	description			=	name;
	TEXT[0]				= "Toto je figurka znetvoøené";
	TEXT[1]				= "bytosti s maskou.";
	TEXT[2]				= "Maska je zakonèena šesti velkými ostny.";
};

//---------------------------------------------------------------------
//	Schläferschwert 1
//---------------------------------------------------------------------
INSTANCE Weltenspalter (C_Item) 
{	
	name 				=	"Rozkol svìtù";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"To byl meè nemrtvého";
	TEXT[1]				=	"skøetího knìze Varrag-Hashora.";
	TEXT[2]				=	"Bìhem èasu se tato zbraò";
	TEXT[3]				=	"stala nepoužitelnou.";
	TEXT[4]				=	"Možná by ten meè bylo";
	TEXT[5]				=	"možné použít jinak.";
};

//---------------------------------------------------------------------
//	Schläferschwert 2
//---------------------------------------------------------------------
INSTANCE Lichtbringer (C_Item) 
{	
	name 				=	"Ostøí blesku";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"To byl meè nemrtvého";
	TEXT[1]				=	"skøetího knìze Varrag-Kasorga.";
	TEXT[2]				=	"Bìhem èasu se tato zbraò";
	TEXT[3]				=	"stala nepoužitelnou.";
	TEXT[4]				=	"Možná by ten meè bylo";
	TEXT[5]				=	"možné použít jinak.";
};

//---------------------------------------------------------------------
//	Schläferschwert 3
//---------------------------------------------------------------------
INSTANCE Zeitenklinge (C_Item) 
{	
	name 				=	"Ostøí èasu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"To byl meè nemrtvého";
	TEXT[1]				=	"skøetího knìze Varrag-Unhilqta.";
	TEXT[2]				=	"Bìhem èasu se tato zbraò";
	TEXT[3]				=	"stala nepoužitelnou.";
	TEXT[4]				=	"Možná by ten meè bylo";
	TEXT[5]				=	"možné použít jinak.";
};

//---------------------------------------------------------------------
//	Schläferschwert 4
//---------------------------------------------------------------------
INSTANCE Daemonenstreich (C_Item) 
{	
	name 				=	"Úder démona";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"To byl meè nemrtvého";
	TEXT[1]				=	"skøetího knìze Varrag-Ruuushka.";
	TEXT[2]				=	"Bìhem èasu se tato zbraò";
	TEXT[3]				=	"stala nepoužitelnou.";
	TEXT[4]				=	"Možná by ten meè bylo";
	TEXT[5]				=	"možné použít jinak.";
};

//---------------------------------------------------------------------
//	Schläferschwert 5
//---------------------------------------------------------------------
INSTANCE Bannklinge (C_Item) 
{	
	name 				=	"Ostøí vyhnanství";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"To byl meè nemrtvého";
	TEXT[1]				=	"To byl meè nemrtvého mocného";
	TEXT[2]				=	"Bìhem èasu se tato zbraò";
	TEXT[3]				=	"stala nepoužitelnou.";
	TEXT[4]				=	"Možná by ten meè bylo";
	TEXT[5]				=	"možné použít jinak.";
};

//---------------------------------------------------------------------
//	Schwert für den Untoten Ork-Hohepriester (unidentifiziert)
//---------------------------------------------------------------------
INSTANCE Mythrilklinge (C_Item) 
{	
	name 				=	"Podivný meè";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	10;
	damagetype			=	DAM_EDGE;
	range    			=  	160;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Krásnì provedený meè.";
	TEXT[1]				=	"Jsou do nìj vyryty starodávné runy";
	TEXT[2]				=	"Možná by ty runy dokázal rozluštit Xardas!";
	TEXT[3]				=	"Dokud je nerozluští,";
	TEXT[4]				=	" nebudu meè radìji používat!";
};

//---------------------------------------------------------------------
//	Schwert für den Untoten Ork-Hohepriester (identifiziert)
//---------------------------------------------------------------------
instance Mythrilklinge01 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Xardas øekl, že se ten meè jmenuje URIZIEL a";
	TEXT[1]				=	"pøedpokládá, že je velmi starý. Pøed dávnými èasy";
	TEXT[2]				=	"mìl velkou moc, ale už své kouzlo ztratil.";

	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

//---------------------------------------------------------------------
//	Schwert für den Untoten Ork-Hohepriester (aufgeladen)
//---------------------------------------------------------------------
instance Mythrilklinge02 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	10000;

//	damageType				=	DAM_EDGE|DAM_FIRE|DAM_MAGIC;//Templer sollten sofort tot sein
	damageType				=	DAM_FIRE|DAM_MAGIC;
//	damageType				=	DAM_MAGIC;
//	damage[DAM_INDEX_EDGE]	=	  1;						//Templer sollten sofort tot sein
	damage[DAM_INDEX_FIRE]	=	 30;
	damage[DAM_INDEX_MAGIC]	=	120;
	//damage[DAM_INDEX_MAGIC]	=	150;

	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_02.3DS";
	description			= 	name;
	TEXT[0]				=	"To je meè URIZIEL.";
	TEXT[1]				= 	"Uriziel je obdaøen kouzlem.";
	TEXT[2]				=	NAME_Dam_Magic;			COUNT[2]	=	damage[DAM_INDEX_MAGIC];
	TEXT[3]				=	NAME_Dam_Fire;			COUNT[3]	=	damage[DAM_INDEX_FIRE];
	TEXT[4] 			=	NAME_Str_needed;		COUNT[4]	=	cond_value[2];
	TEXT[5]				=	NAME_Value;				COUNT[5]	=	value;
};

//---------------------------------------------------------------------
//	URIZIEL, mit entferntem Stein
//---------------------------------------------------------------------
instance Mythrilklinge03 (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	180;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMw_2H_Sword_Sleeper_01.3DS";

	description			= 	name;
	TEXT[0]				=	"Z jeho èepele byl odstranìn magický";
	TEXT[1]				=	"klenot. Je to stále vynikající zbraò, ale své";
	TEXT[2]				=	"kouzlo již ztratila.";
	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

//---------------------------------------------------------------------
//	Schriftrolle, um Schwert für den untoten Ork-Hohepriester zu laden
//---------------------------------------------------------------------
INSTANCE Scroll4Milten (C_Item)
{	
	name 				=	"Pøenos síly";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	15;

	visual 				=	"ItWrScroll.3DS";
	material 			=	MAT_LEATHER;

//	scemeName			=	"MAP";
	description			= name;
	TEXT[0]				= "Kouzlo pøenosu magické";
	TEXT[1]				= "síly do Urizielu.";
 	TEXT[2]				= "Nemùžu jej použít.";
};

//---------------------------------------------------------------------
//	Schlüssel zum Versunkenen Turm
//---------------------------------------------------------------------
INSTANCE ItKe_SunkenTower(C_Item)
{
	name 				=	"Klíè";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[0]				=	"Otevøe dveøe do";
	TEXT[1]				=	"zatopené vìže.";
};

//---------------------------------------------------------------------
//	Kerkerschlüssel
//---------------------------------------------------------------------
INSTANCE DungeonKey(C_Item)
{
	name 				=	"Klíè od vìzení";

	mainflag 				=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;

	description			= name;
	TEXT[0]				= "Otevøe vìzení";
	TEXT[0]				= "Starého tábora.";
};


//---------------------------------------------------------------------
//	Destroyer Rune (geladen)
//---------------------------------------------------------------------
INSTANCE UrizielRune (C_Item)
{
	name 				=	"Smrtelná vlna URIZIELU";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	10000;

	visual				=	"ItAr_Rune_14.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MASSDEATH;
	mag_circle 			=	6;

	description			=	name;
	TEXT	[0]			=	"Tato mocná kouzelná runa obsahuje";
	TEXT	[1]			=	"prastarou sílu meèe URIZIEL.";
	TEXT	[2]			=	NAME_Mag_Circle;			COUNT	[2]		=	mag_circle;
	TEXT	[3]			=	NAME_Manakosten;			COUNT	[3]		=	SPL_SENDCAST_MASSDEATH;
	TEXT	[4]			=	NAME_Dam_Magic;				COUNT	[4]		=	SPL_DAMAGE_MASSDEATH;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
