
/******************************************************************************************/
INSTANCE ItWr_Book_Circle_01(C_Item)
{	
	name 					=	"Pierwszy Krąg";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Pierwszy Krąg Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Pierwszy Krąg");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Gdy bogowie obdarzyli ludzkość magicznymi mocami, nauczyli ich również sporządzać runy. Wierni wyznawcy przejęli zatem od swych panów zaszczytne zadanie wytwarzania tych świętych artefaktów i zaczęli je wykorzystywać. Krąg, do którego należy mag, określa, jak zaawansowanymi zaklęciami może się on posługiwać.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Światło");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Pierwszy dar Innosa dla ludzkości. Lśniąca kula rozświetla bezpośrednie otoczenie maga.");
					Doc_PrintLine	( nDocID,  1,  Text);
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1,"Sopel lodu");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Pocisk magicznej energii.");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Ognisty pocisk");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Pocisk magicznego Ognia.");
					Doc_PrintLine	( nDocID,  1,  Text_2);
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/

INSTANCE ItWr_Book_Circle_02(C_Item)
{	
	name 					=	"Drugi Krąg";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Drugi Krąg Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Drugi Krąg");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Wszelka magia czerpie z magicznych zdolności jej użytkownika, zwanego odpowiednio MAGIEM.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Każde wykorzystanie magicznego zaklęcia kosztuje maga część jego mocy. Ich zapas nazywany bywa czasem ilością mana.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Uzdrowienie");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Adanos ujrzał, że ludzie są śmiertelni i wiedział, że jest to wolą Beliara. I rzekł: Nie sprzeciwię się woli Beliara, ale dam za to ludziom dar uzdrawiania."); 
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"To zaklęcie uzdrawia maga.");
					Doc_PrintLine	( nDocID,  1,"Zaklęcia czerpiące");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					
					Doc_Show		( nDocID );
	};
										
/******************************************************************************************/
INSTANCE ItWr_Book_Circle_03 (C_Item)
{	
	name 					=	"Trzeci Krąg";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Trzeci Krąg Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Trzeci Krąg");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Niektóre zaklęcia można naładować pewną dawką energii magicznej. Nazywamy je zaklęciami odnawialnymi.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Inne zaklęcia działają tak długo, jak mag udziela im swojej energii mana. Te z kolei nazywane są zaklęciami inwestycyjnymi.");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Kula ognia");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Drugi dar Innosa dla dzieci Ognia. Potężny, magiczny pocisk, spopielający ofiary.");
					Doc_PrintLine	( nDocID,  1,"Zaklęcie odnawialne");
					Doc_PrintLine	( nDocID,  1, Text);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Bryła lodu");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Ofiara otoczona zostaje bryłą lodu. Zaklęcie pochodzi z Kręgu Magów Wody.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Piorun kulisty");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Potężny pocisk magiczny.");
					Doc_PrintLine	( nDocID,  1,  Text_2);
					Doc_Show		( nDocID );
	};
		


/******************************************************************************************/
INSTANCE ItWr_Book_Circle_04 (C_Item)
{	
	name 					=	"Czwarty Krąg";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	200;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Czwarty Krąg Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Czwarty Krąg");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Magia");
					Doc_PrintLine	( nDocID,  0,"Teleportacji");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Szczególna natura tych zaklęć leży w tym, iż choć zawarte są w runach, korzystać z nich może każda osoba obdarzona mocą magiczną. Magiczne formuły zostają wyzwolone w sposób natychmiastowy, zaś samo zaklęcie teleportacji nie jest w żaden sposób ograniczone.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					
					
					Doc_PrintLine	( nDocID,  1,"Ognista burza");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Podobnie jak w Kuli ognia, energia tego zaklęcia kierowana jest przeciwko kolejnym ofiarom.");
					Doc_PrintLine	( nDocID,  1,"Zaklęcie odnawialne");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text);
					Doc_PrintLine	( nDocID,  1,"Grom");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Magiczna energia przeskakuje od jednej ofiary do drugiej. Zdarza się, że nawet mag może paść ofiarą tego zaklęcia!");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1,"Śmierć ożywieńcom");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"To zaklęcie przeznaczone jest do walki z piekielnymi zastępami ożywieńców.");	
					Doc_PrintLine	( nDocID,  1, Text_2);
					
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE  ItWr_Book_Circle_05(C_Item)
{	
	name 					=	"Piąty Krąg";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	250;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "Piąty Krąg Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Piąty Krąg");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Deszcz ognia");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLines	( nDocID,  0,"Święty Ogień niesie zagładę wszystkim istotom znajdującym się w pobliżu maga.");
					Doc_PrintLine	( nDocID,  0, Text_1);					
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Lodowa fala");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Magiczna fala lodu zamraża grupę nieprzyjaciół na krótki okres czasu, uniemożliwiając im ruch i zadając obrażenia.");
					Doc_PrintLines	( nDocID,  1,"Zaklęcie z Kręgu Magów Wody.");
					Doc_PrintLine	( nDocID,  1, Text_2);
					Doc_Show		( nDocID );
};

