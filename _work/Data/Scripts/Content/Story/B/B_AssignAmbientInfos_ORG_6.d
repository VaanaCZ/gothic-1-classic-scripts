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
	description = "Chci se k vám pøidat!";
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
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00"); //Chci se k vám pøidat!
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01"); //Lares rozhoduje, kdo se k tlupì pøidá.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02"); //To ale budeš potøebovat sakra dobrý dùvod, jestli se k nìmu chceš dostat.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03"); //Napøíklad?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04"); //Napøíklad nìkoho, kdo tì k nìmu posílá.
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
	description = "Kdo je šéf?";
};                       

FUNC INT Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00"); //Kdo je šéf?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01"); //Tys právì pøišel ze Starého tábora, co?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02"); //Tady není žádný šéf! Ten prokletý Lee se nás snaží držet na uzdì, ale my si dìláme, co chceme.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03"); //Jestli máme nìco jako šéfa, pak je to Lares. A ten má dost rozumu na to, aby nikomu do jeho vìcí nemluvil!
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
	description = "Je nìco, co bych mìl vìdìt o tomhle místì?";
};                       

FUNC INT Info_Org_6_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00"); //Je nìco, co bych mìl o tomhle místì vìdìt?
	AI_Output(self,other,"Info_Org_6_DasLager_06_01"); //Uprostøed téhle jeskynì je velká kaverna plná rudy. Ale jestli pøemýšlíš, jak se k ní dostat, tak na to zapomeò!
	AI_Output(self,other,"Info_Org_6_DasLager_06_02"); //Sám jsem se o to jednou pokoušel, ale žoldáci to tu ve dne v noci støeží.
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
	description = "Jak to jde?";
};                       

FUNC INT Info_Org_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00"); //Jak se máš?
	AI_Output(self,other,"Info_Org_6_DieLage_06_01"); //Èlovìèe! Co si myslíš? Celý den se cpát rýží a celou dobu èekat na pøíležitost, jak se dostat k nìjaké rudì.
	AI_Output(self,other,"Info_Org_6_DieLage_06_02"); //Pak hurá do baru a naleju se až po okraj rýžovou pálenkou!
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
	description = "Mám tu trochu drogy z bažin. Dáš si?";
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
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); //Mám tu trochu drogy z bažin. Dáš si?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01"); //Jasnì. Tady je 10 nugetù.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02"); //Až budeš mít další, pøijï zase, jo?
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_6_Krautprobe_No_Joint_06_00"); //Kde? Žádnou drogu tu nevidím.
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
