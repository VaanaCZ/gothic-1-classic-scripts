// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_11_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_11 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_11_EXIT_Condition;
	information	= Info_Sld_11_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Sld_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_11_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_11_EinerVonEuchWerden_Condition;
	information	= Info_Sld_11_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Je veux devenir un mercenaire pour les Mages.";
};                       

FUNC INT Info_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00"); //Je veux devenir un mercenaire pour les Mages.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01"); //Ce n'est pas aussi dur. Si tu es disposé à combattre pour notre cause, Lee veut bien te prendre.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02"); //Mais il ne prend que des gens qui sont bons à l'épée. Astucieux, n'est-ce pas?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03"); //Hé bien...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04"); //C'est ce qu'ai pensé. Si tu es vraiment sérieux, parle à Gorn. Il entraîne les nouveaux venus avant.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05"); //Peut-être seras-tu chanceux et il prendra le temps de t'entraîner.
	var C_NPC Gorn;			Gorn	= Hlp_GetNpc(PC_Fighter);
	Gorn.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_11_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_11_WichtigePersonen_Condition;
	information	= Info_Sld_11_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige par ici ?";
};                       

FUNC INT Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01"); //Nous faisons ce que disent les Mages. Mais d'habitude ils ne disent rien. Ils traînent juste du côté du tas de minerai et restent le nez dans leurs livres.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02"); //En fait, Lee est responsable. C'est notre chef.
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_11_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_11_DasLager_Condition;
	information	= Info_Sld_11_DasLager_Info;
	permanent	= 1;
	description = "Il n'y pas d'ennuie dans ce camp ?";
};                       

FUNC INT Info_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00"); //Il n'y pas d'ennuie dans ce camp ?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01"); //C'est toujours le même problème. Les bandits font ce qu'ils veulent et nous les mercenaires devons protéger les Mages et défendre le camp.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_11_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_11_DieLage_Condition;
	information	= Info_Sld_11_DieLage_Info;
	permanent	= 1;
	description = "Ca va ?";
};                       

FUNC INT Info_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00"); //Ca va ?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01"); //Tout est calme maintenant...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02"); //Maintenant?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03"); //Si les bandits continuent à attaquer les convois de Gomez, il ne se passera pas beaucoup de temps avant que lui et son armée ne frappent à nos portes.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04"); //Et cela ne va pas être amusant.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Sld_11_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Sld_11_Krautprobe_Condition;
	information	= Info_Sld_11_Krautprobe_Info;
	permanent	= 1;
	description = "Veux-tu de l'Herbe ?";
};                       

FUNC INT Info_Sld_11_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_11_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00"); //Veux-tu de l'Herbe ?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01"); //Bien sur. Voici 10 minerais
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02"); //Si tu en as encore, n'hésite pas...
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_11_Krautprobe_No_Joint_11_00"); //Donne-moi quelque chose, alors nous parlerons.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Sld_11(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Sld_11_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_11_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_11_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_11_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Sld_11_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Sld_11_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
