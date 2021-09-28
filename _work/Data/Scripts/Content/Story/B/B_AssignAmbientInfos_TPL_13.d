// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_13_EXIT_Condition;
	information	= Info_Tpl_13_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_13_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Quiero convertirme en templario como tú.";
};                       

FUNC INT Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToOldCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //Quiero convertirme en templario como tú.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //¿Sabes de lo que he tenido que privarme para que se me permitiera servir a los elegidos del Durmiente como guardia del templo?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //No pienses que vas a llegar y llevarte todos los honores.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Antes de pensar en ello, deberías enterarte un poco de las enseñanzas del Durmiente.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //Eso te llevará un tiempo, y puede que te haga entrar en vereda.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_13_WichtigePersonen_Condition;
	information	= Info_Tpl_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién manda por aquí?";
};                       

FUNC INT Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00"); //¿Quién manda por aquí?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01"); //¡Nuestros gurús son los elegidos del Durmiente! Éste decide nuestro destino y los gurús lo profetizan.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_13_DasLager_Condition;
	information	= Info_Tpl_13_DasLager_Info;
	permanent	= 1;
	description = "Me gustaría echar un vistazo en el templo del Durmiente.";
};                       

FUNC INT Info_Tpl_13_DasLager_Condition()
{	
	if (Kapitel <= 1) 
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00"); //Me gustaría echar un vistazo en el templo del Durmiente.
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01"); //¡Eso es inimaginable! ¡Un infiel en el templo! ¡No podrás entrar en el templo hasta que no te encomiendes al servicio del Durmiente!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_13_DieLage_Condition;
	information	= Info_Tpl_13_DieLage_Info;
	permanent	= 1;
	description = "¿Qué tal estás?";
};                       

FUNC INT Info_Tpl_13_DieLage_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00"); //¿Qué tal estás?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01"); //Desde que me convertí en uno de los protectores elegidos de la fe, me siento mejor que nunca antes.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02"); //Parece bastante importante...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03"); //Eres un infiel. Tú no lo entiendes.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_13(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Tpl_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
