// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_3_EXIT_Condition;
	information	= Info_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_3_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak se m��u p�idat k t�boru?";
};                       

FUNC INT Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //Jak se m��u p�idat k t�boru?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //J� jsem akor�t kop��, tak�e ti k tomu nem�m co ��ct. M�l by sis promluvit se str�emi nebo se St�ny.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo je tady ��f?";
};                       

FUNC INT Info_Vlk_3_WichtigePersonen_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //Kdo je tady ��f?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gomez. �ije na hrad�. Ale my kop��i se m�me po��dn� na pozoru p�ed str�emi.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //Nejlep�� je, j�t jim z cesty. Pokud tak neud�l�, m� mal�r.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_3_DasLager_Condition;
	information	= Info_Vlk_3_DasLager_Info;
	permanent	= 1;
	description = "Jak� jsou tady nejd�le�it�j�� m�sta?";
};                       

FUNC INT Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //Jak� jsou tady nejd�le�it�j�� m�sta?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //Jestli r�d s�z�, mus� zaj�t ve�er do ar�ny. Jestli si chce� n�co koupit, zajdi na tr�i�t�.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //Prod�vaj� tam prakticky v�echno. Jestli chce� mapy, zajdi ke Grahamovi. Jeho chatr� je p��mo naproti hradn� br�n�.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_3_DieLage_Condition;
	information	= Info_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "Co se d�je?";
};                       

FUNC INT Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //Co se d�je?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //Brzy se dozv� v�c. M�j se po��d na pozoru. Hlavn� v noci.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //U� jsem se cel� dny po��dn� nevyspal. Jestli nem��e� sp�t v kolonii, pak bude� m�t dvakr�t v�c �asu!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_3(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc				= Hlp_GetInstanceID(slf);
};
