// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespr‰ch
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
	description = "Co kdybych se dal k v·m?";
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
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Co kdybych se dal k v·m?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //P¯idat se k n·m? Jako co? Jako nosiË vody?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Ne, jako ruda¯.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //PodÌvej, nÏco ti ¯eknu: nikdo se DOBROVOLNÃ nestane ruda¯em.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Dobr·, kdyû na tom trv·ö... Jdi a promluv si se Swineym, vsadÌm se, ûe m· krump·Ë nazbyt a ûe ti ho r·d p¯enech·.
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
	description = "Kdo je tu nejd˘leûitÏjöÌ?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Kdo je tu nejd˘leûitÏjöÌ?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Nejd˘leûitÏjöÌ? Samoz¯ejmÏ j·.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //MyslÌm, ûe vÌö, kdo tady velÌ.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Dob¯e, asi by sis mÏl promluvit se ûold·ky nebo s bandity. K VodnÌm m·g˘m se nedostaneö.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Ten velkohub˝ Swiney se dÏl· d˘leûitÏjöÌ neû je. P¯itom akor·t rozdÏluje krump·Ëe a dÏl·, co mu na¯ÌdÌ Okyl.
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
	description = "Co m˘ûe t·bor nabÌdnout?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Co m˘ûe t·bor nabÌdnout?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Cokoliv, co si zaslouûÌö. Pro nÏkterÈ tu nenÌ nic neû pr·ce a pro jinÈ spousta uûÌv·nÌ.
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
	description = "Jak se tady ûije?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Jak se tady ûije?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Par·da!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //A protoûe jsme tu tak öùastnÌ, udÏl·me nejlÈpe, kdyû odsud vypadneme.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Co si myslÌö, ûe tohle mÌsto je? Je to vÏzenÌ a ve vÏzenÌ nikdo ûÌt nechce.
	
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
