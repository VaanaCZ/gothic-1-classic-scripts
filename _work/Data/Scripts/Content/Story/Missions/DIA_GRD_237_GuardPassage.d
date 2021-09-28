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
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_01"); //Nem�l bys tu z�st�vat. Za t�mhle z�tarasem za��n� zem� sk�et�!
	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_02"); //Je to nebezpe�n�?
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_03"); //�ekn�me to takhle: m��e� mi d�t v�echnu svoji rudu, ne� tam p�jde� a sk�eti t� rozs�pou na kusy!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Grd_237_CHECKPOINT);

	Info_ClearChoices	(Info_Grd_237_FirstWarn);
	Info_AddChoice		(Info_Grd_237_FirstWarn,"Nemysl�m, �e to chci ud�lat!",		Info_Grd_237_FirstWarn_Info_NO);	
	Info_AddChoice		(Info_Grd_237_FirstWarn,"Jist�, tady je moje ruda!",				Info_Grd_237_FirstWarn_Info_YES);	
	Info_AddChoice		(Info_Grd_237_FirstWarn,"Mysl�m, �e by bylo lep��, kdybych se vr�til.",	Info_Grd_237_FirstWarn_Info_RETREAT);	
};

func void Info_Grd_237_FirstWarn_Info_RETREAT ()
{
	Info_ClearChoices	(Info_Grd_237_FirstWarn);

	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_04"); //Mysl�m, �e by bylo lep��, kdybych se vr�til.
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_05"); //�koda, r�d bych opatroval tvoji rudu.

	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos	(self);
};	

func void Info_Grd_237_FirstWarn_Info_YES ()
{
	Info_ClearChoices	(Info_Grd_237_FirstWarn);

	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_06"); //Jist�, tady je moje ruda!
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_07"); //Och, to je od tebe nesm�rn� zdvo�il�.
	
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

	AI_Output			(hero, self,"Info_Grd_237_FirstWarn_15_08"); //Nemysl�m, �e to chci ud�lat!
	AI_Output			(self, hero,"Info_Grd_237_FirstWarn_07_09"); //V tom p��pad� bys u� nem�l ud�lat ani krok!

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
	AI_Output (self, hero,"Info_Grd_237_LastWarn_07_01"); 		//Jsi hluch�? Je�t� krok a je z tebe potrava pro �ervy!

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
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zur�ckgeben
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};
