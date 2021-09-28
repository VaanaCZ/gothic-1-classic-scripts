// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak se m��u p�idat do spolku ruda��?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Jak se m��u p�idat do spolku ruda��?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //P�idat se k n�m? Nemysli na to. Nepracujeme tu, pokud n�s k tomu n�kdo nedonut�.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Jestli si mysl�, �e se tu m��e� jen tak poflakovat, tak uvid�, p��teli.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Jestli si je�t� mysl�, �e je tohle m�sto pro tebe to prav�, pak by sis m�l promluvit se Swineym. To je ten ruda�, co tady cel� den poku�uje.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo tady m� velen�?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Velen�? Rozhl�dni se kolem. Ur�it� nikdo, kdo by se d�el do �moru a sb�ral rudu. To je jist�.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Co to je?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Co to je?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //Co takhle m��e vypadat? Kr�lovsk� pal�c?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Jestli chce� opravdu pracovat ve Svobodn�m dole, mus� se nejd��ve vypracovat v Kotlin� a uk�zat, jestli m� pro n�s cenu.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Jak se m�?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //Jak to vid�m? �patn� jako v�dycky. Nic k j�dlu, spousta pr�ce.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Jedin�, kdo nic ned�l�, je Swiney. Okyl ho jmenoval mluv��m ruda��. Te� se tu cel� den rozhl�� a kontroluje, jestli nem� na rukou mozoly.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
