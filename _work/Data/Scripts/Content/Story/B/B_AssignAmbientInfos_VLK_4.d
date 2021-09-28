// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_4_EXIT_Condition;
	information	= Info_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Díky. Hodnì štìstí.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Hlavu vzhùru, hochu.
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_4_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_4_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co musím udìlat, abych se mohl pøidat k táboru?";
};                       

FUNC INT Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_4_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Co musím udìlat, abych se mohl pøidat k táboru?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Myslíš jako Stín nebo jako stráce? To nebude snadné, èlovìèe. Ne tì starı Thorus pustí za Gomezem, budeš muset sloit pár zkoušek.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //A budeš tu muset dobøe vyjít s lidmi Ale dokud nebudeš patøit k nìjakému táboru, nikdo tì nebude brát vánì.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Bıt tebou, dal bych øeè s nìkterım ze Stínù. Moná bys našel nìkoho, kdo by ti mohl pomoci. Samozøejmì kdy nabídneš nìco na oplátku.
	
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Je tu nìco zvláštního, co bych mìl vìdìt?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Je tu nìkdo dùleitı, koho bych mìl znát?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Kdy jsi tu novı, nemìl by ses dostat do køíku s Gravem. I kdy je jenom kopáè, ví, jak jednat s Rudobarony.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Pokud se dostaneš do problémù s nìkım z Gomezovy party, mùe ti z toho pomoci ven.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_4_DasLager_Condition;
	information	= Info_Vlk_4_DasLager_Info;
	permanent	= 1;
	description = "Která místa bych tady mìl znát?";
};                       

FUNC INT Info_Vlk_4_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Která místa bych tady mìl znát?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Jestli nemáš chu kopat v dolech, mìl by ses porozhlédnout mezi severní a hradní bránou.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Kdy budeš mít štìstí, Thorus nebo Diego by ti mohli navrhnout nìco, co bys pro nì mohl udìlat - tak budeš mít šanci dostat se na jejich stranu. Urèitì není špatné patøit ke Gomezovım lidem..
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Nebo by ses mìl setkat s mágy. Obèas potøebují vyøídit nìjaké obchùzky. A platí vdycky dobøe.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Mágové vycházejí z hradu? A kdy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Co já vím.Zeptej se lidí, kteøí tam ijí.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_4_DieLage_Condition;
	information	= Info_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Jsi v poøádku?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Jsi v poøádku?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //Tak jako pøed dvaceti lety. Nic se za tu dobu nezmìnilo.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc				= Hlp_GetInstanceID(slf);
};
