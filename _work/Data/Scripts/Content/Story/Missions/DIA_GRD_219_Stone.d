//*****************************************
//				EXIT UNTEN
//*****************************************



// ************************************************************
//							Hello					
// ************************************************************

instance DIA_Stone_Hello (C_INFO)
{
	npc				= Grd_219_Stone;
	nr 				= 1;
	condition		= DIA_Stone_Hello_Condition;
	information		= DIA_Stone_Hello_Info;
	permanent		= 0;
	description		= "Ty jsi kov��, vi�?";
};

FUNC int  DIA_Stone_Hello_Condition()
{	
	if	(Kapitel < 4)
	{	
		return TRUE;
	};
};

func void  DIA_Stone_Hello_Info()
{
	AI_Output (other, self,"DIA_Stone_Hello_15_00"); //Ty jsi kov��, vi�?
	AI_Output (self, other,"DIA_Stone_Hello_06_01"); //Ano.
};

// ************************************************************
//							Kaufen					
// ************************************************************

instance DIA_Stone_NotSelling (C_INFO)
{
	npc				= Grd_219_Stone;
	nr 				= 1;
	condition		= DIA_Stone_NotSelling_Condition;
	information		= DIA_Stone_NotSelling_Info;
	permanent		= 1;
	description		= "Prod�v� zbran� a zbroj?";
};

FUNC int  DIA_Stone_NotSelling_Condition()
{	
	if	(Npc_GetTrueGuild (hero) != GIL_GRD)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};
};

func void  DIA_Stone_NotSelling_Info()
{
	AI_Output (other, self,"DIA_Stone_NotSelling_15_00"); //Prod�v� zbran� a zbroj?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_01"); //O zbran�ch se nebavme. D�l�m jenom zbroj.
	AI_Output (other, self,"DIA_Stone_NotSelling_15_02"); //Jak� typ zbroje m��e� nab�dnout?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_03"); //Jedin� zbroj pro str�e. A ty str�ce nejsi. Tak�e si mus� zbroj obstarat n�kde jinde!
	AI_StopProcessInfos	( self );
};







//-----------------------------------------------------
// R�STUNG UND SCHWERT ABHOLEN WENN DER SPIELER GARDIST IST
//-----------------------------------------------------
instance  GRD_219_Stone_GETSTUFF (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_GETSTUFF_Condition;
	information		= GRD_219_Stone_GETSTUFF_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pot�ebuji zbroj."; 
};

FUNC int  GRD_219_Stone_GETSTUFF_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};

};
FUNC void  GRD_219_Stone_GETSTUFF_Info()
{
	AI_Output (other, self,"GRD_219_Stone_GETSTUFF_Info_15_01"); //Pot�ebuji zbroj.
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_02"); //Tak�e t� Thorus p�ijal, jo? blahop�eju!
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_03"); //Dal�� dychtivec, kter� by nastavil za Gomeze krk. No v�born�, o co se m�m postarat?
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_04"); //Tady si vezmi zbroj a me�. V�tej mezi str�e.

	CreateInvItems		(self,ItMw_1H_Sword_03,2);
	B_GiveInvItems      (self,other,ItMw_1H_Sword_03,2);
	Npc_RemoveInvItem   (other,ItMw_1H_Sword_03);
    CreateInvItem		(other,GRD_ARMOR_L);
	AI_EquipBestArmor	(hero);
	AI_EquipBestMeleeWeapon	(hero);

	B_LogEntry		(GE_BecomeGuard,"Dostal jsem od kov��e Stonea svoji prvn� zbroj str�e. Nemohl bych u n�j ani koupit lep��, proto�e m� p��li� vysok� ceny.");

	AI_StopProcessInfos	( self );
};  

//-----------------------------------------------------
// BESSERE R�STUNG
//-----------------------------------------------------
instance  GRD_219_Stone_BETTERARMOR (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_BETTERARMOR_Condition;
	information		= GRD_219_Stone_BETTERARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Pot�ebuju lep�� zbroj."; 
};

