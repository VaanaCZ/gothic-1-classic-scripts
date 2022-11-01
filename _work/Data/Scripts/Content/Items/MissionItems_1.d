//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

INSTANCE MordragsRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	250;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_MordragsRing;
	on_unequip				=	UnEquip_MordragsRing;

	description		= "Pierścień Mordraga";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_MordragsRing()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5 );
	};


	FUNC VOID UnEquip_MordragsRing()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-5 );
	};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE SpecialJoint(C_Item)
{
	name 				=	"Przygotowany Zew Nocyl";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3*10;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			=	UseSpecialJoint;

	TEXT[0]		    	= "Bagienne ziele o";
	TEXT[1]             = "mocniejszym działaniu.";
	TEXT[3]             = "To dla Guru Baal-Tyona!";
	TEXT[5]				= NAME_Value;					COUNT[4]	= Value_Joint3*10;
};

func void UseSpecialJoint()
{
	AI_StartState	(self,ZS_MagicSleep,1,"");
};

INSTANCE ItAt_DamLurker_01 (C_Item)
{
	name 				=	"Szpony topielca spod tamy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Lurkerklaue;

	visual 				=	"ItAt_Lurker_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Lurkerklaue*2;
};


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE ItWrOMMap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	30;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOMmap;

	description				= "Mapa do Starej Kopalni";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseOMmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_OldMine.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};



/************************************************
**  Missionsitems für Introparcours in der VM  **
************************************************/

INSTANCE AltesSchwertVM (C_Item)
{	
	name 				=	"Stary Miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	12;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	10 ;
	damageTotal			= 	12;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";

	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};


