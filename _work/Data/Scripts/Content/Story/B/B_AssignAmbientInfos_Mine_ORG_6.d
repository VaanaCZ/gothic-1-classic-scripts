// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Org_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Org_6_EXIT_Condition;
	information	= Info_Mine_Org_6_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Mine_Org_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Org_6_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_6_Mine_Condition;
	information	= Info_Mine_Org_6_Mine_Info;
	permanent	= 1;
	description = "¿Qué sucede en la mina?";
};                       

FUNC INT Info_Mine_Org_6_Mine_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00"); //¿Qué sucede en la mina?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01"); //¿En la mina? Los tipos que están dentro se quedan dentro. Nadie entra, y nadie sale.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02"); //Alégrate de estar fuera.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Org_6_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Org_6_WichtigePersonen_Condition;
	information	= Info_Mine_Org_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién da las órdenes aquí?";
};                       

FUNC INT Info_Mine_Org_6_WichtigePersonen_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00"); //¿Quién da las órdenes aquí?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01"); //Nadie me da órdenes, pero tienes que saber cómo llegar a ese punto.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01"); //¿Y cómo se llega?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02"); //¡Es un secreto del oficio! Pero, entre nosotros, no es tan difícil para un bandido.
};


// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Org_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_6_DieLage_Condition;
	information	= Info_Mine_Org_6_DieLage_Info;
	permanent	= 1;
	description = "No parece que te estés matando a trabajar.";
};                       

FUNC INT Info_Mine_Org_6_DieLage_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00"); //No parece que te estés matando a trabajar.
 	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01"); //¿Trabajar yo? Si fuese trabajador, no estaría en la cima, si sabes a lo que me refiero.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Org_6(var c_NPC slf)
{
	Info_Mine_Org_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_DieLage.npc					= Hlp_GetInstanceID(slf);
};
