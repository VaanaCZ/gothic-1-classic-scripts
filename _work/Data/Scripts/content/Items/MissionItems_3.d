//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	1. Pergamenthдlfte der Ork-Schriftrolle
//---------------------------------------------------------------------
INSTANCE OrkParchmentOne(C_Item)
{	
	name 				=	"Обрывок свитка";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;	

	hp 					=	5;
	hp_max 				=	5;
	weight 				=	1;
	value 				=	3;

	visual 				=	"ItWr_Scroll_02.3ds";
	material 			=	MAT_LEATHER;
	
	scemeName			=	"MAP";	
	description			= name;
	TEXT[0]				= "Кажется, не хватает нижней половины.";
	TEXT[1]				= "Письмена этого свитка очень похожи";
	TEXT[2]				= "на руны, написанные на стенах пещеры.";
	TEXT[3] 			= "";
};

//---------------------------------------------------------------------
//	2. Pergamenthдlfte der Ork-Schriftrolle
//---------------------------------------------------------------------
INSTANCE OrkParchmentTwo(C_Item)
{	
	name 				=	"Обрывок свитка";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;	

	hp 					=	5;
	hp_max 				=	5;
	weight 				=	1;
	value 				=	3;

	visual 				=	"ItWr_Scroll_02.3ds";
	material 			=	MAT_LEATHER;
	
	scemeName			=	"MAP";	
	description			= name;
	TEXT[0]				= "Кажется, у этого свитка";
	TEXT[1]				= "оторвана верхняя половина.";
	TEXT[2]				= "Его письмена очень похожи";
	TEXT[3] 			= "на руны, написанные на стенах пещеры.";
};

//---------------------------------------------------------------------
//	Schlьssel zu Kaloms Truhe
//---------------------------------------------------------------------
INSTANCE ITKE_PSI_KALOM_01(C_Item)
{	
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= "Ключ из лаборатории";
	TEXT[0]				= "Открывает сундук в алхимической лаборатории";
	TEXT[1]				= "Болотного лагеря.";
	//TEXT[1]				= "";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Fokuskarte
//---------------------------------------------------------------------
INSTANCE ItWrFocimap(C_Item)
{	
	name 					=	"Карта Сатураса";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	15;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseFocimap;

	description				= name;
	TEXT[0]					= "Вершины пентаграммы отмечают";
	TEXT[1]					= "места, в которых находятся пять юниторов,";
	TEXT[2]					= "которые использовались при создании";
	TEXT[3]					= "магического Барьера. Карта очень старая,";
	TEXT[4]					= "и, возможно, сейчас юниторы находятся";
	TEXT[5]					= "в других местах.";
};

FUNC VOID UseFocimap()
{
	var int nDocID;
	
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
				Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
				Doc_SetPages	( nDocID, 1 );                         
				Doc_SetPage 	( nDocID, 0, "Map_World_Foki.tga", 	1	);  //  1 -> DO NOT SCALE 

				Doc_Show		( nDocID 	);
};

//---------------------------------------------------------------------
//	Tagebuch in Trollschlucht
//---------------------------------------------------------------------
INSTANCE ItWr_Troll_01(C_Item)
{	
	name 				=	"Страница дневника";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseTroll;

	description			=	name;
	TEXT[1]				=	"Сильно помятая страница. Записи на ней";
	TEXT[2]				=	"едва различимы.";
	TEXT[3]				=	"Кажется, ее владелец был охотником";
	TEXT[4]				=	"на троллей.";
};

FUNC VOID UseTroll()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "День 169.");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Сегодня у меня точно все получится. Я это знаю, боги помогут мне. Я испробовал все, чтобы убить тролля. Его шкуру не пробивает даже самый острый клинок, а стрелы отскакивают от него, как от камня.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Но теперь у меня есть волшебный свиток. Я выменял его у одного торговца из Хориниса. 50 золотых монет, конечно, высокая цена, но он того стоил.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Сегодня я убью тролля.");
				Doc_Show		(nDocID);
};

//---------------------------------------------------------------------
//	Fokus 2 - (Trollschlucht)
//---------------------------------------------------------------------
INSTANCE Focus_2(C_Item)
{	
	name 				=	"Юнитор из ущелья тролля";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Один из пяти юниторов, которые использовались";
	TEXT[2]				=	"для создания магического Барьера.";
};

