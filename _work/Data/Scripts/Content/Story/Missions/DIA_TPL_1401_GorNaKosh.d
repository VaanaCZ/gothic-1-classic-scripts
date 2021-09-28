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
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //¡Que el Durmiente se despierte!
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
	description		= "Sé dónde está el nido de los reptadores."; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //Sé dónde está el nido de los reptadores. Voy a entrar en él para obtener algo que permita a Kalorn elaborar pociones más potentes.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Entonces necesitarás mi espada. Voy contigo.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Muy bien. Nos vemos en el gran túnel.
	
	Npc_ExchangeRoutine (self,"GATE");
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaKosh);
	B_LogEntry		(CH2_MCEggs,"He convencido al templario Gor Na Kosh de que se una a los refuerzos en la puerta de Asghan. Me está esperando allí.");	

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
	description		= "¿Qué estás haciendo aquí?"; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //¿Qué estás haciendo aquí?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //Cazo reptadores.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //¿Hay algo que puedas contarme acerca de la caza de reptadores?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //Sólo hay una cosa que debes recordar cuando estés cazando reptadores: cuando los veas, corre hacia ellos y mátalos tan rápido como puedas.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Lucha sin miedo y mata sin piedad.

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
	description		= "¿Puedes contarme algo más de los reptadores?"; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //¿Puedes contarme algo más acerca de los reptadores?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //Se mueven por instinto; matan a todo aquello que no sea un reptador.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Haz uso de estos conocimientos cuando te enfrentes a ellos.
}; 

// ***************************** Die Königin ist tot, lang lebe die Königin ****************************************//

instance  Tpl_1401_GorNaKosh_VICTORY (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_VICTORY_Condition;
	information		= Tpl_1401_GorNaKosh_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡He encontrado el nido de los reptadores!"; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //¡He encontrado el nido de los reptadores!
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //¡Fantástico! Ahora vuelve al Campamento y acaba con esta misión. ¡Cor Kalorn te estará esperando!
	B_LogEntry			(CH2_MCEggs,"Tengo que llevarle los huevos a Cor Kalom; los está esperando.");
};  
