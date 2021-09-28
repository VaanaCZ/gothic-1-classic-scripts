// ************************ EXIT **************************

instance  Info_Riordian_EXIT (C_INFO)
{
	npc			= KDW_605_Riordian;
	nr			= 999;
	condition	= Info_Riordian_EXIT_Condition;
	information	= Info_Riordian_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
	
	if (!Npc_HasItems (self,ItArRuneThunderball))
	{
		CreateInvItem (self,ItArRuneThunderball);
	};

};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************//Bist du der Wassermagier, der die Tränke braut?
instance Info_Riordian_NEWS (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_NEWS_Condition;
	information	= Info_Riordian_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Me manda Saturas. ";
};

FUNC INT Info_Riordian_NEWS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_OFFER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_NEWS_Info()
{
	AI_Output (other, self,"Info_Riordian_NEWS_15_01"); //Vengo de parte de Saturas.
	AI_Output (self, other,"Info_Riordian_NEWS_14_02"); //Ahhh, acércate. Ya he sido informado.
	AI_Output (self, other,"Info_Riordian_NEWS_14_03"); //Aquí tienes estas pociones; son de todo tipo.
	AI_Output (self, other,"Info_Riordian_NEWS_14_04"); //Ahora ve y tráenos los focos de piedra. Estos artefactos son nuestra única esperanza.

	CreateInvItems (self, ItFo_Potion_Health_01,	20); 
	B_GiveInvItems (self,hero, ItFo_Potion_Health_01,	20); //Notwendig für die Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero, ItFo_Potion_Health_01,	15);

	CreateInvItems (hero, ItFo_Potion_Mana_01,		5);
	CreateInvItems (hero, ItFo_Potion_Health_02,	2);
	CreateInvItems (hero, ItFo_Potion_Mana_02,		2);
	CreateInvItems (hero, ItFo_Potion_Health_03,	1);
	CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
	CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
	CreateInvItems (hero, ItFo_Potion_Strength_01,	1);
	CreateInvItems (hero, ItFo_Potion_Dex_01,		1);
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Riordian_REWARD (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_REWARD_Condition;
	information	= Info_Riordian_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Saturas dijo que me darías una recompensa?";
};

FUNC INT Info_Riordian_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_REWARD_Info()
{
	AI_Output			(other, self,"Info_Riordian_REWARD_15_01"); //Saturas dijo que tenías una recompensa para mí.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_02"); //Ahhhh, acércate, acércate.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_03"); //Nuestro líder espiritual me ha informado de tus heroicas hazañas.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_04"); //Toda la gente del Campamento, no, toda la colonia, está en deuda contigo.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_05"); //Acepta esto como modesta recompensa por todos tus esfuerzos.

	CreateInvItems		(self, ItFo_Potion_Health_02,		20);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_02, 20);//Notwenidg für Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems  (hero, ItFo_Potion_Health_02, 		15);

	CreateInvItems		(hero, ItFo_Potion_Mana_02,			5);
	CreateInvItems		(hero, ItFo_Potion_Health_03,		2);
	CreateInvItems		(hero, ItFo_Potion_Mana_03,			2);
	CreateInvItems		(hero, ItFo_Potion_Haste_02,		3);
	CreateInvItems		(hero, ItFo_Potion_Master_01,		1);
	CreateInvItems		(hero, ItFo_Potion_Health_Perma_02,	1);
	CreateInvItems		(hero, ItFo_Potion_Mana_Perma_02,	1);

	B_LogEntry			(CH3_BringFoci,"Riordian ha mostrado la misma actitud abierta que de costumbre. Me ha dado montones de pociones. Estoy convencido de que me resultarán de ayuda.");
	if	Npc_KnowsInfo(hero, Info_Cronos_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,	LOG_SUCCESS);
	};
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info MESSAGE
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGE (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGE_Condition;
	information	= Info_Riordian_MESSAGE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Riordian_MESSAGE_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredFreeMine
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGE_Info()
{
	AI_Output (self, hero,"Info_Riordian_MESSAGE_14_01"); //¡Me alegra que hayas venido! ¡Te estaba esperando!
};

//---------------------------------------------------------------------
//	Info MESSAGEWHY
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGEWHY (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGEWHY_Condition;
	information	= Info_Riordian_MESSAGEWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Me estabas esperando? ¿Por qué?";
};

FUNC INT Info_Riordian_MESSAGEWHY_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_01"); //¿Que me estabas esperando? ¿Por qué?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_02"); //¡Gorn me pidió que te enviara a verle en cuanto llegases!
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_03"); //¿Qué ocurre?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_04"); //Tiene un plan para liberar la mina ocupada.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_05"); //¿Sigue vigilando la entrada a la mina?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_06"); //¡Sí! ¡Por favor, ve a verle lo antes posible!
};
/*------------------------------------------------------------------------
//							WELCOME							//
------------------------------------------------------------------------*/
instance KDW_605_Riordian_WELCOME (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_WELCOME_Condition;
	information		= KDW_605_Riordian_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW )
	
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_WELCOME_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Me alegro de que te hayas unido a nosotros.
};
//-----------------------------------------------------------
instance KDW_605_Riordian_HEAL (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_HEAL_Condition;
	information		= KDW_605_Riordian_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	&& (Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_HEAL_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_HEAL_Info_14_01"); //Si estás herido, yo te curaré.
};
// ***************************** INFOS ****************************************//

instance  KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Estoy herido. ¿Puedes curarme?"; 
};

FUNC int  KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Estoy herido. ¿Puedes curarme?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Con mis palabras invoco los poderes de la curación; ¡tu cuerpo y tu espíritu sanarán!
	 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play  ("MFX_Heal_Cast");
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Saludos, mago!"; 
};

FUNC int  KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_605_Riordian_GREET_Info()
{
	AI_Output 		(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //¡Saludos, Mago!
	AI_Output 		(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Yo soy Riordian, el alquimista. Tengo entendido que quieres una poción.
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry 		(GE_TraderNC,"Riordian, el Mago del Agua, comercia con POCIONES. Se encuentra en el laboratorio de alquimia del nivel superior.");
	
};  
/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_TRADE (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_TRADE_Condition;
	information		= KDW_605_Riordian_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Muéstrame tus mercancías."; 
	trade			= 1;
};

FUNC int  KDW_605_Riordian_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_TRADE_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Muéstrame lo que tienes.
	
};  
