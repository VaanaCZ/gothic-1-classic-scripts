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
	description = "FIN";
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
	description = "H�blame de la mina.";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00"); //H�blame de la mina.
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01"); //Todos tenemos que trabajar duro durante semanas, en las que no vemos la luz del d�a. No hay escapatoria. La �nica salida es la muerte.
	
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
	description = "�Qui�n manda por aqu�?";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00"); //�Qui�n manda por aqu�?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01"); //Ian es el jefe de la mina. Asghan est� a cargo de los guardias.
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
	description = "�Qu� sabes de los reptadores?";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00"); //�Qu� sabes de los reptadores?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01"); //�Te refieres al mejor modo de enfrentarte a ellos? Corriendo. Corriendo todo lo deprisa que te lleven tus piernas.
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02"); //Si desapareces, es demasiado tarde. No es probable que nadie te eche de menos.
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
	description = "�Qu� tal est�s?";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00"); //�Qu� tal est�s?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01"); //Bueno, me duele la espalda, parece que se me van a caer los brazos, tengo la lengua seca y me muero de cansancio.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02"); //Y el martilleo constante de los picos me est� volviendo loco.
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