INSTANCE AltesSchwert (C_Item)
{	
	name 				=	"Stary Miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	12;
	cond_atr[2]   		= ATR_STRENGTH;
	cond_value[2]  		= 10;
	damageTotal			= 	12;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";
	//description			= "";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/************************************************
**               Sit_1_OC_Dexter_SellSword     **
************************************************/

INSTANCE JackalsSword (C_Item)
{	
	name 				=	"Miecz Szakala";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;
	owner				= 	GRD_201_Jackal;

	value 				=	27;
	cond_atr[2]   		= ATR_STRENGTH;
	cond_value[2]  		= 20;
	damageTotal			= 	3;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Short_05.3DS";

	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/****************************************************
**  			KdW-Botenamulett				   **
****************************************************/

instance  KdW_Amulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	100;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	//on_equip		=	Equip_Schutzamulett_Nek;
	//on_unequip	=	UnEquip_Schutzamulett_Nek;

	description		= "Amulet kuriera Magów Wody";
	//TEXT[0]			= "";
	//TEXT[2]			= NAME_Prot_Edge;
	//COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//************* Cronos Brief *****************

INSTANCE Cronos_Brief (C_Item)
{	
	name 				=	"List";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseCronosBrief;
	scemeName			=	"MAP";
	description			= "List Cronosa do Magów Ognia";
};
func void UseCronosBrief ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0," ");
					Doc_PrintLine	( nDocID,  0,"Czcigodny Mistrzu Corristo,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0,"Saturas, szacowny arcymistrz Magów Kręgu Wody, usilnie prosi o zjednoczenie naszych wysiłków w celu rozładowania napięć pomiędzy Starym a Nowym Obozem do poziomu, który sprzyjałby interesom obydwu stron. Jako strona zaopatrująca regularnie Jego Wysokość w magiczną rudę docenicie z pewnością nasze starania o ograniczenie przestępczej działalności Szkodników na terenach przynależących do waszego obozu. My ze swej strony pragniemy otrzymać gwarancję, że członkowie Starego Obozu nie będą przeciwstawiać się próbie przerwania magicznej Bariery, której więźniami pozostajemy przecież my wszyscy.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Załączam wyrazy szacunku,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"            Cronos, Strażnik Rudy");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/****************************************************
**  	 SLY: LOST NEK (Neks Amulett)			   **
****************************************************/

instance  Neks_Amulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	50;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Nek;
	on_unequip		=	UnEquip_Schutzamulett_Nek;

	description		= "Amulet martwego Strażnika"; //Nek's Amulett
	TEXT[1]			= "Wyryto na nim litery NEK.";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Nek()
	{
		self.protection [PROT_EDGE] += 5;
		self.protection [PROT_BLUNT] += 5;
	};


	FUNC VOID UnEquip_Schutzamulett_Nek()
	{
		self.protection [PROT_EDGE] -= 5;
		self.protection [PROT_BLUNT] -= 5;
	};

/*************************************************
**	Missionsitems für Mis_1_Psi_RecruitBuddler  **
*************************************************/
INSTANCE RecruitJoint(C_Item)
{	
	name 					=	"Bagienne ziele dla Kopaczy";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MULTI;	

	hp 				 		=	10;
	hp_max 					=	10;
	weight 					=	1;
	value 					=	1;

	visual 					=	"ItMiJoint.3ds";
	material 				=	MAT_WOOD;

	scemeName				=	"JOINT";
	description			= name;
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

/**************************************************
**    Missionsitems für Mis_3_Psi_BringMedicine  **
**************************************************/

INSTANCE HealthWater(C_Item)
{
	name 					=	"Napój uzdrawiający dla Y'Beriona";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;

	//hp 					=	1;
	//hp_max 				=	1;
	//weight 				=	1;
	value 					=	10;	

	//change_atr[0]				=	ATR_HITPOINTS;
	//change_value[0] 			=	5;

	visual 					=	"ItFo_Potion_Health_01.3ds";
	material 				=	MAT_GLAS;
	//on_state[0]				=	UseAlcohol;
	//scemeName				=	"POTION";
	description			= name;
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

/************************************************
**    Missionsitems für Mis_1_OC_BringList     **
************************************************/
INSTANCE TheList(C_Item)
{	
	name 					=	"Lista";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseTheList;
	description				=	name;

	TEXT[0]					=	"Ian, szef Starej Kopalni spisał";
	TEXT[1]					=	"tutaj swoje zamówienia.";
};
func void UseTheList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0,"Lista zamówień");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0,"20 bochnów chleba - tylko bez pleśni, jeśli łaska!");
					Doc_PrintLine	( nDocID,  0,"25-30 jabłek");
					Doc_PrintLine	( nDocID,  0,"10 kawałków sera");
					Doc_PrintLine	( nDocID,  0,"1 chochla");
					Doc_PrintLine	( nDocID,  0,"1 szczotka");
					Doc_PrintLine	( nDocID,  0,"5 kilofów + 3 młotki");
					Doc_PrintLines	( nDocID,  0,"I uczciwą porcję ziela - no wiecie, pierwsza dostawa w tym miesiącu!");
					Doc_PrintLine	( nDocID,  0,"Spodziewamy się dostawy najpóźniej pojutrze.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"IAN");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

INSTANCE TheListNC(C_Item)
{	
	name 					=	"Lista (poszerzona)";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseTheListNC;
	description				=	name;

	TEXT[0]					=	"Ian, szef Starej Kopalni spisał";
	TEXT[1]					=	"tutaj swoje zamówienia.";
	TEXT[2]					=	"(Lares dodał kilka rzeczy. Trzeba przyznać,";
	TEXT[3]					=	"że fałszerstwo jest nie do wykrycia!)";
};
func void UseTheListNC ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0,"Lista zamówień");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0,"20 bochnów chleba - tylko bez pleśni, jeśli łaska!");
					Doc_PrintLine	( nDocID,  0,"25-30 jabłek");
					Doc_PrintLine	( nDocID,  0,"10 kawałków sera");
					Doc_PrintLine	( nDocID,  0,"1 chochla");
					Doc_PrintLine	( nDocID,  0,"1 szczotka");
					Doc_PrintLine	( nDocID,  0,"5 kilofów + 3 młotki");
					Doc_PrintLines	( nDocID,  0,"I uczciwą porcję ziela - no wiecie, pierwsza dostawa w tym miesiącu!");
					Doc_PrintLine	( nDocID,  0,"Spodziewamy się dostawy najpóźniej pojutrze.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"IAN");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Właśnie mi się przypomniało:");
					Doc_PrintLine	( nDocID,  0,"30 butelek piwa");
					Doc_PrintLine	( nDocID,  0,"5 butelek wina");
					Doc_PrintLine	( nDocID,  0,"25 smażonych udźców ścierwojadów");
					Doc_PrintLine	( nDocID,  0,"z pół tuzina sztuk oręża");
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};


