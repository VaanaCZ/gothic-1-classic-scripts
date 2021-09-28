/*******************************************************************************************
**  	Feuermagier  (Runensteine  und Scrolls)											  **
*******************************************************************************************/

// Light (Scrolls und Runen)
INSTANCE ItArRuneLight (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	300;

	visual				=	"ItAr_Rune_42.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LIGHT;
	mag_circle 			= 	1;

	description			=	"Luz";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_LIGHT;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollLight (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual				=	"ItAr_Scroll_32.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_LIGHT;

	description			=	"Luz";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_LIGHT;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Firebolt alias MagicMissile (Scrolls und Runen)

INSTANCE ItArRuneFirebolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	300;

	visual				=	"ItAr_Rune_23.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBOLT;
	mag_circle 			=	1;

	description			=	"Virote de fuego";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_FIREBOLT;
	TEXT	[2]			=	NAME_Dam_Fire;			COUNT	[2]		=	SPL_DAMAGE_FIREBOLT;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollFirebolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual				=	"ItAr_Scroll_35.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBOLT;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_FIREBOLT;

	description			=	"Virote de fuego";
	//TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_FIREBOLT;
	TEXT	[2]			=	NAME_Dam_Fire;			COUNT	[2]		=	SPL_DAMAGE_FIREBOLT;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Fireball (Scrolls und Runen)

INSTANCE ItArRuneFireball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	700;

	visual				=	"ItAr_Rune_26.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBALL;
	mag_circle 			=	3;

	description			= 	"Bola de fuego";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FIREBALL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIREBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollFireball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItAr_Scroll_27.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBALL;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_FIREBALL;

	description			= 	"Bola de fuego";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FIREBALL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIREBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Firestorm (Scrolls und Runen)

INSTANCE ItArRuneFirestorm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1100;

	visual				=	"ItAr_Rune_24.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRESTORM;
	mag_circle 			=	4;

	description			= 	"Tormenta de fuego";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FIRESTORM;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIRESTORM;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollFirestorm (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	110;

	visual				=	"ItAr_Scroll_28.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRESTORM;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_FIRESTORM;

	description			= 	"Tormenta de fuego";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FIRESTORM;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIRESTORM;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

/*******************************************************************************************/
// FireRain (Scrolls und Runen)

INSTANCE ItArRuneFireRain (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1300;

	visual				=	"ItAr_Rune_25.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRERAIN;
	mag_circle 			= 	5;

	description			=	"Lluvia de fuego";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_FIRERAIN;
	TEXT	[2]			=	NAME_Dam_Fire;				COUNT	[2]		=	SPL_DAMAGE_FIRERAIN;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollFireRain (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	130;

	visual				=	"ItAr_Scroll_36.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRERAIN;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_FIRERAIN;

	description			=	"Lluvia de fuego";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_FIRERAIN;
	TEXT	[2]			=	NAME_Dam_Fire;				COUNT	[2]		=	SPL_DAMAGE_FIRERAIN;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Teleport1 (Scrolls und Runen)

INSTANCE ItArRuneTeleport1 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_38.3ds";	//rote Rune
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT1;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			= 	"Teleportarse hasta los Magos del Fuego";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport1 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_38.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT1;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_TELEPORT;

	description			= 	"Teleportarse hasta los Magos del Fuego";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

/*******************************************************************************************/
// Teleport2 (Scrolls und Runen)

INSTANCE ItArRuneTeleport2 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_40.3ds"; //blaue Rune
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT2;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			= 	"Teleportarse hasta los Magos del Agua";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport2 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_37.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT2;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_TELEPORT;

	description			= 	"Teleportarse hasta los Magos del Agua";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

/*******************************************************************************************/
// Teleport3 (Scrolls und Runen)

INSTANCE ItArRuneTeleport3 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_41.3ds"; //lila Rune
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT3;
	//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			=	"Teleportarse hasta el Nigromante";	//blaue Rune
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport3 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_40.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT3;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_TELEPORT;

	description			=	"Teleportarse hasta el Nigromante";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};


/*******************************************************************************************/
// Teleport4 (nur Scrolls)

INSTANCE ItArScrollTeleport4 (C_Item)
{
	name 				= NAME_Spruchrolle;

	mainflag 			= ITEM_KAT_RUNE;
	flags 				= ITEM_MULTI;

	visual				= "ItAr_Scroll_39.3DS";	//lila Punkt + gelber Punkt
	material			= MAT_STONE;

	spell				=	SPL_TELEPORT4;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_TELEPORT;

	description			= 	"Conjuro orco de teletransporte";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	0;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};


/*******************************************************************************************/
// Teleport5 (Scrolls und Runen)

INSTANCE ItArRuneTeleport5 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_39.3ds";	//grüne Rune
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT5;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			=	"Teleportarse hasta el Campamento del Pantano";	//lila Rune
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport5 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_39.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT5;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_TELEPORT;

	description			=	"Teleportarse hasta el Campamento del Pantano";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};


/*******************************************************************************************
**  Wassermagier	 (Runensteine  und Scrolls)											  **
*******************************************************************************************/

// Heal (Scrolls und Runen)

INSTANCE ItArRuneHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	500;

	visual				=	"ItAr_Rune_27.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_HEAL;
	mag_circle 			= 	2;

	description			=	"Curación";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_HealingPerMana;		COUNT	[1]		=	SPL_HEALING_HP_PER_MP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


INSTANCE ItArScrollHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_HEAL;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_HEALING_HP_PER_MP;

	description			=	"Curación";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_HealingPerMana;		COUNT	[1]		=	SPL_HEALING_HP_PER_MP;
	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	SPL_HEALING_HP_PER_MP;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


/*******************************************************************************************/

// Verwandlung (nur Scrolls)

INSTANCE ItArScrollTrfBloodfly (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;

	spell			    = 	SPL_TRF_BLOODFLY;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_TRF_BLOODFLY;

	description			=	"Transformarse en mosca de sangre";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_BLOODFLY;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfCrawler (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_04.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_CRAWLER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_CRAWLER;

	description			=	"Transformarse en reptador de la mina";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_CRAWLER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfLurker (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_02.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_LURKER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_LURKER;

	description			=	"Transformarse en acechador";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_LURKER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfMeatbug (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_03.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_MEATBUG;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_MEATBUG;

	description			=	"Transformarse en sabandija de carne";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_MEATBUG;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfMolerat (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_05.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_MOLERAT;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_MOLERAT;

	description			= "Transformarse en ratopo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_MOLERAT;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfOrcdog (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual				=	"ItAr_Scroll_11.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_ORCDOG;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_ORCDOG;

	description			=	"Transformarse en perro orco";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_ORCDOG;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfScavenger (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_07.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_SCAVENGER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_SCAVENGER;

	description			=	"Transformarse en carroñero";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_SCAVENGER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfShadowbeast (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual				=	"ItAr_Scroll_06.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_SHADOWBEAST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_SHADOWBEAST;

	description			=	"Transformarse en bestia de sombra";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_SHADOWBEAST;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfSnapper (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	150;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_SNAPPER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_SNAPPER;

	description			=	"Transformarse en chasqueador";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_SNAPPER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfWaran (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_10.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_WARAN;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_WARAN;

	description			= "Transformarse en lagarto";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_WARAN;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfWolf (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_09.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_WOLF;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_WOLF;

	description			= "Transformarse en lobo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_WOLF;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


/*******************************************************************************************/
// Chain-Lightning (Scrolls und Runen)

INSTANCE ItArRuneChainLightning (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	700;

	visual				=	"ItAr_Rune_18.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CHAINLIGHTNING;
	mag_circle 			=	4;

	description			=	"Relámpago zigzagueante";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_ZAPPED_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollChainLightning (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItAr_Scroll_20.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CHAINLIGHTNING;
	//mag_circle 			=	3;

	description			=	"Relámpago zigzagueante";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_ZAPPED_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


/*******************************************************************************************/
// Thunderbolt (Scrolls und Runen)

INSTANCE ItArRuneThunderbolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	500;

	visual				=	"ItAr_Rune_19.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBOLT;
	mag_circle 			=	1;

// FIXME: kann man die DAMAGE_PER_LEVEL-Werte der Spells aus der Spells_Params hier für Manakosten einsetzen??
	description			=	"Rayo de hielo";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_THUNDERBOLT;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_THUNDERBOLT;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollThunderbolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual				=	"ItAr_Scroll_41.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBOLT;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_THUNDERBOLT;

	description			=	"Rayo de hielo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_THUNDERBOLT;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_THUNDERBOLT;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


/*******************************************************************************************/
// Thunderball (Scrolls und Runen)

INSTANCE ItArRuneThunderball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_20.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBALL;
	mag_circle 			=	3;		//SN: von 4 auf 3 geändert!

	description			=	"Bola relampagueante";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_THUNDERBALL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Magic,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_THUNDERBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};


INSTANCE ItArScrollThunderball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBALL;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_THUNDERBALL;

	description			=	"Bola relampagueante";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_THUNDERBALL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Magic,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_THUNDERBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

/*******************************************************************************************/
// IceCube (Scrolls und Runen)

INSTANCE ItArRuneIceCube (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	700;

	visual				=	"ItAr_Rune_21.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICECUBE;
	mag_circle 			=	3;

	description			=	"Bloque de hielo";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ICECUBE;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollIceCube (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItAr_Scroll_25.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ICECUBE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_ICECUBE;

	description			=	"Bloque de hielo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ICECUBE;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


/*******************************************************************************************/
// IceWave (Scrolls und Runen)

INSTANCE ItArRuneIceWave (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1100;

	visual				=	"ItAr_Rune_22.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICEWAVE;
	mag_circle 			=	5;

	description			=	"Ola de hielo";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ICEWAVE;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollIceWave (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	110;

	visual				=	"ItAr_Scroll_30.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ICEWAVE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_ICEWAVE;

	description			=	"Ola de hielo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ICEWAVE;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


/*******************************************************************************************
**  Dämonenbeschwörer	 (Runensteine  und Scrolls)										  **
*******************************************************************************************/

// Summon Demon (Scrolls)

INSTANCE ItArScrollSummonDemon (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	550;

	visual				=	"ItAr_Scroll_18.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONDEMON;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SUMMONDEMON;

	description			=	"Convocar demonio";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SUMMONDEMON;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Summon Skeletons (Scrolls)

INSTANCE ItArScrollSummonSkeletons (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	350;

	visual				=	"ItAr_Scroll_23.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONSKELETON;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SUMMONSKELETON;

	description			=	"Convocar esqueletos";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SUMMONSKELETON;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Summon Golem (Scrolls)

INSTANCE ItArScrollSummonGolem (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	450;

	visual				=	"ItAr_Scroll_23.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONGOLEM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SUMMONGOLEM;

	description			=	"Convocar gólem";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SUMMONGOLEM;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Army of Darkness (Scrolls)

INSTANCE ItArScrollArmyOfDarkness (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	666;

	visual				=	"ItAr_Scroll_29.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ARMYOFDARKNESS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_ARMYOFDARKNESS;

	description			=	"Ejército de las Tinieblas";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ARMYOFDARKNESS;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Destroy Undead (Scrolls und Runen)

INSTANCE ItArRuneDestroyUndead (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1100;

	visual				=	"ItAr_Rune_15.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_DESTROYUNDEAD;
	mag_circle 			=	4;

	description			=	"Muerte a los no-muertos";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_DESTROYUNDEAD;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_DESTROYUNDEAD;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollDestroyUndead (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	110;

	visual				=	"ItAr_Scroll_26.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_DESTROYUNDEAD;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_DESTROYUNDEAD;

	description			=	"Muerte a los no-muertos";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_DESTROYUNDEAD;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_DESTROYUNDEAD;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


/*******************************************************************************************
**  PSI-Sprüche		(Runen und Scrolls)													  **
*******************************************************************************************/

// Windfist (Scrolls und Runen)

INSTANCE ItArRuneWindfist (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	500;

	visual				=	"ItAr_Rune_06.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_WINDFIST;
	mag_circle 			=	2;

	description			=	"Puño del viento";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_WINDFIST;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_WINDFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollWindfist (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual				=	"ItAr_Scroll_12.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_WINDFIST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_WINDFIST;

	description			=	"Puño del viento";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_WINDFIST;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_WINDFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Stormfist (Scrolls und Runen)

INSTANCE ItArRuneStormfist (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_07.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_STORMFIST;
	mag_circle 			=	4;

	description			=	"Puño de la tormenta";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_STORMFIST;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_STORMFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollStormfist (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_17.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_STORMFIST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_STORMFIST;

	description			=	"Puño de la tormenta";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_STORMFIST;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_STORMFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};


/*******************************************************************************************/
// Telekinesis (Scrolls und Runen)

INSTANCE ItArRuneTelekinesis (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	700;

	visual				=	"ItAr_Rune_05.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEKINESIS;
	mag_circle 			=	3;

	description			=	"Telequinesia";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManaPerSec;			COUNT	[1]		=	1;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;

};

INSTANCE ItArScrollTelekinesis (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItAr_Scroll_13.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEKINESIS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	10;

	description			=	"Telequinesia";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManaPerSec;			COUNT	[1]		=	1;
	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	cond_value[2];
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Charm (Scrolls und Runen)

INSTANCE ItArRuneCharm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	700;

	visual				=	"ItAr_Rune_10.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CHARM;
	mag_circle 			=	3;

	description			=	"Hechizar";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_CHARM;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollCharm (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItAr_Scroll_19.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CHARM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_CHARM;

	description			=	"Hechizar";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_CHARM;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Sleep (Scrolls)

INSTANCE ItArRuneSleep (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	500;

	visual				=	"ItAr_Rune_09.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_SLEEP;
	mag_circle 			=	2;

	description			=	"Dormir";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SLEEP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollSleep (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual				=	"ItAr_Scroll_16.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SLEEP;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SLEEP;

	description			=	"Dormir";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SLEEP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Pyrokinesis (Scrolls und Runen)

INSTANCE ItArRunePyrokinesis (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	700;

	visual				=	"ItAr_Rune_04.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PYROKINESIS;
	mag_circle 			=	3;

	description			=	"Piroquinesia";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_PYRO_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollPyrokinesis (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	70;

	visual				=	"ItAr_Scroll_33.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PYROKINESIS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	10;

	description			=	"Piroquinesia";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_PYRO_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Control (Scrolls und Runen)

INSTANCE ItArRuneControl (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_02.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	mag_circle 			=	4;

	description			=	"Control";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	//TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SLEEP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollControl (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_08.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	30;

	description			=	"Control";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	//TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Fear (nur Scrolls )

INSTANCE ItArScrollFear (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	250;

	visual				=	"ItAr_Scroll_34.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FEAR;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_FEAR;

	description			=	"Miedo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_FEAR;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/******************************************************************************************/
// Berzerk (nur Scrolls )

INSTANCE ItArScrollBerzerk (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual				=	"ItAr_Scroll_22.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_BERZERK;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_BERZERK;

	description			=	"Furia";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_BERZERK;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Breath of Death (nur Rune )

INSTANCE ItArRuneBreathOfDeath (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1500;

	visual				=	"ItAr_Rune_21.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_BREATHOFDEATH;
	mag_circle 			=	6;

	description			=	"Aliento mortal";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_BREATHOFDEATH;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_BREATHOFDEATH;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Shrink (nur Scrolls )

INSTANCE ItArScrollShrink (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	1000;

	visual				=	"ItAr_Scroll_15.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SHRINK;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SHRINK;

	description			=	"Encoger monstruo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SHRINK;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
