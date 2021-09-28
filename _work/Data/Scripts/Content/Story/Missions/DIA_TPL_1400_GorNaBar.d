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
	AI_Output			(self, other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //¡Que el Durmiente te proteja!
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
	description		= "Necesito tu ayuda."; 
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
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //Necesito tu ayuda.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //Estoy buscando secreciones para Kalorn y creo que sé dónde se encuentra el nido de reptadores.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //Si nos abrimos paso, ¿vendrás con nosotros?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //¡El nido de reptadores! ¡Por fin, mi espada está a tu servicio!

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaBar);

	B_LogEntry		(CH2_MCEggs,"Al mencionar el nido de los reptadores de la mina, el templario Gor Na Bar se ha unido a mis refuerzos en la puerta de Asghan. Allí lo encontraré.");
};

// ***************** Infos *****************************

instance  Tpl_1400_GorNaBar_INFO (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_INFO_Condition;
	information		= Tpl_1400_GorNaBar_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "¿Qué sabes de los reptadores de la mina?";
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
	AI_Output			(other, self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //¿Qué sabes acerca de los reptadores de la mina?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //Los reptadores deben tener un nido en alguna parte. ¡Si supiéramos dónde, podríamos destruir a toda la nidada!
};    


// EIER AM START
instance  Tpl_1400_GorNaBar_VICTORY (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_VICTORY_Condition;
	information		= Tpl_1400_GorNaBar_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡He encontrado el nido de la reina!"; 
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
	AI_Output			(other, self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //¡He encontrado el nido de la reina!
	AI_Output			(self, other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //Has demostrado poseer espíritu y coraje. ¡Necesitamos gente como tú!
	
	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Después de traer los huevos, debo hablar con Cor Angar. Quizá él me permita unirme a los templarios.");
};  
