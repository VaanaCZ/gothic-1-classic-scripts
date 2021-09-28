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
	description		= "Eres el herrero, ¿no?";
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
	AI_Output (other, self,"DIA_Stone_Hello_15_00"); //Eres el herrero, ¿no?
	AI_Output (self, other,"DIA_Stone_Hello_06_01"); //Eso es.
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
	description		= "¿Vendes armas y armaduras?";
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
	AI_Output (other, self,"DIA_Stone_NotSelling_15_00"); //¿Vendes armas y armaduras?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_01"); //Skip vende armas. Yo soy el que se ocupa de las armaduras.
	AI_Output (other, self,"DIA_Stone_NotSelling_15_02"); //¿Qué clase de armaduras puedes ofrecer?
	AI_Output (self, other,"DIA_Stone_NotSelling_06_03"); //Únicamente armaduras para guardias. Y tú no lo eres. ¡Tendrás que conseguir tu armadura en otro sitio!
	AI_StopProcessInfos	( self );
};







//-----------------------------------------------------
// RÜSTUNG UND SCHWERT ABHOLEN WENN DER SPIELER GARDIST IST
//-----------------------------------------------------
instance  GRD_219_Stone_GETSTUFF (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_GETSTUFF_Condition;
	information		= GRD_219_Stone_GETSTUFF_Info;
	important		= 0;
	permanent		= 0;
	description		= "Necesito una armadura."; 
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
	AI_Output (other, self,"GRD_219_Stone_GETSTUFF_Info_15_01"); //Necesito una armadura.
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_02"); //Así que Thorus te ha aceptado, ¿eh? ¡Felicidades!
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_03"); //Otro dispuesto a jugarse el tipo por Gómez. Bueno, ¿a mí qué me importa?
	AI_Output (self, other,"GRD_219_Stone_GETSTUFF_Info_06_04"); //Ten, toma esta espada y esta armadura. Bienvenido a la guardia.

	CreateInvItems		(self,ItMw_1H_Sword_03,2);
	B_GiveInvItems      (self,other,ItMw_1H_Sword_03,2);
	Npc_RemoveInvItem   (other,ItMw_1H_Sword_03);
    CreateInvItem		(other,GRD_ARMOR_L);
	AI_EquipBestArmor	(hero);
	AI_EquipBestMeleeWeapon	(hero);

	B_LogEntry		(GE_BecomeGuard,"He recogido mi primera armadura de guardia en la herrería de Stone. Allí incluso podría comprar una mejor armadura, pero sus precios son altos.");

	AI_StopProcessInfos	( self );
};  

//-----------------------------------------------------
// BESSERE RÜSTUNG
//-----------------------------------------------------
instance  GRD_219_Stone_BETTERARMOR (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= GRD_219_Stone_BETTERARMOR_Condition;
	information		= GRD_219_Stone_BETTERARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Necesito una armadura mejor."; 
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
	AI_Output				(other, self,"GRD_219_Stone_BETTERARMOR_Info_15_01"); //Necesito una armadura mejor.
	AI_Output				(self, other,"GRD_219_Stone_BETTERARMOR_Info_06_02"); //La tendrás cuando estés preparado para ello y sólo si tienes suficiente mineral...
		
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	DIALOG_BACK							,	GRD_219_Stone_BETTERARMOR_BACK);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR, B_BuildBuyArmorString(NAME_StoneHeavyGuards,VALUE_GRD_ARMOR_H)	,GRD_219_Stone_BETTERARMOR_H);	
	Info_AddChoice			(GRD_219_Stone_BETTERARMOR,	B_BuildBuyArmorString(NAME_StoneGuards,VALUE_GRD_ARMOR_M)	,	GRD_219_Stone_BETTERARMOR_M);	
};  

