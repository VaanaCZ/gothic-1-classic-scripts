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
	description = "Jesteœ z obozu Sekty, nieprawda¿?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Jesteœ z obozu Sekty, nieprawda¿?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Jesteœmy Bractwem Œni¹cego, ale tak - pochodzê z obozu na bagnie.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Jestem Baal Kagan. Niech Œni¹cy zawsze bêdzie z tob¹.
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
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Pocz¹tkowo przyby³em tutaj, by werbowaæ nowych ludzi do naszego Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ale ci barbarzyñcy maj¹ w nosie swoje duchowe zbawienie. Dlatego teraz zajmujê siê wy³¹cznie sprzeda¿¹ ziela.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Palenie ziela to doœæ popularne zajêcie w tych stronach. Mo¿e nawet zbyt popularne. Ledwie nad¹¿am z kolejnymi dostawami.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan sprzedaje ma³e porcje ziela Szkodnikom i Najemnikom z Nowego Obozu.");
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
	description = "Poka¿ mi, co masz do zaoferowania.";
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
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Poka¿ mi co masz do zaoferowania.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Jak sobie ¿yczysz.
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
	description = "Dlaczego nie przyœl¹ ci tu kogoœ do pomocy?";
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
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Dlaczego nie przyœl¹ ci tu kogoœ do pomocy?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Mia³ mi pomagaæ Baal Isidro, ale on woli spêdzaæ ca³e dnie w karczmie na jeziorze i wymieniaæ swoje ziele na ry¿ówkê.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Obawiam siê, ¿e uzale¿ni³ siê od alkoholu. Nie mogê raczej liczyæ na jego pomoc.
	
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
	description = "Móg³bym ci pomóc w sprzeda¿y ziela...";
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
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Móg³bym ci pomóc w sprzeda¿y ziela...
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Tak du¿e ³adunki ziela mogê powierzyæ tylko innym cz³onkom Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Ale móg³byœ pomóc mi w rozdzielaniu prezentów.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Jeszcze ca³kiem spora grupa ludzi nie mia³a okazji skosztowaæ mojego towaru. Gdyby spróbowali, chcieliby kupowaæ wiêcej, czyli zyski ze sprzeda¿y mog³yby wzrosn¹æ.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Myœla³em, ¿e i bez tego ledwie sobie radzisz w pracy!
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Zaj¹³em siê ju¿ problemem Baala Isidro. Wys³a³em wiadomoœæ do Cor Kaloma.
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
	description = "Co bêdê z tego mia³, jeœli zgodzê siê rozdawaæ twoje 'prezenty'?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Co bêdê z tego mia³, jeœli zgodzê siê rozdawaæ twoje "prezenty"?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Mogê ciê wynagrodziæ na kilka ró¿nych sposobów.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Mogê ci podarowaæ zwoje z magicznymi zaklêciami Œni¹cego.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Albo mogê pomóc ci zostaæ jednym z nas, jeœli zechcesz. Utrzymujê dobre kontakty z Cor Kalomem i Baal Tyonem.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //To bliscy przyjaciele samego Y'Beriona, naszego wielkiego mistrza.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Wreszcie mogê ci zap³aciæ rud¹, jeœli tak wolisz. 100 bry³ek powinno wystarczyæ, czy¿ nie?
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
	description = "Dobrze, daj mi to ziele. Komu mam je rozdawaæ?";
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
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Dobrze, daj mi to ziele. Komu mam je rozdawaæ?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Na pewno znajdzie siê wielu chêtnych. Porozmawiaj z ludŸmi. Tylko ka¿demu z nich dawaj JEDN¥ porcjê.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //I jeszcze coœ: jeœli pozwolisz, by ktoœ odebra³ ci ziele, albo sam je wypalisz, nasz¹ umowê uznam za niewa¿n¹.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Oczywiœcie.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Nowicjusz Baal Kagan da³ mi 10 porcji ziela, które mam rozprowadziæ w Nowym Obozie.");		
	
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
	description = "Rozda³em ju¿ ca³e ziele.";
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
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Rozda³em ju¿ ca³e ziele.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Pierwsi klienci zaczêli siê ju¿ do mnie zg³aszaæ. Wykona³eœ kawa³ dobrej roboty.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Co chcesz dostaæ jako wynagrodzenie?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Wezmê 100 bry³ek rudy.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Pomó¿ mi dostaæ siê do Bractwa.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Te zwoje wydaj¹ siê ca³kiem interesuj¹ce - jakie zaklêcia zawieraj¹?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan zyska³ nowych klientów, a ja dosta³em moj¹ nagrodê.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Nie przyszli do mnie jeszcze ¿adni nowi klienci. Musisz rozdzieliæ jeszcze trochê ziela.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Te zwoje magiczne wydaj¹ siê ca³kiem interesuj¹ce - jakie zaklêcia zawieraj¹?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Uderzenie wiatru, Urok, Telekinezê, Pirokinezê i Sen. Mo¿esz sobie wybraæ trzy z nich.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Wezmê te zwoje z zaklêciami.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Pomó¿ mi dostaæ siê do Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Twoja proœba jest bardzo skromna. Pomogê ci, tylko s³uchaj uwa¿nie. Baal Tyon jest jednym z m³odszych Guru, tak jak ja.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion uczyni³ z niego swojego osobistego doradcê. Obawiam siê, ¿e to nie by³a najlepsza decyzja.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Tyon sta³ siê przez to tak zarozumia³y, ¿e nie chce ju¿ pomagaæ nikomu oprócz swoich uczniów.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Daj mu to, jeœli chcesz mu rozwi¹zaæ jêzyk.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Baal Kagan da³ mi specjalny Zew Nocy dla Baala Tyona. Ma mi on pomóc w dostaniu siê do Bractwa.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Wezmê 100 bry³ek rudy.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Proszê bardzo.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Wezmê te zwoje z zaklêciami.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //M¹dra decyzja. Wybierz trzy.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To ju¿ trzy. Wykorzystaj je rozs¹dnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To ju¿ trzy. Wykorzystaj je rozs¹dnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To ju¿ trzy. Wykorzystaj je rozs¹dnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To ju¿ trzy. Wykorzystaj je rozs¹dnie.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //To ju¿ trzy. Wykorzystaj je rozs¹dnie.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




