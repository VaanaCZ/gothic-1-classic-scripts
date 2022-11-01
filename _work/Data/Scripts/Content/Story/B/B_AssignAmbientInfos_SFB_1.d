// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak se můžu přidat do spolku rudařů?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Jak se můžu přidat do spolku rudařů?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Přidat se k nám? Nemysli na to. Nepracujeme tu, pokud nás k tomu někdo nedonutí.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Jestli si myslíš, že se tu můžeš jen tak poflakovat, tak uvidíš, příteli.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Jestli si ještě myslíš, že je tohle místo pro tebe to pravé, pak by sis měl promluvit se Swineym. To je ten rudař, co tady celý den pokuřuje.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo tady má velení?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Kdo tady má velení?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Velení? Rozhlédni se kolem. Určitě nikdo, kdo by se dřel do úmoru a sbíral rudu. To je jisté.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Co to je?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Co to je?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //Co takhle může vypadat? Královský palác?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Jestli chceš opravdu pracovat ve Svobodném dole, musíš se nejdříve vypracovat v Kotlině a ukázat, jestli máš pro nás cenu.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Jak se máš?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //Jak to vidím? Špatně jako vždycky. Nic k jídlu, spousta práce.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Jediný, kdo nic nedělá, je Swiney. Okyl ho jmenoval mluvčím rudařů. Teď se tu celý den rozhlíží a kontroluje, jestli nemá na rukou mozoly.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