INSTANCE  ItWr_Book_Circle_06(C_Item)
{	
	name 					=	"Szósty Krąg";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	300;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Szósty Krąg Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Szósty Krąg");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Tchnienie śmierci");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLines	( nDocID,  0,"Oddech Beliara. Zaklęcie to potrafi natychmiast powalić nawet najpotężniejsze istoty.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, Text);					
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Pierścień śmierci");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Nie zachowały się prawie żadne zapiski o runie zawierającej magiczną moc URIZIELA.");	
					Doc_PrintLines	( nDocID,  1,"Wiadomo tylko, że pochodzi ona wprost od Beliara.");
					Doc_PrintLine	( nDocID,  1, "");
				
					
					Doc_Show		( nDocID );
};

 


INSTANCE Goettergabe(C_Item)
{	
	name 					=	"Dar od bogów";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Dar od bogów";
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
					Doc_PrintLine	( nDocID,  0,"Dar od bogów");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Z dawien dawna człek próbował zgłębić naturę i genezę sztuk magicznych. Jeno gdzie rozpocząć takie poszukiwania? Czy magię można w ogóle opisać? Próżno szukać równie niespójnego zjawiska we świecie: wszak magia jednako leczy i zabija, tworzy i niszczy.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Gdzie zatem szukać tej nieopisanej potęgi? Magia jest tym, czym jest - najpotężniejszym i najwspanialszym darem, jaki człowiek otrzymał od bogów. Baczcie jeno, by dar ów rychło nie stał się przekleństwem, gdyż nieliczni będą w stanie zrozumieć magię i wykorzystać ją do własnych celów. Inni sami zostaną wykorzystani.");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Barthos z Laran");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/

