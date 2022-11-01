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
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Díky. Hodně štěstí.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Hlavu vzhůru, hochu.
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
	description = "Co musím udělat, abych se mohl přidat k táboru?";
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
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Co musím udělat, abych se mohl přidat k táboru?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Myslíš jako Stín nebo jako strážce? To nebude snadné, člověče. Než tě starý Thorus pustí za Gomezem, budeš muset složit pár zkoušek.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //A budeš tu muset dobře vyjít s lidmi Ale dokud nebudeš patřit k nějakému táboru, nikdo tě nebude brát vážně.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Být tebou, dal bych řeč s některým ze Stínů. Možná bys našel někoho, kdo by ti mohl pomoci. Samozřejmě když nabídneš něco na oplátku.
	
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
	description = "Je tu něco zvláštního, co bych měl vědět?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Je tu někdo důležitý, koho bych měl znát?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Když jsi tu nový, neměl by ses dostat do křížku s Gravem. I když je jenom kopáč, ví, jak jednat s Rudobarony.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Pokud se dostaneš do problémů s někým z Gomezovy party, může ti z toho pomoci ven.
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
	description = "Která místa bych tady měl znát?";
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
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Která místa bych tady měl znát?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Jestli nemáš chuť kopat v dolech, měl by ses porozhlédnout mezi severní a hradní bránou.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Když budeš mít štěstí, Thorus nebo Diego by ti mohli navrhnout něco, co bys pro ně mohl udělat - tak budeš mít šanci dostat se na jejich stranu. Určitě není špatné patřit ke Gomezovým lidem..
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Nebo by ses měl setkat s mágy. Občas potřebují vyřídit nějaké obchůzky. A platí vždycky dobře.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Mágové vycházejí z hradu? A kdy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Co já vím.Zeptej se lidí, kteří tam žijí.
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
	description = "Jsi v pořádku?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Jsi v pořádku?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //Tak jako před dvaceti lety. Nic se za tu dobu nezměnilo.
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
