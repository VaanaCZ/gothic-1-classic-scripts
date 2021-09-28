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
	description = "Chc� do was do��czy�.";
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
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00"); //Chc� do was do��czy�.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01"); //Lares decyduje, kto si� nadaje do bandy.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02"); //Ale �eby si� z nim spotka�, musisz mie� nie lada pow�d.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03"); //Na przyk�ad jaki?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04"); //Na przyk�ad kto� m�g�by ci� do niego wys�a�.
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
	description = "Kto tu jest przyw�dc�?";
};                       

FUNC INT Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00"); //Kto tu jest przyw�dc�?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01"); //Przybywasz prosto ze Starego Obozu, co?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02"); //Tutaj nie ma przyw�dcy! Cholerny Lee pr�buje nas trzyma� na smyczy, ale i tak robimy, co si� nam �ywnie podoba.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03"); //Gdyby�my mieli jakiego� szefa, by�by nim pewnie Lares. No, ale on MA do�� rozumu, �eby nie miesza� si� do cudzych spraw.
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
	description = "Co powinienem wiedzie� o tym miejscu?";
};                       

FUNC INT Info_Org_6_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00"); //Co powinienem wiedzie� o tym miejscu?
	AI_Output(self,other,"Info_Org_6_DasLager_06_01"); //Na �rodku jaskini znajduje si� wielka dziura wype�niona rud�. Ale je�li ostrzysz sobie na ni� z�by, radz� ci o tym zapomnie�.
	AI_Output(self,other,"Info_Org_6_DasLager_06_02"); //Sam kiedy� spr�bowa�em szcz�cia, ale Najemnicy trzymaj� przy niej stra� dniem i noc�.
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
	description = "Jak si� masz?";
};                       

FUNC INT Info_Org_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00"); //Jak si� masz?
	AI_Output(self,other,"Info_Org_6_DieLage_06_01"); //A jak si� mog� mie� jedz�c ry� ca�ymi dniami i czekaj�c na dogodn� chwil�, �eby zdoby� troch� rudy?!
	AI_Output(self,other,"Info_Org_6_DieLage_06_02"); //Potem mo�na p�j�� do baru i schla� si� do nieprzytomno�ci ry��wk�!
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
	description = "Mam przy sobie troch� bagiennego ziela? Mo�e chcesz troch� kupi�?";
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
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); //Mam przy sobie troch� bagiennego ziela? Mo�e chcesz je kupi�?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01"); //Jasne. Masz tu 10 bry�ek rudy.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02"); //Zajrzyj do mnie jeszcze, jak b�dziesz mia� tego wi�cej, dobra?
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_6_Krautprobe_No_Joint_06_00"); //Gdzie? Nie widz� �adnego ziela.
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
