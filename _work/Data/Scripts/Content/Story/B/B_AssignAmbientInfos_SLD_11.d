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
	description = "Quiero convertirme en mercenario para los magos.";
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
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00"); //Quiero convertirme en mercenario para los magos.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01"); //No es muy dif�cil. Si est�s listo para luchar por nuestra causa, seguro que Lee te acepta.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02"); //Pero s�lo acepta a gente que es buena con la espada. �T� lo eres?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03"); //Bueno...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04"); //Eso pensaba. Si vas en serio, habla con Gorn. Ya ha entrenado antes a reci�n llegados.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05"); //Tal vez tengas suerte y se tome la molestia de entrenarte.
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
	description = "�Qui�n manda por aqu�?";
};                       

FUNC INT Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00"); //�Qui�n manda por aqu�?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01"); //Hacemos lo que dicen los magos. Pero por lo general no dicen nada. Se limitan a pasearse junto al mont�culo de mineral y a enterrar las narices en sus libros.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02"); //Fundamentalmente, Lee est� al mando. Es nuestro jefe.
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
	description = "�Hay problemas en este campamento?";
};                       

FUNC INT Info_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00"); //�Hay problemas en este campamento?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01"); //T�o, siempre hay problemas. Los bandidos hacen lo que les da la gana y los mercenarios tenemos que proteger a los magos y defender el campamento.
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
	description = "�Est�s bien?";
};                       

FUNC INT Info_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00"); //�Est�s bien?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01"); //Por ahora todo est� tranquilo...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02"); //�Por ahora?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03"); //Si los bandidos siguen atacando las caravanas de G�mez, no tardar� mucho en aparecer con su ej�rcito ante las puertas.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04"); //Y eso no va a ser muy divertido.
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
	description = "�Quieres un poco de hierba del pantano?";
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
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00"); //�Quieres un poco de hierba del pantano?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01"); //Claro. Aqu� tienes 10 pepitas.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02"); //Si consigues m�s, ya sabes...
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_11_Krautprobe_No_Joint_11_00"); //Tr�eme un poco y hablaremos.
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
