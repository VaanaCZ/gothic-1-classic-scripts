//***********************************************
//					EXIT	
//***********************************************

instance  DIA_Torrez_Exit (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  999;
	condition	=  DIA_Torrez_Exit_Condition;
	information	=  DIA_Torrez_Exit_Info;
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  DIA_Torrez_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFirebolt))
	{
	CreateInvItem (self, ItArRuneFirebolt);
	};
};

//***********************************************
//					Hallo	
//***********************************************

instance  DIA_Torrez_Hello (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_Hello_Condition;
	information	=  DIA_Torrez_Hello_Info;
	permanent	=  0;
	description =  "¡Busco al Gran Mago del Círculo del Fuego!";
};                       

FUNC int  DIA_Torrez_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Hello_Info()
{
	AI_Output (other, self,"DIA_Torrez_Hello_15_00"); //¡Busco al Gran Mago del Círculo de Fuego!
	AI_Output (self, other,"DIA_Torrez_Hello_04_01"); //¡Habla con Milten! ¡Ahora, márchate!
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					Belohnung WÄHLEN	
//***********************************************

instance  DIA_Torrez_Belohnung (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_Belohnung_Condition;
	information	=  DIA_Torrez_Belohnung_Info;
	permanent	=  0;
	description =  "He entregado una carta, y voy a escoger mi propia recompensa.";
};                       

FUNC int  DIA_Torrez_Belohnung_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_Belohnung_Info()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_15_00"); //Vengo de parte de Corristo. Le he entregado la carta y puedo elegir yo mismo la recompensa.
	AI_Output (self, other,"DIA_Torrez_Belohnung_04_01"); //Nos has rendido un gran servicio y serás recompensado. Elige con cuidado.
	
	Info_ClearChoices	(DIA_Torrez_Belohnung);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Esencia del espíritu (mana máximo +5)",DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice		(DIA_Torrez_Belohnung,"3 pergaminos de conjuro (bola de fuego, relámpago zigzagueante y transformarse en carroñero)",DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Anillo de Destreza (+5)",DIA_Torrez_Belohnung_Dex);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Anillo de Fuerza (+5)",DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Str_15_00"); //Escojo el Anillo de Fuerza.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Str_04_01"); //La elección prevista. Aquí tienes el anillo.
	CreateInvItem(self, Staerkering);
	B_GiveInvItems (self, hero, Staerkering, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Dex_15_00"); //Escojo el Anillo de Destreza.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Dex_04_01"); //La destreza supera a la fuerza. Una sabia decisión.
	CreateInvItem(self, Ring_des_Geschicks);
	B_GiveInvItems (self, hero, Ring_des_Geschicks, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Scrolls_15_00"); //Dame los pergaminos de conjuros.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Scrolls_04_01"); //Utilízalos con sabiduría. ¡Sólo puedes usar una vez cada uno!
	CreateInvItems(self, ItArScrollFireball, 3);
	B_GiveInvItems (self, hero, ItArScrollFireball, 3);//Wegen Bildschirmausgabe, wird direkt angepasst
	Npc_RemoveInvItems(other, ItArScrollFireball, 2);
	CreateInvItem(other, ItArScrollTrfScavenger);
	CreateInvItem(other, ItArScrollChainLightning);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_ManaMax_15_00"); //¡Quiero la poción!
	AI_Output (self, other,"DIA_Torrez_Belohnung_ManaMax_04_01"); //¡Una sabia decisión! Has escogido el más precioso de todos los dones. ¡Bébete la poción y tu fuerza aumentará!
	CreateInvItem(self, ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

//***********************************************
//					Brief TAUSCH
//***********************************************

instance  DIA_Torrez_BriefTausch (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_BriefTausch_Condition;
	information	=  DIA_Torrez_BriefTausch_Info;
	permanent	=  0;
	description =  "¡Tengo una carta para ti! ¡Pero antes quiero mi recompensa!";
};                       

FUNC int  DIA_Torrez_BriefTausch_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_BriefTausch_Info()
{
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_00"); //¡Tengo una carta para ti! ¡Pero primero quiero mi recompensa!
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_01"); //¿Por qué no vas a hablar con Milten?
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_02"); //Ya lo he hecho.
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_03"); //Comprendo. Aquí tengo tu recompensa; muéstrame la carta. ¡Ahora!
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_04"); //Aquí la tienes.
		
	if (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_05"); //Tu recompensa es un Anillo de Fuerza. Es un artefacto poco común y te será de gran utilidad.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_06"); //¡Ahora márchate!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_01, 1);
		CreateInvItems(self, Staerkering, 1);
		B_GiveInvItems(self,other, Staerkering, 1);
		B_GiveXP(XP_XardasLetter);
	}
	else if (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_07"); //El sello está roto.
		AI_Output (other, self,"DIA_Torrez_BriefTausch_15_08"); //Ha sido un accidente.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_09"); //Tu recompensa es la poción de curación. Date por satisfecho con eso. ¡Normalmente, los mensajeros que entregan cartas no selladas no obtienen nada a cambio!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_02, 1);
		CreateInvItems(self, ItFo_Potion_Health_03, 1);
		B_GiveInvItems(self, other, ItFo_Potion_Health_03, 1);
		B_GiveXP(XP_XardasLetterOPEN);
	};
	var C_NPC corristo; corristo = Hlp_GetNpc(KdF_402_Corristo);
	
	CreateInvItems(corristo, ItWr_Fire_Letter_02, 1);
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					PERM
//***********************************************

instance  DIA_Torrez_PERM (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_PERM_Condition;
	information	=  DIA_Torrez_PERM_Info;
	permanent	=  1;
	description =  "¿Qué tal es aventurarse en las artes mágicas?";
};                       

FUNC int  DIA_Torrez_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_PERM_Info()
{
	AI_Output (other, self,"DIA_Torrez_PERM_15_00"); //¿Qué tal es aventurarse en las artes mágicas?
	AI_Output (self, other,"DIA_Torrez_PERM_04_01"); //¡Eso no es asunto tuyo!
	AI_StopProcessInfos	( self );
};










///////////////////////////////////////////
///////////////////////////////////////////
/////////////   Kapitel 3   ///////////////
///////////////////////////////////////////
///////////////////////////////////////////

//---------------------------------------------------------
//					WÄHREND DER AUFNAHME	
//---------------------------------------------------------
instance KDF_405_Torrez_BOOK (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_BOOK_Condition;
	information		= KDF_405_Torrez_BOOK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_405_Torrez_BOOK_Condition()
{	
	if    (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	&&    (Npc_KnowsInfo (hero,KDF_403_Drago_RUNE))
	{
		return TRUE;
	};
};
func void  KDF_405_Torrez_BOOK_Info()
{
	
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_01"); //Para cada uno de los Círculos hay un libro que explica su magia. Estudia esos libros. ¡El conocimiento es poder!
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_02"); //Toma el libro del Primer Círculo y aprende a comprender el Fuego.
	CreateInvItem (self,ItWr_Book_Circle_01);
	B_GiveInvItems(self,hero,ItWr_Book_Circle_01, 1);
	AI_StopProcessInfos	( self );
};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDF_405_Torrez_SELLBOOKS (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_SELLBOOKS_Condition;
	information		= KDF_405_Torrez_SELLBOOKS_Info;
	important		= 0;
	permanent		= 1;
	description		= "Quiero adquirir escritos mágicos."; 
	trade 			= 1;
};

FUNC int  KDF_405_Torrez_SELLBOOKS_Condition()
	{	
		if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
		{
			return TRUE;
		};
	
	};
FUNC void  KDF_405_Torrez_SELLBOOKS_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_SELLBOOKS_Info_15_01"); //Quiero obtener escritos de magia.
};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG						
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_GREET (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_GREET_Condition;
	information		= KDF_405_Torrez_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Saludos, mago."; 
};

FUNC int  KDF_405_Torrez_GREET_Condition()
	{
		return TRUE;
	};


FUNC void  KDF_405_Torrez_GREET_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_GREET_Info_15_01"); //Saludos, Mago.
	AI_Output (self, other,"KDF_405_Torrez_GREET_Info_04_02"); //¡Que Innos esté contigo! ¡Yo trafico con conocimientos de magia y puedo enseñarte a incrementar tus poderes mágicos!
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Torres vende PERGAMINOS DE CONJURO y RUNAS. Durante el día está en el patio.");

	Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Torres puede enseñarme a incrementar mi MANA. Durante el día está en el patio.");
};
// 
instance  KDF_405_Torrez_MANA (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_MANA_Condition;
	information		= KDF_405_Torrez_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Necesito más poder mágico."; 
};

FUNC int  KDF_405_Torrez_MANA_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_MANA_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_MANA_Info_15_01"); //Necesito más poder mágico.
	AI_Output (self, other,"KDF_405_Torrez_MANA_Info_04_02"); //Puedo ayudarte a incrementar tu poder. El uso que hagas de él es asunto tuyo.
	
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK							,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Aumentar en 5 el mana (cuesta 5 puntos de habilidad)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Aumentar en 1 el mana (cuesta 1 puntos de habilidad)",KDF_405_Torrez_MANA_MAN_1);
};  
func void KDF_405_Torrez_MANA_BACK()
{
	Info_ClearChoices	(KDF_405_Torrez_MANA);
};

func void KDF_405_Torrez_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 1);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Aumentar en 5 el mana (cuesta 5 puntos de habilidad)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Aumentar en 1 el mana (cuesta 1 puntos de habilidad)",KDF_405_Torrez_MANA_MAN_1);

};

func void KDF_405_Torrez_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Aumentar en 5 el mana (cuesta 5 puntos de habilidad)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Aumentar en 1 el mana (cuesta 1 puntos de habilidad)",KDF_405_Torrez_MANA_MAN_1);

};
/*------------------------------------------------------------------------
							Magier Werden?									
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_WANNABEMAGE (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_WANNABEMAGE_Condition;
	information		= KDF_405_Torrez_WANNABEMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Qué tengo que hacer para convertirme en mago?"; 
};

FUNC int  KDF_405_Torrez_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, KDF_405_Torrez_GREET))
	&& (Npc_GetTrueGuild (hero) != GIL_KDF)
	&& (!Npc_KnowsInfo (hero, KDF_402_Corristo_WANNBEKDF))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_WANNABEMAGE_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //¿Qué tengo que hacer para convertirme en mago?
	AI_Output (self, other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //Habla con el Maestro Corristo, si es que te concede su tiempo.
};  
