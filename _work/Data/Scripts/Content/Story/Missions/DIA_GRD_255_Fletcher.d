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
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Kdo? J�?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //V�ak ty v�, s k�m mluv�m, zlat��ko!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Mus�m ti n�co ��ci. Tohle je M�J obvod a nechci tu ��dn� probl�my!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Nov��ci jako ty m�vaj� v�dycky probl�my. Obzvl᚝, kdy� se tu motaj� v noci.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Tak rad�ji b�, a a� u� t� tu nevid�m! Naproti ar�n� je pr�zdn� chatr�, v kter� je pelest. Trochu se vyspi.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //A jestli t� chyt�m v n�jak� jin� chatr�i, osobn� dohl�dnu na to, abys toho litoval.
	
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
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Jestli jde� d�t pen�ze za ochranu - pak sis zvolil �patn� den.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Tak? Co to m� znamenat?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Proto�e u� tady nejsem.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Aha...",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Tak jak to, �e tady s tebou mluv�m?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Och, a kde teda potom jsi?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Och, a kde teda potom jsi?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Moment�ln� jsem na hrad�, sed�m u velk�ho t�borov�ho ohn� a piju d�b�nky piva.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Tak jak to, �e tady s tebou mluv�m?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Zmizel Nek. Za tenhle obvod obvykle zodpov�d� on.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dokud se znovu neobjev�, Thorus MI p�ik�zal, abych tu d�lal str�.
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
	description		= "V�, kam zmizel Nek?";
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
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //V�, kam zmizel Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Ne, a ani ho nebudu hledat.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Pokud by o tom mohl v t�hle �tvrti n�kdo n�co v�d�t, pak jsou to kop��i. Ti ale se str�emi nemluv�.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Obzvl᚝ ne te�, kdy� v�d�, jak j� tuhle �pinavou pr�ci nen�vid�m. Vsad�m se, �e se mi vysm�vaj� za z�dama.
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Mo�n� budou kop��i z oblasti ar�ny v�d�t, kam zmizel Nek.");
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
	description		= "Pro� p�esto nevybere� n�jak� pen�ze za ochranu?";
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
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Pro� p�esto nevybere� n�jak� pen�ze za ochranu?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek u� je vybral, ne� zmizel. U� toho moc nezbylo, aby se je�t� vyb�ralo.
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
	description		= "Co se t��e Neka...";
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
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Co se t��e Neka...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Jist�?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Mysl�m, �e v�m, kde je.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Co�e? A kde je?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Je z n�j �r�dlo pro krysy...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //Ach ne! Sakra! To znamen�, �e se tu te� budu muset ukazovat. Doufal jsem, �e se vr�t� zp�tky.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //A m�me tu probl�m.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //��dn� zpr�vy.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Po��d m� informuj.
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
	description		= "Co je to za probl�m?";
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
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Co je to za probl�m?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Jsem dlu�n� Scattymu, a to po��dn�. Te� se dozv�, �e d�l�m Nekovu pr�ci a bude sem chodit ka�d� den...
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
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Pochopil jsi rychle, jak to tu chod�. V�tej mezi str�e!
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
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zr�dce! Myslet si, �e nech�me takov� jako ty, aby se k n�m p�idali. BRR!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //Je to jeden z t�ch zr�dn�ch m�g� Ohn�! BRR!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Zdar, zr�d�e! To, �es byl jedn�m z Gomezov�ch St�n�, ti te� nepom��e!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Moment. Jak to mysl�, Fletchere?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Pat�� k t� �el�dce z Nov�ho t�bora, vi�?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zadr�...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Myslel sis, �e na to nep�ijdeme, co?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //No tak... Zadr�!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ne, TY zadr� - a dr� si pevn� hlavu! Proto�e o n� co nevid�t p�ijde�!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //SMRT ZR�DCI!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn se opevnil u zadn� br�ny. Zachoval se stejn� jako Fletcher, kter� te� st�e�� hlavn� br�nu. Nev�m sice jak, ale mus� to n�jak souviset s m�m hled�n�m ohniska v pro Nov� t�bor.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, kter� se skupinou voj�k� st�e�� hlavn� br�nu Star�ho t�bora, m� nazval zr�dcem a odpadl�kem. Ani m� nevyslechl a za�to�il na m�!");
			B_LogEntry			(CH4_BannedFromOC,"Vypad� to, �e jsem vyho�t�n ze Star�ho t�bora.");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Pod�vej se na to. Je to chlap z Nov�ho t�bora!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Pod�vej se na to. Je to chlap z t�bora od ba�in!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //A co? Co tady pohled�v�?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //V� d�l bude zanedlouho n�.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Jo? P�kn� sen!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Promi�, ale nem��u riskovat, �e to �ekne� n�komu dal��mu!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zadr�, nechci ��dn� probl�my!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Na to's m�l myslet d��v, ne� ses tu uk�zal!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co m� tahle h�dka...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Poj�te, ho�i, chytneme ho!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verst�rkung vor das Haupttor (Anf�hrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Br�ny Star�ho t�bora jsou nyn� uzav�eny a hl�d�ny str�emi. Napadaj� ka�d�ho, kdo se p�ibl�� k t�boru.");
	};
	
	AI_StopProcessInfos	(self);
};

