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
	description = "KONIEC";
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
	description = "Chcia³bym zostaæ Najemnikiem i pracowaæ dla Magów.";
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
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00"); //Chcia³bym zostaæ Najemnikiem i pracowaæ dla Magów.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01"); //To nie takie trudne. Jeœli jesteœ gotów do walki za nasz¹ sprawê, Lee na pewno ciê przyjmie.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02"); //Ale szanse na zostanie Najemnikiem maj¹ tylko ludzie biegli w pos³ugiwaniu siê mieczem. Jak z tym u ciebie?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03"); //Có¿...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04"); //Tak w³aœnie myœla³em. Jeœli myœlisz o tym powa¿nie, porozmawiaj z Gornem. On kiedyœ szkoli³ nowoprzyby³ych.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05"); //Mo¿e ci siê poszczêœci, i Gorn zechce ciê uczyæ.
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
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01"); //Wype³niamy polecenia magów, choæ ci rzadko maj¹ jakieœ konkretne ¿¹dania. Siedz¹ tylko przy kopcu rudy i czytaj¹ te swoje ksiêgi.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02"); //W sumie rz¹dzi tu Lee. To nasz szef.
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
	description = "Czy w obozie dochodzi do jakichœ spiêæ?";
};                       

FUNC INT Info_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00"); //Czy w obozie dochodzi do jakichœ spiêæ?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01"); //Ch³opie, co chwila s¹ jakieœ problemy! Szkodniki robi¹ co siê im ¿ywnie podoba, a my musimy pilnowaæ Magów i ca³ego Obozu.
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
	description = "Wszystko w porz¹dku?";
};                       

FUNC INT Info_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00"); //Wszystko w porz¹dku?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01"); //Jeszcze jest cicho...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02"); //Jeszcze?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03"); //Jeœli Szkodniki nie przestan¹ atakowaæ konwojów ze Starego Obozu, Gomez w koñcu siê wœcieknie i zapuka do naszych bram.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04"); //I bêdzie niez³a zabawa!
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
	description = "Chcesz trochê bagiennego ziela?";
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
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00"); //Chcesz trochê bagiennego ziela?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01"); //Jasne. Masz tu 10 bry³ek rudy.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02"); //Jakbyœ mia³ jeszcze kiedyœ trochê ziela, no wiesz...
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_11_Krautprobe_No_Joint_11_00"); //Najpierw je przynieœ, wtedy pogadamy.
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
