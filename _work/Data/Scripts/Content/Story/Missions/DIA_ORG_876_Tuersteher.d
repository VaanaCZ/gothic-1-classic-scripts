// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Org_876_EXIT (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 999;
	condition	= DIA_Org_876_EXIT_Condition;
	information	= DIA_Org_876_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Org_876_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Org_876_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bin Schürfer
// ************************************************************

INSTANCE DIA_Org_876_AmSfb (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_876_AmSfb_Condition;
	information	= DIA_Org_876_AmSfb_Info;
	permanent	= 1;
	description = "Io sono un tritarocce e ho sete!";
};                       

FUNC INT DIA_Org_876_AmSfb_Condition()
{
	if	(self.aivar[AIV_PASSGATE] == FALSE)
	&&	(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) 
	{	
		return TRUE;
	};
};

FUNC VOID DIA_Org_876_AmSfb_Info()
{	
	AI_Output (other, self,"DIA_Org_876_AmSfb_15_00"); //Io sono un minatore e ho sete!
	
	var C_ITEM myarmor;
	
	myarmor = Npc_GetEquippedArmor(hero);
	if (Hlp_IsItem(myarmor, SFB_ARMOR_L))
	{
		AI_Output (self, other,"DIA_Org_876_AmSfb_06_01"); //Sembri proprio uno di quegli straccioni. Entra!
		self.aivar[AIV_PASSGATE] = TRUE;	
		
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_AmSfb_NOSFB_06_00"); //Non sembri un tritarocce. Non puoi entrare, ragazzo.
	};
};

// ************************************************************
// 						Bestechen
// ************************************************************

INSTANCE DIA_Org_876_Bribe (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_876_Bribe_Condition;
	information	= DIA_Org_876_Bribe_Info;
	permanent	= 1;
	description = "Cosa ne dici di un po' di metallo come 'tassa d'ammissione'?";
};                       

FUNC INT DIA_Org_876_Bribe_Condition()
{
	if	(self.aivar[AIV_PASSGATE] == FALSE)
	&&	(Npc_GetAttitude(self,hero) != ATT_FRIENDLY) 
	{
		return 1;
	};
};

FUNC VOID DIA_Org_876_Bribe_Info()
{	
	AI_Output (other, self,"DIA_Org_876_Bribe_15_00"); //Cosa ne dici di un po' di metallo come 'tassa d'ammissione'?
	AI_Output (self, other,"DIA_Org_876_Bribe_06_01"); //Cosa intendi con 'un po''?
	
	Info_ClearChoices	(DIA_Org_876_Bribe );
	Info_AddChoice		(DIA_Org_876_Bribe,"100 pezzi di metallo dovrebbero essere sufficienti.",DIA_Org_876_Bribe_100Erz);
	Info_AddChoice		(DIA_Org_876_Bribe,"Che ne dici di 50 pezzi?",DIA_Org_876_Bribe_50Erz);
	Info_AddChoice		(DIA_Org_876_Bribe,"Ho 10 pezzi con me.",DIA_Org_876_Bribe_10Erz);
};

func void DIA_Org_876_Bribe_10Erz()
{
	AI_Output (other, self,"DIA_Org_876_Bribe_10Erz_15_00"); //Ho 10 pezzi con me.
	if (Npc_HasItems (other, itminugget) >= 10)
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_10Erz_06_01"); //10 pezzi? Per quelli ti posso solo permettere di provarci ancora.
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_10Erz_06_02"); //Dove? Non li vedo.
	};
	
	AI_StopProcessInfos	(self);
};

func void DIA_Org_876_Bribe_50Erz()
{
	AI_Output (other, self,"DIA_Org_876_Bribe_50Erz_15_00"); //Che ne dici di 50 pezzi?
	if (Npc_HasItems (other, itminugget) >= 50)
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_50Erz_06_01"); //Che sono esattamente quello che intendo per 'un po' di metallo'.
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_50Erz_06_02"); //Dove sono i 50 pezzi?
	};
	
	AI_StopProcessInfos	(self);
};

func void DIA_Org_876_Bribe_100Erz()
{
	AI_Output (other, self,"DIA_Org_876_Bribe_100Erz_15_00"); //100 pezzi di metallo dovrebbero essere sufficienti.
	if (Npc_HasItems (other, itminugget) >= 100)
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_100Erz_06_01"); //Parole sante! Puoi entrare.
		self.aivar[AIV_PASSGATE] = TRUE;	
		B_GiveInvItems	(other, self, ItMiNugget, 100);
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_100Erz_06_02"); //Hai ragione, ma non sembri avere tanto metallo.
	};

	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_Org_876_PERM (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_876_PERM_Condition;
	information	= DIA_Org_876_PERM_Info;
	permanent	= 1;
	description = "Come va il commercio della grappa?";
};                       

