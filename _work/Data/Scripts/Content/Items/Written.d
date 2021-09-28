
/******************************************************************************************/
INSTANCE ItWr_Book_Circle_01(C_Item)
{	
	name 					=	"El Primer Círculo";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "El Primer Círculo de Magia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_Book_Circle_01;
};

	FUNC VOID UseItWr_Book_Circle_01()
	{   
		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_LIGHT));
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_THUNDERBOLT));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_FIREBOLT));
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"El Primer Círculo");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Cuando los dioses concedieron al hombre el don de la magia, también le enseñaron a crear runas mágicas. Los siervos de los dioses se han hecho cargo de la gloriosa tarea de crear y usar estos artefactos de poder divino. El Círculo del mago determina qué tipo de magia puede comprender y usar.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Luz");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Primer regalo de Innos al hombre. Una bola de luz se ve sobre el mago.");
					Doc_PrintLine	( nDocID,  1,  Text);
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1,"Rayo de hielo");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Dardo de energía mágica.");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Virote de fuego");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Dardo de fuego mágico.");
					Doc_PrintLine	( nDocID,  1,  Text_2);
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/

INSTANCE ItWr_Book_Circle_02(C_Item)
{	
	name 					=	"El Segundo Círculo";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "El Segundo Círculo de Magia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_Book_Circle_02;
};

	FUNC VOID UseItWr_Book_Circle_02()
	{   
		var int nDocID;
		
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manakosten,IntToString (SPL_HEALING_HP_PER_MP));
		
	
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"El Segundo Círculo");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Toda la magia surge de los poderes mágicos del usuario, al que se llama mago.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Toda activación de un conjuro mágico le cuesta al mago una parte de sus poderes, a los que se llama mana.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Curación");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Adanos vio morir a los humanos, y supo que fue voluntad de Beliar que así sucediera. Y dijo: no me opondré a la voluntad de Beliar, pero daré a la humanidad el poder de la curación."); 
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Este conjuro tiene el poder de curar al mago.");
					Doc_PrintLine	( nDocID,  1,"Conjuros de inversión");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					
					Doc_Show		( nDocID );
	};
										
/******************************************************************************************/
INSTANCE ItWr_Book_Circle_03 (C_Item)
{	
	name 					=	"El Tercer Círculo";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "El Tercer Círculo de Magia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_Book_Circle_03;
	
	
};
	FUNC VOID UseItWr_Book_Circle_03()
	{   
		
		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_FIREBALL));
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_ICECUBE));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_THUNDERBALL));
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"El Tercer Círculo");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Algunos conjuros pueden ser cargados con cierta cantidad de poder mágico: los conjuros de carga.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Otros sortilegios mantienen su fuerza mientras el mago deje fluir su mana hacia ellos: los llamados conjuros de inversión.");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Bola de fuego");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Segundo don de Innos a los hijos del Fuego: una bola ígnea que quema a sus víctimas.");
					Doc_PrintLine	( nDocID,  1,"Conjuro de carga");
					Doc_PrintLine	( nDocID,  1, Text);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Bloque de hielo");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"La víctima es encerrada en un bloque de hielo. Un conjuro del templo de los Magos del Agua.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Bola relampagueante");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Bola de poder mágico.");
					Doc_PrintLine	( nDocID,  1,  Text_2);
					Doc_Show		( nDocID );
	};
		


