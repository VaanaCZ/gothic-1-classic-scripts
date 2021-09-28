// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Yberion_EXIT(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 999;
	condition	= Info_Yberion_EXIT_Condition;
	information	= Info_Yberion_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Yberion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Yberion_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//############################### KAPITEL 1 ###############################


INSTANCE DIA_YBerion_Wache(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Wache_Condition;
	information	= DIA_YBerion_Wache_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_YBerion_Wache_Condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Wache_Info()
{	
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //¿Qué haces aquí? ¿Quién te ha dejado pasar? ¡Guardias!
	B_IntruderAlert		(self,	other);
	AI_StopProcessInfos	(self);
};

//############################### Kennen? ###############################

INSTANCE DIA_YBerion_Kennen(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Kennen_Condition;
	information	= DIA_YBerion_Kennen_Info;
	permanent	= 0;
	description = "Saludos, maese Y'Berion.";
};                       

FUNC INT DIA_YBerion_Kennen_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Kennen_Info()
{	
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Saludos, maestro Y'Berion.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //¡Ah! ¡Me suena tu cara!
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //Imposible. Jamás nos hemos visto.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Pero creía... Bueno, ¿qué quieres?
};


//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "He oído que buscabas algo.";
};


FUNC INT Info_YBerion_BringFocus_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_YBerion_Kennen)	)
	&&	(Npc_GetTrueGuild(hero) != GIL_NONE		)
	&& 	(YBerion_BringFocus		!= LOG_RUNNING	)
	&& 	(YBerion_BringFocus		!= LOG_SUCCESS	)
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Info()
{
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //He oído que buscabas algo.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //Eso es. Necesitamos un foco mágico.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Enviamos al novicio Nyras a buscar el foco, pero aún no ha vuelto.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //¡Podrías averiguar lo que ha sucedido!
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"¡Recuperaré el foco!",	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"¿Dónde debo empezar la búsqueda?",	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"¿Por qué es tan importante el foco?",	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //¡Recuperaré el foco!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Toma este mapa. Está marcada la ubicación del foco.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,"Y'Berion ha enviado al novicio Nyras a recoger el foco mágico, pero éste no ha vuelto aún. El gurú me ha dado un mapa con el camino hasta el foco.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //¿Dónde debo empezar la búsqueda?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Sal del campamento, gira a la derecha y sube al precipicio alto. Atraviesa el bosque hasta que puedas ver el mar. Allí encontrarás el foco.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //¿Por qué es tan importante el foco?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Es un objeto mágico que puede concentrar nuestros poderes espirituales.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //Es uno de los cinco focos de piedra usados por los magos para erigir la Barrera.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //En una visión vi que necesitábamos usar el poder del foco.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //Parece una visión interesante.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Mi visión fue una señal del Durmiente. ¡Podemos alcanzarle con el foco!
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Aún no he encontrado el foco.";
};                       

FUNC INT Info_YBerion_BringFocus_RUNNING_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( !Npc_HasItems ( hero, Focus_1 ))
	{
		return TRUE;
	};
};

FUNC VOID Info_YBerion_BringFocus_RUNNING_Info()
{	
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Aún no he encontrado el foco.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Pues sigue buscando. El Durmiente te guiará.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "He encontrado el foco.";
};                       

FUNC INT Info_YBerion_BringFocus_Success_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Success_Info()
{	
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //He encontrado el foco.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //Excelente. Nos has hecho un gran favor.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Ahora lleva el foco a Cor Kalom. Sabrá lo que ha de hacerse.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //¿Dónde puedo encontrar al tal Cor Kalom?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //Se pasa casi todo el rato en el laboratorio alquímico de la sección superior de las pasarelas.
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //Habla con Lester en la entrada del campamento... A menudo guía a los recién llegados por el campamento.
		B_LogEntry		(CH2_Focus,"Y'Berion me ha pedido que le lleve el foco a otro gurú llamado Cor Kalom, que se pasa todo el día en su laboratorio de alquimia."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,"Y'Berion me ha pedido que le lleve el foco a Cor Kalom. Es todo un placer volver a encontrarse con una persona tan encantadora.");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE;		//Türwache vor dem Labor

	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP			(XP_BringFocusToYBerion);
};

// ------------------------------ NYRAS ----------------------------------
INSTANCE Info_YBerion_NYRAS (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_NYRAS_Condition;
	information	= Info_YBerion_NYRAS_Info;
	permanent	= 0;
	description	= "¡El novicio Nyras se ha vuelto loco!";
};                       

FUNC INT Info_YBerion_NYRAS_Condition()
{
	if  ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_NYRAS_Info()
{	
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //¡El novicio Nyras se ha vuelto loco!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //¡Dijo que el Durmiente había hablado con él y que lo había escogido como su único servidor!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //¡Después atacó e intentó matarme!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //El poder del Durmiente es tan enorme que las almas desprevenidas desesperan ante él.
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Sólo los gurús en nuestros años de meditación hemos alcanzado la fuerza espiritual para soportar la voz del poderoso Durmiente.
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Hay alguna clase de recompensa?"; 
};

FUNC int  GUR_1200_Yberion_EARN_Condition()
{	
	if ( YBerion_BringFocus == LOG_SUCCESS) && ( Npc_GetTrueGuild (hero)!= GIL_NOV ) && ( C_IsChapter(2) )
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_EARN_Info()
{
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //¿Qué hay de una recompensa?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Como no eres miembro de nuestra Hermandad, te recompensaré.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Acepta este amuleto como muestra de gratitud.
	CreateInvItem	    (self, Schutzamulett_Feuer);
	B_GiveInvItems	    (self, hero, Schutzamulett_Feuer, 1);
};  



//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKRÄUTER ZU COR ANGAR GEBRACHT
//YBERION WACHT AUF UND STIRBT
/*
instance GUR_1200_Yberion_LASTWORDS (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_LASTWORDS_Condition;
	information		= GUR_1200_Yberion_LASTWORDS_Info;
	important		= 1;
	permanent		= 0;

};

FUNC int GUR_1200_Yberion_LASTWORDS_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_LASTWORDS_Info()
{
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schläfer...ich sah...IHN!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. Hör mir zu....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schläfer nicht wecken,... die Wassermagier, ...
	AI_Output (other, self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schläfer...Ich sah ihn. Er ist ein ...ein ....Dämon!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr müsst ....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das Böse....darf nicht erwachen .... 
	
	
	
};  
// ------------------------------  ----------------------------------
*/
