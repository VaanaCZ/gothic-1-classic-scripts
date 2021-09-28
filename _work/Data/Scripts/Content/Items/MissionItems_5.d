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
	name 				=	"Карта";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	30;

	visual 				=	"ItWr_Map_01.3DS";
	material 			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	UseTemplemap;

	description			= "Набросок храма";
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
	name 				=	"Рог";

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
//	Statuette fьr Tьr zum Alten Tempel
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Idol_Sleeper_01 (C_Item)
{
	name 				=	"Статуэтка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Stuff_Idol_Sleeper_01.3DS";
	material 			=	MAT_CLAY;

	description			=	name;
	TEXT[0]				= "Статуэтка представляет некое создание";
	TEXT[1]				= "в маске.";
	TEXT[2]				= "Маска окружена шестью большими жалами.";
};

//---------------------------------------------------------------------
//	Schlдferschwert 1
//---------------------------------------------------------------------
INSTANCE Weltenspalter (C_Item) 
{	
	name 				=	"Раскалывающий миры";

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
	TEXT[0]				=	"Этот меч принадлежал бессмертному высшему";
	TEXT[1]				=	"священнику Варраг-Хашору.";
	TEXT[2]				=	"Очевидно, что как оружие этот меч явно";
	TEXT[3]				=	"бесполезен.";
	TEXT[4]				=	"Возможно, его можно использовать для";
	TEXT[5]				=	"других целей.";
};

//---------------------------------------------------------------------
//	Schlдferschwert 2
//---------------------------------------------------------------------
INSTANCE Lichtbringer (C_Item) 
{	
	name 				=	"Клинок света";

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
	TEXT[0]				=	"Этот меч принадлежал бессмертному высшему";
	TEXT[1]				=	"священнику Варраг-Касоргу.";
	TEXT[2]				=	"Очевидно, что как оружие этот меч явно";
	TEXT[3]				=	"бесполезен.";
	TEXT[4]				=	"Возможно, его можно использовать для";
	TEXT[5]				=	"других целей.";
};

//---------------------------------------------------------------------
//	Schlдferschwert 3
//---------------------------------------------------------------------
INSTANCE Zeitenklinge (C_Item) 
{	
	name 				=	"Клинок времен";

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
	TEXT[0]				=	"Этот меч принадлежал бессмертному высшему";
	TEXT[1]				=	"священнику Варраг-Унхилькту.";
	TEXT[2]				=	"Очевидно, что как оружие этот меч явно";
	TEXT[3]				=	"бесполезен.";
	TEXT[4]				=	"Возможно, его можно использовать для";
	TEXT[5]				=	"других целей.";
};

//---------------------------------------------------------------------
//	Schlдferschwert 4
//---------------------------------------------------------------------
INSTANCE Daemonenstreich (C_Item) 
{	
	name 				=	"Удар демона";

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
	TEXT[0]				=	"Этот меч принадлежал бессмертному высшему";
	TEXT[1]				=	"священнику Варраг-Руушку.";
	TEXT[2]				=	"Очевидно, что как оружие этот меч явно";
	TEXT[3]				=	"бесполезен.";
	TEXT[4]				=	"Возможно, его можно использовать для";
	TEXT[5]				=	"других целей.";
};

//---------------------------------------------------------------------
//	Schlдferschwert 5
//---------------------------------------------------------------------
INSTANCE Bannklinge (C_Item) 
{	
	name 				=	"Клинок наказания";

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
	TEXT[0]				=	"Этот меч принадлежал бессмертному высшему";
	TEXT[1]				=	"священнику орков Граш-Варраг-Арушату.";
	TEXT[2]				=	"Очевидно, что как оружие этот меч явно";
	TEXT[3]				=	"бесполезен.";
	TEXT[4]				=	"Возможно, его можно использовать для";
	TEXT[5]				=	"других целей.";
};

