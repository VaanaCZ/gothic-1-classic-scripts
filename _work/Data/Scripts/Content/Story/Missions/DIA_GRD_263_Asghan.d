
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
	description		= "Deve esserci un nido di pidocchi di miniera, da qualche parte."; 
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
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Deve esserci un nido di pidocchi di miniera da qualche parte.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //L'intera maledetta montagna è un enorme nido!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Perché hai chiuso questo condotto?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Non importa quanti pidocchi di miniera uccidiamo, continuano a spuntarne sempre di nuovi.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Sembra ci sia un nido da queste parti. Fammi aprire il cancello!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //No! Solo Ian può dare il permesso di aprirlo!
	
	B_LogEntry		(CH2_MCEggs,"Asghan, il capo delle guardie della miniera, non aprirà il cancello senza il permesso di Ian.");

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
	description		= "Ehi, Asghan! Ora puoi aprire il cancello!"; 
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
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Ehi, Asghan! Ora puoi aprire il cancello!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Te l'ho già detto: solo Ian...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Andrà tutto bene... Ian ti manda i suoi saluti.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Allora va bene, la responsabilità è sua... Ma a una condizione!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Quale?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Portami due o tre templari di supporto. Non voglio ritrovarmi da solo, quando i pidocchi di miniera usciranno dal condotto!
	
	B_LogEntry		(CH2_MCEggs,"Anche se ho il permesso di Ian, Asghan non aprirà il cancello, almeno finché non gli avrò portato alcuni templari come rinforzo.");

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
	description		= "Tutti i preparativi sono stati completati: il cancello può essere aperto!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Tutti i preparativi sono stati completati: il cancello può essere aperto!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Va bene, aprite il condotto. Che lo spettacolo abbia inizio!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"Sono riuscito a radunare un numero sufficiente di templari di fronte al cancello di Asghan. Cosa ci attende nell'oscurità che abbiamo di fronte?");
		
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
	description		= "I pidocchi di miniera non sono più una minaccia!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //I pidocchi di miniera non sono più una minaccia!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Ottimo! Mando subito un messaggero a Thorus!

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
	description		= "Come va?"; 
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
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Come va?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Bene... Finché a nessuno salta in mente di aprire questo cancello, non devo far del male a nessuno.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Cosa ha di tanto speciale questo cancello?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Pidocchi di miniera, grossi e cattivi. Molti, moltissimi pidocchi.
};  



































