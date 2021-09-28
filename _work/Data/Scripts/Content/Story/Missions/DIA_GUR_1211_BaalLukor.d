// ************************************************************
// 							EXIT 
// ************************************************************
INSTANCE Info_BaalLukor_EXIT(C_INFO)
{
	npc				= GUR_1211_BaalLukor;
	nr				= 999;
	condition		= Info_BaalLukor_EXIT_Condition;
	information		= Info_BaalLukor_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BaalLukor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
INSTANCE Info_BaalLukor_MEET (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_MEET_Condition;
	information	= Info_BaalLukor_MEET_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_MEET_Info()
{
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //D�ky za tvoj� pomoc. P�i�el jsi opravdu v posledn� chv�li.
	
	B_GiveXP		(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
INSTANCE Info_BaalLukor_DEAD (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DEAD_Condition;
	information	= Info_BaalLukor_DEAD_Info;
	nr			= 20;
	permanent	= 0;
	important 	= 0;
	description = "Na cest� sem jsem vid�l n�kolik mrtv�ch templ���. Co se p�ihodilo?";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Na cest� sem jsem vid�l n�kolik mrtv�ch templ���. Co se p�ihodilo?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Mistr Cor Angar n�s sem vyslal na prohl�dku jeskyn�.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //O�ek�vali jsme, �e najdeme p�r zatuchl�ch hrob� a polorozpadl� mumie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Najednou se setm�lo a v�ude byli sk�eti. Nev�m co tady hledali, ale jejich p��tomnost v t�chto m�stech je v�c ne� neobvykl�!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Kde jsou ostatn� templ��i?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Mrtv�! Nev�domky jsem je p�ivedl do z�huby. Snad mi to Sp�� promine.

	B_LogEntry		(CH3_OrcGraveyard,"P�i �toku sk�et�  na sk�et�m h�bitov� jsem zachr�nil guru Baalu Lukorovi �ivot. V�ichni templ��i v boji s hrozn�mi netvory zahynuli.");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
INSTANCE Info_BaalLukor_SUMMONING (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SUMMONING_Condition;
	information	= Info_BaalLukor_SUMMONING_Info;
	nr			= 10;
	permanent	= 0;
	important 	= 0;
	description = "Cor Angar m� vyslal!";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Cor Angar m� vyslal! Na�li jste n�jak� Sp��ovo znamen�?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Zat�m ne. Ale co Y�Berion? U� procitnul?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Ne, je po��d v bezv�dom�.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Pot�ebujeme vy�e�it h�danku t�ch jeskyn�. Po v�ech t�ch hrozn�ch ztr�t�ch se nem��u do komunity vr�tit s pr�zdn�ma rukama.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Moje bojov� um�n� je omezen� a sk�eti nejsou vn�mav� na moje magick� za��k�vadla jako ti lehkov�rn� lid� ze Star�ho t�bora.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Jestli�e t� vyslalo na�e Bratrstvo, snad bys mi mohl pomoci s dal��m p�tr�n�m v t�hle hrobce.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
INSTANCE Info_BaalLukor_HELP (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HELP_Condition;
	information	= Info_BaalLukor_HELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Pom��u ti.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Pom��u ti.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Dob�e. Skv�le. Z tohoto s�lu vedou t�i tunely. M�li bysme je v�echny prozkoumat.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Jdi nap�ed. P�jdu za tebou!

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor m� vzal s sebou, abychom spole�n� vy�e�ili tajemstv� tohoto star�ho m�sta!");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDNONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDNONE_Condition;
	information	= Info_BaalLukor_FOUNDNONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Nedok�u se tu orientovat!";
};

FUNC INT Info_BaalLukor_FOUNDNONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 0)
	&&		!Npc_HasItems(hero, OrkParchmentOne)
	&&		!Npc_HasItems(hero, OrkParchmentTwo)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //Nedok�u se tu orientovat!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Mus�me prozkoumat ty t�i tunely.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDONE_Condition;
	information	= Info_BaalLukor_FOUNDONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Z�ejm� u� neexistuje druh� polovina pergamenu!";
};

FUNC INT Info_BaalLukor_FOUNDONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(((BaalLukor_BringParchment==1) && !Npc_HasItems(hero, OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero, OrkParchmentOne)))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Z�ejm� u� neexistuje druh� polovina pergamenu!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Mus� b�t druh� polovina. M�li bysme prohledat v�echny t�i tunely!
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTWAIT_Condition;
	information	= Info_BaalLukor_FIRSTWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_040")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Tudy nem��eme pokra�ovat! Mo�n� tyhle v�klenky zna�� cestu.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTSCROLL_Condition;
	information	= Info_BaalLukor_FIRSTSCROLL_Info;
	permanent	= 0;
	important 	= 0;
	description = "Na�el jsem kus pergamenu!";
};

FUNC INT Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentOne)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Na�el jsem kus pergamenu!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 �bergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //V�born�! To je druh� polovina Sk�et�ho kouzeln�ho za��k�vadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Vypad� to jako Sk�et� kouzeln� za��k�vadlo, ale je to roztr�en� vejp�l.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //N�kde tu mus� b�t druh� polovina.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 1;
	};
	
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDWAIT_Condition;
	information	= Info_BaalLukor_SECONDWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_SECONDWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_047")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... tenhle tunel je slep�! Ale mo�n� tu najdeme n�jak� znamen�, kter� n�m pom��e d�l.

	if (!Npc_HasItems	(hero, OrkParchmentTwo)	) 
	{	
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine	(self, "WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDSCROLL_Condition;
	information	= Info_BaalLukor_SECONDSCROLL_Info;
	permanent	= 0;
	description = "Tady je roztr�en� kus pergamenu!";
};

FUNC INT Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentTwo)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self,	hero);

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Tady je roztr�en� kus pergamenu!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 �bergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //V�born�! To je druh� polovina Sk�et�ho kouzeln�ho za��k�vadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Vypad� to jako Sk�et� kouzeln� za��k�vadlo, ale je to roztr�en� vejp�l.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //N�kde tu mus� b�t druh� polovina.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
INSTANCE Info_BaalLukor_BOTHSCROLLS (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_BOTHSCROLLS_Condition;
	information	= Info_BaalLukor_BOTHSCROLLS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co te� s t�ma dv�ma kusy ud�l�me?";
};

