// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

INSTANCE Info_SFB_5_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_5_Pre_Condition;
	information	= Info_SFB_5_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_5_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Bonjour !
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_5_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_5_EXIT_Condition;
	information	= Info_SFB_5_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_SFB_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_5_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_5_EinerVonEuchWerden_Condition;
	information	= Info_SFB_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Et si je veux me joindre à vous ?";
};                       

FUNC INT Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Est-ce que je peux me joindre à vous?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Nous rejoindre? comme quoi, un porteur d'eau?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Non, comme gratteur.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Ecoute, je vais te dire quelque chose: personne ne veut devenir un gratteur.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Bien sûr, si tu insiste... Va parler à Swiney, je suis sur qu'il aura une pioche à partager.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_5_WichtigePersonen_Condition;
	information	= Info_SFB_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui est important ici ?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Qui est important ici ?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Qui est important? Moi, naturellement!
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Mais j'imagine que tu sais qui a fait le coup.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Et bien, je pense que tu devrais parler aux mercenaires ou aux bandits. Tu ne pourras même pas passer du côté des Mages de l'eau.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Que cet idiot de Swiney le pense est plus important que ça ne l'est vraiment. Il va juste trier les pioches et faire ce qu'Okyl lui demande.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_5_DasLager_Condition;
	information	= Info_SFB_5_DasLager_Info;
	permanent	= 1;
	description = "Qu'est ce que le Camp a à m'offrir ?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Qu'est ce que le Camp a à m'offrir ?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Quoique tu fasses. Pour certains rien à part le travail, pour d'autres c'est un jeu d'enfer.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_5_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_5_DieLage_Condition;
	information	= Info_SFB_5_DieLage_Info;
	permanent	= 1;
	description = "Quelle est la vie ici ?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Quelle est la vie ici ?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Formidable!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //Et c'est parce que nous sommes tellement heureux ici que nous faisons de notre mieux pour partir.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Que penses-tu de cet endroit? C'est une prison et je ne connais personne qui aime vivre en prison.
	
};	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_5(var c_NPC slf)
{

	Info_SFB_5_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
