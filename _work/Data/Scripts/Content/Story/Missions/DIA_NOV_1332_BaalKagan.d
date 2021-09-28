// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Ty jsi ze Sektovn�ho t�bora, vi�?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Ty jsi ze Sektovn�ho t�bora, vi�?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //��k�me tomu Bratrstvo.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Jsem Baal Kagan. Sp�� bu� s tebou.
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Co tady d�l�?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Co tady d�l�?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //P�vodn� jsem sem byl vysl�n, abych p�esv�d�oval lidi, aby se p�idali k na�emu Bratrstvu.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ti barba�i ale nemaj� v�bec z�jem o duchovn� osv�tu. Proto jsem se omezil na prodej drogy z ba�iny.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //A to je tady obl�ben� zam�stn�n�. P��li� obl�ben�. Sotva sta��m uspokojovat popt�vku.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan prod�v� lodyhy drogy bandit�m a �old�k�m v Nov�m t�bo�e.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Uka� mi svoje zbo��.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Uka� mi svoje zbo��.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Jak chce�.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "Pro� sem nepo�lou jednoho mu�e nav�c?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Pro� sem nepo�lou jednoho mu�e nav�c?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro mi cht�l pom�hat, ale pak se zasekl na cel� den v baru na jeze�e a v�echnu drogu vym�nil za r��ovou p�lenku.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Stal se ob�t� t� lihoviny. Ob�v�m se, �e s jeho pomoc� nem��u po��tat.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro sed� v baru na jeze�e a cel� dny pije.");	
	};
};

// ************************************************************
// 					Ich k�nnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Mohl bych ti pomoci prod�vat tvou drogu lidem.";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Mohl bych ti pomoci prod�vat tvou drogu lidem.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Takov� mno�stv� drogy m��u sv��it jedin� n�komu z �len� Bratrstva.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Mohl bys mi ale pomoci rozd�vat dary.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Moje zbo�� je�t� neokusili v�ichni. Jakmile jednou okus� tu drogu, budou cht�t v�c a v�c, co� pro m� bude znamenat lep�� obchod.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Myslel jsem si, �e se ti sotva poda�� vykonat tv�j �kol TE�.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //O Baala Isidra bude brzy postar�no. U� jsem poslal Cor Kalomovi zpr�vu.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "Co dostanu, kdy� budu za tebe rozn�et tu drogu?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Co dostanu, kdy� bude za tebe rozn�et tu drogu?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //M��e t� odm�nit r�zn�mi zp�soby.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //M��e� ode m� dostat magick� svitky, kter� v sob� maj� siln� Sp��ovo kouzlo.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Nebo ti m��u pomoci p�idat se k na�� komunit�, pokud bys to cht�l. M�m velmi dobr� kontakty s Cor Kalomem a Baalem Tyonem.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Oba maj� velmi bl�zko k Y�Berionovi, na�emu mistrovi.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //M��u ti ale tak� zaplatit p��mo rudou, kdy� bude� cht�t. 100 nuget� by ti za tvou snahu m�lo sta�it.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "Dobr�, dej mi tu drogu. Komu chce�, abych ji p�edal?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Dobr�, dej mi tu drogu. Komu chce�, abych ji p�edal?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Jist� n�koho najde�, kdo ji bude cht�t. �ekni lidem. Ale d�vej pouze po JEDN� lodyze na osobu.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //A je�t� d�le�it� v�c: jestli si tu drogu nech� od n�koho sebrat, nebo ji vykou�� s�m, na�e domluva pad�.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Jist�.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Novic Baal Kagan mi p�edal 10 lodyh drogy od mlad�ch novic�, kter� mus�m rozdat v Nov�m t�bo�e. ");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "Rozdal jsem v�echnu drogu.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Rozdal jsem v�echnu drogu.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Prvn� nov� z�kazn�ci m� u� nav�t�vili. Odvedl jsi v�bornou pr�ci.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Co bude� cht�t za odm�nu?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Vezmu si rudu.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Pomoz mi vstoupit do Bratrstva.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Tyto kouzeln� svitky jsou tak� docela zaj�mav� - jak� druh kouzla maj�?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan m� nov� z�kazn�ky a j� svoji odm�nu.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Nevid�l jsem ��dn�ho nov�ho z�kazn�ka. Rozdej je�t� dal��.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Tyto kouzeln� svitky jsou tak� docela zaj�mav� - jak� druh kouzla maj�?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //V�trnou p�st, telekinezi, pyrokinezi a sp�nek. M��e� si vybrat t�i z nich.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Vezmu si t�i kouzeln� svitky.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Pomoz mi vstoupit do Bratrstva.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Tv�j po�adavek je mali�kost. Pom��u ti, tak m� poslouchej. Baal Tyon je jedn�m z Guru - pr�v� tak jako j�.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y�Berion ho jmenoval jedn�m ze sv�ch r�dc�. To se nem�lo st�t.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Mysl� si te�, �e je velmi d�le�it�, a proto nemluv� s nik�m jin�m ne� se sv�mi ��ky.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Kdy� mu d� tohle, rozv�e mu to jazyk.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Baal Kagan mi p�edal speci�ln� P�IVOL�VA� SN� pro Baala Tyona. To mi pom��e p�idat se k sekt� Bratrstva.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Vezmu si t�ch 100 nuget�.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Velmi dob�e. Tady.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Vezmu si ty kouzeln� svitky.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Dobr� rozhodnut�. Vem si t�i.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"�der v�tru",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Telekineze",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pyrokineze",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Sp�nek",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"�arm",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou t�i. U��vej je moud�e.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou t�i. U��vej je moud�e.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou t�i. U��vej je moud�e.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou t�i. U��vej je moud�e.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To jsou t�i. U��vej je moud�e.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




