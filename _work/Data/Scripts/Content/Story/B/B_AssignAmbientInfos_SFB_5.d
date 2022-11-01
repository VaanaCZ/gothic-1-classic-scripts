// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

INSTANCE Info_SFB_5_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_5_Pre_Condition;
	information	= Info_SFB_5_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_5_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Witaj!
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_5_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_5_EXIT_Condition;
	information	= Info_SFB_5_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_SFB_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_5_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_5_EinerVonEuchWerden_Condition;
	information	= Info_SFB_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "A gdybym chciał do was dołączyć?";
};                       

FUNC INT Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //A gdybym chciał do was dołączyć?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Do nas? Jako kto? Nosiwoda?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Nie, jako Kret.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Posłuchaj mnie uważnie: nikt nie zostaje Kretem NA OCHOTNIKA!
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //No, ale jeśli się upierasz... Porozmawiaj ze Swineyem. Może... ulituje się nad tobą i da ci jakiś Kilof.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_5_WichtigePersonen_Condition;
	information	= Info_SFB_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu jest ważny?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Kto tu jest szychą?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Kto jest szychą? Ja, oczywiście.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Ale pewnie chcesz wiedzieć kto tu rozkazuje.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Powinieneś porozmawiać w Najemnikami albo Szkodnikami. W pobliże Magów Wody raczej się nie dostaniesz.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Ten wieprz, Swiney, stanowczo za wysoko zadziera nosa. Nic, tylko rozdziela kilofy i całuje tyłek Okyla.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_5_DasLager_Condition;
	information	= Info_SFB_5_DasLager_Info;
	permanent	= 1;
	description = "Co ten Obóz ma do zaoferowania?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Co ten Obóz ma do zaoferowania?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //To zależy, co ci się uda wyrwać dla siebie. Dla niektórych jest tu tylko harówa bez końca, ale inni potrafią się nieźle bawić.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_5_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_5_DieLage_Condition;
	information	= Info_SFB_5_DieLage_Info;
	permanent	= 1;
	description = "Jak wygląda życie tutaj?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Jak wygląda życie tutaj?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Wspaniale!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //Tak wspaniale, że mamy już dość tej wiecznej szczęśliwości i próbujemy stąd zwiać.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //A co sobie myślałeś?! To jest więzienie! Nikt nie lubi siedzieć w więzieniu!
	
};	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_5(var c_NPC slf)
{

	Info_SFB_5_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
