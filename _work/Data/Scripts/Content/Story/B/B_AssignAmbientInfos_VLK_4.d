// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_4_EXIT_Condition;
	information	= Info_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Merci. Bonne chance.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Tête haute, mon garçon.
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_4_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_4_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Que dois-je faire pour joindre ce camp ?";
};                       

FUNC INT Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_4_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Que dois-je faire pour joindre ce camp ?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Tu veux dire en tant qu'une ombre ou un garde ? Ce ne sera pas facile, l'ami. Tu devras faire quelques essais avant que le vieux Thorus te laisse voir Gomez.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //Et tu devras être du bon côté ici. Personne ne te prendra au sérieux tant que tu n'auras pas choisi ton camp,
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Si j'étais toi, j'aurais une conversation avec certaines ombres. Peut-être trouveras-tu l'une d'entre elles disposée à t'aider, surtout si tu leur offres quelque chose en échange.
	
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "y a t'il quelqu'un en particulier que je devrais connaître ?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Y a-t-il quelqu'un de particulier que je devrais connaître ?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Étant nouveau, tu n'as pas autre chose faire que d'éviter Gravo. C'est seulement un mineur, mais il sait comment faire des affaires avec les Barons du minerai.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Si tu as des ennuis avec la bande de Gomez, il peut t'aider à t'en sortir.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_4_DasLager_Condition;
	information	= Info_Vlk_4_DasLager_Info;
	permanent	= 1;
	description = "Quels endroits devrais-je connaître ici ?";
};                       

FUNC INT Info_Vlk_4_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Quels endroits devrais-je connaître ici ?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //À moins que tu aimes particulièrement travailler au fond de la mine, tu devrais aller faire un tour entre la porte nord et l'entrée du château.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Si tu as de la chance, Thorus ou Diego pourraient te donner quelque chose à faire pour eux, ce sera une chance d'être de leur côté. Cela te permettrait d'entrer dans la bande à Gomez
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Ou tu pourrais aller voir un Mage. Parfois, ils ont besoin de gens pour leurs faire quelques courses. Et ils payent bien.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Les Mages sortent du château ? Quand ?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //C'est ce que je sais. Demande aux gens d'ici.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_4_DieLage_Condition;
	information	= Info_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Ca va ?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Ca va ?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //Aussi bien que j'étais il y a 20 ans. Pas beaucoup de changements depuis.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc				= Hlp_GetInstanceID(slf);
};
