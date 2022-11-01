// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************

// Items fьr Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Kochцffel, Laborflasche, Roheisen (Schmiede)
const int	Value_MobsiItem			=	3;

// mit 80% kann bei einem kompletten Durchgang ca. 10 Erz verdient werden
const int	Value_SwordBlade		= 	(Value_1H_Sword_01	*8)/10;	// 80% des Fertigen Schwerts
const int	Value_SwordBladeHot		= 	(Value_SwordBlade	*8)/10;	// 80% der geschliffenen Klinge
const int	Value_SwordRawHot		= 	(Value_SwordBladeHot*8)/10; // 80% der geschmiedeten Klinge
const int	Value_SwordRaw			= 	(Value_SwordRawHot	*8)/10; // 80% des erhitzen Rohstahls

const int	Value_Dietrich			=	10;
const int	Value_Schlьssel			=	3;

const int	Value_Joint1			=	8;
const int	Value_Joint2			=	15;
const int	Value_Joint3			=	20;
const int	Value_Laute				=	10;

const int	Value_Erzbrocken		=	1;// UNBEDINGT SO LASSEN!!! M.F.
const int	Value_Fackel			=	2;

const int	Value_Sumpfkraut		=	8;
const int	Value_Pfeife			=	10;
const int	Value_Rasiermesser		=	5;// EX 25 NIEDRIGER WERT WEIL ES VIEL DAVON GIBT!!! 
const int	Value_Mьnze				=	0;// BITTE AUF 0 LASSEN, DAFЬR IST SIE DA, FЬR SONST NIX!!!!! M.F.
const int	Value_Schьssel			=	4;
const int	Value_Kerzenstдnder		=	10;
const int	Value_Becher			=	 4;
const int	Value_Pokal				=	50;
const int	Value_Besteck			=	15;
const int	Value_Pfanne			=	10;
const int	Value_Krug				=	10; //35
const int	Value_Amphore			=	15; //EX 45
const int	Value_Statue			=	15;

// Alchemie-Ingredienzien
// FIXME: noch benutzen? // NEin, aber liegen ьberall ind er Welt, von daher als Ambient Items drinlassen!M.F.
const int	Value_Schwefel			=	20;
const int	Value_Quecksilber		=	25;
const int	Value_Salz				=	10;
const int	Value_Цl				=	15;
const int	Value_Moleratfett		=	5;
const int	Value_Alcohol			=	18;



/*******************************************************************************************
**	Items fьr Mobsi-Benutzung               					  		  				  **
*******************************************************************************************/

/******************************************************************************************/
//	Dietrich
INSTANCE ItKeLockpick (C_Item)
{
	name 				=	"Отмычка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Dietrich;

	visual 				=	"ItKe_Lockpick_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Dietrich;
};

/******************************************************************************************/
//	Schlьssel