INSTANCE Geheimnisse_der_Zauberei(C_Item)
{	
	name 					=	"Tajniki Magii";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Tajniki Magii";
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
					Doc_PrintLine	( nDocID,  0,"Tajniki Magii");
					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Magia nie zamieszkuje w ciele samego magusa. Jest on raczej jako zmyślny rzemieślnik, a ona jako narzędzie jego. Takoż początkujący magus uczy się jak oną moc okiełznać i kierować nią wedle swojej woli.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Jego duch nadaje owej mocy pożądany kształt, ogniskuje ją i wreszcie uwalnia. W takich chwilach dusza magusa wznosi się ponad nasz świat i spoziera na Drugą Stronę, gdzie stoi pałac potęgi, którą on kształtuje i przekazuje.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Barthos z Laran");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Machtvolle_Kunst (C_Item)
{	
	name 					=	"Wszechpotężna Sztuka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Wszechpotężna Sztuka";
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
					Doc_PrintLine	( nDocID,  0,"Wszechpotężna");
					Doc_PrintLine	( nDocID,  0, "Sztuka");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Księga dla tych, co w sztukach magicznych uczeni są.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Umiejętności magusa wzrastają z czasem. Najpierw jest jako ziarno zboża, które trzeba chronić, by nie zmarniało. Lecz wkrótce ziarno wypuszcza kiełki, stając się piękną rośliną.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Z każdym nowym dniem roślina staje się większa i silniejsza. Tak samo jest z magusem. Na początku nauki jego siły są wątłe, lecz z czasem okrzepnie, stając się potężniejszym. Ciągłe dążenie do absolutnej perfekcji powinno być nadrzędnym celem każdego adepta magii. Ziarno potęgi dane im przez bogów jest bowiem najcenniejszym darem, jakie śmiertelnik może otrzymać.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Elementare_Arcanei (C_Item)
{	
	name 					=	"Arcanum Żywiołów";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Arcanum Żywiołów";
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
					Doc_PrintLine	( nDocID,  0,"Arcanum Żywiołów");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Miejsce Magii w ziemskim porządku");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Wiele badań przeprowadzono, głowiąc się nad zależnością magii od wszelakich żywiołów. W rezultacie przyjęto, iż jest ona - magia - ostatecznym, najpotężniejszym żywiołem ze wszystkich. Wszak to dzięki niej magus może kształtować pozostałe siły natury wedle własnego upodobania.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Każdy żywioł, w swej najczystszej formie, ujawnia powiązania z magią. Oczywiście, naturalne manifestacje takich powiązań należą do rzadkości i są skrzętnie poszukiwane. Zdolność magusa do kontrolowania potęgi żywiołów stanowi ostateczny dowód, iż magia jest najczystszym i najwspanialszym dobrem obecnym w naszej egzystencji.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE  Wahre_Macht(C_Item)
{	
	name 					=	"Prawdziwa Moc";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Prawdziwa Moc";
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
					Doc_PrintLine	( nDocID,  0,"Prawdziwa Moc");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Święta powinność Mędrca");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"To potęga odróżnia magusa od zwykłego śmiertelnika. Władny wykorzystywać boską moc, magus wyjęty jest spod tych wszystkich praw natury, które dotyczą ludzi prostych i królów jednako.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Gdy magus osiągnie poziom, który pozwoli mu wykroczyć poza granice ludzkiej egzystencji, wstępuje do świata niedostępnego zwykłym śmiertelnikom. Może przełamywać bariery czasu i przestrzeni, i nawet Śmierć - ostateczna bariera - nie jest mu straszna.");
					Doc_Show		( nDocID );
};


/******************************************************************************************/

INSTANCE  Das_magische_Erz(C_Item)
{	
	name 					=	"Magiczna ruda";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Magiczna ruda";
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
					Doc_PrintLine	( nDocID,  0,"Magiczna ruda");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLines	( nDocID,  0,"Najlepszą rudę do wyrobu wszelkiego rodzaju oręża znaleźć można w kopalniach w dolinie Khorinis. Wykutą z niej broń cechuje niebywała wytrzymałość. Pokłady rudy występują zwykle głęboko pod ziemią, lecz głupcem ten, kto nie podejmie trudu wydobycia jej na światło dzienne. Niewiele jest takich skarbów na świecie...");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");	
					Doc_PrintLines	( nDocID,  1,"Magiczna broń przebije każdy pancerz i pogruchocze każdą tarczę. Zaiste, królewski to oręż i królewską cenę trzeba zapłacić za choćby sztylet wykuty z tego szlachetnego kruszcu. Takoż surową cenę płacą górnicy pracujący w kopalniach. Rudę niełatwo oddzielić od skalnych pokładów, tak jakby z całych sił walczyła, by pozostać w łonie matki Ziemi.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/




/******************************************************************************************/
INSTANCE Schlacht_um_Varant1(C_Item)
{	
	name 					=	"Bitwa o Varrant";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Bitwa o Varrant";
	TEXT[0]				= "Tom 1";
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
					Doc_PrintLines	( nDocID,  0,"...ale sprytny Rhobar postanowił zaatakować. Zebrał swoje siły i kazał im nękać słabszą, prawą flankę nieprzyjaciela. Nie tracąc chwili, król pchnął najlepsze swe oddziały na wroga, i przebił się przezeń niczym miecz przecinający męża. Wojska królewskie parły zatem bez wytchnienia w stronę Varant. Rhobar wiedział wszak, że jedyna szansa ocalenia leży w rozbiciu armii nieprzyjaciela i niedopuszczeniu do połączenia sił Gellona i Lukkora.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Najpierw jednak postanowił przeciąć ich linie zaopatrzenia...");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"...Gellon poległ a jego armia poszła w rozsypkę. Ale Rhobar nie zamierzał dać przeciwnikowi chwili wytchnienia i rzucił swe siły na pozostałe oddziały wroga. Tu jednak Lukkor rzucił się na królewskich znienacka i zadał straszliwy cios wyczerpanym wojskom Rhobara...");
					
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/
INSTANCE Schlacht_um_Varant2(C_Item)
{	
	name 					=	"Bitwa o Varrant";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Bitwa o Varrant";
	TEXT[0]				= "Tom 2";
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
					Doc_PrintLines	( nDocID,  0,"Wojna była skończona. Varant straciło swe morskie porty, tak potrzebne dla zaopatrywania armii. Król Rhobar nie tracił więcej czasu na polu bitwy, lecz zostawił swych generałów, by ci rozprawili się z niedobitkami nieprzyjaciela. Varrantczycy posiadali już tylko jedno ognisko oporu, zgromadzone wokół Lukkora, najpotężniejszego generała całego narodu, który umiejętnie zamienił porażkę w zwycięstwo.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Ale teraz jego armia znalazła się w potrzasku. Sytuacja zdała się być beznadziejna, choć jego wojska przewyższały siły królewskie liczbą i wyposażeniem. Oto jeden z Myrtańskich bohaterów, mężny generał imieniem Lee, zwabił przeciwnika w pułapkę. Na podmokłej, bagnistej ziemi ciężka kawaleria Lukkora nie miała szans w starciu ze zwinnymi żołnierzami Lee. Zdziesiątkowane oddziały Varantu wkrótce musiały uznać wyższość przeciwnika. Lukkor został pokonany.");
					
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/
INSTANCE Myrtanas_Lyrik(C_Item)
{	
	name 					=	"Poezja Myrtańska";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Poezja Myrtańska";

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
					Doc_PrintLine	( nDocID,  0,"    Pieśń");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0,"        Skruchy");
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
					Doc_PrintLines	( nDocID,  1,"Na początku była moc, jak jasny śnieg biała,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Dziś niewielka cząstka dawnej chwały pozostała.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Przypomina o jedności z dawnych lat,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"jakże różnej od chciwości, którą świat");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"nasz zdeptał i odrzucił po wsze czasy.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Nasz duch nie zdzierżył ostatecznej próby,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"a pożądanie będzie źródłem naszej zguby.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Bo nie masz już jedności na tym świecie.");				
					Doc_PrintLines	( nDocID,  1,"");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Lehren_der_Goetter1 (C_ITEM)
{	
	name 					=	"Mądrość Bogów, tom 1";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Mądrość Bogów";
	TEXT[0]				= "Tom 1";
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
					Doc_PrintLines	( nDocID,  0,"Wysłuchajcie słów bożych, bo pragną oni, byście ich wysłuchali. Przestrzegajcie praw bożych, bo chcą oni, byście ich przestrzegali. Czcijcie kapłanów bożych, bo oni są wybrańcami łaski...");
					Doc_PrintLine	( nDocID,  0,"");
					//Absatz
					Doc_PrintLines	( nDocID,  0,"Słowa Innosa: A gdybyście nie mogli ich pojąć, nie odrzucajcie słów kapłanów, bo głoszą oni moją mądrość. Gdyż ja jestem Słońcem na niebie, światłem i życiem na Ziemi. A wszystko, co wrogiem jest Słońca, jest i moim wrogiem, i zostanie wygnane do krainy wiecznej ciemności.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"Słowa Adanosa: Żyjcie i pracujcie, bo dzień stworzono po to, by mąż mógł żyć i pracować. Szukajcie wiedzy, byście mogli przekazać ją synom swoim, gdyż taka jest wola moja. Ale strzeżcie się, bo człek głupi i leniwy zostanie wygnany do krainy wiecznej ciemności.");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Słowa Beliara: A ktokolwiek wystąpi przeciw woli bożej, ze mną będzie miał do czynienia. Na jego ciało ból ześlę okrutny, a jego duch pójdzie ze mną do krainy wiecznej ciemności.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Lehren_der_Goetter2 (C_ITEM)
{	
	name 					=	"Mądrość Bogów, tom 2";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Mądrość Bogów";
	TEXT[0]				= "Tom 2";
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
					Doc_PrintLines	( nDocID,  0,"O zaraniu dziejów: Na początku nie było dnia ani nocy, i żadne żywe stworzenie nie przemierzało świata. Wtedy pojawił się Innos, a jego blask padał na Ziemię. Innos obdarzył świat darem życia. Ale żadne stworzenie nie śmiało spojrzeć w twarz Innosa, więc dobry bóg stworzył Słońce. Lecz mimo to, jasność była zbyt wielka, toteż Innos podzielił się na dwoje i tak powstał Beliar. Beliar stworzył noc. Teraz człowiek mógł wreszcie żyć, lecz nie wiedział jak. Dlatego Innos podzielił się po raz wtóry i tak powstał Adanos. Adanos przyniósł ludziom pomysłowość i mądrość, której tak bardzo potrzebowali.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Dlatego Innos postanowił zostawić ludzkość pod opieką Adanosa i udał się na spoczynek. Lecz Beliar płonął z zazdrości, gdyż ludzie bali się go i nie oddawali mu czci. Tedy postanowił Beliar stworzyć człowieka, który modliłby się tylko do niego. Ale człowiek ów był jako wszyscy inni, i bał się Beliara i nie oddawał mu czci. Bóg nocy rozzłościł się i zabił człowieka krzycząc: Dobrze! Bójcie się mnie zatem, ale cześć oddacie mi, choćby po śmierci. Tymi słowy ustanowił Beliar Śmierć - kres żywota ludzkiego.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Lehren_der_Goetter3 (C_ITEM)
{	
	name 					=	"Mądrość Bogów, tom 3";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Mądrość Bogów";
	TEXT[0]				= "Tom 3";

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
					Doc_PrintLines	( nDocID,  0,"Innos pozwolił, by ludzie mogli go usłyszeć i przemawiać do niego. Pozwolił im również czynić cuda i nazwał je magią. Dzięki magii, ludzie zaczęli zmieniać świat wedle swego upodobania, jedni mądrze, inni głupio. Widząc to, Innos zabrał dar magii ludziom głupim i pozostawił go w rękach ludzi światłych. Obdarzył ich również innymi łaskami, czyniąc swoimi kapłanami i nadając im miano magów.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
 					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Ludzie czcili kapłanów Innosa i oddawali im cześć, ale wielu magów odwróciło się od Innosa i uciekło się pod opiekę jego boskiego brata - Adanosa. Kasta magów uległa rozbiciu. Ci, którzy podążali za bogiem mądrości nazwali siebie magami Kręgu Wody. Wyznawcy Innosa nazywani zaś byli Magami Ognia.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Jagd_und_Beute (C_ITEM)
{	
	name 					=	"Łowy i zwierzyna";
	mainflag 				=	ITEM_KAT_DOCS;			
									
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Łowy i zwierzyna";
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
					Doc_PrintLines	( nDocID,  0,"Jego zapiski przetrwały całe wieki i po dziś dzień uznawane są za najznakomitsze kompendium wiedzy o polowaniu. Po długich latach starć na północnym pograniczu, niemal każdy obywatel potrafi posługiwać się łukiem. Jednak sztuka polowania daleko wykracza poza podstawowe zasady strzelania z łuku! Zwierzyna jest wszak płocha i nieprzewidywalna!");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Polowanie z łukiem ma swe początki w czasach starożytnych. W ciągu całych tysiącleci nie zaszły w technikach łowieckich większe zmiany i tak już najprawdopodobniej pozostanie. Jakie czynniki wpływają tak naprawdę na skuteczność posługiwania się łukiem? To właśnie rozpoznanie tych czynników czyni prawdziwego mistrza łucznictwa.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Kampfkunst (C_ITEM)
{	
	name 					=	"Sztuka walki";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Sztuka walki";
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
					Doc_PrintLines	( nDocID,  0,"Od 2000 lat nauki mistrzów kształtują rozwój sztuki walki.");
  					Doc_PrintLine	( nDocID,  0,"");					
  					Doc_PrintLine	( nDocID,  0,"");					
   					Doc_PrintLines	( nDocID,  0,"Zręczność, opanowanie, szybkość, zdolność obserwacji i błyskawicznego podejmowania decyzji - wszystkie te umiejętności należy bezustannie doskonalić. Jedynie doskonała koordynacja ruchów i zachowanie właściwej postawy pozwolą na prawidłowy rozwój twych umiejętności.");			
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Przesłanie duchowych i cielesnych nauk Mistrza przetrwało wiele lat.");
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
 					Doc_PrintLines	( nDocID,  1,"Jego niepospolity sukces był natchnieniem dla kolejnych pokoleń. Świat zmieniał się bez przerwy, ale idealna harmonia sił duchowych i sprawności ciała pozostała niezmienną.");					
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Die_Gruft (C_ITEM)
{	
	name 				=	"Krypta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	0;

	value 				=	100;

	visual 				=	"ItWr_Book_02_03.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"MAP";
	description			= "Krypta";
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};




/******************************************************************************************/
INSTANCE Astronomie (C_ITEM)
{	
	name 					=	"Astronomia";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Astronomia";
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
					Doc_PrintLines	( nDocID,  0,"W centrum wszechświata znajduje się Morgrad, co zawiera cztery żywioły - ziemię, wodę, ogień i wiatr. Morgrad, co jest wiecznie niespokojnym sercem Beliara. A nad nim rozciąga się sfera niebios.");
					Doc_PrintLine	( nDocID,  0,"");
					//Absatz
					Doc_PrintLines	( nDocID,  0,"W odwiecznej hierarchii kosmosu człowiek stoi pośrodku. Jego dusza pozwala mu doświadczać łask niebiańskich, ale jego ciało stworzone jest z substancji Morgradu. Jest więc człowiek odzwierciedleniem całego świata.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"Orbity wszystkich planet, czyli drogi, jakie pokonują okrążając Morgrad, zmieniają się nieznacznie z upływem lat. Pewnym jest zatem, iż cały wszechświat zmierza powoli do jakiegoś celu.");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Obserwując ruch księżyca na nocnym niebie ustaliliśmy długość roku i stworzyliśmy pierwszy kalendarz.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/

/******************************************************************************************/
INSTANCE Rezepturen (C_ITEM)
{	
	name 					=	"Przepisy";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Przepisy";
	TEXT[0]				= "Tom 1";
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
					Doc_PrintLines	( nDocID,  0,"Balsam widzenia:");
					Doc_PrintLine	( nDocID,  0,"----------------");
					Doc_PrintLine	( nDocID,  0,"");		
					Doc_PrintLines	( nDocID,  0,"Polejcie oczy pacjenta żrącą żółcią. Żółć zada mu ból okrutny, przez który całkiem zmądrzeje i nauczy się widzieć to czego wcześniej nie widział i cieszyć z tego, co miał do tej pory!");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Żółć i wiedza nie idą w parze i są jako ogień i woda. Dlatego mędrzec potrafi nad żółcią panować, by nie prowadziła go do awanturnictwa i inszych ekscesów. Tylko ten, co w pełni doceni boski dar życia, w pełni to życie wykorzysta.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Rezepturen2 (C_ITEM)
{	
	name 					=	"Przepisy";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Przepisy";
	TEXT[0]				= "Tom 2";
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
					Doc_PrintLines	( nDocID,  0,"Wino zapomnienia");
					Doc_PrintLine	( nDocID,  0,"--------------------");
						Doc_PrintLine	( nDocID,  0,"");			
					Doc_PrintLines	( nDocID,  0,"Najzacniejsze winogrona najdziecie na wysokich zboczach Archolos. Sztuka dojrzewania winnych kiści leży w niezakłócaniu ich spokoju. Teraz dodać jeno właściwych ziół i czekać na efekty.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Tak oto prawdziwy mistrz zamienia wodę ze studni w zacne wino. Ludzie radują się, chwalą jego dzieło. A mistrz dalej działa w zgodzie z Naturą, czerpiąc z tego, co ona mu hojną ręką udziela.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/


INSTANCE TagebuchOT (C_Item)
{	
	name 					=	"Dziennik";

	mainflag 					=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 					=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Dziennik";
	TEXT[0]				= "Stara, zniszczona księga.";
	////COUNT[0]			= ;
	TEXT[1]				= "Brakuje kilku kartek.";
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
					Doc_PrintLine		( nDocID,  0,"Dzień 23");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0,"Zatraciłem już poczucie czasu.");
					Doc_PrintLines	( nDocID,  0,"Zdaje się, że minęły co najmniej 23 dni od chwili, gdy zostaliśmy schwytani przez orków i zmuszeni do pracy.");
					Doc_PrintLines	( nDocID,  0,"Te podłe istoty nie znają litości! Słabsi z nas po prostu padają na ziemię i już się nie podnoszą!");
					Doc_PrintLines	( nDocID,  0,"Ucieknę stąd, nieważne jak!");
					Doc_PrintLine		( nDocID,  0,"");
					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  0,"Dzień 28");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0,"Kazali nam kopać jeszcze dalej, w głąb góry.");
					Doc_PrintLines	( nDocID,  0,"Przednia część jest już gigantyczna. Ciekawe, czemu to wszystko ma służyć?");

					//1.Seite	
  					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1); //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  1,"Dzień 67");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  1,"Podobno ci orkowi kapłani nie mają serc. Jeśli to prawda, jakim cudem nadal się poruszają?");
					Doc_PrintLines	( nDocID,  1,"Widziałem miecz, którego tak bardzo się boją. Gdyby udało mi się go zdobyć, już ja bym im pokazał...");
					Doc_PrintLine		( nDocID,  1,"");
					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);   //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  1,"Dzień 78");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  1,"Miecz spoczywa w przedniej komorze świątyni, ale bezustannie strzeże go jeden z kapłanów.");
					Doc_PrintLines	( nDocID,  1,"Zamierzam stąd uciec. Zostawię tu mój pamiętnik, może komuś się jeszcze przyda.");
					Doc_Show		( nDocID );
};


INSTANCE ItWr_Bloodfly_01(C_Item)
{	
	name 					=	"Krwiopijcy";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Krwiopijcy";
	
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
 					Doc_PrintLine	( nDocID,  0,"Krwiopijcy");
  					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLine	( nDocID,  0," ");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0,"O krwiopijcach");
					Doc_PrintLine	( nDocID,  0,"");
					Doc_PrintLines	( nDocID,  0,"Ale w miejscu, gdzie grunt jest podmokły a powietrze wilgotne, krwiopijcy zbierają się stadami, zwabione zapachem potu żywych istot. Swoimi żądłami uśmiercają ofiary i ucztują na ich krwi.");
					Doc_PrintLine	( nDocID,  0,"");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"Myśliwi z bagien nauczyli się pozyskiwać żądła tych drapieżców. W tym celu nacinają wnętrzności krwiopijców i usuwają ostrożnie żądło wraz z otaczającą je tkanką. Następnie zeskrobują niejadalne mięso...");	
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_Show		( nDocID );
					
					if Knows_GetBFSting ==  FALSE
					{
					Knows_GetBFSting = TRUE;
					Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
					B_LogEntry (GE_AnimalTrophies,"Usuwanie żądeł krwiopijców");	
					PrintScreen	("Nowa umiejętność: Usuwanie żądeł krwiopijców", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					};
	};
