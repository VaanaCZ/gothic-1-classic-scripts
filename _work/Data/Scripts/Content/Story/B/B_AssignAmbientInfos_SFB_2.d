// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespr�ch
// *************************************************************************

INSTANCE Info_SFB_2_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_2_Pre_Condition;
	information	= Info_SFB_2_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_2_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00"); //Co chce�? Nechci se dostat do mal�ru.
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_2_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_2_EXIT_Condition;
	information	= Info_SFB_2_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_SFB_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_2_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_2_EinerVonEuchWerden_Condition;
	information	= Info_SFB_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mus�m ud�lat, abych se k v�m mohl p�idat?";
};                       

FUNC INT Info_SFB_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00"); //Co mus�m ud�lat, abych se k v�m mohl p�idat?
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01"); //Tady ti nepom��u. Jsem jenom mal� p�n. �ekni Swineymu.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_2_WichtigePersonen_Condition;
	information	= Info_SFB_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady m� na starosti?";
};                       

FUNC INT Info_SFB_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01"); //Tady v kotlin� hl�dkuj� �old�ci. Ale v Nov�m t�bo�e jich tolik nen�.
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02"); //D�vej pozor, s k�m jedn�.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_2_DasLager_Condition;
	information	= Info_SFB_2_DasLager_Info;
	permanent	= 1;
	description = "Pot�ebuji se o tomto t�bo�e dozv�d�t v�c.";
};                       

FUNC INT Info_SFB_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_2_DasLager_15_00"); //Tady v kotlin� hl�dkuj� �old�ci. Ale v Nov�m t�bo�e jich tolik nen�.
	AI_Output(self,other,"Info_SFB_2_DasLager_02_01"); //Nev�m, jestli ti m��u pomoci. Lep�� bude, kdy� promluv� se Swineym nebo s �old�ky.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_2_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_2_DieLage_Condition;
	information	= Info_SFB_2_DieLage_Info;
	permanent	= 1;
	description = "Jak se tady �ije?";
};                       

FUNC INT Info_SFB_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_2_DieLage_15_00"); //Jak se tady �ije?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_01"); //Nest�uju si. Mus�me tady v�ichni dr�et spolu.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_02"); //Aspo� pr�ce je tady lep�� ne� ve Star�m t�bo�e.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_03"); //Ty jsi ze Star�ho t�bora?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_04"); //Jestli jsi ze Star�ho t�bora, tak si pamatuj, �e tady nechci ��dn� probl�my!
	AI_StopProcessInfos	(self);
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_2(var c_NPC slf)
{

	Info_SFB_2_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
