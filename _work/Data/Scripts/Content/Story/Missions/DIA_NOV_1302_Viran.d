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
	description	= "Czym si� zajmujecie?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Czym si� zajmujecie?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Zbieramy bagienne ziele, kt�re zostanie przetworzone przez naszych braci tak, by mo�na by�o je pali�.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Praca na bagnach jest bardzo niebezpieczna, ale ziele ro�nie wy��cznie tutaj. Oczywi�cie ma to r�wnie� pewne zalety.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Jakie?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Pozosta�e obozy nie maj� do niego dost�pu. Jeste�my jedynym osiedlem w ca�ej kolonii, kt�re mo�e zbiera� ziele.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Mo�emy je sprzedawa� do pozosta�ych oboz�w, i to za ka�d� cen�, jakiej za��damy!
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
	description	= "Mam zabra� wszystko co uda�o si� wam zebra� do Cor Kaloma.";
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
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Przybywam z polecenia Baala Oruna. Mam zabra� wszystko co uda�o si� wam zebra� do Cor Kaloma.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //I co, my�lisz, �e to takie �atwe?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Ka�dy m�g�by si� tutaj zjawi� m�wi�c "Przysy�a mnie Baal Orun". I co wtedy? Mam wyda� ca�e ziele byle w��cz�dze?
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Je�li mi nie wierzysz, sam go o to zapytaj!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Ale mnie naprawd� przysy�a Baal Orun!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Ale mnie naprawd� przysy�a Baal Orun!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Jaaasne.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Je�li mi nie wierzysz, sam go o to zapytaj!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Mam lepszy pomys�. Je�li chcesz nas przekona�, �e jeste� tym, za kogo si� podajesz, wy�wiadczysz nam drobn� przys�ug�!
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
	description	= "Co mam zrobi�?";
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
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //To tylko drobiazg. Praca na bagnach nie nale�y do najbezpieczniejszych, no i roi si� tu od tych przekl�tych Krwiopijc�w.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Gdyby ich tutaj nie by�o, nasza praca sta�aby si� o wiele bardziej zno�na. Kapujesz?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran da mi ziele, tylko je�li zabij� wszystkich krwiopijc�w w promieniu 20 krok�w.");
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
	description	= "Nie widz� ju� �adnych Krwiopijc�w w pobli�u.";
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
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Nie widz� ju� �adnych Krwiopijc�w w pobli�u.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unver�ndert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Przecie� wida� kilka z nich w odleg�o�ci nie wi�kszej ni� dwadzie�cia krok�w!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Tak �atwo si� nie wywiniesz!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //�adnego robala w polu widzenia. Odwali�e� kawa� solidnej roboty!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //C�, albo jeste� po naszej stronie, albo jeste� sko�czonym idiot�. Nikt inny nie podj��by si� takiego zadania.
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Ale sko�czony idiota nie pr�bowa�by mnie wykiwa�, co nie?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Masz, to wszystko, co uda�o si� nam zebra�. Zanie� to do Cor Kaloma.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Jakby zacz�� narzeka�, �e to za ma�o, mo�esz mu powiedzie�, �eby sam ruszy� tutaj sw�j zadek i przekona� si� jak ci�ko musimy harowa�.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran da� mi drug� po�ow� dzisiejszych zbior�w. Ciekawe, czy Cor Kalom wreszcie b�dzie usatysfakcjonowany.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran przekaza� mi dzisiejszy zbi�r ziela. Nie ma tego wiele. Mo�e w pobli�u kr�ci si� jeszcze jedna grupa zbieraczy?");
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
	description	= "Dobrze si� bawicie?";
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
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Dobrze si� bawicie?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //�mia�o, �artuj sobie ze mnie. Za�o�� si�, �e zadania, kt�re dostajesz od Guru te� nie nale�� do najprzyjemniejszych.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //C�, przynajmniej nie musz� w�asnor�cznie odwala� brudnej roboty. Od tego jest "piechota" - ha ha ha.
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
	description	= "Mam zabra� nast�pny �adunek ziela do Kaloma.";
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
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Mam zabra� nast�pny �adunek ziela do Kaloma.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Co, znowu?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Chyba nie ka�esz mi teraz wybi� dla ciebie wszystkich b�otnych w�y, co? Nie mam tyle czasu.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Dobra ju�, dobra! Masz tu to cholerne ziele!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








