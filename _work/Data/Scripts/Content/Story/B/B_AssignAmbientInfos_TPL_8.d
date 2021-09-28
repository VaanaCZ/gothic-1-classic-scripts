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
	description = "Potøebujete spolehlivého muže?";
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
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Potøebujete spolehlivého muže?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Poøád hledáme spolehlivé muže. Musíš ale tvrdì pracovat, aby ses zdokonalil. Jen zkušení novicové se mohou stát templáøi.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //To je ta nejvìtší pocta pro všechny následovníky Spáèova Bratrstva.
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
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Kdo tady má velení?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //Dìláme to, co øeknou Guru. Sloužit jim je naše povinnost.
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_15_02"); //Kdo jsou ti Guru?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Y´Berion Osvícený je hlavou Guru. Pod ním jsou Cor Kalom a další.
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
	description = "Co mi mùžeš øíci o táboøe?";
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
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //Co mi mùžeš øíci o táboru?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //Jako nový pøíchozí mùžeš jít v podstatì kam chceš. Nevìrcùm však není povolen vstup do Spáèova chrámu.
	AI_Output(other,self,"Info_Tpl_8_DasLager_08_02"); //Takže choï jen tam, kam smíš. A také nevyrušuj naše pány pøi meditacích.
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
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //Jak se máš?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //Varuji tì. Nebuï nezdvoøilý. Mluvíš s jedním z vyvolených prorokových strážcù.
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
