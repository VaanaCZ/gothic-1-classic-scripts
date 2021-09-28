// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Nevypad�, jako bys ka�d�ho pustil na hrad.";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Nevypad�, jako bys ka�d�ho pustil na hrad.
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Na hrad sm�j� jenom Gomezovi mu�i.
};

// ************************************************************
// 					Ich will f�r Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Chci pro Gomeze pracovat.";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Chci pro Gomeze pracovat.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //V�n�? A pro� si mysl�, �e by ti Gomez cht�l d�t pr�ci?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Diego �ekl, �e ty rozhoduje�, kdo je pro Gomeze zaj�mav�.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego ��k�, �e TY rozhoduje�, o koho bude m�t Gomez z�jem.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //No... Jestli Diego ��k�, �e jsi v pohod�, pro� se o tebe nepostar� ON?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Poslouchej, vysv�tl�m ti to. Diego si t� chce vyzkou�et. Jestli si ON mysl�, �e jsi dost dobr�, tak t� pust�m na hrad, abys mohl nav�t�vit Gomeze.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //Cokoliv se stane, je to na tebe, jasn�?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //�eknu to Diegovi.
	
	B_LogEntry(CH1_JoinOC,"Thorus mi �ekl, �e jestli chci b�t p�ijat do Star�ho t�bora, m�l bych si promluvit s Diegem. Diego m� vyzkou��.");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "Pro� m� nevyzkou��?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Pro� m� nevyzkou��?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //To nen� tak jednoduch�, chlap�e! Ka�d� nov��ek, kter� se chce kamkoliv dostat, mus� m�t ochr�nce.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //A t�m ochr�ncem mus� b�t n�kdo z Gomezov�ch lid�. Vyzkou�� t� s�m.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //A jestli zklame�, je to na tvoje vlastn� riziko - to je zdej�� z�kon.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Je tu ur�it� n�co, co chce� ud�lat.";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Je tu ur�it� n�co, co chce� ud�lat.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Ne. V�ci se maj� tak, �e my, str�ci, jsme trochu v�c ne� ty, hochu.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Ty akor�t provede� �koly, kter� pro tebe tv�j ochr�nce p�ichystal.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Jsem schopn� ud�lat cokoliv, co mi p�ik�e�.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Jsem schopn� ud�lat cokoliv, co mi p�ik�e�.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Eh? Vypad� to, �e jsi odhodlan�, eh... Je tady jedna v�c, kterou m��e v�d�t jen n�kdo, kdo nen� s Gomezem.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ale varuju t�: jestli to vyzrad�, m��e� se dostat do p�kn�ho mal�ru!
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Jsem p�ipraven vykonat tv�j �kol.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Jsem p�ipraven vykonat tv�j �kol.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //To, co ti te� pov�m, z�stane jenom mezi n�ma dv�ma a nikdo jin� se o tom nesm� dozv�d�t, jasn�?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Jasn�.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //M�m pot�e s jedn�m chlap�kem z Nov�ho t�bora. Jmenuje se Mordrag. Kradl u Rudobaron�.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Samoz�ejm� m�me v Nov�m t�bo�e hromadu zabij�k�, ale ten chlap�k m�l takov� nervy, �e p�i�el do NA�EHO t�bora a prod�val NA�E zbo�� NA�IM lidem!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Za�el moc daleko. Dob�e ale v�, �e s t�m nem��u nic ud�lat.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Jak to?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Proto�e je pod ochranou m�g�.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Postar�m se o to.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Chce� po mn�, abych toho chlap�ka zabil?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Pro� ho m�gov� ochra�uj�?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Zd� se, �e ti m�gov� jsou pro tebe probl�m...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus m� po��dal, abych z t�bora vyhnal lumpa jm�nem Mordrag. Jak to ud�l�m, je pr� m� v�c. Nikdo v�ak nesm� v�d�t, �e za t�m stoj� Thorus.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Postar�m se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Chce� po mn�, abych toho chlap�ka zabil?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Chci, abys za��dil, abych se u� na n�j nikdy nemusel pod�vat. Je mi jedno, jak to ud�l�.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Kde Mordraga najdu?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Najde� ho u ji�n� br�ny na druh� stran� hradu, p��mo za vstupem. Ten bastard by se u� nikdy nem�l odv�it p�ij�t do t�bora.
	B_LogEntry(CH1_MordragKO,"Mordrag je u ji�n� br�ny za hradem.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Pro� ho m�gov� ochra�uj�?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Proto�e jim slou�� jako posl��ek. Na�i kouzeln�ci jsou v kontaktu s m�gy v Nov�m t�bo�e. �asto pos�laj� posl��ky tam a zp�tky.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Byli by nejsp� HODN� rozzloben�, kdybych n�kter�ho z jejich posl��k� vyhodil z t�bora, nebo ho zabil.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //A co J�? Co mysl�, �e ud�laj� MN�?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Jsi tu nov�, m��e� b�t v klidu. J� ale zodpov�d�m za to, co d�laj� moji chlapi. Proto je nesm�rn� d�le�it�, abys dr�el jazyk za zuby.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Zd� se, �e ti m�gov� jsou tv�j probl�m...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Jist�, ale jsou takov�m probl�mem, kter� se t�ce �e��. P�ed p�r lety se jeden ze St�n� pokusil ve sp�nku probodnout Velk�ho m�ga Ohniv�ho kruhu.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Potom ho na�li na Vn�j��m okruhu - po pravd� �e�eno, sb�rali ho po CEL�M  Vn�j��m okruhu.
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "O Mordragovi...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Postar�m se o to.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"Kde Mordraga najdu?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Mordrag u� nikdy nikomu nic neukradne!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"U� se tu nikdy v�c neuk�e!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Postar�m se o to.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag u� nikdy nikomu nic neukradne!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Mysl� t�m, �es ho porazil? To nen� �patn�, hochu.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus byl pot�en, �e mu Mordrag zmizel z cesty. V�hoda pro m�.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //U� se tu nikdy v�c neuk�e!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Byl bych rad�i, kdybys ho zabil.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus je r�d, �e u� Mordrag nen� v t�bo�e.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //�patn�! ��kal jsem ti NEVYSLOVUJ MOJE JM�NO!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Vyzradil jsi to! Na v�echno jsi zapomn�l! Neopova�uj se u� nijak do t� z�le�itosti znovu pou�t�t!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Thorusovi se nel�bilo, �e jsem Mordragovi �ekl jeho jm�no. Mysl�m, �e bych mu chv�li nem�l chodit na o�i.");
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Kdybych ti dal ur�it� mno�stv� rudy, pustil bys m� na hrad?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Kdybych ti dal ur�it� mno�stv� rudy, pustil bys m� na hrad?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Za ur�it� mno�stv�...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Jak velk�?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Dobr� - mus� b�t takov�, aby se muselo chv�li po��tat. Dost dlouho na to, aby bylo jist�, �e j� i m� chlapi budeme zam�stnan� jeho po��t�n�m, zat�mco ty vklouzne� dovnit�.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Tak �ekni kolik?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //1000 nuget� by m�lo sta�it.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 nuget�?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Dob�e, tak se p�idej ke Gomezovi, a bude� m�t vstup na hrad zdarma.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "M�m 1000 magick�ch nuget�. Te� m� pus� dovnit�!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //M�m 1000 magick�ch nuget�. Te� m� pus� dovnit�!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //Dobr�, b� p��mo rovn�. M��e� j�t do hradu, ale ��dn� hlouposti, jasn�?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Nezkou�ej na m� ��dn� triky, chlap�e. Ty nem� ��dn�ch 1000 magick�ch nuget�!
	};
};
		