//---------------------------------------------------------------------
//	Schwert fьr den Untoten Ork-Hohepriester (unidentifiziert)
//---------------------------------------------------------------------
INSTANCE Mythrilklinge (C_Item) 
{	
	name 				=	"Странный меч";

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
	TEXT[0]				=	"Меч восхитительного качества.";
	TEXT[1]				=	"Клинок покрыт древними рунами.";
	TEXT[2]				=	"Может быть, Ксардас и сможет их прочитать.";
	TEXT[3]				=	"В любом случае до той поры мне не стоит";
	TEXT[4]				=	"его использовать.";
};

//---------------------------------------------------------------------
//	Schwert fьr den Untoten Ork-Hohepriester (identifiziert)
//---------------------------------------------------------------------
instance Mythrilklinge01 (C_Item) 
{	
	name 				=	"УРИЗЕЛЬ";

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
	TEXT[0]				=	"Ксардас сказал, что меч носит имя УРИЗЕЛЬ и";
	TEXT[1]				=	"он очень древний. Много лет назад он обладал";
	TEXT[2]				=	"огромной силой, но магия ушла.";

	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

//---------------------------------------------------------------------
//	Schwert fьr den Untoten Ork-Hohepriester (aufgeladen)
//---------------------------------------------------------------------
instance Mythrilklinge02 (C_Item) 
{	
	name 				=	"УРИЗЕЛЬ";

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
	TEXT[0]				=	"Это меч Уризель.";
	TEXT[1]				= 	"В нем заключена магическая сила.";
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
	name 				=	"УРИЗЕЛЬ";

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
	TEXT[0]				=	"Магический камень был удален из него. Это не";
	TEXT[1]				=	"мешает Уризелю оставаться отличным оружием,";
	TEXT[2]				=	"но магия его ушла.";
	TEXT[3]				=	NAME_Damage;				COUNT[3] =	damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[4] =	cond_value[2];
	TEXT[5]				=	NAME_Value;					COUNT[5] =	value;
};

//---------------------------------------------------------------------
//	Schriftrolle, um Schwert fьr den untoten Ork-Hohepriester zu laden
//---------------------------------------------------------------------
INSTANCE Scroll4Milten (C_Item)
{	
	name 				=	"Передача силы";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	15;

	visual 				=	"ItWrScroll.3DS";
	material 			=	MAT_LEATHER;

//	scemeName			=	"MAP";
	description			= name;
	TEXT[0]				= "Заклинание для передачи";
	TEXT[1]				= "силы в Уризель.";
 	TEXT[2]				= "Я не могу использовать его.";
};

//---------------------------------------------------------------------
//	Schlьssel zum Versunkenen Turm
//---------------------------------------------------------------------
INSTANCE ItKe_SunkenTower(C_Item)
{
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[0]				=	"Открывает двери в затопленной";
	TEXT[1]				=	"башне.";
};

//---------------------------------------------------------------------
//	Kerkerschlьssel
//---------------------------------------------------------------------
INSTANCE DungeonKey(C_Item)
{
	name 				=	"Ключ к подземелью";

	mainflag 				=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;

	description			= name;
	TEXT[0]				= "Открывает подземелья";
	TEXT[0]				= "в Старом Лагере.";
};


//---------------------------------------------------------------------
//	Destroyer Rune (geladen)
//---------------------------------------------------------------------
INSTANCE UrizielRune (C_Item)
{
	name 				=	"Волна Смерти УРИЗЕЛЯ";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	10000;

	visual				=	"ItAr_Rune_14.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MASSDEATH;
	mag_circle 			=	6;

	description			=	name;
	TEXT	[0]			=	"This powerful magic rune contains";
	TEXT	[1]			=	"the ancient powers of the sword URIZIEL.";
	TEXT	[2]			=	NAME_Mag_Circle;			COUNT	[2]		=	mag_circle;
	TEXT	[3]			=	NAME_Manakosten;			COUNT	[3]		=	SPL_SENDCAST_MASSDEATH;
	TEXT	[4]			=	NAME_Dam_Magic;				COUNT	[4]		=	SPL_DAMAGE_MASSDEATH;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
