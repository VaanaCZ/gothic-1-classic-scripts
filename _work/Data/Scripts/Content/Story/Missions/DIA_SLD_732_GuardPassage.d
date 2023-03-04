//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		SLD_732_Soeldner
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
const string	SLD_732_CHECKPOINT		= "NC_PLACE02";

instance Info_SLD_732_FirstWarn (C_INFO)
{
	npc			= SLD_732_Soeldner;
	nr			= 1;
	condition	= Info_SLD_732_FirstWarn_Condition;
	information	= Info_SLD_732_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_SLD_732_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_SLD_732_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output 		(self, hero,"Info_SLD_732_FirstWarn_08_01"); //ARRÊTE ! Personne ne passe sans le mot de passe !

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,SLD_732_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		Info_Clearchoices 	(Info_SLD_732_FirstWarn);
		Info_Addchoice 		(Info_SLD_732_FirstWarn,"Cronos m'a donné la permission !",	Info_SLD_732_Parole_CRONOS);  
		Info_Addchoice 		(Info_SLD_732_FirstWarn,"Aucune idée, j'ai oublié.",	Info_SLD_732_Parole_FORGOT);  
		Info_Addchoice 		(Info_SLD_732_FirstWarn,"Le mot de passe est TERIANTROCH.",	Info_SLD_732_Parole_FALSE2);  
		Info_Addchoice 		(Info_SLD_732_FirstWarn,"Le mot de passe est TETRIANDOCH.",	Info_SLD_732_Parole_TRUE);  
		Info_Addchoice 		(Info_SLD_732_FirstWarn,"Le mot de passe est TETRIDANOCH.",	Info_SLD_732_Parole_FALSE1);  
	}
	else
	{
		AI_StopProcessInfos	(self);
	};
};

func void Info_SLD_732_Parole_CRONOS ()
{
	AI_Output 			(hero, self,"Info_SLD_732_Parole_CRONOS_15_01"); //Cronos m'a donné la permission !
	AI_Output 			(self, hero,"Info_SLD_732_Parole_CRONOS_08_02"); //Si c'est comme ça, il a dû t'avoir donné le mot de passe. Fous le camp, menteur !
	AI_StopProcessInfos	(self);
};

func void Info_SLD_732_Parole_FORGOT ()
{
	AI_Output 			(hero, self,"Info_SLD_732_Parole_FORGOT_15_01"); //Aucune idée, j'ai oublié.
	AI_Output 			(self, hero,"Info_SLD_732_Parole_FORGOT_08_02"); //Ou reviens dès que tu t'en souviendras et ne me fait pas perdre ton temps !
	AI_StopProcessInfos	(self);
};

func void Info_SLD_732_Parole_FALSE1 ()
{
	AI_Output 			(hero, self,"Info_SLD_732_Parole_FALSE1_15_01"); //Le mot de passe est TETRIDANOCH.
	AI_Output 			(self, hero,"Info_SLD_732_Parole_FALSE1_08_02"); //RATE !
	AI_StopProcessInfos	(self);
};

func void Info_SLD_732_Parole_FALSE2 ()
{
	AI_Output 			(hero, self,"Info_SLD_732_Parole_FALSE2_15_01"); //Le mot de passe est TERIANTROCH.
	AI_Output 			(self, hero,"Info_SLD_732_Parole_FALSE2_08_02"); //RATE !
	AI_StopProcessInfos	(self);
};

func void Info_SLD_732_Parole_TRUE ()
{
	AI_Output 			(hero, self,"Info_SLD_732_Parole_TRUE_15_01"); //Le mot de passe est TETRIANDOCH.
	AI_Output 			(self, hero,"Info_SLD_732_Parole_TRUE_08_02"); //C'est exact ! tu peux passer !
	AI_StopProcessInfos	(self);

	//---- beide Wachen auf passieren schalten ----
	var C_NPC guard; guard = Hlp_GetNpc(Sld_723_Soeldner);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] 			= TRUE;
	guard.aivar[AIV_PASSGATE] 			= TRUE;
	B_GiveXP  			(XP_SayCorrectParole);
};



//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_SLD_732_LastWarn (C_INFO)
{
	npc			= SLD_732_Soeldner;
	nr			= 2;
	condition	= Info_SLD_732_LastWarn_Condition;
	information	= Info_SLD_732_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_SLD_732_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&  (Npc_GetDistToWP(hero,SLD_732_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_SLD_732_LastWarn_Info()
{
	AI_Output 		(self, hero,"Info_SLD_732_LastWarn_08_01"); 		//Je ne te le dirais plus ! PLUS UN PAS !

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,SLD_732_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_SLD_732_Attack (C_INFO)
{
	npc			= SLD_732_Soeldner;
	nr			= 3;
	condition	= Info_SLD_732_Attack_Condition;
	information	= Info_SLD_732_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_SLD_732_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&  (Npc_GetDistToWP(hero,SLD_732_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_SLD_732_Attack_Info()
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
instance Info_SLD_732_PAROLE (C_INFO)
{
	npc			= SLD_732_Soeldner;
	nr			= 10;
	condition	= Info_SLD_732_PAROLE_Condition;
	information	= Info_SLD_732_PAROLE_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Dire le mot de passe)";
};                       

func int Info_SLD_732_PAROLE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	&&	(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 	TRUE;
	};
};

func int Info_SLD_732_PAROLE_Info()
{
	Info_ClearChoices 	(Info_SLD_732_PAROLE);
	Info_AddChoice 		(Info_SLD_732_PAROLE,"Cronos m'a donné la permission !",	Info_SLD_732_Parole_CRONOS);  
	Info_AddChoice 		(Info_SLD_732_PAROLE,"Aucune idée, j'ai oublié.",	Info_SLD_732_Parole_FORGOT);  
	Info_AddChoice 		(Info_SLD_732_PAROLE,"Le mot de passe est TERIANTROCH.",	Info_SLD_732_Parole_FALSE2);  
	Info_AddChoice 		(Info_SLD_732_PAROLE,"Le mot de passe est TETRIANDOCH.",	Info_SLD_732_Parole_TRUE);  
	Info_AddChoice 		(Info_SLD_732_PAROLE,"Le mot de passe est TETRIDANOCH.",	Info_SLD_732_Parole_FALSE1);  
};
