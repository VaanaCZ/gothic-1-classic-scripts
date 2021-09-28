// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespr�ch
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
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Nazdar!
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
	description = "KONEC";
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
	description = "Co kdybych se dal k v�m?";
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
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Co kdybych se dal k v�m?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //P�idat se k n�m? Jako co? Jako nosi� vody?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Ne, jako ruda�.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Pod�vej, n�co ti �eknu: nikdo se DOBROVOLN� nestane ruda�em.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Dobr�, kdy� na tom trv�... Jdi a promluv si se Swineym, vsad�m se, �e m� krump�� nazbyt a �e ti ho r�d p�enech�.
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
	description = "Kdo je tu nejd�le�it�j��?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Kdo je tu nejd�le�it�j��?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Nejd�le�it�j��? Samoz�ejm� j�.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Mysl�m, �e v�, kdo tady vel�.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Dob�e, asi by sis m�l promluvit se �old�ky nebo s bandity. K Vodn�m m�g�m se nedostane�.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Ten velkohub� Swiney se d�l� d�le�it�j�� ne� je. P�itom akor�t rozd�luje krump��e a d�l�, co mu na��d� Okyl.
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
	description = "Co m��e t�bor nab�dnout?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Co m��e t�bor nab�dnout?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Cokoliv, co si zaslou��. Pro n�kter� tu nen� nic ne� pr�ce a pro jin� spousta u��v�n�.
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
	description = "Jak se tady �ije?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Jak se tady �ije?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Par�da!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //A proto�e jsme tu tak ��astn�, ud�l�me nejl�pe, kdy� odsud vypadneme.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Co si mysl�, �e tohle m�sto je? Je to v�zen� a ve v�zen� nikdo ��t nechce.
	
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