// FIXME: aussagekrдftigere Schlьsselnamen?
INSTANCE ItKeKey1(C_Item)
{
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlьssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

/******************************************************************************************/
INSTANCE ItKeKey2(C_Item)
{
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlьssel;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

/******************************************************************************************/
INSTANCE ItKeKey3(C_Item)
{
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlьssel;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

/******************************************************************************************/
INSTANCE ItKeKey4(C_Item)
{
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlьssel;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

/******************************************************************************************/
INSTANCE ItKeCavalorn01(C_Item)
{
	name 				=	"Ключ Кавалорна";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlьssel;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};




/******************************************************************************************/
// Krautstampfen
INSTANCE ItMiStomper (C_Item)
{
	name 				=	"Пресс";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Stomper_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Reparieren
INSTANCE ItMiHammer (C_Item)
{
	name 				=	"Молот";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Hammer_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// im Topf rьhren
INSTANCE ItMiScoop (C_Item)
{
	name 				=	"Черпак";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Scoop_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Labor benutzen
// Fixme: wird dabei ein anderes Item generiert?
INSTANCE ItMiFlask(C_Item)
{
	name 				=	"Бутылочка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItFo_Potion_Mana_02.3ds";
	material 			=	MAT_GLAS;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};


/******************************************************************************************/
//	Items fьr Schmiede	    					 								 		  **

INSTANCE ItMiSwordraw (C_Item)
{
	name 				=	"Сырая сталь";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordraw;

	visual 				=	"ItMi_SmithSword_Raw_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordrawhot (C_Item)
{
	name 				=	"Раскаленная сталь";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordrawhot;

	visual 				=	"ItMi_SmithSword_Rawhot_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordbladehot (C_Item)
{
	name 				=	"Раскаленный клинок";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordbladehot;

	visual 				=	"ItMi_SmithSword_Bladehot_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMiSwordblade	(C_Item)
{
	name 				=	"Клинок";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swordblade;

	visual 				=	"ItMi_SmithSword_Blade_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};




/*******************************************************************************************
**	Items fьr Item-Interaktionen (ohne Mobsi benutzbar)               		 		  	  **
*******************************************************************************************/

// fьr Feuerspucker
INSTANCE ItLsTorchFirespit(C_Item)
{
	name 				=	"Факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	Value_MobsiItem;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	scemeName			=	"FIRESPIT";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
// zum Rumklimpern
INSTANCE ItMiLute (C_Item)
{
	name 				=	"Лютня";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	Value_Laute;

	visual 				=	"ItMi_Lute_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"LUTE";
	on_state[0]			= UseLute;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseLute()
{
	if (Play_Lute == FALSE)
	&& Npc_IsPlayer (self)
	{
		B_GiveXP (10);
		Play_Lute = TRUE;
	};
};


/******************************************************************************************/
// Fьr Babe-Luftzufдcheln
INSTANCE ItMiWedel(C_Item)
{
	name 				=	"Пальмовый веер";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Wedel_01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"COOLAIR";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
// Fьr Babe-Putzen
INSTANCE ItMiBrush(C_Item)
{
	name 				=	"Щетка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Brush_01.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"BRUSH";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
INSTANCE ItMiJoint_1(C_Item)
{
	name 				=	"Новичок";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint1;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_1;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_1()
{
	if (Firstjoint == FALSE)
	&& Npc_IsPlayer (self)
	{
		B_GiveXP (5);
		Firstjoint = TRUE;
	};
};
/******************************************************************************************/
INSTANCE ItMiJoint_2(C_Item)
{
	name 				=	"Северный темный";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint2;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_2;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_2()
{
	if (Secondjoint == FALSE)
	&& Npc_IsPlayer (self)
	{
		B_GiveXP (10);
		Secondjoint = TRUE;
	};
};
/******************************************************************************************/
INSTANCE ItMiJoint_3(C_Item)
{
	name 				=	"Зов мечты";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_3;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_3()
{
	if (Thirdjoint == FALSE)
	&& Npc_IsPlayer (self)
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,2);
		PrintScreen	("Маг. сила +2", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
		Thirdjoint = TRUE;
	};
};

/******************************************************************************************/
INSTANCE ItMiNugget(C_Item)
{
	name 				=	"Кусок руды";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Erzbrocken;

	visual 				=	"ItMi_Nugget_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};




/******************************************************************************************/
//	Fackel			                					  **

INSTANCE ItLsTorch(C_Item)
{
	name 				=	"Факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	Value_Fackel;

	visual 				=	"ItLs_Torch_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};

/******************************************************************************************/
INSTANCE ItLsTorchburning(C_Item)
{
	name 				=	"Горящий факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	0;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

/******************************************************************************************/
INSTANCE ItLsTorchburned(C_Item)
{
	name 				=	"Факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItLs_Torchburned_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};




/******************************************************************************************/
//STUFF//
/******************************************************************************************/

// Sumpfkraut (fьr Joints)
INSTANCE ItMi_Plants_Swampherb_01(C_Item)
{
	name 				=	"Болотник";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfkraut;

	visual 				=	"ItMi_Plants_Swampherb_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Pipe_01 (C_Item)
{
	name 				=	"Трубка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pfeife;

	visual 				=	"ItMi_Stuff_Pipe_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Barbknife_01 (C_Item)
{
	name 				=	"Бритвенный нож";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Rasiermesser;

	visual 				=	"ItMi_Stuff_Barbknife_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_OldCoin_01 (C_Item)
{
	name 				=	"Монета";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Mьnze;

	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//	Mьnze mit Mission Flag um tote liegenzulassen
INSTANCE ItMi_Stuff_OldCoin_02 (C_Item)
{
	name 				=	"Монета";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Mьnze;

	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Plate_01 (C_Item)
{
	name 				=	"Тарелка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Schьssel;

	visual 				=	"ItMi_Stuff_Plate_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Candel_01 (C_Item)
{
	name 				=	"Подсвечник";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Kerzenstдnder;

	visual 				=	"ItMi_Stuff_Candel_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Cup_01 (C_Item)
{
	name 				=	"Кубок";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Becher;

	visual 				=	"ItMi_Stuff_Cup_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Cup_02 (C_Item)
{
	name 				=	"Бокал";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pokal;

	visual 				=	"ItMi_Stuff_Cup_02.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Silverware_01 (C_Item)
{
	name 				=	"Набор";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Besteck;

	visual 				=	"ItMi_Stuff_Silverware_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Pan_01 (C_Item)
{
	name 				=	"Сковорода";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pfanne;

	visual 				=	"ItMi_Stuff_Pan_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Mug_01 (C_Item)
{
	name 				=	"Кружка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Krug;

	visual 				=	"ItMi_Stuff_Mug_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Amphore_01 (C_Item)
{
	name 				=	"Амфора";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Amphore;

	visual 				=	"ItMi_Stuff_Amphore_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Idol_Ogront_01 (C_Item)
{
	name 				=	"Статуя";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Statue;

	visual 				=	"ItMi_Stuff_Idol_Ogront_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
//ALCHIMIE//
/******************************************************************************************/
INSTANCE ItMi_Alchemy_Sulphur_01 (C_Item)
{
	name 				=	"Сера";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Schwefel;

	visual 				=	"ItMi_Alchemy_Sulphur_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Quicksilver_01 (C_Item)
{
	name 				=	"Ртуть";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Quecksilber;

	visual 				=	"ItMi_Alchemy_Quicksilver_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Salt_01 (C_Item)
{
	name 				=	"Соль";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Salz;

	visual 				=	"ItMi_Alchemy_Salt_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Syrianoil_01 (C_Item)
{
	name 				=	"Сирийское масло";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Цl;

	visual 				=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Moleratlubric_01 (C_Item)
{
	name 				=	"Жир кротокрыса";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Moleratfett;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Alchemy_Alcohol_01 (C_Item)
{
	name 				=	"Чистый спирт";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Alcohol;

	visual 				=	"ItMi_Alchemy_Alcohol_01.3DS";
	material 			=	MAT_CLAY;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};




/*******************************************************************************************
**	Musikinstrumente InExtremo    					  		  							  **
*******************************************************************************************/

// Werden nicht gebraucht, wenn den Jungs die Instrumente in der Hand "kleben"!
/*
INSTANCE ItMiLuteIE (C_Item)
{
	name 				=	"Laute";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Lute_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

INSTANCE ItMiBluepipe(C_Item)
{
	name 				=	"Dudelsack";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Bagpipe_Blue_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

INSTANCE ItMiYellowpipe (C_Item)
{
	name 				=	"Dudelsack";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Bagpipe_Yellow_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

INSTANCE ItMiDrumscheit (C_Item)
{
	name 				=	"Drumscheit";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Drumscheit_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

INSTANCE ItMiDrumstick (C_Item)
{
	name 				=	"Trommelstцcke";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Drumstick_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

INSTANCE ItMiCello (C_Item)
{
	name 				=	"Cello";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Cello_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

INSTANCE ItMiCellobow (C_Item)
{
	name 				=	"Cello Bogen";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Cellobow_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

INSTANCE ItMiHarp (C_Item)
{
	name 				=	"Harfe";

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	1;

	visual 				=	"ItMi_Harp_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlьssel;
};

*/
