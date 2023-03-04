// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_9_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_9 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_9_EXIT_Condition;
	information	= Info_Bau_9_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Bau_9_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_9_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_9_WichtigePersonen_Condition;
	information	= Info_Bau_9_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui a la tache de surveiller si tout va bien pour le plan dans les champs ?";
};                       

FUNC INT Info_Bau_9_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00"); //Qui a la tache de surveiller si tout va bien pour le plan dans les champs ?
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01"); //Tout le monde ! Le Seigneur du Riz est supposé surveiller notre travail, mais à mon avis il passe toute la journée assis dans son abri à compter ses sacs.
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02"); //Hé bien, lui et Homer ont tout foutu en l'air...
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_9_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_9_DasLager_Condition;
	information	= Info_Bau_9_DasLager_Info;
	permanent	= 1;
	description = "Raconte-moi quel est ce camp.";
};                       

FUNC INT Info_Bau_9_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_9_DasLager_15_00"); //Raconte-moi quel est ce camp.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_01"); //La coupe est pleine avec ces salopards. Si ça ne tenait qu'à moi, j'enverrai les mercenaires virer les bandits hors du Camp.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_02"); //Ils ne font pas leurs parts et n'amènent que des ennuis.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_9_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_9_DieLage_Condition;
	information	= Info_Bau_9_DieLage_Info;
	permanent	= 1;
	description = "Comment vas-tu ?";
};                       

FUNC INT Info_Bau_9_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_9_DieLage_15_00"); //Comment vas-tu ?
	AI_Output(self,other,"Info_Bau_9_DieLage_09_01"); //Nous travaillons dur uniquement pour être sur d'avoir quelque chose à manger !
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_9_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_9_Wasser_Condition;
	information	= Info_Bau_9_Wasser_Info;
	permanent	= 1;
	description = "Lefty m'envoie. Je t'apporte de l'eau.";
};                       

FUNC INT Info_Bau_9_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Bau_9_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_9_Wasser_15_00"); //Lefty m'envoie. Je t'apporte de l'eau.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output			(self,other,"Info_Bau_9_Wasser_09_01"); //Merci, mec ! Encore un peu et je commençais à boire la boue.
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00"); //Tu n'en as plus. J'irai en prendre chez quelqu'un d'autre.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_9(var c_NPC slf)
{
	Info_Bau_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_9_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_9_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_9_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_9_Wasser.npc				= Hlp_GetInstanceID(slf);
};








