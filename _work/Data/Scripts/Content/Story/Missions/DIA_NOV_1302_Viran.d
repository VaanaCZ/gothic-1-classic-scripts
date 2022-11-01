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
	description	= "Co tady děláš?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Co tady děláte?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Sbíráme tady drogu z bažin, kterou zpracovávají naši bratři, aby jí bylo potom možné kouřit.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Sběr v bažinách je velmi nebezpečný, ale ta droga neroste nikde jinde. A vlastně je to tak dobře.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Proč?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Protože tak jí ostatní dva tábory nedostanou. Jsme jediní z kolonie, kdo může sbírat drogu z bažin.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Můžeme s ní obchodovat s ostatníma dvěma tábory - MY si můžeme stanovit cenu.
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
	description	= "Poslal mě Baal Orun. Mám předat celou sklizeň Kalomovi.";
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
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Poslal mě Baal Orun. Mám předat celou sklizeň Kalomovi.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //Představuješ si to dost jednouše, co?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //To by mohl říci každý: 'poslal mě Baal Orun' - fííí - a celá sklizeň je tatam.
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Jdi za ním a zeptej se ho, když mi nevěříš!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Ale Baal Orun mě skutečně poslal!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Ale Baal Orun mě skutečně poslal!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Jistě.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Jdi za ním a zeptej se ho, když mi nevěříš!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Mám lepší nápad. Dokaž svou oddanost tím, že pro nás uděláš malou službičku!
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
	description	= "A co mám udělat?";
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
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //A co mám udělat?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //Jenom maličkost. Práce v bažinách je trochu nebezpečná, a ještě ke všemu jsou tam ty proklaté krvavé mouchy.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Práce by byla daleko snazší bez nich! Už chápeš?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran mi dal drogu z bažin, když jsem vyhladil všechny krvavé mouchy v okruhu 20 kroků.");
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
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Ty se ti tak snadno odstranit nepodaří!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //Už tu nejsou žádné potvory. Odvedl jsi dobrou práci!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Ten, kdo takhle pracuje, je buď na naší straně, nebo je úplný idiot!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Ale idiot by byl příliš hloupý, aby mě přelstil, nemám pravdu?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Tak si vezmi tu sklizeň a předej ji Cor Kalomovi.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Jestli si bude stěžovat, že jí není dost, vzkaž mu, ať pohne svým zadkem sem a já mu udělám představu o tom, jak těžká je to práce.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi předal druhou polovinu dnešní sklizně drogy z bažin. Uvidíme, jestli bude Cor Kalom s tímto množstvím spokojený.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi dal dnešní sklizeň drogy z bažin. Nevypadá to, že je jí dost. Snad je tu ještě druhá skupina sběračů.");
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
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Jasně, jasně, teď jsi mě pobavil. Jsem přesvědčený, že jsi od Guru dostal něco lepšího na práci.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Jistě, aspoň tu špinavou práci nebudu muset dělat sám. Od toho je 'pěchota' - hehehe!
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
	description	= "Jsem tu, abych pro Cora Kaloma znovu převzal celou sklizeň.";
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
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Jsem tu, abych pro Cora Kaloma znovu převzal celou sklizeň.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Znovu?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Jen mi teď neříkej, že mám zabít všechny ty močálové žraloky! Opravdu nemám moc času.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Dobře, dobře! Tady je ta zatracená sklizeň!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








