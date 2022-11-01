
// ************************ EXIT **************************

instance  Nov_1300_Talas_Exit (C_INFO)
{
	npc			=  Nov_1300_Talas;
	nr			=  999;
	condition	=  Nov_1300_Talas_Exit_Condition;
	information	=  Nov_1300_Talas_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1300_Talas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jesteś Talas, ten którego obrabowano!"; 
};

FUNC int  Nov_1300_Talas_UR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_CorKalom_BringBook)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_UR_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Ty jesteś Talas, ten którego obrabowano!
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Zostaw mnie w spokoju! Nie chcę o tym więcej mówić!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mogę ci pomóc w odzyskaniu tej księgi."; 
};

FUNC int  Nov_1300_Talas_HELP_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_UR)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};
};
FUNC void  Nov_1300_Talas_HELP_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Mogę ci pomóc w odzyskaniu tej księgi.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Naprawdę? Zostałem obrabowany przez gobliny! A teraz mam je odnaleźć i odzyskać księgę!
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Mam pomysł: ja ci pokażę, gdzie jest almanach, a ty go odzyskasz!

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Zgoda.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"To cię będzie kosztowało 30 bryłek rudy.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Wejdę w to... za 50 bryłek rudy.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Zgoda.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //Świetnie. Wyruszymy, gdy tylko będziesz gotów.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //To cię będzie kosztowało 30 bryłek rudy.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //W porządku. Możemy wyruszyć, gdy tylko będziesz gotowy.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Wejdę w to... za 50 bryłek rudy.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Co? Toż to rozbój! A zresztą. Daj mi znać, gdy będziesz gotowy do drogi.
	CreateInvItems		(self,ItMiNugget,50);
	B_GiveInvItems      (self,hero,ItMiNugget,50);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};

// ***************************** INFOS ****************************************//
instance  Nov_1300_Talas_READY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_READY_Condition;
	information		= Nov_1300_Talas_READY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem gotowy, możemy ruszać w drogę."; 
};

FUNC int  Nov_1300_Talas_READY_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_HELP)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_READY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Jestem gotowy, możemy ruszać w drogę.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //Dobrze. Chodź za mną.
	
	B_LogEntry		(CH2_Book,"Zaoferowałem Talasowi pomoc w odzyskaniu manuskryptu. Ma mnie teraz zaprowadzić do miejsca, w którym go stracił."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BRÜCKE ****************************************//
instance  Nov_1300_Talas_BRIDGE (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BRIDGE_Condition;
	information		= Nov_1300_Talas_BRIDGE_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BRIDGE_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_READY ))
	&&	(Npc_GetDistToWP(self, "LOCATION_29_02")<1000)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BRIDGE_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Te przeklęte bestyjki mieszkają w jaskini, za tym mostem. Uważaj na siebie!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Nie pójdziesz ze mną?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Zostanę tutaj i będę... ubezpieczał tyły.

	B_LogEntry		(CH2_Book,"Stoimy przed wejściem do jaskini goblinów. Tchórzliwy Nowicjusz nalega, żebym wszedł tam sam.");
};

// ***************************** ZURÜCK INS LAGER ****************************************//
instance  Nov_1300_Talas_BACK (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACK_Condition;
	information		= Nov_1300_Talas_BACK_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACK_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_BRIDGE ))
	&&	(Npc_HasItems (hero,ItWrFokusbuch))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BACK_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Odzyskałeś almanach! Dobra robota! Wracajmy czym prędzej do Obozu!

	B_LogEntry		(CH2_Book,"Odzyskałem almanach! Teraz razem z Talasem odniesiemy go do obozu Bractwa.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zurück im Lager ****************************************//
instance  Nov_1300_Talas_RETURNED (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_RETURNED_Condition;
	information		= Nov_1300_Talas_RETURNED_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_RETURNED_Condition()
{
	if	(Npc_KnowsInfo (hero, Nov_1300_Talas_BACK ))
	&&	Npc_HasItems (hero,ItWrFokusbuch)
	&&	(Npc_GetDistToWP  (self, "PSI_START")<1000)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_RETURNED_Info()
{
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //No to jesteśmy. Najlepiej zanieś od razu ten almanach Cor Kalomowi.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Tylko uważaj, żebyś nie umarł z przepracowania.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Spokojna głowa. Nic mi nie będzie. Nie musisz się o mnie martwić.

	B_LogEntry		(CH2_Book,"Wróciliśmy na bagna. Talas to największy tchórz, jakiego spotkałem. Sam zaniosę księgę Cor Kalomowi!");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"BackInCamp");
	AI_StopProcessInfos	(self);
};


// ***************************** zum OGY ****************************************//
instance  Nov_1300_Talas_OGY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_OGY_Condition;
	information		= Nov_1300_Talas_OGY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przysyła mnie Cor Angar."; 
};

FUNC int  Nov_1300_Talas_OGY_Condition()
{
	if ( Npc_KnowsInfo ( hero, GUR_1202_CorAngar_WHERE ))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_OGY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Przysyła mnie Cor Angar. Masz mnie zabrać na Cmentarzysko Orków, gdzie przebywa Baal Lukor i jego Strażnicy.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //A więc znów mam robić za przewodnika. Niech to szlag! Bodajbym nigdy nie ujrzał tej księgi na oczy!
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //No dobrze, chodź za mną.
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"OGY");
};  

// ***************************** am OGY ****************************************//
instance  Nov_1300_Talas_BACKAGAIN (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACKAGAIN_Condition;
	information		= Nov_1300_Talas_BACKAGAIN_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACKAGAIN_Condition()
{
	if ( Npc_GetDistToWP(self,"OW_PATH_011")<1000 )
	{
		return 1;
	};
};

FUNC void  Nov_1300_Talas_BACKAGAIN_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Nie pójdę z tobą na drugą stronę tego mostu. Nie jestem samobójcą.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Oszalałeś, że chcesz tam wchodzić?! Nawet Baal Lukor stamtąd nie wrócił, a on miał ze sobą Świątynnych Strażników!
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Co ma być to będzie. Wracaj do obozu. Ja się tu trochę rozejrzę.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
