instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Hasta luego.
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //¡Que el Durmiente se despierte!
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Templarios, ¿qué hacéis en la mina?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //¿Qué hacen unos templarios como vosotros en la mina?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Estamos cazando reptadores. Vuélvete al Campamento; allí estarás a salvo.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Por qué cazáis a los reptadores?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //¿Por qué cazáis a los reptadores?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Por sus mandíbulas. Contienen una valiosa secreción.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //¿Qué clase de secreción?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Un veneno. Sólo nuestro Gurú, Cor Kalorn, sabe cómo elaborar pociones con él.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Quién es Cor Kalom?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //¿Quién es Cor Kalorn?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Uno de los hombres más poderosos de toda la Hermandad. Conoce muchos secretos; ¡puede controlar los pensamientos de otras personas!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Aparte de eso, es un alquimista. Elabora pociones para que nos pongamos en contacto espiritual con el Durmiente. Vete al Campamento. ¡Siempre buscamos gente nueva!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Me lo pensaré.
};  
//---------------------WENN DIE EIERSUCHE LÄUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Busco el nido de los reptadores."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Estoy buscando el nido de los reptadores.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Vete a ver a Gor Na Vid, Gor Na Kosh o Gor Na Bar. Ellos saben más que yo acerca de los reptadores.

	B_LogEntry		(CH2_MCEggs,"En la entrada de la Vieja Mina, he preguntado a un templario acerca del nido de reptadores. Éste me remitió a otros tres templarios: Gor Na Vid, Gor Na Kosh y Gor Na Bar. Estos nombrecitos que tienen en la Hermandad me están volviendo loco.");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Cómo puedo quitar las mandíbulas a los reptadores de la mina?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //¿Cómo puedo quitarles las mandíbulas a los reptadores?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //No es fácil, pero puedo enseñarte a hacerlo.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Aprender a extraer las mandíbulas (1 punto de habilidad)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //¿Puedes enseñarme el modo de quitarles las mandíbulas a los reptadores?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Primero necesitas hacer un corte profundo en la carne. Ten cuidado de no darle a la glándula de las mandíbulas. Si lo haces, la secreción saldrá a chorros.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //Eso debe ser muy doloroso.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //¡Ya lo creo! ¿Has visto alguna vez a Korgur Tres Dedos, el cazador de reptadores? Ah, no; eso fue antes de que tú llegaras. Bueno, sigamos...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Haz un corte alrededor de las glándulas, dejando un amplio margen, y extrae la carne junto con la mandíbula. Si haces eso, no tendrás ningún problema para extraerlas.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Cómo quitar mandíbulas: reptadores de la mina.");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Aprender: quitar mandíbulas de reptador", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("¡Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
