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
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //�Que el Durmiente se despierte!
	
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
	description		= "Templarios, �qu� hac�is en la mina?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //�Qu� hacen unos templarios como vosotros en la mina?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Estamos cazando reptadores. Vu�lvete al Campamento; all� estar�s a salvo.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Por qu� caz�is a los reptadores?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //�Por qu� caz�is a los reptadores?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Por sus mand�bulas. Contienen una valiosa secreci�n.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //�Qu� clase de secreci�n?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Un veneno. S�lo nuestro Gur�, Cor Kalorn, sabe c�mo elaborar pociones con �l.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Qui�n es Cor Kalom?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //�Qui�n es Cor Kalorn?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Uno de los hombres m�s poderosos de toda la Hermandad. Conoce muchos secretos; �puede controlar los pensamientos de otras personas!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Aparte de eso, es un alquimista. Elabora pociones para que nos pongamos en contacto espiritual con el Durmiente. Vete al Campamento. �Siempre buscamos gente nueva!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Me lo pensar�.
};  
//---------------------WENN DIE EIERSUCHE L�UFT-------------------------------  
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
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Vete a ver a Gor Na Vid, Gor Na Kosh o Gor Na Bar. Ellos saben m�s que yo acerca de los reptadores.

	B_LogEntry		(CH2_MCEggs,"En la entrada de la Vieja Mina, he preguntado a un templario acerca del nido de reptadores. �ste me remiti� a otros tres templarios: Gor Na Vid, Gor Na Kosh y Gor Na Bar. Estos nombrecitos que tienen en la Hermandad me est�n volviendo loco.");  
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
	description		= "�C�mo puedo quitar las mand�bulas a los reptadores de la mina?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //�C�mo puedo quitarles las mand�bulas a los reptadores?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //No es f�cil, pero puedo ense�arte a hacerlo.
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
	description		= "Aprender a extraer las mand�bulas (1 punto de habilidad)"; 
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
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //�Puedes ense�arme el modo de quitarles las mand�bulas a los reptadores?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Primero necesitas hacer un corte profundo en la carne. Ten cuidado de no darle a la gl�ndula de las mand�bulas. Si lo haces, la secreci�n saldr� a chorros.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //Eso debe ser muy doloroso.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //�Ya lo creo! �Has visto alguna vez a Korgur Tres Dedos, el cazador de reptadores? Ah, no; eso fue antes de que t� llegaras. Bueno, sigamos...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Haz un corte alrededor de las gl�ndulas, dejando un amplio margen, y extrae la carne junto con la mand�bula. Si haces eso, no tendr�s ning�n problema para extraerlas.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"C�mo quitar mand�bulas: reptadores de la mina.");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Aprender: quitar mand�bulas de reptador", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("�Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
