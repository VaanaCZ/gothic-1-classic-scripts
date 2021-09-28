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
	description = "Co tady d�l�?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Co tady d�l�?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //U��m novice Sp��ovu poselstv�.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Jsem je�t� novic, ale brzy budu Baal - jeden z Guru.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //U� jsem mluvil s Y�Berionem. Je t�m vyvolen�m. ��kal mi, �e jestli budu tvrd� pracovat, m��u se zanedlouho s�m st�t mistrem.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Po��d to ale odkl�d�m. ��dn� sp�ch - rozum�? M��u se st�t mistrem kdykoliv.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //V tuhle chv�li jsem docela spokojen� se sv�m sou�asn�m posl�n�m.
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
	description = "Jak� je te� tvoje posl�n�?";
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
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Jak� je te� tvoje posl�n�?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Zkou��m tu se sv�mi kamar�dy nov� substance, kter� ve sv� d�ln� vyrobil Cor Kalom.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Jeho �sil� n�m ka�d�ch p�r dn� p�in�� n�co nov�ho. A my to testujeme.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Tahle droga otev�r� du�i. Kdy� vezme� spr�vn� mno�stv�, m��e� vej�t do spojen� se Sp��em.
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
	description = "U� jsi byl n�kdy ve spojen� se Sp��em?";
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
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //U� jsi byl n�kdy ve spojen� se Sp��em?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Ne. Je�t� ne. Ale jen proto�e jsem nikdy nem�l dost t� l�tky.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom chce v�dycky v�d�t o vyvolan�ch ��inc�ch, ale m�m dojem, �e ho m�j n�zor vlastn� doopravdy nezaj�m�.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Jestli�e zjist�m, �e ta l�tka stimuluje, p�ed� ji p��mo Guru...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Brzy ale budu s�m Guru, a pak budu moci zaj�t a� na hranici sv�ch mo�nost� a naslouchat Sp��ovu hlasu s�m.
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
	description = "R�d bych se p�idal k va�emu t�boru - pom��e� mi?";
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
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //R�d bych se p�idal k va�emu t�boru - pom��e� mi?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Chce� se k n�m p�idat? To je dob�e! Po�kej chv�li... ano, mysl�m, �e ti m��u pomoci.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Nejsem je�t� Guru, m�m ale ur�it� vliv na Bratrstvo.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Mus� mi prok�zat malou laskavost. U� jsi vid�l Fortuna?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Ne.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Ano.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Pak u� m� sv�j denn� p��d�l? Kdy� mi ho d�, jsme domluveni.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Rozmysl�m si to.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Pak jdi za n�m a  vyzvedni si sv�j denn� p��d�l. Kdy� mi p�enech� v�echnu drogu z ba�in, kterou ti d�, budeme domluveni.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Rozmysl�m si to.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Joru by cht�l m�j denn� p��d�l drogy z ba�in, kterou jsem dostal od Fortuna.");
	
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
	description = "M�m svoji drogu z ba�in. M��e� ji m�t.";
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
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //M�m svoji drogu z ba�in. M��e� ji m�t.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Dob�e! Jist� sis v�imnul, �e s tebou nikdo z Guru nechce mluvit.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //M��e� to zm�nit t�m, �e na n� ud�l� dojem. M��u ti ��ci, jak to ud�lat.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Domluvili jsme si t�i Severn� soumraky a nic jin�ho! Dej mi je a POTOM se m��eme bavit!
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
	description = "Jak m��u ud�lat dojem na Guru?";
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
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Jak m��u ud�lat dojem na Guru?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar cvi�� novice ve Sp��ov� magii.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Jestli�e chce� upoutat jeho pozornost, pou�ij kouzlo.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Nepou��vej v�ak na n�j V�trnou p�st! Uspi jeho poslucha�e nebo n�co takov�ho.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib, za hlavn� branou, je jeden z nejtvrd��ch. Mysl�m, �e by ti s n�m mohl pomoci Lester. Promluv s n�m, jakmile bude jeho p�n pry�.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Ostatn� Guru jsou vcelku v pohod� - sna� se b�t u�ite�n�.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //D�ky za radu.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Hej - dohoda je dohoda.
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"Abych ud�lal dojem na Baala Cadara, musel jsem seslat na jednoho z jeho poslucha�� spac� kouzlo.");
		B_LogEntry	(CH1_JoinPsi,"Zept�m se novice Lestera, jak ud�lat dojem na Baala Namiba p�eb�vaj�c�ho u hlavn� br�ny. M�l bych se ujistit, �e nen� v bl�zkosti ��dn� guru!");
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
	description = "Jak se dostanu ke Sp��ov� magii?";
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
		B_LogEntry		(GE_TraderPSI,"Baal Cadar prod�v� RUNY a SVITKY.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Jak se dostanu ke Sp��ov� magii?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar prod�v� runy a za��k�vac� svitky. Ale to je ti vlastn� k ni�emu, dokud si s n�m nepromluv�, �e?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Mo�n� ti pom��e jin� Guru.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Wei�t du, es ist ziemlich gut. Es �ffnet deinen Geist f�r die Worte des Schl�fers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit f�r eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










