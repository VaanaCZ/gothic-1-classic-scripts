// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Qu'est ce que je dois faire pour être accepté comme un des gardes de Gomez ?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Qu'est ce que je dois faire pour être accepté comme un des gardes de Gomez ?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Toi ?! Tu plaisantes. Tu penses que tu peux juste te pavaner et arriver directement en haut ou quoi ?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez a seulement les meilleurs comme gardes.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Tu vas devoir travailler comme tout le monde, et prouver ta loyauté comme Ombre.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige par ici ?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus contrôle tous ceux du Camp. Diego est son lieutenant.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Si tu veux arriver quelque part ici, C'est à eux qu'il faut parler.
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "Tous les gens ici travaillent pour Gomez ?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Tous les gens ici travaillent pour Gomez ?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Non. Beaucoup d'entre eux sont juste de simples mineurs.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Seuls nous, les gardes, et les Ombre sont avec Gomez.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"RETOUR", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Que font les Gardes ?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Que font les Ombres ?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Que font les Mineurs ?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Que font les Gardes ?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Nous gardons le Camp et protégeons les mineurs.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Nous sommes payés par Gomez et les mineurs nous payent une protection. C'est une affaire plutôt lucrative.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Que font les Ombres ?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Les Ombres regardent si les ordres de Gomez sont respectés.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //La plupart sont de simples lèche-bottes essayant de grimper les échelons. Si tu veux y arriver par ici, c'est la seule manière.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Tu fais ton boulot assez longtemps sans faillir, et tu peux devenir l'un d'entre nous.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Une fois avec Gomez, personne dans la colonie entière ne te jettera plus dehors, petit !
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Que font les Mineurs ?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //C'est une bonne question ! Nous ne devrions pas laisser ces bouseux en dehors de la mine.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Quand ils sont restés dans la mine un certain temps ils sortent et dépensent leurs magots.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Une fois qu'ils ont tout dilapidé, ils reviennent à la mine. C'est ce que la plupart des gens fait par ici.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Il semble que tu veuilles plus que balancer une pioche. Tu devrais parler à Thorus, si tu ne l'a pas déjà fait.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "Comment va ?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Comment va ?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Pour toi, tu veux dire ? Tant que tu n'auras pas rejoint un camp, personne ne te prendra au sérieux, petit !
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