//---------------------------------------------------------------------
//	Truhenschlьssel in der Bergfestung
//---------------------------------------------------------------------
INSTANCE ItKe_BERG_01(C_Item)
{	
	name 				=	"Ключ от сундука";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Ржавый ключ";
	TEXT[1]				= "от сундука";
	TEXT[2]				= "в горном форте.";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Urkunde in der Bergfestung
//---------------------------------------------------------------------
INSTANCE ItWr_Urkunde_01(C_Item)
{	
	name 			=	"Завещание";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	0;

	value 			=	15;

	visual 			=	"ItWr_Scroll_01.3DS";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseUrkunde;
	description		=	"Завещание";
	TEXT[0]			=	"Владелец этого документа";
	TEXT[1]			=	"может заявить о своих правах";
	TEXT[2]			=	"на форт и прилегающие земли.";
	TEXT[5]			=	"Цена                400 фунтов золотом";
};

FUNC VOID UseUrkunde()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0, "Завещание");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Я, Бергмар, граф, владелец земель до западного леса и наделов до Тимориса, которые находятся в землях Хориниса... завещаю... что я... владельцу данного документа... и дому Инноса мой феод с горным фортом (с положенной мне десятиной и всеми находящимися на этой земле шахтами) купленным за 400 фунтов золотом.");
				Doc_Show		(nDocID );
};
	
//---------------------------------------------------------------------
//	Fakescroll (Bergfestung)
//---------------------------------------------------------------------
INSTANCE Fakescroll(C_Item)
{	
	name 					=	"Письмо";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;
	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAPSEALED";	
	
	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

//---------------------------------------------------------------------
//	Fokus 3 - (Bergfestung)
//---------------------------------------------------------------------
INSTANCE Focus_3(C_Item)
{	
	name 				=	"Юнитор из горного форта";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Один из пяти юниторов, которые использовались";
	TEXT[2]				=	"для создания магического Барьера.";
};

//---------------------------------------------------------------------
//	Schlьssel zum Bonusraum in der Klosterruine
//---------------------------------------------------------------------
INSTANCE ItKe_Focus4(C_Item)
{
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Это ключ из";
	TEXT[2]				= "пещеры в разрушенном монастыре.";
};

//---------------------------------------------------------------------
//	Fokus 4 - (Klosterruine)
//---------------------------------------------------------------------
INSTANCE Focus_4(C_Item)
{	
	name 				=	"Юнитор из разрушенного монастыря";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;
	description			=	name;
	TEXT[1]				=	"Один из пяти юниторов, которые использовались";
	TEXT[2]				=	"для создания магического Барьера.";
};

//---------------------------------------------------------------------
//	OrkTalisman unter Steinkreis
//---------------------------------------------------------------------
INSTANCE  ItMi_OrcTalisman(C_Item)
{
	name 			= "Талисман орков";

	mainflag 		= ITEM_KAT_MAGIC;
	flags 			= ITEM_AMULET|ITEM_MISSION;

	value 			= 1000;

	visual 			= "ItMi_Amulet_UluMulu_01.3ds";

	visual_skin 	= 0;
	material 		= MAT_METAL;

	on_equip		= Equip_OrcTalisman;
	on_unequip		= UnEquip_OrcTalisman;

	description		= name;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 20;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_OrcTalisman()
{
 	self.protection [PROT_FIRE] += 20;
};


FUNC VOID UnEquip_OrcTalisman()
{
	self.protection [PROT_FIRE] -= 20;
};


//---------------------------------------------------------------------
//	Schlьssel unter dem Steinkreis
//---------------------------------------------------------------------
INSTANCE ItKe_Focus5(C_Item)
{
	name 				=	"Ключ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Это ключ из склепа";
	TEXT[2]				= "внутри каменного кольца.";
};

//---------------------------------------------------------------------
//	Fokus 5 - (Steinkreis)
//---------------------------------------------------------------------
INSTANCE Focus_5(C_Item)
{	
	name 				=	"Юнитор из каменного кольца";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;
	description			=	name;
	TEXT[1]				=	"Один из пяти юниторов, которые использовались";
	TEXT[2]				=	"для создания магического Барьера.";
};

