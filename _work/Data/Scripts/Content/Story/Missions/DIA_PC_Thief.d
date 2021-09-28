var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Jsem Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //J� jsem...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Nezaj�m� m�, kdo jsi. Pr�v� jsi p�i�el. Dohl��m na nov� p��choz�. To je zat�m v�echno.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Jestli se tu chyst� n�jakou chv�li z�stat, mo�n� bychom si mohli trochu d�v��ovat. Samoz�ejm� ti ale nebudu br�nit, kdy� se bude� cht�t zni�it. Tak co si mysl�?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //D�ky za tvou pomoc.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Je to tvoje rozhodnut�. R�d jsem t� poznal.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Sejdeme se ve Star�m t�bo�e.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Tak poj�me.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Opatruj se.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "M�m dopis pro Velk�ho m�ga Kruhu ohn�.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //M�m dopis pro Velk�ho m�ga Kruhu ohn�.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Opravdu...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Dal mi ho jeden m�g kr�tce p�edt�m, ne� m� sem vyslal.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //M� �t�st�, �e u� se p�ed m�gy nesm�m nikdy uk�zat. Kdokoliv jin� by t� kv�li tomu dopisu s chut� pod�ezal.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //To proto�e m�gov� sv� kur�ry dob�e plat� a v�t�ina lid� tu nem� nic.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //B�t tebou, byl bych zticha, dokud bych nepotkal n�kter�ho z m�g�. I kdy� to se ti hned tak nepoda��.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Pro� ne?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //M�gov� jsou na hrad� ve Star�m t�bo�e. Na hrad sm� pouze Gomezovi lid�.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "Pro� jsi mi pomohl?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Pro� jsi mi pomohl?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Proto�e jsi pot�eboval pomoc, jinak by t� Bullit a jeho chlapi mohli zab�t.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //A j� bych nemohl st�t a p�ihl�et. Takhle ti mohu ud�lat nab�dku.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Nab�dku?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Ano. Po tom mal�m incidentu s Bullitem a jeho chlapy by ti m�lo b�t jasn�, �e pot�ebuje� ochranu.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Ka�d�, kdo sem p�ijde, m� mo�nost volby. V kolonii jsou t�i t�bory a ty se bude� muset p�idat k jednomu z nich. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Jsem tu proto, abych p�esv�d�il nov��ky, �e Star� t�bor je pro n� to nejlep�� m�sto.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "Kde je te� Bullit?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //Kde je te� Bullit?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //P�enesl se sv�mi druhy zbo�� z vn�j��ho sv�ta do Star�ho t�bora. Tam ho najde�.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Jestli s n�m ale chce� bojovat, bu� opatrn�. Je to zku�en� bojovn�k.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "Dobr�, co bych m�l v�d�t o tomhle m�st�?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Dobr�, co bych m�l v�d�t v�d�t o tomhle m�st�?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //��k�me mu kolonie. Ur�it� u� jsi sly�el, �e tu t��me rudu pro kr�le. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Dob�e, to d�l�me my - ve Star�m t�bo�e.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Uvnit� Bari�ry jsou t�i t�bory. Star� t�bor je nejv�t�� a nejstar��.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "�ekni mi n�co o Bari��e.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //�ekni mi n�co o Bari��e.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Nen� toho moc. Je neproniknuteln�.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //Co by se stalo, kdybych �el odtud pry�?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Posledn�, kdo se pokusil proj�t na druhou stranu, je mrtv�. Ta proklat� Bari�ra t� nech� vstoupit dovnit�, ale nikdy u� t� nepust� ven.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Jestli existuje n�jak� cesta ven, najdu ji.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Jsi opravdu rozhodnut� j�t odtud pry�? Ale pr�v� jsi p�i�el!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "A co ty dva ostatn� t�bory?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //A co ty dva ostatn� t�bory?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Ostatn� dva t�bory jsou rozd�len� kv�li sv�m ��len�m pl�n�m na �nik.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Nov� t�bor je na z�pad� kolonie a jeho m�gov� si mysl�, �e m��ou prolomit Bari�ru, jakmile se jim poda�� nashrom�dit dostate�n� mno�stv� magick� rudy.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //A potom jsou tu na v�chod� sekt���t� bl�zni. Jejich t�bor le�� uprost�ed ba�in, kde se modl� ke sv�mu idolu, aby je osvobodil.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Nejsou u� dlouho sv�pr�vn�.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //B�t tebou, tak bych se t�mi vy�inut�mi mozky nezab�val.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "�ekni mi n�co o Star�m t�bo�e.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //�ekni mi n�co o Star�m t�bo�e.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //Je to nejv�t�� a nejstar�� ze v�ech t�� t�bor�. Gomez a jeho chlapi maj� t�bor pod kontrolou, a proto tedy i cel� obchod s rudou.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Jednou za m�s�c n�m kr�l po�le v�echno, co pot�ebujeme. M�me toho star�ho p�prdu na h�ku, ch�pe�?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Pos�l� n�m v�no, chleba, maso, zbran�... prost� v�echno.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Tak� z toho m��e� n�co dostat. Akor�t se mus� p�idat ke Gomezovi.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "Kdo je Gomez?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Kdo je Gomez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez je nejmocn�j�� Rudobaron. Je to ��f Star�ho t�bora - nejmocn�j�� mu� v kolonii.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "P�edpokl�dejme, �e bych se cht�l p�idat k jeho lidem, co pro to mus�m ud�lat?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //P�edpokl�dejme, �e bych se cht�l p�idat k jeho lidem, co pro to mus�m ud�lat?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //U hradn� br�ny najde� �lov�ka jm�nem Thorus. �ekni mu, �e t� pos�l� Diego.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Abych se mohl spojit s Gomezov�mi lidmi ve Star�m t�bo�e, pot�ebuji nav�t�vit Thoruse.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "Jak se dostanu do Star�ho t�bora?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Jak se dostanu do Star�ho t�bora?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Mus� j�t po t�hle cest�. Star� t�bor je nejbli��� bezpe�n� vyhl�ej�c� m�sto, na kter� m��e� narazit.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Mezi t�bory se potuluje spousta nebezpe�n�ch zv��at. Byl bys bl�zen, kdyby ses tudy vydal beze zbran�.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "Kde bych mohl sehnat n�jakou zbra�?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Kde bych mohl sehnat n�jakou zbra�?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //A� doraz� k zavalen�mu dolu, porozhl�dni se kolem. Ur�it� najde� n�co u�ite�n�ho.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Ten d�l najde� snadno, je to jenom p�r metr� od ka�onu. 
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "Mluvil jsem s Thorusem.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Mluvil jsem s Thorusem.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //A co ��kal?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //��k�, �e se m��u p�idat ke Star�mu t�boru, pokud TY uzn�, �e na to m�m.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Vypad� to, �e m�m novou funkci.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //M��eme u� za��t?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Nejd��ve by ses m�l dov�d�t p�r v�c�.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "Co mus�m zn�t, abych byl p�ijat do Star�ho t�bora?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Co mus�m zn�t, abych byl p�ijat do Star�ho t�bora?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Jestli se chce� p�idat do t�bora, bude� muset z�skat p�r kladn�ch bod�.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //Ve Vn�j��m kruhu je n�kolik vlivn�ch lid�. V�t�ina z nich jsou St�ny. Pokud se ti poda�� ud�lat na n� dojem, z�sk� p�r kladn�ch bod�.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Pak bude� moci slo�it zkou�ku oddanosti.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Pak je tu je�t� �ada dovednost�, kter� se ka�d� nov��ek mus� nau�it. Je toho k u�en� spousta, spousta. ��m v�c se toho nau��, t�m v�t�� cenu pro n�s bude� m�t.
	
	B_LogEntry( CH1_JoinOC,"Abych se mohl p�idat, mus�m ud�lat dojem na lidi z Vn�j��ho okruhu a podstoupit Diegovu zkou�ku poctivosti.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "Kde najdu ty d�le�it� lidi?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Kde najdu ty d�le�it� lidi?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Dobr�, pr�v� se d�v� na jednoho z nich. Pak je tu Thorus... toho u� zn�.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Co se t��e ostatn�ch... bude� si je muset naj�t s�m. Jestli se ti to nepoda��, nebude� tady moci z�stat.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //B� p�es Vn�j�� okruh a mluv s lidmi. Tak zjist�, kdo je d�le�it�.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "Kdo m� m��e u�it?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Kdo m� m��e u�it?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Za�ni s Fingersem. Ten je z n�s nejzru�n�j��.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Kdy� bude� m�t o�i na stopk�ch. najde� dal�� lidi, kte�� t� budou moci u�it.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Kde najdu Fingerse?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Jeho chatr� je trochu zp�tky. Stoj� p��mo proti hradn� zdi, kdy� p�jde� odsud sm�rem k ar�n�.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Kdy� bude� u hradn� br�ny, pokra�uj doleva, a� dojde� k ar�n�.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Fingers m� m��e nau�it VYB�R�N� KAPES. �ije nedaleko ar�ny, pon�kud stranou u hradn�ch zd�.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "M��e� m� n�co nau�it?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Diego mi m��e pomoci st�t se SILN�J��M a OBRATN�J��M.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //M��e� m� n�co nau�it?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Ano. M��u t� nau�it, jak zlep�it obratnost nebo s�lu.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Tvoje s�la se dost zlep�ila.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Tvoje dovednost zach�zen� s lukem a samost��lem se zlep�ila.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Vra� se brzy - je�t� se toho mus� hodn� nau�it!
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "Co je to test oddanosti?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //Co je to test oddanosti?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Mus� j�t do Star�ho dolu. Tam najde� chlap�ka jm�nem Ian. Ten ti d� seznam.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //Ten seznam je d�le�it�. Obsahuje v�echny v�ci, kter� od n�s pot�ebuj� chlapi tam v dole.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Dostanou z�soby z p��t�ho konvoje.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //To nen� probl�m!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //Jeden probl�m by tady byl! Ten seznam se nesm� dostat do Nov�ho t�bora!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Jak jsem �ekl: ten seznam je d�le�it�. Kdy� to provede� dob�e, pokro�� d�l.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego m� poslal do Star�ho dolu. M�m z�skat od chlap�ka jm�nem Ian seznam. Tento seznam se nesm� dostat do rukou nikomu z Nov�ho t�bora.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Kdy� je ten seznam tak d�le�it�, tak pro� by ho m�l Ian d�vat pr�v� MN�?";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Kdy� je ten seznam tak d�le�it�, tak pro� by ho m�l Ian d�vat pr�v� MN�?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Proto�e mu �ekne�, �e t� poslal Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //�eknu mu to.
	
	B_LogEntry    (CH1_BringList,"Ian mi p�ed� seznam, kdy� mu �eknu, �e m� pos�l� Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Kde najdu Star� d�l?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Kde najdu Star� d�l?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Jdi za Grahamem. To je kartograf. �ekni mu, �e jsem t� poslal a �e pot�ebuje� mapu. Z t� se dozv� cestu do dolu.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Bydl� vlevo od severn� br�ny.
	
	B_LogEntry    (CH1_BringList,"Graham mi d� mapu. Najdu ho nalevo od severn� br�ny.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "M�m seznam od Iana.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //M�m seznam od Iana.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego m�l velkou radost, kdy� jsem mu p�edal seznam, kter� jsem dostal od Iana.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego byl velmi spokojen�, kdy� jsem mu p�edal Ian�v seznam. Nev�iml si, �e jej pad�lal Lares, nebo jsem v jeho o��ch zahl�dl jisk�i�ky?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Dobr� pr�ce! Tak dostane� p�r kladn�ch bod�!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "A co m� v�nost v t�bo�e?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //A co m� v�nost v t�bo�e?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Mluvil jsem s n�kolika lidmi.
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //No a?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty mi �ekl, �e jsi porazil Kirga.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty mi �ekl, �e t� porazil Kirgo. Nevypadal moc nad�en�.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty mi �ekl, �e u� se nem��e do�kat, a� t� uvid� nastoupit proti Kirgovi.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ale ud�lalo na n�j dojem, �e jsi se postavil Kharimovi - ikdy� t� porazil.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Ud�lalo na n�j ale velk� dojem to, �e jsi porazil Kharima - nep�est�val o tob� v�bec mluvit. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Nem��e se do�kat, jestli vyzve� Kharima.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler mi vypr�v�l p��b�h o Fiskovi... Dobr�, b�t tebou, vzal bych tu rudu a zmizel - mysl� si, �e s tebou ud�lal velk� obchod.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Mluvil jsem s Whistlerem. Sebral jsi jeho rudu, ty prohnanej bastarde! Mus�m uznat, �e m� odvahu!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler �ek� na sv�j me�. M�l by sis rozmyslet, jestli mu ho p�inese� nebo ne. Jestli ne, bude si myslet, �e jsi mu sebral jeho rudu!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly mi �ekl, �e jsi na�el Neka. Mysl�m, �e byl opravdu spokojen�.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //M�m pocit �e se Sly v Nekovi spletl. Byl to opravdu otrapa, to je pravda, ale nemysl�m si, �e �el do Nov�ho t�bora.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //U� jsem t� poslal k Fingersovi - mohl by t� doopravdy n�co nau�it!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers mi �ekl, �e ses u� n�co nau�il, ale mysl� si, �e se m� po��d je�t� v �em zlep�ovat.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Mus�m si promluvit s Dexterem. Vyu��v� t� ve sv�j vlastn� prosp�ch.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Pro zkou�ku ale neexistuj� ��dn� pravidla. Pokud se ti TO poda��, bude to velk� krok kup�edu.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Opravdu se ti poda�ilo z�skat recept od Kaloma. Na Dextera to ud�lalo velk� dojem a na m� taky.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //�kol s Mordragem je docela dobr� pr�ce. Jako bojovn�k nen� �patn�. Jestli ho chce� porazit, m�l bys hodn� cvi�it.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus ��k�, �e bysme mohli pot�ebovat n�koho, jako jsi ty - to je pro tebe velmi dobr�.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorusovi nejsp� praskne hlava vzteky - jak ses mohl opov�it pokazit TAKOV� �kol?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk mi �ekl, �e jsi ho p�ekvapil. V ka�d�m p��pad� bude na tvoj� stran�.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk je na tebe opravdu na�tvan�. B�t tebou, hledal bych n�koho nam�sto Mordraga.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Na�el jsi dost lid�, kte�� budou mluvit v tv�j prosp�ch.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Tak� jsi slo�il zkou�ku poctivosti. Jdi za Thorusem. U� jsem mu v�echno �ekl. Nech� t� nav�t�vit Gomeze.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego mi ud�lil sly�en� u Gomeze. Pr�v� jsem se stal jedn�m z Gomezov�ch lid� a m�m p��stup na hrad, jen mus�m nejd��ve nav�t�vit Thoruse.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Je�t� ale mus� slo�it zkou�ku poctivosti.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //V�echno nasv�d�uje, �e to na nov��ka nebylo tak zl�.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Po�kej s t�m! Zb�v� je�t� ud�lat spousta v�c�, jestli se chce� n�kam v t�bo�e dostat.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "Co mus�m ud�lat, abych se dostal ke Gomezovi?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Co mus�m ud�lat, abych se dostal ke Gomezovi?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez se rozhoduje pomoc� vnit�n�ho instinktu. Pod�v� se ti na kuku�, a pak se rozhodne, jestli se m��e� p�idat, nebo ne.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Od te�ka si bude� muset j�t po sv�ch - d�lej, jak nejl�p um�. B�h s tebou.
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //M��u m�t takovou zbroj jako ty?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //M� dost rudy?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text f�r die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Dej rudu, pak dostane� v�zbroj.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hej, myslel jsem, �e jsi mrtv�!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Ob�as m�m taky ten pocit.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Od na�eho posledn�ho setk�n� se stalo hodn� v�c�. Sly�el jsem, �e ses hodn� pod�lel na posledn�m vz�v�n�.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Jako obvykle jsi dob�e informov�n.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //L�p, ne� si mysl�... Hled� te� ohnisko?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Ano. Mus� tady n�kde b�t.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //V�m, kde ho najde�. Je tu ale jeden probl�m.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Rozum�m. Co chce� d�lat?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Hodn� ses toho nau�il, ale to nen� to, co m�m na mysli.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Ne? A v �em je ten probl�m?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //Je tady hromada probl�m�.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Tak dob�e. Pochop� to hned.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"Kdy� jsem se p�ibl�il k ohniskov�mu m�stu na severu, ke sv�mu p�ekvapen� jsem narazil na Diega. Varoval m� p�ed ��msi 'velik�m', co m� �ek� na konci ka�onu.");
	B_LogEntry		(CH3_TrollCanyon,"N�jak se dozv�d�l o m� �innosti v T�bo�e v ba�in�ch, stejn� jako o tom, �e hled�m ohnisko. Budeme pokra�ovat spole�n�.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Na lev� stran� ka�onu je vchod  do jeskyn�, odkud vede cesta k ohnisku.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Dob�e. Nejd��v se ale mus�me zbavit t�ch p��er, kter� se tam kolem potuluj�.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Zkus naj�t slab� m�sto trola. Nebo n�jak� jin� zp�sob, jak ho porazit.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Upout�m jeho pozornost.

	B_LogEntry		(CH3_TrollCanyon,"P�e�li jsme nap��� velk�m trol�m z�tarasem, kter� n�m st�l v cest�. Diego ho odstran� a j� zat�m mus�m naj�t zp�sob, jak porazit trola.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //To bylo fantastick�. Jsi opravdu dobr�. A te� si poj� vz�t to ohnisko.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ujist�m se, �e n�s tu ne�ek� ��dn� nep��jemn� p�ekvapen�.

	B_LogEntry		(CH3_TrollCanyon,"Trol byl pora�en. Te� vid�m navij�k, kter� spou�t� m�� na ohniskovou plo�inu.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Ten navij�k se asi zasekl.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //J� se na to pod�v�m, t�eba se mi ho poda�� opravit!

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Dobr�, te� by m�l pracovat.
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Diego opravil porouchan� navij�k. Te� u� n�m nic nestoj� v cest�.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Vezmi to ohnisko a j� na tebe po�k�m tady!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Na�el jsi to ohnisko. V�born�.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Mysl�m, �e je �as zastavit se zase ve Star�m t�bo�e. Hodn� �t�st�.
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Koukej, abys z�stal na�ivu!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Je�t� se uvid�me.

	B_LogEntry		(CH3_TrollCanyon,"Ohnisko je m�. Mus�m v�ak je�t� domluvit n�kolika harpyj�m, aby m� jej nechaly sebrat.");
	B_LogEntry		(CH3_TrollCanyon,"Diego se vrac� do Star�ho t�bora. Jsem si jist�, �e se s n�m op�t shled�m.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  











//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Hej... Psss... Bu� ti�e!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Nazdar, Diego, u� jsem mluvil s Miltenem na druh�m konci t�bora!
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Dob�e, tak u� v�, co se stalo.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //Ale sly�el jsi tak� o pl�novan�m �toku na Svobodn� d�l?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Nazdar, Diego, co m� znamenat ta hra na schov�vanou?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Tys to je�t� nesly�el?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //Nesly�el co?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //Star� d�l je zatopen�, m�gov� Ohn� byli zavra�d�ni a o�ek�v� se �tok na Svobodn� d�l.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //COO��EE???? Co to ��k�?
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Jak mohl b�t Star� d�l zaplaven?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Jak mohl b�t Star� d�l zaplaven?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Jeden z kop���, kter� p�e�il, n�m �ekl, �e kdy� kopali, narazili na dn� na podzemn� �eku.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Kdy� se voda navalila do dolu, jeden z jeho pil��� se zlomil a cel� horn� sekce se zhroutila.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Jen hrstce lid� se poda�ilo z dolu uniknout.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "Pro� zem�eli m�gov�?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Pro� zem�eli m�gov�?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //To je dlouh� p��b�h.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "�tok na Svobodn� d�l?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //�tok na Svobodn� d�l?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //To je dlouh� p��b�h.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "Jen mi o tom �ekni! ";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Jen mi o tom �ekni! Nebude to prvn� dlouh� p��b�h, kter� vyslechnu!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //Dobr�. Kdy� jsme dostali zpr�vu o zatopen� dolu, byl jsem na�t�st� doma u Rudobaron�.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Gomez vyskakoval jako ��len�, kdy� se doslechl o tom ne�t�st� a za�al se ob�vat, �e bude jeho postaven� ohro�eno.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Samoz�ejm�. Kdo ��d� obchod s rudou, ovl�d� kolonii!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //To je pravda. Proto�e u� nem�l ��dn� zdroj p��jm�, zbo�� z vn�j��ho sv�ta u� nebylo za co nakupovat.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Nikdo u� pro n�j nebude pracovat, pokud brzy nenajde jin� zdroj p��jm�.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //A to je ten d�vod �toku na Svobodn� d�l?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Popravd� �e�eno - je to jedin�  Gomezova �ance, jak si zachovat svou moc.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //P�ed dv�ma hodinami obsadily dva tucty str�c� Svobodn� d�l.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "To je ��len�! Mus�m varovat Nov� t�bor.";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //To je ��len�! Mus�m varovat Nov� t�bor.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //Pak si mus� posp�it! U� t�m�� dorazili ke Svobodn�mu dolu!
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Nikdy se ale nedostanou p�es opevn�n� Nov�ho t�bora.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Nepot�ebuj� se p�es n�j dostat. P�ed p�r m�s�ci na�li pr�chod horami p��mo ke Svobodn�mu dolu, kter� nikdo jin� neznal.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "Vid�l jsem str�e p�ed zam�enou br�nou.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Vid�l jsem str�e p�ed zam�enou br�nou.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Dr� se odtamtud d�l. Napadnou ka�d�ho, kdo se p�ibl�� k t�boru.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Maj� strach, �e se jim n�kdo pomst� za �tok na Svobodn� d�l.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Co se ale stalo m�g�m Ohn�?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Co se ale stalo m�g�m Ohn�?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo a ostatn� m�gov� byli jedin� lid� v t�bo�e, kte�� z�stali p�i smyslech.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Zak�zali �tok a po�adovali vyrovn�n� mezi ob�ma t�bory.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //Oni ZAK�ZALI Gomezovi za�to�it na Svobodn� d�l?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //P�esn� tak. Corristo a ostatn� si nem�li b�t tak sebejist�. Gomez jim p�estal d�v��ovat, a tak je nechal sprost� zavra�dit.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "Co te� budete s Miltenem d�lat?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //Co te� budete s Miltenem d�lat?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //N�jak� �as tady z�staneme a budeme varovat dal�� p��tele, aby nevb�hli p��mo do n�ru�� str��m.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Mohl bys n�m ale prok�zat laskavost.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Rozhodn� ano. �ekni, co ode m� chce�!";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Rozhodn� ano. �ekni, co ode m� chce�!
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Zajdi za Lesterem a Gornem. Mus� se dozv�d�t, co se tu stalo.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //�ekni jim, �e se v�ichni �ty�i sejdeme na obvykl�m m�st�.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Jestli je uvid�m d��v ne� vy, budu je varovat a po�lu je na to m�sto.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //D�ky, p��teli. Jsi opravdu spr�vnej chlap. Te� b�, sejdeme se pozd�ji.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"V�ichni m�gov� Ohn� jsou mrtv� a situace se vymkla z rukou. Diego cht�l, abych se s Lesterem a Gornem domluvil na n�jak�m bezpe�n�m m�st� setk�n� s n�m a Miltenem. Zd� se, �e to ned�laj� poprv�!"); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter �berfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schl�gerei mit Folgen         (+3 St�rke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung f�r mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des K�nigs Gardisten. dummerweise hat der K�nig viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("St�rke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich sa� in der Kneipe und habe meine Meinung �ber K�nig, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu sp�t daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du M�nner die so ziemlich jedes m�gliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("St�rke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
