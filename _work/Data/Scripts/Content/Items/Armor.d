/*******************************************************************************************
**	R�stungswert-Multiplikator	                                         				  **
*******************************************************************************************/
const int	ARMOR_VALUE_MULTIPLIER	= 30;	// wird mit Schutzwert gegen EDGE-Schaden multipliziert

const int VALUE_TPL_ARMOR_L = 1350;
const int VALUE_TPL_ARMOR_M = 1650;
const int VALUE_TPL_ARMOR_H = 2100;

const int VALUE_STT_ARMOR_M =  750;
const int VALUE_STT_ARMOR_H = 1200;

const int VALUE_GRD_ARMOR_L = 1350;
const int VALUE_GRD_ARMOR_M = 1650;
const int VALUE_GRD_ARMOR_H = 2100;

const int VALUE_KDF_ARMOR_L = 1200;
const int VALUE_KDF_ARMOR_H = 1500;

const int VALUE_KDW_ARMOR_L = 1950;
const int VALUE_KDW_ARMOR_H = 2100;

const int VALUE_ORG_ARMOR_L =  750;
const int VALUE_ORG_ARMOR_M = 1050;
const int VALUE_ORG_ARMOR_H = 1200;

const int VALUE_SLD_ARMOR_L = 1350;
const int VALUE_SLD_ARMOR_M = 1650;
const int VALUE_SLD_ARMOR_H = 2100;

const int VALUE_NOV_ARMOR_L = 500;
const int VALUE_NOV_ARMOR_M = 750;
const int VALUE_NOV_ARMOR_H = 1200;

const int VALUE_VLK_ARMOR_L = 250;
const int VALUE_VLK_ARMOR_M = 500;

const int VALUE_SFB_ARMOR_L = 250;



/*******************************************************************************************
**	OldCamp	                                         	  		 						  **
*******************************************************************************************/

/******************************************************************************************/
// Volk

