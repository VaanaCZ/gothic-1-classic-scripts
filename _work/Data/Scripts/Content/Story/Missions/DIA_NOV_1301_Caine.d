// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Caine_Exit (C_INFO)
{
	npc			=  Nov_1301_Caine;
	nr			=  999;
	condition	=  DIA_Caine_Exit_Condition;
	information	=  DIA_Caine_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Caine_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Caine_Hallo (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 1;
	condition	= DIA_Caine_Hallo_Condition;
	information	= DIA_Caine_Hallo_Info;
	permanent	= 0;
	description	= "Salve! Sono nuovo di qui!";
};                       

FUNC int  DIA_Caine_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Hallo_Info()
{
	AI_Output (other, self,"DIA_Caine_Hallo_15_00"); //Salve! Sono nuovo di qui!
	AI_Output (self, other,"DIA_Caine_Hallo_13_01"); //I... I... Io sono Caine, uno studente di Cor Kalom. Hai sentito parlare di lui, vero?
			
	Info_ClearChoices	(DIA_Caine_Hallo );
	Info_AddChoice		(DIA_Caine_Hallo,"No.",DIA_Caine_Hallo_Nein);
	Info_AddChoice		(DIA_Caine_Hallo,"Sì.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Ja_15_00"); //Sì.
	AI_Output (self, other,"DIA_Caine_Hallo_Ja_13_01"); //Allora saprai che è il secondo uomo più importante del campo... d-dopo Y'Berion.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Nein_15_00"); //No.
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_01"); //No? Non sei qui da molto, vero?
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom è il secondo uomo più importante del campo dopo Y'Berion e decide chi può essere ammesso fra i novizi.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

/*
// **************************************************
//						Zu Kalom
// **************************************************

instance  DIA_Caine_WaysToKalom (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_WaysToKalom_Condition;
	information	= DIA_Caine_WaysToKalom_Info;
	permanent	= 0;
	description	= "Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?";
};                       

FUNC int  DIA_Caine_WaysToKalom_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Hallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_WaysToKalom_Info()
{
	AI_Output (other, self,"DIA_Caine_WaysToKalom_15_00"); //Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?
	AI_Output (self, other,"DIA_Caine_WaysToKalom_13_01"); //Wenn du zu Cor Kalom willst, mußt du einen guten Grund haben.
	AI_Output (self, other,"DIA_Caine_WaysToKalom_13_02"); //Die Wache hat Anweisung, nur die vorzulassen, die Alchimistische Substanzen bringen oder von einen der Gurus geschickt wurden.
};

// **************************************************
//				Alchimistische Subsatanzen
// **************************************************

instance  DIA_Caine_Alchemies (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_Alchemies_Condition;
	information	= DIA_Caine_Alchemies_Info;
	permanent	= 0;
	description	= "Was für alchimistische Substanzen kann ich Kalom bringen?";
};                       

FUNC int  DIA_Caine_Alchemies_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_WaysToKalom))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_Alchemies_Info()
{
	AI_Output (other, self,"DIA_Caine_Alchemies_15_00"); //Was für alchimistische Substanzen kann ich Kalom bringen?
	AI_Output (self, other,"DIA_Caine_Alchemies_13_01"); //Kalom benötigt vor allem das Sekret der Minecrawler. Wenn du ihm genug davon beschaffst, wird dich die Wache sicher vorlassen.
	AI_Output (self, other,"DIA_Caine_Alchemies_13_02"); //Er braucht zwar auch Pflanzen und Beeren, die man zwischen den Lagern findet, aber die nimmt Fortuno unten an.
};

*/

// **************************************************
//						Job = Substanzen 
// **************************************************

instance  DIA_Caine_Job (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_Job_Condition;
	information	= DIA_Caine_Job_Info;
	permanent	= 0;
	description	= "Qual è il tuo compito?";
};                       

FUNC int  DIA_Caine_Job_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Hallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_Job_Info()
{
	AI_Output (other, self,"DIA_Caine_Job_15_00"); //Qual è il tuo compito?
	AI_Output (self, other,"DIA_Caine_Job_13_01"); //I... i... io aiuto il maestro a preparare le pozioni magiche.
	AI_Output (self, other,"DIA_Caine_Job_13_02"); //Soprattutto e-erba di palude e secrezione di pidocchi di miniera. C'è...c'è bisogno urgente soprattutto di secrezione.
};

// **************************************************
//						Wo Sekret
// **************************************************

instance  DIA_Caine_WoSekret (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_WoSekret_Condition;
	information	= DIA_Caine_WoSekret_Info;
	permanent	= 0;
	description	= "Dove trovo la secrezione dei pidocchi di miniera?";
};                       

FUNC int  DIA_Caine_WoSekret_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Job))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_WoSekret_Info()
{
	AI_Output (other, self,"DIA_Caine_WoSekret_15_00"); //Dove trovo la secrezione dei pidocchi di miniera?
	AI_Output (self, other,"DIA_Caine_WoSekret_13_01"); //Troverai i pidocchi nella vecchia miniera, ma devi sapere come ottenere la secrezione.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_02"); //Se davvero hai intenzione di combattere quelle bestie, farai meglio a parlare con un templare esperto come Gor Na Dak.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_03"); //Ogni giorno, fa avanti e indietro dal campo a... alla vecchia miniera. L-la mattina puoi trovarlo al laboratorio.
};

