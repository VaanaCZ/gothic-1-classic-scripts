// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_4_EXIT_Condition;
	information	= Info_Mine_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Mine_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Die Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_4_Mine_Condition;
	information	= Info_Mine_Vlk_4_Mine_Info;
	permanent	= 1;
	description = "�ekni mi n�co o dole.";
};                       

FUNC INT Info_Mine_Vlk_4_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00"); //Pov�dej mi o dole.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01"); //Krump��e a pot. To jedin� tady je. Nastoup� a mak�.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02"); //Ty u� bude� d�vno pry� a j� tu budu po��d rubat ze sk�ly rudu. To je moje pr�ce, m�j �ivot.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady m� na starosti?";
};                       

FUNC INT Info_Mine_Vlk_4_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01"); //Santino a Alberto vym��uj� zbo�� za rudu, kterou vyt��me. Od nich dost�v�me denn� p��d�ly.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_4_Minecrawler_Condition;
	information	= Info_Mine_Vlk_4_Minecrawler_Info;
	permanent	= 1;
	description = "Co v� o �ervech?";
};                       

FUNC INT Info_Mine_Vlk_4_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00"); //Co v� o d�ln�ch �ervech?
	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01"); //Jakmile uvid� n�jak�ho �erva p�ed sebou, mus� ho pra�tit krump��em mezi o�i. Kdy� �patn� m���, druhou �anci u� nedostane�.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_4_DieLage_Condition;
	information	= Info_Mine_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Mine_Vlk_4_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00"); //Jak se m�?
	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01"); //Je to lep��.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_4(var c_NPC slf)
{
	
	
	Info_Mine_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_DieLage.npc					= Hlp_GetInstanceID(slf);
};
