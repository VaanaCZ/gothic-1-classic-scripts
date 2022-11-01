// ************************ EXIT **************************

instance  Tpl_1400_GorNaBar_Exit (C_INFO)
{
	npc			= Tpl_1400_GorNaBar;
	nr			= 999;
	condition	= Tpl_1400_GorNaBar_Exit_Condition;
	information	= Tpl_1400_GorNaBar_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1400_GorNaBar_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1400_GorNaBar_Exit_Info()
{
	AI_Output			(self, other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //Niech Śniący zawsze będzie z tobą!
	AI_StopProcessInfos	( self );
};




// ***************** TEMPLER SAMMELN  *****************************

instance  Tpl_1400_GorNaBar_SUGGEST (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_SUGGEST_Condition;
	information		= Tpl_1400_GorNaBar_SUGGEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potrzebuję twojej pomocy."; 
};

FUNC int  Tpl_1400_GorNaBar_SUGGEST_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1400_GorNaBar_SUGGEST_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //Potrzebuję twojej pomocy.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //Szukam wydzieliny pełzaczy dla Kaloma i chyba wiem już, gdzie znajduje się gniazdo tych drapieżców.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //Możemy na ciebie liczyć, kiedy już odblokujemy prowadzące do niego przejście?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //Gniazdo pełzaczy! Nareszcie! Mój miecz jest na twoje usługi.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaBar);

	B_LogEntry		(CH2_MCEggs,"Na wzmiankę o gnieździe pełzaczy, Gor Na Bar zgodził się dołączyć do oddziału przy bramie Asghana.");
};

// ***************** Infos *****************************

instance  Tpl_1400_GorNaBar_INFO (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_INFO_Condition;
	information		= Tpl_1400_GorNaBar_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Co możesz mi powiedzieć o pełzaczach?";
};

FUNC int  Tpl_1400_GorNaBar_INFO_Condition()
{	
	if ! ( Npc_KnowsInfo (hero, Grd_263_Asghan_NEST ) )
	{
		return 1;
	};
};

FUNC void  Tpl_1400_GorNaBar_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //Co możesz mi powiedzieć o pełzaczach?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //Te bestie muszą mieć gdzieś tutaj swoje gniazdo. Gdyby udało się je znaleźć, moglibyśmy wytępić je za jednym zamachem!
};    


// EIER AM START
instance  Tpl_1400_GorNaBar_VICTORY (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_VICTORY_Condition;
	information		= Tpl_1400_GorNaBar_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalazłem gniazdo królowej!"; 
};

FUNC int  Tpl_1400_GorNaBar_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1400_GorNaBar_VICTORY_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //Znalazłem gniazdo królowej!
	AI_Output			(self, other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //Wykazałeś się odwagą i hartem ducha. Potrzebujemy ludzi takich jak ty!
	
	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Po dostarczeniu jaj powinienem porozmawiać z Cor Angarem. Może pozwoli mi dołączyć do Straży Świątynnej...");
};  
