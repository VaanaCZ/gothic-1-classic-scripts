// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_4_EXIT_Condition;
	information	= Info_Bau_4_EXIT_Info;
	permanent	= 1;
	description = "FINE";
};                       

FUNC INT Info_Bau_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_4_WichtigePersonen_Condition;
	information	= Info_Bau_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi è il capo?";
};                       

FUNC INT Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00"); //Chi è il capo?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01"); //Il Signore del Riso. Però molti lavorano per lui solo perché ne hanno paura.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02"); //Non io. Ho girato per alcuni anni e sono stanco di essere attaccato dai ladri del campo! La risaia è il posto giusto per me.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_4_DasLager_Condition;
	information	= Info_Bau_4_DasLager_Info;
	permanent	= 1;
	description = "C'è qualcosa che devo ancora sapere su questo posto?";
};                       

FUNC INT Info_Bau_4_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00"); //C'è qualcosa che devo ancora sapere su questo posto?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01"); //Fai attenzione al campo, ragazzo! È infestato di tagliagole, che aspettano solo di mettere le mani addosso ai nuovi arrivati come te.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_4_DieLage_Condition;
	information	= Info_Bau_4_DieLage_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT Info_Bau_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01"); //C'è un sacco di lavoro. Abbiamo bisogno di tantissimo riso, per nutrire tutta questa gente.
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_4_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_4_Wasser_Condition;
	information	= Info_Bau_4_Wasser_Info;
	permanent	= 1;
	description = "Mi manda Lefty. Ti ho portato un po' d'acqua.";
};                       

FUNC INT Info_Bau_4_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Bau_4_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00"); //Mi manda Lefty. Ti ho portato un po' d'acqua.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output(self,other,"Info_Bau_4_Wasser_04_01"); //Grazie, amico! Ne avevo davvero bisogno!
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00"); //Ma non ne hai più! Non fa nulla, amico. Chiederò a qualcun altro.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_4(var c_NPC slf)
{
	Info_Bau_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_4_Wasser.npc				= Hlp_GetInstanceID(slf);
};
