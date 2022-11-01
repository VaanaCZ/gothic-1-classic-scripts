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
	description = "Jesteś z obozu Sekty, nieprawdaż?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Jesteś z obozu Sekty, nieprawdaż?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Jesteśmy Bractwem Śniącego, ale tak - pochodzę z obozu na bagnie.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Jestem Baal Kagan. Niech Śniący zawsze będzie z tobą.
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
	description = "Co tu robisz?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Co tu robisz?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Początkowo przybyłem tutaj, by werbować nowych ludzi do naszego Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ale ci barbarzyńcy mają w nosie swoje duchowe zbawienie. Dlatego teraz zajmuję się wyłącznie sprzedażą ziela.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Palenie ziela to dość popularne zajęcie w tych stronach. Może nawet zbyt popularne. Ledwie nadążam z kolejnymi dostawami.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan sprzedaje małe porcje ziela Szkodnikom i Najemnikom z Nowego Obozu.");
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
	description = "Pokaż mi, co masz do zaoferowania.";
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
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Pokaż mi co masz do zaoferowania.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Jak sobie życzysz.
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
	description = "Dlaczego nie przyślą ci tu kogoś do pomocy?";
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
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Dlaczego nie przyślą ci tu kogoś do pomocy?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Miał mi pomagać Baal Isidro, ale on woli spędzać całe dnie w karczmie na jeziorze i wymieniać swoje ziele na ryżówkę.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Obawiam się, że uzależnił się od alkoholu. Nie mogę raczej liczyć na jego pomoc.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro przesiaduje w karczmie na jeziorze.");	
	};
};

// ************************************************************
// 					Ich könnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Mógłbym ci pomóc w sprzedaży ziela...";
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
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Mógłbym ci pomóc w sprzedaży ziela...
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Tak duże ładunki ziela mogę powierzyć tylko innym członkom Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Ale mógłbyś pomóc mi w rozdzielaniu prezentów.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Jeszcze całkiem spora grupa ludzi nie miała okazji skosztować mojego towaru. Gdyby spróbowali, chcieliby kupować więcej, czyli zyski ze sprzedaży mogłyby wzrosnąć.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Myślałem, że i bez tego ledwie sobie radzisz w pracy!
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Zająłem się już problemem Baala Isidro. Wysłałem wiadomość do Cor Kaloma.
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
	description = "Co będę z tego miał, jeśli zgodzę się rozdawać twoje 'prezenty'?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Co będę z tego miał, jeśli zgodzę się rozdawać twoje "prezenty"?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Mogę cię wynagrodzić na kilka różnych sposobów.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Mogę ci podarować zwoje z magicznymi zaklęciami Śniącego.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Albo mogę pomóc ci zostać jednym z nas, jeśli zechcesz. Utrzymuję dobre kontakty z Cor Kalomem i Baal Tyonem.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //To bliscy przyjaciele samego Y'Beriona, naszego wielkiego mistrza.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Wreszcie mogę ci zapłacić rudą, jeśli tak wolisz. 100 bryłek powinno wystarczyć, czyż nie?
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
	description = "Dobrze, daj mi to ziele. Komu mam je rozdawać?";
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
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Dobrze, daj mi to ziele. Komu mam je rozdawać?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Na pewno znajdzie się wielu chętnych. Porozmawiaj z ludźmi. Tylko każdemu z nich dawaj JEDNĄ porcję.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //I jeszcze coś: jeśli pozwolisz, by ktoś odebrał ci ziele, albo sam je wypalisz, naszą umowę uznam za nieważną.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Oczywiście.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Nowicjusz Baal Kagan dał mi 10 porcji ziela, które mam rozprowadzić w Nowym Obozie.");		
	
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
	description = "Rozdałem już całe ziele.";
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
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Rozdałem już całe ziele.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Pierwsi klienci zaczęli się już do mnie zgłaszać. Wykonałeś kawał dobrej roboty.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Co chcesz dostać jako wynagrodzenie?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Wezmę 100 bryłek rudy.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Pomóż mi dostać się do Bractwa.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Te zwoje wydają się całkiem interesujące - jakie zaklęcia zawierają?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan zyskał nowych klientów, a ja dostałem moją nagrodę.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Nie przyszli do mnie jeszcze żadni nowi klienci. Musisz rozdzielić jeszcze trochę ziela.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Te zwoje magiczne wydają się całkiem interesujące - jakie zaklęcia zawierają?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Uderzenie wiatru, Urok, Telekinezę, Pirokinezę i Sen. Możesz sobie wybrać trzy z nich.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Wezmę te zwoje z zaklęciami.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Pomóż mi dostać się do Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Twoja prośba jest bardzo skromna. Pomogę ci, tylko słuchaj uważnie. Baal Tyon jest jednym z młodszych Guru, tak jak ja.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion uczynił z niego swojego osobistego doradcę. Obawiam się, że to nie była najlepsza decyzja.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Tyon stał się przez to tak zarozumiały, że nie chce już pomagać nikomu oprócz swoich uczniów.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Daj mu to, jeśli chcesz mu rozwiązać język.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Baal Kagan dał mi specjalny Zew Nocy dla Baala Tyona. Ma mi on pomóc w dostaniu się do Bractwa.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Wezmę 100 bryłek rudy.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Proszę bardzo.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Wezmę te zwoje z zaklęciami.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Mądra decyzja. Wybierz trzy.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Uderzenie Wiatru",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Telekineza",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pirokineza",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Sen",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Urok",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To już trzy. Wykorzystaj je rozsądnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To już trzy. Wykorzystaj je rozsądnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To już trzy. Wykorzystaj je rozsądnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To już trzy. Wykorzystaj je rozsądnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To już trzy. Wykorzystaj je rozsądnie.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




