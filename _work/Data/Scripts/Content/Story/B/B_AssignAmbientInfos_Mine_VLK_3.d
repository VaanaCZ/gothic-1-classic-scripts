// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_3_EXIT_Condition;
	information	= Info_Mine_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_3_Mine_Condition;
	information	= Info_Mine_Vlk_3_Mine_Info;
	permanent	= 1;
	description = "Opowiedz mi o kopalni.";
};                       

FUNC INT Info_Mine_Vlk_3_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00"); //Opowiedz mi o kopalni.
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01"); //Musimy pracowaæ bez koñca, nigdy nie ogl¹daj¹c œwiat³a dziennego. St¹d nie ma ucieczki innej ni¿ œmieræ.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Mine_Vlk_3_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01"); //Ian pilnuje kopalni a Asghan jest dowódc¹ stra¿ników.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_3_Minecrawler_Condition;
	information	= Info_Mine_Vlk_3_Minecrawler_Info;
	permanent	= 1;
	description = "Co mo¿esz mi powiedzieæ o pe³zaczach?";
};                       

FUNC INT Info_Mine_Vlk_3_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00"); //Co mo¿esz mi powiedzieæ o pe³zaczach?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01"); //Chcesz wiedzieæ, co robiæ w przypadku spotkania z pe³zaczem? Uciekaj. Uciekaj ile tylko si³ w nogach!
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02"); //Jak zaginiesz, bêdziesz martwy. Tutaj nikt nie bêdzie po tobie p³aka³.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_3_DieLage_Condition;
	information	= Info_Mine_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT Info_Mine_Vlk_3_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00"); //Jak leci?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01"); //Pomyœlmy: bol¹ mnie plecy, rêce mi odpadaj¹, jêzyk przysycha mi do podniebienia i padam z wyczerpania.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02"); //A od tego ci¹g³ego ³oskotu powoli dostajê œwira.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_3(var c_NPC slf)
{
	Info_Mine_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_DieLage.npc					= Hlp_GetInstanceID(slf);
};
