// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Falle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Falle_Condition;
	information		= DIA_Grim_Falle_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grim_Falle_Condition()
{	
	if	(Grim_ProtectionBully == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Falle_Info()
{
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //¡Eh, tú! ¿No eres tú el que quiere unirse al Campamento?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //¿Y si así fuera?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Podría ayudarte.
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //¿Cómo?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Hay dos tipos sentados fuera del Campamento y uno de ellos ha robado una cosa a los Magnates del Mineral. Es un amuleto de gran valor, que debería haber llegado en la última caravana.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Uno de ellos debería tener todavía el amuleto. Si les atacamos juntos podríamos derrotarles. Yo solo no podría hacerlo. ¿Qué me dices?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"No me interesa. Tendrás que buscar a otra persona.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"¿Qué pasará cuando tengamos el amuleto?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"¡Cuenta conmigo!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //No me interesa; tendrás que buscar a otro.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Con esta actitud no vas a durar mucho aquí. ¡Avísame si cambias de opinión!
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //¿Qué ocurrirá una vez tengamos el amuleto?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //¡Ésa es fácil! Lo devolveré y conseguiré la recompensa. Les diré que me ayudaste. Entonces te habrás ganado el favor de Gómez. 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"No me interesa. Tendrás que buscar a otra persona.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"¡No! ¡O vamos a medias o lo haces solo!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"¡Cuenta conmigo!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //¡No! ¡O vamos a partes iguales o lo haces solo!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Vale, vale. A partes iguales. Supongo que de todas maneras habrá suficiente para los dos. Bueno, ¿puedo contar contigo entonces?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //¡Cuenta conmigo!
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //¡Vale, dime cuándo empezamos!
	Info_ClearChoices	(DIA_Grim_Falle );
};

// **************************************************
// 				Bereit für Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Estoy listo para ir contigo. ¡A por el amuleto!";
};

FUNC INT DIA_Grim_ReadyToGo_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_ReadyToGo_Info()
{
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //¡Yo ya estoy listo; vamos a por el amuleto!
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Vale, vamos a ello.
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"GUIDE");
};	

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance  DIA_Grim_AtOCdraussen(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 3;
	condition	= DIA_Grim_AtOCdraussen_Condition;
	information	= DIA_Grim_AtOCdraussen_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_AtOCdraussen_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Grim_AtOCdraussen_Info()
{
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Bueno, pues aquí estamos, lejos de tu amigo Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //¡Nos han dicho que te demos recuerdos de parte de Bloodwyn!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //¡Me han dicho que té de recuerdos de parte de Bloodwyn!
	};

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	
	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);
	
	if ( (Npc_GetDistToNpc(self,Bu520)<1000) && (!Npc_IsDead(Bu520)) )
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};
	
	if ( (Npc_GetDistToNpc(self,Bu534)<1000) && (!Npc_IsDead(Bu534)) )
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
};

// **************************************************
// 				NACH Falle
// **************************************************

INSTANCE DIA_Grim_NACHFalle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_NACHFalle_Condition;
	information		= DIA_Grim_NACHFalle_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grim_NACHFalle_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_NACHFalle_Info()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Así que lo único que querías era tenderme una trampa, ¿eh, idiota?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //¡Oye, tío! ¡Estamos montados en el mismo barco! A mí tampoco me gusta cavar en las minas.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Así que hago lo que me dicen los guardias y pronto seré aceptado.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Que tenga que encargarme de ti precisamente es culpa tuya. ¿Por qué tuviste que empezar una pelea con los guardias?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Personalmente no me caes mal. ¿Qué opinas; paz o seguimos luchando?
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Pelea.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Paz.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //¡Tengo ganas de luchar!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Oh, tío, me deprimes.
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //La paz me parece bien.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Me alegro de que estemos de acuerdo en esto. Olvidémoslo todo. De ahora en adelante, estoy de tu lado.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Si vuelves a verte en problemas, puedes contar conmigo. Después de todo, estoy en deuda contigo.
	Info_ClearChoices	(DIA_Grim_NACHFalle );

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver;				
// **************************************************

INSTANCE DIA_Grim_Hallo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 1;
	condition		= DIA_Grim_Hallo_Condition;
	information		= DIA_Grim_Hallo_Info;
	permanent		= 0;
	description		= "Soy nuevo aquí.";
};

FUNC INT DIA_Grim_Hallo_Condition()
{	
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};
	
	if (FirstOver == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Hallo_Info()
{
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Soy nuevo aquí.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Acabas de llegar, ¿verdad? Yo soy Grim; tampoco llevo mucho aquí. Me arrojaron junto con el cargamento anterior al tuyo.
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_Leben (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Leben_Condition;
	information		= DIA_Grim_Leben_Info;
	permanent		= 0;
	description		= "¿Cómo es la vida aquí?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //¿Cómo es la vida aquí?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Fácil, siempre que pagues el dinero de la protección a los guardias.
};

// **************************************************
// 						Aufnahme
// **************************************************

INSTANCE DIA_Grim_Aufnahme (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Aufnahme_Condition;
	information		= DIA_Grim_Aufnahme_Info;
	permanent		= 0;
	description		= "¿Qué tengo que hacer si quiero que me admitan en este campamento?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //¿Qué tengo que hacer para que me admitan en este campamento?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Bueno, primero tienes que convertirte en miembro de las Sombras. Por tanto, tienes que encontrar a alguien que te apoye. Alguien que te lo explique todo y se responsabilice de ti.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Yo en tu lugar me mantendría cerca de Diego; es lo que hice yo. Buena gente.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //Te hará pasar la prueba de fe; cada caso es diferente. Luego habrá otras tareas menores de las otras Sombras.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Si consigues superar eso, serás uno de nosotros.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

INSTANCE DIA_Grim_HowFarAreYou (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_HowFarAreYou_Condition;
	information		= DIA_Grim_HowFarAreYou_Info;
	permanent		= 1;
	description		= "Y... ¿cuánto has avanzado con tus pruebas?";
};

FUNC INT DIA_Grim_HowFarAreYou_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_HowFarAreYou_Info()
{
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //¿Y bien? ¿Cómo te va con tus pruebas?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Ya he hablado con Dexter, Sly y Fingers. Ellos figuran entre los miembros más influyentes de las Sombras aquí, en el Campamento.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Sly y Fingers son Sombras influyentes.");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_YourPDV (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 5;
	condition		= DIA_Grim_YourPDV_Condition;
	information		= DIA_Grim_YourPDV_Info;
	permanent		= 0;
	description		= "¿Cuál fue TU prueba de fe?";
};

FUNC INT DIA_Grim_YourPDV_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_YourPDV_Info()
{
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //¿Cuál fue tu prueba de fe?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //No puedo decírtelo, tío. ¡Aquí tienes que mantener el pico cerrado sobre esas cosas!
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMO(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMO_Condition;
	information	= DIA_Grim_INEXTREMO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_INEXTREMO_Condition()
{
	return FALSE;
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Eh, ¿te has enterado de las noticias?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //Han venido los In Extremo. Están allí, en el escenario.
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //¡Date prisa o te perderás el espectáculo!

	Npc_ExchangeRoutine	(self,	"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMOAWAY_Condition;
	information	= DIA_Grim_INEXTREMOAWAY_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Dónde están los In Extremo?";
};                       

FUNC int  DIA_Grim_INEXTREMOAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Grim_INEXTREMO)
	&&	(Kapitel == 3) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //¿Dónde están los In Extremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Han seguido su camino. Es una pena; me había acostumbrado a pasar las tardes frente al escenario.

	AI_StopProcessInfos	(self);
};

