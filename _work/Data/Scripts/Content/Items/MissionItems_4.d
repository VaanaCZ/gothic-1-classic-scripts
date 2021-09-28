//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Buch �ber Golems
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
		Doc_PrintLines	( nDocID,  0,"(Magia de los G�lems)");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0,"S�lo el que se ha enfrentado a estas criaturas de los elementos puede comprender cu�nto respeto pueden imponer estos monstruos m�gicos a los trotamundos audaces.");
		Doc_PrintLine	( nDocID,  0, "");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1,"G�lem de piedra");
		Doc_PrintLine	( nDocID,  1,"------------");
		Doc_PrintLines	( nDocID,  1,"Estos colosos de piedra son casi invulnerables en combate. Espadas, hachas y arcos no parecen infligir da�o a estos monstruos.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1,"El �nico informe veros�mil de una batalla contra tal leviat�n fue escrito por un mercenario. �ste dijo que el golpe contundente de un martillo de guerra agriet� al g�lem hasta que lo revent�.");

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
		Doc_PrintLine	( nDocID,  0,"G�lem de hielo");
		Doc_PrintLine	( nDocID,  0,"---------");
		Doc_PrintLines	( nDocID,  0,"Los g�lems de hielo est�n relacionados con los de piedra, aunque su sustancia f�sica parece ser agua. Cualquier arma corriente parece resbalar en la superficie de esta g�lida criatura.");
		Doc_PrintLines	( nDocID,  0,"Los trotamundos audaces tambi�n han de cuidarse de su aliento g�lido, pues rodear� a los incautos con una columna de hielo.");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLines	( nDocID,  1,"Un Mago del Fuego cont� su encuentro con una de estas criaturas, pero al parecer no la consider� una amenaza.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1,"G�lem de fuego");
		Doc_PrintLine	( nDocID,  1,"------------");
		Doc_PrintLines	( nDocID,  1,"Seg�n se afirma, estas criaturas ardientes pueden incendiar a sus v�ctimas con s�lo tocarlas.");
		Doc_PrintLines	( nDocID,  1,"Hace s�lo un a�o que un grupo de cazadores se encontr� con una de estas monta�as de ascuas andantes. No se sabe qu� sucedi�, pero parece que los rel�mpagos y el hielo surt�an cierto efecto en la infernal criatura.");
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
	TEXT[0]					= "Ur-Shak, el Cham�n Orco, �ha esbozado";
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
//	Schl�ssel zur Freien Mine
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
//	Medizin f�r den verwundeten Orc in der Freien Mine
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
	TEXT[1]			=	"solemnidad. �El portador del estandarte no";
	TEXT[2]			=	"ser� atacado por los orcos!";
	TEXT[3]			=	NAME_Damage;			COUNT[3]	= damageTotal;
	TEXT[4] 		=	NAME_Str_needed;		COUNT[4]	= cond_value[2];
	TEXT[5]			=	NAME_Value; 			COUNT[5]	= value;
};

