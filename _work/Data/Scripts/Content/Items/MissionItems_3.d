//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	1. Pergamenth�lfte der Ork-Schriftrolle
//---------------------------------------------------------------------
INSTANCE OrkParchmentOne(C_Item)
{	
	name 				=	"Po�owa pergaminu";

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
	TEXT[0]				= "Fragment staro�ytnego pergaminu.";
	TEXT[1]				= "Dolna po�owa zosta�a oderwana.";
	TEXT[2]				= "Pismo przypomina runy zdobi�ce";
	TEXT[3] 			= "�ciany jaskini.";
};

//---------------------------------------------------------------------
//	2. Pergamenth�lfte der Ork-Schriftrolle
//---------------------------------------------------------------------
INSTANCE OrkParchmentTwo(C_Item)
{	
	name 				=	"Po�owa pergaminu";

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
	TEXT[0]				= "Fragment staro�ytnego pergaminu.";
	TEXT[1]				= "G�rna po�owa zosta�a oderwana.";
	TEXT[2]				= "Pismo przypomina runy zdobi�ce";
	TEXT[3] 			= "�ciany jaskini.";
};

//---------------------------------------------------------------------
//	Schl�ssel zu Kaloms Truhe
//---------------------------------------------------------------------
INSTANCE ITKE_PSI_KALOM_01(C_Item)
{	
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= "Klucz do laboratorium.";
	TEXT[0]				= "Otwiera skrzyni� w laboratorium";
	TEXT[1]				= "alchemicznym w obozie Bractwa.";
	//TEXT[1]				= "";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Fokuskarte
//---------------------------------------------------------------------
INSTANCE ItWrFocimap(C_Item)
{	
	name 					=	"Mapa od Saturasa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	15;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseFocimap;

	description				= name;
	TEXT[0]					= "Rogi pentagramu znacz�";
	TEXT[1]					= "po�o�enie wszystkich pi�ciu";
	TEXT[2]					= "kamieni ogniskuj�cych, u�ytych do";
	TEXT[3]					= "stworzenia Bariery. Mapa jest bardzo";
	TEXT[4]					= "stara i kamienie mog�y ju� zosta�";
	TEXT[5]					= "przeniesione w inne miejsce.";
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
	name 				=	"Strona z dziennika";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseTroll;

	description			=	name;
	TEXT[1]				=	"Bardzo zniszczona strona.";
	TEXT[2]				=	"Pismo ledwie mo�na rozpozna�.";
	TEXT[3]				=	"Poprzedni w�a�ciciel by� najwyra�niej";
	TEXT[4]				=	"�owc� trolli.";
};

FUNC VOID UseTroll()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0,"Dzie� 169");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Dzi� mi si� uda, jestem pewien. Bogowie b�d� mi sprzyjali. Wypr�bowa�em ju� wszystko: najtwardsza stal p�ka w zetkni�ciu z tward� sk�r� trolla, strza�y po prostu odbijaj� si� od niego.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Teraz jednak wykorzystam magiczne zakl�cie, kt�re kupi�em od kupca w Khorinis. Zap�aci�em za nie s�on� cen�, ale my�liwskie trofea, kt�re zdob�d� przy jego u�yciu, odp�ac� mi wszystko z nawi�zk�.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Dzisiaj zabij� trolla.");
				Doc_Show		(nDocID);
};

//---------------------------------------------------------------------
//	Fokus 2 - (Trollschlucht)
//---------------------------------------------------------------------
INSTANCE Focus_2(C_Item)
{	
	name 				=	"Kamie� z kanionu trolli";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Jeden z pi�ciu artefakt�w u�ytych";
	TEXT[2]				=	"przy tworzeniu Bariery.";
};

//---------------------------------------------------------------------
//	Truhenschl�ssel in der Bergfestung
//---------------------------------------------------------------------
INSTANCE ItKe_BERG_01(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Opuszczona g�rska forteca.";
	TEXT[1]				= "Zardzewia�y klucz do skrzyni.";
	TEXT[2]				= " ";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Urkunde in der Bergfestung
//---------------------------------------------------------------------
INSTANCE ItWr_Urkunde_01(C_Item)
{	
	name 			=	"Dokument";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	0;

	value 			=	15;

	visual 			=	"ItWr_Scroll_01.3DS";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseUrkunde;
	description		=	"Akt w�asno�ci.";
	TEXT[0]			=	"Nadaje w�a�cicielowi prawo do";
	TEXT[1]			=	"ziem, na kt�rych le�y forteca.";
	TEXT[2]			=	" ";
	TEXT[5]			=	"Warto��                                 400 funt�w z�ota";
};

FUNC VOID UseUrkunde()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0,"Dokument");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Ja, Bergmar, Burgrabia Zachodnich Terytori�w i s�dzia z nadania mojego Mi�o�ciwego Pana, Lorda Tymorisin, teren�w wok� Khorinis... Niniejszym o�wiadczam, �e... przekazuj� posiadaczowi tego dokumentu... i domowi Innosa ziemie przynale�ne tej fortecy wraz z ca�ym lennem i nale��cymi do nich kopalniami za 400 funt�w z�ota.");
				Doc_Show		(nDocID );
};
	
//---------------------------------------------------------------------
//	Fakescroll (Bergfestung)
//---------------------------------------------------------------------
INSTANCE Fakescroll(C_Item)
{	
	name 					=	"List";

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
	name 				=	"Kamie� z g�rskiej fortecy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Jeden z pi�ciu artefakt�w u�ytych";
	TEXT[2]				=	"przy tworzeniu Bariery.";
};

//---------------------------------------------------------------------
//	Schl�ssel zum Bonusraum in der Klosterruine
//---------------------------------------------------------------------
INSTANCE ItKe_Focus4(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Ten klucz pochodzi z jaskini";
	TEXT[2]				= "przed ruinami klasztoru.";
};

//---------------------------------------------------------------------
//	Fokus 4 - (Klosterruine)
//---------------------------------------------------------------------
INSTANCE Focus_4(C_Item)
{	
	name 				=	"Kamie� ze starego klasztoru";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;
	description			=	name;
	TEXT[1]				=	"Jeden z pi�ciu artefakt�w u�ytych";
	TEXT[2]				=	"przy tworzeniu Bariery.";
};

//---------------------------------------------------------------------
//	OrkTalisman unter Steinkreis
//---------------------------------------------------------------------
INSTANCE  ItMi_OrcTalisman(C_Item)
{
	name 			= "Talizman ork�w";

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
//	Schl�ssel unter dem Steinkreis
//---------------------------------------------------------------------
INSTANCE ItKe_Focus5(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Ten klucz pochodzi z krypty";
	TEXT[2]				= "pod kamiennym kr�giem.";
};

//---------------------------------------------------------------------
//	Fokus 5 - (Steinkreis)
//---------------------------------------------------------------------
INSTANCE Focus_5(C_Item)
{	
	name 				=	"Kamie� z kamiennego kr�gu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;
	description			=	name;
	TEXT[1]				=	"Jeden z pi�ciu artefakt�w u�ytych";
	TEXT[2]				=	"przy tworzeniu Bariery.";
};

