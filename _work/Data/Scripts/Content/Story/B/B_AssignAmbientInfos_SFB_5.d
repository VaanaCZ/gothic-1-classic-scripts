// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
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
	description = "Co kdybych se dal k vám?";
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
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Co kdybych se dal k vám?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Přidat se k nám? Jako co? Jako nosič vody?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Ne, jako rudař.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Podívej, něco ti řeknu: nikdo se DOBROVOLNĚ nestane rudařem.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Dobrá, když na tom trváš... Jdi a promluv si se Swineym, vsadím se, že má krumpáč nazbyt a že ti ho rád přenechá.
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
	description = "Kdo je tu nejdůležitější?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Kdo je tu nejdůležitější?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Nejdůležitější? Samozřejmě já.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Myslím, že víš, kdo tady velí.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Dobře, asi by sis měl promluvit se žoldáky nebo s bandity. K Vodním mágům se nedostaneš.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Ten velkohubý Swiney se dělá důležitější než je. Přitom akorát rozděluje krumpáče a dělá, co mu nařídí Okyl.
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
	description = "Co může tábor nabídnout?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Co může tábor nabídnout?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Cokoliv, co si zasloužíš. Pro některé tu není nic než práce a pro jiné spousta užívání.
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
	description = "Jak se tady žije?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Jak se tady žije?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Paráda!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //A protože jsme tu tak šťastní, uděláme nejlépe, když odsud vypadneme.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Co si myslíš, že tohle místo je? Je to vězení a ve vězení nikdo žít nechce.
	
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
