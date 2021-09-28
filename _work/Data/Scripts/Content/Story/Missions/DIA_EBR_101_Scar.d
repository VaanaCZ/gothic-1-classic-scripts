// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "Chi sei?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Chi sei?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Mi chiamo Scar.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "Qual è il tuo compito?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Che lavoro fai?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Io e Arto ci assicuriamo che nessuno possa vedere Gomez senza permesso.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Inoltre mi occupo di non far riposare le donne.
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "Quando mi hanno gettato qui, ho visto una donna che veniva fatta scendere...";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Quando mi hanno gettato qui, ho visto una donna che veniva fatta scendere insieme alle merci.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //E allora?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //È qui?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Se sei interessato a lei, lascia che ti dia un consiglio: dimenticala.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Appena è arrivata, Gomez l'ha chiusa a chiave nella sua camera da letto.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Quando avrà finito con lei, forse la rimanderà indietro. In ogni caso, per ora è SUA, quindi farai meglio a non pensarci.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 1;
	description = "Puoi dirmi qualcosa su Gomez?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Puoi dirmi qualcosa su Gomez?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //Tutto ciò che devi sapere è che si tratta dell'uomo più potente della colonia.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Prende quello che vuole, ma tutto ciò che desidera veramente è il potere.
};

