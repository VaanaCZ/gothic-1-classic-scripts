// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_5_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_5 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_5_EXIT_Condition;
	information	= Info_Nov_5_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Nov_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_5_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_5_EinerVonEuchWerden_Condition;
	information	= Info_Nov_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Comment puis-je rejoindre ce camp ?";
};                       

FUNC INT Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //Comment puis-je rejoindre ce camp ?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //Il n'y a rien de plus simple. Parle simplement à un couple de jeune Sages. Ils t'aideront.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //Tu vas apprécier cet endroit, tu verras.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_5_WichtigePersonen_Condition;
	information	= Info_Nov_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige par ici ?";
};                       

FUNC INT Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //Les Sages contrôlent tout. Mais si tu ne fais pas le malin, ils te laisseront tranquille.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_5_DasLager_Condition;
	information	= Info_Nov_5_DasLager_Info;
	permanent	= 1;
	description = "Que peux-tu me dire sur ce camp ?";
};                       

FUNC INT Info_Nov_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //Que peux-tu me dire sur ce camp ?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //C'est le meilleur endroit dans toute cette satanée colonie.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Même si tu ne crois pas aux enseignements du Dormeur, au moins tu as droit à ta ration quotidienne de nourriture et d'Herbe. Tout ce que tu a à faire c'est de parler à  Fortuno.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Où puis-je le trouver ?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04"); //En bas du laboratoire de Cor Kalom, prés de la court du temple.
	
	var C_NPC CorKalom;		CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_5_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_5_DieLage_Condition;
	information	= Info_Nov_5_DieLage_Info;
	permanent	= 1;
	description = "Comment vont les choses ?";
};                       

FUNC INT Info_Nov_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //Comment vont les choses ?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //Je ne peux pas me plaindre. Dit-moi, tu es nouveau ici ?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //Je viens juste d'arriver.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_5(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
