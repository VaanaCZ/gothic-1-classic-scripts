
/******************************************************************************************/
INSTANCE ItWr_Book_Circle_01(C_Item)
{	
	name 					=	"Pierwszy Kr¹g";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Pierwszy Kr¹g Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Pierwszy Kr¹g");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Gdy bogowie obdarzyli ludzkoœæ magicznymi mocami, nauczyli ich równie¿ sporz¹dzaæ runy. Wierni wyznawcy przejêli zatem od swych panów zaszczytne zadanie wytwarzania tych œwiêtych artefaktów i zaczêli je wykorzystywaæ. Kr¹g, do którego nale¿y mag, okreœla, jak zaawansowanymi zaklêciami mo¿e siê on pos³ugiwaæ.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Œwiat³o");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Pierwszy dar Innosa dla ludzkoœci. Lœni¹ca kula rozœwietla bezpoœrednie otoczenie maga.");
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
	name 					=	"Drugi Kr¹g";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Drugi Kr¹g Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Drugi Kr¹g");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Wszelka magia czerpie z magicznych zdolnoœci jej u¿ytkownika, zwanego odpowiednio MAGIEM.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Ka¿de wykorzystanie magicznego zaklêcia kosztuje maga czêœæ jego mocy. Ich zapas nazywany bywa czasem iloœci¹ mana.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Uzdrowienie");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Adanos ujrza³, ¿e ludzie s¹ œmiertelni i wiedzia³, ¿e jest to wol¹ Beliara. I rzek³: Nie sprzeciwiê siê woli Beliara, ale dam za to ludziom dar uzdrawiania."); 
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"To zaklêcie uzdrawia maga.");
					Doc_PrintLine	( nDocID,  1,"Zaklêcia czerpi¹ce");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					
					Doc_Show		( nDocID );
	};
										
/******************************************************************************************/
INSTANCE ItWr_Book_Circle_03 (C_Item)
{	
	name 					=	"Trzeci Kr¹g";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Trzeci Kr¹g Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Trzeci Kr¹g");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Niektóre zaklêcia mo¿na na³adowaæ pewn¹ dawk¹ energii magicznej. Nazywamy je zaklêciami odnawialnymi.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Inne zaklêcia dzia³aj¹ tak d³ugo, jak mag udziela im swojej energii mana. Te z kolei nazywane s¹ zaklêciami inwestycyjnymi.");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Kula ognia");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Drugi dar Innosa dla dzieci Ognia. Potê¿ny, magiczny pocisk, spopielaj¹cy ofiary.");
					Doc_PrintLine	( nDocID,  1,"Zaklêcie odnawialne");
					Doc_PrintLine	( nDocID,  1, Text);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Bry³a lodu");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Ofiara otoczona zostaje bry³¹ lodu. Zaklêcie pochodzi z Krêgu Magów Wody.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Piorun kulisty");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Potê¿ny pocisk magiczny.");
					Doc_PrintLine	( nDocID,  1,  Text_2);
					Doc_Show		( nDocID );
	};
		


/******************************************************************************************/
INSTANCE ItWr_Book_Circle_04 (C_Item)
{	
	name 					=	"Czwarty Kr¹g";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	200;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Czwarty Kr¹g Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Czwarty Kr¹g");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Magia");
					Doc_PrintLine	( nDocID,  0,"Teleportacji");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Szczególna natura tych zaklêæ le¿y w tym, i¿ choæ zawarte s¹ w runach, korzystaæ z nich mo¿e ka¿da osoba obdarzona moc¹ magiczn¹. Magiczne formu³y zostaj¹ wyzwolone w sposób natychmiastowy, zaœ samo zaklêcie teleportacji nie jest w ¿aden sposób ograniczone.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					
					
					Doc_PrintLine	( nDocID,  1,"Ognista burza");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Podobnie jak w Kuli ognia, energia tego zaklêcia kierowana jest przeciwko kolejnym ofiarom.");
					Doc_PrintLine	( nDocID,  1,"Zaklêcie odnawialne");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text);
					Doc_PrintLine	( nDocID,  1,"Grom");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Magiczna energia przeskakuje od jednej ofiary do drugiej. Zdarza siê, ¿e nawet mag mo¿e paœæ ofiar¹ tego zaklêcia!");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1,"Œmieræ o¿ywieñcom");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"To zaklêcie przeznaczone jest do walki z piekielnymi zastêpami o¿ywieñców.");	
					Doc_PrintLine	( nDocID,  1, Text_2);
					
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE  ItWr_Book_Circle_05(C_Item)
{	
	name 					=	"Pi¹ty Kr¹g";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	250;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= "Pi¹ty Kr¹g Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Pi¹ty Kr¹g");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Deszcz ognia");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLines	( nDocID,  0,"Œwiêty Ogieñ niesie zag³adê wszystkim istotom znajduj¹cym siê w pobli¿u maga.");
					Doc_PrintLine	( nDocID,  0, Text_1);					
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Lodowa fala");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Magiczna fala lodu zamra¿a grupê nieprzyjació³ na krótki okres czasu, uniemo¿liwiaj¹c im ruch i zadaj¹c obra¿enia.");
					Doc_PrintLines	( nDocID,  1,"Zaklêcie z Krêgu Magów Wody.");
					Doc_PrintLine	( nDocID,  1, Text_2);
					Doc_Show		( nDocID );
};

