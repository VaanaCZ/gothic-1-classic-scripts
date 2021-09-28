// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Mi manda Lefty. Ti ho portato un po' d'acqua.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Mi manda Lefty. Ti ho portato un po' d'acqua.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Grazie, amico, ho la bocca secca come il deserto!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Acqua! Ehi, è finita! Non dirmi che l'hanno avuta tutti tranne me ancora una volta!
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Salve! Cosa succede da queste parti?";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Salve! Cosa succede da queste parti?
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Chiedi a qualcun altro. Io qui lavoro e basta: non so nulla.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Amico, come vorrei dire al Signore del Riso di farlo lui questo schifo di lavoro!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Se non ti piace, perché lavori qui?";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Se non ti piace, perché lavori qui?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //È successo il giorno che sono arrivato qui. Lefty, uno degli scagnozzi del Signore del Riso, è venuto da me e mi ha chiesto se potevo dare una mano nelle risaie.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Certo!', gli risposi. Ero nuovo e volevo rendermi utile.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Il giorno dopo, mentre mi stavo riposando, è tornato da me.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Mi ha chiesto: 'Non vorrai che i tuoi colleghi sbrighino tutto il lavoro, vero?'
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Gli ho detto che ero esausto per il lavoro del giorno precedente, che avevo bisogno di riposo eccetera. Ma non mi ha ascoltato.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Mi ha preso per il colletto e trascinato di nuovo nel campo.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Da allora, ogni giorno si fermava dietro la mia porta, finché non mi sono abituato a muovermi dal solo. Non voglio avere problemi con gente come lui.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //Sono dei veri e propri tagliagole, meglio che tu ne stia alla larga.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 1;
	description	= "Chi è il Signore del Riso?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Chi è il Signore del Riso?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Uno dei primi che è giunto qui. Ha dato una mano a creare il campo e ha avviato le risaie.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Oramai passa tutto il tempo al magazzino a rimpinzarsi, quel porco!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
