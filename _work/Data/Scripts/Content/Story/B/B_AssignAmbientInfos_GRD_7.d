// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Cosa devo fare per diventare una guardia di Gomez?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Cosa devo fare per diventare una guardia di Gomez?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Tu?!? Stai scherzando! Pensi di poter arrivare qui e salire dritto in cima?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Solo i migliori entrano a far parte delle guardie di Gomez.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Devi far carriera come chiunque altro e provare la tua lealtà come Ombra.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi comanda qui?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Chi comanda qui?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus controlla la vita nel campo. Diego è il suo luogotenente.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Se vuoi andare da qualche parte, devi parlare con loro.
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "Qui lavorano tutti per Gomez?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Qui tutti lavorano per Gomez?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //No. La maggior parte è composta da minatori normali.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Solo noi guardie e le Ombre siamo con Gomez.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"INDIETRO", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Cosa fanno le guardie?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Cosa fanno le Ombre?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Cosa fanno i minatori?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Cosa fanno le guardie?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Sorvegliano il campo e proteggono i minatori.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Siamo pagati da Gomez e dai minatori. È un lavoro molto remunerativo.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Cosa fanno le Ombre?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Fanno eseguire gli ordini di Gomez.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Molti sono comuni leccapiedi che cercano di fare carriera. Se vuoi farti strada qui dentro, è quello il primo passo.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Fai il tuo lavoro senza sbagliare per un certo periodo e potrai aspirare a diventare uno di noi.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Quando sei con Gomez, nessuno osa darti fastidio!
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Cosa fanno i minatori?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Bella domanda! Non dovremmo neppure farli uscire dalla miniera!
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Dopo che sono stati un po' nella miniera, tornano in superficie per spendere le loro paghe.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Quando hanno dilapidato tutto, tornano nella miniera. Quasi tutti si comportano in questo modo.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Sembri tagliato per un lavoro migliore di questo. Dovresti andare a far quattro chiacchiere con Thorus, se non l'hai già fatto.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Vuoi dire come va per te? Finché non sceglierai un campo, nessuno ti prenderà sul serio!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
