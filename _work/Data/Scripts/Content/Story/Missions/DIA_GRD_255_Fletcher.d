// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //¡Eh, tú!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //¿Quién? ¿Yo?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //¡Sabes a quién me refiero, hijo!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Déjame decirte algo: éste es MI distrito. ¡Y no quiero líos!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Pero los nuevos como tú siempre los causáis. Especialmente cuando rondáis a escondidas de noche.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //¿Por qué no regresas a casa y haces que no vuelva a verte por aquí? Hay una cabaña vacía frente a la arena, la que tiene un toldo. Duerme un poco.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Y si te cojo en una de las otras cabañas, haré personalmente que vivas para lamentarlo.
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //¡Eh, tú!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Si querías deshacerte del dinero para comprar tu protección, has escogido un mal día.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //¿Sí? ¿Por qué?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Porque no estoy aquí.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Entiendo.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Entonces, ¿cómo es que estoy hablando contigo?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Oh, entonces, ¿dónde estás?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Oh, entonces ¿dónde estás?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //En realidad estoy en el castillo, sentando junto a la gran fogata, bebiendo una jarra de cerveza.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Entonces, ¿cómo es que estoy hablando contigo?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek ha desaparecido. Este distrito suele ser responsabilidad suya.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //Y hasta que vuelva a aparecer, Thorus me ha ordenado que lo vigile.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Entiendo.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "¿Sabes a dónde se ha ido Nek?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //¿Sabes a dónde se ha ido Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //No, y no creo que lo averigüe.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //A lo mejor saben algo los cavadores de este distrito. Pero ellos no hablan con los guardias.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Especialmente desde que saben que odio este asqueroso trabajo. ¡Seguro que se ríen a mis espaldas!
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Quizá los cavadores del distrito de la arena sepan dónde desapareció Nek.");
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "¿Por qué no te limitas a recaudar más dinero a cambio de protección?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //¿Por qué no te limitas a recaudar más dinero a cambio de protección?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek hizo sus rondas antes de desaparecer. No queda mucho por recaudar.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "Es acerca de Nek...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Es acerca de Nek...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //¿Sí?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Creo que lo he encontrado.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //¿Qué? ¿Dónde está?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Es pasto de las ratas...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //¡Oh no! ¡Maldita sea! Eso quiere decir que ahora tengo que dirigir todo eso. Esperaba que volviera.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Tengo un problema.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //No tengo noticias.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Mantenme informado.
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "¿Cuál es el problema?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //¿Cuál es el problema?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Estoy hasta el cuello de deudas con Scatty. Ahora que sabe que estoy haciendo el trabajo de Nek, se presentará todos los días.
};	












//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Te has acostumbrado deprisa a nuestras costumbres. ¡Bienvenido a la guardia!
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //¡Traidor! ¿Pensabas que íbamos a dejar ingresar en la guardia a alguien como tú? ¡BAH!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //¡Es uno de esos magos del fuego traidores! ¡BAH!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //¡Hola traidor! ¡El que fueras una de las Sombras de Gómez no va a servirte de nada!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Oye, ¿de qué hablas, Fletcher?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Estás de acuerdo con la escoria del Campamento Nuevo, ¿verdad?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Espera...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Supongo que pensabas que no lo averiguaríamos, ¿eh?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Eh... ¡para el carro!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //No, páralo tú... Y vete despidiéndote de tu cabeza, porque la vas a perder pronto.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //¡¡¡MUERE, TRAIDOR!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn se ha atrincherado en la puerta posterior. Ha reaccionado del mismo modo que Fletcher en la puerta principal. No sé por qué, pero debe tener algo que ver con mi búsqueda de los focos de parte del Campamento Nuevo.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, que vigila la puerta principal del Campamento Viejo junto un grupo de guardias, me ha llamado traidor y renegado. ¡No me ha escuchado y me ha atacado de repente!");
			B_LogEntry			(CH4_BannedFromOC,"¡Parece que he sido desterrado del Campamento Viejo!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Mira. ¡Un tipo del Campamento Nuevo!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Mira. ¡Un tipo del campamento del pantano!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //¿Y qué? ¿A ti que te importa?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Vuestra mina pronto va a ser nuestra.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //¿Ah sí? ¡Ni de coña!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //¡Lo siento, pero no puedo arriesgarme a que se lo digas a nadie!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Espera, no quiero líos.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //¡Deberías haberlo pensado antes de asomar tu rostro por aquí!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Oye, ¿qué...?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //¡Vamos, muchachos, a por él!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Las puertas del Campamento Viejo ahora están cerradas y protegidas por guardias que atacan a todo el que se acerca por allí. ");
	};
	
	AI_StopProcessInfos	(self);
};

