// ************************************************************
// 							EXIT 
// ************************************************************
INSTANCE Info_BaalLukor_EXIT(C_INFO)
{
	npc				= GUR_1211_BaalLukor;
	nr				= 999;
	condition		= Info_BaalLukor_EXIT_Condition;
	information		= Info_BaalLukor_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BaalLukor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
INSTANCE Info_BaalLukor_MEET (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_MEET_Condition;
	information	= Info_BaalLukor_MEET_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_MEET_Info()
{
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Gracias por tu ayuda. Ciertamente, llegaste en el �ltimo momento.
	
	B_GiveXP		(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
INSTANCE Info_BaalLukor_DEAD (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DEAD_Condition;
	information	= Info_BaalLukor_DEAD_Info;
	nr			= 20;
	permanent	= 0;
	important 	= 0;
	description = "Viniendo para ac� me encontr� con algunos templarios muertos.";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //�He encontrado a unos templarios muertos en el camino! �Qu� es lo que ha ocurrido?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //El Maestro Cor Angar nos ha enviado a investigar las cuevas.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //No esperamos encontrar m�s que tumbas malolientes y momias medio descompuestas.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //De repente, la oscuridad se desvaneci� y hab�a orcos por todas partes. �No s� qu� es lo que andan buscando aqu�, pero su aparici�n es m�s que inusual!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //�D�nde est�n los otros templarios?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //�Muertos! Sin querer, les llev� a la muerte. Espero que el Durmiente me perdone.

	B_LogEntry		(CH3_OrcGraveyard,"Le he salvado la vida al Gur� Baal Lukor en el cementerio orco durante un ataque de esas feas criaturas. Todos sus templarios murieron combatiendo contra los orcos.");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
INSTANCE Info_BaalLukor_SUMMONING (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SUMMONING_Condition;
	information	= Info_BaalLukor_SUMMONING_Info;
	nr			= 10;
	permanent	= 0;
	important 	= 0;
	description = "�Me manda Cor Angar!";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //�Vengo de parte de Cor Angar! �Has encontrado alguna se�al del Durmiente?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Todav�a no. Pero �qu� hay de Y'Berion? �Ha recuperado ya la consciencia?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //No, sigue sin sentido.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Tenemos que resolver el acertijo de estas cuevas. Tras estas terribles p�rdidas, no puedo regresar a la comunidad con las manos vac�as.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Pero mis habilidades en el combate son limitadas y mis hechizos m�gicos no tienen el mismo efecto sobre los orcos que el que tienen sobre la gente cr�dula del Campamento Viejo.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Si es nuestra Hermandad quien te env�a, tal vez podr�as ayudarme a proseguir la investigaci�n de esta tumba.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
INSTANCE Info_BaalLukor_HELP (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HELP_Condition;
	information	= Info_BaalLukor_HELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Te ayudar�.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //S�, te ayudar�.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Bien. Espl�ndido. De esta sala parten tres t�neles. Deber�amos investigarlos todos.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //�Adelante, yo te sigo!

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor se ha unido a m�; juntos, �resolveremos el secreto de este viejo lugar!");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDNONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDNONE_Condition;
	information	= Info_BaalLukor_FOUNDNONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "�No puedo encontrar nada!";
};

FUNC INT Info_BaalLukor_FOUNDNONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 0)
	&&		!Npc_HasItems(hero, OrkParchmentOne)
	&&		!Npc_HasItems(hero, OrkParchmentTwo)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //�No puedo encontrar nada!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Necesitamos investigar los tres t�neles.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDONE_Condition;
	information	= Info_BaalLukor_FOUNDONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "�Al parecer no existe la otra mitad del pergamino!";
};

FUNC INT Info_BaalLukor_FOUNDONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(((BaalLukor_BringParchment==1) && !Npc_HasItems(hero, OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero, OrkParchmentOne)))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //�Parece ser que falta la otra mitad del pergamino!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Tiene que estar en alguna parte. �Deber�amos investigar todos los t�neles!
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTWAIT_Condition;
	information	= Info_BaalLukor_FIRSTWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_040")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //�No podemos entrar ah�! Puede que en estos nichos haya alguna pista.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTSCROLL_Condition;
	information	= Info_BaalLukor_FIRSTSCROLL_Info;
	permanent	= 0;
	important 	= 0;
	description = "�He encontrado un fragmento de pergamino!";
};

FUNC INT Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentOne)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //�He encontrado un trozo de pergamino!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 �bergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //�Estupendo! �Es la otra mitad del pergamino del conjuro orco!
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Parece ser un pergamino de conjuro orco, pero ha sido cortado en dos.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Debe haber otra mitad por alguna parte.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 1;
	};
	
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDWAIT_Condition;
	information	= Info_BaalLukor_SECONDWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_SECONDWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_047")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hum. �Este t�nel lleva a un callej�n sin salida! Tal vez puedas encontrar alguna pista que nos resulte de ayuda.

	if (!Npc_HasItems	(hero, OrkParchmentTwo)	) 
	{	
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine	(self, "WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDSCROLL_Condition;
	information	= Info_BaalLukor_SECONDSCROLL_Info;
	permanent	= 0;
	description = "�Aqu� hay un pedazo desgarrado de pergamino!";
};

FUNC INT Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentTwo)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self,	hero);

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //�Aqu� hay un trozo de pergamino!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 �bergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //�Magn�fico! Es la otra mitad del pergamino del conjuro orco.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Parece ser un pergamino de conjuro orco, pero ha sido cortado en dos.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Debe haber otra mitad por alguna parte.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
INSTANCE Info_BaalLukor_BOTHSCROLLS (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_BOTHSCROLLS_Condition;
	information	= Info_BaalLukor_BOTHSCROLLS_Info;
	permanent	= 0;
	important 	= 0;
	description = "�Y ahora qu� hacemos con los dos fragmentos?";
};