/*********************************************
**   Missionsitems für Lares Find Ring    **
*********************************************/

INSTANCE Lares_Ring(C_Item)
{	
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING || ITEM_MISSION ;	

	value 					=	50;
	
	visual 					=	"ItMi_Ring_01.3ds";
	
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Lares_Ring;
	on_unequip				=	UnEquip_Lares_Ring;
	description		= "Pierścień Laresa";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= ""; 
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Lares_Ring()
	{

		Npc_ChangeAttribute(self,ATR_STRENGTH,3 );
	};

	
	FUNC VOID UnEquip_Lares_Ring()
	{

		Npc_ChangeAttribute(self,ATR_STRENGTH,-3 );
	};
/*********************************************
**   Missionsitems für Lares Get Potion   **
*********************************************/
INSTANCE  Heiltrank(C_Item)
{
	name 			        =	NAME_Trank;

	mainflag 				=	ITEM_KAT_POTIONS;
	flags 					=	ITEM_MULTI||ITEM_MISSION;

	value 					=	100;	

	visual 					=	"ItFo_Potion_Health_01.3ds";
	material 				=	MAT_GLAS;
	on_state[0]				=	UseHeiltrank;
	scemeName				=	"POTION";
	description				= "Napój błyskawicznego uzdrowienia";
	//TEXT[0]				= "";
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= 30;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	TEXT[5]					= NAME_Value; 
	COUNT[5]		= value;
};

FUNC VOID UseHeiltrank()
{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,ATR_HITPOINTS,30);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke meinen Heiltrank");
	
};

/*********************************************
**   Missionsitems für Mordrag    **
*********************************************/

INSTANCE SpecialWater(C_Item)
{
	name 					=	"Magiczna woda";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MISSION;

	value 					=	10;	

	//change_atr[0]				=	ATR_HITPOINTS;
	//change_value[0] 			=	5;

	visual 					=	"ItFoFlaskHealth.3ds";
	material 				=	MAT_GLAS;
	//on_state[0]				=	UseSpecialWater;
	scemeName				=	"POTION";

	description				= name;
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

/*********************************************
**   Missionsitems für Dexter / Kalom	    **
*********************************************/
INSTANCE KalomsRecipe(C_Item)
{
	name 					=	"Receptura Cor Kaloma";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= name;
	TEXT[0]					= "Przepis na napój uzdrawiający.";
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
	on_state[0]			= Use_KalomsRecipe;
};
// ----------------------------------
func VOID Use_KalomsRecipe()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

				Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
				Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
				
				//1.Seite

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
				Doc_PrintLine	( nDocID,  0, ""									);
				Doc_PrintLine	( nDocID,  0,"Lifrun ak Gharak"); 		
				Doc_PrintLine	( nDocID,  0, ""									); 			
				Doc_PrintLines	( nDocID,  0,"Gharak Or Nach bin thu. Lifrun mar Orag chtah. Shrunk esp Horinth.");
				
				//2.Seite

				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1, ""					);					
				Doc_PrintLines	( nDocID,  1,"To zdaje się mieć sens, kiedy czytać to od końca.");
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1,"          - Kalom");	
				
				
				
				
				Doc_Show		( nDocID );
};


/*********************************************
** Missionsitems für Mis_1_PSI_DrugMonopol  **
*********************************************/
/*
INSTANCE SalmAmulett (C_Item)
{	
	name 					=	"Salms Amulett";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	hp 				 		=	1;
	hp_max 					=	1;
	weight 					=	1;
	value 					=	1;
	
	visual 					=	"ItKeKey1.3ds"; //Dummie Objekt
	material 				=	MAT_METAL;

	//scemeName				=	"HORN";
};
*/


