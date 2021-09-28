// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_5_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_5 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_5_EXIT_Condition;
	information	= Info_Nov_5_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Nov_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_5_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_5_EinerVonEuchWerden_Condition;
	information	= Info_Nov_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak se m��u p�idat k t�boru?";
};                       

FUNC INT Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //Jak se m��u p�idat k t�boru?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //Nen� nic jednodu���ho. Prost� �ekne� p�r mlad�m Guru. Pom��ou ti.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //Bude se ti tu l�bit, uvid�.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_5_WichtigePersonen_Condition;
	information	= Info_Nov_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //Guru maj� v�echno pod kontrolou. Pokud ale na sebe nebude� p�itahovat pozornost, nechaj� t� na pokoji
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_5_DasLager_Condition;
	information	= Info_Nov_5_DasLager_Info;
	permanent	= 1;
	description = "Co mi m��e� ��ci o t�bo�e?";
};                       

FUNC INT Info_Nov_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //Co mi m��e� ��ci o t�boru?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //Je to nejlep�� m�sto v cel� t�hle proklat� kolonii.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Dokonce i kdy� nebude� v��it Sp��ovu u�en�, dostane� sv�j denn� p��d�l drogy z ba�in. V�echno, co mus� ud�lat, je ��ci si Fortunovi.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Kde ho najdu?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04"); //Dole pod d�lnou Cora Kaloma, kousek od velk�ho templ��sk�ho dvora.
	
	var C_NPC CorKalom;		CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_5_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_5_DieLage_Condition;
	information	= Info_Nov_5_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Nov_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //Nem��u si st�ovat. Ty jsi tady nov�?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //Jen jsem pr�v� p�i�el.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_5(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