func void GRD_219_Stone_BETTERARMOR_M ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01"); //Quiero una armadura normal de guardia.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02"); //¡Thorus dice que debes progresar como guardia antes de poder tener una armadura mejor!
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_GRD_ARMOR_M)
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03"); //¡Me queda una, pero no parece que tengas suficiente mineral! ¡Vuelve cuando puedas permitírtela!
	}
	else
	{
		AI_Output			(self, hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04"); //¡Muy bien, aquí tienes tu nueva armadura de guardia! ¡No dejes que los mercenarios le hagan muchas mellas, ja ja ja!
		B_GiveInvItems	    (hero, self, ItMiNugget, VALUE_GRD_ARMOR_M);
		B_GiveInvItems		(self, hero, GRD_ARMOR_M, 1);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01"); //Quiero una armadura pesada de guardia.
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02"); //Sólo pueden tenerla los guardias de rango superior. Y me temo que vas a tardar bastante en llegar tan lejos.
	Info_ClearChoices		(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_BACK ()
{
	AI_Output				(hero, self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01"); //He cambiado de opinión.
	AI_Output				(self, hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02"); //Haz lo que quieras. ¡Ya sabes dónde encontrarme!

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
		
		AI_Output (self, other,"Info_EXIT_06_02"); //Hasta luego.

		AI_StopProcessInfos	( self );
	}
	else {
		AI_Output (self, other,"Info_EXIT_06_03"); //Hasta luego.
					
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
//	Begrüßung
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
	AI_Output (self, other, "DIA_GRD_219_Stone_06_01"); //¿Qué quieres? No pareces uno de los esbirros de Gómez.
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
	description 	= "Tienes razón, no estoy con Gómez.";
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
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_01"); //Tienes razón, no estoy con Gómez.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_02"); //Entonces, ¿cómo has entrado? Gómez tenía la llave de las mazmorras...
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_03"); //Me la dio.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_04"); //¿Intentas decirme que TÚ eres el tipo que se ha cargado a Gómez?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_05"); //Ése soy yo.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_06"); //Muchacho, jamás pensé que pudieras hacerlo. Pero me alegra que ese vil asesino recibiera su merecido.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_07"); //¿Por qué me liberas?
	AI_Output (other, self, "DIA_GRD_219_Stone1_15_08"); //Oí que te habían encerrado y pensé que aprovecharía la ocasión para quitar de en medio a Gómez y rescatarte.
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_09"); //Bueno, gracias...
	AI_Output (self, other, "DIA_GRD_219_Stone1_06_10"); //...te estoy muy agradecido. Ven a verme a la herrería y hablaremos allí.

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
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_01"); //Aquí tienes. ¡Te lo debo por sacarme de aquella ratonera, tío!
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_02"); //¿Sabes? Estaba pensando que no puedo darte mucho, así que te forjaré algo.
		AI_Output (self, other, "DIA_GRD_219_Stone3_06_03"); //Tal vez un anillo o algo similar.
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
	description 	= "¿Por qué te encerraron en las mazmorras?";
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
	AI_Output (other, self, "DIA_GRD_219_Stone2_15_01"); //¿Por qué te encerraron en las mazmorras?
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_02"); //¡Por Gómez! El bastardo afirmó que estaba confabulado con los magos del fuego. No me mató porque soy el mejor herrero de todo el Campamento Viejo.
	AI_Output (self, other, "DIA_GRD_219_Stone2_06_03"); //Me arrojó a esa ratonera y sólo me dejaba salir cuando necesitaba que hiciera algo para él.
};



//---------------------------------------------------------------------
//	Info Stone4
//---------------------------------------------------------------------
// Rüstung verbessern lassen
instance DIA_GRD_219_Stone4 (C_INFO)
{
	npc				= GRD_219_Stone;
	condition		= DIA_GRD_219_Stone4_Condition;
	information		= DIA_GRD_219_Stone4_Info;
	important		= 0;
	permanent		= 0;
	description 	= "¿Puedes reforzarme esta armadura de mineral?";
};

FUNC int DIA_GRD_219_Stone4_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( Npc_HasItems ( hero, ORE_ARMOR_M)) && ( KnowStone == 0 )  {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone4_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone4_15_01"); //¿Puedes reforzarme esta armadura de mineral?
		AI_Output (self, other, "DIA_GRD_219_Stone4_06_02"); //Claro que puedo. Dámelo y espera un rato.
	
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

		AI_Output (self, other, "DIA_GRD_219_Stone4_06_03"); //Aquí tienes la armadura reforzada. Estamos en paz.
		
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
	description 	= "Me vendría bien un anillo para aumentar mi energía vital.";
};

FUNC int DIA_GRD_219_Stone5_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone5_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone5_15_01"); //Me vendría bien un anillo para aumentar mi energía vital.
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_02"); //Eso no es difícil, espera.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone5_06_03"); //Este anillo te proporcionará energía adicional. Debería bastar para quedarnos en paz.

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
	description 	= "Quiero que me forjes un anillo de protección.";
};

FUNC int DIA_GRD_219_Stone6_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ){
			return 1;
	 };	
};

func void DIA_GRD_219_Stone6_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone6_15_01"); //Quiero que me forjes un anillo de protección.
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_02"); //¿Un anillo de protección? De acuerdo, empezaré ahora mismo. Espera un rato. 
		
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
	
		AI_Output (self, other, "DIA_GRD_219_Stone6_06_03"); //Me pediste un anillo de protección y aquí lo tienes. Ahora estamos en paz.

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
	description 	= "Fabrícame algo para aumentar mis poderes mágicos.";
};

FUNC int DIA_GRD_219_Stone7_Condition()
{
	 if ( Npc_KnowsInfo ( hero, DIA_GRD_219_Stone3 )) && ( KnowStone == 0 ) {
			return 1;
	 };	
};

func void DIA_GRD_219_Stone7_Info()
{
		AI_Output (other, self, "DIA_GRD_219_Stone7_15_01"); //Fabrícame algo para aumentar mis poderes mágicos.
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_02"); //¿Algo para aumentar poderes mágicos? ¡Un amuleto! Eso es, te forjaré un amuleto. No tardaré mucho.
	
		B_StartUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSFIRE" );	
		AI_Wait			( self,	1);
		B_StartUseMob	( self,	"BSANVIL");	
		AI_Wait			( self,	1);
		B_StopUseMob	( self,	"BSANVIL" );	
		AI_Wait			( self,	1);
		AI_GotoNpc 		( self, hero );
		
		AI_Output (self, other, "DIA_GRD_219_Stone7_06_03"); //Muy bien, he acabado el amuleto y debo decir que he hecho un buen trabajo. Ahora estamos en paz.

		CreateInvItem	  ( self, Amulett_der_Magie );
		B_GiveInvItems     (self, other, Amulett_der_Magie, 1);	
		
		KnowStone = 1;
};