FUNC int  GRD_219_Stone_BETTERARMOR_Condition()
{	
	if	(Npc_KnowsInfo (hero,GRD_219_Stone_GETSTUFF))
	&&	(Kapitel < 4)
	{
		return TRUE;
	};
};

FUNC void  GRD_219_Stone_BETTERARMOR_Info()
{
	AI_Output				(other, self,"GRD_219_Stone_BETTERARMOR_Info_15_01"); //Pot�ebuju lep�� zbroj.
	AI_Output				(self, other,"GRD_219_Stone_BETTERARMOR_Info_06_02"); //M��e� ji m�t, a� si ji zaslou�� a jedin� tehdy, kdy� bude� m�t dost rudy...
		
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	DIALOG_BACK							,	GRD_219_Stone_BETTERARMOR_BACK);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR, B_BuildBuyArmorString(NAME_StoneHeavyGuards,VALUE_GRD_ARMOR_H)	,GRD_219_Stone_BETTERARMOR_H);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	B_BuildBuyArmorString(NAME_StoneGuards,VALUE_GRD_ARMOR_M)	,	GRD_219_Stone_BETTERARMOR_M);	
};  

func void GRD_219_Stone_BETTERARMOR_M ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01"); //Chci oby�ejnou zbroj pro str�.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02"); //Thorus ��k�, �e se mus� nejd��ve osv�d�it jako str�ce, ne� dostane� lep�� zbroj.
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_GRD_ARMOR_M)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03"); //Jednu m�m na sklad�, ale ne�ekl bych, �e bys na ni m�l dost rudy! Vra� se, a� si ji bude� moci dovolit!
	}
	else
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04"); //Dobr�, tady je nov� zbroj pro str�e! Nedovol �old�k�m, aby ti ji moc okousali, hahaha!
		B_GiveInvItems	    (hero, self, ItMiNugget, VALUE_GRD_ARMOR_M);
		B_GiveInvItems		(self, hero, GRD_ARMOR_M, 1);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01"); //Chci t�kou zbroj pro str�ce.
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02"); //Takovou m��e m�t jedin� vy��� t��da str��. Ale m�m obavu, �e do toho m� je�t� hodn� daleko.
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_BACK ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01"); //Rozmyslel jsem se.
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02"); //D�lej, jak mysl�. V�, kde m� najde�!

	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};







// ************************ EXIT **************************

INSTANCE DIA_GRD_219_Stone_Exit (C_INFO)
{
	npc			= GRD_219_Stone;
	nr			= 999;
	condition	= DIA_GRD_219_Stone_Exit_Condition;
	information	= DIA_GRD_219_Stone_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func VOID DIA_GRD_219_Stone_Exit_Info()
{
	if ( Npc_KnowsInfo ( hero,  DIA_GRD_219_Stone4  ))
	{
		AI_StopProcessInfos	( self );
		
		var C_NPC Stone;	Stone = Hlp_GetNpc ( GRD_219_Stone );

		TA_BeginOverlay (Stone);
			TA_Min (Stone, 00, 00, 00, 05, ZS_Position,"OCC_MERCS_HALLWAY_BACK"	);
			TA_Min (Stone, 00, 05, 00, 10, ZS_Position,"OCC_MERCS_ENTRANCE"		);
			TA_Min (Stone, 00, 10, 00, 15, ZS_Position,"OCC_SHADOWS_CORNER"		);	
			TA_Min (Stone, 00, 15, 00, 20, ZS_Position,"OCC_STABLE_ENTRANCE"	);
			TA_Min (Stone, 00, 20, 72, 00, ZS_Position,"OCC_STABLE_LEFT_FRONT"	);	
		TA_EndOverlay (Stone);
		
		AI_Output (self, other,"Info_EXIT_06_02"); //Je�t� se uvid�me.

		AI_StopProcessInfos	( self );
	}
	else {
		AI_Output (self, other,"Info_EXIT_06_03"); //Je�t� se uvid�me.
					
		AI_StopProcessInfos	( self );
	};	
};




//#####################################################################
//##
//##
//##							KAPITEL 5/6
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Begr��ung
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone_Condition;
	information		= DIA_GRD_219_Stone_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_GRD_219_Stone_Condition()
{
	if (Kapitel >= 5)
	{
 		return 1;
 	};	
};

func void DIA_GRD_219_Stone_Info()
{
	AI_Output (self, other, "DIA_GRD_219_Stone_06_01"); //Co chce�? Nevypad� na Gomezova stoupence.
};

//---------------------------------------------------------------------
//	Info Stone1
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone1 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone1_Condition;
	information		= DIA_GRD_219_Stone1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "M� pravdu, nejsem s Gomezem.";
};

