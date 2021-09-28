// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "Czym siê tu zajmujesz?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Czym siê tu zajmujesz?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Przekazujê m¹droœæ Œni¹cego naszym Nowicjuszom.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Sam jestem jeszcze Nowicjuszem, ale ju¿ wkrótce zostanê Baalem - jednym z Guru.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Rozmawia³em nawet z Y'Berionem. To wielki Wybraniec. Powiedzia³ mi, ¿e jeœli bêdê pracowa³ wystarczaj¹co ciê¿ko, nied³ugo sam zostanê wielkim mistrzem.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Ale to jeszcze przysz³oœæ. Nie spieszy mi siê, rozumiesz? Zostanê mistrzem, gdy przyjdzie odpowiednia pora.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //Chwilowo jestem bardzo zadowolony z mojej pracy.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "Na czym polega twoja praca?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Na czym polega twoja praca?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Wraz z kolegami testujê magiczne substancje opracowane przez Cor Kaloma w jego laboratorium.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Jego asystent przynosi nam co kilka dni coœ nowego, a my to testujemy.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //To ziele otwiera twoj¹ duszê. Po za¿yciu odpowiedniej iloœci bêdziesz móg³ nawi¹zaæ kontakt ze Œni¹cym!
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "A tobie uda³o siê kiedyœ stan¹æ przed obliczem Œni¹cego?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //A tobie uda³o siê kiedyœ stan¹æ przed obliczem Œni¹cego?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Nie, jeszcze nie! Ale tylko dlatego, ¿e nie dostajemy wystarczaj¹cej iloœci ziela.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom zawsze pyta nas o efekty, ale odnoszê wra¿enie, ¿e wcale mu nie zale¿y na moim zdaniu.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Jeœli jego wynalazki dzia³aj¹ stymuluj¹co, natychmiast trafiaj¹ do Guru...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Ale nied³ugo ja sam zostanê Guru. Wtedy otrzymam odpowiedni¹ porcjê ziela i bêdê móg³ osobiœcie wys³uchaæ g³osu Œni¹cego.
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "Chcia³bym do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Chcia³bym do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Chcesz do nas do³¹czyæ! To œwietnie! Zaczekaj... Tak, chyba móg³bym ci pomóc!
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Nie jestem jeszcze Guru, ale mam pewne wp³ywy w Bractwie.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Oczywiœcie musia³byœ wyœwiadczyæ mi drobn¹ przys³ugê. Rozmawia³eœ ju¿ z Fortuno?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Nie.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Tak.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Zatem masz swoj¹ dzienn¹ racjê? Jeœli mi j¹ oddasz, dobijemy targu.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Przemyœlê to sobie.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //W takim razie idŸ do niego i odbierz swoj¹ dzienn¹ racjê. Jeœli dasz mi ca³e ziele, które od niego otrzymasz, dobijemy targu.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Przemyœlê to sobie.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Joru chce dostaæ moj¹ dzienn¹ racjê ziela, któr¹ mogê dostaæ od Fortuno.");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "Mam ziele przy sobie. Mo¿emy zawrzeæ uk³ad.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Mam ziele przy sobie. Mo¿emy zawrzeæ uk³ad.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Dobrze. Zauwa¿y³eœ pewnie, ¿e ¿aden z Guru nie chce z tob¹ rozmawiaæ.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Mo¿esz to zmieniæ, sprawiaj¹c na nich dobre wra¿enie. Mogê ci powiedzieæ, jak tego dokonaæ.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Mia³ byæ Mrok Pó³nocy a nie jakaœ trawa! Przynieœ mi to, o co ciê prosi³em, wtedy dobijemy targu!
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "Jak mogê przekonaæ do siebie Guru?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Jak mogê przekonaæ do siebie Guru?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar wprowadza Nowicjuszy w tajniki magii.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Jeœli chcesz zwróciæ na siebie jego uwagê, pos³u¿ siê czarami.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Tylko nie potraktuj go od razu Uderzeniem Wiatru! Uœpij któregoœ z jego uczniów, albo coœ w tym stylu.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib to ten przy bramie. To jeden z najpotê¿niejszych ludzi w obozie. Lester bêdzie móg³ ci jakoœ pomóc. Porozmawiaj z nim jak tylko mistrz oddali siê na chwilê.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Pozostali Guru s¹ mniej wymagaj¹cy. Spróbuj siê im jakoœ przypodobaæ, a raz-dwa - dostaniesz siê do Bractwa!
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Dziêki za radê.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //W koñcu umowa to umowa, nie?
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"Aby zwróciæ na siebie uwagê Baal Cadara, mam rzuciæ zaklêcie snu na jednego z jego uczniów.");
		B_LogEntry	(CH1_JoinPsi,"Zapytam Lestera, w jaki sposób zjednaæ sobie sympatiê Baal Namiba. Muszê to tylko zrobiæ, gdy Guru nie bêdzie w pobli¿u!");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "Jak mogê opanowaæ magiê Œni¹cego?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,"Baal Cadar sprzedaje runy i magiczne zwoje.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Jak mogê opanowaæ magiê Œni¹cego?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar sprzedaje magiczne runy i zwoje z zaklêciami, ale to dla ciebie niewielka pociecha, bo nie bêdzie chcia³ z tob¹ rozmawiaæ.
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Mo¿e inny Guru bêdzie móg³ ci pomóc.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Weißt du, es ist ziemlich gut. Es öffnet deinen Geist für die Worte des Schläfers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit für eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










