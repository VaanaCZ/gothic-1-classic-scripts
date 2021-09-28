//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		SLD_723_Soeldner
//	Lager:				
//	Durchgang:
//	Uhrzeit:
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	SLD_723_CHECKPOINT		= "NC_PLACE02";

instance Info_SLD_723_FirstWarn (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 1;
	condition	= Info_SLD_723_FirstWarn_Condition;
	information	= Info_SLD_723_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_SLD_723_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_SLD_723_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output 		(self, hero,"Info_SLD_723_FirstWarn_11_01"); //¡ALTO! ¡Nadie puede pasar sin dar la contraseña!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,SLD_723_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		Info_Clearchoices 	(Info_SLD_723_FirstWarn);
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"¡Cronos me ha dado permiso!",	Info_SLD_723_Parole_CRONOS);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"¡Ni idea, la he olvidado!",	Info_SLD_723_Parole_FORGOT);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"La contraseña es TERIANTROCH.",	Info_SLD_723_Parole_FALSE2);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"La contraseña es TETRIANDOCH.",	Info_SLD_723_Parole_TRUE);  
		Info_Addchoice 		(Info_SLD_723_FirstWarn,"La contraseña es TETRIDANOCH.",	Info_SLD_723_Parole_FALSE1);  
	}
	else
	{
		AI_StopProcessInfos	(self);
	};
};

func void Info_SLD_723_Parole_CRONOS ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_CRONOS_15_01"); //¡Tengo permiso de Cronos!
	AI_Output 			(self, hero,"Info_SLD_723_Parole_CRONOS_11_02"); //Si así fuera, te habría dado la contraseña. ¡Piérdete, embustero!
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_FORGOT ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_FORGOT_15_01"); //¡No tengo ni idea, se me ha olvidado!
	AI_Output 			(self, hero,"Info_SLD_723_Parole_FORGOT_11_02"); //¡Entonces, vuelve cuando la recuerdes y no me hagas perder el tiempo!
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_FALSE1 ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_FALSE1_15_01"); //La contraseña es TETRIDANOCH.
	AI_Output 			(self, hero,"Info_SLD_723_Parole_FALSE1_11_02"); //¡MAL!
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_FALSE2 ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_FALSE2_15_01"); //La contraseña es TERIANTROCH.
	AI_Output 			(self, hero,"Info_SLD_723_Parole_FALSE2_11_02"); //¡MAL!
	AI_StopProcessInfos	(self);
};

func void Info_SLD_723_Parole_TRUE ()
{
	AI_Output 			(hero, self,"Info_SLD_723_Parole_TRUE_15_01"); //La contraseña es TETRIANDOCH.
	AI_Output 			(self, hero,"Info_SLD_723_Parole_TRUE_11_02"); //¡Correcto! ¡Puedes pasar!
	AI_StopProcessInfos	(self);

	//---- beide Wachen auf passieren schalten ----
	var C_NPC guard; guard = Hlp_GetNpc(Sld_732_Soeldner);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] 			= TRUE;
	guard.aivar[AIV_PASSGATE] 			= TRUE;
	B_GiveXP  			(XP_SayCorrectParole);
};



//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_SLD_723_LastWarn (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 2;
	condition	= Info_SLD_723_LastWarn_Condition;
	information	= Info_SLD_723_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_SLD_723_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE							) 
	&&  (Npc_GetDistToWP(hero,SLD_723_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_SLD_723_LastWarn_Info()
{
	AI_Output 		(self, hero,"Info_SLD_723_LastWarn_11_01"); 		//¡No te lo diré otra vez! ¡NO DES NI UN PASO MÁS!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,SLD_723_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_SLD_723_Attack (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 3;
	condition	= Info_SLD_723_Attack_Condition;
	information	= Info_SLD_723_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_SLD_723_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE							) 
	&&  (Npc_GetDistToWP(hero,SLD_723_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_SLD_723_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

//------------------------------------------------------------------------
//	Info PAROLE
//------------------------------------------------------------------------
instance Info_SLD_723_PAROLE (C_INFO)
{
	npc			= SLD_723_Soeldner;
	nr			= 10;
	condition	= Info_SLD_723_PAROLE_Condition;
	information	= Info_SLD_723_PAROLE_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Decir la contraseña)";
};                       

func int Info_SLD_723_PAROLE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	&&	(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 	TRUE;
	};
};

func int Info_SLD_723_PAROLE_Info()
{
	Info_ClearChoices 	(Info_SLD_723_PAROLE);
	Info_AddChoice 		(Info_SLD_723_PAROLE,"¡Cronos me ha dado permiso!",	Info_SLD_723_Parole_CRONOS);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"¡Ni idea, la he olvidado!",	Info_SLD_723_Parole_FORGOT);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"La contraseña es TERIANTROCH.",	Info_SLD_723_Parole_FALSE2);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"La contraseña es TETRIANDOCH.",	Info_SLD_723_Parole_TRUE);  
	Info_AddChoice 		(Info_SLD_723_PAROLE,"La contraseña es TETRIDANOCH.",	Info_SLD_723_Parole_FALSE1);  
};