FUNC int DIA_GRD_219_Stone1_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone )) 
	{			
		return 1;
	};	
};

func void DIA_GRD_219_Stone1_Info()
{
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_01"); //M� pravdu, nejsem s Gomezem.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_02"); //Jak ses sem potom dostal? Gomez m� kl�� k v�zen�...
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_03"); //Dal mi ho.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_04"); //Sna�� se mi namluvit, �e to TY jsi porazil Gomeze?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_05"); //To jsem j�.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_06"); //Nikdy bych, hochu, ne�ekl, �e zrovna ty bys to dok�zal. Ale jsem r�d, �e ten hrdlo�ez kone�n� dostal to, co si zasluhoval.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_07"); //Pro� jsi m� ale osvobodil?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_08"); //Sly�el jsem, �e t� tu zamkli a pomyslel jsem si, �e bych mohl Gomeze odstranit a vysvobodit t�.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_09"); //Tis�cer� d�ky...
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_10"); //Hodn� ti dlu��m. P�ij� za mnou do kov�rny, tam si m��eme promluvit.

	Npc_ExchangeRoutine(self, "OTNEW");
};

//---------------------------------------------------------------------
//	Info Stone3
//---------------------------------------------------------------------
instance DIA_GRD_219_Stone3 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone3_Condition;
	information		= DIA_GRD_219_Stone3_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_GRD_219_Stone3_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone1 )) && ( Hlp_StrCmp ( Npc_GetNearestWP ( self ), "OCC_STABLE_LEFT_FRONT" ))
	{
			return 1;
	};	
};

func void DIA_GRD_219_Stone3_Info()
{
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_01"); //Tady jsi. Jsem ti vd��n�, �es m� vyt�hl z toho krys�ho doup�te.
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_02"); //Nen� toho moc, co bych ti mohl d�t, ale mohl bych pro tebe n�co ukovat.
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_03"); //Mo�n� prsten nebo n�co takov�ho...
};

//---------------------------------------------------------------------
//	Info Stone2
//---------------------------------------------------------------------
// Warum ist Stone im Kerker
instance DIA_GRD_219_Stone2 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone2_Condition;
	information		= DIA_GRD_219_Stone2_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Pro� t� zav�eli do v�zen�?";
};

FUNC int DIA_GRD_219_Stone2_Condition()
{
	if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 ))
	{			
		return 1;
	};	
};

func void DIA_GRD_219_Stone2_Info()
{
	AI_Output (other, self, "DIA_GRD_219_Stone2_15_01"); //Pro� t� zav�eli do v�zen�?
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_02"); //Gomez! Ten bastard m� prohl�sil za sp��se�ence m�g� Ohn�. Jedin� d�vod, pro� m� nezabil, bylo to, �e jsem nejlep�� kov�� ve Star�m t�bo�e.
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_03"); //A tak m� uvrhl do toho krys�ho doup�te a pou�t�l ven jenom tehdy, kdy� pot�eboval n�co vyrobit.
};



