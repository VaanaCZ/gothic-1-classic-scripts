// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Eres del Campamento de la Secta, ¿no?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Tú perteneces al Campamento de la Secta, ¿verdad?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Nosotros lo llamamos la Hermandad.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Soy Baal Kagan. Que el Durmiente sea contigo.
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "¿Qué estás haciendo aquí?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //¿Qué estás haciendo aquí?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //En un principio, me enviaron aquí para convencer a la gente de que se uniera a nuestra Hermandad.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Pero estos bárbaros no están interesados en la iluminación espiritual. Así que me veo reducido a vender hierba del pantano.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Y aquí esa es una ocupación muy extendida. Demasiado extendida. Apenas puedo proporcionar toda la que quieren.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan vende tallos de hierba a los bandidos y mercenarios del Campamento Nuevo.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Muéstrame tus mercancías.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Muéstrame tu mercancía.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Como desees.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "¿Por qué no envían a un hombre más?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //¿Por qué no envían a otro hombre aquí?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Se suponía que Baal Isidro debía ayudarme, pero se pasa todo el día en la taberna del lago y cambia su hierba por aguardiente de arroz.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Es un adicto al alcohol. Me temo que no puedo esperar ninguna ayuda de él.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro se pasa todo el día sentado en la taberna del lago y bebiendo.");	
	};
};

// ************************************************************
// 					Ich könnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Podría ayudarte a vender tu hierba a la gente.";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Yo podría ayudarte a vender tu hierba a la gente.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Sólo puedo confiarle tal cantidad de hierba a miembros de la Hermandad.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Pero podrías ayudarme a entregar regalos.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //No todo el mundo ha probado mi mercancía aún. En cuanto prueben la hierba querrán más, de modo que también podré vender una mayor cantidad.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Creía que apenas dabas abasto.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Pronto me ocuparé de Baal Isidro. Ya le he enviado un mensaje a Cor Kalorn.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "¿Qué saco si reparto la hierba para ti?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //¿Qué sacaré yo en limpio si entrego la hierba en tu lugar?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Puedo recompensarte de varias maneras.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Puedo darte pergaminos de conjuro mágicos, portadores de la poderosa magia del Durmiente.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //O puedo ayudarte a unirte a nuestra comunidad, si eso es lo que deseas. Tengo muy buenos contactos con Cor Kalorn y Baal Tyron.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Ambos son muy cercanos a Y'Berion, nuestro maestro.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //También puedo pagarte simplemente con mineral, si así lo prefieres. 100 pepitas serían suficiente como pago por tus esfuerzos.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "De acuerdo, dame la hierba. ¿A quién quieres que se la dé?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //De acuerdo, dame la hierba. ¿A quién quieres que se la dé?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Seguro que encontrarás a alguien que la acepte. Habla con la gente. Pero no des más que UN tallo a cada persona.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //Una cosa más. Si permites que alguien te arrebate la hierba o si te la fumas tú mismo, nuestro acuerdo dejará de tener validez.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Claro.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"El novicio Baal Kagan me ha dado 10 tallos de hierba de Novicio verde, que debo repartir en el Campamento Nuevo.");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "He repartido la hierba.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Ya he repartido la hierba.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Ya se han pasado a verme los primeros clientes nuevos. Has hecho un buen trabajo.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //¿Qué quieres como recompensa?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Me quedaré con el mineral.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Ayúdame a unirme a la Hermandad.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Estos pergaminos son muy interesantes. ¿Qué clase de conjuros son?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan tiene nuevos clientes y yo he recibido mi recompensa.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Todavía no he visto ningún cliente nuevo. Reparte un poco más.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Estos pergaminos de conjuro son muy interesantes; ¿de qué clase de sortilegios se trata?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Puño del viento, Hechizar, Telequinesia, Piroquinesia y Dormir. Puedes escoger tres de estos conjuros.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Me quedaré con los tres pergaminos de conjuros.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Ayúdame a ingresar en la Hermandad.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Tu petición es modesta. Te ayudaré, así que escúchame. Baal Tyon es uno de los Gurús inferiores, como yo.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion le ha nombrado consejero suyo. Eso no le ha hecho ningún bien.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Ahora se cree tan importante que no habla más que con sus discípulos.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Si le entregas esto, eso le soltará la lengua.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Baal Kagan me ha dado una LLAMADA ONÍRICA especial para Baal Tyon. Eso me ayudará a unirme a la Hermandad de la secta.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Quiero las 100 pepitas.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //De acuerdo. Aquí las tienes.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Quiero los pergaminos de conjuro.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Una excelente decisión. Escoge tres.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Puño del viento.",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Telequinesia.",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Piroquinesia.",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Dormir",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Hechizar",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con ése hacen tres. Utilízalos sabiamente.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con ése hacen tres. Utilízalos sabiamente.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con ése hacen tres. Utilízalos sabiamente.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con ése hacen tres. Utilízalos sabiamente.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con ése hacen tres. Utilízalos sabiamente.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