/******************************************************************************************/
INSTANCE ItWr_Book_Circle_04 (C_Item)
{	
	name 					=	"El Cuarto Círculo";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	200;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "El Cuarto Círculo de Magia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	UseItWr_Book_Circle_04;
	
	
};
	FUNC VOID UseItWr_Book_Circle_04()
	{   
		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_FIRESTORM));
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manakosten,IntToString (SPL_ZAPPED_DAMAGE_PER_SEC));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_DESTROYUNDEAD));
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"El Cuarto Círculo");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"La Magia");
					Doc_PrintLine	( nDocID,  0,"de Teletransporte");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"El rasgo especial de estas fórmulas mágicas es que, a pesar de estar vinculadas a runas, pueden ser ejecutadas por cualquiera con poder mágico. Estas fórmulas pueden activarse de inmediato. No hay restricciones al conjuro de teletransporte.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					
					
					Doc_PrintLine	( nDocID,  1,"Tormenta de Fuego");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Igual que bola de fuego, este conjuro afecta a un enemigo, pero luego salta a otros.");
					Doc_PrintLine	( nDocID,  1,"Conjuro de carga");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text);
					Doc_PrintLine	( nDocID,  1,"Relámpago zigzagueante");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"El conjuro salta a más blancos cuanto más dura. El relámpago es difícil de controlar. Por tanto, el propio lanzador puede convertirse en su objetivo.");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1,"Muerte a los no-muertos");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Destierra a los no-muertos de la oscuridad.");	
					Doc_PrintLine	( nDocID,  1, Text_2);
					
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE  ItWr_Book_Circle_05(C_Item)
{	
	name 					=	"El Quinto Círculo";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	250;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "El Quinto Círculo de Magia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_Book_Circle_05;
	
	
};
	FUNC VOID UseItWr_Book_Circle_05()
	{   
		var int nDocID;
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_FIRERAIN));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_ICEWAVE));
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"El Quinto Círculo");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Lluvia de Fuego");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLines	( nDocID,  0,"El poder del Fuego divino golpea a toda criatura al alcance del mago.");
					Doc_PrintLine	( nDocID,  0, Text_1);					
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Ola de Hielo");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Una Ola de Hielo mágica se extiende sobre los enemigos y los congela brevemente. Durante ese tiempo, las víctimas son paralizadas y dañadas.");
					Doc_PrintLines	( nDocID,  1,"Un conjuro del templo de los Magos del Agua.");
					Doc_PrintLine	( nDocID,  1, Text_2);
					Doc_Show		( nDocID );
};

INSTANCE  ItWr_Book_Circle_06(C_Item)
{	
	name 					=	"El Sexto Círculo";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	300;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "El Sexto Círculo de Magia";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	UseItWr_Book_Circle_06;
	
	
};
	FUNC VOID UseItWr_Book_Circle_06()
	{   
		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manakosten,IntToString (SPL_SENDCAST_BREATHOFDEATH));
	
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"El Sexto Círculo");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Aliento Mortal");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLines	( nDocID,  0,"Aliento de Beliar. Nube de aire destructor que puede matar a cualquier criatura.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, Text);					
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Anillo de Muerte");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Apenas hay documentos sobre la runa portadora de los poderes de URIZIEL.");	
					Doc_PrintLines	( nDocID,  1,"Sólo se sabe que tiene poderes de Beliar.");
					Doc_PrintLine	( nDocID,  1, "");
				
					
					Doc_Show		( nDocID );
};

 


INSTANCE Goettergabe(C_Item)
{	
	name 					=	"Un Don de los Dioses";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Un Don de los Dioses";
	//TEXT[0]				= "Dritter Kreis";
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
	on_state[0]				=	UseGoettergabe;
};

	FUNC VOID UseGoettergabe()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_PrintLine	( nDocID,  0,"Magia");
  					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0," ");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,"Un Don de los Dioses");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"El hombre lleva siglos intentando comprender la naturaleza y los orígenes de la magia. Pero, ¿dónde debe comenzar la búsqueda? ¿Cómo describe uno la magia? Se trata del poder más conflictivo que se conozca. Puede matar y curar; puede crear y destruir.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"¿Cuál es el aspecto de ese poder? ¿Dónde puede un hombre hallar esta fuerza invisible, aunque increíblemente poderosa? La magia es lo que es: el regalo más poderoso que nos han hecho los dioses. Es el don divino concedido a los usuarios y tejedores de la magia. Un poder curativo que sólo algunos elegidos pueden controlar.");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Barthos de Laran");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/

