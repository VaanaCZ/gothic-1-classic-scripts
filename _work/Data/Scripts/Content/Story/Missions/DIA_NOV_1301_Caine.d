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
	description	= "Привет! Я новенький!";
};                       

FUNC int  DIA_Caine_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Caine_Hallo_Info()
{
	AI_Output (other, self,"DIA_Caine_Hallo_15_00"); //Привет! Я новенький!
	AI_Output (self, other,"DIA_Caine_Hallo_13_01"); //А я Каин. Ученик Кор Галома. Ты ведь уже слышал о нем, правда?
			
	Info_ClearChoices	(DIA_Caine_Hallo );
	Info_AddChoice		(DIA_Caine_Hallo,"Нет."	,DIA_Caine_Hallo_Nein);
	Info_AddChoice		(DIA_Caine_Hallo,"Да."		,DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Ja_15_00"); //Да.
	AI_Output (self, other,"DIA_Caine_Hallo_Ja_13_01"); //Тогда ты знаешь, что он правая рука Юбериона.
	Info_ClearChoices	(DIA_Caine_Hallo );
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output (other, self,"DIA_Caine_Hallo_Nein_15_00"); //Нет.
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_01"); //Не слышал? Ты недавно сюда пришел, да?
	AI_Output (self, other,"DIA_Caine_Hallo_Nein_13_02"); //Кор Галом - правая рука Юбериона. Наш Учитель прислушивается к его советам. От него зависит, кто будет принят в Братство, а кто нет.
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
	description	= "Ich wьrde gerne mit Cor Kalom reden - kannst du mir dabei helfen?";
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
	AI_Output (other, self,"DIA_Caine_WaysToKalom_15_00"); //Ich wьrde gerne mit Cor Kalom reden - kannst du mir dabei helfen?
	AI_Output (self, other,"DIA_Caine_WaysToKalom_13_01"); //Wenn du zu Cor Kalom willst, muЯt du einen guten Grund haben.
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
	description	= "Was fьr alchimistische Substanzen kann ich Kalom bringen?";
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
	AI_Output (other, self,"DIA_Caine_Alchemies_15_00"); //Was fьr alchimistische Substanzen kann ich Kalom bringen?
	AI_Output (self, other,"DIA_Caine_Alchemies_13_01"); //Kalom benцtigt vor allem das Sekret der Minecrawler. Wenn du ihm genug davon beschaffst, wird dich die Wache sicher vorlassen.
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
	description	= "А что делаешь ты?";
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
	AI_Output (other, self,"DIA_Caine_Job_15_00"); //А что делаешь ты?
	AI_Output (self, other,"DIA_Caine_Job_13_01"); //Я помогаю Кор Галому готовить алхимические зелья.
	AI_Output (self, other,"DIA_Caine_Job_13_02"); //Для этого используется болотник и слюна ползунов. Но сейчас ему необходима именно слюна.
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
	description	= "Как добывать слюну ползунов?";
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
	AI_Output (other, self,"DIA_Caine_WoSekret_15_00"); //Как добывать слюну ползунов?
	AI_Output (self, other,"DIA_Caine_WoSekret_13_01"); //Ползуны живут в Старой шахте. Недостаточно их убить. Слюну добудет тот, кто знает, как это делается.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_02"); //Если ты действительно хочешь научиться добывать слюну, тебе стоит поговорить с Гор На Драком. Он хорошо в этом разбирается.
	AI_Output (self, other,"DIA_Caine_WoSekret_13_03"); //Каждый день он ходит к Старой шахте. Утром ты сможешь его встретить внизу, под лабораторией.
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
	description	= "Ты можешь рассказать мне что-нибудь еще о твоем учителе?";
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
	AI_Output (other, self,"DIA_Caine_AddInfoKalom_15_00"); //Ты можешь рассказать мне что-нибудь еще о твоем учителе?
	AI_Output (self, other,"DIA_Caine_AddInfoKalom_13_01"); //Он не похож на других Гуру. Он отвечает всем, кто захочет с ним поговорить, но все же не стоит отвлекать его по пустякам.
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
	AI_Output (self, other,"DIA_Caine_WieGuruSend_13_01"); //Darьber kann die Lester mehr erzдhlen.
	AI_Output (self, other,"DIA_Caine_WieGuruSend_13_02"); //Bis vor kurzen hat er noch fьr Cor Kalom gearbeitet, jetzt kьmmert er sich zusammen mit den Gurus um die Neuen.
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
	description		= "Мне нужно достать у Кор Галома рецепт его зелья."; 
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
	AI_Output (other, self,"Nov_1301_Caine_CHEST_Info_15_01"); //Мне нужно достать у Кор Галома рецепт его зелья.
	AI_Output (self, other,"Nov_1301_Caine_CHEST_Info_13_02"); //Ты не сможешь этого сделать. Он хранится в личном сундуке Кор Галома. Не думаю, что он захочет делиться с кем-то своими тайнами.
};  
