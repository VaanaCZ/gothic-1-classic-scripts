
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tady n�kde mus� b�t hn�zdo d�ln�ch �erv�."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Tady n�kde mus� b�t hn�zdo d�ln�ch �erv�.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Cel� tahle zpropaden� hora je hn�zdo �erv�!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Pro� je ta �achta zav�en�?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Nem�m p�edstavu, kolik �erv� jsme zabili, ale po��d se objevuj� dal�� a dal��.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Vypad� to, �e tady n�kde mus� b�t hn�zdo. Nech m� otev��t ty vrata!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Ne! Tyhle vrata se sm� otev�rat jen s Ianov�m svolen�m! Bez n�j se nic nesm� ud�lat!
	
	B_LogEntry		(CH2_MCEggs,"Asghan, velitel d�ln� str�e, nechce otev��t br�nu. Chce vid�t Ianovo povolen�.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hej, Asghane, m� otev��t ty vrata!"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghane, m� otev��t ty vrata!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //U� jsem ti jednou �ekl, jen s Ianov�m...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghane... V�echno jde dob�e... a Ian t� pozdravuje.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Jestli je Ian za to zodpov�dn�.. ale pod jednou podm�nkou!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakou podm�nkou?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //D� mi dva nebo t�i templ��e na pomoc, proto�e tady nechci b�t s�m, a� ze �achty vylezou �ervi!
	
	B_LogEntry		(CH2_MCEggs,"T�eba�e mi Ian dal povolen�, Asghan nechce otev��t br�nu, dokud nep�ivedu n�jak� templ��e jako posilu p�ed vchod.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "V�echny p��pravy jsou hotovy. Vrata se te� m��ou otev��t!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //V�echny p��pravy jsou hotovy. Vrata se te� m��ou otev��t!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Tak dobr�, otev�eme je. A� to teda za�ne.
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"Poda�ilo se mi p�ed Asghanovu br�nu p�iv�st dostate�n� po�et templ���. Co n�s �ek� v temnot�ch za branou?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "D�ln� �ervi nebudou u� nikdy hrozbou!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //D�ln� �ervi nebudou u� nikdy hrozbou!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Dobr� zpr�vy. Po�lu k Thorusovi posla!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz l�uft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak to jde?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Hej, jak se m�?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Dobr�... dokud nikdo nedostane n�pad otev��t ty vrata, nebudu m�t pot�ebu n�komu n�co ud�lat.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Co je na t�ch vratech tak zvl�tn�ho?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //D�ln� �ervi. Velc� zl� �ervi. Hromady, hromady a hromady �erv�.
};  



