INSTANCE Geheimnisse_der_Zauberei(C_Item)
{	
	name 					=	"Los Secretos de la Magia";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Los Secretos de la Magia";
	//TEXT[0]				= "Dritter Kreis";
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
	on_state[0]				=	UseGeheimnisse_der_Zauberei;
};

	FUNC VOID UseGeheimnisse_der_Zauberei()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Los Secretos de la Magia");
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"La magia no es inherente al mago; más bien, éste puede obrarla. Su única habilidad es la capacidad para influir en la magia y guiarla. Un discípulo del arte de la magia debe ser capaz de usar su espíritu como herramienta.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Su espíritu completo es el recipiente del poder arcano... para darle forma, enfocarlo y liberarlo en el mundo que conocemos. Durante estos momentos de total concentración, el espíritu del mago se eleva más allá de nuestra esfera y vislumbra el Otro Lado; el hogar del poder. El propio mago no es sino un conductor y escultor de tal poder.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Barthos de Laran");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Machtvolle_Kunst (C_Item)
{	
	name 					=	"Un Poderoso Arte";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Un Poderoso Arte";
	//TEXT[0]				= "Dritter Kreis";
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
	on_state[0]				=	UseMachtvolle_Kunst;
	
	
};
	FUNC VOID UseMachtvolle_Kunst()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga" 	, 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga"	, 0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Un Poderoso Arte");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Una obra para los instruidos en la magia.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"La capacidad del mago de controlar el poder divino aumenta. Al principio, parece una pequeña semilla en un campo, que se marchita si no se cuida. Pero cuando empieza a germinar, se revela su esplendor.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Ésta continúa creciendo día a día, y lo mismo puede aplicarse a un mago receptivo. Sus poderes son débiles al principio, pero crecen con el tiempo, liberando una fuerza sin límites previsibles. Guiar este poder hasta el punto de la perfección es un deber sagrado de todo mago, pues la semilla sembrada por los dioses es el mayor don que un mortal puede recibir.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Elementare_Arcanei (C_Item)
{	
	name 					=	"Arcano Elemental";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Arcano Elemental";
	//TEXT[0]				= "Vierter Kreis";
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
	on_state[0]				=	UseElementare_Arcanei;
	
	
};
	FUNC VOID UseElementare_Arcanei()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga" ,	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" ,	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Arcano Elemental");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"El Lugar de la Magia en el Orden Mundano");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Se ha investigado mucho acerca de la magia y su relación con los elementos, y es justo decir que ésta representa el elemento perfecto. Tiene el poder de transformar a todos los demás y darles forma, lo que indica que es superior a ellos.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Visto en su forma más pura, cada elemento descubre una conexión con la magia. Las conexiones naturales de este tipo se hallan en muy pocos lugares, y están muy buscadas. La capacidad de un mago para conjurar los elementos 'de la nada', según parece, demuestra que el poder de la magia es el bien más grande y puro que existe.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE  Wahre_Macht(C_Item)
{	
	name 					=	"Poder Verdadero";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Poder Verdadero";
	//TEXT[0]				= "Fünfter Kreis";
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
	on_state[0]				=	UseWahre_Macht;
	
	
};
	FUNC VOID UseWahre_Macht()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Poder Verdadero");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"El Deber Sagrado del Diestro");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"El poder es lo que diferencia a un mago de sus congéneres. Al poder influir en el poder divino, es una criatura libre de las leyes de la naturaleza que se aplican al hombre mortal.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Cuando un mago alcanza la fase que le permite superar los límites de su existencia, puede situarse en un plano superior al habitado por los mortales. Puede atravesar las fronteras del tiempo y el espacio, y ni siquiera la muerte, ocaso de la existencia, puede detenerlo.");
					Doc_Show		( nDocID );
};


/******************************************************************************************/

