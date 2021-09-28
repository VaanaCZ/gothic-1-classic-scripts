// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "Cosa stai facendo?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Cosa stai facendo?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Distillo la grappa di riso.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Tieni, prendi un fiasco. Ma non dirlo a Silas!
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "Come va la distilleria?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Come va la distilleria?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Riesco a malapena a tenere a bada questi tizi. Quanto bevono!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //Molto bene. Finché sono impegnato, i segugi del Signore del Riso mi lasciano in pace.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "Cosa puoi dirmi sul Signore del Riso?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Cosa puoi dirmi sul Signore del Riso?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //Quel porco schifoso! I suoi scagnozzi raccolgono gli uomini più deboli e li costringono a lavorare nei campi.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //L'unico che potrebbe contrastarlo è Horatio, ma rifiuta la violenza.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //Una volta l'ho sentito dire che avrebbe voluto spaccare la testa al Signore del Riso, ma non l'avrebbe mai fatto davvero.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //Andrebbe contro i suoi principi.
};

