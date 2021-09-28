/*
-------------------------------- Die Mission ----------------------------

Die Freemine Mission. 
Der SC metzelt sich durch die FM und findet dort einen Orc, welcher schwer
verletzt ist und einen Orcischen Heiltrank braucht. 
Alls Gegenleistung f�r den Heiltrank sagt er dir was man alles f�r Items
f�r das Ulu-Mulu braucht.
Wenn man ihm die drei Teile bringt bastelt er dir das Ulumulu.

--------------------------------- Die Items -----------------------------
OrcHeiltrank:			Orcmedicine			-> OrcGegengift	
	
Teil vom Ulu-Mulu (1)	ItAt_Waran_01		-> 	Flammenzunge
Teil vom Ulu-Mulu (2)	ItAt_Shadow_02		->	Horn eines Shadowbeast
Teil vom Ulu-Mulu (3)	ItAt_Swampshark_02	->	Z�hne des Sumpfhais
Teil vom Ulu-Mulu (4)   ItAt_Troll_02		->	Hauer eines Trolls

Ulu-Mulu				Ulumulu				-> Das Ulumulu

----------------------------------- ToDo ---------------------------------
-> Monsterhinweise m�ssen noch rein
-> Missionlogs basteln
-> Sprache �berarbeiten
*/


//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance Info_FreemineOrc_EXIT (C_INFO)
{
	npc			= FreemineOrc;
	nr			= 999;
	condition	= Info_FreemineOrc_EXIT_Condition;
	information	= Info_FreemineOrc_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
	
};                       

FUNC int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_FreemineOrc_EXIT_Info()
{
	if (!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))	
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_01"); //�Tengo que seguir el viaje!
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_02"); //�Forastero, vuelve!
	}                                                              
	else                                                           
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); //Gracias. Me marcho.
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_04"); //�Que el forastero tenga buen viaje!
	};
	AI_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
//	Info INTRO
//---------------------------------------------------------------------
instance Info_FreemineOrc_INTRO (C_INFO)
{
	npc				= FreemineOrc;
	condition		= Info_FreemineOrc_INTRO_Condition;
	information		= Info_FreemineOrc_INTRO_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output			(self, hero,"Info_FreemineOrc_INTRO_17_01"); //�Tarrok necesita ayuda! �Tarrok herido!
};

//---------------------------------------------------------------------
//	Info WASPASSIERT
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASPASSIERT (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASPASSIERT_Condition;
	information	= Info_FreemineOrc_WASPASSIERT_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� ha pasado aqu�?";
};                       

FUNC int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASPASSIERT_15_01"); //�Qu� ha ocurrido aqu�?
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok capturado por soldados azules. De repente, soldados rojos por todas partes.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //Soldados rojos matar todo.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok huir aqu�. Soldados rojos no venir aqu�. Soldados rojos temer a GACH LUG.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //Por favor, ayudar; Tarrok herido.
};

//---------------------------------------------------------------------
//	Info WASTUN
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASTUN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASTUN_Condition;
	information	= Info_FreemineOrc_WASTUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� puedo hacer por ti?";
};                       

FUNC int Info_FreemineOrc_WASTUN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASTUN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_01"); //�Qu� puedo hacer para ayudarte?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok necesitar medicina fuerte. Si no, Tarrok morir.
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_03"); //�Qu� clase de medicina?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUG envenenar a Tarrok. �Tarrok necesitar medicina!
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_05"); //Tarrok tiene medicina, pero Tarrok perder. �Tarrok no encuentra!
};

//---------------------------------------------------------------------
//	Info OFFER
//---------------------------------------------------------------------
instance Info_FreemineOrc_OFFER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_OFFER_Condition;
	information	= Info_FreemineOrc_OFFER_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Recuperar� tu medicina!";
};                       

FUNC int Info_FreemineOrc_OFFER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_OFFER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_OFFER_15_01"); //�Recuperar� tu medicina!
	AI_Output			(self, hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok muy d�bil. �Forastero deprisa o Tarrok muerto!
	AI_StopProcessInfos	(self);

	B_Story_FoundOrcSlave();
};

//---------------------------------------------------------------------
//	Info CRAWLER
//---------------------------------------------------------------------
instance Info_FreemineOrc_CRAWLER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_CRAWLER_Condition;
	information	= Info_FreemineOrc_CRAWLER_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� significa GACH LUG?";
};                       

FUNC int Info_FreemineOrc_CRAWLER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT)
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_01"); //�Qu� quiere decir GACH LUG?
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_02"); //Animales grandes; andan sobre muchas patas.
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_03"); //�GACH LUG peligrosos! �Comer orcos y humanos!
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_04"); //�Debes estar refiri�ndote a los reptadores que hay all� abajo!
};

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance Info_FreemineOrc_TONGUE (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TONGUE_Condition;
	information	= Info_FreemineOrc_TONGUE_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Hablas nuestro idioma?";
};                       

