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
	description	= "Co tady dìláš?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Co tady dìláte?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Sbíráme tady drogu z bažin, kterou zpracovávají naši bratøi, aby jí bylo potom možné kouøit.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Sbìr v bažinách je velmi nebezpeèný, ale ta droga neroste nikde jinde. A vlastnì je to tak dobøe.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Proè?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Protože tak jí ostatní dva tábory nedostanou. Jsme jediní z kolonie, kdo mùže sbírat drogu z bažin.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Mùžeme s ní obchodovat s ostatníma dvìma tábory - MY si mùžeme stanovit cenu.
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
	description	= "Poslal mì Baal Orun. Mám pøedat celou sklizeò Kalomovi.";
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
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Poslal mì Baal Orun. Mám pøedat celou sklizeò Kalomovi.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //Pøedstavuješ si to dost jednouše, co?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //To by mohl øíci každý: 'poslal mì Baal Orun' - fííí - a celá sklizeò je tatam.
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Jdi za ním a zeptej se ho, když mi nevìøíš!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Ale Baal Orun mì skuteènì poslal!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Ale Baal Orun mì skuteènì poslal!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Jistì.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Jdi za ním a zeptej se ho, když mi nevìøíš!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Mám lepší nápad. Dokaž svou oddanost tím, že pro nás udìláš malou službièku!
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
	description	= "A co mám udìlat?";
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
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //A co mám udìlat?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //Jenom malièkost. Práce v bažinách je trochu nebezpeèná, a ještì ke všemu jsou tam ty proklaté krvavé mouchy.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Práce by byla daleko snazší bez nich! Už chápeš?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran mi dal drogu z bažin, když jsem vyhladil všechny krvavé mouchy v okruhu 20 krokù.");
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
	description	= "Už tu žádné krvavé mouchy nevidím.";
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
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Už tu žádné krvavé mouchy nevidím.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Na každém dvanáctém kroku jsou ale další hovada!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Ty se ti tak snadno odstranit nepodaøí!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //Už tu nejsou žádné potvory. Odvedl jsi dobrou práci!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Ten, kdo takhle pracuje, je buï na naší stranì, nebo je úplný idiot!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Ale idiot by byl pøíliš hloupý, aby mì pøelstil, nemám pravdu?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Tak si vezmi tu sklizeò a pøedej ji Cor Kalomovi.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Jestli si bude stìžovat, že jí není dost, vzkaž mu, a pohne svým zadkem sem a já mu udìlám pøedstavu o tom, jak tìžká je to práce.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi pøedal druhou polovinu dnešní skliznì drogy z bažin. Uvidíme, jestli bude Cor Kalom s tímto množstvím spokojený.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi dal dnešní sklizeò drogy z bažin. Nevypadá to, že je jí dost. Snad je tu ještì druhá skupina sbìraèù.");
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
	description	= "Jak jde sklízení?";
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
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Jak jde sklízení?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Jasnì, jasnì, teï jsi mì pobavil. Jsem pøesvìdèený, že jsi od Guru dostal nìco lepšího na práci.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Jistì, aspoò tu špinavou práci nebudu muset dìlat sám. Od toho je 'pìchota' - hehehe!
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
	description	= "Jsem tu, abych pro Cora Kaloma znovu pøevzal celou sklizeò.";
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
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Jsem tu, abych pro Cora Kaloma znovu pøevzal celou sklizeò.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Znovu?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Jen mi teï neøíkej, že mám zabít všechny ty moèálové žraloky! Opravdu nemám moc èasu.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Dobøe, dobøe! Tady je ta zatracená sklizeò!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








