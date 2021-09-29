// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_8_EXIT_Condition;
	information	= Info_Tpl_8_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_8_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Pot�ebujete spolehliv�ho mu�e?";
};                       

FUNC INT Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToOldCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Pot�ebujete spolehliv�ho mu�e?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Po��d hled�me spolehliv� mu�e. Mus� ale tvrd� pracovat, aby ses zdokonalil. Jen zku�en� novicov� se mohou st�t templ��i.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //To je ta nejv�t�� pocta pro v�echny n�sledovn�ky Sp��ova Bratrstva.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_8_WichtigePersonen_Condition;
	information	= Info_Tpl_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //D�l�me to, co �eknou Guru. Slou�it jim je na�e povinnost.
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02"); //Kdo jsou ti Guru?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Y�Berion Osv�cen� je hlavou Guru. Pod n�m jsou Cor Kalom a dal��.
	var C_NPC YBerion;		YBerion	= Hlp_GetNpc(Gur_1200_Yberion);
	var C_NPC CorKalom;		CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
	var C_NPC CorAngar;		CorAngar= Hlp_GetNpc(Gur_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_8_DasLager_Condition;
	information	= Info_Tpl_8_DasLager_Info;
	permanent	= 1;
	description = "Co mi m��e� ��ci o t�bo�e?";
};                       

FUNC INT Info_Tpl_8_DasLager_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};

FUNC VOID Info_Tpl_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //Co mi m��e� ��ci o t�boru?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //Jako nov� p��choz� m��e� j�t v podstat� kam chce�. Nev�rc�m v�ak nen� povolen vstup do Sp��ova chr�mu.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02"); //Tak�e cho� jen tam, kam sm�. A tak� nevyru�uj na�e p�ny p�i meditac�ch.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_8_DieLage_Condition;
	information	= Info_Tpl_8_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Tpl_8_DieLage_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};

FUNC VOID Info_Tpl_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //Jak se m�?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //Varuji t�. Nebu� nezdvo�il�. Mluv� s jedn�m z vyvolen�ch prorokov�ch str�c�.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_8(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Tpl_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc				= Hlp_GetInstanceID(slf);
};
