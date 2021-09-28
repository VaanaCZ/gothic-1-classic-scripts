//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Karte fьr 1. Fokus
//---------------------------------------------------------------------
INSTANCE ItWrFocusmapPsi(C_Item)
{	
	name 			=	"Карта Юбериона";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	15;

	visual 			=	"ItWr_Map_01.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseFocusmapPsi;

	description		= name;
	TEXT[1]			= "На этой карте отмечена дорога";
	TEXT[2]			= "к юнитору, который нужен Юбериону";
	TEXT[3]			= "для вызова Спящего.";
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
	name 				=	"Юнитор со скалы";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Один из пяти юниторов, которые были";
	TEXT[2]				=	"использованы для создания магического Барьера.";
};

//---------------------------------------------------------------------
//	Zahnrad fьr Ian
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Gearwheel_01(C_Item)
{	
	name 				=	"Шестеренка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Она находилась в старом прессе,";
	TEXT[1]				=	"в одной из покинутых штолен";
	TEXT[2]				=	"Старой шахты.";
};

//---------------------------------------------------------------------
//	Minecrawler-Ei
//---------------------------------------------------------------------
INSTANCE ItAt_Crawlerqueen(C_Item)
{	
	name 					=	"Яйцо ползуна";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ItAt_Crawlerqueen.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Эти яйца отложила";
	TEXT[1]					=	"королева ползунов.";
	TEXT[2]					=	"Они содержат вещество,";
	TEXT[3]					=	"которое гораздо сильнее слюны ползунов.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

//---------------------------------------------------------------------
//	Almanach / Fokusbuch
//---------------------------------------------------------------------
INSTANCE ItWrFokusbuch(C_Item)
{	
	name 					=	"Альманах";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	UseItWrFokusbuch;
	description				=	name;
	TEXT[0]					=	"Эта древняя волшебная книга содержит";
	TEXT[1]					=	"множество заклинаний, которые читаются";
	TEXT[2]					=	"при использовании юниторов.";
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
					Doc_PrintLine	( nDocID,  0, "Глава 23"			);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "Объединение силы");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Постоянно растущая магическая энергия, которую содержат камни, освобождается во время чтения заклинания. Будет ли это происходить постепенно или за один раз, решать магу.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Как только юнитор лишится энергии, он станет пустым.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Rдnder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1, "Слова силы, которые позволят освободить энергию юнитора, может прочитать любой маг, знающий древние магические арканы. Он также сможет зарядить этой энергией новый артефакт. Это гораздо легче, чем познание тайн мудрых.");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,  "Но зарядить пустой юнитор сможет только избранный. Это служит знаком высочайшего дара богов." );
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "А теперь освободи свое сердце, чтобы принять слова древней силы.");
					
					Doc_Show		( nDocID );
	};
