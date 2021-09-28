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
	name 				=	"Mitad de un pergamino";

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
	TEXT[0]				= "Una parte de un antiguo pergamino.";
	TEXT[1]				= "Parece que la parte inferior fue arrancada.";
	TEXT[2]				= "La escritura se asemeja a las runas de";
	TEXT[3] 			= "las paredes de la cueva.";
};

//---------------------------------------------------------------------
//	2. Pergamenth�lfte der Ork-Schriftrolle
//---------------------------------------------------------------------
INSTANCE OrkParchmentTwo(C_Item)
{	
	name 				=	"Mitad de un pergamino";

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
	TEXT[0]				= "Una parte de un antiguo pergamino.";
	TEXT[1]				= "Parece que la parte superior fue arrancada.";
	TEXT[2]				= "La escritura se asemeja a las runas de";
	TEXT[3] 			= "las paredes de la cueva.";
};

//---------------------------------------------------------------------
//	Schl�ssel zu Kaloms Truhe
//---------------------------------------------------------------------
INSTANCE ITKE_PSI_KALOM_01(C_Item)
{	
	name 				=	"Llave";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= "Llave del laboratorio";
	TEXT[0]				= "Abre el cofre del laboratorio de alquimia";
	TEXT[1]				= "del campamento del pantano.";
	//TEXT[1]				= "";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Fokuskarte
//---------------------------------------------------------------------
INSTANCE ItWrFocimap(C_Item)
{	
	name 					=	"Mapa de focos de Saturas";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	15;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseFocimap;

	description				= name;
	TEXT[0]					= "Las cinco puntas de la estrella";
	TEXT[1]					= "muestran la posici�n de los cinco";
	TEXT[2]					= "focos de piedra que se utilizaron para crear";
	TEXT[3]					= "la Barrera M�gica. Este mapa es viejo";
	TEXT[4]					= "y las piedras pueden haber sido trasladadas";
	TEXT[5]					= "a otros lugares desde entonces.";
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
	name 				=	"P�gina de diario";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";	
	on_state[0]			=	UseTroll;

	description			=	name;
	TEXT[1]				=	"Una p�gina muy estropeada cuya";
	TEXT[2]				=	"escritura apenas puede ser reconocida.";
	TEXT[3]				=	"El antiguo due�o parece haber sido";
	TEXT[4]				=	"un cazador de trolls.";
};

FUNC VOID UseTroll()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0,"D�a 169");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Hoy voy a conseguirlo. Lo s�. Los dioses estar�n conmigo. Lo he intentado todo para matar a un troll. El acero m�s fuerte no sirvi�; las flechas rebotaron como si su piel fuera de piedra.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Ahora voy a usar este pergamino m�gico que me vendi� el mercader de Khorinis. Me cost� 50 piezas de oro, pero me har� rico con los beneficios de estos trofeos.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Voy a matar a un troll.");
				Doc_Show		(nDocID);
};

//---------------------------------------------------------------------
//	Fokus 2 - (Trollschlucht)
//---------------------------------------------------------------------
INSTANCE Focus_2(C_Item)
{	
	name 				=	"Foco del Ca��n del Troll";

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
	TEXT[2]				=	"utilizados para crear la Barrera M�gica.";
};

//---------------------------------------------------------------------
//	Truhenschl�ssel in der Bergfestung
//---------------------------------------------------------------------
INSTANCE ItKe_BERG_01(C_Item)
{	
	name 				=	"Llave de un cofre";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Viejo fuerte de monta�a.";
	TEXT[1]				= "Una vieja llave herrumbrosa de un cofre.";
	TEXT[2]				= "";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

//---------------------------------------------------------------------
//	Urkunde in der Bergfestung
//---------------------------------------------------------------------
INSTANCE ItWr_Urkunde_01(C_Item)
{	
	name 			=	"Certificado";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	0;

	value 			=	15;

	visual 			=	"ItWr_Scroll_01.3DS";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseUrkunde;
	description		=	"Escrituras";
	TEXT[0]			=	"Permiten al portador reclamar el ";
	TEXT[1]			=	"territorio del fuerte de monta�a.";
	TEXT[2]			=	"";
	TEXT[5]			=	"Valor                       400 libras de oro";
};

FUNC VOID UseUrkunde()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								 
				Doc_SetPages	(nDocID,  1 );                         
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0); 
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);  
				Doc_SetFont 	(nDocID, -1, "font_15_book.tga");
				Doc_PrintLine	(nDocID,  0,"Certificado");
				Doc_SetFont 	(nDocID, -1, "font_10_book.tga");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0,"Yo, Bergmar, Burgrave del Campo Occidental y juez responsable de las tierras de mi Se�or de Tymorisin, la regi�n que rodea a Khorinis, declaro por la presente... que entrego y vendo... al portador de este documento... y a la casa de Innos, el feudo del fuerte de la monta�a (junto a futuros diezmos de mi renta y las minas contenidas en �l) a cambio de 400 unidades de oro.");
				Doc_Show		(nDocID );
};
	
//---------------------------------------------------------------------
//	Fakescroll (Bergfestung)
//---------------------------------------------------------------------
INSTANCE Fakescroll(C_Item)
{	
	name 					=	"Carta";

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
	name 				=	"Foco del Fuerte de la Monta�a";

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
	TEXT[2]				=	"utilizados para crear la Barrera M�gica.";
};

//---------------------------------------------------------------------
//	Schl�ssel zum Bonusraum in der Klosterruine
//---------------------------------------------------------------------
INSTANCE ItKe_Focus4(C_Item)
{
	name 				=	"Llave";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Esta llave procede de la cueva que hay ";
	TEXT[2]				= "frente a las ruinas del monasterio.";
};

//---------------------------------------------------------------------
//	Fokus 4 - (Klosterruine)
//---------------------------------------------------------------------
INSTANCE Focus_4(C_Item)
{	
	name 				=	"Foco del Monasterio en Ruinas";

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
	TEXT[2]				=	"utilizados para crear la Barrera M�gica.";
};

//---------------------------------------------------------------------
//	OrkTalisman unter Steinkreis
//---------------------------------------------------------------------
INSTANCE  ItMi_OrcTalisman(C_Item)
{
	name 			= "Talism�n orco";

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
	name 				=	"Llave";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	3;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Esta llave es de la cripta";
	TEXT[2]				= "situada bajo el c�rculo de piedras.";
};

//---------------------------------------------------------------------
//	Fokus 5 - (Steinkreis)
//---------------------------------------------------------------------
INSTANCE Focus_5(C_Item)
{	
	name 				=	"Foco bajo C�rculo de Piedras";

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
	TEXT[2]				=	"utilizados para crear la Barrera M�gica.";
};

