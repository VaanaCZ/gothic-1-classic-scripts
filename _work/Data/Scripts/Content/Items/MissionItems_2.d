//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Karte für 1. Fokus
//---------------------------------------------------------------------
INSTANCE ItWrFocusmapPsi(C_Item)
{	
	name 			=	"Y´Berionova mapa ohnisek";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	15;

	visual 			=	"ItWr_Map_01.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseFocusmapPsi;

	description		= name;
	TEXT[1]			= "Tato mapa znaèí cestu k ohniskovému";
	TEXT[2]			= "kameni, která Y´Berion potøebuje";
	TEXT[3]			= "k vyzývání Spáèe.";
};

	FUNC VOID UseFocusmapPsi()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World_FocusPSI.tga", 	1	);  //  1 -> DO NOT SCALE 

					Doc_Show		( nDocID 	);
	};

//---------------------------------------------------------------------
//	Fokus 1 - (Meeresklippe)
//---------------------------------------------------------------------
INSTANCE Focus_1(C_Item)
{	
	name 				=	"Ohnisko z moøských útesù";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Jeden z pìti ohniskových kamenù,";
	TEXT[2]				=	"které byly použity k vytvoøení magické Bariéry.";
};

//---------------------------------------------------------------------
//	Zahnrad für Ian
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Gearwheel_01(C_Item)
{	
	name 				=	"Ozubené kolo!";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Je z rozbité drtièky rudy, která";
	TEXT[1]				=	"zùstala v opuštìné postranní chodbì";
	TEXT[2]				=	"Starého dolu.";
};

//---------------------------------------------------------------------
//	Minecrawler-Ei
//---------------------------------------------------------------------
INSTANCE ItAt_Crawlerqueen(C_Item)
{	
	name 					=	"Vajíèko dùlního èerva";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ItAt_Crawlerqueen.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Tato vajíèka snesla královna";
	TEXT[1]					=	"dùlních èervù.";
	TEXT[2]					=	"Obsahují daleko silnìjší výtažek než";
	TEXT[3]					=	"obyèejné èelisti dùlních èervù.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

//---------------------------------------------------------------------
//	Almanach / Fokusbuch
//---------------------------------------------------------------------
INSTANCE ItWrFokusbuch(C_Item)
{	
	name 					=	"Rukopis";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	UseItWrFokusbuch;
	description				=	name;
	TEXT[0]					=	"V této prastaré knize je pár";
	TEXT[1]					=	"kouzelných zaøíkadel, která se vztahují";
	TEXT[2]					=	"k použití takzvaných ohniskových kamenù.";
};
	FUNC VOID UseItWrFokusbuch()
	{   
				
					if (Wissen_Almanach == FALSE)
					&& Npc_IsPlayer (self)
					{
						B_GiveXP (50);
						Wissen_Almanach = TRUE;
					};
				
					var int			nDocID;	
					nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"Kapitola 23");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,"Koncentrace sil");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Síla zakletá v kameni neustále narùstá a uvolní se prostøednictvím kouzelnického zaøíkadla. Jestli bude její úèinek trvalý èi okamžitý, to záleží na vlastním rozvážení. ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Jakmile se jednou síla uvolní, ohniskový kámen je zproštìn veškeré síly a není nièím než prázdnou skoøápkou.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Slova, která musí být pro uvolnìní síly z ohniska pronesena, jsou známa mnohým znalcùm tajemných sil. Dokonce i schopnost vybavit nový artefakt kouzelnou mocí se již stalo spíše bìžnou kouzelnickou praxí než tajnou vìdou.");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Avšak jen nemnozí mají znalosti, kterých je tøeba k obnovì síly použitého ohniskového kamene. Tento magický svitek starých dob je znamením tìch nejvìtších schopností.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"A nyní, ty, jenž jsi vyvolený, otevøi svoji mysl tìm slovùm pradávné moci.");
					
					Doc_Show		( nDocID );
	};