FUNC INT Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 3)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Co te� s t�mi dv�ma kusy ud�l�me?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Ob� p�lky k sob� sed�. Neum�m ale p�elo�it ty sk�et� znaky.

	B_LogEntry		(CH3_OrcGraveyard,"Na�li jsme dv� poloviny sk�et�ho svitku, ale Baal Lukor je nedok�zal rozlu�tit. Budeme pokra�ovat v p�tr�n�.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
INSTANCE Info_BaalLukor_RUNES (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_RUNES_Condition;
	information	= Info_BaalLukor_RUNES_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_RUNES_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_BOTHSCROLLS)
	&&		((Npc_GetDistToWP	(hero, "GRYD_025")<600)	|| (Npc_GetDistToWP(hero, "GRYD_048")<600))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_RUNES_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Po�kej! To je zaj�mav�...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Dobr�, nic zaj�mav�ho tady nevid�m.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Bu� ticho a d�vej se na ty ozdobn� runy v jeskyni.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //To by m�lo posta�it k p�ekladu t�ch dvou p�lek pergamenu.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //M�m to! Je to za��k�vadlo pro p�enos. Zd� se, �e jeho s�lu jde vyu��t pouze na ur�it�m m�st�!
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Divn�!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-�bergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"S pomoc� n�st�nn�ch n�pis� v jednom ze s�l� se Baalovi Lukorovi poda�ilo rozlu�tit ten svitek. Vypad� jako teleporta�n� kouzlo pro mal� vzd�lenosti."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
INSTANCE Info_BaalLukor_WHATNOW (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_WHATNOW_Condition;
	information	= Info_BaalLukor_WHATNOW_Info;
	permanent	= 1;
	important 	= 0;
	description = "Na jak�m 'ur�it�m' m�st�?";
};

FUNC INT Info_BaalLukor_WHATNOW_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_RUNES)
	&&		Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITHOUT)
	&&		!Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITH)		)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_WHATNOW_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //Na jak�m 'ur�it�m' m�st�?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //Velk� s�l, kter�m jsme p�ed chv�li pro�li, se zd�l jako velmi... zvl�tn�... m�sto. Poj�me se tam vr�tit!

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};


