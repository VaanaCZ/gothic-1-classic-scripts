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
	description		= "Co je v tom skladišti?"; 
};

FUNC int  GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};


FUNC void  GRD_271_ULBERT_KEY_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_KEY_Info_15_01"); //Co je v tom skladišti?
	AI_Output			(self, other,"GRD_271_ULBERT_KEY_Info_07_02"); //Do toho ti nic není.
};  
// ***************** Infos *****************************

instance  GRD_271_ULBERT_TRICK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_TRICK_Condition;
	information		= GRD_271_ULBERT_TRICK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Když tady jsi tak dlouho, musíš mít z toho žízeò."; 
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
	AI_Output			(other, self,"GRD_271_ULBERT_TRICK_Info_15_01"); //Když tady jsi tak dlouho, musíš mít z toho žízeò.
	AI_Output			(self, other,"GRD_271_ULBERT_TRICK_Info_07_02"); //To si piš! Èlovìèe, mohl bych to do sebe lejt! A co ty?

	Log_CreateTopic		(CH2_StorageShed,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_RUNNING);
	B_LogEntry		(CH2_StorageShed,"Strážce Ulbert hlídá skladištì ve Starém dole. Mìl bych mu dát nìco k pití!"); 
};  

// ***************** Infos *****************************

instance  GRD_271_ULBERT_DRINK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_DRINK_Condition;
	information		= GRD_271_ULBERT_DRINK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(podej nápoj)"; 
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
	AI_Output			(other, self,"GRD_271_ULBERT_DRINK_Info_15_01"); //Tady máš, dej si poøádnì na mì!
	AI_Output			(self, other,"GRD_271_ULBERT_DRINK_Info_07_02"); //Díky.
	
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
	description		= "Je TEÏ v tom skladišti nìco mimoøádného?"; 
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
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_01"); //Je TEÏ v tom skladišti nìco mimoøádného?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_02"); //Nìjaké truhly, ve kterých skladujeme zásoby. Ztratil se ale klíè.
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_03"); //Ztratil?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_04"); //Vsadím se, že v tom má prsty Aleph. Tomu klukovi se nedá vìøit.

	B_LogEntry		(CH2_StorageShed,"Když jsem dal Ulbertovi napít, øekl mi, že ztratil klíè od truhlic. Údajnì v tom má prsty kopáè Aleph!");
};  
// ***************** Infos *****************************
instance  GRD_271_ULBERT_LOCK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_LOCK_Condition;
	information		= GRD_271_ULBERT_LOCK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(odlákej Ulberta)"; 
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
	AI_Output			(other, self,"GRD_271_ULBERT_LOCK_Info_15_01"); //Poslyš, Ian sedí s ostatními dole a opékají si tam maso.
	AI_Output			(self, other,"GRD_271_ULBERT_LOCK_Info_07_02"); //Cože? Beze mì? Dobøe, vezmu si svùj díl.
	
	B_LogEntry		(CH2_StorageShed,"Dostat Ulberta ze skladištì bylo snadné. Nepùsobí pøíliš bystrým dojmem!");

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
	AI_Output			(self, other,"GRD_271_ULBERT_ANGRY_Info_07_01"); //Hej, ty, tam se vùbec žádné maso neopéká!
	AI_Output			(other, self,"GRD_271_ULBERT_ANGRY_Info_15_02"); //Och... ech... To jsem se musel splést! Pìknej den!

	B_GiveXP			(XP_LureUlbertAway);
	
	B_LogEntry		(CH2_StorageShed,"Znovu jsem potkal Ulberta. Èlovìèe, ten vùbec nepochopil, že jsem ho zatáhl do té hry. Tak naivní je ten chlapík!");
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_SUCCESS);

	Npc_ExchangeRoutine	(self,	"start");
	AI_StopProcessInfos	(self);
}; 