INSTANCE  Das_magische_Erz(C_Item)
{	
	name 					=	"Mineral Mágico";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Mineral Mágico";
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
	on_state[0]				=	UseDas_magische_Erz;
	
	
};
	FUNC VOID UseDas_magische_Erz()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0,"Mineral Mágico");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLines	( nDocID,  0,"El mejor mineral para forjar armas se encuentra sin duda en las minas de Khorinis. Es de una enorme pureza y está infundido con magia. Es de una fuerza incomparable, pero tan suave que no se puede romper. Un arma forjada con este acero, extraído bajo tierra con incalculable esfuerzo, está a la altura de cualquier espada, aunque se haya forjado con el acero más resistente.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");	
					Doc_PrintLines	( nDocID,  1,"Romperá cualquier escudo y perforará cualquier armadura. Reyes y héroes de antaño blandieron armas forjadas con el mejor acero de Khorinis, y tales armas siguen pagándose caras en toda Myrtana. Pero el mineral en sí también es caro, pues hace falta mucho esfuerzo para extraerlo de la roca. Es como si intentara permanecer dentro de la matriz de la tierra.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/




/******************************************************************************************/
INSTANCE Schlacht_um_Varant1(C_Item)
{	
	name 					=	"La Batalla de Varant";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "La Batalla de Varant";
	TEXT[0]				= "Volumen 1";
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
	on_state[0]				=	UseSchlacht_um_Varant1;
};

	FUNC VOID UseSchlacht_um_Varant1()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga",		0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga",		0		);
					
					//1.Seite
 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,""); 					
					Doc_PrintLines	( nDocID,  0,"...pero Rhobar, el estratega, optó por atacar. Reunió a sus tropas e hizo que marcharan hacia el débil flanco derecho del enemigo. No perdió el tiempo con largas escaramuzas: se lanzó hacia el ejército enemigo a modo de espada y atravesó sus defensas como si fueran de papel. Guió una y otra vez a sus tropas, avanzando sobre los invasores de Varant. Sabía que para ganar esta batalla, debía dispersar al enemigo e impedir que Gellon y Lukkor");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"se unieran y le dieran un golpe aplastante. Debía cortar su línea de suministro para asegurar la victoria...");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"...Gellon estaba muerto; su ejército, derrotado; sus tropas sin líder, a la fuga. Pero Rhobar no quería dejar que el enemigo se reagrupara, y ordenó a su ejército destruir lo que quedara de la fuerza enemiga. Mientras tanto, Lukkor aprovechó el momento y asestó un golpe decisivo a las agotadas tropas del Rey Rhobar.");
					
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/
INSTANCE Schlacht_um_Varant2(C_Item)
{	
	name 					=	"La Batalla de Varant";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "La Batalla de Varant";
	TEXT[0]				= "Volumen 2";
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
	on_state[0]				=	UseSchlacht_um_Varant2;
};

	FUNC VOID UseSchlacht_um_Varant2()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga",		0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga", 	0		);
					
					//1.Seite
 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,""); 					
					Doc_PrintLines	( nDocID,  0,"La guerra estaba decidida. Varant había perdido sus puertos, vitales para el suministro. El Rey Rhobar no estuvo mucho en el campo de batalla, dejando que sus generales se ocuparan de los enemigos restantes. Varant sólo conservaba una gran fuerza, liderada por Lukkor, el general más capacitado de Varant, que más de una vez había convertido una derrota en victoria.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Pero ahora su ejército estaba atrapado. La situación era desesperada, aunque superaba en número a su enemigo. Lee, un héroe de guerra de Myrtana, lo había llevado a una trampa. La caballería pesada no pudo combatir en el denso terreno pantanoso del estrecho valle. Los soldados de Lee habían ocupado la cordillera de colinas circundantes y atacado repetidas veces, diezmando a su ejército. Las misiones desesperadas de sus tropas terminaron en charcos de sangre. Había sido derrotado.");
					
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/
INSTANCE Myrtanas_Lyrik(C_Item)
{	
	name 					=	"Poesía de Myrtana";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Poesía de Myrtana";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	UseMyrtanas_Lyrik;
};

	FUNC VOID UseMyrtanas_Lyrik()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga" , 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 	0		);
					
					//1.Seite
 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,""); 					
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"La Canción del");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"Arrepentimiento");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"");
		
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Blanco y puro, al principio, era el poder,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Ahora sólo en la noche resuena.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Se habla de días de unidad, en el pasado");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Y ahora ansiamos lo que ya no nos queda.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Toda unidad fue rota y desgarrada.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Maldito el espíritu que no perduró.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"De nuestro deseo esta canción habla.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Pues la unidad se fue y no volvió.");				
					Doc_PrintLines	( nDocID,  1,"");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Lehren_der_Goetter1 (C_ITEM)
{	
	name 					=	"Palabras de los Dioses Vol. 1";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Palabras de los Dioses";
	TEXT[0]				= "Volumen 1";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	UseLehren_der_Goetter1;
};

	FUNC VOID UseLehren_der_Goetter1()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga" , 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 	0		);
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0,"");										
					Doc_PrintLines	( nDocID,  0,"Escucha las palabras de los dioses, pues es su voluntad que las oigas. Atiende a las enseñanzas de los dioses, pues es su voluntad que así hagas. Honra a los sacerdotes de los dioses, pues ellos son los elegidos.");
					Doc_PrintLine	( nDocID,  0,"");
					//Absatz
					Doc_PrintLines	( nDocID,  0,"La palabra de Innos: diérase el caso de que no entendieras, no desesperes ante la palabra de los sacerdotes, pues son justos y sabios. Pues yo soy el sol naciente, la luz, y la vida. Y todo lo contrario al sol lo es a mí, y será desterrado a las sombras por siempre jamás.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"La palabra de Adanos: trabaja y vive, pues los días se crearon para que trabajara el hombre. Busca saber y conocimiento para poder transmitirlos, pues para ello fueron creados. Todo el que sea indiferente y holgazán será desterrado a las sombras por siempre jamás.");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"La palabra de Beliar: a todo el que haga mal y vaya contra la voluntad de los dioses, castigaré yo. Llenaré su cuerpo de dolor, sufrimiento y muerte, pero su espíritu se unirá conmigo en las sombras por siempre jamás.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Lehren_der_Goetter2 (C_ITEM)
{	
	name 					=	"Palabras de los Dioses Vol. 2";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Palabras de los Dioses";
	TEXT[0]				= "Volumen 2";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	UseLehren_der_Goetter2;
};

	FUNC VOID UseLehren_der_Goetter2()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga" , 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 	0		);
					
					//1.Seite
 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,""); 					
					Doc_PrintLines	( nDocID,  0,"En el principio de los tiempos: no había noche ni día, y ninguna cosa viva recorría la tierra. Después apareció Innos y su luz brilló sobre el mundo, y dio a éste el don de la vida. Pero ninguna criatura podía vivir a la luz de Innos, así que éste creó el sol. Pero la luz aún era muy brillante, así que Innos se dividió y creó a Beliar, que a su vez hizo la noche. Ahora el hombre podía existir. Así que Innos volvió a dividirse y creó a Adanos, que dio al hombre versatilidad, saber, curiosidad y valentía. Innos estaba satisfecho con lo que había creado.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Decidió dejar a la humanidad al cuidado de Adanos, y descansó. Pero Beliar estaba consumido por la envidia, pues la gente no le rezaba al dormir de noche. Se enfureció y creó a un hombre. Uno que le rezara sólo a él. Pero el hombre al que creó era igual que todos los demás. Beliar se enfureció tanto que lo mató y dijo: si no me veneran, al menos me tendrán miedo. Tras lo que creó la muerte y puso fin a las vidas de los hombres.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Lehren_der_Goetter3 (C_ITEM)
{	
	name 					=	"Palabras de los Dioses Vol. 3";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Palabras de los Dioses";
	TEXT[0]				= "Volumen 3";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	UseLehren_der_Goetter3;
};

	FUNC VOID UseLehren_der_Goetter3()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga" , 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 	0		);
					
					//1.Seite

					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
   					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
   					Doc_PrintLine	( nDocID,  0,"");			
					Doc_PrintLines	( nDocID,  0,"Innos concedió a la humanidad el poder de escucharle y hablarle. Le dio el poder de obrar grandes milagros, y llamó a aquello magia. Con este poder, la gente podía diseñar el mundo a su voluntad. Innos no les puso límites, por lo que el hombre recibió una fracción del poder divino de la creación. Pero no todas las gentes eran iguales, y ello le disgustaba. Innos elevó por encima de los demás a los pocos que le habían demostrado gratitud.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
 					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Estos pocos pronto fueron venerados y temidos, y la gente los llamó sacerdotes. Pero algunos no tardaron en sentirse insatisfechos. Y así fue que rezaron a Adanos y olvidaron sus orígenes. La liga de sacerdotes se dividió. Hubo guerras y la fe en la omnipotencia divina pronto se convirtió en un mito. Y así se separaron los sacerdotes. Los que siguieron a Adanos se llamaron Magos del Círculo del Agua, mientras que los sacerdotes de Innos fueron conocidos como Magos del Círculo del Fuego.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Jagd_und_Beute (C_ITEM)
{	
	name 					=	"Caza y presa";
	mainflag 				=	ITEM_KAT_DOCS;			
									
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Caza y presa";
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
	on_state[0]				=	UseJagd_und_Beute;
};

	FUNC VOID UseJagd_und_Beute()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga" , 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 	0		);
					
					//1.Seite
 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,""); 					
					Doc_PrintLines	( nDocID,  0,"Estos escritos han sobrevivido a través de los siglos y su consejo es considerado un compendio del arte de la caza. Tras las grandes batallas del norte, todo campesino sabe utilizar el arco y las flechas. ¡Pero al cazar deben seguirse unas reglas que superan el mero conocimiento de cómo usar un arma! La caza es tanto tímida como impredecible.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"El arte de la cacería con arco no sólo es de tradición antigua, sino la forma de caza más común. Las técnicas empleadas en este método tradicional apenas han cambiado con el paso de los milenios, y es poco probable que lo hagan en el futuro. ¿Qué circunstancias determinan realmente la caza con arco y flechas? Reconocer tales leyes es el auténtico arte en esta práctica.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Kampfkunst (C_ITEM)
{	
	name 					=	"El Arte del Combate";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "El Arte del Combate";
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
	on_state[0]				=	UseKampfkunst;
};

	FUNC VOID UseKampfkunst()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga" , 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 	0		);
					
					//1.Seite

					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
   					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
  					Doc_PrintLine	( nDocID,  0,"");					
  					Doc_PrintLine	( nDocID,  0,"");					
  					Doc_PrintLine	( nDocID,  0,"");					
					Doc_PrintLines	( nDocID,  0,"Durante 2000 años, las enseñanzas de este experto han marcado el desarrollo del arte del combate.");
  					Doc_PrintLine	( nDocID,  0,"");					
  					Doc_PrintLine	( nDocID,  0,"");					
   					Doc_PrintLines	( nDocID,  0,"Destreza, compostura, velocidad, observación y reacción son las habilidades a entrenar. Tus movimientos han de estar bien coordinados y tu postura ser correcta si quieres mejorar tu capacidad.");			
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"El alma de la enseñanza espiritual y física del maestro ha sobrevivido muchos años.");
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
 					Doc_PrintLines	( nDocID,  1,"Su singular éxito ha influido en generaciones. La faz del mundo ha cambiado durante milenios, pero la armonía de los poderes interiores y los movimientos del cuerpo ha sobrevivido.");					
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Die_Gruft (C_ITEM)
{	
	name 				=	"La Cripta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	100;

	visual 				=	"ItWr_Book_02_03.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= "La Cripta";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};




/******************************************************************************************/
INSTANCE Astronomie (C_ITEM)
{	
	name 					=	"Astronomía";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Astronomía";
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
	on_state[0]				=	UseAstronomie;
};

	FUNC VOID UseAstronomie()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0,"");										
					Doc_PrintLines	( nDocID,  0,"En el centro se halla el Morgrad, conteniendo los cuatro elementos: tierra, agua, fuego y aire. Es el lugar de lo efímero; el corazón de la inefable oscuridad de Beliar. Sobre todo ello se alza la esfera de los cielos.");
					Doc_PrintLine	( nDocID,  0,"");
					//Absatz
					Doc_PrintLines	( nDocID,  0,"En la jerarquía del universo, el hombre es un receptor. Su alma le permite participar en el plano de existencia más alto: el espíritu divino. Pero el cuerpo del hombre está hecho de la sustancia del Morgrad. Es un reflejo del mundo.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"La órbita sinódica de los planetas, que es su recorrido entre dos posiciones en relación al Morgrad de nuestro mundo, varía sólo unos grados cada siglo. Por tanto, nuestra conclusión es que nos movemos constantemente junto al resto del universo.");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Cuando creamos el primer calendario, observamos el recorrido de la luna para calcular la duración del año solar.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/

/******************************************************************************************/
INSTANCE Rezepturen (C_ITEM)
{	
	name 					=	"Fórmulas";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Fórmulas";
	TEXT[0]				= "Volumen 1";
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
	on_state[0]				=	UseRezepturen;
};

	FUNC VOID UseRezepturen()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0,"");										
					Doc_PrintLines	( nDocID,  0,"Bálsamo de Visión:");
					Doc_PrintLine	( nDocID,  0,"----------------");
					Doc_PrintLine	( nDocID,  0,"");		
					Doc_PrintLines	( nDocID,  0,"Cubrir con bilis los ojos del paciente. Esta secreción tiene un sabor amargo. Situar este amargor en el ojo obliga al paciente a verlo, y de ello obtiene la sabiduría. ¡Aprende a ver! El amargor y la sabiduría  se excluyen mutuamente. ¡Ambos son el equivalente del otro!");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Las lágrimas, el sufrimiento y la decepción son amargos, pero la sabiduría es la influencia consoladora de todo tipo de dolor. El amargor y la sabiduría son alternativos. Donde hay amargor, no cabe la sabiduría, y donde hay sabiduría, no cabe el amargor.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Rezepturen2 (C_ITEM)
{	
	name 					=	"Fórmulas";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Fórmulas";
	TEXT[0]				= "Volumen 2";
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
	on_state[0]				=	UseRezepturen2;
};

	FUNC VOID UseRezepturen2()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0,"");										
					Doc_PrintLines	( nDocID,  0,"Vino del Olvido");
					Doc_PrintLine	( nDocID,  0,"--------------------");
						Doc_PrintLine	( nDocID,  0,"");			
					Doc_PrintLines	( nDocID,  0,"La mejor uva para este vino se encuentra en lo alto de las laderas de Archolos. El arte de hacerlo madurar hasta la perfección radica en no someterlo a ningún movimiento. Las uvas se mezclan con la hierba syos común frente a las bodegas.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Maravíllate mientras el maestro convierte en vino el agua del pozo. La gente le homenajea y degusta su regalo. Éste castiga a sus discípulos holgazanes encerrándolos en botellas. Se enciende un fuego, y las serpientes negras se levantan.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/


INSTANCE TagebuchOT (C_Item)
{	
	name 					=	"Diario";

	mainflag 					=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 					=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Diario";
	TEXT[0]				= "Un viejo libro destrozado.";
	////COUNT[0]			= ;
	TEXT[1]				= "Faltan algunas páginas.";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	//TEXT[5]				= NAME_Value;
	//COUNT[5]			= value;
	on_state[0]				=	UseTagebuchOT;
	
	
};
	FUNC VOID UseTagebuchOT()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;				// DocManager 
					Doc_SetPages		( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga" ,	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" ,	0		);
					
					//1.Seite	
  					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  0,"Día 23");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0,"Perdí la noción del tiempo.");
					Doc_PrintLines	( nDocID,  0,"Creo que deben haber pasado 23 días desde que los orcos nos cogieron y obligaron a trabajar.");
					Doc_PrintLines	( nDocID,  0,"La labor es dura, y ellos no tienen piedad. Si eres débil, ¡estás muerto!");
					Doc_PrintLines	( nDocID,  0,"¡Quiero irme, y no me importa cómo!");
					Doc_PrintLine		( nDocID,  0,"");
					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  0,"Día 28");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0,"Tenemos que ampliar los túneles más dentro de la montaña.");
					Doc_PrintLines	( nDocID,  0,"El área frontal es ya enorme. Si supiera para qué estamos haciendo esto.");

					//1.Seite	
  					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1); //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  1,"Día 67");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  1,"He oído que estos sacerdotes orcos no tienen corazón. Si es cierto, ¿cómo pueden seguir con vida?");
					Doc_PrintLines	( nDocID,  1,"También he visto la espada a la que tanto temen los sacerdotes. Si la tuviera, los ensartaría con ella.");
					Doc_PrintLine		( nDocID,  1,"");
					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);   //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  1,"Día 78");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  1,"La espada yace en una sala de la parte frontal del templo, pero la vigila un sacerdote.");
					Doc_PrintLines	( nDocID,  1,"Voy a fugarme. Dejaré aquí mi diario; quizá algún día le sirva a alguien.");
					Doc_Show		( nDocID );
};


