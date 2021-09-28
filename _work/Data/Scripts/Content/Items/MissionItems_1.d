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

	description		= "Pierœcieñ Mordraga";
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
	TEXT[1]             = "mocniejszym dzia³aniu.";
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
					Doc_PrintLines	( nDocID,  0,"Saturas, szacowny arcymistrz Magów Krêgu Wody, usilnie prosi o zjednoczenie naszych wysi³ków w celu roz³adowania napiêæ pomiêdzy Starym a Nowym Obozem do poziomu, który sprzyja³by interesom obydwu stron. Jako strona zaopatruj¹ca regularnie Jego Wysokoœæ w magiczn¹ rudê docenicie z pewnoœci¹ nasze starania o ograniczenie przestêpczej dzia³alnoœci Szkodników na terenach przynale¿¹cych do waszego obozu. My ze swej strony pragniemy otrzymaæ gwarancjê, ¿e cz³onkowie Starego Obozu nie bêd¹ przeciwstawiaæ siê próbie przerwania magicznej Bariery, której wiêŸniami pozostajemy przecie¿ my wszyscy.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"Za³¹czam wyrazy szacunku,");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"            Cronos, Stra¿nik Rudy");
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

	description		= "Amulet martwego Stra¿nika"; //Nek's Amulett
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
	name 					=	"Napój uzdrawiaj¹cy dla Y'Beriona";

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

	TEXT[0]					=	"Ian, szef Starej Kopalni spisa³";
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
					
					Doc_PrintLine	( nDocID,  0,"Lista zamówieñ");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0,"20 bochnów chleba - tylko bez pleœni, jeœli ³aska!");
					Doc_PrintLine	( nDocID,  0,"25-30 jab³ek");
					Doc_PrintLine	( nDocID,  0,"10 kawa³ków sera");
					Doc_PrintLine	( nDocID,  0,"1 chochla");
					Doc_PrintLine	( nDocID,  0,"1 szczotka");
					Doc_PrintLine	( nDocID,  0,"5 kilofów + 3 m³otki");
					Doc_PrintLines	( nDocID,  0,"I uczciw¹ porcjê ziela - no wiecie, pierwsza dostawa w tym miesi¹cu!");
					Doc_PrintLine	( nDocID,  0,"Spodziewamy siê dostawy najpóŸniej pojutrze.");
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

	TEXT[0]					=	"Ian, szef Starej Kopalni spisa³";
	TEXT[1]					=	"tutaj swoje zamówienia.";
	TEXT[2]					=	"(Lares doda³ kilka rzeczy. Trzeba przyznaæ,";
	TEXT[3]					=	"¿e fa³szerstwo jest nie do wykrycia!)";
};
func void UseTheListNC ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0,"Lista zamówieñ");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0,"20 bochnów chleba - tylko bez pleœni, jeœli ³aska!");
					Doc_PrintLine	( nDocID,  0,"25-30 jab³ek");
					Doc_PrintLine	( nDocID,  0,"10 kawa³ków sera");
					Doc_PrintLine	( nDocID,  0,"1 chochla");
					Doc_PrintLine	( nDocID,  0,"1 szczotka");
					Doc_PrintLine	( nDocID,  0,"5 kilofów + 3 m³otki");
					Doc_PrintLines	( nDocID,  0,"I uczciw¹ porcjê ziela - no wiecie, pierwsza dostawa w tym miesi¹cu!");
					Doc_PrintLine	( nDocID,  0,"Spodziewamy siê dostawy najpóŸniej pojutrze.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"IAN");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0,"W³aœnie mi siê przypomnia³o:");
					Doc_PrintLine	( nDocID,  0,"30 butelek piwa");
					Doc_PrintLine	( nDocID,  0,"5 butelek wina");
					Doc_PrintLine	( nDocID,  0,"25 sma¿onych udŸców œcierwojadów");
					Doc_PrintLine	( nDocID,  0,"z pó³ tuzina sztuk orê¿a");
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
	description		= "Pierœcieñ Laresa";
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
	description				= "Napój b³yskawicznego uzdrowienia";
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
	TEXT[0]					= "Przepis na napój uzdrawiaj¹cy.";
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
				Doc_PrintLines	( nDocID,  1,"To zdaje siê mieæ sens, kiedy czytaæ to od koñca.");
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
	TEXT[1]					= "obszaru na po³udniowym";
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
	name 					=	"Skazañcy";

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
	name 				=	"Zapieczêtowane pismo";

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
	TEXT[1]				= "Nie wolno z³amaæ pieczêci!";
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
					Doc_PrintLines	( nDocID,  0, "Twój ostatni list nape³ni³ nas wielkim smutkiem. Po rozwa¿eniu sprawy, niniejszym przedstawiamy nasze stanowisko w tej sprawie: Bractwo sta³o siê powa¿nym zagro¿eniem dla ca³ej kolonii. Jego dzia³ania nara¿aj¹ na niebezpieczeñstwo nasze delikatne pertraktacje handlowe z Jego Wysokoœci¹, a tym samym - przysz³e losy ca³ego królestwa. Dlatego zalecamy wys³anie do obozu na bagnie grupy zwiadowców, którzy ustal¹ z jakiego¿ piekielnego Ÿród³a cz³onkowie Bractwa czerpi¹ sw¹ moc. Posiadaj¹c te informacje moglibyœmy po³¹czyæ nasze wysi³ki w celu rych³ego za¿egnania niebezpieczeñstwa. Nasi Bracia przeszukuj¹ obecnie prastare ksiêgi w poszukiwaniu choæby najmniejszego znaku, który móg³by naprowadziæ nas na w³aœciwy trop. O wynikach tych poszukiwañ poinformujemy zwyk³¹ drog¹."	);
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
					Doc_PrintLines	( nDocID,  0, "Twój ostatni list nape³ni³ nas wielkim smutkiem. Po rozwa¿eniu sprawy, niniejszym przedstawiamy nasze stanowisko w tej sprawie: Bractwo sta³o siê powa¿nym zagro¿eniem dla ca³ej kolonii. Jego dzia³ania nara¿aj¹ na niebezpieczeñstwo nasze delikatne pertraktacje handlowe z Jego Wysokoœci¹, a tym samym - przysz³e losy ca³ego królestwa. Dlatego zalecamy wys³anie do obozu na bagnie grupy zwiadowców, którzy ustal¹ z jakiego¿ piekielnego Ÿród³a cz³onkowie Bractwa czerpi¹ sw¹ moc. Powstrzymanie Sekty Œni¹cego ma znaczenie priorytetowe! Natychmiast po otrzymaniu twojej odpowiedzi, poinformujemy kap³anów Innosa o twoich odkryciach. Nasi uczeni przeszukuj¹ obecnie prastare ksiêgi w poszukiwaniu choæby najmniejszego znaku, który móg³by naprowadziæ nas na w³aœciwy trop. O wynikach tych poszukiwañ poinformujemy zwyk³¹ drog¹."	);
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
	TEXT[1]				= "Otwiera sk³adowisko w piwnicy Magnatów.";
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
	name 				=	"Klucz Ry¿owego Ksiêcia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Otwiera skrzynie Ry¿owego Ksiêcia.";
};
/*********************************************************************************/
//SCHMIEDESCHLÜSSEL ERZBARONE
INSTANCE ItKe_OB_Smith_01(C_Item)
{	
	name 					=	"¯elazny klucz";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_02.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera drzwi w kuŸni.";
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
	name 					=	"Klucz do sk³adowiska";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera g³ówne drzwi do sk³adowiska";
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
	TEXT[1]				= "Wy¿sze miejsce wymiany.";
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
	TEXT[0]				= "otwiera skrzyniê Aarona";
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
	TEXT[0]				= "Otwiera skrzynie w sk³adowisku";
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
	TEXT[1]				= "Ni¿sze miejsce wymiany.";
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
	name 					=	"Stara ksiêga";
	
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
					Doc_PrintLines	( nDocID,  0, "Ten, który zechce wyrzec siê œcie¿ki wystêpku i b³êdu i zechce pod¹¿aæ drog¹ prawa i porz¹dku, pozna prawdziwe Ÿród³o mojej potêgi. Dane mu bêdzie u¿yæ jej, by skruszyæ ogniwa tego œwiata i posi¹œæ najwy¿sz¹ z nagród - Chromanin.");
					
				

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
					Doc_PrintLines	( nDocID,  1, "Mêdrzec stara siê zobaczyæ sprawê w jej ca³oœci, nim zdecyduje siê podj¹æ trudy wyzwania.");
					Doc_Show		( nDocID );
				
					if (riddle1 == FALSE)
					{
						Log_CreateTopic		(theriddle_log,		LOG_MISSION);
						Log_SetTopicStatus	(theriddle_log,		LOG_RUNNING);
						B_LogEntry			(theriddle_log,		"Zabra³em z Wie¿y Mgie³ tajemnicz¹ ksiêgê nale¿¹c¹ do szkieletu maga. To Chromanin - magiczna zagadka pozostawiona przez jej potê¿nego twórcê... Mêdrzec stara siê zobaczyæ sprawê w jej ca³oœci, nim zdecyduje siê podj¹æ trudy wyzwania... Hmmm! Nie pojmujê jego zamys³u, ale mo¿e z czasem uda mi siê rozwik³aæ tê tajemnicê."); 
						Wld_InsertItem			(theriddle2,"CASTLE_TOWER_TOP");
					
						riddle1 = TRUE;
					
					};
	};