// **************************************************
//						AddInfoKalom
// **************************************************

instance  DIA_Caine_AddInfoKalom (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_AddInfoKalom_Condition;
	information	= DIA_Caine_AddInfoKalom_Info;
	permanent	= 0;
	description	= "Cos'altro puoi dirmi sul tuo maestro?";
};                       

FUNC int  DIA_Caine_AddInfoKalom_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_Job))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_AddInfoKalom_Info()
{
	AI_Output (other, self,"DIA_Caine_AddInfoKalom_15_00"); //Cos'altro puoi dirmi sul tuo maestro?
	AI_Output (self, other,"DIA_Caine_AddInfoKalom_13_01"); //Lui... lui non è come... gli altri guru. Tutti possono parlargli, ma... ma NESSUNO deve fargli perdere tempo.
};


/*
// **************************************************
//						
// **************************************************

instance  DIA_Caine_WieGuruSend (C_INFO)
{
	npc			= Nov_1301_Caine;
	nr			= 2;
	condition	= DIA_Caine_WieGuruSend_Condition;
	information	= DIA_Caine_WieGuruSend_Info;
	permanent	= 0;
	description	= "Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt.";
};                       

FUNC int  DIA_Caine_WieGuruSend_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Caine_WaysToKalom))
	{
		return 1;
	};
};

FUNC VOID  DIA_Caine_WieGuruSend_Info()
{
	AI_Output (other, self,"DIA_Caine_WieGuruSend_15_00"); //Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt.
	AI_Output (self, other,"DIA_Caine_WieGuruSend_13_01"); //Darüber kann die Lester mehr erzählen.
	AI_Output (self, other,"DIA_Caine_WieGuruSend_13_02"); //Bis vor kurzen hat er noch für Cor Kalom gearbeitet, jetzt kümmert er sich zusammen mit den Gurus um die Neuen.
};
*/

/*------------------------------------------------------------------------
						REZEPT INNER TRUHE									
------------------------------------------------------------------------*/

instance  Nov_1301_Caine_CHEST (C_INFO)
{
	npc				= Nov_1301_Caine;
	condition		= Nov_1301_Caine_CHEST_Condition;
	information		= Nov_1301_Caine_CHEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Come posso avere la ricetta di Kalom?"; 
};

FUNC int  Nov_1301_Caine_CHEST_Condition()
{	
	if 	(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  Nov_1301_Caine_CHEST_Info()
{
	AI_Output (other, self,"Nov_1301_Caine_CHEST_Info_15_01"); //Come posso avere la ricetta di Kalom?
	AI_Output (self, other,"Nov_1301_Caine_CHEST_Info_13_02"); //Non puoi. La tiene in uno scrigno e la chiave non la dà a nessuno.
};  
