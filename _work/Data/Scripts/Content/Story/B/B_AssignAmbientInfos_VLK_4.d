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
	description = "KONIEC";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Dzięki! Trzymaj się!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Uważaj na siebie, chłopcze.
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
	description = "Co mam zrobić, żeby dołączyć do tego obozu?";
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
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Co mam zrobić, żeby dołączyć do tego obozu?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //To znaczy jako Strażnik, albo Cień? To nie takie proste, kolego. Czeka cię kilka sprawdzianów zanim stary Thorus pozwoli ci spotkać się z Gomezem.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //No i musisz przekonać do siebie tutejszych tuzów. Ale dopóki nie będziesz należał do obozu, ludzie nie będą traktowali cię poważnie.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Na twoim miejscu zamieniłbym słowo z kilkoma Cieniami. Może któryś z nich zechce ci pomóc. Oczywiście, jeśli dasz mu coś w zamian.
	
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
	description = "Kogo warto tutaj poznać?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Kogo warto tutaj poznać?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Jako nowy powinieneś dbać o dobre stosunki z Gravo. Może się wydawać zwykłym Kopaczem, ale potrafi sobie radzić nawet z Magnatami.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Jak podpadniesz kiedyś ludziom Gomeza, on może cię wyciągnąć z kłopotów.
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
	description = "Co warto tutaj zobaczyć?";
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
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Co warto tutaj zobaczyć?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Jeśli nie masz ochoty harować w kopalni, trzymaj się terenu pomiędzy północną bramą a bramą zamkową.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Jak będziesz miał szczęście, Thorus lub Diego mogą cię o coś poprosić. Wyrobienie sobie chodów u zaufanych ludzi Gomeza może ci tylko wyjść na dobre.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Albo może wpadniesz na jakiegoś maga. Czasem proszą ludzi o różne drobiazgi. I dobrze płacą.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Magowie opuszczają czasem zamek? Kiedy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Skąd mam wiedzieć? Spytaj ludzi, którzy tam mieszkają.
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
	description = "Co słychać?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Co słychać?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //To samo, co 20 lat temu. Nic się nie zmieniło od tej pory.
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