FUNC INT Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 3)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //�Qu� hacemos ahora con los dos trozos?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Las dos mitades encajan. Pero no s� lo que quieren decir estos s�mbolos orcos.

	B_LogEntry		(CH3_OrcGraveyard,"Hemos encontrado dos mitades de un pergamino con un conjuro orco, pero Baal Lukor no puede traducirlo. Seguiremos buscando.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
INSTANCE Info_BaalLukor_RUNES (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_RUNES_Condition;
	information	= Info_BaalLukor_RUNES_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_RUNES_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_BOTHSCROLLS)
	&&		((Npc_GetDistToWP	(hero, "GRYD_025")<600)	|| (Npc_GetDistToWP(hero, "GRYD_048")<600))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_RUNES_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //�Espera un momento! Qu� interesante.
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Bueno, no puedo encontrar nada interesante en este lugar.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Guarda silencio y observa las runas ornamentales que hay en esta cueva.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //S�, esto deber�a ser suficiente para poder traducir las dos mitades del pergamino.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //�Ya lo tengo! Es un conjuro de teletransporte que s�lo funciona en un lugar determinado.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //�Qu� extra�o!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-�bergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"Baal Lukor ha podido traducir el pergamino con la ayuda de las inscripciones de la pared de uno de los pasillos. Parece tratarse de un conjuro para teleportarse a muy corta distancia."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
INSTANCE Info_BaalLukor_WHATNOW (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_WHATNOW_Condition;
	information	= Info_BaalLukor_WHATNOW_Info;
	permanent	= 1;
	important 	= 0;
	description = "�Qu� lugar concreto es �se?";
};

FUNC INT Info_BaalLukor_WHATNOW_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_RUNES)
	&&		Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITHOUT)
	&&		!Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITH)		)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_WHATNOW_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //�Qu� lugar concreto es �se?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //La gran sala que atravesamos hace un rato parec�a ser un lugar muy... extra�o. �Volvamos all�!

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};