/*********************************************
**   Karte der Kolonie (ohne Orc-Gebiet)	**
*********************************************/

INSTANCE ItWrWorldmap(C_Item)
{	
	name 					=	"Mapa kolonii";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmap;

	description				= name;
	TEXT[0]					= "Niestety, brakuje sporego";
	TEXT[1]					= "obszaru na południowym";
	TEXT[2]					= "zachodzie.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World.tga", 	1	);  //  1 -> DO NOT SCALE 

/*  				Doc_SetFont 	( nDocID, 0, "font_15_book.TGA"		); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, 0, 120, 80, 10, 10, 	1	);  //  0 -> Textrahmen (von den Ränder des TGAs aus, links-oben,rechts-unten)
					Doc_PrintLine	( nDocID, 0, "Karte der"	);
					Doc_PrintLine	( nDocID, 0, "Kolonie"	);

// FIXME: mehrere Texte an verschiedenen Stellen für Location-Beschriftung funzen nicht.
 					Doc_SetFont 	( nDocID, 0, "font_10_book.TGA"			); 
					Doc_SetMargins	( nDocID, 0, 110, 300, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Neues Lager");

					Doc_SetMargins	( nDocID, 0, 350, 200, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Altes Lager");

					Doc_SetMargins	( nDocID, 0, 200, 420, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Dämonenbeschwörer");
					
					Doc_SetMargins	( nDocID, 0, 510, 340, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Sekten-Lager");
*/

					Doc_Show		( nDocID 	);
	};

/*********************************************
**   Karte Altes Lager						**
*********************************************/

INSTANCE ItWrOCmap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOCmap;

	description				= "Plan Starego Obozu";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseOCmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_OldCamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   Karte Neues Lager						**
*********************************************/

INSTANCE ItWrNCmap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseNCmap;

	description				= "Plan Nowego Obozu";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseNCmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_NewCamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   Karte PSI-Lager						**
*********************************************/

INSTANCE ItWrPSImap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePSImap;

	description				= "Plan obozu na bagnie";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePSImap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_PSICamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   PinUp Zeichnung						**
*********************************************/

