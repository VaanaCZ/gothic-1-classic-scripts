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
	description	= "Poslal mě Baal Orun. Mám převzít celou sklizeň drogy z bažin.";
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
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Poslal mě Baal Orun. Mám převzít celou sklizeň drogy z bažin.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Dobře. Pak tam nemusím chodit sám. Tady je.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Nezapomeň zajít za Viranem na druhou stranu bažin, pokud jsi tam ještě nebyl.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Jinak by tvůj náklad mohl být příliš malý a lidé by si mohli pomyslet, že jsi druhou půlku rozprodal, haha.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor mi dal dnešní sklizeň drogy z bažin pro Cora Kaloma.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Podle Balora pracuje druhá skupina sběračů na druhé straně bažin. Protože nesmím klást Baalu Orunovi žádné otázky, musím prohledat bažiny, zda tam druhá skupina sběračů doopravdy je."); 
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
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //O-hó! Teď jsem ti nasadil brouka do hlavy, viď?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Zapomeň na to, byla to jen úvaha.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Jestli někoho znáš - mohli bysme se rozdělit.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Ne - řekni mi - kdo?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Zapomeň na to, to byla jen úvaha.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Jestli někoho znáš - mohli bysme se rozdělit.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Dobrá, věděl bych o někom z Nového tábora, koho by droga mohla zajímat...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ale jestli tě přitom přistihnou Guru, hodí tě močálovým žralokům! A já nevím nic, jasný?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Ne - řekni mi - kdo?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Ty máš něco v úmyslu! Řeknu ti jedno: jestli se ta droga nedostane ke Corovu Kalomovi, dostaneme se oba do maléru!
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
	description	= "Dobře - kdo je ten překupník z Nového tábora?";
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
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Dobře - kdo je ten překupník z Nového tábora?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Myslíš si, že ti řeknu to jméno a ty s tou drogou zmizíš - takhle to teda nepůjde!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Chci 50 nugetů jako platbu předem. Pak se uvidí.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Na to zapomeň.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50, to je fér - tady jsou.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50, to je fér - tady jsou.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Dobře... Poslouchej. Jmenuje se Cipher. Najdeš ho nejspíš u baru na jezeře.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Buď opatrný a nenech se od nikoho napálit.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor se zmínil o muži jménem Cipher, který by rád koupil sklizeň drogy z bažin. Můžu ho najít v baru na jezeře v Novém táboře. Budu však mít nesmírné potíže s guru.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher skupuje a prodává v baru na jezeře veškeré zboží. Obzvlášť se zajímá o velké dodávky drogy z bažin.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Nevidím těch 50 nugetů. Chci 50 nugetů a ani o jeden míň, jasný?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Zapomeň na to.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Nemysli si, že můžeš klidně jít do Nového tábora a prodat to kdekomu! Když nebudeš znát správné jméno, nikdy se toho nezbavíš!
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Ledaže bys nechal nějakého banditu, aby ti rozbil hlavu.
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
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //To jsem já, jsem zpátky. Mám převzít další várku.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //No jistě! A zase ji prodat v Novém táboře.
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Chci 50 nugetů - moji obvyklou platbu.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Zase ty? Dobrá, tady je, vem si to, ale neproveď žádnou hloupost, jasný?
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
	description	= "Dávej na to pořád pozor!";
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
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Dávej na to pořád pozor!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //Jistě, co myslíš, že tu dělám? Že ležím na břiše a kopu se do zadku?
};
