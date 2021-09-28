// ************************ EXIT **************************

instance  GRD_271_ULBERT_Exit (C_INFO)
{
	npc			=  GRD_271_ULBERT;
	nr			=  999;
	condition	=  GRD_271_ULBERT_Exit_Condition;
	information	=  GRD_271_ULBERT_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************
instance  GRD_271_ULBERT_KEY (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_KEY_Condition;
	information		= GRD_271_ULBERT_KEY_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Qué hay en el almacén?"; 
};

FUNC int  GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};


FUNC void  GRD_271_ULBERT_KEY_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_KEY_Info_15_01"); //¿Qué hay en el almacén?
	AI_Output			(self, other,"GRD_271_ULBERT_KEY_Info_07_02"); //Eso no es asunto tuyo.
};  
// ***************** Infos *****************************

instance  GRD_271_ULBERT_TRICK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_TRICK_Condition;
	information		= GRD_271_ULBERT_TRICK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Seguro que tienes mucha sed por estar tanto tiempo de un lado para el otro."; 
};

FUNC int  GRD_271_ULBERT_TRICK_Condition()
{
	if (Npc_KnowsInfo(hero, GRD_271_ULBERT_KEY))
	{	
		return 1;
	};
};


FUNC void  GRD_271_ULBERT_TRICK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_TRICK_Info_15_01"); //Seguro que tienes mucha sed por estar tanto tiempo de un lado para el otro.
	AI_Output			(self, other,"GRD_271_ULBERT_TRICK_Info_07_02"); //¡Ya te digo! Tío, me vendría bien un buen trago. ¿Tienes algo?

	Log_CreateTopic		(CH2_StorageShed,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_RUNNING);
	B_LogEntry		(CH2_StorageShed,"El guardia Ulbert está protegiendo la caseta de almacenamiento de la Vieja Mina. ¡Debo conseguirle algo de beber!"); 
};  

// ***************** Infos *****************************

instance  GRD_271_ULBERT_DRINK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_DRINK_Condition;
	information		= GRD_271_ULBERT_DRINK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Ofrecer un trago)"; 
};

FUNC int  GRD_271_ULBERT_DRINK_Condition()
{	
	if  (Npc_KnowsInfo ( hero, GRD_271_ULBERT_TRICK) ) &&	(Npc_HasItems (hero, ItFobeer )|| 
															 Npc_HasItems (hero, ItFoWine )||
															 Npc_HasItems (hero, ItFoBooze)  )
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_DRINK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_DRINK_Info_15_01"); //¡Ten, echa un trago también a mi salud!
	AI_Output			(self, other,"GRD_271_ULBERT_DRINK_Info_07_02"); //Gracias.
	
	if 		(Npc_HasItems (hero, ItFobeer ))
	{
		B_GiveInvItems  	(hero, self, ItFobeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		(self,	ItFobeer);
	}
	else if (Npc_HasItems (hero, ItFowine ))
	{
		B_GiveInvItems	    (hero, self, ItFowine, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		( self, ItFoWine);
	}
	else if (Npc_HasItems (hero, ItFoBooze))
	{
		B_GiveInvItems	(hero, self, ItFoBooze, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		( self, ItFoBooze);
	};
};  
// ***************** Infos *****************************
instance  GRD_271_ULBERT_DRUNK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_DRUNK_Condition;
	information		= GRD_271_ULBERT_DRUNK_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Hay algo especial en el almacén?"; 
};

FUNC int  GRD_271_ULBERT_DRUNK_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRINK) )
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_DRUNK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_01"); //¿Hay algo especial en el almacén?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_02"); //Algunos cofres en los que guardamos provisiones. Sin embargo, la llave ha desaparecido.
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_03"); //¿Desaparecido?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_04"); //Seguro que Aleph tuvo algo que ver. Ese tipo no es de fiar.

	B_LogEntry		(CH2_StorageShed,"Después de conseguirle a Ulbert algo de beber, me ha dicho que ha perdido la llave de los cofres. Supuestamente, ¡Aleph el cavador tiene algo que ver!");
};  
// ***************** Infos *****************************
instance  GRD_271_ULBERT_LOCK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_LOCK_Condition;
	information		= GRD_271_ULBERT_LOCK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Alejar a Ulbert)"; 
};

FUNC int  GRD_271_ULBERT_LOCK_Condition()
{
	if ( Npc_KnowsInfo (hero ,GRD_271_ULBERT_DRUNK))
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_LOCK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_LOCK_Info_15_01"); //Escucha, Ian y los demás están en el fondo comiendo carne a la parrilla.
	AI_Output			(self, other,"GRD_271_ULBERT_LOCK_Info_07_02"); //¿Qué? ¿Sin mí? ¡Voy a por mi ración!
	
	B_LogEntry		(CH2_StorageShed,"No me ha costado demasiado alejar a Ulbert de la caseta de almacenamiento. ¡No parece ser alguien brillante, precisamente!");

	Npc_ExchangeRoutine	(self,	"away");
	AI_StopProcessInfos	(self);
};

// ***************** Ulbert ist sauer *****************************
instance  GRD_271_ULBERT_ANGRY (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_ANGRY_Condition;
	information		= GRD_271_ULBERT_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_271_ULBERT_ANGRY_Condition()
{
	if	Npc_KnowsInfo(hero,GRD_271_ULBERT_LOCK)
	&&	(Npc_GetDistToWP(hero, "OM_CAVE1_49") < 600)
	{
		return TRUE;
	};

};
FUNC void  GRD_271_ULBERT_ANGRY_Info()
{
	AI_Output			(self, other,"GRD_271_ULBERT_ANGRY_Info_07_01"); //¡Eh tú, no había carne a la parrilla!
	AI_Output			(other, self,"GRD_271_ULBERT_ANGRY_Info_15_02"); //Oh... uh... Supongo que debo haberme confundido! ¡Que pases un buen día!

	B_GiveXP			(XP_LureUlbertAway);
	
	B_LogEntry		(CH2_StorageShed,"He vuelto a encontrarme con Ulbert. Es increíble: ni siquiera comprende que le he tomado el pelo. ¡Ese chico es muy ingenuo!");
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_SUCCESS);

	Npc_ExchangeRoutine	(self,	"start");
	AI_StopProcessInfos	(self);
}; 
