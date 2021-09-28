
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
	description		= "Ty jeste� Talas, ten kt�rego obrabowano!"; 
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
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Ty jeste� Talas, ten kt�rego obrabowano!
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Zostaw mnie w spokoju! Nie chc� o tym wi�cej m�wi�!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mog� ci pom�c w odzyskaniu tej ksi�gi."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Mog� ci pom�c w odzyskaniu tej ksi�gi.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Naprawd�? Zosta�em obrabowany przez gobliny! A teraz mam je odnale�� i odzyska� ksi�g�!
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Mam pomys�: ja ci poka��, gdzie jest almanach, a ty go odzyskasz!

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Zgoda.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"To ci� b�dzie kosztowa�o 30 bry�ek rudy.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Wejd� w to... za 50 bry�ek rudy.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Zgoda.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //�wietnie. Wyruszymy, gdy tylko b�dziesz got�w.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //To ci� b�dzie kosztowa�o 30 bry�ek rudy.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //W porz�dku. Mo�emy wyruszy�, gdy tylko b�dziesz gotowy.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Wejd� w to... za 50 bry�ek rudy.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Co? To� to rozb�j! A zreszt�. Daj mi zna�, gdy b�dziesz gotowy do drogi.
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
	description		= "Jestem gotowy, mo�emy rusza� w drog�."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Jestem gotowy, mo�emy rusza� w drog�.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //Dobrze. Chod� za mn�.
	
	B_LogEntry		(CH2_Book,"Zaoferowa�em Talasowi pomoc w odzyskaniu manuskryptu. Ma mnie teraz zaprowadzi� do miejsca, w kt�rym go straci�."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BR�CKE ****************************************//
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
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Te przekl�te bestyjki mieszkaj� w jaskini, za tym mostem. Uwa�aj na siebie!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Nie p�jdziesz ze mn�?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Zostan� tutaj i b�d�... ubezpiecza� ty�y.

	B_LogEntry		(CH2_Book,"Stoimy przed wej�ciem do jaskini goblin�w. Tch�rzliwy Nowicjusz nalega, �ebym wszed� tam sam.");
};

// ***************************** ZUR�CK INS LAGER ****************************************//
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
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Odzyska�e� almanach! Dobra robota! Wracajmy czym pr�dzej do Obozu!

	B_LogEntry		(CH2_Book,"Odzyska�em almanach! Teraz razem z Talasem odniesiemy go do obozu Bractwa.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zur�ck im Lager ****************************************//
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
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //No to jeste�my. Najlepiej zanie� od razu ten almanach Cor Kalomowi.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Tylko uwa�aj, �eby� nie umar� z przepracowania.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Spokojna g�owa. Nic mi nie b�dzie. Nie musisz si� o mnie martwi�.

	B_LogEntry		(CH2_Book,"Wr�cili�my na bagna. Talas to najwi�kszy tch�rz, jakiego spotka�em. Sam zanios� ksi�g� Cor Kalomowi!");

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
	description		= "Przysy�a mnie Cor Angar."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Przysy�a mnie Cor Angar. Masz mnie zabra� na Cmentarzysko Ork�w, gdzie przebywa Baal Lukor i jego Stra�nicy.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //A wi�c zn�w mam robi� za przewodnika. Niech to szlag! Bodajbym nigdy nie ujrza� tej ksi�gi na oczy!
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //No dobrze, chod� za mn�.
	
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
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Nie p�jd� z tob� na drug� stron� tego mostu. Nie jestem samob�jc�.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Oszala�e�, �e chcesz tam wchodzi�?! Nawet Baal Lukor stamt�d nie wr�ci�, a on mia� ze sob� �wi�tynnych Stra�nik�w!
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Co ma by� to b�dzie. Wracaj do obozu. Ja si� tu troch� rozejrz�.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