INSTANCE ItWr_Bloodfly_01(C_Item)
{	
	name 					=	"Las Moscas de Sangre";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Las Moscas de Sangre";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	UseItWr_Bloodfly_01;
};

	FUNC VOID UseItWr_Bloodfly_01()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
 					Doc_PrintLine	( nDocID,  0,"Moscas de Sangre");
  					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0," ");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,"Acerca de las moscas");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLines	( nDocID,  0,"Pero allá donde el suelo esté mojado y el aire sea húmedo, las moscas se reúnen atraídas por el sudor de todo tipo de criaturas. Usan sus aguijones para matar a sus víctimas y beber su sangre.");
					Doc_PrintLine	( nDocID,  0,"");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"Quitar tal aguijón es un arte de los cazadores del pantano. Se hace un profundo corte en el abdomen, se corta una línea en zigzag en torno a la púa y ésta se retira con cuidado, junto al tejido que la rodea. Se deja que sangre y se limpia la carne no comestible.");	
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_Show		( nDocID );
					
					if Knows_GetBFSting ==  FALSE
					{
					Knows_GetBFSting = TRUE;
					Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
					B_LogEntry (GE_AnimalTrophies,"Cómo quitar aguijones: moscas de sangre");	
					PrintScreen	("Aprender: quitar aguijón", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					};
	};
