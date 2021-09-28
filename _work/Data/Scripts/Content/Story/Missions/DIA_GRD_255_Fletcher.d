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
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Hej, ty!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Kdo? J·?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Vöak ty vÌö, s k˝m mluvÌm, zlatÌËko!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //MusÌm ti nÏco ¯Ìci. Tohle je MŸJ obvod a nechci tu û·dnÈ problÈmy!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Nov·Ëci jako ty mÌvajÌ vûdycky problÈmy. Obzvl·öù, kdyû se tu motajÌ v noci.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Tak radÏji bÏû, a aù uû tÏ tu nevidÌm! Naproti arÈnÏ je pr·zdn· chatrË, v kterÈ je pelest. Trochu se vyspi.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //A jestli tÏ chytÌm v nÏjakÈ jinÈ chatrËi, osobnÏ dohlÌdnu na to, abys toho litoval.
	
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
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Hej, ty!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Jestli jdeö d·t penÌze za ochranu - pak sis zvolil öpatn˝ den.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Tak? Co to m· znamenat?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Protoûe uû tady nejsem.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Aha...",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Tak jak to, ûe tady s tebou mluvÌm?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Och, a kde teda potom jsi?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Och, a kde teda potom jsi?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Moment·lnÏ jsem na hradÏ, sedÌm u velkÈho t·borovÈho ohnÏ a piju dûb·nky piva.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Tak jak to, ûe tady s tebou mluvÌm?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Zmizel Nek. Za tenhle obvod obvykle zodpovÌd· on.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dokud se znovu neobjevÌ, Thorus MI p¯ik·zal, abych tu dÏlal str·û.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Aha.
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
	description		= "VÌö, kam zmizel Nek?";
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
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //VÌö, kam zmizel Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Ne, a ani ho nebudu hledat.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Pokud by o tom mohl v tÈhle Ëtvrti nÏkdo nÏco vÏdÏt, pak jsou to kop·Ëi. Ti ale se str·ûemi nemluvÌ.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Obzvl·öù ne teÔ, kdyû vÏdÌ, jak j· tuhle öpinavou pr·ci nen·vidÌm. VsadÌm se, ûe se mi vysmÌvajÌ za z·dama.
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Moûn· budou kop·Ëi z oblasti arÈny vÏdÏt, kam zmizel Nek.");
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
	description		= "ProË p¯esto nevybereö nÏjakÈ penÌze za ochranu?";
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
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //ProË p¯esto nevybereö nÏjakÈ penÌze za ochranu?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek uû je vybral, neû zmizel. Uû toho moc nezbylo, aby se jeötÏ vybÌralo.
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
	description		= "Co se t˝Ëe Neka...";
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
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Co se t˝Ëe Neka...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //JistÏ?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //MyslÌm, ûe vÌm, kde je.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Coûe? A kde je?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Je z nÏj ûr·dlo pro krysy...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //Ach ne! Sakra! To znamen·, ûe se tu teÔ budu muset ukazovat. Doufal jsem, ûe se vr·tÌ zp·tky.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //A m·me tu problÈm.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //é·dnÈ zpr·vy.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Po¯·d mÏ informuj.
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
	description		= "Co je to za problÈm?";
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
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Co je to za problÈm?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Jsem dluûn˝ Scattymu, a to po¯·dnÏ. TeÔ se dozvÌ, ûe dÏl·m Nekovu pr·ci a bude sem chodit kaûd˝ den...
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
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Pochopil jsi rychle, jak to tu chodÌ. VÌtej mezi str·ûe!
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
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zr·dce! Myslet si, ûe nech·me takovÈ jako ty, aby se k n·m p¯idali. BRR!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //Je to jeden z tÏch zr·dn˝ch m·g˘ OhnÏ! BRR!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Zdar, zr·dËe! To, ûes byl jednÌm z Gomezov˝ch StÌn˘, ti teÔ nepom˘ûe!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Moment. Jak to myslÌö, Fletchere?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Pat¯Ìö k tÈ Ëel·dce z NovÈho t·bora, viÔ?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zadrû...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Myslel sis, ûe na to nep¯ijdeme, co?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //No tak... Zadrû!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ne, TY zadrû - a drû si pevnÏ hlavu! Protoûe o nÌ co nevidÏt p¯ijdeö!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //SMRT ZR¡DCI!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn se opevnil u zadnÌ br·ny. Zachoval se stejnÏ jako Fletcher, kter˝ teÔ st¯eûÌ hlavnÌ br·nu. NevÌm sice jak, ale musÌ to nÏjak souviset s m˝m hled·nÌm ohniska v pro Nov˝ t·bor.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, kter˝ se skupinou voj·k˘ st¯eûÌ hlavnÌ br·nu StarÈho t·bora, mÏ nazval zr·dcem a odpadlÌkem. Ani mÏ nevyslechl a za˙toËil na mÏ!");
			B_LogEntry			(CH4_BannedFromOC,"Vypad· to, ûe jsem vyhoötÏn ze StarÈho t·bora.");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //PodÌvej se na to. Je to chlap z NovÈho t·bora!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //PodÌvej se na to. Je to chlap z t·bora od baûin!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //A co? Co tady pohled·v·ö?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //V·ö d˘l bude zanedlouho n·ö.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Jo? PÏkn˝ sen!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //PromiÚ, ale nem˘ûu riskovat, ûe to ¯ekneö nÏkomu dalöÌmu!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zadrû, nechci û·dnÈ problÈmy!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Na to's mÏl myslet d¯Ìv, neû ses tu uk·zal!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co m· tahle h·dka...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //PojÔte, hoöi, chytneme ho!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verst‰rkung vor das Haupttor (Anf¸hrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verst‰rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verst‰rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verst‰rkung vor das Haupttor (Fernk‰mpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regul‰re Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regul‰re Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Br·ny StarÈho t·bora jsou nynÌ uzav¯eny a hlÌd·ny str·ûemi. NapadajÌ kaûdÈho, kdo se p¯iblÌûÌ k t·boru.");
	};
	
	AI_StopProcessInfos	(self);
};

