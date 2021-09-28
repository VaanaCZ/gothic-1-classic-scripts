// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_13_EXIT_Condition;
	information	= Info_Tpl_13_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_13_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chcê zostaæ Œwi¹tynnym Stra¿nikiem, tak jak ty!";
};                       

FUNC INT Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToOldCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //Chcê zostaæ Œwi¹tynnym Stra¿nikiem, tak jak ty!
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //Czy masz pojêcie, jakich wyrzeczeñ wymaga³a ode mnie s³u¿ba wybrañcom Œni¹cego w Œwi¹tynnej Stra¿y?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //Chyba nie myœlisz, ¿e przyjdziesz tu i tak po prostu otrzymasz najwy¿sze wyró¿nienie?!
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Zanim choæby zaczniesz o tym myœleæ, powinieneœ lepiej poznaæ najwa¿niejsze nauki Œni¹cego.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //To powinno zaj¹æ ci trochê czasu i przywróciæ odrobinê zdrowego rozs¹dku.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_13_WichtigePersonen_Condition;
	information	= Info_Tpl_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01"); //Nasi Guru s¹ wybrañcami Œni¹cego! Œni¹cy posiada w³adzê nad ¿yciem ka¿dego z nas, a Guru objawiaj¹ nam jego wolê.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_13_DasLager_Condition;
	information	= Info_Tpl_13_DasLager_Info;
	permanent	= 1;
	description = "Chcia³bym rozejrzeæ siê wewn¹trz œwi¹tyni Œni¹cego...";
};                       

FUNC INT Info_Tpl_13_DasLager_Condition()
{	
	if (Kapitel <= 1) 
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00"); //Chcia³bym rozejrzeæ siê wewn¹trz œwi¹tyni Œni¹cego...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01"); //To nie do pomyœlenia! Niewierny w œwi¹tyni! Dopóki nie przysiêgniesz wype³niaæ wolê Œni¹cego, nie bêdzie ci wolno wejœæ do jego domu modlitwy!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_13_DieLage_Condition;
	information	= Info_Tpl_13_DieLage_Info;
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT Info_Tpl_13_DieLage_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00"); //Jak leci?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01"); //Odk¹d zosta³em jednym z wybranych obroñców wiary czujê siê tak wspaniale, jak nigdy dot¹d w moim ¿yciu!
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02"); //To chyba bardzo odpowiedzialna funkcja?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03"); //Jako niewierny nie jesteœ w stanie tego zrozumieæ...
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_13(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Tpl_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
