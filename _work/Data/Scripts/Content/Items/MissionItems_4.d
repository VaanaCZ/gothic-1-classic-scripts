//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Buch ьber Golems
//---------------------------------------------------------------------
INSTANCE ItWr_GolemBook1(C_Item)
{	
	name 					=	"Арканум Голум - Том первый";
	
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
		Doc_PrintLine	( nDocID,  0,"Арканум Голум - Том первый");
		Doc_PrintLine	( nDocID,  0, "=====================");
		Doc_PrintLines	( nDocID,  0,"(Магия големов)");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLines	( nDocID,  0,"Только тот, кто сам хоть раз сталкивался с этими созданиями, берущими свое начало от первородных элементов, поистине понимает глубину уважения, которым проникается столкнувшийся с ними путешественник.");
		Doc_PrintLine	( nDocID,  0, "");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Rдnder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLine	( nDocID,  1,"Каменный голем");
		Doc_PrintLine	( nDocID,  1,"------------");
		Doc_PrintLines	( nDocID,  1,"Эти каменные колоссы практически неуязвимы. Мечи, топоры и луки не причиняют им ровным счетом никакого вреда.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLines	( nDocID,  1,"Единственным зарегистрированным случаем победы человека над големом является доклад наемника. Он рассказал, что от удара молота в големе появилась трещина. От последовавших затем ударов она стала расширяться, пока голем попросту не развалился на части.");

		Doc_Show		( nDocID );
	};

INSTANCE ItWr_GolemBook2(C_Item)
{	
	name 					=	"Арканум Голум - Том второй";
	
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
		Doc_PrintLine	( nDocID,  0,"АРКАНУМ ГОЛУМ - Том второй");
		Doc_PrintLine	( nDocID,  0, "======================");
		Doc_PrintLine	( nDocID,  0, "");
		Doc_PrintLine	( nDocID,  0,"Ледяной голем");
		Doc_PrintLine	( nDocID,  0,"---------");
		Doc_PrintLines	( nDocID,  0,"Ледяные големы чем-то сродни каменным, только тела их, похоже, состоят из воды. Все известное человеку оружие просто скользит по шкуре этих созданий.");
		Doc_PrintLines	( nDocID,  0,"Путешественники должны также знать и постоянно помнить о ледяном дыхании големов, потому как забывчивые рискуют превратиться в сосульку.");

		//2.Seite
		Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Rдnder des TGAs aus, links,oben,rechts,unten)
		Doc_PrintLines	( nDocID,  1,"Один из магов огня рассказывал как-то, что встречал ледяного голема. При он явно не смог причинить магу сколь-нибудь значительных неприятностей.");
		Doc_PrintLine	( nDocID,  1, "");
		Doc_PrintLine	( nDocID,  1,"Огненный голем");
		Doc_PrintLine	( nDocID,  1,"------------");
		Doc_PrintLines	( nDocID,  1,"Согласно рассказам, эти создания способны превратить человека в пылающий факел одним лишь своим прикосновением.");
		Doc_PrintLines	( nDocID,  1,"Один из случаев столкновения с таким големом был зарегистрирован в прошлом году. Исход схватки остался неизвестен, однако точно установлено, что заклинания молний и льда способны причинить вред огненному голему.");
		Doc_Show		( nDocID );
	};

//---------------------------------------------------------------------
//	Karte der Oberwelt (mit Ork-Gebiet)
//---------------------------------------------------------------------
INSTANCE ItWrWorldmap_Orc(C_Item)
{	
	name 					=	"Карта";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	250;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmap_Orc;

	description				= "Карта колонии (дополненная)";
	TEXT[0]					= "Ур-Шак, шаман орков, дополнил карту";
	TEXT[1]					= "территориями орков!";
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
//	Schlьssel zur Freien Mine
//---------------------------------------------------------------------
INSTANCE ItKe_Freemine(C_Item)
{	
	name 					=	"Ключ к Свободной Шахте";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	value 					=	3;

	visual 					=	"ItKe_Key_01.3ds";
	material 				=	MAT_METAL;
	description			= "Ключ к Свободной Шахте";
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
//	Medizin fьr den verwundeten Orc in der Freien Mine
//---------------------------------------------------------------------
INSTANCE	OrcMedicine(C_ITEM)
{
	name 				= "Орочье снадобье";

	mainflag 			= ITEM_KAT_POTIONS;
	flags 				= ITEM_MISSION;

	value 				= 0;	


	visual 				= "ITFO_POTION_STRENGTH_01.3DS";
	material 			= MAT_GLAS;
	on_state[0]			= UseOrcMedicine;
	scemeName			= "POTION";
	description			= name;

	TEXT[0]				= "Эффект: Неизвестен";
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
	name 			=	"Улу-Мулу";

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
	TEXT[0]			=	"Улу-Мулу является знаком великой силы и";
	TEXT[1]			=	"мужества. На носителя этого знака не";
	TEXT[2]			=	"решится напасть ни один орк!";
	TEXT[3]			=	NAME_Damage;			COUNT[3]	= damageTotal;
	TEXT[4] 		=	NAME_Str_needed;		COUNT[4]	= cond_value[2];
	TEXT[5]			=	NAME_Value; 			COUNT[5]	= value;
};

