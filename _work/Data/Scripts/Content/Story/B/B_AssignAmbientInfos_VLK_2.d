// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_2_EXIT_Condition;
	information	= Info_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_2_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chci s k v�m p�idat.";
};                       

FUNC INT Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //Chci se k v�m p�idat.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //Nech�pu, pro� bys cht�l dobrovoln� pracovat v dolech. N�kdo jako ty m��e brzy ��t na hrad�.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Tady na vn�j��m kruhu vyb�raj� Fletcher, Bloodwyn a Jackal pen�ze za ochranu. Ka�d� m� sv�j obvod.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //Kdy� s nimi bude� zadob�e, nic se ti nestane.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_2_DasLager_Condition;
	information	= Info_Vlk_2_DasLager_Info;
	permanent	= 1;
	description = "Chci v�d�t o t�bo�e v�c.";
};                       

FUNC INT Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //Chci v�d�t o t�bo�e v�c.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //M�l by sis promluvit se St�ny. �eknou ti, co pot�ebuje� v�d�t. Bu� ale opatrn�, v�t�in� z nich nelze d�v��ovat.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_2_DieLage_Condition;
	information	= Info_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Jak se tady �ije?";
};                       

FUNC INT Info_Vlk_2_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //Jak se tady �ije?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //Pokud t� pos�laj� Rudobaroni, vzka� jim, �e nechci ��dn� probl�my. Ode m� nic neusly��.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //S t�m, co n�m d�vaj�, jsem spokojen�.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Nikdo m� neposlal. Jsem tu nov�.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //Nov��ek, co? Nov��ci se v�dycky hned dostanou do probl�m�. Nechci s t�m m�t nic spole�n�ho, jasn�?
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_2(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
