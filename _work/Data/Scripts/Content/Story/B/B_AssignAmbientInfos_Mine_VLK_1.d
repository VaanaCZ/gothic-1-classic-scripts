// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_1 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_1_EXIT_Condition;
	information	= Info_Mine_Vlk_1_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Mine_Vlk_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_1_Mine_Condition;
	information	= Info_Mine_Vlk_1_Mine_Info;
	permanent	= 1;
	description = "Øekni mi nìco o dole.";
};                       

FUNC INT Info_Mine_Vlk_1_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00"); //Øekni mi nìco o dole.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01"); //V jeskyních rostou houby a byliny. Snadno se tráví, ale nikdy se tím nenacpeš tak krásnì jako poøádnou flákotou masa!
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02"); //Èervi tak dobøe nechutnají. Taková havì.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_1_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady má na starosti?";
};                       

FUNC INT Info_Mine_Vlk_1_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Kdo tady velí?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Ian je mùj šéf. Organizuje pracovní síly a vymìòuje zboží s táborem. Pokud nìco chceš, mìl bys mu to øíci.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_1_Minecrawler_Condition;
	information	= Info_Mine_Vlk_1_Minecrawler_Info;
	permanent	= 1;
	description = "Co víš o èervech?";
};                       

FUNC INT Info_Mine_Vlk_1_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00"); //Co víš o dùlních èervech?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01"); //Templáøi udìlali s Gomezem smlouvu. Zabijí èervy a pak si budou moci nechat jejich èelisti.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_1_DieLage_Condition;
	information	= Info_Mine_Vlk_1_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Mine_Vlk_1_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01"); //Spousta práce, žádný odpoèinek. Tak se rychle ptej. Mám moc práce.
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_1(var c_NPC slf)
{
	Info_Mine_Vlk_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_DieLage.npc					= Hlp_GetInstanceID(slf);
};
