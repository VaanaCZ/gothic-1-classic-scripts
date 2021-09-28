// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_8_EXIT_Condition;
	information	= Info_Mine_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Mine_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak se mùžu dostat k téhle èetì?";
};                       

FUNC INT Info_Mine_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mine_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00"); //Jak se mùžu dostat k téhle èetì?
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01"); //Pokud pracuješ tady v Kotlinì, nejprve se budeš muset propracovat do Nového tábora.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02"); //Zeptej se tam.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_8_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Mine_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00"); //Kdo to tady vede?
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01"); //Okyl velí v Kotlinì. Lee to øídí v táboøe.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02"); //Mìl bys s obìma promluvit.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_8_DasLager_Condition;
	information	= Info_Mine_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Co se dìje v táboøe?";
};                       

FUNC INT Info_Mine_Sld_8_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00"); //Co se dìje v táboøe?
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01"); //Støežíme vstup do dolu.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02"); //Nikdo kromì našich lidí tam nesmí.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_8_DieLage_Condition;
	information	= Info_Mine_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Všechno v poøádku?";
};                       

FUNC INT Info_Mine_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00"); //Všechno v poøádku?
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01"); //Na co ses ptal? Máme všechno pod kontrolou.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_8(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
};
