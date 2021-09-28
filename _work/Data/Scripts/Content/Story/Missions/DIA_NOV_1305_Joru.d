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
	description = "Co tady dìláš?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Co tady dìláš?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Uèím novice Spáèovu poselství.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Jsem ještì novic, ale brzy budu Baal - jeden z Guru.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Už jsem mluvil s Y´Berionem. Je tím vyvoleným. Øíkal mi, že jestli budu tvrdì pracovat, mùžu se zanedlouho sám stát mistrem.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Poøád to ale odkládám. Žádný spìch - rozumíš? Mùžu se stát mistrem kdykoliv.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //V tuhle chvíli jsem docela spokojený se svým souèasným posláním.
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
	description = "Jaké je teï tvoje poslání?";
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
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Jaké je teï tvoje poslání?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Zkouším tu se svými kamarády nové substance, které ve své dílnì vyrobil Cor Kalom.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Jeho úsilí nám každých pár dní pøináší nìco nového. A my to testujeme.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Tahle droga otevírá duši. Když vezmeš správné množství, mùžeš vejít do spojení se Spáèem.
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
	description = "Už jsi byl nìkdy ve spojení se Spáèem?";
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
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //Už jsi byl nìkdy ve spojení se Spáèem?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Ne. Ještì ne. Ale jen protože jsem nikdy nemìl dost té látky.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom chce vždycky vìdìt o vyvolaných úèincích, ale mám dojem, že ho mùj názor vlastnì doopravdy nezajímá.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Jestliže zjistím, že ta látka stimuluje, pøedá ji pøímo Guru...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Brzy ale budu sám Guru, a pak budu moci zajít až na hranici svých možností a naslouchat Spáèovu hlasu sám.
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
	description = "Rád bych se pøidal k vašemu táboru - pomùžeš mi?";
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
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Rád bych se pøidal k vašemu táboru - pomùžeš mi?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Chceš se k nám pøidat? To je dobøe! Poèkej chvíli... ano, myslím, že ti mùžu pomoci.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Nejsem ještì Guru, mám ale urèitý vliv na Bratrstvo.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Musíš mi prokázat malou laskavost. Už jsi vidìl Fortuna?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Ne.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Ano.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Pak už máš svùj denní pøídìl? Když mi ho dáš, jsme domluveni.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Rozmyslím si to.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Pak jdi za ním a  vyzvedni si svùj denní pøídìl. Když mi pøenecháš všechnu drogu z bažin, kterou ti dá, budeme domluveni.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Rozmyslím si to.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Joru by chtìl mùj denní pøídìl drogy z bažin, kterou jsem dostal od Fortuna.");
	
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
	description = "Mám svoji drogu z bažin. Mùžeš ji mít.";
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
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Mám svoji drogu z bažin. Mùžeš ji mít.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Dobøe! Jistì sis všimnul, že s tebou nikdo z Guru nechce mluvit.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Mùžeš to zmìnit tím, že na nì udìláš dojem. Mùžu ti øíci, jak to udìlat.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Domluvili jsme si tøi Severní soumraky a nic jiného! Dej mi je a POTOM se mùžeme bavit!
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
	description = "Jak mùžu udìlat dojem na Guru?";
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
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Jak mùžu udìlat dojem na Guru?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar cvièí novice ve Spáèovì magii.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Jestliže chceš upoutat jeho pozornost, použij kouzlo.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Nepoužívej však na nìj Vìtrnou pìst! Uspi jeho posluchaèe nebo nìco takového.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib, za hlavní branou, je jeden z nejtvrdších. Myslím, že by ti s ním mohl pomoci Lester. Promluv s ním, jakmile bude jeho pán pryè.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Ostatní Guru jsou vcelku v pohodì - snaž se být užiteèný.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Díky za radu.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Hej - dohoda je dohoda.
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"Abych udìlal dojem na Baala Cadara, musel jsem seslat na jednoho z jeho posluchaèù spací kouzlo.");
		B_LogEntry	(CH1_JoinPsi,"Zeptám se novice Lestera, jak udìlat dojem na Baala Namiba pøebývajícího u hlavní brány. Mìl bych se ujistit, že není v blízkosti žádný guru!");
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
	description = "Jak se dostanu ke Spáèovì magii?";
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
		B_LogEntry		(GE_TraderPSI,"Baal Cadar prodává RUNY a SVITKY.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Jak se dostanu ke Spáèovì magii?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar prodává runy a zaøíkávací svitky. Ale to je ti vlastnì k nièemu, dokud si s ním nepromluvíš, že?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Možná ti pomùže jiný Guru.
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


	










