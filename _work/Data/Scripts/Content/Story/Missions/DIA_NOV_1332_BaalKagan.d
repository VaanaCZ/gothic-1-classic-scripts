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
	description = "Eres del Campamento de la Secta, �no?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //T� perteneces al Campamento de la Secta, �verdad?
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
	description = "�Qu� est�s haciendo aqu�?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //En un principio, me enviaron aqu� para convencer a la gente de que se uniera a nuestra Hermandad.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Pero estos b�rbaros no est�n interesados en la iluminaci�n espiritual. As� que me veo reducido a vender hierba del pantano.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Y aqu� esa es una ocupaci�n muy extendida. Demasiado extendida. Apenas puedo proporcionar toda la que quieren.

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
	description = "Mu�strame tus mercanc�as.";
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
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Mu�strame tu mercanc�a.
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
	description = "�Por qu� no env�an a un hombre m�s?";
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
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //�Por qu� no env�an a otro hombre aqu�?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Se supon�a que Baal Isidro deb�a ayudarme, pero se pasa todo el d�a en la taberna del lago y cambia su hierba por aguardiente de arroz.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Es un adicto al alcohol. Me temo que no puedo esperar ninguna ayuda de �l.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro se pasa todo el d�a sentado en la taberna del lago y bebiendo.");	
	};
};

// ************************************************************
// 					Ich k�nnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Podr�a ayudarte a vender tu hierba a la gente.";
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
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Yo podr�a ayudarte a vender tu hierba a la gente.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //S�lo puedo confiarle tal cantidad de hierba a miembros de la Hermandad.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Pero podr�as ayudarme a entregar regalos.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //No todo el mundo ha probado mi mercanc�a a�n. En cuanto prueben la hierba querr�n m�s, de modo que tambi�n podr� vender una mayor cantidad.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Cre�a que apenas dabas abasto.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Pronto me ocupar� de Baal Isidro. Ya le he enviado un mensaje a Cor Kalorn.
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
	description = "�Qu� saco si reparto la hierba para ti?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //�Qu� sacar� yo en limpio si entrego la hierba en tu lugar?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Puedo recompensarte de varias maneras.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Puedo darte pergaminos de conjuro m�gicos, portadores de la poderosa magia del Durmiente.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //O puedo ayudarte a unirte a nuestra comunidad, si eso es lo que deseas. Tengo muy buenos contactos con Cor Kalorn y Baal Tyron.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Ambos son muy cercanos a Y'Berion, nuestro maestro.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Tambi�n puedo pagarte simplemente con mineral, si as� lo prefieres. 100 pepitas ser�an suficiente como pago por tus esfuerzos.
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
	description = "De acuerdo, dame la hierba. �A qui�n quieres que se la d�?";
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
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //De acuerdo, dame la hierba. �A qui�n quieres que se la d�?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Seguro que encontrar�s a alguien que la acepte. Habla con la gente. Pero no des m�s que UN tallo a cada persona.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //Una cosa m�s. Si permites que alguien te arrebate la hierba o si te la fumas t� mismo, nuestro acuerdo dejar� de tener validez.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //�Qu� quieres como recompensa?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Me quedar� con el mineral.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Ay�dame a unirme a la Hermandad.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Estos pergaminos son muy interesantes. �Qu� clase de conjuros son?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan tiene nuevos clientes y yo he recibido mi recompensa.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Todav�a no he visto ning�n cliente nuevo. Reparte un poco m�s.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Estos pergaminos de conjuro son muy interesantes; �de qu� clase de sortilegios se trata?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Pu�o del viento, Hechizar, Telequinesia, Piroquinesia y Dormir. Puedes escoger tres de estos conjuros.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Me quedar� con los tres pergaminos de conjuros.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Ay�dame a ingresar en la Hermandad.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Tu petici�n es modesta. Te ayudar�, as� que esc�chame. Baal Tyon es uno de los Gur�s inferiores, como yo.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion le ha nombrado consejero suyo. Eso no le ha hecho ning�n bien.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Ahora se cree tan importante que no habla m�s que con sus disc�pulos.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Si le entregas esto, eso le soltar� la lengua.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Baal Kagan me ha dado una LLAMADA ON�RICA especial para Baal Tyon. Eso me ayudar� a unirme a la Hermandad de la secta.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Quiero las 100 pepitas.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //De acuerdo. Aqu� las tienes.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Quiero los pergaminos de conjuro.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Una excelente decisi�n. Escoge tres.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pu�o del viento.",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con �se hacen tres. Util�zalos sabiamente.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con �se hacen tres. Util�zalos sabiamente.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con �se hacen tres. Util�zalos sabiamente.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con �se hacen tres. Util�zalos sabiamente.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Y con �se hacen tres. Util�zalos sabiamente.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




