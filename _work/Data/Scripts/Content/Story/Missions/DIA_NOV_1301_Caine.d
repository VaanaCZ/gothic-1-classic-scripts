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
	description	= "Zdar! Jsem tu nový!";
};                       

FUNC int  DIA_Caine_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Hallo_Info()
{
	AI_Output (other, self,"DIA_Caine_Hallo_15_00"); //Zdar! Jsem tady nový!
	AI_Output (self, other,"DIA_Caine_Hallo_13_01"); //Já... Já... Já jsem Caine, žák Cora Kaloma. Urèitì jsi o nìm slyšel, že jo?
			
	Info_ClearChoices	(DIA_Caine_Hallo );
	Info_AddChoice		(DIA_Caine_Hallo,"Ne.",DIA_Caine_Hallo_Nein);
	Info_AddChoice		(DIA_Caine_Hallo,"Ano.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Ja_15_00"); //Tak.
	AI_Output (self, other,"DIA_Caine_Hallo_Ja_13_01"); //Pak musíš vìdìt, že je to druhý muž tohohle tábora... p-po Y´Berionovi.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Nein_15_00"); //Ne.
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_01"); //Ne?! Ty tady asi nebudeš dlouho, viï?
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_02"); //Cor Kalom je druhý nejdùležitìjší muž po Y´Berionovi. Rozhoduje, kdo se k nám mùže pøidat jako novic.
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
	description	= "Co je tvá práce?";
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
	AI_Output (other, self,"DIA_Caine_Job_15_00"); //A co máš na starosti ty?
	AI_Output (self, other,"DIA_Caine_Job_13_01"); //Já... Já... Já pomáhám svému mistrovi pøipravovat alchymistické lektvary.
	AI_Output (self, other,"DIA_Caine_Job_13_02"); //Vìtšinou z d-drogy z b-bažin a z výmìškù dùlních èervù. T.. ten výmìšek je nesmírnì žádaný.
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
	description	= "Kde dostanu ten výmìšek dùlních èervù?";
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
	AI_Output (other, self,"DIA_Caine_WoSekret_15_00"); //Kde dostanu ten výmìšek dùlních èervù?
	AI_Output (self, other,"DIA_Caine_WoSekret_13_01"); //Èervy najdeš ve Starém dole. Musíš ale vìdìt, jak ten výmìšek získat.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_02"); //Jestli chceš s tìmi bestiemi opravdu bojovat, mìl by sis promluvit s nìkterým z templáøù, kteøí s tím mají zkušenosti. Jako tøeba Gor Na Drak.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_03"); //Cestuje mezi naším táborem a Starým dolem každý den. R-ráno ho najdeš v dílnì.
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
	description	= "Co mi ještì mùžeš øíci o svém mistrovi?";
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
	AI_Output (other, self,"DIA_Caine_AddInfoKalom_15_00"); //Co mi ještì mùžeš øíci o svém mistrovi?
	AI_Output (self, other,"DIA_Caine_AddInfoKalom_13_01"); //On... on není jako... ostatní Guru. Každý se na nìj mùže obrátit, ale... ale NIKDO nesmí plýtvat jeho vzácným èasem.
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
	description		= "Jak dostanu Kalomùv recept?"; 
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
	AI_Output (other, self,"Nov_1301_Caine_CHEST_Info_15_01"); //Jak dostanu Kalomùv recept?
	AI_Output (self, other,"Nov_1301_Caine_CHEST_Info_13_02"); //Nedostaneš ho. Má ho zamèený ve své truhle a nikomu ho nedá.
};  
