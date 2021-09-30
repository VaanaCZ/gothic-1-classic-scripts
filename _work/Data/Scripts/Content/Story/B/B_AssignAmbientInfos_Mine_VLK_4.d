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
	description = "FIN";
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
	description = "Háblame de la mina.";
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
	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00"); //Háblame de la mina.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01"); //Picos y sudor. Eso es lo que consigues allí dentro. Tú llegas y después te vas.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02"); //Pero mucho después de que te hayas ido, yo seguiré allí, extrayendo el mineral de la roca. Es mi trabajo, y mi vida.
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
	description = "¿Quién está al mando?";
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
	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00"); //¿Quién está al mando?
	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01"); //Santino y Alberto consiguen mercancías a cambio del mineral que extraemos. Nos dan nuestras raciones diarias.
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
	description = "¿Qué sabes de los reptadores?";
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
	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00"); //¿Qué sabes de los reptadores?
	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01"); //Si ves a alguno de esos asquerosos bichos, sacúdelo entre los ojos con tu pico. Pero tienes que apuntar bien, porque no tendrás una segunda oportunidad.
	
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
	description = "¿Qué tal estás?";
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
	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00"); //¿Qué tal estás?
	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01"); //He conocido tiempos mejores.
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