FUNC int Info_FreemineOrc_TONGUE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TONGUE_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TONGUE_15_01"); //�Hablas nuestro idioma?
	AI_Output			(self, hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok esclavo humanos, mucho tiempo. Tarrok escucha bien.
};

//---------------------------------------------------------------------
//	Info SEARCHPOTION - Medizin noch nicht gefunden
//---------------------------------------------------------------------
instance Info_FreemineOrc_SEARCHPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SEARCHPOTION_Condition;
	information	= Info_FreemineOrc_SEARCHPOTION_Info;
	important	= 0;	
	permanent	= 1;
	description	= "�No puedo encontrar la medicina!";
};                       

FUNC int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)	
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SearchPotion_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //�No puedo encontrar la medicina!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //�Forastero buscar m�s! �Medicina estar all�!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //�Tarrok escapa de GACH LUG! �Tarrok esconder cuando huir!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //�Forastero tambi�n buscar en nichos!
	 
	AI_StopProcessInfos	( self );
};
  
//---------------------------------------------------------------------
//	Info SUCHEULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_SUCHEULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SUCHEULUMULU_Condition;
	information	= Info_FreemineOrc_SUCHEULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Eres amigo de Ur-Shak, el cham�n?";
};                       

FUNC int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if	Npc_KnowsInfo(hero, Info_FreemineOrc_INTRO)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //�Eres amigo de Ur-Shak, el cham�n?
	AI_Output		(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak esclavo como Tarrok. �Ur-Shak escapar! �Irse hace muchos inviernos!
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //�Tu amigo dijo que podr�as hacerme un Ulu-Mulu!
	if (FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //�T� ayudarme, yo ayudarte!
	}
	else
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok muy d�bil. Sin medicina, Tarrok morir.
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //�Forastero traer medicina y Tarrok ayudarle!
	};
};

//---------------------------------------------------------------------
//	Info GIVEPOTION
//---------------------------------------------------------------------
instance Info_FreemineOrc_GIVEPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_GIVEPOTION_Condition;
	information	= Info_FreemineOrc_GIVEPOTION_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Ten, he encontrado tu medicina!";
};                       

FUNC int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)	
	&&  Npc_HasItems(hero,Orcmedicine)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_01"); //�Aqu� tienes, he encontrado tu medicina!

	B_GiveInvItems      (hero, self, Orcmedicine, 1); 	
	EquipItem			(self, Orcmedicine);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItemToState	(self, Orcmedicine, 1);
	AI_UseItemToState	(self, Orcmedicine, -1);

	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //�Forastero no malo como otros! �Forastero bueno!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //�Tarrok le debe gracias!
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_04"); //�Puedes darme un Ulu-Mulu ahora?
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //�Forastero ayudar a Tarrok, as� que Tarrok tambi�n ayudar forastero!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //Forastero necesitar KROTAHK, KHAZ-TAK, DWACHKARR y ORTH-ANTAK.
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //�Forastero traer y Tarrok hacer Ulu-Mulu!
	
	if	!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)
	{
		B_Story_FoundOrcSlave();
	};

	B_Story_CuredOrc	();
};


//---------------------------------------------------------------------
//	Info FIREWARAN
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN_Condition;
	information	= Info_FreemineOrc_FIREWARAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� es un KROTAHK?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN_Condition()
{
	if	(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN_15_01"); //�Qu� es un KROTAHK?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN_17_02"); //�Ser lengua de fuego! �Ser lagarto lengua de fuego!
	
};

//---------------------------------------------------------------------
//	Info FIREWARAN2
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN2_Condition;
	information	= Info_FreemineOrc_FIREWARAN2_Info;
	important	= 0;	
	permanent	= 0;
	description = "�D�nde puedo encontrar un lagarto de fuego?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN)
	&&	!Npc_HasItems (hero,ItAt_Waran_01)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN2_15_01"); //�D�nde puedo encontrar un lagarto de fuego?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //Lagarto de fuego vivir en casa. Casa de Tarrok. �Forastero tener que buscar!
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //Tambi�n encontrar lagarto de fuego en arena cerca de mar.

	B_LogEntry			(CH4_UluMulu,"Tarrok necesita la lengua de un lagarto de fuego para el Ulu-Mulu. �stos viven principalmente en la zona orca y en las playas arenosas. �No hab�a all� restos de un naufragio llenos de lagartos?");
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� significa KHAZ-TAK?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //�Qu� significa KHAZ-TAK?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //Ser cuerno de bestia de sombra. Cuerno afilado como cuchillo y duro como piedra.
	
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST2_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST2_Info;
	important	= 0;	
	permanent	= 0;
	description = "�D�nde puedo encontrar bestias de sombra?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if 	 Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST)
	&&	!Npc_HasItems (hero,ItAt_Shadow_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //�D�nde puedo encontrar bestias de sombra?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //Vivir en bosque o cueva. No gustar luz.
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //Ser muy peligrosa. �Forastero tener cuidado!

	B_LogEntry			(CH4_UluMulu,"Tarrok necesita el cuerno de una bestia de sombra para el Ulu-Mulu. �stas viven principalmente en bosques y cuevas. Hasta donde yo s�, el mayor bosque de la colonia se encuentra entre el Campamento Viejo y el del pantano.");
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK_Info;
	important	= 0;	
	permanent	= 0;
	description = "�DWACHKARR? �Qu� es eso?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //�DWACHKARR? �Qu� es eso?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //Ser diente de tibur�n de la ci�naga. Si diente morder, v�ctima no escapar.
	
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK2_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK2_Info;
	important	= 0;	
	permanent	= 0;
	description = "�D�nde puedo encontrar tiburones de la ci�naga?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK)
	&&	!Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //�D�nde puedo encontrar tiburones de la ci�naga?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Muchos tiburones de la ci�naga en campamento de humanos. �Campamento en pantano, claro!

	B_LogEntry			(CH4_UluMulu,"Tarrok necesita los dientes de un tibur�n de la ci�naga para el Ulu-Mulu. Hay montones de estas bestias tras el campamento de la Hermandad."); 
};

