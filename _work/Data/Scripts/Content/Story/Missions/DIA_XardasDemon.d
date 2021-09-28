// ************************ EXIT **************************

instance  Info_XardasDemon_EXIT (C_INFO)
{
	npc			=	XardasDemon;
	nr			=	999;
	condition	=	Info_XardasDemon_EXIT_Condition;
	information	=	Info_XardasDemon_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_XardasDemon_EXIT_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output (hero, self,"Info_Saturas_EXIT_15_01"); //¿...Mortal? ¿...quién, yo?... ¡Vale, ya voy!

	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info INTRO
//***************************************************************************
instance Info_XardasDemon_INTRO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_INTRO_Condition;
	information	= Info_XardasDemon_INTRO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_XardasDemon_INTRO_Condition()
{	
	if (FindXardas)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_INTRO_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_01"); //Espera un momento... ¿Quién...? ¿Quién me habla?
	AI_WhirlAround	(hero, self);	//KEIN B_Whirlaround()!!!
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_02"); //¿Estás hablando conmigo? ¿Cómo... Cómo has conseguido meterte en mi cabeza?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_03"); //¿Que eres qué? ¿...El sirviente de tu amo?
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_04"); //¡Pareces una criatura del averno!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_05"); //¿Quieres que guarde silencio?
};

//***************************************************************************
//	Info MASTERWHO
//***************************************************************************
instance Info_XardasDemon_MASTERWHO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERWHO_Condition;
	information	= Info_XardasDemon_MASTERWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Por casualidad se llama Xardas tu señor?";
};

FUNC INT Info_XardasDemon_MASTERWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERWHO_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_01"); //¿Tu amo no será Xardas, por casualidad?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_02"); //Oh, vale... Así que los nombres no son importantes... Vale.
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_03"); //Entonces daré por sentado que ésta es la torre de Xardas.
};

//***************************************************************************
//	Info MASTERHOW
//***************************************************************************
instance Info_XardasDemon_MASTERHOW (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERHOW_Condition;
	information	= Info_XardasDemon_MASTERHOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡Tengo que hablar con tu señor!";
};

FUNC INT Info_XardasDemon_MASTERHOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERHOW_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_01"); //¡Tengo que hablar con tu amo!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_02"); //¿...Yo? ¿...Indigno? ¿...Qué clase de prueba?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_03"); //...Ahhhh. Comprendo... ¡El que quiera hablar con tu amo primero tendrá que demostrar su valía!
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_04"); //...Un momento... ¿Qué has dicho? ¿...La prueba? ¿...Vencer a qué? ¿...Vencer a los elementos?
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_05"); //¿...Piedra? ¿...Hielo? ¿...Fuego?

	FindGolemHearts = 1;		// Auftrag vergeben

	B_LogEntry		(CH4_FindXardas,"En la torre de Xardas, me he encontrado con un demonio que me hablaba en mis pensamientos. Quiere tres pruebas de la victoria sobre los elementos del fuego, el hielo y la piedra antes de dejarme ver a su amo.");
};

//***************************************************************************
//	Info NOHEART
//***************************************************************************
instance Info_XardasDemon_NOHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_NOHEART_Condition;
	information	= Info_XardasDemon_NOHEART_Info;
	permanent	= 1;
	important 	= 0;
	description = "¡Hablas mediante enigmas!";
};

FUNC INT Info_XardasDemon_NOHEART_Condition()
{	
	if 	 Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	!Npc_HasItems (hero, ItAt_StoneGolem_01)
	&&	!Npc_HasItems (hero, ItAt_IceGolem_01)
	&&	!Npc_HasItems (hero, ItAt_FireGolem_01)
	&&	(FindGolemHearts < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_NOHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_01"); //¡Estás hablando en acertijos!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_02"); //¡Eso ya lo has dicho; te estás repitiendo!
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_03"); //¿...Que quieres pruebas de la victoria sobre los elementos del fuego, hielo y fuego?
};

//***************************************************************************
//	Ein Herz abliefern
//***************************************************************************
func void B_XardasDemon_GiveHeart()
{
	if 		(FindGolemHearts == 1)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_01"); //¿Cómo? ¡...De acuerdo! ¡...Pruebas dignas!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_02"); //¿...Que faltan? ¿Que todavía faltan dos?
		FindGolemHearts = 2;
	}
	else if (FindGolemHearts == 2)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_03"); //¿...Dualidad? ¿...La segunda prueba?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_04"); //¿...Que todavía falta una?
		FindGolemHearts = 3;
	}
	else if (FindGolemHearts == 3)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_05"); //¿...Perfección? ¿...Soy digno?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_06"); //¡En ese caso, me gustaría hablar con tu amo ahora mismo!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_07"); //¿..:Pruebas contradictorias? ¿...Qué clase de prueba contradictorias? ¿...Una runa? ¿...Una runa para mí?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_08"); //¡Bueno, acepto la runa de teletransporte como símbolo de mi valía!

		B_Story_AccessToXardas();
	};
};


//***************************************************************************
//	Info STONEHEART
//***************************************************************************
instance Info_XardasDemon_STONEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_STONEHEART_Condition;
	information	= Info_XardasDemon_STONEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Esto es el corazón de un gólem de piedra.";
};

FUNC INT Info_XardasDemon_STONEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_StoneGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_STONEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_STONEHEART_15_01"); //Aquí tienes el corazón de un gólem de piedra.

    B_GiveInvItems  (hero, self, ItAt_StoneGolem_01, 1);
	Npc_RemoveInvItem(self, ItAt_StoneGolem_01);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info ICEHEART
//***************************************************************************
instance Info_XardasDemon_ICEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_ICEHEART_Condition;
	information	= Info_XardasDemon_ICEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Es la prueba este corazón de un gólem de hielo?";
};

FUNC INT Info_XardasDemon_ICEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_IceGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_ICEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_ICEHEART_15_01"); //¿La prueba es este corazón de un gólem de hielo?

	B_GiveInvItems  (hero, self, ItAt_IceGolem_01, 1);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info FIREHEART
//***************************************************************************
instance Info_XardasDemon_FIREHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_FIREHEART_Condition;
	information	= Info_XardasDemon_FIREHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Qué hay de este corazón de un gólem de fuego?";
};

FUNC INT Info_XardasDemon_FIREHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_FireGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_FIREHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_FIREHEART_15_01"); //¿Y qué hay de este corazón de un gólem de fuego?

	B_GiveInvItems  (hero, self, ItAt_FireGolem_01, 1);

	B_XardasDemon_GiveHeart();
};





