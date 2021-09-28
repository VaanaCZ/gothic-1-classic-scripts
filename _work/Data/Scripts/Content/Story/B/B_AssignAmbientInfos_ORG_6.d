// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_6_EXIT_Condition;
	information	= Info_Org_6_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Org_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_6_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_6_EinerVonEuchWerden_Condition;
	information	= Info_Org_6_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "¡Quiero unirme a vosotros!";
};                       

FUNC INT Info_Org_6_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_6_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00"); //¡Quiero unirme a vosotros!
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01"); //Lares decide quién se une a la banda.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02"); //Pero necesitarás un buen motivo si quieres verlo.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03"); //¿Como cuál?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04"); //Como alguien que te envíe ante él.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_6_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_6_WichtigePersonen_Condition;
	information	= Info_Org_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién es el jefe?";
};                       

FUNC INT Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00"); //¿Quién es el jefe?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01"); //Acabas de llegar del Campamento Viejo, ¿eh?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02"); //Aquí nadie es el jefe. Ese maldito Lee sigue intentando mantenernos controlados, pero hacemos lo que nos parece.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03"); //Si tuviéramos jefe, sería Lares. ¡Pero es lo bastante inteligente como para no meterse en los asuntos de los demás!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_6_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_6_DasLager_Condition;
	information	= Info_Org_6_DasLager_Info;
	permanent	= 1;
	description = "¿Hay algo que deba saber de este lugar?";
};                       

FUNC INT Info_Org_6_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00"); //¿Hay algo que deba saber de este lugar?
	AI_Output(self,other,"Info_Org_6_DasLager_06_01"); //En mitad de la cueva hay un enorme agujero lleno de mineral. Si tienes pensado echar mano de él... ¡Olvídalo!
	AI_Output(self,other,"Info_Org_6_DasLager_06_02"); //Yo lo intenté en una ocasión, pero los mercenarios montan guardia de día y de noche.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_6_DieLage_Condition;
	information	= Info_Org_6_DieLage_Info;
	permanent	= 1;
	description = "¿Qué tal estás?";
};                       

FUNC INT Info_Org_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00"); //¿Qué tal estás?
	AI_Output(self,other,"Info_Org_6_DieLage_06_01"); //¡Tío! ¿Y tú qué crees? Comiendo arroz todo el día y esperando la oportunidad para conseguir un poco de mineral.
	AI_Output(self,other,"Info_Org_6_DieLage_06_02"); //¡Y después al bar, a ponerme hasta las cejas de aguardiente de arroz!
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_6_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_6_Krautprobe_Condition;
	information	= Info_Org_6_Krautprobe_Info;
	permanent	= 1;
	description = "Tengo un poco de hierba del pantano. ¿Quieres?";
};                       

FUNC INT Info_Org_6_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_6_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); //Tengo un poco de hierba del pantano. ¿Quieres?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01"); //Claro. Aquí tienes 10 pepitas.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02"); //Vuelve cuando consigas más, ¿vale?
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_6_Krautprobe_No_Joint_06_00"); //¿Dónde? No veo hierba.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_6(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Org_6_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Org_6_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Org_6_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_6_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
