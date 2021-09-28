// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Balor_Exit (C_INFO)
{
	npc			=  Nov_1304_Balor;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Balor_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Kraut abholen
// **************************************************
	var int Balor_BotenDay;
// **************************************************

instance  DIA_Balor_FetchWeed (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_FetchWeed_Condition;
	information	= DIA_Balor_FetchWeed_Info;
	permanent	= 0;
	description	= "Poslal mì Baal Orun. Mám pøevzít celou sklizeò drogy z bain.";
};                       

FUNC int  DIA_Balor_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Poslal mì Baal Orun. Mám pøevzít celou sklizeò drogy z bain.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Dobøe. Pak tam nemusím chodit sám. Tady je.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Nezapomeò zajít za Viranem na druhou stranu bain, pokud jsi tam ještì nebyl.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Jinak by tvùj náklad mohl bıt pøíliš malı a lidé by si mohli pomyslet, e jsi druhou pùlku rozprodal, haha.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor mi dal dnešní sklizeò drogy z bain pro Cora Kaloma.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Podle Balora pracuje druhá skupina sbìraèù na druhé stranì bain. Protoe nesmím klást Baalu Orunovi ádné otázky, musím prohledat bainy, zda tam druhá skupina sbìraèù doopravdy je."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verhökern?
// **************************************************
	var int Balor_PlayerCheating;
// **************************************************

instance  DIA_Balor_SellUnder (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_SellUnder_Condition;
	information	= DIA_Balor_SellUnder_Info;
	permanent	= 0;
	description	= "Komu jinému bych mohl tu drogu prodat?";
};                       

FUNC int  DIA_Balor_SellUnder_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_SellUnder_Info()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Komu jinému bych mohl tu drogu prodat?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //O-hó! Teï jsem ti nasadil brouka do hlavy, viï?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Zapomeò na to, byla to jen úvaha.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Jestli nìkoho znáš - mohli bysme se rozdìlit.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Ne - øekni mi - kdo?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Zapomeò na to, to byla jen úvaha.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Jestli nìkoho znáš - mohli bysme se rozdìlit.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Dobrá, vìdìl bych o nìkom z Nového tábora, koho by droga mohla zajímat...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ale jestli tì pøitom pøistihnou Guru, hodí tì moèálovım ralokùm! A já nevím nic, jasnı?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Ne - øekni mi - kdo?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Ty máš nìco v úmyslu! Øeknu ti jedno: jestli se ta droga nedostane ke Corovu Kalomovi, dostaneme se oba do maléru!
};

// **************************************************
//				Name des Dealers
// **************************************************
	var int Balor_TellsNCDealer;
// **************************************************

instance  DIA_Balor_TellDealer (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_TellDealer_Condition;
	information	= DIA_Balor_TellDealer_Info;
	permanent	= 1;
	description	= "Dobøe - kdo je ten pøekupník z Nového tábora?";
};                       

FUNC int  DIA_Balor_TellDealer_Condition()
{
	if ( (Balor_PlayerCheating==TRUE) && (Balor_TellsNCDealer==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_TellDealer_Info()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Dobøe - kdo je ten pøekupník z Nového tábora?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Myslíš si, e ti øeknu to jméno a ty s tou drogou zmizíš - takhle to teda nepùjde!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Chci 50 nugetù jako platbu pøedem. Pak se uvidí.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Na to zapomeò.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50, to je fér - tady jsou.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50, to je fér - tady jsou.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Dobøe... Poslouchej. Jmenuje se Cipher. Najdeš ho nejspíš u baru na jezeøe.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Buï opatrnı a nenech se od nikoho napálit.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor se zmínil o mui jménem Cipher, kterı by rád koupil sklizeò drogy z bain. Mùu ho najít v baru na jezeøe v Novém táboøe. Budu však mít nesmírné potíe s guru.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher skupuje a prodává v baru na jezeøe veškeré zboí. Obzvláš se zajímá o velké dodávky drogy z bain.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Nevidím tìch 50 nugetù. Chci 50 nugetù a ani o jeden míò, jasnı?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Zapomeò na to.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Nemysli si, e mùeš klidnì jít do Nového tábora a prodat to kdekomu! Kdy nebudeš znát správné jméno, nikdy se toho nezbavíš!
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Ledae bys nechal nìjakého banditu, aby ti rozbil hlavu.
	Info_ClearChoices 	(DIA_Balor_TellDealer);
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Balor_RipOff (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 5;
	condition	= DIA_Balor_RipOff_Condition;
	information	= DIA_Balor_RipOff_Info;
	permanent	= 0;
	description	= "Mám tady vyzvednout další dodávku pro Cora Kaloma.";
};                       

FUNC int  DIA_Balor_RipOff_Condition()
{
	if ( (Balor_BotenDay<=(Wld_GetDay()-2)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_RipOff_Info()
{
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //To jsem já, jsem zpátky. Mám pøevzít další várku.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //No jistì! A zase ji prodat v Novém táboøe.
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Chci 50 nugetù - moji obvyklou platbu.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Zase ty? Dobrá, tady je, vem si to, ale neproveï ádnou hloupost, jasnı?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //To bych si nedovolil.
		CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
		B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
	};
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Balor_Perm (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_Perm_Condition;
	information	= DIA_Balor_Perm_Info;
	permanent	= 1;
	description	= "Dávej na to poøád pozor!";
};                       

FUNC int  DIA_Balor_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_Perm_Info()
{
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Dávej na to poøád pozor!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //Jistì, co myslíš, e tu dìlám? e leím na bøiše a kopu se do zadku?
};