//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITHOUT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITHOUT_Condition;
	information	= Info_BaalLukor_HALLWITHOUT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITHOUT_Condition()
{
	if (	!Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		(Npc_GetDistToWP(hero, "GRYD_055")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop		(hero);
	AI_SetWalkmode	(self,	NPC_WALK);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Este lugar... No puedo explicarlo, pero este lugar...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Oh, olv�dalo. Debo haberlo imaginado.

	B_LogEntry	(CH3_OrcGraveyard,"Al entrar en el enorme y rectangular sal�n de las columnas, el Gur� ha sentido algo. Sin embargo, no sabe qu� era a ciencia cierta.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITH (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITH_Condition;
	information	= Info_BaalLukor_HALLWITH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITH_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		Npc_GetDistToWP	(hero, "GRYD_055")<500			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //Este lugar tiene un aura especial... el aura de lo oculto.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Esta sala me recuerda a la imagen de la visi�n.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //La visi�n... Estamos muy cerca de nuestro objetivo.

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor ha sido guiado por un poder invisible, y ha avanzado directamente a una de las paredes del gran sal�n de las columnas.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
INSTANCE Info_BaalLukor_DOOR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DOOR_Condition;
	information	= Info_BaalLukor_DOOR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_DOOR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HALLWITH)
	&&		Npc_GetDistToWP	(hero, "GRYD_060")<500				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_DOOR_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Tras esta pared... �tiene que ser aqu�!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Mis poderes m�gicos todav�a est�n muy d�biles.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Utiliza el conjuro orco de teletransporte aqu�, frente a esta pared.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport �bergeben
	
	AI_StopProcessInfos	(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
INSTANCE Info_BaalLukor_TELEPORT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_TELEPORT_Condition;
	information	= Info_BaalLukor_TELEPORT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_TELEPORT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_DOOR)
	&&		Npc_CanSeeNpcFreeLOS(self,	hero)	
	&&		Npc_GetDistToWP	(hero, "GRYD_072")<550				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Has encontrado el lugar escondido. Mis instintos no me han enga�ado.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //�Y es aqu� donde se encuentra la respuesta a la extra�a invocaci�n del Durmiente?
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //A m� me parece que no es m�s que otra c�mara funeraria.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Tenemos que seguir adelante.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //�Adelante, yo te sigo!

	B_LogEntry		(CH3_OrcGraveyard,"Con la ayuda del conjuro orco de teletransporte, he descubierto un t�nel secreto que parte del gran sal�n de las columnas.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
INSTANCE Info_BaalLukor_ALTAR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_ALTAR_Condition;
	information	= Info_BaalLukor_ALTAR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_ALTAR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_TELEPORT)
	&&		Npc_GetDistToWP	(hero, "GRYD_082")<400
	&&		Npc_CanSeeNpcFreeLOS(self,hero)						)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_ALTAR_Info()
{
	B_FullStop			(hero);
	AI_GotoWP			(hero, "GRYD_081");
	AI_AlignToWP		(hero);

	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //�NO! �No puede ser cierto! Aqu� no ha m�s que... polvo y... y huesos.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //�NO!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //�H�BLEME, MAESTRO!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //�MU�STRATE, DURMIENTE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //�NOOOOOOOOO!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //Ya est�. �Ha perdido completamente la chaveta!

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //Todo esto es culpa tuya. �Tu imp�a presencia ha enfurecido al todopoderoso Durmiente!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //�Ahora tendr� que sufrir a causa de tu comportamiento sacr�lego!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Tengo que sacrificar algo al maestro. �UN SACRIFICIO HUMANO!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Entonces seguro que me iluminar� y me har� su sirviente.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //�MUERE, INFIEL!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //�AAAAAAAAAHHHHHHHH!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor se ha vuelto loco en cuanto ha comprendido que aqu� abajo no hay ABSOLUTAMENTE NADA. Al final, incluso me ha atacado llevado por su furia. Seguro que Cor Angar se entristecer� cuando oiga esta historia.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





