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
	name 			=	"Mapa del foco de Y'Berion";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	15;

	visual 			=	"ItWr_Map_01.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseFocusmapPsi;

	description		= name;
	TEXT[1]			= "Este mapa muestra el camino hasta el foco";
	TEXT[2]			= "de piedra que Y'Berion necesita para";
	TEXT[3]			= "invocar al Durmiente.";
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
	name 				=	"Foco del Acantilado del Océano";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Uno de los cinco focos de piedra";
	TEXT[2]				=	"utilizados para crear la Barrera Mágica.";
};

//---------------------------------------------------------------------
//	Zahnrad für Ian
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Gearwheel_01(C_Item)
{	
	name 				=	"Rueda dentada";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Pertenece a una trituradora de mineral rota";
	TEXT[1]				=	"que se quedó en un túnel lateral abandonado";
	TEXT[2]				=	"de la Vieja Mina.";
};

//---------------------------------------------------------------------
//	Minecrawler-Ei
//---------------------------------------------------------------------
INSTANCE ItAt_Crawlerqueen(C_Item)
{	
	name 					=	"Huevos de reptador de la mina";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ItAt_Crawlerqueen.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Estos huevos fueron puestos por una reina";
	TEXT[1]					=	"reptadora de la mina.";
	TEXT[2]					=	"Contienen una secreción mucho más potente";
	TEXT[3]					=	"que las mandíbulas de un espécimen normal.";
	TEXT[5]					=	NAME_Value;					COUNT[5]	= value;
};

//---------------------------------------------------------------------
//	Almanach / Fokusbuch
//---------------------------------------------------------------------
INSTANCE ItWrFokusbuch(C_Item)
{	
	name 					=	"Almanaque";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				= 	UseItWrFokusbuch;
	description				=	name;
	TEXT[0]					=	"Este antiguo libro de magia contiene algunas";
	TEXT[1]					=	"fórmulas mágicas, todas ellas referidas al ";
	TEXT[2]					=	"uso de los llamados focos de piedra.";
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
					Doc_PrintLine	( nDocID,  0,"Capítulo 23");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,"El enfoque de poderes");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"El poder inherente a la piedra aumenta continuamente y es liberado por las palabras del mago. Queda a su discreción que sea duradero o surja de una sola vez.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Pero una vez liberado, el foco queda sin poder, reducido a una mera cáscara vacía.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Las palabras que han de pronunciarse para liberar el poder del foco están a disposición de muchos artistas del poder arcano. Incluso la concesión de poderes mágicos a un artefacto es ya más una costumbre que un secreto de los entendidos.");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Pero sólo unos elegidos saben qué hace falta para recargar un foco de piedra usado. Esta fórmula de tiempos pasados es prueba de un gran don.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Ahora, oh entendido, abre tu mente a las palabras del antiguo poder.");
					
					Doc_Show		( nDocID );
	};
