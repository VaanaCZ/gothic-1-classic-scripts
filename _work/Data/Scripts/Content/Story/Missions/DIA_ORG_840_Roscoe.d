// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Roscoe_Exit (C_INFO)
{
	npc			= ORG_840_Roscoe;
	nr			= 999;
	condition	= DIA_Roscoe_Exit_Condition;
	information	= DIA_Roscoe_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Roscoe_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Roscoe_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Habe Liste
// ****************************************

instance DIA_Roscoe_BringList (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 1;
	condition		= DIA_Roscoe_BringList_Condition;
	information		= DIA_Roscoe_BringList_Info;
	permanent		= 0;
	description		= "Ho la lista di richieste della vecchia miniera.";
};

FUNC int  DIA_Roscoe_BringList_Condition()
{	
	if (Npc_HasItems(other,TheList)>=1)
	{
		return 1;
	};
};

func void  DIA_Roscoe_BringList_Info()
{
	AI_Output (other, self,"DIA_Roscoe_BringList_15_00"); //Ho la lista di richieste della vecchia miniera.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_01"); //Non male. Come l'hai avuta?
	AI_Output (other, self,"DIA_Roscoe_BringList_15_02"); //Me l'ha data Ian.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_03"); //Hai coraggio, amico! Così ti hanno mandato per mettermi alla prova, vero? Thorus deve essere impazzito.
	AI_Output (other, self,"DIA_Roscoe_BringList_15_04"); //L'ordine viene da Diego.
	AI_Output (self, other,"DIA_Roscoe_BringList_10_05"); //Diego fa ciò che gli ordina Thorus. Se lo conosco bene, si starà rotolando dalle risate, al pensiero che tu sia qui.
	AI_Output (other, self,"DIA_Roscoe_BringList_15_06"); //Ora posso entrare o no?
	AI_Output (self, other,"DIA_Roscoe_BringList_10_07"); //Fai pure. Lares non crederà ai propri occhi.
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ****************************************
// 			Mordrag schickt mich
// ****************************************

instance DIA_Roscoe_Mordrag (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 2;
	condition		= DIA_Roscoe_Mordrag_Condition;
	information		= DIA_Roscoe_Mordrag_Info;
	important		= 0;
	description		= "Mi manda Mordrag.";
};

FUNC int  DIA_Roscoe_Mordrag_Condition()
{	
	//if (Npc_KnowsInfo (hero, Org_826_Mordrag_AtNewcamp))
	if	(Npc_HasItems(hero, MordragsRing))
	{
		return 1;
	};
};

func void  DIA_Roscoe_Mordrag_Info()
{
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_00"); //Mi manda Mordrag.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_01"); //Mordrag non si fa più vedere da molto tempo. Probabilmente è passato a Campo Vecchio.
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_02"); //Mi ha accompagnato lui fin qui.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_03"); //Mordrag è tornato? Se lo incontri, digli che Lares vuole vederlo.
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_04"); //Mordrag mi ha dato un oggetto per Lares.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_05"); //Cos'è?
	AI_Output (other, self,"DIA_Roscoe_Mordrag_15_06"); //Un anello.
	AI_Output (self, other,"DIA_Roscoe_Mordrag_10_07"); //Davvero un oggetto prezioso... D'accordo, puoi vederlo.
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ****************************************
// 				Wanna Join
// ****************************************

instance DIA_Roscoe_WannaJoin (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 2;
	condition		= DIA_Roscoe_WannaJoin_Condition;
	information		= DIA_Roscoe_WannaJoin_Info;
	permanent		= 0;
	description		= "Voglio unirmi a voi.";
};

FUNC int  DIA_Roscoe_WannaJoin_Condition()
{	
	if	!Npc_KnowsInfo(hero,DIA_Roscoe_Mordrag)
	&&	!Npc_KnowsInfo(hero,DIA_Roscoe_BringList)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

func void  DIA_Roscoe_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Roscoe_WannaJoin_15_00"); //Voglio unirmi a voi.
	AI_Output (self, other,"DIA_Roscoe_WannaJoin_10_01"); //Molta gente lo vuole. Dovrai fare un'offerta migliore, se desideri attraversare questo cancello.
	
};

// ****************************************
// 				Nochmal da
// ****************************************

instance DIA_Roscoe_ComeAgain (C_INFO)
{
	npc				= Org_840_Roscoe;
	nr				= 2;
	condition		= DIA_Roscoe_ComeAgain_Condition;
	information		= DIA_Roscoe_ComeAgain_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Roscoe_ComeAgain_Condition()
{	
	
	if 	(
		( (Npc_HasItems(other,TheList)>=1) && Npc_KnowsInfo(hero,ORG_801_Lares_MordragSentMe) )
	|| 	( Npc_KnowsInfo(hero,Org_826_Mordrag_AtNewcamp) && Npc_KnowsInfo(hero,ORG_801_Lares_BringList) )
		)
	{
		return 1;
	};
};

func void  DIA_Roscoe_ComeAgain_Info()
{
	AI_Output (self, other,"DIA_Roscoe_ComeAgain_10_00"); //Ancora tu!
};

//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//////////////////////////////////////////////////////////////////////////

// **********************************************
// Erste Warnung
// **********************************************
	const string Roscoe_CHECKPOINT = "NC_HUT22_IN_MOVEMENT";
// **********************************************

instance Info_Roscoe_FirstWarn (C_INFO)
{
	npc			= Org_840_Roscoe;
	nr			= 2;
	condition	= Info_Roscoe_FirstWarn_Condition;
	information	= Info_Roscoe_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Roscoe_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_Roscoe_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Roscoe_FirstWarn_Info_10_00"); //Dove pensi di andare?
	AI_Output (hero, self,"Info_Roscoe_FirstWarn_Info_15_01"); //Voglio incontrare Lares.
	AI_Output (self, hero,"Info_Roscoe_FirstWarn_Info_10_02"); //Lares è qui, ma devi avere un buon motivo per disturbarlo.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Roscoe_LastWarn (C_INFO)
{
	npc			= Org_840_Roscoe;
	nr			= 1;
	condition	= Info_Roscoe_LastWarn_Condition;
	information	= Info_Roscoe_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Roscoe_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		)
	&&  (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Roscoe_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Roscoe_LastWarn_10_00"); //Sei sordo?

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Roscoe_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Roscoe_Attack (C_INFO)
{
	npc			= Org_840_Roscoe;
	nr			= 1;
	condition	= Info_Roscoe_Attack_Condition;
	information	= Info_Roscoe_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Roscoe_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_GetDistToWP(hero,Roscoe_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Roscoe_Attack_Info()
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
