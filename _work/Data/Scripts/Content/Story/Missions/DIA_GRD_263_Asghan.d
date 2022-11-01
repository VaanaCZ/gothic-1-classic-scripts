
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
	description		= "Tady někde musí být hnízdo důlních červů."; 
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
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Tady někde musí být hnízdo důlních červů.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Celá tahle zpropadená hora je hnízdo červů!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Proč je ta šachta zavřená?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Nemám představu, kolik červů jsme zabili, ale pořád se objevují další a další.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Vypadá to, že tady někde musí být hnízdo. Nech mě otevřít ty vrata!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Ne! Tyhle vrata se smí otevírat jen s Ianovým svolením! Bez něj se nic nesmí udělat!
	
	B_LogEntry		(CH2_MCEggs,"Asghan, velitel důlní stráže, nechce otevřít bránu. Chce vidět Ianovo povolení.");

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
	description		= "Hej, Asghane, máš otevřít ty vrata!"; 
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
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghane, máš otevřít ty vrata!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Už jsem ti jednou řekl, jen s Ianovým...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghane... Všechno jde dobře... a Ian tě pozdravuje.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Jestli je Ian za to zodpovědný.. ale pod jednou podmínkou!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakou podmínkou?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Dáš mi dva nebo tři templáře na pomoc, protože tady nechci být sám, až ze šachty vylezou červi!
	
	B_LogEntry		(CH2_MCEggs,"Třebaže mi Ian dal povolení, Asghan nechce otevřít bránu, dokud nepřivedu nějaké templáře jako posilu před vchod.");

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
	description		= "Všechny přípravy jsou hotovy. Vrata se teď můžou otevřít!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Všechny přípravy jsou hotovy. Vrata se teď můžou otevřít!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Tak dobrá, otevřeme je. Ať to teda začne.
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"Podařilo se mi před Asghanovu bránu přivést dostatečný počet templářů. Co nás čeká v temnotách za branou?");
		
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
	description		= "Důlní červi nebudou už nikdy hrozbou!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Důlní červi nebudou už nikdy hrozbou!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Dobré zprávy. Pošlu k Thorusovi posla!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz läuft noch nicht 						
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
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Hej, jak se máš?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Dobrý... dokud nikdo nedostane nápad otevřít ty vrata, nebudu mít potřebu někomu něco udělat.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Co je na těch vratech tak zvláštního?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Důlní červi. Velcí zlí červi. Hromady, hromady a hromady červů.
};  



































