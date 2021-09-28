// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_7_EXIT_Condition;
	information	= Info_Org_7_EXIT_Info;
	permanent	= 1;
	description = "FINE";
};                       

FUNC INT Info_Org_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_7_EinerVonEuchWerden_Condition;
	information	= Info_Org_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Cosa devo fare per unirmi al campo?";
};                       

FUNC INT Info_Org_7_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00"); //Cosa devo fare per unirmi al campo?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01"); //Per prima cosa, devi dimostrare di essere un nemico di Gomez.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02"); //Come faccio?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03"); //Se fossi in te, ruberei qualcosa d'importante da Campo Vecchio o dalla vecchia miniera e lo porterei a Lares.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_7_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_7_WichtigePersonen_Condition;
	information	= Info_Org_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi è il vostro capo?";
};                       

FUNC INT Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00"); //Chi è il vostro capo?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01"); //Lares è il capo della banda e molti lo accettano.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02"); //Però non ci dice cosa dobbiamo fare.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_7_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_7_DasLager_Condition;
	information	= Info_Org_7_DasLager_Info;
	permanent	= 1;
	description = "Cosa mi dici di questo campo?";
};                       

FUNC INT Info_Org_7_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00"); //Cosa mi dici di questo campo?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01"); //È una specie di comunità autarchica, non so se mi spiego. Facciamo tutti ciò che vogliamo, perché siamo così tanti che Gomez non può liberarsi facilmente di noi.
	AI_Output(self,other,"Info_Org_7_DasLager_07_02"); //Anche se probabilmente se lo sogna la notte.
	AI_Output(other,self,"Info_Org_7_DasLager_15_03"); //Cosa avete a che fare con Gomez?
	AI_Output(self,other,"Info_Org_7_DasLager_07_04"); //Lo derubiamo!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_7_DieLage_Condition;
	information	= Info_Org_7_DieLage_Info;
	permanent	= 1;
	description = "Che succede qui?";
};                       

FUNC INT Info_Org_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00"); //Che succede qui?
	AI_Output(self,other,"Info_Org_7_DieLage_07_01"); //Non sei qui da molto, vero?
	AI_Output(self,other,"Info_Org_7_DieLage_07_02"); //I maghi si sono preparati per anni all'esplosione del metallo. Dicono che non manca molto, oramai.
	AI_Output(self,other,"Info_Org_7_DieLage_07_03"); //Almeno così sembra, considerato il cumulo enorme che i minatori hanno raccolto finora.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_7_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_7_Krautprobe_Condition;
	information	= Info_Org_7_Krautprobe_Info;
	permanent	= 1;
	description = "Vuoi un po' d'erba di palude?";
};                       

FUNC INT Info_Org_7_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00"); //Vuoi un po' d'erba di palude?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01"); //Posso pagartela 10 pezzi di metallo.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02"); //Ogni volta che devi sbarazzarti di un po' d'erba, fai un giro da queste parti.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_7_Krautprobe_No_Joint_07_00"); //Dov'è? Non ne vedo!
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_7(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_7_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
