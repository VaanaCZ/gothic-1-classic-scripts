
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
	description		= "Tady nìkde musí být hnízdo dùlních èervù."; 
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
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Tady nìkde musí být hnízdo dùlních èervù.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Celá tahle zpropadená hora je hnízdo èervù!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Proè je ta šachta zavøená?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Nemám pøedstavu, kolik èervù jsme zabili, ale poøád se objevují další a další.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Vypadá to, že tady nìkde musí být hnízdo. Nech mì otevøít ty vrata!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Ne! Tyhle vrata se smí otevírat jen s Ianovým svolením! Bez nìj se nic nesmí udìlat!
	
	B_LogEntry		(CH2_MCEggs,"Asghan, velitel dùlní stráže, nechce otevøít bránu. Chce vidìt Ianovo povolení.");

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
	description		= "Hej, Asghane, máš otevøít ty vrata!"; 
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
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghane, máš otevøít ty vrata!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Už jsem ti jednou øekl, jen s Ianovým...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghane... Všechno jde dobøe... a Ian tì pozdravuje.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Jestli je Ian za to zodpovìdný.. ale pod jednou podmínkou!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakou podmínkou?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Dáš mi dva nebo tøi templáøe na pomoc, protože tady nechci být sám, až ze šachty vylezou èervi!
	
	B_LogEntry		(CH2_MCEggs,"Tøebaže mi Ian dal povolení, Asghan nechce otevøít bránu, dokud nepøivedu nìjaké templáøe jako posilu pøed vchod.");

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
	description		= "Všechny pøípravy jsou hotovy. Vrata se teï mùžou otevøít!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Všechny pøípravy jsou hotovy. Vrata se teï mùžou otevøít!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Tak dobrá, otevøeme je. A to teda zaène.
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"Podaøilo se mi pøed Asghanovu bránu pøivést dostateèný poèet templáøù. Co nás èeká v temnotách za branou?");
		
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
	description		= "Dùlní èervi nebudou už nikdy hrozbou!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Dùlní èervi nebudou už nikdy hrozbou!
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
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Dobrý... dokud nikdo nedostane nápad otevøít ty vrata, nebudu mít potøebu nìkomu nìco udìlat.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Co je na tìch vratech tak zvláštního?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Dùlní èervi. Velcí zlí èervi. Hromady, hromady a hromady èervù.
};  



































