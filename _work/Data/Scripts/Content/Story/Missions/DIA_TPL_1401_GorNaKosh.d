// ************************ EXIT **************************

instance  Tpl_1401_GorNaKosh_Exit (C_INFO)
{
	npc			= Tpl_1401_GorNaKosh;
	nr			= 999;
	condition	= Tpl_1401_GorNaKosh_Exit_Condition;
	information	= Tpl_1401_GorNaKosh_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1401_GorNaKosh_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1401_GorNaKosh_Exit_Info()
{
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //Kéž Spáè procitne!
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_SUGGEST (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_SUGGEST_Condition;
	information		= Tpl_1401_GorNaKosh_SUGGEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Vím, kde je èerví hnízdo."; 
};

FUNC int  Tpl_1401_GorNaKosh_SUGGEST_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};


FUNC void  Tpl_1401_GorNaKosh_SUGGEST_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //Vím, kde je èerví hnízdo. Jdu tam vzít nìco pro Kaloma, aby mohl pøipravit silnìjší lektvar.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Pak budeš potøebovat mé ostøí. Pøidám se k tobì.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Dobøe. Sejdeme se u velké chodby.
	
	Npc_ExchangeRoutine (self,"GATE");
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaKosh);
	B_LogEntry		(CH2_MCEggs,"Pøesvìdèil jsem templáøe Gora Na Koshe, aby se pøidal k  posádce u Asghanových vrat. Bude tam na mì èekat.");	

	AI_StopProcessInfos	(self);
};

// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_INFO (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_INFO_Condition;
	information		= Tpl_1401_GorNaKosh_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Co tady dìláš?"; 
};

FUNC int  Tpl_1401_GorNaKosh_INFO_Condition()
{	
	if ! ( Npc_KnowsInfo (hero, Grd_263_Asghan_NEST ) )
	{
		return 1;
	};
};

FUNC void  Tpl_1401_GorNaKosh_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //Co tady dìláš?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //Lovím dùlní èervy.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //Mùžeš mi nìco øíci o lovu èervù?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //Pøi lovu èervù si musíš pamatovat jednoduché pravidlo: když je spatøíš, bìž k nim a zabij je, jak nejrychleji umíš.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Bojuj beze strachu a zabíjej bez milosti.

	AI_StopProcessInfos(self);		// SN:nur für die Vermeidung des Bugs, dass der letzte Satz in roter Schrift erscheint, und der InfoManager danach defekt ist
};

// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_CRAWLER (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_CRAWLER_Condition;
	information		= Tpl_1401_GorNaKosh_CRAWLER_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mùžeš mi øíci nìco o tìch èervech?"; 
};

FUNC int  Tpl_1401_GorNaKosh_CRAWLER_Condition()
{	
	if  ( Npc_KnowsInfo (hero, Tpl_1401_GorNaKosh_INFO) )
	{
		return 1;
	};
};

FUNC void  Tpl_1401_GorNaKosh_CRAWLER_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //Mùžeš mi øíci nìco o tìch èervech?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //Chovají se instinktivnì, vše, co není èerv,  zabíjejí.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Tyhle vìdomosti použij v boji proti nim.
}; 

// ***************************** Die Königin ist tot, lang lebe die Königin ****************************************//

instance  Tpl_1401_GorNaKosh_VICTORY (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_VICTORY_Condition;
	information		= Tpl_1401_GorNaKosh_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Našel jsem èerví hnízdo!"; 
};

FUNC int  Tpl_1401_GorNaKosh_VICTORY_Condition()
{	
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 3 ) 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1401_GorNaKosh_VICTORY_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //Našel jsem èerví hnízdo!
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //Výbornì! Teï se vrátíme do tábora a dokonèíme úkol. Cor Kalom nás bude oèekávat!
	B_LogEntry			(CH2_MCEggs,"Mìl bych dát Cor Kalomovi vajíèka, na která èeká.");
};  
