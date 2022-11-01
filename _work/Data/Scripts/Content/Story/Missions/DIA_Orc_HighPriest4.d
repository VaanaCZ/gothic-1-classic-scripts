
// *********************** PRIESTER 4 ***********************

INSTANCE Info_HighPriest4 (C_INFO)
{
	npc			= ORC_Priest_4;
	nr			= 1;
	condition	= Info_HighPriest4_Condition;
	information	= Info_HighPriest4_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest4_Condition()
{
	return 1;
};

FUNC VOID Info_HighPriest4_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output			(self, other,"Info_HighPriest4_17_01"); //¡TUUUU LAAAAAARGO VIAAAAJEEE LLEEEEEGARÁ A SU FIIIIIN!
	AI_Output			(self, other,"Info_HighPriest4_17_02"); //¡TUUU CUUUUUERPOOO MOOORTAAAL AAAARDERÁ!
	AI_Output			(other, self,"Info_HighPriest4_15_03"); //¡Mira, eso no me parece una buena idea!
	
	B_LogEntry			(CH4_EnterTemple,"Varrag-Ruuushk, uno de los chamanes no-muertos de la invocación del Durmiente, se ha cruzado en mi camino, pero no va a detenerme. ¡Ya me encargaré!");
	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

