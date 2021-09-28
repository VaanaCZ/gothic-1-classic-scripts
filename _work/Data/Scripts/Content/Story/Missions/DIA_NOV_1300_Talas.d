
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
	description		= "Ty jesteœ Talas, ten którego obrabowano!"; 
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
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Ty jesteœ Talas, ten którego obrabowano!
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Zostaw mnie w spokoju! Nie chcê o tym wiêcej mówiæ!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mogê ci pomóc w odzyskaniu tej ksiêgi."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Mogê ci pomóc w odzyskaniu tej ksiêgi.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Naprawdê? Zosta³em obrabowany przez gobliny! A teraz mam je odnaleŸæ i odzyskaæ ksiêgê!
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Mam pomys³: ja ci poka¿ê, gdzie jest almanach, a ty go odzyskasz!

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Zgoda.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"To ciê bêdzie kosztowa³o 30 bry³ek rudy.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Wejdê w to... za 50 bry³ek rudy.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Zgoda.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //Œwietnie. Wyruszymy, gdy tylko bêdziesz gotów.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //To ciê bêdzie kosztowa³o 30 bry³ek rudy.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //W porz¹dku. Mo¿emy wyruszyæ, gdy tylko bêdziesz gotowy.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Wejdê w to... za 50 bry³ek rudy.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Co? To¿ to rozbój! A zreszt¹. Daj mi znaæ, gdy bêdziesz gotowy do drogi.
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
	description		= "Jestem gotowy, mo¿emy ruszaæ w drogê."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Jestem gotowy, mo¿emy ruszaæ w drogê.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //Dobrze. ChodŸ za mn¹.
	
	B_LogEntry		(CH2_Book,"Zaoferowa³em Talasowi pomoc w odzyskaniu manuskryptu. Ma mnie teraz zaprowadziæ do miejsca, w którym go straci³."); 
	
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
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Te przeklête bestyjki mieszkaj¹ w jaskini, za tym mostem. Uwa¿aj na siebie!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Nie pójdziesz ze mn¹?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Zostanê tutaj i bêdê... ubezpiecza³ ty³y.

	B_LogEntry		(CH2_Book,"Stoimy przed wejœciem do jaskini goblinów. Tchórzliwy Nowicjusz nalega, ¿ebym wszed³ tam sam.");
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
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Odzyska³eœ almanach! Dobra robota! Wracajmy czym prêdzej do Obozu!

	B_LogEntry		(CH2_Book,"Odzyska³em almanach! Teraz razem z Talasem odniesiemy go do obozu Bractwa.");

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
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //No to jesteœmy. Najlepiej zanieœ od razu ten almanach Cor Kalomowi.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Tylko uwa¿aj, ¿ebyœ nie umar³ z przepracowania.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Spokojna g³owa. Nic mi nie bêdzie. Nie musisz siê o mnie martwiæ.

	B_LogEntry		(CH2_Book,"Wróciliœmy na bagna. Talas to najwiêkszy tchórz, jakiego spotka³em. Sam zaniosê ksiêgê Cor Kalomowi!");

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
	description		= "Przysy³a mnie Cor Angar."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Przysy³a mnie Cor Angar. Masz mnie zabraæ na Cmentarzysko Orków, gdzie przebywa Baal Lukor i jego Stra¿nicy.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //A wiêc znów mam robiæ za przewodnika. Niech to szlag! Bodajbym nigdy nie ujrza³ tej ksiêgi na oczy!
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //No dobrze, chodŸ za mn¹.
	
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
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Nie pójdê z tob¹ na drug¹ stronê tego mostu. Nie jestem samobójc¹.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Oszala³eœ, ¿e chcesz tam wchodziæ?! Nawet Baal Lukor stamt¹d nie wróci³, a on mia³ ze sob¹ Œwi¹tynnych Stra¿ników!
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Co ma byæ to bêdzie. Wracaj do obozu. Ja siê tu trochê rozejrzê.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
