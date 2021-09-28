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
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //�Que el Durmiente se despierte!
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
	description		= "S� d�nde est� el nido de los reptadores."; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //S� d�nde est� el nido de los reptadores. Voy a entrar en �l para obtener algo que permita a Kalorn elaborar pociones m�s potentes.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Entonces necesitar�s mi espada. Voy contigo.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Muy bien. Nos vemos en el gran t�nel.
	
	Npc_ExchangeRoutine (self,"GATE");
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaKosh);
	B_LogEntry		(CH2_MCEggs,"He convencido al templario Gor Na Kosh de que se una a los refuerzos en la puerta de Asghan. Me est� esperando all�.");	

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
	description		= "�Qu� est�s haciendo aqu�?"; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //�Qu� est�s haciendo aqu�?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //Cazo reptadores.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //�Hay algo que puedas contarme acerca de la caza de reptadores?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //S�lo hay una cosa que debes recordar cuando est�s cazando reptadores: cuando los veas, corre hacia ellos y m�talos tan r�pido como puedas.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Lucha sin miedo y mata sin piedad.

	AI_StopProcessInfos(self);		// SN:nur f�r die Vermeidung des Bugs, dass der letzte Satz in roter Schrift erscheint, und der InfoManager danach defekt ist
};

// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_CRAWLER (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_CRAWLER_Condition;
	information		= Tpl_1401_GorNaKosh_CRAWLER_Info;
	important		= 0;
	permanent		= 1;
	description		= "�Puedes contarme algo m�s de los reptadores?"; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //�Puedes contarme algo m�s acerca de los reptadores?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //Se mueven por instinto; matan a todo aquello que no sea un reptador.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Haz uso de estos conocimientos cuando te enfrentes a ellos.
}; 

// ***************************** Die K�nigin ist tot, lang lebe die K�nigin ****************************************//

instance  Tpl_1401_GorNaKosh_VICTORY (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_VICTORY_Condition;
	information		= Tpl_1401_GorNaKosh_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "�He encontrado el nido de los reptadores!"; 
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
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //�He encontrado el nido de los reptadores!
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //�Fant�stico! Ahora vuelve al Campamento y acaba con esta misi�n. �Cor Kalorn te estar� esperando!
	B_LogEntry			(CH2_MCEggs,"Tengo que llevarle los huevos a Cor Kalom; los est� esperando.");
};  
