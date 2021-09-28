// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "¡Hola! Soy nuevo aquí. ¿Qué tal?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //¡Hola! Soy nuevo aquí; ¿cómo va todo?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //¡Lárgate! He estado trabajando como una mula en las minas durante las dos últimas semanas. ¿Y para qué?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Sólo he conseguido unos patéticos trozos de mineral. Me lo tuve que gastar casi todo en comida.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //He hablado con Baal Parvez. Me ha contado algunas cosas interesantes acerca del Campamento de la Secta.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Será mejor que vaya allí en vez de partirme la espalda por Gómez.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "¿No te gusta esto? Entonces, ¿por qué no te vas?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //¿No estás a gusto aquí? ¿Por qué no te marchas, entonces?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Porque no estoy muy seguro de lo que voy a encontrarme allí. Tenía un amigo aquí; se llamaba Melvin. Salió hacia el Campamento de la Secta hace una semana.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Pero, desde entonces, no he recibido noticias suyas. ¡Y mientras siga sin recibirlas, aquí me quedo!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, un cavador del Campamento Viejo, ya no está satisfecho con vivir allí. Está pensando en unirse a la Hermandad del pantano.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "Estaba en el Campamento de la Secta y me encontré con Melvin.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Yo he estado en el Campamento de la Secta y he visto a Melvin.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //¿Y? ¿Qué te contó?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Parece ser que le gusta más eso que ser acosado por los guardias.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //¡Oye, tío! A ver si él va a ser el único que se lo pasa bien. Tengo que ir allí. Pero nunca conseguiré salir del Campamento.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //¿De verdad? ¿Por qué no?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Los guardias se han enterado de que quiero marcharme; parece que he hablado demasiado.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Necesito por lo menos 100 pepitas para sobornar a los guardias.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "¿Y si te doy las 100 pepitas para los guardias?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //¿Y si yo te diera las 100 pepitas para la guardia?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //¿Harías eso? ¿Por qué?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Bueno, digamos que tú no eres el único que prefiere que estés en el Campamento de la Secta.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //¿Quieres decir que quieres venir conmigo?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "IRÉ contigo al Campamento de la Secta.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //Sí, iré contigo al Campamento de la Secta.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //¡Genial, tío! Estoy dispuesto. Podemos empezar cuando quieras.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Pero no te olvides de que necesitamos 100 pepitas para los guardias.

	B_LogEntry	(CH1_RecruitDusty,"He logrado convencer al cavador Dusty de que se una a la Hermandad del campamento del pantano. Pero tendré que sobornar a los guardias con algún mineral. Lo mejor será que le lleve directamente a ver a Baal Tondral.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "Estoy listo. ¡Vamos!";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //¡Estoy listo; vamos!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Vale; salgamos por la puerta sur. La puerta norte no nos vale; es imposible sobornar a sus guardias.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Quizá deberías ser tú quien se encargara de lo del mineral; a mí no se me dan bien estas cosas.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //De acuerdo; ¡vamos!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty me ha advertido que no use la puerta principal del norte. Parece ser más fácil sobornar a los guardias de la puerta del sur.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