FUNC INT DIA_Org_876_PERM_Condition()
{
	if	(self.aivar[AIV_PASSGATE] == TRUE)
	||	(Npc_GetAttitude(self,hero) == ATT_FRIENDLY) 
	{
		return 1;
	};
};

FUNC VOID DIA_Org_876_PERM_Info()
{	
	AI_Output (other, self,"DIA_Org_876_PERM_15_00"); //Come va il commercio della grappa?
	AI_Output (self, other,"DIA_Org_876_PERM_06_01"); //Entra e chiedilo a Silas. NOI non ci lamentiamo.
};

// ************************************************************
// 						SC = SLD oder Magier
// ************************************************************

INSTANCE DIA_Org_876_ScSld (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_876_ScSld_Condition;
	information	= DIA_Org_876_ScSld_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT DIA_Org_876_ScSld_Condition()
{
	if ( (other.guild == GIL_SLD) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) )
	{
		return 1;
	};
};

FUNC VOID DIA_Org_876_ScSld_Info()
{	
	AI_Output (self, other,"DIA_Org_876_ScSld_06_00"); //Fermo! Conosci le regole: solo tritarocce e ladri!
	AI_Output (other, self,"DIA_Org_876_ScSld_15_01"); //Vuoi provare a fermarmi?
	AI_Output (self, other,"DIA_Org_876_ScSld_06_02"); //No... entra pure...
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 						SC = Sekte
// ************************************************************

INSTANCE DIA_Org_876_ScSekte (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_876_ScSekte_Condition;
	information	= DIA_Org_876_ScSekte_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT DIA_Org_876_ScSekte_Condition()
{
	if ( (other.guild == GIL_NOV) || (other.guild == GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_Org_876_ScSekte_Info()
{	
	AI_Output (self, other,"DIA_Org_876_ScSekte_06_00"); //Di solito facciamo entrare solo la nostra gente, ma non abbiamo nulla contro la Fratellanza.
	AI_Output (self, other,"DIA_Org_876_ScSekte_06_01"); //Specialmente se ha con sé qualcosa da fumare.
};

// ************************************************************
// 						Kraut geben
// ************************************************************
	var int Org_876_GotJoint;
// ************************************************************

INSTANCE DIA_Org_876_GibKraut (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_876_GibKraut_Condition;
	information	= DIA_Org_876_GibKraut_Info;
	permanent	= 1;
	description = "Ho qualche pianta. Ecco, prendine una.";
};                       

FUNC INT DIA_Org_876_GibKraut_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Org_876_ScSekte))
	{
		return 1;
	};
};

FUNC VOID DIA_Org_876_GibKraut_Info()
{	
	AI_Output (other, self,"DIA_Org_876_GibKraut_15_00"); //Ho qualche pianta. Ecco, prendine una.

	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems	(other, self,ItMiJoint_1, 1); }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems	(other, self,ItMiJoint_2, 1); }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems	(other, self,ItMiJoint_3, 1); };
		
		AI_Output (self, other,"DIA_Org_876_GibKraut_06_01"); //Sei sempre il benvenuto, amico.
		self.aivar[AIV_PASSGATE] = TRUE;
		Org_876_GotJoint = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Org_876_GibKraut_KEIN_15_00"); //Oh... Aspetta, mi sono sbagliato. Non ho nulla.
		AI_Output (self, other,"DIA_Org_876_GibKraut_KEIN_06_00"); //Va bene. Pensa a me, la prossima volta.
		self.aivar[AIV_PASSGATE] = TRUE;
	};
};

//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		Org_876_Tuersteher
//	Lager:		NewCamp	
//	Durchgang:	Kneipe (rechte Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////

// **********************************************
// Erste Warnung
// **********************************************
	const string Org_876_CHECKPOINT = "NC_TAVERN_BAR";
// **********************************************

instance Info_Org_876_FirstWarn (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 2;
	condition	= Info_Org_876_FirstWarn_Condition;
	information	= Info_Org_876_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Org_876_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_Org_876_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Org_876_FirstWarn_Info_06_00"); //E TU dove vorresti andare?
	AI_Output (hero, self,"Info_Org_876_FirstWarn_Info_15_01"); //Dentro, perché?
	AI_Output (self, hero,"Info_Org_876_FirstWarn_Info_06_02"); //Scordatelo! Silas accetta nella sua taverna solo tritarocce e ladri.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Org_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Org_876_LastWarn (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= Info_Org_876_LastWarn_Condition;
	information	= Info_Org_876_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Org_876_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Org_876_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Org_876_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Org_876_LastWarn_06_00"); //Sei sordo, amico?

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Org_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Org_876_Attack (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= Info_Org_876_Attack_Condition;
	information	= Info_Org_876_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Org_876_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_GetDistToWP(hero,Org_876_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Org_876_Attack_Info()
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
