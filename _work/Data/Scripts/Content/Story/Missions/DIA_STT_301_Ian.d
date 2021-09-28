
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Voy a echar una ojeada.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //No causes problemas.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Eres Ian, el capataz de la mina?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //¿Eres Ian, el jefe de la mina?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Sí, soy Ian. Y ésta es mi mina. Así que no toques ni rompas nada.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿No es esa la mina de Gómez?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //¿No es ésta la mina de Gómez?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Sí, claro que ésta es la mina del Campamento Viejo. Pero aquí no hay más que un jefe, y ése soy yo.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Puedes hablarme de la producción de mineral de este lugar?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //¿Puedes contarme algo acerca de la producción de mineral de aquí?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Excavamos día y noche en busca de mineral. Esto significa un almacenaje de 200 sacos al mes y otros 20 sacos que serán fundidos.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Con el mineral que le proporcionamos al rey se pueden forjar cientos de espadas.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "He oído que el mineral tiene propiedades mágicas. Háblame de ello."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //He oído decir que el mineral tiene propiedades mágicas. Háblame de ello.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //El mineral mágico tiene propiedades especiales. Las armas forjadas con él no se rompen y sus hojas están más afiladas que las normales.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Un ejército equipado con estas armas tiene una ventaja decisiva en combate.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cuéntame más cosas del mineral."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Cuéntame más acerca del mineral.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Por desgracia, los poderes mágicos del mineral desaparecen durante el proceso de fundición. En las fundiciones de Nordmar conocen la técnica correcta.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Pero, incluso sin sus poderes mágicos, las armas fabricadas con este mineral son extremadamente resistentes e infligen más daño que las normales.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Háblame de la mina."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Cuéntame más cosas acerca de la mina.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Si quieres echar un vistazo por aquí, será mejor que tengas cuidado. En las cuevas hay reptadores. Será mejor que no salgas del pozo principal.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //Y no molestes a los templarios. Aunque suelan estar sin hacer nada, son los mejores luchadores que puedas tener de tu lado cuando se trata de los reptadores.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Lo tendré presente.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Tengo trabajo. No distraigas a mis muchachos de su labor.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Echaré un vistazo por aquí.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Estoy aquí para recoger la lista para el Campamento."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //He venido a recoger la lista para el Campamento.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Cualquiera podría venir y decir eso. Piérdete.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Me manda Diego. Vengo a recoger la lista."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Vengo de parte de Diego. Tengo que recoger la lista.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //De acuerdo; aquí la tienes. Diles que se den prisa con el reparto.
	B_LogEntry  (CH1_BringList,"Ian me ha entregado la lista sin ningún problema.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Por aquí debe haber un nido de reptadores de la mina.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Debe haber un nido de reptadores cerca de aquí.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Es probable que aquí haya docenas de nidos.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Escucha, tengo que encontrar este nido.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Ahora no tengo tiempo para eso. Nuestra trituradora ha dejado de funcionar. La rueda dentada se rompió hace unas horas.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //No tengo ni idea de dónde puedo conseguir una nueva.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Consígueme una rueda dentada y resolveré tu problema.

	B_LogEntry		(CH2_MCEggs,"Ian, el jefe de la mina, me ayudará a encontrar el nido. Mejor que le encuentre una nueva rueda dentada para su trituradora de mineral. Ha mencionado un túnel lateral abandonado donde puedo encontrar una vieja trituradora.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "¿Una rueda dentada? ¿Dónde se supone que voy a conseguirla?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //¿Una rueda dentada? ¿Y dónde puedo encontrar algo así?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //No lo sé. ¡Tengo la misma idea que tú!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //Pero hay una vieja trituradora rota en uno de los pozos laterales. Tal vez tengas suerte.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Tengo la rueda dentada.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //He conseguido la rueda dentada.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Eh, buen trabajo. Sí, creo que funcionará. A ver, tú estabas buscando un nido de reptadores... Mm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Vete a ver a Ashgan y dile que abra la puerta para que puedas buscar en los pozos oscuros.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Dile 'Todo irá bien'. Entonces sabrá que te he dado permiso.

	B_LogEntry		(CH2_MCEggs,"Le he traído a Ian la rueda dentada de la trituradora de mineral abandonada. Me ha pedido que le diga a Asghan que TODO VA A IR BIEN. Al parecer, eso hará que abra la puerta a los pozos oscuros.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Sigo buscando el nido de reptadores.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Sigo buscando el nido de reptadores.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Ya te he dicho que vayas a ver a Ashgan. Él es el jefe de los guardias. Puedes encontrarlo en algún lugar del nivel inferior.

	B_LogEntry		(CH2_MCEggs,"Si quiero encontrar el nido de los reptadores de la mina, tengo que hablar con Asghan.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "¡He encontrado el nido!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //¡He encontrado el nido!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //Entonces al fin podremos volver a gozar de paz y tranquilidad por aquí. ¡Ja, ja, ja!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Sin ánimo de ofender. ¡Buen trabajo, muchacho!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Toma, acepta esta caja de cervezas como recompensa.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "¡He encontrado el nido! ¡Y los huevos de la reina reptadora de la mina!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //¡He encontrado el nido! ¡Y los huevos de la reina reptadora!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //¿Cómo? ¿Sólo has encontrado esos huevos? Bueno, y qué. Has demostrado que sabes luchar.
};