INSTANCE  ItWr_Book_Circle_06(C_Item)
{	
	name 					=	"Szósty Kr¹g";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	300;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Szósty Kr¹g Magii";
	
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
					Doc_PrintLine	( nDocID,  0,"Szósty Kr¹g");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0,"Tchnienie œmierci");
					Doc_PrintLine	( nDocID,  0,"---------------");
					Doc_PrintLines	( nDocID,  0,"Oddech Beliara. Zaklêcie to potrafi natychmiast powaliæ nawet najpotê¿niejsze istoty.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, Text);					
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Pierœcieñ œmierci");
					Doc_PrintLine	( nDocID,  1,"---------------");
					Doc_PrintLines	( nDocID,  1,"Nie zachowa³y siê prawie ¿adne zapiski o runie zawieraj¹cej magiczn¹ moc URIZIELA.");	
					Doc_PrintLines	( nDocID,  1,"Wiadomo tylko, ¿e pochodzi ona wprost od Beliara.");
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
					Doc_PrintLines	( nDocID,  0,"Z dawien dawna cz³ek próbowa³ zg³êbiæ naturê i genezê sztuk magicznych. Jeno gdzie rozpocz¹æ takie poszukiwania? Czy magiê mo¿na w ogóle opisaæ? Pró¿no szukaæ równie niespójnego zjawiska we œwiecie: wszak magia jednako leczy i zabija, tworzy i niszczy.");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Gdzie zatem szukaæ tej nieopisanej potêgi? Magia jest tym, czym jest - najpotê¿niejszym i najwspanialszym darem, jaki cz³owiek otrzyma³ od bogów. Baczcie jeno, by dar ów rych³o nie sta³ siê przekleñstwem, gdy¿ nieliczni bêd¹ w stanie zrozumieæ magiê i wykorzystaæ j¹ do w³asnych celów. Inni sami zostan¹ wykorzystani.");	
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
					Doc_PrintLines	( nDocID,  0,"Magia nie zamieszkuje w ciele samego magusa. Jest on raczej jako zmyœlny rzemieœlnik, a ona jako narzêdzie jego. Tako¿ pocz¹tkuj¹cy magus uczy siê jak on¹ moc okie³znaæ i kierowaæ ni¹ wedle swojej woli.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Jego duch nadaje owej mocy po¿¹dany kszta³t, ogniskuje j¹ i wreszcie uwalnia. W takich chwilach dusza magusa wznosi siê ponad nasz œwiat i spoziera na Drug¹ Stronê, gdzie stoi pa³ac potêgi, któr¹ on kszta³tuje i przekazuje.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,"Barthos z Laran");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Machtvolle_Kunst (C_Item)
{	
	name 					=	"Wszechpotê¿na Sztuka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Wszechpotê¿na Sztuka";
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
					Doc_PrintLine	( nDocID,  0,"Wszechpotê¿na");
					Doc_PrintLine	( nDocID,  0, "Sztuka");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Ksiêga dla tych, co w sztukach magicznych uczeni s¹.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Umiejêtnoœci magusa wzrastaj¹ z czasem. Najpierw jest jako ziarno zbo¿a, które trzeba chroniæ, by nie zmarnia³o. Lecz wkrótce ziarno wypuszcza kie³ki, staj¹c siê piêkn¹ roœlin¹.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Z ka¿dym nowym dniem roœlina staje siê wiêksza i silniejsza. Tak samo jest z magusem. Na pocz¹tku nauki jego si³y s¹ w¹t³e, lecz z czasem okrzepnie, staj¹c siê potê¿niejszym. Ci¹g³e d¹¿enie do absolutnej perfekcji powinno byæ nadrzêdnym celem ka¿dego adepta magii. Ziarno potêgi dane im przez bogów jest bowiem najcenniejszym darem, jakie œmiertelnik mo¿e otrzymaæ.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Elementare_Arcanei (C_Item)
{	
	name 					=	"Arcanum ¯ywio³ów";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Arcanum ¯ywio³ów";
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
					Doc_PrintLine	( nDocID,  0,"Arcanum ¯ywio³ów");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Miejsce Magii w ziemskim porz¹dku");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"Wiele badañ przeprowadzono, g³owi¹c siê nad zale¿noœci¹ magii od wszelakich ¿ywio³ów. W rezultacie przyjêto, i¿ jest ona - magia - ostatecznym, najpotê¿niejszym ¿ywio³em ze wszystkich. Wszak to dziêki niej magus mo¿e kszta³towaæ pozosta³e si³y natury wedle w³asnego upodobania.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Ka¿dy ¿ywio³, w swej najczystszej formie, ujawnia powi¹zania z magi¹. Oczywiœcie, naturalne manifestacje takich powi¹zañ nale¿¹ do rzadkoœci i s¹ skrzêtnie poszukiwane. Zdolnoœæ magusa do kontrolowania potêgi ¿ywio³ów stanowi ostateczny dowód, i¿ magia jest najczystszym i najwspanialszym dobrem obecnym w naszej egzystencji.");
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
					Doc_PrintLines	( nDocID,  0,"Œwiêta powinnoœæ Mêdrca");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0,"To potêga odró¿nia magusa od zwyk³ego œmiertelnika. W³adny wykorzystywaæ bosk¹ moc, magus wyjêty jest spod tych wszystkich praw natury, które dotycz¹ ludzi prostych i królów jednako.");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");	
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1,"Gdy magus osi¹gnie poziom, który pozwoli mu wykroczyæ poza granice ludzkiej egzystencji, wstêpuje do œwiata niedostêpnego zwyk³ym œmiertelnikom. Mo¿e prze³amywaæ bariery czasu i przestrzeni, i nawet Œmieræ - ostateczna bariera - nie jest mu straszna.");
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
					Doc_PrintLines	( nDocID,  0,"Najlepsz¹ rudê do wyrobu wszelkiego rodzaju orê¿a znaleŸæ mo¿na w kopalniach w dolinie Khorinis. Wykut¹ z niej broñ cechuje niebywa³a wytrzyma³oœæ. Pok³ady rudy wystêpuj¹ zwykle g³êboko pod ziemi¹, lecz g³upcem ten, kto nie podejmie trudu wydobycia jej na œwiat³o dzienne. Niewiele jest takich skarbów na œwiecie...");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");	
					Doc_PrintLines	( nDocID,  1,"Magiczna broñ przebije ka¿dy pancerz i pogruchocze ka¿d¹ tarczê. Zaiste, królewski to orê¿ i królewsk¹ cenê trzeba zap³aciæ za choæby sztylet wykuty z tego szlachetnego kruszcu. Tako¿ surow¹ cenê p³ac¹ górnicy pracuj¹cy w kopalniach. Rudê nie³atwo oddzieliæ od skalnych pok³adów, tak jakby z ca³ych si³ walczy³a, by pozostaæ w ³onie matki Ziemi.");
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
					Doc_PrintLines	( nDocID,  0,"...ale sprytny Rhobar postanowi³ zaatakowaæ. Zebra³ swoje si³y i kaza³ im nêkaæ s³absz¹, praw¹ flankê nieprzyjaciela. Nie trac¹c chwili, król pchn¹³ najlepsze swe oddzia³y na wroga, i przebi³ siê przezeñ niczym miecz przecinaj¹cy mê¿a. Wojska królewskie par³y zatem bez wytchnienia w stronê Varant. Rhobar wiedzia³ wszak, ¿e jedyna szansa ocalenia le¿y w rozbiciu armii nieprzyjaciela i niedopuszczeniu do po³¹czenia si³ Gellona i Lukkora.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Najpierw jednak postanowi³ przeci¹æ ich linie zaopatrzenia...");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"...Gellon poleg³ a jego armia posz³a w rozsypkê. Ale Rhobar nie zamierza³ daæ przeciwnikowi chwili wytchnienia i rzuci³ swe si³y na pozosta³e oddzia³y wroga. Tu jednak Lukkor rzuci³ siê na królewskich znienacka i zada³ straszliwy cios wyczerpanym wojskom Rhobara...");
					
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
					Doc_PrintLines	( nDocID,  0,"Wojna by³a skoñczona. Varant straci³o swe morskie porty, tak potrzebne dla zaopatrywania armii. Król Rhobar nie traci³ wiêcej czasu na polu bitwy, lecz zostawi³ swych genera³ów, by ci rozprawili siê z niedobitkami nieprzyjaciela. Varrantczycy posiadali ju¿ tylko jedno ognisko oporu, zgromadzone wokó³ Lukkora, najpotê¿niejszego genera³a ca³ego narodu, który umiejêtnie zamieni³ pora¿kê w zwyciêstwo.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Ale teraz jego armia znalaz³a siê w potrzasku. Sytuacja zda³a siê byæ beznadziejna, choæ jego wojska przewy¿sza³y si³y królewskie liczb¹ i wyposa¿eniem. Oto jeden z Myrtañskich bohaterów, mê¿ny genera³ imieniem Lee, zwabi³ przeciwnika w pu³apkê. Na podmok³ej, bagnistej ziemi ciê¿ka kawaleria Lukkora nie mia³a szans w starciu ze zwinnymi ¿o³nierzami Lee. Zdziesi¹tkowane oddzia³y Varantu wkrótce musia³y uznaæ wy¿szoœæ przeciwnika. Lukkor zosta³ pokonany.");
					
					Doc_Show		( nDocID );
	};
	