//---------------------------------------------------------------------
//	Info Stone4
//---------------------------------------------------------------------
// R�stung verbessern lassen
instance DIA_GRD_219_Stone4 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone4_Condition;
	information		= DIA_GRD_219_Stone4_Info;
	important		= 0;
	permanent		= 0;
	description 	= "M��e� mi vyztu�it tuhle rudnou zbroj?";
};

FUNC int DIA_GRD_219_Stone4_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( Npc_HasItems ( hero, ORE_ARMOR_M)) && ( KnowStone == 0 )  {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone4_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone4_15_01"); //M��e� mi vyztu�it tuhle rudnou zbroj?
		AI_Output (self, other, "DIA_GRD_219_Stone4_06_02"); //Jist�, �e m��u. Sundej j� a chvilku po�kej.
	
		AI_UnequipArmor	  ( hero );
		B_GiveInvItems   (hero, self, ORE_ARMOR_M, 1);
		Npc_RemoveInvItem   (self, ORE_ARMOR_M);

		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		CreateInvItem (self,ORE_ARMOR_H);
		B_GiveInvItems	  (self, hero, ORE_ARMOR_H, 1);	

		AI_Output (self, other, "DIA_GRD_219_Stone4_06_03"); //Tady je vyztu�en� zbroj. A jsme vyrovn�ni.
		
		KnowStone = 1;
};


// Ring des Lebens
instance DIA_GRD_219_Stone5 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone5_Condition;
	information		= DIA_GRD_219_Stone5_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Pot�eboval bych prsten, kter� zvy�uje �ivotn� energii.";
};

FUNC int DIA_GRD_219_Stone5_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone5_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone5_15_01"); //Pot�eboval bych prsten, kter� zvy�uje �ivotn� energii.
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_02"); //To nen� tak t�k�, po�kej chvilku.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_03"); //Tenhle prsten ti dod� zvl�tn� �ivotn� energii. Tohle by m�lo b�t v�c ne� dost pro na�e vyrovn�n�.

		CreateInvItem	  ( self, Ring_des_Lebens2 );	
		B_GiveInvItems	  ( self, other, Ring_des_Lebens2, 1);	
		
		KnowStone = 1;
};


// Schutzring
instance DIA_GRD_219_Stone6 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone6_Condition;
	information		= DIA_GRD_219_Stone6_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Chci, abys mi vykoval ochrann� prsten.";
};

FUNC int DIA_GRD_219_Stone6_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ){
			return 1;
	 };	
};

func void DIA_GRD_219_Stone6_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone6_15_01"); //Chci, abys mi vykoval ochrann� prsten.
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_02"); //Ochrann� prsten? Dob�e, hned s t�m za�nu. Po�kej chvilku. 
		
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
	
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_03"); //Cht�l jsi ochrann� prsten, tady ho m�. Te� jsme vyrovn�ni.

		CreateInvItem	  ( self, Schutzring_Total2 );
		B_GiveInvItems     (self, other, Schutzring_Total2, 1);
		
		KnowStone = 1;
};


instance DIA_GRD_219_Stone7 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone7_Condition;
	information		= DIA_GRD_219_Stone7_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Ud�lej mi n�co, co by zv��ilo moji magickou moc.";
};

FUNC int DIA_GRD_219_Stone7_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone7_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone7_15_01"); //Ud�lej mi n�co, co by zv��ilo moji magickou moc.
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_02"); //...N�co, co by zv��ilo magickou moc...? Amulet! To je ono! Ud�l�m ti amulet. Nebude to trvat dlouho.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_03"); //Tak, amulet je hotov� a mus�m ��ci, �e jsem odvedl dobrou pr�ci. Te� jsme vyrovn�ni.

		CreateInvItem	  ( self, Amulett_der_Magie );
		B_GiveInvItems     (self, other, Amulett_der_Magie, 1);	
		
		KnowStone = 1;
};
