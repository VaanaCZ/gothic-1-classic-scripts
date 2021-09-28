//------------------------------------------------------------------
//PERSÖNLICHE WAFFEN
/***********************************************************/
//ALTES LAGER
/***********************************************************/
//THORUS
//------------------------------------------------------------------
INSTANCE Thorus_Schwert (C_Item)
{
	name 				=	"Spada di Thorus";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;

	owner 				= 	GRD_200_THORUS;
	visual 				=	"ItMw_2H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//GOMEZ
//-----------------------------------------------------------
INSTANCE Innos_Zorn (C_Item)
{
	name 				=	"Rabbia d'Innos";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	570;

	damageTotal			= 	110;
	damagetype			=	DAM_EDGE;
	range    			=  	160;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;

	owner 				= 	EBR_100_GOMEZ;
	visual 				=	"ItMw_2H_Sword_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//SCAR
//-----------------------------------------------------------
INSTANCE Scars_Schwert (C_Item)
{
	name 				=	"Spada di Scar";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	460;

	damageTotal 		= 	85;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;

	owner 				=   EBR_101_SCAR;
	visual 				=	"ItMw_1H_Sword_Bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	COUNT[5]			= value;
};

//-----------------------------------------------------------
//ARTO
//-----------------------------------------------------------
INSTANCE Artos_Schwert (C_Item)
{
	name 				=	"Spada di Arto";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	360;

	damageTotal 		= 	65;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;

	owner 				= 	EBR_102_ARTO;
	visual 				=	"ItMw_1H_Sword_Long_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//RAVEN
//-----------------------------------------------------------
INSTANCE Rabenrecht (C_Item)
{
	name 				=	"Diritto di Raven";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal			= 	70;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;

	owner 				= 	EBR_105_RAVEN;
	visual 				=	"ItMw_1H_Sword_Broad_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BARTHOLO
//-----------------------------------------------------------
INSTANCE Prankenhieb (C_Item)
{
	name 				=	"Pugno di Paw";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			= 	55;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;

	owner 				= 	EBR_106_BARTHOLO;
	visual 				=	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//DIEGO
//-----------------------------------------------------------
INSTANCE Diegos_Bogen (C_Item)
{
	name 				= "Arco di Diego";

	mainflag 			= ITEM_KAT_FF;
	flags 				= ITEM_BOW;
	material 			= MAT_WOOD;

	value 				= 390;

	damageTotal 		= 70;
	damagetype			= DAM_POINT;
	munition			= ItAmArrow;

	cond_atr[2]   		= ATR_DEXTERITY;
	cond_value[2]  		= 45;

	owner 				= PC_THIEF;
	visual 				= "ItRwLongbow.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//Whistler (Bei Fisk)
//-----------------------------------------------------------
INSTANCE Whistlers_Schwert (C_Item)
{
	name 				=	"Spada di Whistler";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	110;

	damageTotal			= 	20;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	//owner 				= STT_309_Whistler;		raus wegen Mission
	visual 				=	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/***********************************************************/
//BRUDERSCHAFT
/***********************************************************/
//-----------------------------------------------------------
//Y'BERION
//-----------------------------------------------------------
INSTANCE Stab_des_Lichts (C_Item)
{
	name 				=	"Asta di luce";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	350;

	damageTotal			= 	65;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;

	owner 				=   GUR_1200_YBERION;
	visual 				=	"ItMw_2H_Staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//COR KALOM
//-----------------------------------------------------------
INSTANCE Kaloms_Schwert (C_Item)
{
	name 				=	"Spada di Kalom";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal			= 	70;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;

	owner 				=   GUR_1201_CORKALOM;
	visual 				=	"ItMw_1H_Sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//LESTER
//-----------------------------------------------------------
INSTANCE Streitschlichter (C_Item)
{
	name 				=	"Mediatore di Lester";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	340;

	damageTotal			=   60;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;

	owner 				= 	PC_PSIONIC;
	visual 				=	"ItMw_1H_Mace_War_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//COR ANGAR
//-----------------------------------------------------------
INSTANCE Roter_Wind (C_Item)
{
	name 				=	"Vento rosso";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	570;

	damageTotal			= 	105;
	damagetype			=	DAM_EDGE;
	range    			=  	140;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	owner 				= 	GUR_1202_CORANGAR;
	visual 				=	"ItMw_2H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BAAL NAMIB
//-----------------------------------------------------------
INSTANCE Namibs_Keule (C_Item)
{
	name 				=	"Bastone di Namib";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			=   55;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;

	owner 				= 	GUR_1204_BAALNAMIB;
	visual 				=	"ItMw_1H_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BAAL ORUN
//-----------------------------------------------------------
INSTANCE Oruns_Keule (C_Item)
{
	name 				=	"Bastone di Orun";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	330;

	damageTotal  		=   60;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;

	owner 				= 	GUR_1209_BAALORUN;
	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//FORTUNO
//-----------------------------------------------------------
INSTANCE Fortunos_Keule (C_Item)
{
	name 				=	"Bastone di Fortuno";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	110;

	damageTotal			=   20;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;

	owner 				= 	NOV_1357_FORTUNO;
	visual 				=	"ItMw_1H_Mace_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/***********************************************************/
//NEUES LAGER
/***********************************************************/
//-----------------------------------------------------------
//LEE
//-----------------------------------------------------------
INSTANCE Lees_Axt (C_Item)
{
	name 				=	"Ascia di Lee";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	560;

	damageTotal			= 	105;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	95;

	owner 				= 	SLD_700_LEE;
	visual 				=	"ItMw_2H_Axe_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//ORIK
//-----------------------------------------------------------
INSTANCE Oriks_Axt (C_Item)
{
	name 				=	"Ascia di Orik";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	540;

	damageTotal			= 	95;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;

	owner 				=   SLD_701_ORIK;
	visual 				=	"ItMw_2H_Axe_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//TORLOF
//-----------------------------------------------------------
INSTANCE Torlofs_Axt (C_Item)
{
	name 				=	"Ascia di Torlof";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	550;

	damageTotal			= 	99;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;

	owner 				= 	SLD_737_TORLOF;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//CORD
//-----------------------------------------------------------
INSTANCE Cords_Spalter (C_Item)
{
	name 				=	"Spaccatutto di Cord";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	310;

	damageTotal			=   60;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;

	owner 				= 	SLD_709_CORD;
	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//GORN
//-----------------------------------------------------------
INSTANCE Gorns_Rache (C_Item)
{
	name 				=	"Vendetta di Gorn";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	560;

	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	owner 				=    PC_FIGHTER;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//LARES
//-----------------------------------------------------------
INSTANCE Lares_Axt (C_Item)
{
	name 				=	"Ascia di Lares";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	340;

	damageTotal			=   65;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;

	owner 				= 	ORG_801_LARES;
	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//WOLF
//-----------------------------------------------------------
INSTANCE Wolfs_Bogen (C_Item)
{
	name 				=	"Arco di Wolf";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	200;

	damageTotal			=	35;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;

	owner 				=   ORG_855_WOLF;
	visual 				=	"ItRwLongbow.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//SILAS
//-----------------------------------------------------------
INSTANCE Silas_Axt (C_Item)
{
	name 				=	"Ascia di Silas";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	290;

	damageTotal			=   55;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;

	owner 				=   ORG_841_SILAS;
	visual 				=	"ItMw_1H_Axe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//RICELORD
//-----------------------------------------------------------
INSTANCE Heerscherstab (C_Item)
{
	name 				=	"Scettro";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	150;

	damageTotal			= 	26;
	damagetype 			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;

	owner 				=   BAU_900_RICELORD;
	visual 				=	"ItMw_2H_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

