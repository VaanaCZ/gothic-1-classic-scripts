// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Grd_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_6_EXIT_Condition;
	information	= Info_Mine_Grd_6_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Grd_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_6_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_Mine_Condition;
	information	= Info_Mine_Grd_6_Mine_Info;
	permanent	= 1;
	description = "Jak wygl¹da praca w kopalni?";
};                       

FUNC INT Info_Mine_Grd_6_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_Mine_15_00"); //Jak wygl¹da praca w kopalni?
	AI_Output(self,other,"Info_Mine_Grd_6_Mine_06_01"); //Kopacze wydobywaj¹ tu rudê. A jak nie wydobywaj¹, to dostaj¹ porz¹dne baty.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_6_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Mine_Grd_6_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Mine_Grd_6_WichtigePersonen_06_01"); //Szefem jest Asghan, ale to Ian organizuje takie rzeczy, jak ruda i Kopacze.
	
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_6_Minecrawler(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_Minecrawler_Condition;
	information	= Info_Mine_Grd_6_Minecrawler_Info;
	permanent	= 1;
	description = "Opowiedz mi o pe³zaczach.";
};                       

FUNC INT Info_Mine_Grd_6_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_Minecrawler_15_00"); //Opowiedz mi o pe³zaczach.
	AI_Output(self,other,"Info_Mine_Grd_6_Minecrawler_06_01"); //Same k³opoty z tymi bestiami. Sam ju¿ nie wiem, z czym jest wiêcej roboty - z nimi czy z Kopaczami.
	
};	

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_DieLage_Condition;
	information	= Info_Mine_Grd_6_DieLage_Info;
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT Info_Mine_Grd_6_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_DieLage_15_00"); //Jak leci?
 	AI_Output(self,other,"Info_Mine_Grd_6_DieLage_06_01"); //A jak myœlisz?
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_GRD_6(var c_NPC slf)
{
	Info_Mine_Grd_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_DieLage.npc					= Hlp_GetInstanceID(slf);
};