//---------------------------------------------------------------------
//	Info TROLL
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL_Condition;
	information	= Info_FreemineOrc_TROLL_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� es un ORTH-ANTAK?";
};                       

FUNC int Info_FreemineOrc_TROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL_15_01"); //�Qu� es un ORTH-ANTAK?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL_17_02"); //�Ser diente de troll grande! �Hacer gran agujero en presa!
};

//---------------------------------------------------------------------
//	Info TROLL2
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL2_Condition;
	information	= Info_FreemineOrc_TROLL2_Info;
	important	= 0;	
	permanent	= 0;
	description = "�D�nde puedo encontrar trolls?";
};                       

FUNC int Info_FreemineOrc_TROLL2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL)
	&&	!Npc_HasItems (hero,ItAt_Troll_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL2_15_01"); //�D�nde puedo encontrar trolls?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_02"); //�Troll vivir en monta�a! �A troll gustarle mucho espacio abierto!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_03"); //�Forastero buscar en monta�a del norte! �Pero cuidado con pu�o de troll!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_04"); //�Si pu�o alcanzarle, forastero caerse de monta�a!

	B_LogEntry			(CH4_UluMulu,"Tarrok necesita los colmillos de un troll para el Ulu-Mulu. Estos monstruos viven en las monta�as del norte de la colonia. Deber�a buscar en los barrancos de por all�.");
};

//---------------------------------------------------------------------
//	Info LOOKINGULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_LOOKINGULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information	= Info_FreemineOrc_LOOKINGULUMULU_Info;
	important	= 0;	
	permanent	= 1;
	description = "Todav�a no tengo los cuatro objetos.";
};                       

FUNC int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if	!Npc_HasItems(hero,ItAt_Waran_01)
	&&	Npc_HasItems (hero,ItAt_Shadow_02)
	&&	Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	Npc_HasItems (hero,ItAt_Troll_02)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output 			(hero, self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //Todav�a no tengo los cuatro objetos.
	AI_Output 			(self, hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //Forastero seguir buscando. �Tarrok esperar aqu�!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info EVERYULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_EVERYULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_EVERYULUMULU_Condition;
	information	= Info_FreemineOrc_EVERYULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Tengo los cuatro objetos para el Ulu-Mulu!";
};                       

FUNC int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_RUNNING)
	&&	 Npc_HasItems(hero,ItAt_Waran_01		)
	&&	 Npc_HasItems(hero,ItAt_Shadow_02		)
	&&	 Npc_HasItems(hero,ItAt_Swampshark_02	)
	&&	 Npc_HasItems(hero,ItAt_Troll_02		)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //�Tengo los cuatro objetos para el Ulu-Mulu!
	AI_Output			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //�Forastero ser gran guerrero! �Dar objetos! �Tarrok hacer ULU-MULU!
	AI_Output 			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //�Ya estar! �Forastero llevar ULU-MULU con orgullo! �Ahora, Tarrok irse a dormir!
    
    CreateInvItems      (hero,  ItAt_Waran_01, 3);
	B_GiveInvItems	    (hero, self, ItAt_Waran_01, 4); //Notwendig f�r Ausschrift "4 Gegenst�nde �bergegen", wird sofort ausgeglichen
	Npc_RemoveInvItem	(hero, ItAt_Shadow_02		);
	Npc_RemoveInvItem	(hero, ItAt_Swampshark_02	);
	Npc_RemoveInvItem	(hero, ItAt_Troll_02		);
	
	Npc_RemoveInvItems	(self, ItAt_Waran_01, 4);    
	 

	B_Story_GotUluMulu	();
	
	AI_StopProcessInfos	(self);
};





