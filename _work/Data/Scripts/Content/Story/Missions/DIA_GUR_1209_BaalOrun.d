// **************************************************
//						EXIT
// **************************************************

instance  DIA_BaalOrun_Exit (C_INFO)
{
	npc			=  Gur_1209_BaalOrun;
	nr			=  999;
	condition	=  DIA_BaalOrun_Exit_Condition;
	information	=  DIA_BaalOrun_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungl‰ubiger) 
// ************************************************************
	var int BaalOrun_Ansprechbar;
	var int BaalOrun_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalOrun_NoTalk(C_INFO)
{
	npc				= GUR_1209_BaalOrun;
	nr				= 2;
	condition		= DIA_BaalOrun_NoTalk_Condition;
	information		= DIA_BaalOrun_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalOrun_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalOrun_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalOrun_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalOrun_NoTalk);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,DIALOG_ENDE					,DIA_BaalOrun_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Je vöechno v po¯·dku, p¯Ìteli?",DIA_BaalOrun_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Sp·Ë buÔ s tebou!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Zdar! Jsem tu nov˝!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Hi_15_00"); //Zdar! Jsem tu nov˝!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Hi_12_01"); //(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Sleeper_15_00"); //Sp·Ë buÔ s tebou!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Sleeper_12_01"); //(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Imp_15_00"); //Je vöechno v po¯·dku, p¯Ìteli?
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Imp_12_01"); //(vzdech)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//		Ghorim_KickHarlok Success + MISSION
// **************************************************
instance  DIA_BaalOrun_FirstTalk (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_FirstTalk_Condition;
	information	= DIA_BaalOrun_FirstTalk_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalOrun_FirstTalk_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_FirstTalk_Info()
{
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_00"); //Mluvil jsem s Ghorimem. Prok·zal jsi jednomu z naöich bratr˘ velkou sluûbu - a to je od tebe spr·vnÈ.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_01"); //Proto jsem si tÏ vybral pro zvl·ötnÌ ˙kol.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_02"); //Col Kalom nalÈhavÏ pot¯ebuje novou drogu z baûin pro svÈ experimenty.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_03"); //Naöi sbÏraËi pracujÌ ve dne v noci. Jdi za nimi a celou jejich sklizeÚ p¯edej do Kalomovy alchymistickÈ dÌlny.
	
	B_GiveXP			(XP_BaalOrunTalks);
	B_LogEntry			(CH1_GhorimsRelief,"Harlok pr·vÏ nahradil Ghorima. Z·zraky se dÏjÌ.");
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_SUCCESS);

	Log_CreateTopic		(CH1_DeliverWeed,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_RUNNING);
	B_LogEntry			(CH1_DeliverWeed,"Dovednost p¯emlouv·nÌ v tÈ vÏci s Harlokem udÏlala dojem na guru Baala Oruna. NynÌ m·m tu Ëest p¯ebÌrat vöechnu drogu od novic˘ v baûin·ch pro Cora Kaloma.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Nic ne¯Ìkej",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Kde p¯esnÏ najdu ty sbÏraËe?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output (other, self,"DIA_BaalOrun_FirstTalk_Where_15_00"); //Kde p¯esnÏ najdu ty sbÏraËe?
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_01"); //Nedal jsem ti povolenÌ mÏ oslovovat!
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_02"); //Modli se ke Sp·Ëovi, aby ti odpustil tv˘j h¯Ìch! A teÔ odejdi. TvÈ posl·nÌ je nesmÌrnÏ d˘leûitÈ.
	
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos	(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos	(self);
	BaalOrun_Ansprechbar = FALSE;
};

// **************************************************
//					Kraut geholt
// **************************************************

instance  DIA_BaalOrun_GotWeed (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_GotWeed_Condition;
	information	= DIA_BaalOrun_GotWeed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalOrun_GotWeed_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS) //automatisch auch Kraut geholt
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_GotWeed_Info()
{
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_00"); //Ochr·nil jsi naöe sbÏraËe...
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_01"); //Nejen ûe jsi prok·zal, ûe jsi na naöÌ stranÏ - dok·zal jsi takÈ, ûe jsi vÏrn˝ sluûebnÌk Sp·Ëe.
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_02"); //VÏ¯Ìm, ûe uû brzy oblÈkneö roucho novice.
	BaalOrun_Ansprechbar = TRUE;

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_JoinPsi,"Baal Orun mÏ nazval vÏrn˝m sluûebnÌkem Sp·Ëe, protoûe jsem kv˘li novic˘m z baûin vym˝til krvavÈ mouchy.");
	B_GiveXP			(XP_ImpressedBaalOrun);
};

// **************************************************
//					Kraut abgeliefert!
// **************************************************

instance  DIA_BaalOrun_WeedAtKaloms (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_WeedAtKaloms_Condition;
	information	= DIA_BaalOrun_WeedAtKaloms_Info;
	permanent	= 0;
	description = "P¯edal jsem drogu z baûin Corovi Kalomovi.";
};                       

FUNC int  DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_WeedAtKaloms_Info()
{
	AI_Output		(other, self,"DIA_BaalOrun_WeedAtKaloms_15_00"); //P¯edal jsem drogu z baûin Corovi Kalomovi.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_01"); //Dob¯e jsi to provedl. Za tvÈ ˙silÌ ti d·m malou odmÏnu. Tady je, vem si ji.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_02"); //To je magickÈ za¯Ìk·v·nÌ ke sp·nku. M˘ûeö je pouûÌt jen jedenkr·t, ale vÏ¯Ìm, ûe ti prok·ûe dobrou sluûbu.
	
	BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
	B_GiveXP		(XP_ReportToBaalOrun);
	
	CreateInvItem	(self,ItArScrollSleep);
	B_GiveInvItems  (self,other,ItArScrollSleep, 1);
};

// **************************************************
//					Permanent
// **************************************************

instance  DIA_BaalOrun_Perm (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 2;
	condition	= DIA_BaalOrun_Perm_Condition;
	information	= DIA_BaalOrun_Perm_Info;
	permanent	= 1;
	description = "Jak jde produkce drogy z baûin?";
};                       

FUNC int  DIA_BaalOrun_Perm_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_Perm_Info()
{
	AI_Output (other, self,"DIA_BaalOrun_Perm_15_00"); //Jak jde produkce drogy z baûin?
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_01"); //NalÈh·me, jak nejvÌce dok·ûeme, na kaûdÈho muûe, aby vyprodukoval dostatek pro n·s samotnÈ a obchodov·nÌ s ostatnÌmi t·bory.
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_02"); //To je ale obÏù pro Sp·Ëe, kterou naöi novicovÈ ochotnÏ p¯in·öejÌ.
};



