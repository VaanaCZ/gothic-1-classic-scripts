//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		Grd_237_Torwache
//	Lager:		OldCamp
//	Durchgang:	Barrikade beim Durchgang zum Orkgebiet
//	Uhrzeit:	24h
//////////////////////////////////////////////////////////////////////////
CONST STRING	Grd_237_CHECKPOINT		= "OW_PATH_272";

INSTANCE Info_Grd_237_FirstWarn (C_INFO)
{
	npc			= Grd_237_Gardist;
	nr			= 1;
	condition	= Info_Grd_237_FirstWarn_Condition;
	information	= Info_Grd_237_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
FUNC INT Info_Grd_237_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

FUNC VOID Info_Grd_237_FirstWarn_Info()
{
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_01"); //Será mejor que no te quedes aquí. ¡El territorio orco empieza tras esa barricada!
	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_02"); //¿Es peligroso?
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_03"); //Déjame que te lo explique de esta manera: ¡Podrías darme todo tu mineral antes de salir ahí fuera y dejar que los orcos te hagan trizas!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Grd_237_CHECKPOINT);

	Info_ClearChoices	(Info_Grd_237_FirstWarn);
	Info_AddChoice		(Info_Grd_237_FirstWarn,"¡Creo que no quiero hacerlo!",		Info_Grd_237_FirstWarn_Info_NO);	
	Info_AddChoice		(Info_Grd_237_FirstWarn,"¡Claro, aquí tienes mi mineral!",				Info_Grd_237_FirstWarn_Info_YES);	
	Info_AddChoice		(Info_Grd_237_FirstWarn,"Creo que lo mejor será que me dé la vuelta.",	Info_Grd_237_FirstWarn_Info_RETREAT);	
};

func void Info_Grd_237_FirstWarn_Info_RETREAT ()
{
	Info_ClearChoices	(Info_Grd_237_FirstWarn);

	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_04"); //Creo que lo mejor será que me dé la vuelta.
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_05"); //Lástima, me habría encantado hacerme cargo de tu mineral.

	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos	(self);
};	

func void Info_Grd_237_FirstWarn_Info_YES ()
{
	Info_ClearChoices	(Info_Grd_237_FirstWarn);

	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_06"); //¡Claro, aquí tienes mi mineral!
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_07"); //Oh, qué amable has sido.
	
	var int ore;
	ore = Npc_HasItems	(hero,	ItMiNugget);
	B_GiveInvItems	(hero, self, ItMiNugget, ore);

	self.aivar[AIV_PASSGATE] = TRUE;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos	(self);
};	

func void Info_Grd_237_FirstWarn_Info_NO ()
{
	Info_ClearChoices	(Info_Grd_237_FirstWarn);

	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_08"); //¡Creo que no quiero hacerlo!
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_09"); //En ese caso, ¡será mejor que no des un paso más!

	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos	(self);
};	

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
INSTANCE Info_Grd_237_LastWarn (C_INFO)
{
	npc			= Grd_237_Gardist;
	nr			= 2;
	condition	= Info_Grd_237_LastWarn_Condition;
	information	= Info_Grd_237_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_237_LastWarn_Condition()
{
	if ((self.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE							) 
	&&  (Npc_GetDistToWP(hero,Grd_237_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Grd_237_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Grd_237_LastWarn_07_01"); 		//¿Estás sordo? ¡Un paso más y serás pasto de los gusanos!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Grd_237_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
INSTANCE Info_Grd_237_Attack (C_INFO)
{
	npc			= Grd_237_Gardist;
	nr			= 1;
	condition	= Info_Grd_237_Attack_Condition;
	information	= Info_Grd_237_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_237_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_GetDistToWP(hero,Grd_237_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Grd_237_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};
