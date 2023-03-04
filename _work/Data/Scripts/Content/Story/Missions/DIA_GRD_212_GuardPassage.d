//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		Grd_212_Torwache
//	Lager:		OldCamp
//	Durchgang:	Inneres Tor zur Burg (rechte Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
CONST STRING	Grd_212_CHECKPOINT		= "OCC_GATE_INSIDE";

INSTANCE Info_Grd_212_FirstWarn (C_INFO)
{
	npc			= Grd_212_Torwache;
	nr			= 1;
	condition	= Info_Grd_212_FirstWarn_Condition;
	information	= Info_Grd_212_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
FUNC INT Info_Grd_212_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

FUNC VOID Info_Grd_212_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Grd_212_FirstWarn_Info_13_01"); //TIENS LE!
	AI_Output (hero, self,"Info_Grd_212_FirstWarn_Info_15_02"); //Ca va ?
	AI_Output (self, hero,"Info_Grd_212_FirstWarn_Info_13_03"); //Tu ne peux pas entrer au château sans autorisation ! Sors d'ici maintenant !

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
INSTANCE Info_Grd_212_LastWarn (C_INFO)
{
	npc			= Grd_212_Torwache;
	nr			= 1;
	condition	= Info_Grd_212_LastWarn_Condition;
	information	= Info_Grd_212_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_212_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_212_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Grd_212_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Grd_212_LastWarn_13_01"); 		//Tu es sourd ? Un pas de plus et tu vas nourrir les vers !

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Grd_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
INSTANCE Info_Grd_212_Attack (C_INFO)
{
	npc			= Grd_212_Torwache;
	nr			= 1;
	condition	= Info_Grd_212_Attack_Condition;
	information	= Info_Grd_212_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Grd_212_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_212_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Grd_212_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Grd_212_EXIT (C_INFO)
{
	npc			= Grd_212_Torwache;
	nr			= 999;
	condition	= Info_Grd_212_EXIT_Condition;
	information	= Info_Grd_212_EXIT_Info;
	permanent	= 1;
	description	= DIALOG_ENDE;
};                       

FUNC INT Info_Grd_212_EXIT_Condition()
{	
	return 1;
};

FUNC VOID Info_Grd_212_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						PERM Abblitzen
// ************************************************************

INSTANCE Info_Grd_212_Abblitzen (C_INFO)
{
	npc			= Grd_212_Torwache;
	nr			= 1;
	condition	= Info_Grd_212_Abblitzen_Condition;
	information	= Info_Grd_212_Abblitzen_Info;
	permanent	= 1;
	description	= "Je veux entrer dans le château !";
};                       

FUNC INT Info_Grd_212_Abblitzen_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Grd_212_Abblitzen_Info()
{
	AI_Output (other, self,"Info_Grd_212_Abblitzen_15_00"); //Je veux entrer dans le château !
	AI_Output (self, other,"Info_Grd_212_Abblitzen_13_01"); //Passionnant ! Je veux sortir de cette foutue colonie !
	AI_Output (self, other,"Info_Grd_212_Abblitzen_13_02"); //Je peux penser à d'autres choses que d'arrêter des clochards comme toi qui vont où ils n'ont rien à faire.
	AI_Output (other, self,"Info_Grd_212_Abblitzen_15_03"); //Tu pourrais juste me laisser dedans......
	AI_Output (self, other,"Info_Grd_212_Abblitzen_13_04"); //Non, je ne peux pas ! Thorus le peux.
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Erstes Mal rein
// ************************************************************

INSTANCE Info_Grd_212_FirstIn (C_INFO)
{
	npc			= Grd_212_Torwache;
	nr			= 1;
	condition	= Info_Grd_212_FirstIn_Condition;
	information	= Info_Grd_212_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Grd_212_FirstIn_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Grd_212_FirstIn_Info()
{
	AI_Output (self, other,"Info_Grd_212_FirstIn_13_00"); //Stop!
	AI_Output (other, self,"Info_Grd_212_FirstIn_15_01"); //Du calme! J'ai parlé à Thorus. J'ai la permission.
	AI_Output (self, other,"Info_Grd_212_FirstIn_13_02"); //Je n'oublierais pas ton visage, l'ami ! Tu vas avoir des ennuis et tu n'es pas prêt d'en voir la fin !
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						PERM Nach FirstIn
// ************************************************************

INSTANCE Info_Grd_212_Passgate (C_INFO)
{
	npc			= Grd_212_Torwache;
	nr			= 1;
	condition	= Info_Grd_212_Passgate_Condition;
	information	= Info_Grd_212_Passgate_Info;
	permanent	= 1;
	description	= "Puis-je encore entrer ?";
};                       

FUNC INT Info_Grd_212_Passgate_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Grd_212_Passgate_Info()
{
	AI_Output (other, self,"Info_Grd_212_Passgate_15_00"); //Puis-je encore entrer ?
	AI_Output (self, other,"Info_Grd_212_Passgate_13_01"); //Seulement si tu arrêtes de poser des questions stupides.
	AI_StopProcessInfos	(self);
};
