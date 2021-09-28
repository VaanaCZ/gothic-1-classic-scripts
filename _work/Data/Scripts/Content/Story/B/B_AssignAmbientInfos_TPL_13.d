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
	description = "KONEC";
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
	description = "Chci se stát templáøem jako ty.";
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
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //Chci se stát templáøem jako ty.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //Máš ponìtí, co všechno jsem musel vytrpìt, abych smìl sloužit mezi Spáèovými vyvolenými jako templáøská stráž?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //Nemysli si, že se tu budeš jen tak poflakovat a  požívat té nejvìtší pocty.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Ještì než se rozhodneš, mìl by ses trochu seznámit se Spáèovým uèením.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //To zabere nìjaký èas a mìlo by to do tebe naèerpat nìjaké vìdomosti.
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
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00"); //Kdo tady má velení?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01"); //Naši Guru jsou Spáèovi vyvolení! Spáè pøedurèuje náš osud a Guru jej vìští.
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
	description = "Chtìl bych se podívat do Spáèova chrámu...";
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
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00"); //Chtìl bych se podívat do Spáèova chrámu...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01"); //To je nemyslitelné! Nevìrec v Chrámu! Dokud se nezavážeš Spáèovi sloužit, nebudeš smìt do Chrámu vstoupit!
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
	description = "Jak to jde?";
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
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01"); //Od té doby, co jsem se stal jedním z vyvolených ochráncù víry, cítím se lépe než kdykoliv pøedtím.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02"); //To zní honosnì...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03"); //Jsi nevìrec. Nerozumíš tomu.
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
