// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_8_EXIT_Condition;
	information	= Info_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Avez-vous besoin d'un autre homme qualifié ?";
};                       

FUNC INT Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Avez-vous besoin d'un autre homme qualifié ?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee ne prendrait pas n'importe quels mercenaires à moins qu'ils n'aient été ici pendant des années et qu'ils aient beaucoup d'expérience..
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Si tu veux rester dans le camp, tu devras d'abord te battre avec les bandits.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_8_WichtigePersonen_Condition;
	information	= Info_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige par ici ?";
};                       

FUNC INT Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //Nous autres mercenaires suivons tous Lee. Il a fait un pacte avec les Mages - nous les protégeons, ils nous permettent de sortir..
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //Est-ce que les Mages sont réellement responsables?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Non. Personne n'est responsable dans le camp. ici, la plupart des personnes sont juste des gens qui ne pourraient pas ou ne resteraient pas dans le Vieux camp.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //Nous faisons tous nos affaires ici, et nous sommes d'accord sur une seule chose : il vaut mieux faire un tas de minerai et souffler dessus que de l'envoyer sur ce sacré roi !!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_8_DasLager_Condition;
	information	= Info_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Que peux-tu me dire sur ce camp ?";
};                       

FUNC INT Info_Sld_8_DasLager_Condition()
{	
	if (!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};
FUNC VOID Info_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Que peux-tu me dire sur ce camp ?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Regarde bien dehors pendant que tu es là. Il y a beaucoup de coupe-gorge autour du camp.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //Nous avons un certain nombre de lois non écrites. Un: seuls les mercenaires peuvent entrer dans la zone des Mages.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Deux:si tu essayes d'aller faire un tour du côté du tas de minerai, tu es un homme mort! Trois: n'essaye pas d'entrer dans la taverne  du lac.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Tu vois, c'est la taverne des bandits et ils n'aiment être épié pas des morveux comme toi.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_8_DieLage_Condition;
	information	= Info_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Comment va ?";
};                       

FUNC INT Info_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Comment va ?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Comme toujours. Assure-toi que personne ne s'approche trop des Mages ou du minerai.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Sld_8_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Sld_8_Krautprobe_Condition;
	information	= Info_Sld_8_Krautprobe_Info;
	permanent	= 1;
	description = "J'ai de l'Herbe ici - Tu en veux ?";
};                       

FUNC INT Info_Sld_8_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //J'ai de l'Herbe ici - Tu en veux ?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Pourquoi pas? Je te donnerais 10 minerais pour ça.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Va et demande aux autres, ils sont là pour ça aussi.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Montre moi l'Herbe d'abord. C'est tout ce que tu as ?
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Sld_8(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Sld_8_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
