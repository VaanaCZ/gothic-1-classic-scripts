//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Buch über Golems
//---------------------------------------------------------------------
INSTANCE ItWr_GolemBook1(C_Item)
{	
	name 					=	"Arcanum Golum - Volumen I";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseGolemBook1;
};

	FUNC VOID UseGolemBook1()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
		Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
		
		//1.Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0,"ARCANUM GOLUM- Volumen I");
		Doc_PrintLine	( nDocID,  0, "=====================");
		Doc_PrintLines	( nDocID,  0,"(Magia de los Gólems)");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0,"Sólo el que se ha enfrentado a estas criaturas de los elementos puede comprender cuánto respeto pueden imponer estos monstruos mágicos a los trotamundos audaces.");
		Doc_PrintLine	( nDocID,  0, "");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1,"Gólem de piedra");
		Doc_PrintLine	( nDocID,  1,"------------");
		Doc_PrintLines	( nDocID,  1,"Estos colosos de piedra son casi invulnerables en combate. Espadas, hachas y arcos no parecen infligir daño a estos monstruos.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1,"El único informe verosímil de una batalla contra tal leviatán fue escrito por un mercenario. Éste dijo que el golpe contundente de un martillo de guerra agrietó al gólem hasta que lo reventó.");

		Doc_Show		( nDocID );
	};

INSTANCE ItWr_GolemBook2(C_Item)
{	
	name 					=	"Arcanum Golum - Volumen II";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseGolemBook2;
};

	FUNC VOID UseGolemBook2()
	{   
		var int nDocID;
		
		nDocID =
		Doc_Create		()			  ;							// DocManager 
		Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

		Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
		Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
		Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 

		//1. Seite
		Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
		Doc_PrintLine	( nDocID,  0,"ARCANUM GOLUM- Volumen II");
		Doc_PrintLine	( nDocID,  0, "======================");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLine	( nDocID,  0,"Gólem de hielo");
		Doc_PrintLine	( nDocID,  0,"---------");
		Doc_PrintLines	( nDocID,  0,"Los gólems de hielo están relacionados con los de piedra, aunque su sustancia física parece ser agua. Cualquier arma corriente parece resbalar en la superficie de esta gélida criatura.");
		Doc_PrintLines	( nDocID,  0,"Los trotamundos audaces también han de cuidarse de su aliento gélido, pues rodeará a los incautos con una columna de hielo.");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLines	( nDocID,  1,"Un Mago del Fuego contó su encuentro con una de estas criaturas, pero al parecer no la consideró una amenaza.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1,"Gólem de fuego");
		Doc_PrintLine	( nDocID,  1,"------------");
		Doc_PrintLines	( nDocID,  1,"Según se afirma, estas criaturas ardientes pueden incendiar a sus víctimas con sólo tocarlas.");
		Doc_PrintLines	( nDocID,  1,"Hace sólo un año que un grupo de cazadores se encontró con una de estas montañas de ascuas andantes. No se sabe qué sucedió, pero parece que los relámpagos y el hielo surtían cierto efecto en la infernal criatura.");
		Doc_Show		( nDocID );
	};

//---------------------------------------------------------------------
//	Karte der Oberwelt (mit Ork-Gebiet)
//---------------------------------------------------------------------
INSTANCE ItWrWorldmap_Orc(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	250;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmap_Orc;

	description				= "Mapa de la Colonia (complementado)";
	TEXT[0]					= "Ur-Shak, el Chamán Orco, ¡ha esbozado";
	TEXT[1]					= "el territorio de su raza!";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmap_Orc()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World_Orc.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};
//---------------------------------------------------------------------
//	Schlüssel zur Freien Mine
//---------------------------------------------------------------------
INSTANCE ItKe_Freemine(C_Item)
{	
	name 					=	"Llave de la Mina Libre";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	value 					=	3;

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;
	description			= "Llave de la Mina Libre";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Medizin für den verwundeten Orc in der Freien Mine
//---------------------------------------------------------------------
INSTANCE	OrcMedicine(C_ITEM)
{
	name 				= "Medicina orca";

	mainflag 			= ITEM_KAT_POTIONS;
	flags 				= ITEM_MISSION;

	value 				= 0;	


	visual 				= "ITFO_POTION_STRENGTH_01.3DS";
	material 			= MAT_GLAS;
	on_state[0]			= UseOrcMedicine;
	scemeName			= "POTION";
	description			= name;

	TEXT[0]				= "Efecto: desconocido";
};
func void UseOrcMedicine ()
{
	if (C_NpcIsOrc(self))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		Npc_ChangeAttribute	(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	};
};

//---------------------------------------------------------------------
//	Ulu-Mulu (verschafft Zutritt zur Orkstadt)
//---------------------------------------------------------------------
INSTANCE UluMulu(C_Item)
{	
	name 			=	"Ulu-Mulu";

	mainflag 		=	ITEM_KAT_NF;
	flags 			=	ITEM_2HD_AXE|ITEM_MISSION;	

	value 			=	1000;
	
	damageTotal		= 	35;
	damagetype		=	DAM_EDGE;
	range    		=  	140;		
	cond_atr[2]   	= 	ATR_STRENGTH;
	cond_value[2]  	= 	30;

	visual 			=	"ItMi_Amulet_Ulumulu_02.3ds";
	
	visual_skin 	=	0;
	material 		=	MAT_METAL;
	
	description		=	name;
	TEXT[0]			=	"El Ulu-Mulu es un signo de gran fuerza y ";
	TEXT[1]			=	"solemnidad. ¡El portador del estandarte no";
	TEXT[2]			=	"será atacado por los orcos!";
	TEXT[3]			=	NAME_Damage;			COUNT[3]	= damageTotal;
	TEXT[4] 		=	NAME_Str_needed;		COUNT[4]	= cond_value[2];
	TEXT[5]			=	NAME_Value; 			COUNT[5]	= value;
};

