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
	description		= "�Hola! Soy nuevo aqu�. �Qu� tal?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //�Hola! Soy nuevo aqu�; �c�mo va todo?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //�L�rgate! He estado trabajando como una mula en las minas durante las dos �ltimas semanas. �Y para qu�?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //S�lo he conseguido unos pat�ticos trozos de mineral. Me lo tuve que gastar casi todo en comida.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //He hablado con Baal Parvez. Me ha contado algunas cosas interesantes acerca del Campamento de la Secta.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Ser� mejor que vaya all� en vez de partirme la espalda por G�mez.
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
	description		= "�No te gusta esto? Entonces, �por qu� no te vas?";
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
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //�No est�s a gusto aqu�? �Por qu� no te marchas, entonces?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Porque no estoy muy seguro de lo que voy a encontrarme all�. Ten�a un amigo aqu�; se llamaba Melvin. Sali� hacia el Campamento de la Secta hace una semana.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Pero, desde entonces, no he recibido noticias suyas. �Y mientras siga sin recibirlas, aqu� me quedo!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, un cavador del Campamento Viejo, ya no est� satisfecho con vivir all�. Est� pensando en unirse a la Hermandad del pantano.");
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
	description		= "Estaba en el Campamento de la Secta y me encontr� con Melvin.";
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
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //�Y? �Qu� te cont�?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Parece ser que le gusta m�s eso que ser acosado por los guardias.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //�Oye, t�o! A ver si �l va a ser el �nico que se lo pasa bien. Tengo que ir all�. Pero nunca conseguir� salir del Campamento.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //�De verdad? �Por qu� no?
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
	description		= "�Y si te doy las 100 pepitas para los guardias?";
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
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //�Y si yo te diera las 100 pepitas para la guardia?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //�Har�as eso? �Por qu�?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Bueno, digamos que t� no eres el �nico que prefiere que est�s en el Campamento de la Secta.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //�Quieres decir que quieres venir conmigo?
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
	description		= "IR� contigo al Campamento de la Secta.";
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
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //S�, ir� contigo al Campamento de la Secta.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //�Genial, t�o! Estoy dispuesto. Podemos empezar cuando quieras.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Pero no te olvides de que necesitamos 100 pepitas para los guardias.

	B_LogEntry	(CH1_RecruitDusty,"He logrado convencer al cavador Dusty de que se una a la Hermandad del campamento del pantano. Pero tendr� que sobornar a los guardias con alg�n mineral. Lo mejor ser� que le lleve directamente a ver a Baal Tondral.");
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
	description		= "Estoy listo. �Vamos!";
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
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //�Estoy listo; vamos!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Vale; salgamos por la puerta sur. La puerta norte no nos vale; es imposible sobornar a sus guardias.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Quiz� deber�as ser t� quien se encargara de lo del mineral; a m� no se me dan bien estas cosas.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //De acuerdo; �vamos!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty me ha advertido que no use la puerta principal del norte. Parece ser m�s f�cil sobornar a los guardias de la puerta del sur.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

