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
// 						Bin Sch�rfer
// ************************************************************

INSTANCE DIA_Org_876_AmSfb (C_INFO)
{
	npc			= Org_876_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_876_AmSfb_Condition;
	information	= DIA_Org_876_AmSfb_Info;
	permanent	= 1;
	description = "Jestem Kretem i chc� si� napi�!";
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
	AI_Output (other, self,"DIA_Org_876_AmSfb_15_00"); //Jestem Kretem, i chc� si� napi�!
	
	var C_ITEM myarmor;
	
	myarmor = Npc_GetEquippedArmor(hero);
	if (Hlp_IsItem(myarmor, SFB_ARMOR_L))
	{
		AI_Output (self, other,"DIA_Org_876_AmSfb_06_01"); //Rzeczywi�cie, wygl�dasz mi na jednego z tych brudnych szczur�w. W�a�!
		self.aivar[AIV_PASSGATE] = TRUE;	
		
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_AmSfb_NOSFB_06_00"); //Nie wygl�dasz mi na Kreta. Tak �atwo si� tu nie dostaniesz, ch�opcze.
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
	description = "Mo�e par� bry�ek rudy za�atwi spraw�?";
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
	AI_Output (other, self,"DIA_Org_876_Bribe_15_00"); //Mo�e par� bry�ek rudy za�atwi spraw�?
	AI_Output (self, other,"DIA_Org_876_Bribe_06_01"); //Par�, to znaczy ile?
	
	Info_ClearChoices	(DIA_Org_876_Bribe );
	Info_AddChoice		(DIA_Org_876_Bribe,"100 bry�ek powinno wystarczy�?",DIA_Org_876_Bribe_100Erz);
	Info_AddChoice		(DIA_Org_876_Bribe,"Co by� powiedzia� na 50 bry�ek?",DIA_Org_876_Bribe_50Erz);
	Info_AddChoice		(DIA_Org_876_Bribe,"Mam przy sobie 10 bry�ek - oto one.",DIA_Org_876_Bribe_10Erz);
};

func void DIA_Org_876_Bribe_10Erz()
{
	AI_Output (other, self,"DIA_Org_876_Bribe_10Erz_15_00"); //Mam przy sobie 10 bry�ek - oto one.
	if (Npc_HasItems (other, itminugget) >= 10)
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_10Erz_06_01"); //Za 10 bry�ek mog� nie obi� ci buzi i pozwoli� jeszcze raz spr�bowa� mnie przekupi�.
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_10Erz_06_02"); //Gdzie? Nie widz� �adnych 10 bry�ek!
	};
	
	AI_StopProcessInfos	(self);
};

func void DIA_Org_876_Bribe_50Erz()
{
	AI_Output (other, self,"DIA_Org_876_Bribe_50Erz_15_00"); //Co by� powiedzia� na 50 bry�ek?
	if (Npc_HasItems (other, itminugget) >= 50)
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_50Erz_06_01"); //To jaka� po�owa tego, co w tych stronach nazywamy "paroma bry�kami"!
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_50Erz_06_02"); //Niby gdzie? Nie widz� �adnych 50 bry�ek.
	};
	
	AI_StopProcessInfos	(self);
};

func void DIA_Org_876_Bribe_100Erz()
{
	AI_Output (other, self,"DIA_Org_876_Bribe_100Erz_15_00"); //100 bry�ek powinno wystarczy�?
	if (Npc_HasItems (other, itminugget) >= 100)
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_100Erz_06_01"); //�wi�te s�owa - mo�esz wej��.
		self.aivar[AIV_PASSGATE] = TRUE;	
		B_GiveInvItems	(other, self, ItMiNugget, 100);
	}
	else
	{
		AI_Output (self, other,"DIA_Org_876_Bribe_100Erz_06_02"); //To fakt, ale obawiam si�, �e nie masz tyle przy sobie.
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
	description = "Jak tam sprzeda� ry��wki?";
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
	AI_Output (other, self,"DIA_Org_876_PERM_15_00"); //Jak tam sprzeda� ry��wki?
	AI_Output (self, other,"DIA_Org_876_PERM_06_01"); //Pogadaj z Silasem. MY nie narzekamy.
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
	AI_Output (self, other,"DIA_Org_876_ScSld_06_00"); //St�j! Znasz zasady - tylko Krety i Szkodniki!
	AI_Output (other, self,"DIA_Org_876_ScSld_15_01"); //A co, spr�bujesz mnie powstrzyma�?
	AI_Output (self, other,"DIA_Org_876_ScSld_06_02"); //Nie... Wchod�...
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
	AI_Output (self, other,"DIA_Org_876_ScSekte_06_00"); //Zwykle wpuszczamy tu tylko naszych ludzi, ale nie mamy nic przeciwko odwiedzinom cz�onk�w Bractwa.
	AI_Output (self, other,"DIA_Org_876_ScSekte_06_01"); //Zw�aszcza, je�li maj� przy sobie co� do palenia.
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
	description = "Co� si� pewnie znajdzie. Prosz�, to dla ciebie.";
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
	AI_Output (other, self,"DIA_Org_876_GibKraut_15_00"); //Co� si� pewnie znajdzie. Prosz�, to dla ciebie.

	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems	(other, self,ItMiJoint_1, 1); }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems	(other, self,ItMiJoint_2, 1); }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems	(other, self,ItMiJoint_3, 1); };
		
		AI_Output (self, other,"DIA_Org_876_GibKraut_06_01"); //Zawsze jeste� mile widzianym go�ciem.
		self.aivar[AIV_PASSGATE] = TRUE;
		Org_876_GotJoint = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Org_876_GibKraut_KEIN_15_00"); //Cholera, czekaj. Chyba jednak nie mam nic przy sobie.
		AI_Output (self, other,"DIA_Org_876_GibKraut_KEIN_06_00"); //Trudno. Pami�taj o mnie nast�pnym razem.
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
//	1.	N�hert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	N�hert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	N�hert er sich trotzdem wieder, wird er angegriffen
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

	AI_Output (self, hero,"Info_Org_876_FirstWarn_Info_06_00"); //A dok�d to si� wybieramy?
	AI_Output (hero, self,"Info_Org_876_FirstWarn_Info_15_01"); //Noo... Do �rodka?
	AI_Output (self, hero,"Info_Org_876_FirstWarn_Info_06_02"); //Nie �artuj. Silas wpuszcza do siebie tylko Krety i Szkodniki.

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
	AI_Output (self, hero,"Info_Org_876_LastWarn_06_00"); //Og�uch�e�, czy co?!

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
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zur�ckgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};
