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
	description	= "Poslal m� Baal Orun. M�m p�evz�t celou sklize� drogy z ba�in.";
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
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Poslal m� Baal Orun. M�m p�evz�t celou sklize� drogy z ba�in.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Dob�e. Pak tam nemus�m chodit s�m. Tady je.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Nezapome� zaj�t za Viranem na druhou stranu ba�in, pokud jsi tam je�t� nebyl.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Jinak by tv�j n�klad mohl b�t p��li� mal� a lid� by si mohli pomyslet, �e jsi druhou p�lku rozprodal, haha.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor mi dal dne�n� sklize� drogy z ba�in pro Cora Kaloma.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Podle Balora pracuje druh� skupina sb�ra�� na druh� stran� ba�in. Proto�e nesm�m kl�st Baalu Orunovi ��dn� ot�zky, mus�m prohledat ba�iny, zda tam druh� skupina sb�ra�� doopravdy je."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verh�kern?
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
	description	= "Komu jin�mu bych mohl tu drogu prodat?";
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
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Komu jin�mu bych mohl tu drogu prodat?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //O-h�! Te� jsem ti nasadil brouka do hlavy, vi�?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Zapome� na to, byla to jen �vaha.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Jestli n�koho zn� - mohli bysme se rozd�lit.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Ne - �ekni mi - kdo?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Zapome� na to, to byla jen �vaha.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Jestli n�koho zn� - mohli bysme se rozd�lit.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Dobr�, v�d�l bych o n�kom z Nov�ho t�bora, koho by droga mohla zaj�mat...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Ale jestli t� p�itom p�istihnou Guru, hod� t� mo��lov�m �ralok�m! A j� nev�m nic, jasn�?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Ne - �ekni mi - kdo?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Ty m� n�co v �myslu! �eknu ti jedno: jestli se ta droga nedostane ke Corovu Kalomovi, dostaneme se oba do mal�ru!
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
	description	= "Dob�e - kdo je ten p�ekupn�k z Nov�ho t�bora?";
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
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Dob�e - kdo je ten p�ekupn�k z Nov�ho t�bora?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Mysl� si, �e ti �eknu to jm�no a ty s tou drogou zmiz� - takhle to teda nep�jde!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Chci 50 nuget� jako platbu p�edem. Pak se uvid�.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Na to zapome�.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50, to je f�r - tady jsou.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50, to je f�r - tady jsou.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Dob�e... Poslouchej. Jmenuje se Cipher. Najde� ho nejsp� u baru na jeze�e.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Bu� opatrn� a nenech se od nikoho nap�lit.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor se zm�nil o mu�i jm�nem Cipher, kter� by r�d koupil sklize� drogy z ba�in. M��u ho naj�t v baru na jeze�e v Nov�m t�bo�e. Budu v�ak m�t nesm�rn� pot�e s guru.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher skupuje a prod�v� v baru na jeze�e ve�ker� zbo��. Obzvl᚝ se zaj�m� o velk� dod�vky drogy z ba�in.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Nevid�m t�ch 50 nuget�. Chci 50 nuget� a ani o jeden m��, jasn�?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Zapome� na to.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Nemysli si, �e m��e� klidn� j�t do Nov�ho t�bora a prodat to kdekomu! Kdy� nebude� zn�t spr�vn� jm�no, nikdy se toho nezbav�!
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Leda�e bys nechal n�jak�ho banditu, aby ti rozbil hlavu.
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
	description	= "M�m tady vyzvednout dal�� dod�vku pro Cora Kaloma.";
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
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //To jsem j�, jsem zp�tky. M�m p�evz�t dal�� v�rku.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //No jist�! A zase ji prodat v Nov�m t�bo�e.
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Chci 50 nuget� - moji obvyklou platbu.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Zase ty? Dobr�, tady je, vem si to, ale neprove� ��dnou hloupost, jasn�?
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
	description	= "D�vej na to po��d pozor!";
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
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //D�vej na to po��d pozor!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //Jist�, co mysl�, �e tu d�l�m? �e le��m na b�i�e a kopu se do zadku?
};
