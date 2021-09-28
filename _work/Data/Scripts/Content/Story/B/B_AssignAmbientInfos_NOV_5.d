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
	description = "KONIEC";
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
	description = "W jaki sposób mogê do was do³¹czyæ?";
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
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //W jaki sposób mogê do was do³¹czyæ?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //Nic prostszego. Porozmawiaj z m³odszymi Guru. Oni ci chêtnie pomog¹.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //Spodoba ci siê tutaj, uwierz mi.
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
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //Guru sprawuj¹ kontrolê nad ca³ym obozem, ale jeœli nie bêdziesz siê wychyla³, zostawi¹ ciê w spokoju.
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
	description = "Co mo¿esz mi powiedzieæ o tym obozie?";
};                       

FUNC INT Info_Nov_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //Co mo¿esz mi powiedzieæ o tym obozie?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //To najwspanialsze miejsce w ca³ej cholernej kolonii.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Nawet jeœli nie wierzysz w nauki Œni¹cego, dostaniesz dzienn¹ racjê jedzenia i ziela. Wystarczy tylko zg³osiæ siê do Fortuno.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Gdzie go znajdê?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04"); //Pod laboratorium Cor Kaloma, w pobli¿u dziedziñca wielkiej œwi¹tyni.
	
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
	description = "Co s³ychaæ?";
};                       

FUNC INT Info_Nov_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //Nie mogê narzekaæ. Jesteœ tu nowy, prawda?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //Dopiero co przyby³em.
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
