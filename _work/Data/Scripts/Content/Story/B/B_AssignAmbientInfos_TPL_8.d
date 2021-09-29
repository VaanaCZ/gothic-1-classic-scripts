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
	description = "KONIEC";
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
	description = "Nie przyda³by siê wam dodatkowy cz³owiek?";
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
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Nie przyda³by siê wam dodatkowy cz³owiek?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Zawsze chêtnie przyjmujemy nowych ludzi, ale czeka ciê jeszcze wiele pracy. Tylko najlepsi Nowicjusze mog¹ zostaæ Stra¿nikami Œwi¹tynnymi.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //To najwy¿sze wyró¿nienie, jakie mo¿e spotkaæ cz³onka Bractwa Œni¹cego.
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
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //Naszym œwiêtym obowi¹zkiem jest wype³nianie poleceñ Guru.
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02"); //Kim s¹ ci Guru?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Najwy¿szym z Guru jest jaœnie oœwiecony Y'Berion. Oprócz niego s¹ jeszcze Cor Kalom, Cor Angar oraz kilku innych.
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
	description = "Co mo¿esz mi powiedzieæ o tym obozie?";
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
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //Co mo¿esz mi powiedzieæ o tym obozie?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //Chocia¿ jesteœ tu nowy, mo¿esz bezpiecznie poruszaæ siê niemal po ca³ym obozie. Wyj¹tkiem jest jedynie œwi¹tynia Œni¹cego.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02"); //Dlatego staraj siê nie chadzaæ tam, gdzie ci nie wolno, oraz nie przeszkadzaj naszym mistrzom w medytacji.
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
	description = "Jak siê masz?";
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
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //Jak siê masz?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //Ostrzegam ciê! Oka¿ nieco wiêcej szacunku. Rozmawiasz z jednym z obroñców œwiêtych proroków.
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