INSTANCE VLK_ARMOR_L(C_Item)
{
	name 					=	"Lekkie spodnie Kopacza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_VLK_ARMOR_L;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"vlkl.3ds";
	visual_change 			=	"Hum_VLKL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE VLK_ARMOR_M(C_Item)
{
	name 					=	"Spodnie Kopacza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] =   0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_VLK_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"vlkm.3ds";
	visual_change 			=	"Hum_VLKM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Schatten

INSTANCE STT_ARMOR_M(C_Item)
{
	name 					=	"Str�j Cienia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_STT_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"sttm.3ds";
	visual_change 			=	"Hum_STTM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE STT_ARMOR_H(C_Item)
{
	name 					=	"Zbroja Cienia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_STT_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Gardisten		                                                  					 **

INSTANCE GRD_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja Stra�nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_GRD_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdl.3ds";
	visual_change 			=	"Hum_GRDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE GRD_ARMOR_M(C_Item)
{
	name 					=	"Zbroja Stra�nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_GRD_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdm.3ds";
	visual_change 			=	"Hum_GRDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE GRD_ARMOR_H(C_Item)
{
	name 					=	"Ci�ka zbroja Stra�nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_GRD_ARMOR_H;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"grdh.3ds";
	visual_change 			=	"Hum_GRDS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Erz-Barone		                                                 					  **

INSTANCE EBR_ARMOR_M(C_Item)
{
	name 					=	"Ozdobna szata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	72;
	protection [PROT_BLUNT] = 	72;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	36;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_EBR;


	visual 					=	"ebrm.3ds";
	visual_change 			=	"Hum_EBRM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE EBR_ARMOR_H(C_Item)
{
	name 					=	"Pancerz Gomeza";


	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	85;
	protection [PROT_BLUNT] = 	85;
	protection [PROT_POINT] = 	9;
	protection [PROT_FIRE] 	= 	42;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
  	ownerGuild 				= 	GIL_EBR;

	owner					=   EBR_100_GOMEZ;
	visual 					=	"ebrh.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE EBR_ARMOR_H2(C_Item)
{
	name 					=	"Ci�ki pancerz Magnata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	8;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_EBR;

	visual 					=	"ebrh2.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/*******************************************************************************************
**	NewCamp 						                                        	  		  **
*******************************************************************************************/

/******************************************************************************************/
// Sch�rferbund

instance SFB_ARMOR_L(C_Item)
{
	name 					=	"Str�j Kopacza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SFB_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Organisatoren

INSTANCE ORG_ARMOR_L(C_Item)
{
	name 					=	"Lekki str�j Szkodnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ORG_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgl.3ds";
	visual_change 			=	"Hum_ORGL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ORG_ARMOR_M(C_Item)
{
	name 					=	"Str�j Szkodnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT] = 	35;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ORG_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgm.3ds";
	visual_change 			=	"Hum_ORGM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ORG_ARMOR_H(C_Item)
{
	name 					=	"Ci�ki str�j Szkodnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ORG_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Hum_ORGS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE SLD_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja Najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT]	= 	45;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	=	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SLD_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldl.3ds";
	visual_change 			=	"Hum_SLDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
instance SLD_ARMOR_M(C_Item)
{
	name 					=	"Zbroja Najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SLD_ARMOR_M;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"sldm.3ds";
	visual_change 			=	"Hum_SLDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE SLD_ARMOR_H(C_Item)
{
	name 					=	"Ci�ka zbroja Najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_SLD_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldh.3ds";
	visual_change 			=	"Hum_SLDS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/*******************************************************************************************
**	PsiCamp 		                                               	  					  **
*******************************************************************************************/

/******************************************************************************************/
// Novizen

INSTANCE NOV_ARMOR_L(C_Item)
{
	name 					=	"Przepaska Nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=   15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_NOV_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"novl.3ds";
	visual_change 			=	"Hum_NOVL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE NOV_ARMOR_M(C_Item)
{
	name 					=	"Lekka zbroja Nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_NOV_ARMOR_M;

 
	visual 					=	"novm.3ds";
	visual_change 			=	"Hum_NOVM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE NOV_ARMOR_H(C_Item)
{
	name 					=	"Zbroja Nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_NOV_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"novh.3ds";
	visual_change 			=	"Hum_NOVS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Templer

INSTANCE TPL_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja �wi�tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_TPL_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"tpll.3ds";
	visual_change 			=	"Hum_TPLL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE TPL_ARMOR_M(C_Item)
{
	name 					=	"Zbroja �wi�tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_TPL_ARMOR_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplm.3ds";
	visual_change 			=	"Hum_TPLM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE TPL_ARMOR_H(C_Item)
{
	name 					=	"Ci�ka zbroja �wi�tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_TPL_ARMOR_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Gurus

INSTANCE GUR_ARMOR_M(C_Item)
{
	name 					=	"Szata Guru";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	71;
	protection [PROT_BLUNT] = 	71;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	3;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GUR;

	visual 					=	"gurm.3ds";
	visual_change 			=	"Hum_GURM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE GUR_ARMOR_H(C_Item)
{
	name 					=	"Zdobiona szata Guru";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	82;
	protection [PROT_BLUNT] = 	82;
	protection [PROT_POINT] = 	8;
	protection [PROT_FIRE] 	= 	41;
	protection [PROT_MAGIC] = 	4;
	wear 					=	WEAR_TORSO;

 	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

   ownerGuild 				= 	GIL_GUR;
	visual 					=	"gurh.3ds";
	visual_change 			=	"Hum_GURS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/*******************************************************************************************
**	MAGIER		                                                  						**
*******************************************************************************************/

/******************************************************************************************/
// Feuermagier

INSTANCE KDF_ARMOR_L(C_Item)
{
	name 					=	"Szata Ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	5;
	wear 					=	WEAR_TORSO;

 	value 					=	VALUE_KDF_ARMOR_L;

	visual 					=	"kdfl.3ds";
	visual_change 			=	"Hum_KDFL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE KDF_ARMOR_H(C_Item)
{
	name 					=	"Zdobiona szata Ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	10;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_KDF_ARMOR_H;

	visual 					=	"kdfh.3ds";
	visual_change 			=	"Hum_KDFS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Wassermagier

INSTANCE KDW_ARMOR_L(C_Item)
{
	name 					=	"Szata Wody";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	15;

	value 					=	VALUE_KDW_ARMOR_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"kdwl.3ds";
	visual_change 			=	"Hum_KDWL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE KDW_ARMOR_H(C_Item)
{
	name 					=	"Zdobiona szata Wody";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	20;
	wear 					=	WEAR_TORSO;

	value 					=	VALUE_KDW_ARMOR_H;

	visual 					=	"kdwh.3ds";
	visual_change 			=	"Hum_KDWS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// D�monenbeschw�rer

INSTANCE DMB_ARMOR_M(C_Item)
{
	name 					=	"Szata Mrocznych Sztuk";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	90;
	protection [PROT_BLUNT] = 	90;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	60;
	protection [PROT_MAGIC] = 	30;

	wear 					=	WEAR_TORSO;

 	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	ownerGuild 				= 	GIL_DMB;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_DMBM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};



/*******************************************************************************************
**	Spezial-R�stungen                                                                     **
*******************************************************************************************/

// FIXME: hier fehlen noch die Visuals f�r die Erz-R�stungen und das INV-Item f�r die CRAWLERPLATTEN-R�STUNG 

// Crawler-Plattenr�stung
INSTANCE CRW_ARMOR_H(C_Item)
{
	name 					=	"Zbroja z pancerzy pe�zaczy";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	5;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
	visual 					=	"crws.3ds";
	visual_change 			=	"Hum_CRAWLER_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};



/******************************************************************************************/
// Erz-R�stungen
INSTANCE ORE_ARMOR_M(C_Item)
{
	name 					=	"Staro�ytna zbroja magiczna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	95;
	protection [PROT_BLUNT] = 	95;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	10;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2; // x2 weil einzigartig

	wear 					=	WEAR_TORSO;

	visual 					=	"magie.3ds";
	visual_change 			=	"Hum_MAGIE_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;

	description				=	name;
	TEXT[0]					=	"T� staro�ytn� zbroj� wykonano z magicznej rudy.";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ORE_ARMOR_H(C_Item)
{
	name 					=	"Wzmocniona zbroja magiczna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	15;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;	// x2 weil einzigartig

	wear 					=	WEAR_TORSO;

	visual 					=	"magie.3ds";
	visual_change 			=	"Hum_MAGIE_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;

	description				=	name;
	TEXT[0]					=	"Kowal Stone jeszcze j� ulepszy�!";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};




/*******************************************************************************************
**	Der Richter                                                                       **
*******************************************************************************************/
INSTANCE LAW_ARMOR (C_Item)
{
	name 					=	"Szata s�dziego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	2;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_DMB;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_LAW_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};






/*******************************************************************************************
**	Wache f�r Intro-Cutscene                                                          **
*******************************************************************************************/
INSTANCE GRD_ARMOR_I(C_Item)
{
	name 					=	"Pancerz Stra�y Kr�lewskiej";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	1;

	value 					=	protection [PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GRD;

	visual 					=	"grdi.3ds";
	visual_change 			=	"Hum_GRDI_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};



/*******************************************************************************************
**	Nackte Babes
*******************************************************************************************/
INSTANCE BAB_ARMOR_NUDE (C_Item)
{
	name 					=	"Go�a babka";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	1;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"vobbox.3ds";
	visual_change 			=	"Bab_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
};

/******************************************************************************************/
INSTANCE BAB_ARMOR_BIKINI (C_Item)
{
	name 					=	"Babka w bikini";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	1;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"vobbox.3ds";
	visual_change 			=	"Bab_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
};
/******************************************************************************************/
