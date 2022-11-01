// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "Czym się zajmujecie?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Czym się zajmujecie?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Zbieramy bagienne ziele, które zostanie przetworzone przez naszych braci tak, by można było je palić.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Praca na bagnach jest bardzo niebezpieczna, ale ziele rośnie wyłącznie tutaj. Oczywiście ma to również pewne zalety.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Jakie?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Pozostałe obozy nie mają do niego dostępu. Jesteśmy jedynym osiedlem w całej kolonii, które może zbierać ziele.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Możemy je sprzedawać do pozostałych obozów, i to za każdą cenę, jakiej zażądamy!
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Mam zabrać wszystko co udało się wam zebrać do Cor Kaloma.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Przybywam z polecenia Baala Oruna. Mam zabrać wszystko co udało się wam zebrać do Cor Kaloma.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //I co, myślisz, że to takie łatwe?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Każdy mógłby się tutaj zjawić mówiąc "Przysyła mnie Baal Orun". I co wtedy? Mam wydać całe ziele byle włóczędze?
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Jeśli mi nie wierzysz, sam go o to zapytaj!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Ale mnie naprawdę przysyła Baal Orun!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Ale mnie naprawdę przysyła Baal Orun!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Jaaasne.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Jeśli mi nie wierzysz, sam go o to zapytaj!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Mam lepszy pomysł. Jeśli chcesz nas przekonać, że jesteś tym, za kogo się podajesz, wyświadczysz nam drobną przysługę!
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "Co mam zrobić?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //Co mam zrobić?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //To tylko drobiazg. Praca na bagnach nie należy do najbezpieczniejszych, no i roi się tu od tych przeklętych Krwiopijców.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Gdyby ich tutaj nie było, nasza praca stałaby się o wiele bardziej znośna. Kapujesz?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran da mi ziele, tylko jeśli zabiję wszystkich krwiopijców w promieniu 20 kroków.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "Nie widzę już żadnych Krwiopijców w pobliżu.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Nie widzę już żadnych Krwiopijców w pobliżu.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Przecież widać kilka z nich w odległości nie większej niż dwadzieścia kroków!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Tak łatwo się nie wywiniesz!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //Żadnego robala w polu widzenia. Odwaliłeś kawał solidnej roboty!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Cóż, albo jesteś po naszej stronie, albo jesteś skończonym idiotą. Nikt inny nie podjąłby się takiego zadania.
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Ale skończony idiota nie próbowałby mnie wykiwać, co nie?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Masz, to wszystko, co udało się nam zebrać. Zanieś to do Cor Kaloma.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Jakby zaczął narzekać, że to za mało, możesz mu powiedzieć, żeby sam ruszył tutaj swój zadek i przekonał się jak ciężko musimy harować.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran dał mi drugą połowę dzisiejszych zbiorów. Ciekawe, czy Cor Kalom wreszcie będzie usatysfakcjonowany.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran przekazał mi dzisiejszy zbiór ziela. Nie ma tego wiele. Może w pobliżu kręci się jeszcze jedna grupa zbieraczy?");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "Dobrze się bawicie?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Dobrze się bawicie?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Śmiało, żartuj sobie ze mnie. Założę się, że zadania, które dostajesz od Guru też nie należą do najprzyjemniejszych.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Cóż, przynajmniej nie muszę własnoręcznie odwalać brudnej roboty. Od tego jest "piechota" - ha ha ha.
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "Mam zabrać następny ładunek ziela do Kaloma.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Mam zabrać następny ładunek ziela do Kaloma.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Co, znowu?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Chyba nie każesz mi teraz wybić dla ciebie wszystkich błotnych węży, co? Nie mam tyle czasu.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Dobra już, dobra! Masz tu to cholerne ziele!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








