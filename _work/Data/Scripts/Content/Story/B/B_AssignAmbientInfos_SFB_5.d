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
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //¡Hola!
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
	description = "FIN";
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
	description = "¿Y si quiero unirme a vosotros?";
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
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //¿Y si quiero unirme a vosotros?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //¿A nosotros? ¿Como qué, como aguador?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //No, como raspador.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Mira, voy a decirte algo: nadie se presenta VOLUNTARIO para ser raspador.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Claro que, si insistes... Ve a hablar con Swiney. Seguro que le sobrará un pico para ti.
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
	description = "¿Quién es importante aquí?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //¿Quién es importante aquí?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //¿Quién es importante? Yo, por supuesto.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Pero supongo que te refieres a quién manda.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Bueno, supongo que debes hablar con los mercenarios o los bandidos. Ni te acerques a los magos del agua.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Ese culo gordo de Swiney cree que es más importante de lo que es. Y sólo reparte los picos y hace lo que Okyl le dice.
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
	description = "¿Qué puede ofrecer el campamento?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //¿Qué puede ofrecer el campamento?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Lo que tú te ganes. Para algunos, nada más que trabajo; para otros, un montón de diversión.
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
	description = "¿Cómo es la vida aquí?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //¿Cómo es la vida aquí?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //¡Estupenda!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //Y como estamos tan contentos, hacemos todo lo que podemos para largarnos.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //¿Qué te crees que es este lugar? Es una cárcel, y a nadie le gusta vivir en una cárcel.
	
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
