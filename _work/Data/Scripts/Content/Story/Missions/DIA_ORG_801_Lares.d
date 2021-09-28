// ****************************** 
//				EXIT 
// ******************************

INSTANCE   ORG_801_Lares_Exit (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 999;
	condition	= ORG_801_Lares_Exit_Condition;
	information	= ORG_801_Lares_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  ORG_801_Lares_Exit_Condition()
{
	return 1;
};

FUNC VOID  ORG_801_Lares_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************** 
//			Wie hier rein?
// ******************************
	var int Lares_vorbeigemogelt;
// ******************************

INSTANCE ORG_801_Lares_YouHere (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 1;
	condition	= ORG_801_Lares_YouHere_Condition;
	information	= ORG_801_Lares_YouHere_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC int ORG_801_Lares_YouHere_Condition()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ( (Roscoe.aivar[AIV_PASSGATE]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_YouHere_Info()
{
	var C_NPC Roscoe; Roscoe = Hlp_GetNpc(Org_840_Roscoe);
	if ( (Npc_IsInState(Roscoe, ZS_MagicSleep)) || (Npc_GetTempAttitude(Roscoe,other)==ATT_FRIENDLY) )
	{
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_00"); //¿Cómo has entrado aquí? ¿Qué le pasa a Roscoe?
		AI_Output	(other, self,"ORG_801_Lares_YouHere_15_01"); //No tuvo ganas de detenerme.
		AI_Output	(self, other,"ORG_801_Lares_YouHere_11_02"); //¿Qué es lo que quieres?
		Roscoe.aivar[AIV_PASSGATE] = TRUE;
		Lares_vorbeigemogelt = TRUE;
		B_GiveXP	(XP_CheatedIntoLaresHut);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	};
};

// ****************************** 
//			Wanna Join
// ******************************

INSTANCE ORG_801_Lares_WannaJoin (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 1;
	condition	= ORG_801_Lares_WannaJoin_Condition;
	information	= ORG_801_Lares_WannaJoin_Info;
	permanent	= 0;
	description = "Quiero unirme a tu banda.";
};                       

FUNC int ORG_801_Lares_WannaJoin_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_WannaJoin_Info()
{
	AI_Output (other, self,"ORG_801_Lares_WannaJoin_15_00"); //Quiero unirme a tu banda.
	AI_Output (self, other,"ORG_801_Lares_WannaJoin_11_01"); //¿Ah, sí? ¿Tienes algo que mostrarme?
};

// ****************************** 
//			Bring List
// ******************************
	var int Lares_BringListBack;
// ******************************

INSTANCE   ORG_801_Lares_BringList (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringList_Condition;
	information	= ORG_801_Lares_BringList_Info;
	permanent	= 0;
	description = "Tengo la lista de lo que hace falta en la Vieja Mina.";
};                       

FUNC int ORG_801_Lares_BringList_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Npc_HasItems(hero,TheList)) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringList_Info()
{
	AI_Output (other, self,"ORG_801_Lares_BringList_15_00"); //Llevo encima la lista de las cosas que hacen falta en la Vieja Mina.
	AI_Output (self, other,"ORG_801_Lares_BringList_11_01"); //¡No! ¡No puedo creerlo! Tengo que confesar que tienes muchas agallas.
	AI_Output (self, other,"ORG_801_Lares_BringList_11_02"); //¡Muéstramela!
	AI_Output (other, self,"ORG_801_Lares_BringList_15_03"); //Aquí la tienes.
	B_UseFakeScroll();
	AI_Output (self, other,"ORG_801_Lares_BringList_11_04"); //¡En efecto! ¿Sabes lo que vamos a hacer con ella? ¡Vamos a añadirle cosas y llevarás la lista de vuelta al Campamento Viejo!
	AI_Output (self, other,"ORG_801_Lares_BringList_11_05"); //¡Entonces, cuando entreguen el material a la mina, les asaltaremos y nos lo llevaremos todo! No tardaremos ni un minuto... ¡Ja! Aquí tienes la lista. Ya sabes lo que tienes que hacer.
	//AI_Output (self, other,"ORG_801_Lares_BringList_11_06"); //Das haben wir gleich ... So! Hier ist die Liste. Du weißt, was du zu tun hast.
	
	Points_NC = Points_NC + 10;
	
	Lares_BringListBack = LOG_RUNNING;
	Npc_RemoveInvItem		(hero,	TheList);
	CreateInvItem			(hero,	TheListNC);
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Lares, el líder de los bandidos, se ha mostrado muy sorprendido al ver la lista de cosas que hacían falta. La ha ampliado y ahora tengo que llevársela a Diego.");		
	B_GiveXP				(XP_GiveListToLares);	
};

// ****************************** 
//		List an Diego!
// ******************************

INSTANCE ORG_801_Lares_BringListBack (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringListBack_Condition;
	information	= ORG_801_Lares_BringListBack_Info;
	permanent	= 0;
	description = "Le he dado la lista a Diego.";
};                       

FUNC int ORG_801_Lares_BringListBack_Condition()
{
	if ( (Lares_BringListBack==LOG_RUNNING) && (Diego_BringList==LOG_SUCCESS) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringListBack_Info()
{
	AI_Output			(other, self,"ORG_801_Lares_BringListBack_15_00"); //Le he entregado la lista a Diego.
	AI_Output			(self, other,"ORG_801_Lares_BringListBack_11_01"); //¡Espléndido! He colocado a algunos hombres en el sendero a la Vieja Mina. Los guardias de Thorus yacen muertos en el bosque.
		
	Points_NC = Points_NC + 10;
	Lares_BringListBack = LOG_SUCCESS;

	B_LogEntry			(CH1_JoinNC,"Lares ya ha asaltado la caravana del Campamento Viejo. Al parecer, no quería esperar hasta que yo volviera... si volvía.");		

	B_GiveXP			(XP_ReportListDeliveryToLares);
};

// ****************************** 
//		Anteil wegen BringList
// ******************************

INSTANCE   ORG_801_Lares_BringListAnteil (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_BringListAnteil_Condition;
	information	= ORG_801_Lares_BringListAnteil_Info;
	permanent	= 0;
	description = "¿Ya han asaltado la caravana? ¿Dónde está mi parte?";
};                       

FUNC int ORG_801_Lares_BringListAnteil_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack)) )
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_BringListAnteil_Info()
{
	AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_00"); //¿Ya han asaltado la caravana? ¿Dónde está mi parte?
	AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_01"); //Vete a ver a Gorn. Él te dará algo.
	var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	if (gorn.aivar[AIV_FINDABLE]==TRUE)
	{
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_02"); //Ya conozco a Gorn. No es miembro de la banda. Es un mercenario que trabaja para los magos.
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_03"); //Exacto.
		AI_Output (other, self,"ORG_801_Lares_BringListAnteil_15_04"); //¿Estaba él involucrado en este asunto?
		AI_Output (self, other,"ORG_801_Lares_BringListAnteil_11_05"); //Saber demasiado no es bueno para ti. Limítate a ir a verle y a recoger tu parte.
	};
	B_LogEntry(CH1_JoinNC,"Gorn, el mercenario, participó en el asalto a la caravana de manera misteriosa. Será él quien me dé mi parte.");
	gorn.aivar[AIV_FINDABLE]==TRUE;
};

// ****************************** 
//		Mordrag schickt mich
// ******************************

INSTANCE ORG_801_Lares_MordragSentMe (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_MordragSentMe_Condition;
	information	= ORG_801_Lares_MordragSentMe_Info;
	permanent	= 0;
	description = "Me manda Mordrag. Me dio un anillo para ti.";
};                       

FUNC int ORG_801_Lares_MordragSentMe_Condition()
{
	if 	Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)
	&&	Npc_HasItems(hero,MordragsRing)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID ORG_801_Lares_MordragSentMe_Info()
{
    B_GiveInvItems (other,self, MordragsRing, 1);
    
	AI_Output (other, self,"ORG_801_Lares_MordragSentMe_15_00"); //Vengo de parte de Mordrag. Me ha dado un anillo para ti.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_01"); //¡Una pieza magnífica! Aquí forma parte de los trámites el compartir tu botín con el líder de tu banda.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_02"); //Pero el hecho de que te diera el anillo a TI demuestra que te tiene en alta estima.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_03"); //Quiero que vayas a verle y le digas una cosa de mi parte.
	AI_Output (self, other,"ORG_801_Lares_MordragSentMe_11_04"); //Dile que quiero que infiltre a alguien en el Campamento de la Secta. La Hermandad está tramando algo gordo; quiero saber qué es lo que está ocurriendo allí exactamente.
	
	Lares_InformMordrag = LOG_RUNNING;
		
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Lares me ha enviado ante Mordrag. Quiere que le diga que se enviará un espía al Campamento de la Secta para averiguar qué está planeando la Hermandad.");	
	B_GiveXP				(XP_GiveRingToLares);	
		
	Points_NC = Points_NC + 10;
};

// ****************************** 
//		Immerhin vorbeigemogelt
// ******************************

INSTANCE   ORG_801_Lares_Vorbeigemogelt (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_Vorbeigemogelt_Condition;
	information	= ORG_801_Lares_Vorbeigemogelt_Info;
	permanent	= 0;
	description = "Conseguí pasar entre tus guardias.";
};                       

FUNC int  ORG_801_Lares_Vorbeigemogelt_Condition()
{
	if ( (Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin)) && (Lares_vorbeigemogelt == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_Vorbeigemogelt_Info()
{
	AI_Output (other, self,"ORG_801_Lares_Vorbeigemogelt_15_00"); //Conseguí superar a tus guardias.
	AI_Output (self, other,"ORG_801_Lares_Vorbeigemogelt_11_01"); //Es cierto. Pero no basta con eso.
		
	Points_NC = Points_NC + 10;
};

// ****************************** 
//		Baal Isidro - Get Kraut
// ******************************
	var int Lares_Get400Ore;
// ******************************

INSTANCE   ORG_801_Lares_GetKraut (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 10;
	condition	= ORG_801_Lares_GetKraut_Condition;
	information	= ORG_801_Lares_GetKraut_Info;
	permanent	= 0;
	description = "¿Qué más puedo hacer?";
};                       

FUNC int  ORG_801_Lares_GetKraut_Condition()
{
	if	(Npc_KnowsInfo(hero,ORG_801_Lares_BringList) || Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_Vorbeigemogelt) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_GetKraut_Info()
{
	AI_Output (other, self,"ORG_801_Lares_GetKraut_15_00"); //¿Qué más puedo hacer?
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_01"); //Baal Isidro del Campamento de la Secta tiene hierba por valor de 400 pepitas como mínimo. Quiero que la consigas. No me importa cómo lo hagas.
	
	if ( (BaalIsidro_DealerJob==LOG_RUNNING) || (BaalIsidro_DealerJob==LOG_SUCCESS) )
	{
		AI_Output (other, self,"ORG_801_Lares_GetKraut_15_02"); //Si te refieres al montón enorme de hierba, ya la tengo en mi poder.
		AI_Output (self, other,"ORG_801_Lares_GetKraut_11_03"); //¡Parece que has sido muy listo!
	};
	
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_04"); //Si tienes la hierba, véndela. Tráeme las 400 pepitas.
	AI_Output (self, other,"ORG_801_Lares_GetKraut_11_05"); //Entonces volveremos a hablar acerca de tu admisión en la banda.
	Lares_Get400Ore = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Me han dicho que consiga la hierba de Baal Isidro y la venda por 400 pepitas. Lares quiere obtener el beneficio.");	
};

// ****************************** 
//			400 Ore
// ******************************

INSTANCE   ORG_801_Lares_400Ore (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 2;
	condition	= ORG_801_Lares_400Ore_Condition;
	information	= ORG_801_Lares_400Ore_Info;
	permanent	= 1;
	description = "Tengo las 400 pepitas de mineral.";
};                       

FUNC int  ORG_801_Lares_400Ore_Condition()
{
	if ( (Lares_Get400Ore == LOG_RUNNING) && ((BaalIsidro_DealerJob==LOG_RUNNING)||(BaalIsidro_DealerJob==LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_400Ore_Info()
{
	AI_Output			(other, self,"ORG_801_Lares_400Ore_15_00"); //Ya tengo las 400 pepitas.
	if (Npc_HasItems(other,itminugget)>=400)
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_11_01"); //¡Bien! Muy bien. Creo que con eso debería bastar.
		Lares_Get400Ore = LOG_SUCCESS;
		Points_NC = Points_NC + 10;
		
		B_GiveInvItems	(other, self, ItMiNugget, 400);
	    B_LogEntry		(CH1_JoinNC,"Lares se ha mostrado claramente satisfecho cuando le he dado las 400 pepitas que he obtenido de la venta de la hierba de Baal Isidro.");	
		B_GiveXP		(XP_BaalIsidroPayLares);	
	}
	else
	{
		AI_Output		(self, other,"ORG_801_Lares_400Ore_NOORE_11_00"); //Cuéntalas otra vez. Espero que no te hayas gastado la mitad en alcohol.
	};
};

// ****************************** 
//		Reicht das jetzt???
// ******************************

INSTANCE   ORG_801_Lares_Reicht (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 5;
	condition	= ORG_801_Lares_Reicht_Condition;
	information	= ORG_801_Lares_Reicht_Info;
	permanent	= 1;
	description = "¿Es suficiente para que me una a vosotros?";
};                       

FUNC int  ORG_801_Lares_Reicht_Condition()
{
	if ( Npc_KnowsInfo(hero,ORG_801_Lares_WannaJoin) 
	&& ( Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) || Npc_KnowsInfo(hero,ORG_801_Lares_BringList) )
	&& (Npc_GetTrueGuild(other)==GIL_NONE) && (Kapitel <2) )
	
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_Reicht_Info()
{
	AI_Output (other, self,"ORG_801_Lares_Reicht_15_00"); //¿Es suficiente para unirme a vosotros?
	
	if ( (Points_NC >= 30) && (hero.level >= 5) )
	{
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_00"); //¡Vaya que sí!
		AI_Output (self, other,"ORG_801_Lares_Reicht_AUFNAHME_11_01"); //Incluso tengo un regalo para ti. Una armadura mejor. No es gran cosa, pero te la has ganado.
	
		hero.guild = GIL_ORG;
		Npc_SetTrueGuild	(hero,GIL_ORG );
		CreateInvItem		(hero,ORG_ARMOR_L);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
		B_GiveXP			(XP_BecomeBandit);	

		B_LogEntry			(CH1_JoinNC,"Lares me ha convertido en miembro de su banda. ¡Ahora el Campamento Nuevo es mi hogar!");
		Log_SetTopicStatus	(CH1_JoinNC,	LOG_SUCCESS);

		// Canceln der anderen Aufnahmen
		Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Un miembro de la banda de Lares no puede unirse al Campamento Viejo. ¡Es imposible!");
		
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
		B_LogEntry			(CH1_JoinPsi,"La Hermandad tendrá que valerse sin mí, pues el Campamento Nuevo es mi hogar de ahora en adelante.");
		
		Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
		Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
	}
	else
	{
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_MordragSentMe))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_02"); //Mordrag ha hablado en tu favor.
		};
		if (Npc_KnowsInfo(Hero, ORG_801_Lares_BringList))
		{
			AI_Output (self, other,"ORG_801_Lares_Reicht_11_03"); //Te has hecho muy popular desde que trajiste la lista.
		};
		AI_Output (self, other,"ORG_801_Lares_Reicht_11_04"); //Pero todavía no estás preparado. Cumple tus tareas.
		
		B_PrintGuildCondition(5);
	};
};

// ****************************** 
//			Goto Kalom
// ******************************

INSTANCE   ORG_801_Lares_GotoKalom (C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 10;
	condition	= ORG_801_Lares_GotoKalom_Condition;
	information	= ORG_801_Lares_GotoKalom_Info;
	permanent	= 0;
	description = "¿Y qué se supone que debo hacer ahora?";
};                       

FUNC int  ORG_801_Lares_GotoKalom_Condition()
{
	if ( Npc_GetTrueGuild(other)==GIL_ORG )
	{
		return 1;
	};
};

FUNC VOID  ORG_801_Lares_GotoKalom_Info()
{
	AI_Output (other, self,"ORG_801_Lares_GotoKalom_15_00"); //¿Y qué se supone que debo hacer ahora?
	AI_Output (self, other,"ORG_801_Lares_GotoKalom_11_01"); //Ahora eres un miembro de nuestra banda. Eres libre de hacer lo que quieras.
		
	Log_CreateTopic		(CH1_GotoPsiCamp,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_RUNNING);
	B_LogEntry			(CH1_GotoPsiCamp,"La Hermandad del campamento del pantano está planeando algo grande. Lares, el líder de los bandidos, quiere saber de qué se trata.");

	if	(Lares_InformMordrag == LOG_RUNNING)
	{	
		AI_Output 		(self, other,"ORG_801_Lares_GotoKalom_11_02"); //Si quieres ser útil, ve a ver a Mordrag y échale una mano con el asunto de la secta.
		B_LogEntry		(CH1_GotoPsiCamp,"¡Tengo que ayudar a Mordrag a averiguar qué está pasando allí!");
	}
	else
	{
		var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
		if (Npc_IsDead(Mordrag))
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_03"); //Mordrag, uno de los nuestros en el Campamento Viejo, ha muerto. Antes de morir, nos envió un mensaje. En él decía que se preparaba algo gordo en el Campamento de la Secta.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_04"); //Vete al campamento de la Hermandad y averigua qué es lo que está ocurriendo.
			B_LogEntry	(CH1_GotoPsiCamp,"Me ha enviado directamente al campamento de la Hermandad.");
		}
		else
		{
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_05"); //Mordrag, uno de los nuestros en el Campamento Viejo, está de vuelta.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_06"); //Vete a verle. Dile que quiero que infiltre a alguien en el Campamento de la Secta. La Hermandad está tramando algo gordo; quiero saber qué es lo que está ocurriendo allí exactamente.
			AI_Output	(self, other,"ORG_801_Lares_GotoKalom_11_07"); //Échale una mano.
			B_LogEntry	(CH1_GotoPsiCamp,"Se supone que un bandido llamado Mordrag debe ocuparse del asunto; puedo encontrarlo en la taberna del lago del Campamento Nuevo.");
			
			B_ExchangeRoutine(Org_826_Mordrag,"START");
			Lares_InformMordrag = LOG_RUNNING;
		};
	};
};



// ****************************** 
//			Wo lernen?
// ******************************

instance  ORG_801_Lares_WhereLearn (C_INFO)
{
	npc				= ORG_801_Lares;
	nr				= 20;
	condition		= ORG_801_Lares_WhereLearn_Condition;
	information		= ORG_801_Lares_WhereLearn_Info;
	permanent		= 0;
	description		= "¿Dónde puedo aprender algo?"; 
};

FUNC int  ORG_801_Lares_WhereLearn_Condition()
{
	return TRUE;
};

FUNC void  ORG_801_Lares_WhereLearn_Info()
{
	AI_Output 		(other, self,"ORG_801_Lares_WhereLearn_Info_15_01"); //¿Dónde puedo averiguar algo?
	AI_Output 		(self, other,"ORG_801_Lares_WhereLearn_Info_11_02"); //Conmigo. Puedo ayudarte a mejorar tu fuerza y tu habilidad.
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Lares puede enseñarme a mejorar tanto mi HABILIDAD como mi FUERZA.");

};  
// ******************************
// 		STR + DEX LERNEN
// ******************************
INSTANCE ORG_801_Lares_Teach(C_INFO)
{
	npc			= ORG_801_Lares;
	nr			= 20;
	condition	= ORG_801_Lares_Teach_Condition;
	information	= ORG_801_Lares_Teach_Info;
	permanent	= 1;
	description = "Quiero mejorar.";
};                       

FUNC INT ORG_801_Lares_Teach_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_801_Lares_WhereLearn))
	{
		return TRUE;
	};
};
FUNC VOID ORG_801_Lares_Teach_Info()
{
	AI_Output(other,self,"ORG_801_Lares_Teach_15_00"); //Quiero mejorarme a mí mismo.
	
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_BACK()
{
	Info_ClearChoices	(ORG_801_Lares_Teach);
};

func void ORG_801_Lares_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};

func void ORG_801_Lares_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_801_Lares_Teach);
	Info_AddChoice		(ORG_801_Lares_Teach,DIALOG_BACK									,ORG_801_Lares_Teach_BACK);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,ORG_801_Lares_Teach_STR_1);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_5);
	Info_AddChoice		(ORG_801_Lares_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_801_Lares_Teach_DEX_1);
};
