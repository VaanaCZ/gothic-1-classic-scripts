//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Karte f�r 1. Fokus
//---------------------------------------------------------------------
INSTANCE ItWrFocusmapPsi(C_Item)
{	
	name 			=	"Y�Berionova mapa ohnisek";
	
	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	15;

	visual 			=	"ItWr_Map_01.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";	
	on_state[0]		=	UseFocusmapPsi;

	description		= name;
	TEXT[1]			= "Tato mapa zna�� cestu k ohniskov�mu";
	TEXT[2]			= "kameni, kter� Y�Berion pot�ebuje";
	TEXT[3]			= "k vyz�v�n� Sp��e.";
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
	name 				=	"Ohnisko z mo�sk�ch �tes�";
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	hp 					=	1;
	hp_max 				=	1;
	weight 				=	1;
	value 				=	1;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_STONE;

	description			=	name;
	TEXT[1]				=	"Jeden z p�ti ohniskov�ch kamen�,";
	TEXT[2]				=	"kter� byly pou�ity k vytvo�en� magick� Bari�ry.";
};

//---------------------------------------------------------------------
//	Zahnrad f�r Ian
//---------------------------------------------------------------------
INSTANCE ItMi_Stuff_Gearwheel_01(C_Item)
{	
	name 				=	"Ozuben� kolo!";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;	

	value 				=	0;

	visual 				=	"ItMi_Stuff_Gearwheel_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Je z rozbit� drti�ky rudy, kter�";
	TEXT[1]				=	"z�stala v opu�t�n� postrann� chodb�";
	TEXT[2]				=	"Star�ho dolu.";
};

//---------------------------------------------------------------------
//	Minecrawler-Ei
//---------------------------------------------------------------------
INSTANCE ItAt_Crawlerqueen(C_Item)
{	
	name 					=	"Vaj��ko d�ln�ho �erva";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 					=	100;

	visual 					=	"ItAt_Crawlerqueen.3ds"; 
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Tato vaj��ka snesla kr�lovna";
	TEXT[1]					=	"d�ln�ch �erv�.";
	TEXT[2]					=	"Obsahuj� daleko siln�j�� v�ta�ek ne�";
	TEXT[3]					=	"oby�ejn� �elisti d�ln�ch �erv�.";
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
	TEXT[0]					=	"V t�to prastar� knize je p�r";
	TEXT[1]					=	"kouzeln�ch za��kadel, kter� se vztahuj�";
	TEXT[2]					=	"k pou�it� takzvan�ch ohniskov�ch kamen�.";
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
					Doc_PrintLines	( nDocID,  0,"S�la zaklet� v kameni neust�le nar�st� a uvoln� se prost�ednictv�m kouzelnick�ho za��kadla. Jestli bude jej� ��inek trval� �i okam�it�, to z�le�� na vlastn�m rozv�en�. ");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Jakmile se jednou s�la uvoln�, ohniskov� k�men je zpro�t�n ve�ker� s�ly a nen� ni��m ne� pr�zdnou sko��pkou.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Slova, kter� mus� b�t pro uvoln�n� s�ly z ohniska pronesena, jsou zn�ma mnoh�m znalc�m tajemn�ch sil. Dokonce i schopnost vybavit nov� artefakt kouzelnou moc� se ji� stalo sp�e b�nou kouzelnickou prax� ne� tajnou v�dou.");
					Doc_PrintLine	( nDocID,  1,  "");
					Doc_PrintLines	( nDocID,  1,"Av�ak jen nemnoz� maj� znalosti, kter�ch je t�eba k obnov� s�ly pou�it�ho ohniskov�ho kamene. Tento magick� svitek star�ch dob je znamen�m t�ch nejv�t��ch schopnost�.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"A nyn�, ty, jen� jsi vyvolen�, otev�i svoji mysl t�m slov�m prad�vn� moci.");
					
					Doc_Show		( nDocID );
	};