// ************************************************************
// 					Brief f�r Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "Pot�ebuju se dostat do hradu! Nesu dopis pro nejvy���ho M�ga Ohn�.";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Pot�ebuju se dostat do hradu! Nesu dopis pro nejvy���ho M�ga Ohn�.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //A ty si mysl�, �e t� pust�m do hradu, abys ho p�edal a shr�bl odm�nu?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Tak.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Dobr�, uka� mi tu zpr�vu.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Nem��u ji uk�zat TOB� - zapome� na to!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //Dob�e, zapomn�l jsem.
};

// ************************************************************
// 					Bereit f�r Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego ��k�, �e m��u vid�t Gomeze!";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego ��k�, �e m��u vid�t Gomeze!
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //O tom rozhoduju j�!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //A jak ses rozhodl?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Mus�m p�ipustit, �e svoji pr�ci d�l� opravdu dob�e.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Dobr�! M��e� za Gomezem. S�m rozhodne, jestli se k n�m p�id�, nebo ne.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Od te�ka jsi jedn�m z n�s, hochu.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "M�m tady od Cora Kaloma z�silku drogy z ba�in pro Gomeze.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //M�m tady od Cora Kaloma pro Gomeze z�silku drogy z ba�in.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Uka� mi ji!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //Dobr�! M��e� d�l. Jdi p��mo do Rudobaronova domu. Bartholo t� tam bude �ekat.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Na posl��ka t� drogy moc nem�! Douf�m, �es tu z�silku u� nerozprodal n�kde jinde! Vra� se, a� bude� m�t to spr�vn� mno�stv�!
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Jsem posel m�g� Vody. Pot�ebuju se dostat na hrad!";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Jsem posel m�g� Vody. Pot�ebuju se dostat na hrad!
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //M� sebou amulet kur�ra. S t�m projde� skrze st�e.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //S m�gy nechci m�t nic spole�n�ho. P�esta� m� obt�ovat, jo?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //To jist� jsi. Ale asi jsi musel n�kde zapomenout amulet kur�ra, vi�?
	};
};

// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Vy��zeno. Te� jsem �lenem t�bora.";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Vy��zeno. Te� jsem �lenem t�bora.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Gratuluju, hochu! Ode dne�ka se rad�ji dr� v bl�zkosti Diega.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Mus�m jen n�co OPRAVDU d�le�it�ho ��ci Gomezovi nebo Ravenovi.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Jak to jde?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Jak se m�?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //S Nov�m t�borem nem�me tolik starost�. Sp� m�m obavy z t�ch sekt��sk�ch bl�zn�.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chce� mi n�co ��ci?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Chce� mi n�co ��ci?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Ano. To, jak sis po��nal v dolech, nejen dok�zalo ur�itou odvahu, ale tak� prok�zalo tvoji s�lu a um�n� v boji.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Jsem rozhodnut� t� p�ijmout mezi sv� str�e.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ale nejsi zat�m �pln� p�ipraven� st�t se str�cem. Pot�ebuje� je�t� z�skat trochu zku�enost�, ne� t� budu moci kone�n� p�ijmout.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //D�v�m ti �anci. Co na to ��k�?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Chci se st�t str�cem."; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Chci se st�t str�cem.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //To r�d sly��m. Nejprve ti ale mus�m ��ci n�co, co ��k�m v�em adept�m. Poslouchej dob�e, proto�e to budu ��kat jenom jednou.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Dosud ses jenom pokou�el st�t se jedn�m z n�s. Ty dny jsou u� pry�. M� chlapi dr�� pohromad�. My, str�ci, chr�n�me Rudobarony, t�bor a d�l.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Kop��i dob�vaj� rudu a my je za to nenech�me se�rat �erv�m. Rudobaroni vyjedn�vaj� s kr�lem, ale my jsme ti, co je chr�n�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Ve dne v noci jsme v dole. Ve dne v noci st�e��me br�nu t�bora a star�me se, aby lidi mohli v klidu sp�t.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Kdysi jsme byli divok� sme�ka, ale te� jsme s�la, se kterou se po��t�. Tvrd� pracujeme a d�v�me sv� �ivoty za �ivoty druh�ch.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Od sv�ch chlap� o�ek�v�m jednu v�c: �e budou dr�et spolu. Jedin� spolu dok�eme to, co dok�zat mus�me.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //Potom p�e�ijeme.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //V�echno ostatn� se nau�� b�hem v�cviku. Bu� p�ipraven� pom�hat kdekoliv to bude zapot�eb� a d�lat cokoliv, co bude t�eba.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Zajdi za Stonem, aby ti dal n�jakou zbroj a me�.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Stonea najde� v kov��sk�m obchod� na Vnit�n�m okruhu.

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Jo, a je�t� jednu v�c...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //V�tej mezi str�emi.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Dnes m� Thorus p�ijal mezi str�e. M�m si na hrad� u kov��e Stonea vyzvednout svoji novou zbroj.");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Zaj�m� m� cesta magie."; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Zaj�m� m� cesta magie.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Dobr�, pak by sis m�l mo�n� promluvit s Corristem. Vyu�oval Miltena. Jsem si jist�, �e ti nic nestoj� v cest�.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "Mohl bys m� u�it?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Mohl bys m� u�it?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //M��u ti uk�zat, jak nab�t s�lu a zlep�it um�n� boje.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus mi pom��e zdokonalit mou S�LU a OBRATNOST.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus m� m��e nau�it bojovat s OBOURU�N�MI ZBRAN�MI, jen co zvl�dnu boj s JEDNORU�N�MI ZBRAN�MI.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Chci se nau�it zach�zet s obouru�n�m me�em.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Dob�e, ale nejd��v mus�me probrat z�klady.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Me� mus� dr�et vodorovn�. Pot�ebuje� siln�j�� rozmach, abys mohl na nep��tele za�to�it takovou t�kou zbran�.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Zvedni ruku a rozm�chni se rovnou dolu. To obvykle sta�� na to, abys nep��tele srazil k zemi.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Toho momentu pak vyu�ije� k nov�mu rozm�chnut�.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Obouru�n� me�e jsou ide�ln� k zasazov�n� bo�n�ch �der�, kter�mi si nep��tele udr�� od t�la.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //To by mohlo pro za��tek sta�it. Tr�nuj.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Chci se dozv�d�t v�c o boji s obouru�n�m me�em.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Ze v�eho nejd��ve mus� zaujmout z�kladn� postoj. Me� mus� dr�et svisle, stranou od t�la a �dery v�st siln� ob�ma rukama.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //�vihnout rychle dolu a ost�� v�st p�es rameno. Pak m� �anci prov�st rychl� �vih napravo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Tv�j protivn�k nebude m�t �anci se k tob� dostat.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Nebo me�em �vihni z lev� horn� strany sm�rem dop�edu, abys odrazil protivn�ka dozadu.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Po��d se ot��ej, abys n�sledn�mu �vihu v�dy dod�val pot�ebnou s�lu, kter� protivn�ka sraz�.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Pokud to nebude sta�it, zbyl� �vih vyu�ij k nov�mu nap��hnut� me�e.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //A� �tok dokon��, zne�kodni protivn�ka a vy�kej na dal�� souboj.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Kl��em k �sp�chu je m�nit postoje a polohy.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