INSTANCE theriddle2(C_Item)
{	
	name 					=	"Stara Ksiêga";
	
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
					Doc_PrintLines	( nDocID,  0, "Wizje Chromanina, tajemne g³osy z zamierzch³ej przesz³oœci, rozjaœni³y mój umys³. Nie porzucê ich za ¿adne skarby tego œwiata. Mój los bêdzie odt¹d zwi¹zany z nimi.");
					
				

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
					Doc_PrintLines	( nDocID,  1, "To, co kiedyœ rozdzielono, zostanie znów po³¹czone po bolesnej chwili roz³¹ki.");
					Doc_Show		( nDocID );
					
					if (riddle2 == FALSE)
					{					
						B_GiveXP (300);
						B_LogEntry			(theriddle_log,		"Znalaz³em drug¹ ksiêgê zatytu³owan¹ Chromanin. Po raz kolejny - przedstawia sob¹ zagadkê... To, co kiedyœ rozdzielono, zostanie znów po³¹czone po bolesnej chwili roz³¹ki..."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
					
						riddle2  =  TRUE;
					
					};
	
	};
INSTANCE theriddle3(C_Item)
{	
	name 					=	"Stara ksiêga";
	
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
					Doc_PrintLines	( nDocID,  0, "O, staro¿ytni Bogowie! Jak to mo¿liwe, ¿e niegodny œmiertelnik, jakim bez w¹tpienia jestem, otrzyma³ tak cenne dziedzictwo waszej potêgi! Obym tylko nie zb³¹dzi³ s³owem lub uczynkiem i nie straci³ mego skarbu!");
					
				

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
					Doc_PrintLines	( nDocID,  1, "M¹dry rybak próbuje czasem szczêœcia po drugiej stronie jeziora.");
					Doc_Show		( nDocID );



					if (riddle3 == FALSE)
					{		
						B_GiveXP (500);
						B_LogEntry			(theriddle_log,		"To ju¿ trzecia ksiêga. Chyba zaczynam pojmowaæ, o co w tym wszystkim chodzi... M¹dry rybak próbuje czasem szczêœcia po drugiej stronie jeziora..."); 
						Snd_Play 		("FoundRiddlersBook");
						Wld_InsertItem			(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
						
						riddle3   =  TRUE;
					
					};
					
					
	};
				
				
INSTANCE theriddle4(C_Item)
{	
	name 					=	"Stara ksiêga";
	
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
					Doc_PrintLines	( nDocID,  0, "Nie œmiem nawet marzyæ o znalezieniu siê w pobli¿u potê¿nego Chromanina. Dni p³aczu odesz³y w niepamiêæ. Tak niewiele dzieli mnie od osi¹gniêcia absolutnej perfekcji!");
					
				

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
					Doc_PrintLines	( nDocID,  1, "Zapomniano ju¿ czyny tych, co niegdyœ weszli na pok³ad.");
					Doc_Show		( nDocID );
					

					if (riddle4 == FALSE)
					{					
						B_GiveXP (700);
						B_LogEntry			(theriddle_log,		"Numer cztery. Zastanawiam siê, czy ten cz³owiek nie wodzi mnie przypadkiem za nos! ...Zapomniano ju¿ czyny tych, co niegdyœ weszli na pok³ad..."); 
						Snd_Play 		("FoundRiddlersBook");					
						Wld_InsertItem			(theriddle5,"LOCATION_25_01");
					
					
						riddle4 = TRUE;
					
					};
					
					
					
	};
								
INSTANCE theriddle5(C_Item)
{	
	name 					=	"Stara ksiêga";
	
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
					Doc_PrintLines	( nDocID,  0, "Ale nie bêdê sam kroczy³ po tej œcie¿ce. Zaszczyt przypad³ mi, ale muszê podzieliæ siê m¹ potêg¹ z tymi, którzy oka¿¹ siê godni, by pod¹¿yæ w moje œlady. Mam tylko nadziejê, ¿e mnie odnajd¹...");
					
				

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
					Doc_PrintLines	( nDocID,  1, "Znajdziesz mnie tam, gdzie wszystko siê zaczê³o.");
					Doc_Show		( nDocID );




					if (riddle5 == FALSE)
					{
						B_GiveXP (850);
						B_LogEntry			(theriddle_log,		"To ju¿ chyba ostatnia ksiêga. Ciekawe, kogo lub co napotkam u kresu mej podró¿y... Znajdziesz mnie tam, gdzie wszystko siê zaczê³o..."); 
						Snd_Play 		("FoundRiddlersBook");				
						Wld_InsertNpc				(Bau_940_Riddler,"");
						var C_NPC riddler; riddler = Hlp_GetNpc(Bau_940_Riddler);
						Npc_ChangeAttribute	(riddler, ATR_HITPOINTS, -riddler.attribute[ATR_HITPOINTS_MAX]);

						riddle5  =  TRUE;
					
					};
	};

INSTANCE theriddle6(C_Item)
{	
	name 					=	"Stara ksiêga";
	
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
						B_LogEntry			(theriddle_log,		"Tajemniczy nieznajomy nie ¿yje. Demony go zabi³y! Pomiêdzy nim, a tymi istotami z piek³a rodem musia³a istnieæ jakaœ wiêŸ. Inaczej nie by³by w stanie tutaj wróciæ. NajwyraŸniej chcia³ zabraæ ten sekret do grobu."); 
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
															
