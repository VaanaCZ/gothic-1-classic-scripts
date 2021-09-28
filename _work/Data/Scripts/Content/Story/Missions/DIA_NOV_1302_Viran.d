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
	description	= "Czym siê zajmujecie?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Czym siê zajmujecie?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Zbieramy bagienne ziele, które zostanie przetworzone przez naszych braci tak, by mo¿na by³o je paliæ.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Praca na bagnach jest bardzo niebezpieczna, ale ziele roœnie wy³¹cznie tutaj. Oczywiœcie ma to równie¿ pewne zalety.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Jakie?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Pozosta³e obozy nie maj¹ do niego dostêpu. Jesteœmy jedynym osiedlem w ca³ej kolonii, które mo¿e zbieraæ ziele.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Mo¿emy je sprzedawaæ do pozosta³ych obozów, i to za ka¿d¹ cenê, jakiej za¿¹damy!
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
	description	= "Mam zabraæ wszystko co uda³o siê wam zebraæ do Cor Kaloma.";
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
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Przybywam z polecenia Baala Oruna. Mam zabraæ wszystko co uda³o siê wam zebraæ do Cor Kaloma.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //I co, myœlisz, ¿e to takie ³atwe?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Ka¿dy móg³by siê tutaj zjawiæ mówi¹c "Przysy³a mnie Baal Orun". I co wtedy? Mam wydaæ ca³e ziele byle w³óczêdze?
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Jeœli mi nie wierzysz, sam go o to zapytaj!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Ale mnie naprawdê przysy³a Baal Orun!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Ale mnie naprawdê przysy³a Baal Orun!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Jaaasne.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Jeœli mi nie wierzysz, sam go o to zapytaj!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Mam lepszy pomys³. Jeœli chcesz nas przekonaæ, ¿e jesteœ tym, za kogo siê podajesz, wyœwiadczysz nam drobn¹ przys³ugê!
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
	description	= "Co mam zrobiæ?";
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
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //To tylko drobiazg. Praca na bagnach nie nale¿y do najbezpieczniejszych, no i roi siê tu od tych przeklêtych Krwiopijców.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Gdyby ich tutaj nie by³o, nasza praca sta³aby siê o wiele bardziej znoœna. Kapujesz?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran da mi ziele, tylko jeœli zabijê wszystkich krwiopijców w promieniu 20 kroków.");
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
	description	= "Nie widzê ju¿ ¿adnych Krwiopijców w pobli¿u.";
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
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Nie widzê ju¿ ¿adnych Krwiopijców w pobli¿u.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Przecie¿ widaæ kilka z nich w odleg³oœci nie wiêkszej ni¿ dwadzieœcia kroków!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Tak ³atwo siê nie wywiniesz!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //¯adnego robala w polu widzenia. Odwali³eœ kawa³ solidnej roboty!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Có¿, albo jesteœ po naszej stronie, albo jesteœ skoñczonym idiot¹. Nikt inny nie podj¹³by siê takiego zadania.
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Ale skoñczony idiota nie próbowa³by mnie wykiwaæ, co nie?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Masz, to wszystko, co uda³o siê nam zebraæ. Zanieœ to do Cor Kaloma.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Jakby zacz¹³ narzekaæ, ¿e to za ma³o, mo¿esz mu powiedzieæ, ¿eby sam ruszy³ tutaj swój zadek i przekona³ siê jak ciê¿ko musimy harowaæ.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran da³ mi drug¹ po³owê dzisiejszych zbiorów. Ciekawe, czy Cor Kalom wreszcie bêdzie usatysfakcjonowany.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran przekaza³ mi dzisiejszy zbiór ziela. Nie ma tego wiele. Mo¿e w pobli¿u krêci siê jeszcze jedna grupa zbieraczy?");
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
	description	= "Dobrze siê bawicie?";
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
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Dobrze siê bawicie?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Œmia³o, ¿artuj sobie ze mnie. Za³o¿ê siê, ¿e zadania, które dostajesz od Guru te¿ nie nale¿¹ do najprzyjemniejszych.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Có¿, przynajmniej nie muszê w³asnorêcznie odwalaæ brudnej roboty. Od tego jest "piechota" - ha ha ha.
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
	description	= "Mam zabraæ nastêpny ³adunek ziela do Kaloma.";
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
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Mam zabraæ nastêpny ³adunek ziela do Kaloma.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Co, znowu?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Chyba nie ka¿esz mi teraz wybiæ dla ciebie wszystkich b³otnych wê¿y, co? Nie mam tyle czasu.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Dobra ju¿, dobra! Masz tu to cholerne ziele!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








