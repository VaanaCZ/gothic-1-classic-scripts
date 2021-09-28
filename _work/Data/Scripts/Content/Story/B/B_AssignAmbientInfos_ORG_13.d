// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_13_EXIT_Condition;
	information	= Info_Org_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Org_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_13_EinerVonEuchWerden_Condition;
	information	= Info_Org_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mus�m ud�lat, abych se mohl p�idat k t�boru?";
};                       

FUNC INT Info_Org_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00"); //Co mus�m ud�lat, abych se mohl p�idat k t�boru?
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01"); //Jdi na pole a pomoz roln�k�m skl�zet r��i.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_13_WichtigePersonen_Condition;
	information	= Info_Org_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01"); //Lee je hlava �old�k�, jestli t� zrovna TOHLE zaj�m�. Ale j� nejsem �old�k a a� m� vezme �ert, jestli je nech�m, aby mi rozkazovali!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_13_DasLager_Condition;
	information	= Info_Org_13_DasLager_Info;
	permanent	= 1;
	description = "Chci v�d�t o t�boru v�c.";
};                       

FUNC INT Info_Org_13_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_13_DasLager_15_00"); //Chci v�d�t o t�boru v�c.
	AI_Output(self,other,"Info_Org_13_DasLager_13_01"); //Tak jdi a porozhl�dni se kolem. Dokud nebude� pat�it ke  Gomezov�ch mu��m, nikdo ti v tom nebude br�nit.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_13_DieLage_Condition;
	information	= Info_Org_13_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_13_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Org_13_DieLage_13_01"); //Co TY mi vlastn� chce�?
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_13_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_13_Krautprobe_Condition;
	information	= Info_Org_13_Krautprobe_Info;
	permanent	= 1;
	description = "Vypad� to, jako bys m�l co d�lat s drogou z ba�in.";
};                       

FUNC INT Info_Org_13_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_13_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00"); //Vypad� to, jako bys m�l co d�lat s drogou z ba�in.
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01"); //M� n�co? D�m ti za jednu lodyhu 10 nuget�.
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02"); //M��e� v�dycky zase p�ij�t, brat�e.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_13_Krautprobe_No_Joint_13_00"); //Ale ty nic nem�. P�esta� si ze m� d�lat bl�zny, jasn�?
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_13(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Org_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Org_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Org_13_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_13_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
