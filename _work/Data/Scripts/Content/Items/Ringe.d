//Ringe//
	instance Schutzring_Feuer1(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Feuer1;
	on_unequip				=	UnEquip_Schutzring_Feuer1;

	description		= "Anello di protezione dalle fiamme";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Feuer1()
	{
		self.protection [PROT_FIRE] 		+=  3;
	};

	FUNC VOID UnEquip_Schutzring_Feuer1()
	{
	self.protection [PROT_FIRE] 		-=  3;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Feuer2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Feuer2;
	on_unequip				=	UnEquip_Schutzring_Feuer2;

	description		= "Protezione del fuoco";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Feuer2()
	{
	self.protection [PROT_FIRE] 		+=  5;
	};

	FUNC VOID UnEquip_Schutzring_Feuer2()
	{
	self.protection [PROT_FIRE] 		-=  5;
	};

/******************************************************************************************/
	INSTANCE Schutzring_Geschosse1(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Geschosse1;
	on_unequip				=	UnEquip_Schutzring_Geschosse1;

	description		= "Anello pelle di legno";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Geschosse1()
	{
	self.protection [PROT_POINT] 		+=  5;
	};

	FUNC VOID UnEquip_Schutzring_Geschosse1()
	{
	self.protection [PROT_POINT] 		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Geschosse2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Geschosse2;
	on_unequip				=	UnEquip_Schutzring_Geschosse2;

	description		= "Anello pelle di pietra";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Geschosse2()
	{
	self.protection [PROT_POINT] 		+=  10;
	};

	FUNC VOID UnEquip_Schutzring_Geschosse2()
	{
	self.protection [PROT_POINT] 		-=  10;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Waffen1(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Waffen1;
	on_unequip				=	UnEquip_Schutzring_Waffen1;

	description		= "Anello pelle di ferro";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Waffen1()
	{
	self.protection [PROT_EDGE] 		+=  5;
	self.protection [PROT_BLUNT]		+=  5;
	};

	FUNC VOID UnEquip_Schutzring_Waffen1()
	{
	self.protection [PROT_EDGE] 		-=  5;
	self.protection [PROT_BLUNT]		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Waffen2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Waffen2;
	on_unequip				=	UnEquip_Schutzring_Waffen2;

	description		= "Anello pelle di metallo";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Waffen2()
	{
	self.protection [PROT_EDGE] 		+=  10;
	self.protection [PROT_BLUNT]		+=  10;
	};

	FUNC VOID UnEquip_Schutzring_Waffen2()
	{
	self.protection [PROT_EDGE] 		-=  10;
	self.protection [PROT_BLUNT]		-=  10;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie1(C_ITEM)
{
	name 					=	"Anello";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie1;
	on_unequip				=	UnEquip_Schutzring_Magie1;

	description		= "Anello del potere spirituale";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 1;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Magie1()
	{
	self.protection [PROT_MAGIC] 		+=  1;
	};


	FUNC VOID UnEquip_Schutzring_Magie1()
	{
	self.protection [PROT_MAGIC] 		-=  1;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie2;
	on_unequip				=	UnEquip_Schutzring_Magie2;

	description		= "Anello difensivo";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Magie2()
	{
	self.protection [PROT_EDGE] 		+=  3;
	self.protection [PROT_BLUNT]		+=  3;
	};

	FUNC VOID UnEquip_Schutzring_Magie2()
	{
	self.protection [PROT_EDGE] 		-=  3;
	self.protection [PROT_BLUNT]		-=  3;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie1_Fire1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie1_Fire1;
	on_unequip				=	UnEquip_Schutzring_Magie1_Fire1;

	description		= "Anello purificatore";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 1;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 3;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Magie1_Fire1()
	{
	self.protection [PROT_MAGIC] 		+=  1;
	self.protection [PROT_FIRE]		+=  3;
	};

	FUNC VOID UnEquip_Schutzring_Magie1_Fire1()
	{
	self.protection [PROT_MAGIC] 		-=  1;
	self.protection [PROT_FIRE]		-=  3;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie2_Fire2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie2_Fire2;
	on_unequip				=	UnEquip_Schutzring_Magie2_Fire2;

	description		= "Anello dell'invulnerabilità";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 3;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 5;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Magie2_Fire2()
	{
	self.protection [PROT_MAGIC] 	+=  3;
	self.protection [PROT_FIRE]		+=  5;
	};

	FUNC VOID UnEquip_Schutzring_Magie2_Fire2()
	{
	self.protection [PROT_MAGIC] 	-=  3;
	self.protection [PROT_FIRE]		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Geschosse1_Waffen1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Geschosse1_Waffen1;
	on_unequip				= 	UnEquip_Schutzring_Geschosse1_Waffen1;

	description		= "Anello della risolutezza";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 5;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Geschosse1_Waffen1()
	{
	self.protection [PROT_EDGE] 		+=  5;
	self.protection [PROT_BLUNT]		+=  5;
	self.protection [PROT_POINT]		+=  5;
	};

	FUNC VOID UnEquip_Schutzring_Geschosse1_Waffen1()
	{
	self.protection [PROT_EDGE] 		-=  5;
	self.protection [PROT_BLUNT]		-=  5;
	self.protection [PROT_POINT]		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Geschosse2_Waffen2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Geschosse2_Waffen2;
	on_unequip				= 	UnEquip_Schutzring_Geschosse2_Waffen2;

	description		= "Anello dell'imputazione";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 10;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 10;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Geschosse2_Waffen2()
	{
	self.protection [PROT_EDGE] 		+=  10;
	self.protection [PROT_BLUNT]		+=  10;
	self.protection [PROT_POINT]		+=  10;
	};

	FUNC VOID UnEquip_Schutzring_Geschosse2_Waffen2()
	{
	self.protection [PROT_EDGE] 		-=  10;
	self.protection [PROT_BLUNT]		-=  10;
	self.protection [PROT_POINT]		-=  10;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Total1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Total1;
	on_unequip				= 	UnEquip_Schutzring_Total1;

	description		= "Anello minore dell'invulnerabilità";
	//TEXT[0]			= "";
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= 1;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 3;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 5;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= 5;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Total1()
	{
	self.protection [PROT_EDGE] 	+=   5;
	self.protection [PROT_BLUNT]	+=   5;
	self.protection [PROT_POINT]	+=   5;
 	self.protection [PROT_FIRE]     +=   3;
	self.protection [PROT_MAGIC]    +=   1;
	};

	FUNC VOID UnEquip_Schutzring_Total1()
	{
	self.protection [PROT_EDGE] 		-=   5;
	self.protection [PROT_BLUNT]		-=   5;
	self.protection [PROT_POINT]		-=   5;
 	self.protection [PROT_FIRE]      -=   3;
	self.protection [PROT_MAGIC]     -=   1;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Total2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	1000;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Total2;
	on_unequip				= 	UnEquip_Schutzring_Total2;

	description		= "Anello maggiore dell'invulnerabilità";
	//TEXT[0]			= "";
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= 3;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 10;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= 10;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Total2()
	{
	self.protection [PROT_EDGE] 	+=   10;
	self.protection [PROT_BLUNT]	+=   10;
	self.protection [PROT_POINT]	+=   10;
 	self.protection [PROT_FIRE]     +=   5;
	self.protection [PROT_MAGIC]    +=   3;
	};

	FUNC VOID UnEquip_Schutzring_Total2()
	{
	self.protection [PROT_EDGE] 	-=   10;
	self.protection [PROT_BLUNT]	-=   10;
	self.protection [PROT_POINT]	-=   10;
 	self.protection [PROT_FIRE]     -=   5;
	self.protection [PROT_MAGIC]    -=   3;
	};
	
/******************************************************************************************/
		INSTANCE Ring_des_Geschicks(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	160;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Geschicks;
	on_unequip				=	UnEquip_Ring_des_Geschicks;

	description		= "Anello minore della destrezza";
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

	FUNC VOID Equip_Ring_des_Geschicks()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5 );
	};


	FUNC VOID UnEquip_Ring_des_Geschicks()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-5 );
	};
	
/******************************************************************************************/
	INSTANCE Ring_des_Geschicks2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	240;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Geschicks2;
	on_unequip				=	UnEquip_Ring_des_Geschicks2;

	description		= "Anello maggiore della destrezza";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_des_Geschicks2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,10 );
	};


	FUNC VOID UnEquip_Ring_des_Geschicks2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-10 );
	};

/******************************************************************************************/
		INSTANCE Ring_des_Lebens(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	180;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Lebens;
	on_unequip				=	UnEquip_Ring_des_Lebens;

	description		= "Anello dell'energia vitale";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_des_Lebens()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 10; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 10;
	};

	FUNC VOID UnEquip_Ring_des_Lebens()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 10;
		if self.attribute [ATR_HITPOINTS]> 11
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 10;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE Ring_des_Lebens2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	360;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Lebens2;
	on_unequip				=	UnEquip_Ring_des_Lebens2;
	description		= "Anello maggiore dell'energia vitale";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 20;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_des_Lebens2()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
	};

	FUNC VOID UnEquip_Ring_des_Lebens2()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 20; 
		
		if self.attribute [ATR_HITPOINTS]> 21
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 20;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE Staerkering(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	160;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Staerkering;
	on_unequip				=	UnEquip_Staerkering;

	description		= "Anello della potenza";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkering()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,5 );
	};

	FUNC VOID UnEquip_Staerkering()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-5 );
	};
	
/******************************************************************************************/
	INSTANCE Staerkering2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	240;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;

	on_equip				=	Equip_Staerkering2;
	on_unequip				=	UnEquip_Staerkering2;

	description		= "Anello della forza";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkering2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,10 );
	};

	FUNC VOID UnEquip_Staerkering2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH, -10 );
	};

/******************************************************************************************/
	INSTANCE Ring_der_Magie(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Magie;
	on_unequip				=	UnEquip_Ring_der_Magie;

	description		= "Anello della magia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
	};


	FUNC VOID UnEquip_Ring_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
	};
	
/******************************************************************************************/
		INSTANCE Ring_der_Erleuchtung(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Erleuchtung;
	on_unequip				=	UnEquip_Ring_der_Erleuchtung;

	description		= "Anello dell'illuminazione";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 15;
	TEXT[3] 		= NAME_Bonus_HP;
	COUNT[3]		= 15;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_der_Erleuchtung()
	{
		
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 15;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 15;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 15;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 15;
		
	};


	FUNC VOID UnEquip_Ring_der_Erleuchtung()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 15;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 15;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 15;
		
		if (self.attribute [ATR_HITPOINTS] > 16)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 15;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE Machtring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	300;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Machtring;
	on_unequip				=	UnEquip_Machtring;

	description		= "Anello della potenza del guerriero";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 4;
	TEXT[3] 		= NAME_Bonus_Dex;
	COUNT[3]		= 4;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Machtring()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH, 4);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, 4);
	};

	FUNC VOID UnEquip_Machtring()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- 4);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, -4);
	};
		