//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITHOUT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITHOUT_Condition;
	information	= Info_BaalLukor_HALLWITHOUT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITHOUT_Condition()
{
	if (	!Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		(Npc_GetDistToWP(hero, "GRYD_055")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop		(hero);
	AI_SetWalkmode	(self,	NPC_WALK);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Tohle m�sto... Nedok�u to vysv�tlit, ale tohle m�sto...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Och, zapome� na to. To jen ta moje p�edstavivost.

	B_LogEntry	(CH3_OrcGraveyard,"Kdy� jsme vstoupili do velk�ho obd�ln�kov�ho s�lu se sloupov�m, guru cosi poc�til. Nebyl si v�ak jist�, co to bylo.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITH (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITH_Condition;
	information	= Info_BaalLukor_HALLWITH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITH_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		Npc_GetDistToWP	(hero, "GRYD_055")<500			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //Tohle m�sto m� zvl�tn� auru... auru zmizen�.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Tenhle s�l mi p�ipom�n� obraz z t� vidiny.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //Ta vidina... Jsme velmi bl�zko u c�le...

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor byl veden neviditelnou silou, kter� m��ila p��mo k jedn� ze st�n velk�ho sloupov�ho s�lu.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
INSTANCE Info_BaalLukor_DOOR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DOOR_Condition;
	information	= Info_BaalLukor_DOOR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_DOOR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HALLWITH)
	&&		Npc_GetDistToWP	(hero, "GRYD_060")<500				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_DOOR_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Za tou st�nou... to mus� b�t!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //M� kouzeln� s�la je po��d velmi slab�.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Pou�ij to sk�et� za��k�vadlo pro p�enos tady, naproti t� st�n�.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport �bergeben
	
	AI_StopProcessInfos	(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
INSTANCE Info_BaalLukor_TELEPORT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_TELEPORT_Condition;
	information	= Info_BaalLukor_TELEPORT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_TELEPORT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_DOOR)
	&&		Npc_CanSeeNpcFreeLOS(self,	hero)	
	&&		Npc_GetDistToWP	(hero, "GRYD_072")<550				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Na�li jsme skryt� m�sto. M� instinkty m� nezradily.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //A ta odpov�� na to z�hadn� vz�v�n� Sp��e le�� skute�n� tady???
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //P�ipad� mi to sp�e jako zakopan� komora.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Mus�me pokra�ovat.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Jdi nap�ed. P�jdu za tebou!

	B_LogEntry		(CH3_OrcGraveyard,"S pomoc� sk�et�ho teleporta�n�ho kouzla jsem objevil tajnou chodbu vedouc� ven ze sloupov�ho s�lu.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
INSTANCE Info_BaalLukor_ALTAR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_ALTAR_Condition;
	information	= Info_BaalLukor_ALTAR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_ALTAR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_TELEPORT)
	&&		Npc_GetDistToWP	(hero, "GRYD_082")<400
	&&		Npc_CanSeeNpcFreeLOS(self,hero)						)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_ALTAR_Info()
{
	B_FullStop			(hero);
	AI_GotoWP			(hero, "GRYD_081");
	AI_AlignToWP		(hero);

	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NE! To nen� mo�n�! Nen� tu nic ne�... ne� prach a... kosti.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //PANE, PROMLUV KE MN�!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //SP��I, ZJEV SE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NEEEEE!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //A je to. Musel se �pln� pominout!

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //To v�echno je tvoje chyba. Tvoje bezbo�n� p��tomnost rozru�ila v�emocn�ho Sp��e!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Te� budu muset trp�t za tvoje svatokr�de�n� chov�n�!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Mus�m velk�mu p�novi vzd�t ob�. LIDSKOU OB̍!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Pak budu ur�it� osv�cen a stanu se jeho slu�ebn�kem.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //ZEM�I, NEV�R�E!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AAJEEEE���HHH!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Baala Lukora mohla trefit mrtvice, kdy� pochopil, �e tady dole nen� ABSOLUTN� NIC. Nakonec si na mn� dokonce vylil zlost. Kdy� Cor Angar usly�el tento p��b�h, pojal obavy.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