/******************************************************************************************/
INSTANCE Myrtanas_Lyrik(C_Item)
{	
	name 					=	"Poezja Myrtañska";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Poezja Myrtañska";

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
					Doc_PrintLine	( nDocID,  0,"    Pieœñ");
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
					Doc_PrintLines	( nDocID,  1,"Na pocz¹tku by³a moc, jak jasny œnieg bia³a,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Dziœ niewielka cz¹stka dawnej chwa³y pozosta³a.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Przypomina o jednoœci z dawnych lat,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"jak¿e ró¿nej od chciwoœci, któr¹ œwiat");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"nasz zdepta³ i odrzuci³ po wsze czasy.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Nasz duch nie zdzier¿y³ ostatecznej próby,");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"a po¿¹danie bêdzie Ÿród³em naszej zguby.");				
					Doc_PrintLine	( nDocID,  1,"");				
					Doc_PrintLines	( nDocID,  1,"Bo nie masz ju¿ jednoœci na tym œwiecie.");				
					Doc_PrintLines	( nDocID,  1,"");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Lehren_der_Goetter1 (C_ITEM)
{	
	name 					=	"M¹droœæ Bogów, tom 1";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "M¹droœæ Bogów";
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
					Doc_PrintLines	( nDocID,  0,"Wys³uchajcie s³ów bo¿ych, bo pragn¹ oni, byœcie ich wys³uchali. Przestrzegajcie praw bo¿ych, bo chc¹ oni, byœcie ich przestrzegali. Czcijcie kap³anów bo¿ych, bo oni s¹ wybrañcami ³aski...");
					Doc_PrintLine	( nDocID,  0,"");
					//Absatz
					Doc_PrintLines	( nDocID,  0,"S³owa Innosa: A gdybyœcie nie mogli ich poj¹æ, nie odrzucajcie s³ów kap³anów, bo g³osz¹ oni moj¹ m¹droœæ. Gdy¿ ja jestem S³oñcem na niebie, œwiat³em i ¿yciem na Ziemi. A wszystko, co wrogiem jest S³oñca, jest i moim wrogiem, i zostanie wygnane do krainy wiecznej ciemnoœci.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"S³owa Adanosa: ¯yjcie i pracujcie, bo dzieñ stworzono po to, by m¹¿ móg³ ¿yæ i pracowaæ. Szukajcie wiedzy, byœcie mogli przekazaæ j¹ synom swoim, gdy¿ taka jest wola moja. Ale strze¿cie siê, bo cz³ek g³upi i leniwy zostanie wygnany do krainy wiecznej ciemnoœci.");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"S³owa Beliara: A ktokolwiek wyst¹pi przeciw woli bo¿ej, ze mn¹ bêdzie mia³ do czynienia. Na jego cia³o ból zeœlê okrutny, a jego duch pójdzie ze mn¹ do krainy wiecznej ciemnoœci.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Lehren_der_Goetter2 (C_ITEM)
{	
	name 					=	"M¹droœæ Bogów, tom 2";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "M¹droœæ Bogów";
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
					Doc_PrintLines	( nDocID,  0,"O zaraniu dziejów: Na pocz¹tku nie by³o dnia ani nocy, i ¿adne ¿ywe stworzenie nie przemierza³o œwiata. Wtedy pojawi³ siê Innos, a jego blask pada³ na Ziemiê. Innos obdarzy³ œwiat darem ¿ycia. Ale ¿adne stworzenie nie œmia³o spojrzeæ w twarz Innosa, wiêc dobry bóg stworzy³ S³oñce. Lecz mimo to, jasnoœæ by³a zbyt wielka, tote¿ Innos podzieli³ siê na dwoje i tak powsta³ Beliar. Beliar stworzy³ noc. Teraz cz³owiek móg³ wreszcie ¿yæ, lecz nie wiedzia³ jak. Dlatego Innos podzieli³ siê po raz wtóry i tak powsta³ Adanos. Adanos przyniós³ ludziom pomys³owoœæ i m¹droœæ, której tak bardzo potrzebowali.");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Dlatego Innos postanowi³ zostawiæ ludzkoœæ pod opiek¹ Adanosa i uda³ siê na spoczynek. Lecz Beliar p³on¹³ z zazdroœci, gdy¿ ludzie bali siê go i nie oddawali mu czci. Tedy postanowi³ Beliar stworzyæ cz³owieka, który modli³by siê tylko do niego. Ale cz³owiek ów by³ jako wszyscy inni, i ba³ siê Beliara i nie oddawa³ mu czci. Bóg nocy rozz³oœci³ siê i zabi³ cz³owieka krzycz¹c: Dobrze! Bójcie siê mnie zatem, ale czeœæ oddacie mi, choæby po œmierci. Tymi s³owy ustanowi³ Beliar Œmieræ - kres ¿ywota ludzkiego.");
					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE Lehren_der_Goetter3 (C_ITEM)
{	
	name 					=	"M¹droœæ Bogów, tom 3";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "M¹droœæ Bogów";
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
					Doc_PrintLines	( nDocID,  0,"Innos pozwoli³, by ludzie mogli go us³yszeæ i przemawiaæ do niego. Pozwoli³ im równie¿ czyniæ cuda i nazwa³ je magi¹. Dziêki magii, ludzie zaczêli zmieniaæ œwiat wedle swego upodobania, jedni m¹drze, inni g³upio. Widz¹c to, Innos zabra³ dar magii ludziom g³upim i pozostawi³ go w rêkach ludzi œwiat³ych. Obdarzy³ ich równie¿ innymi ³askami, czyni¹c swoimi kap³anami i nadaj¹c im miano magów.");
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
 					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Ludzie czcili kap³anów Innosa i oddawali im czeœæ, ale wielu magów odwróci³o siê od Innosa i uciek³o siê pod opiekê jego boskiego brata - Adanosa. Kasta magów uleg³a rozbiciu. Ci, którzy pod¹¿ali za bogiem m¹droœci nazwali siebie magami Krêgu Wody. Wyznawcy Innosa nazywani zaœ byli Magami Ognia.");
					Doc_Show		( nDocID );
	};
/******************************************************************************************/
INSTANCE Jagd_und_Beute (C_ITEM)
{	
	name 					=	"£owy i zwierzyna";
	mainflag 				=	ITEM_KAT_DOCS;			
									
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "£owy i zwierzyna";
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
					Doc_PrintLines	( nDocID,  0,"Jego zapiski przetrwa³y ca³e wieki i po dziœ dzieñ uznawane s¹ za najznakomitsze kompendium wiedzy o polowaniu. Po d³ugich latach staræ na pó³nocnym pograniczu, niemal ka¿dy obywatel potrafi pos³ugiwaæ siê ³ukiem. Jednak sztuka polowania daleko wykracza poza podstawowe zasady strzelania z ³uku! Zwierzyna jest wszak p³ocha i nieprzewidywalna!");
					
					//2.Seite

					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Polowanie z ³ukiem ma swe pocz¹tki w czasach staro¿ytnych. W ci¹gu ca³ych tysi¹cleci nie zasz³y w technikach ³owieckich wiêksze zmiany i tak ju¿ najprawdopodobniej pozostanie. Jakie czynniki wp³ywaj¹ tak naprawdê na skutecznoœæ pos³ugiwania siê ³ukiem? To w³aœnie rozpoznanie tych czynników czyni prawdziwego mistrza ³ucznictwa.");
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
					Doc_PrintLines	( nDocID,  0,"Od 2000 lat nauki mistrzów kszta³tuj¹ rozwój sztuki walki.");
  					Doc_PrintLine	( nDocID,  0,"");					
  					Doc_PrintLine	( nDocID,  0,"");					
   					Doc_PrintLines	( nDocID,  0,"Zrêcznoœæ, opanowanie, szybkoœæ, zdolnoœæ obserwacji i b³yskawicznego podejmowania decyzji - wszystkie te umiejêtnoœci nale¿y bezustannie doskonaliæ. Jedynie doskona³a koordynacja ruchów i zachowanie w³aœciwej postawy pozwol¹ na prawid³owy rozwój twych umiejêtnoœci.");			
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
					Doc_PrintLines	( nDocID,  1,"Przes³anie duchowych i cielesnych nauk Mistrza przetrwa³o wiele lat.");
  					Doc_PrintLine	( nDocID,  1,"");					
  					Doc_PrintLine	( nDocID,  1,"");					
 					Doc_PrintLines	( nDocID,  1,"Jego niepospolity sukces by³ natchnieniem dla kolejnych pokoleñ. Œwiat zmienia³ siê bez przerwy, ale idealna harmonia si³ duchowych i sprawnoœci cia³a pozosta³a niezmienn¹.");					
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
					Doc_PrintLines	( nDocID,  0,"W centrum wszechœwiata znajduje siê Morgrad, co zawiera cztery ¿ywio³y - ziemiê, wodê, ogieñ i wiatr. Morgrad, co jest wiecznie niespokojnym sercem Beliara. A nad nim rozci¹ga siê sfera niebios.");
					Doc_PrintLine	( nDocID,  0,"");
					//Absatz
					Doc_PrintLines	( nDocID,  0,"W odwiecznej hierarchii kosmosu cz³owiek stoi poœrodku. Jego dusza pozwala mu doœwiadczaæ ³ask niebiañskich, ale jego cia³o stworzone jest z substancji Morgradu. Jest wiêc cz³owiek odzwierciedleniem ca³ego œwiata.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"Orbity wszystkich planet, czyli drogi, jakie pokonuj¹ okr¹¿aj¹c Morgrad, zmieniaj¹ siê nieznacznie z up³ywem lat. Pewnym jest zatem, i¿ ca³y wszechœwiat zmierza powoli do jakiegoœ celu.");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Obserwuj¹c ruch ksiê¿yca na nocnym niebie ustaliliœmy d³ugoœæ roku i stworzyliœmy pierwszy kalendarz.");
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
					Doc_PrintLines	( nDocID,  0,"Polejcie oczy pacjenta ¿r¹c¹ ¿ó³ci¹. ¯ó³æ zada mu ból okrutny, przez który ca³kiem zm¹drzeje i nauczy siê widzieæ to czego wczeœniej nie widzia³ i cieszyæ z tego, co mia³ do tej pory!");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"¯ó³æ i wiedza nie id¹ w parze i s¹ jako ogieñ i woda. Dlatego mêdrzec potrafi nad ¿ó³ci¹ panowaæ, by nie prowadzi³a go do awanturnictwa i inszych ekscesów. Tylko ten, co w pe³ni doceni boski dar ¿ycia, w pe³ni to ¿ycie wykorzysta.");
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
					Doc_PrintLines	( nDocID,  0,"Najzacniejsze winogrona najdziecie na wysokich zboczach Archolos. Sztuka dojrzewania winnych kiœci le¿y w niezak³ócaniu ich spokoju. Teraz dodaæ jeno w³aœciwych zió³ i czekaæ na efekty.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					//Absatz
					Doc_PrintLines	( nDocID,  1,"Tak oto prawdziwy mistrz zamienia wodê ze studni w zacne wino. Ludzie raduj¹ siê, chwal¹ jego dzie³o. A mistrz dalej dzia³a w zgodzie z Natur¹, czerpi¹c z tego, co ona mu hojn¹ rêk¹ udziela.");
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
	TEXT[0]				= "Stara, zniszczona ksiêga.";
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
					Doc_PrintLine		( nDocID,  0,"Dzieñ 23");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0,"Zatraci³em ju¿ poczucie czasu.");
					Doc_PrintLines	( nDocID,  0,"Zdaje siê, ¿e minê³y co najmniej 23 dni od chwili, gdy zostaliœmy schwytani przez orków i zmuszeni do pracy.");
					Doc_PrintLines	( nDocID,  0,"Te pod³e istoty nie znaj¹ litoœci! S³absi z nas po prostu padaj¹ na ziemiê i ju¿ siê nie podnosz¹!");
					Doc_PrintLines	( nDocID,  0,"Ucieknê st¹d, niewa¿ne jak!");
					Doc_PrintLine		( nDocID,  0,"");
					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  0,"Dzieñ 28");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  0,"Kazali nam kopaæ jeszcze dalej, w g³¹b góry.");
					Doc_PrintLines	( nDocID,  0,"Przednia czêœæ jest ju¿ gigantyczna. Ciekawe, czemu to wszystko ma s³u¿yæ?");

					//1.Seite	
  					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1); //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  1,"Dzieñ 67");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  1,"Podobno ci orkowi kap³ani nie maj¹ serc. Jeœli to prawda, jakim cudem nadal siê poruszaj¹?");
					Doc_PrintLines	( nDocID,  1,"Widzia³em miecz, którego tak bardzo siê boj¹. Gdyby uda³o mi siê go zdobyæ, ju¿ ja bym im pokaza³...");
					Doc_PrintLine		( nDocID,  1,"");
					Doc_SetFont 		( nDocID, -1, "font_15_book.tga"); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);   //  0 -> margins are in pixels
					Doc_PrintLine		( nDocID,  1,"Dzieñ 78");
					Doc_SetFont 		( nDocID, -1, "font_10_book.tga");
					Doc_PrintLines	( nDocID,  1,"Miecz spoczywa w przedniej komorze œwi¹tyni, ale bezustannie strze¿e go jeden z kap³anów.");
					Doc_PrintLines	( nDocID,  1,"Zamierzam st¹d uciec. Zostawiê tu mój pamiêtnik, mo¿e komuœ siê jeszcze przyda.");
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
					Doc_PrintLines	( nDocID,  0,"Ale w miejscu, gdzie grunt jest podmok³y a powietrze wilgotne, krwiopijcy zbieraj¹ siê stadami, zwabione zapachem potu ¿ywych istot. Swoimi ¿¹d³ami uœmiercaj¹ ofiary i ucztuj¹ na ich krwi.");
					Doc_PrintLine	( nDocID,  0,"");
					

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLines	( nDocID,  1,"Myœliwi z bagien nauczyli siê pozyskiwaæ ¿¹d³a tych drapie¿ców. W tym celu nacinaj¹ wnêtrznoœci krwiopijców i usuwaj¹ ostro¿nie ¿¹d³o wraz z otaczaj¹c¹ je tkank¹. Nastêpnie zeskrobuj¹ niejadalne miêso...");	
					Doc_PrintLine	( nDocID,  1,"");
					Doc_PrintLine	( nDocID,  1,"");
					Doc_Show		( nDocID );
					
					if Knows_GetBFSting ==  FALSE
					{
					Knows_GetBFSting = TRUE;
					Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
					B_LogEntry (GE_AnimalTrophies,"Usuwanie ¿¹de³ krwiopijców");	
					PrintScreen	("Nowa umiejêtnoœæ: Usuwanie ¿¹de³ krwiopijców", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					};
	};
