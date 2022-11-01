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
	name 			=	"Mapa od Y'Beriona";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	15;

	visual 			=	"ItWr_Map_01.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseFocusmapPsi;

	description		= name;
	TEXT[1]			= "Ta mapa wskazuje położenie kamienia";
	TEXT[2]			= "ogniskującego, który pozwoli";
	TEXT[3]			= "Y'Berionowi wezwać Śniącego.";
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
	name 				=	"Kamień z morskiego klifu";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Jeden z pięciu artefaktów użytych";
	TEXT[2]				=	"przy tworzeniu Bariery.";
};

//---------------------------------------------------------------------
//	Zahnrad für Ian
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Gearwheel_01(C_Item)
{	
	name 				=	"Koło zębate";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Pochodzi z uszkodzonego rozdrabniacza";
	TEXT[1]				=	"porzuconego w bocznym tunelu";
	TEXT[2]				=	"Starej Kopalni.";
};

//---------------------------------------------------------------------
//	Minecrawler-Ei
//---------------------------------------------------------------------
INSTANCE ItAt_Crawlerqueen(C_Item)
{	
	name 					=	"Jajo pełzacza";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ItAt_Crawlerqueen.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Te jaja zostały złożone przez";
	TEXT[1]					=	"królową pełzaczy.";
	TEXT[2]					=	"Zawierają o wiele silniejszą wydzielinę,";
	TEXT[3]					=	"niż wnętrzności dorosłych osobników.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

//---------------------------------------------------------------------
//	Almanach / Fokusbuch
//---------------------------------------------------------------------
INSTANCE ItWrFokusbuch(C_Item)
{	
	name 					=	"Almanach";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	UseItWrFokusbuch;
	description				=	name;
	TEXT[0]					=	"Ta starożytna, magiczna księga zawiera";
	TEXT[1]					=	"fragmenty traktujące o wykorzystaniu";
	TEXT[2]					=	"mocy kamieni ogniskujących.";
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
					Doc_PrintLine	( nDocID,  0,"Rozdział 23");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,"Ogniskowanie mocy");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Magia skumulowana w kamieniu ulega wielokrotnemu wzmocnieniu zanim wyzwolą ją słowa zaklęcia. To, czy efekt będzie trwały czy tylko chwilowy, zależy wyłącznie od maga.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Tym samym, po wyzwoleniu energii, kamień staje się jeno pustą, pozbawioną mocy skorupą.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Słowa, które należy wypowiedzieć, aby uwolnić moc kamienia, nie powinny być zagadką dla większości adeptów sztuk magicznych. W dzisiejszych czasach, nawet formuły pozwalające tchnąć magię w nowy artefakt spowszedniały.");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Ale tylko nieliczni mają umiejętności potrzebne do ponownego naładowania kamienia. Te prastare formuły są pilnie strzeżonym sekretem arcymistrzów magii.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Zatem, Mędrcze - otwórz swą duszę na słowa starożytnej potęgi.");
					
					Doc_Show		( nDocID );
	};
