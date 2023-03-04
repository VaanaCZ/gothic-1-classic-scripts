// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_2_EXIT_Condition;
	information	= Info_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_2_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Je veux me joindre à vous.";
};                       

FUNC INT Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //Je veux me joindre à vous.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //Je ne peux pas comprendre pourquoi tu veux travailler dans les mines. Les gens comme toi sont fait pour vivre dans un château rapidement.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige par ici ?";
};                       

FUNC INT Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Ici dans l' Anneau Extérieur, Fletcher, Bloodwyn et Jackal rassemblent l'argent pour la protection. Ils ont chacun leur secteur.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //Si tu es de leur côté, tout ira bien.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_2_DasLager_Condition;
	information	= Info_Vlk_2_DasLager_Info;
	permanent	= 1;
	description = "Je veux en savoir plus sur le Camp.";
};                       

FUNC INT Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //Je veux en savoir plus sur le Camp.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //Tu devrais parler aux Ombres. Elles peuvent te dire tout ce que dois savoir. Mais méfies-toi, la plupart d'entre elles ne sont pas dignes de confiance.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_2_DieLage_Condition;
	information	= Info_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Quelle est la vie ici ?";
};                       

FUNC INT Info_Vlk_2_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //Quelle est la vie ici ?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //Si tu es envoyé par les Barons du minerai, tu leurs diras que je ne veux pas d'ennuis. Je ne parle pas à n'importe qui.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //Je suis satisfait de qu'ils me donnent.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Je ne suis envoyé par personne. Je viens juste d'arriver.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //Un nouveau, hein ? Les nouveaux ont toujours des ennuis rapidement. Je ne veux pas être concerné, d'accord ??
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_2(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