INSTANCE ItWrPinup(C_Item)
{	
	name 					=	"Szkic";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	60;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePinUp;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePinUp()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_PinUp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/********************************************************************************/
INSTANCE ItWrDieVerurteilten (C_Item)
{	
	name 					=	"Skazańcy";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWrBook.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= name;
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


/********************************************************************************/
//				BRIEF AN FEUERMAGIER
/*********************************************************************************/
INSTANCE ItWr_Fire_Letter_01 (C_Item)
{	
	name 				=	"Zapieczętowane pismo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter;
	scemeName			=	"MAPSEALED";
	description			= "List do Magów Ognia";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	TEXT[1]				= "Nie wolno złamać pieczęci!";
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
func void Usefireletter ()
{   
		
		CreateInvItem     (hero,ItWr_Fire_Letter_02);
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0," ");
					Doc_PrintLine	( nDocID,  0,"Czcigodny Mistrzu,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Twój ostatni list napełnił nas wielkim smutkiem. Po rozważeniu sprawy, niniejszym przedstawiamy nasze stanowisko w tej sprawie: Bractwo stało się poważnym zagrożeniem dla całej kolonii. Jego działania narażają na niebezpieczeństwo nasze delikatne pertraktacje handlowe z Jego Wysokością, a tym samym - przyszłe losy całego królestwa. Dlatego zalecamy wysłanie do obozu na bagnie grupy zwiadowców, którzy ustalą z jakiegoż piekielnego źródła członkowie Bractwa czerpią swą moc. Posiadając te informacje moglibyśmy połączyć nasze wysiłki w celu rychłego zażegnania niebezpieczeństwa. Nasi Bracia przeszukują obecnie prastare księgi w poszukiwaniu choćby najmniejszego znaku, który mógłby naprowadzić nas na właściwy trop. O wynikach tych poszukiwań poinformujemy zwykłą drogą."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Niech Innos ma w opiece nas wszystkich.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					//Doc_PrintLine	( nDocID,  0, "Rigaldo Marschall des Königs"					);
					Doc_Show		( nDocID );
		
		
	};
/********************************************************************************/
INSTANCE ItWr_Fire_Letter_02 (C_Item)
{	
	name 				=	"Otwarty list";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter2;
	scemeName			=	"MAP";
	description			= "List do Magów Ognia";
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
func void Usefireletter2 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0," ");
					Doc_PrintLine	( nDocID,  0,"Czcigodny Mistrzu Xardasie,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Twój ostatni list napełnił nas wielkim smutkiem. Po rozważeniu sprawy, niniejszym przedstawiamy nasze stanowisko w tej sprawie: Bractwo stało się poważnym zagrożeniem dla całej kolonii. Jego działania narażają na niebezpieczeństwo nasze delikatne pertraktacje handlowe z Jego Wysokością, a tym samym - przyszłe losy całego królestwa. Dlatego zalecamy wysłanie do obozu na bagnie grupy zwiadowców, którzy ustalą z jakiegoż piekielnego źródła członkowie Bractwa czerpią swą moc. Powstrzymanie Sekty Śniącego ma znaczenie priorytetowe! Natychmiast po otrzymaniu twojej odpowiedzi, poinformujemy kapłanów Innosa o twoich odkryciach. Nasi uczeni przeszukują obecnie prastare księgi w poszukiwaniu choćby najmniejszego znaku, który mógłby naprowadzić nas na właściwy trop. O wynikach tych poszukiwań poinformujemy zwykłą drogą."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Niech Innos ma w opiece nas wszystkich.");
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/********************************************************************************/
//SCHLÜSSEL 
/*********************************************************************************/
//GOMEZ SCHLÜSSEL
INSTANCE ItKe_Gomez_01(C_Item)
{	
	name 					=	"Klucz Gomeza";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie Gomeza.";
	////COUNT[0]			= ;
	TEXT[1]				= "Otwiera składowisko w piwnicy Magnatów.";
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

/*********************************************************************************/
//RICELORDS SCHLÜSSEL
INSTANCE ItKey_RB_01(C_Item)
{	
	name 				=	"Klucz Ryżowego Księcia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Otwiera skrzynie Ryżowego Księcia.";
};
/*********************************************************************************/
//SCHMIEDESCHLÜSSEL ERZBARONE
INSTANCE ItKe_OB_Smith_01(C_Item)
{	
	name 					=	"Żelazny klucz";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_02.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera drzwi w kuźni.";
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
/*********************************************************************************/
// 
INSTANCE ItKe_Storage_01(C_Item)
{	
	name 					=	"Klucz do składowiska";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera główne drzwi do składowiska";
	////COUNT[0]			= ;
	TEXT[1]				= "w piwnicy Magnatów.";
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

/********************************************************/
//			SCHLÜSSEL IN DER ALTEN MINE
/********************************************************/

/********************************************************/
INSTANCE ItKe_OM_01(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Magazyn Santino.";
	TEXT[1]				= "Wyższe miejsce wymiany.";
	TEXT[2]				= "Stara Kopalnia";
};
/********************************************************/
INSTANCE ItKe_OM_02(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "otwiera skrzynię Aarona";
	TEXT[1]				= "w Starej Kopalni.";
};

/********************************************************/
INSTANCE ItKe_OM_03(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie w składowisku";
	TEXT[1]             = "Starej Kopalni.";
};

/********************************************************/
INSTANCE ItKe_OM_04(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Magazyn Alberto.";
	TEXT[1]				= "Niższe miejsce wymiany.";
};

/********************************GESCHENK VON IAN *********************************************/
INSTANCE ItFo_OM_Beer_01(C_Item)
{
	name 					=	"Mocne piwo";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;
	
	value 					=	30;	

	visual 					=	"ItFo_Beer_01.3ds";
	material 				=	MAT_GLAS;
	on_state[0]				=	UseStarkBeer;
	scemeName				=	"POTION";
	description			= name;
	TEXT[0]				= NAME_Bonus_HP;
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "Bonus";
	COUNT[0]			= 6;
	TEXT[3] 			= "";
	//COUNT[3]			= ;
	TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

	FUNC VOID UseStarkBeer()
	{
		Npc_ChangeAttribute	(self,ATR_HITPOINTS,6);
	};




//***********************************************************************************************************
//**								Das Rätsel des Nebelturms			Björn							   **
//***********************************************************************************************************

//*******Effekt nur beim ersten benutzen des Buches

var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

INSTANCE theriddle1(C_Item)
{	
	name 					=	"Stara księga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle1;
};

	FUNC VOID Usetheriddle1()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ten, który zechce wyrzec się ścieżki występku i błędu i zechce podążać drogą prawa i porządku, pozna prawdziwe źródło mojej potęgi. Dane mu będzie użyć jej, by skruszyć ogniwa tego świata i posiąść najwyższą z nagród - Chromanin.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mędrzec stara się zobaczyć sprawę w jej całości, nim zdecyduje się podjąć trudy wyzwania.");
					Doc_Show		( nDocID );
				
					if (riddle1 == FALSE)
					{
						Log_CreateTopic		(theriddle_log,		LOG_MISSION);
						Log_SetTopicStatus	(theriddle_log,		LOG_RUNNING);
						B_LogEntry			(theriddle_log,		"Zabrałem z Wieży Mgieł tajemniczą księgę należącą do szkieletu maga. To Chromanin - magiczna zagadka pozostawiona przez jej potężnego twórcę... Mędrzec stara się zobaczyć sprawę w jej całości, nim zdecyduje się podjąć trudy wyzwania... Hmmm! Nie pojmuję jego zamysłu, ale może z czasem uda mi się rozwikłać tę tajemnicę."); 
						Wld_InsertItem			(theriddle2,"CASTLE_TOWER_TOP");
					
						riddle1 = TRUE;
					
					};
	};

INSTANCE theriddle2(C_Item)
{	
	name 					=	"Stara Księga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 2";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle2;
};

	FUNC VOID Usetheriddle2()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Wizje Chromanina, tajemne głosy z zamierzchłej przeszłości, rozjaśniły mój umysł. Nie porzucę ich za żadne skarby tego świata. Mój los będzie odtąd związany z nimi.");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "To, co kiedyś rozdzielono, zostanie znów połączone po bolesnej chwili rozłąki.");
					Doc_Show		( nDocID );
					
					if (riddle2 == FALSE)
					{					
						B_GiveXP (300);
						B_LogEntry			(theriddle_log,		"Znalazłem drugą księgę zatytułowaną Chromanin. Po raz kolejny - przedstawia sobą zagadkę... To, co kiedyś rozdzielono, zostanie znów połączone po bolesnej chwili rozłąki..."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
					
						riddle2  =  TRUE;
					
					};
	
	};
INSTANCE theriddle3(C_Item)
{	
	name 					=	"Stara księga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 3";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle3;
};

	FUNC VOID Usetheriddle3()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
   					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "O, starożytni Bogowie! Jak to możliwe, że niegodny śmiertelnik, jakim bez wątpienia jestem, otrzymał tak cenne dziedzictwo waszej potęgi! Obym tylko nie zbłądził słowem lub uczynkiem i nie stracił mego skarbu!");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Mądry rybak próbuje czasem szczęścia po drugiej stronie jeziora.");
					Doc_Show		( nDocID );



					if (riddle3 == FALSE)
					{		
						B_GiveXP (500);
						B_LogEntry			(theriddle_log,		"To już trzecia księga. Chyba zaczynam pojmować, o co w tym wszystkim chodzi... Mądry rybak próbuje czasem szczęścia po drugiej stronie jeziora..."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
						
						riddle3   =  TRUE;
					
					};
					
					
	};
				
				
INSTANCE theriddle4(C_Item)
{	
	name 					=	"Stara księga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 4";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle4;
};

	FUNC VOID Usetheriddle4()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Nie śmiem nawet marzyć o znalezieniu się w pobliżu potężnego Chromanina. Dni płaczu odeszły w niepamięć. Tak niewiele dzieli mnie od osiągnięcia absolutnej perfekcji!");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Zapomniano już czyny tych, co niegdyś weszli na pokład.");
					Doc_Show		( nDocID );
					

					if (riddle4 == FALSE)
					{					
						B_GiveXP (700);
						B_LogEntry			(theriddle_log,		"Numer cztery. Zastanawiam się, czy ten człowiek nie wodzi mnie przypadkiem za nos! ...Zapomniano już czyny tych, co niegdyś weszli na pokład..."); 
						Snd_Play 		("FoundRiddlersBook");					
						Wld_InsertItem			(theriddle5,"LOCATION_25_01");
					
					
						riddle4 = TRUE;
					
					};
					
					
					
	};
								
INSTANCE theriddle5(C_Item)
{	
	name 					=	"Stara księga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 5";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle5;
};

	FUNC VOID Usetheriddle5()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ale nie będę sam kroczył po tej ścieżce. Zaszczyt przypadł mi, ale muszę podzielić się mą potęgą z tymi, którzy okażą się godni, by podążyć w moje ślady. Mam tylko nadzieję, że mnie odnajdą...");
					
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Znajdziesz mnie tam, gdzie wszystko się zaczęło.");
					Doc_Show		( nDocID );




					if (riddle5 == FALSE)
					{
						B_GiveXP (850);
						B_LogEntry			(theriddle_log,		"To już chyba ostatnia księga. Ciekawe, kogo lub co napotkam u kresu mej podróży... Znajdziesz mnie tam, gdzie wszystko się zaczęło..."); 
						Snd_Play 		("FoundRiddlersBook");				
						Wld_InsertNpc				(Bau_940_Riddler,"");
						var C_NPC riddler; riddler = Hlp_GetNpc(Bau_940_Riddler);
						Npc_ChangeAttribute	(riddler, ATR_HITPOINTS, -riddler.attribute[ATR_HITPOINTS_MAX]);

						riddle5  =  TRUE;
					
					};
	};

INSTANCE theriddle6(C_Item)
{	
	name 					=	"Stara księga";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	description			= "Chromanin 6";
	
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			=	Usetheriddle6;
};

	FUNC VOID Usetheriddle6()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					//1.Seite
  					
  					Doc_SetFont 	( nDocID, -1, "font_15_book.tga"	   			); 	// -1 -> all pages 
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Chromanin"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");
				
				

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_Show		( nDocID );

					if (riddle6 == FALSE)
					{

						B_GiveXP (1000);
						B_LogEntry			(theriddle_log,		"Tajemniczy nieznajomy nie żyje. Demony go zabiły! Pomiędzy nim, a tymi istotami z piekła rodem musiała istnieć jakaś więź. Inaczej nie byłby w stanie tutaj wrócić. Najwyraźniej chciał zabrać ten sekret do grobu."); 
						Log_SetTopicStatus	(theriddle_log,		LOG_SUCCESS);
						Snd_Play 		("FoundRiddler");					
						Wld_InsertNpc	(SkeletonMage,		"OW_FOGDUNGEON_36_MOVEMENT");
						Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT"); 
						Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_36_MOVEMENT"); 
						Wld_InsertNpc	(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT2"); 
						Wld_InsertNpc	(SkeletonScout,		"OW_FOGDUNGEON_36_MOVEMENT2");
						Wld_InsertNpc	(SkeletonWarrior,	"OW_FOGDUNGEON_37"); 
						Wld_InsertNpc	(SkeletonMage,		"OW_FOGDUNGEON_37");
						
						riddle6 = TRUE;
					
					};
	};
															
