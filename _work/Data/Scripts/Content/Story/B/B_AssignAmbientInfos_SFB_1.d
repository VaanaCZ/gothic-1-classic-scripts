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
	description = "FINE";
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
	description = "Come faccio a unirmi ai tritarocce?";
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
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Come faccio a unirmi ai minatori?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Unirti a noi? Non pensare che non lavoriamo, solo perché non c'è nessuno che ci costringe a farlo!
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Se pensi di poter oziare tutto il giorno, ti sei fatto un'idea sbagliata.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Se pensi ancora che questo sia il posto adatto a te, vai a parlare con Swiney. È quel minatore che passa tutto il tempo fumando.
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
	description = "Chi comanda qui?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Chi è il capo, qui?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Il capo? Guardati intorno. Non è di certo quello che passa tutto il giorno a rompersi la schiena per raccogliere il metallo, questo è certo!
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
	description = "Cos'è questo?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Cos'è questo?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //Cosa ti sembra? Il palazzo reale?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Se davvero vuoi lavorare nella miniera libera, devi prima dimostrarci di essere utile nella Buca.
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
	description = "Come va?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //Cosa ne pensi? Male come sempre! Niente da mangiare, molto da lavorare.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //L'unico che non ha le mani occupate è Swiney. Okyl l'ha promosso a suo portavoce presso noi minatori. Ora passa tutto il giorno assicurandosi che a nessuno vengano i calli sulle mani.
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
