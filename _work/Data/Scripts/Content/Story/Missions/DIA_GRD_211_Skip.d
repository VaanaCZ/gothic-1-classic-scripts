// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************
	var int Skip_TradeFree;
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "Co tady dÏl·ö?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	if ( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Co tady dÏl·ö?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Star·m se o zbranÏ str·ûÌ.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Prod·v·ö zbranÏ?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Jen Gomezovi a jeho muû˘m.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Str·ûce Skip prod·v· v zadnÌ Ë·sti n·dvo¯Ì ZBRANÃ. Avöak jen Gomezov˝m muû˘m.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"JistÏ si rozumÌme.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Poslal mÏ Thorus. ÿÌkal mi, abych si vzal zbraÚ.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Gomez mÏ poslal. M·ö mi d·t nÏjakou zbroj.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Gomez mÏ poslal. M·ö mi d·t nÏjakou zbroj.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //Jako obvykle, co? M·m na skladÏ novou zbroj a nejlepöÌ zbranÏ.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //TeÔ dÏlej, aù jsi pryË. Nebo ti napr·sk·m.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Poslal mÏ Thorus. ÿÌkal mi, abych si vzal zbraÚ.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //Och?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Tak proË nejdeö a nezept·ö se ho? ",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"ÿÌkal, ûe kdyû mi ned·ö zbraÚ, tak tÏ m·m po¯·dnÏ nakopat do zadku.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Chce po mnÏ, abych pro nÏj udÏlal nÏco, co nikdo z v·s udÏlat nem˘ûe, ch·peö?",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //JistÏ si rozumÌme.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Chce po mnÏ, abych pro nÏj udÏlal nÏco, co nikdo z v·s udÏlat nem˘ûe, ch·peö?
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Tak? A p¯edpokl·d·m, ûe ho nenapadlo nic lepöÌho, neû tÏ za mnou poslat, ûe jo?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Tak proË nejdeö a nezept·ö se ho? ",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"ÿÌkal, ûe kdyû mi ned·ö zbraÚ, tak tÏ m·m po¯·dnÏ nakopat do zadku.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //ÿÌkal, ûe kdyû mi ned·ö zbraÚ, tak tÏ m·m po¯·dnÏ nakopat do zadku.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Tak? No a j· to vidÌm tak, ûe pokud se odtud okamûitÏ neztratÌö, tak nakopu zadek j· TOBÃ!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Tak proË nejdeö a nezept·ö se ho?
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //To si piö, ûe to udÏl·m. Ale ne teÔ. VsadÌm se, ûe ho pobavÌ, aû uslyöÌ ty poh·dky, cos o nÏm vypr·vÏl.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //NevÌm sice, kdo tÏ sem vpustil, ale udÏl·ö nejlÌp, kdyû se odtud co nejrychleji ztratÌö!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //ÿÌkal, ûe kdyû mi ned·ö zbraÚ, tak tÏ m·m po¯·dnÏ nakopat do zadku.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //No, dob¯e. A co bys pot¯eboval?
	Info_ClearChoices 	(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};

// **************************************
//			VERPATZT
// **************************************

instance  DIA_Skip_VERPATZT (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_VERPATZT_Condition;
	information	=  DIA_Skip_VERPATZT_Info;
	permanent	=  1;
	description = "ÿÌkal jsem si, ûe bych se jeötÏ jednou zeptal na tu zbroj...";
};                       

FUNC int  DIA_Skip_VERPATZT_Condition()
{
	if 	( 
		( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
		&& ( (Npc_KnowsInfo(hero,DIA_Skip_First)) && (Skip_TradeFree == FALSE) ) 
		)
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_VERPATZT_Info()
{
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //ÿÌkal jsem si, ûe bych se jeötÏ jednou zeptal na tu zbroj...
	AI_Output (self, other,"DIA_Skip_VERPATZT_12_01"); //Vypadni!
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance  GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Pot¯eboval bych p·r vÏcÌ."; 
	trade 			= 1;
};

FUNC int  GRD_211_Skip_TRADE_Condition()
{
	if ( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) 
			||	(Skip_TradeFree == TRUE) )
	{
		return TRUE;
	};
};


FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Pot¯eboval bych p·r vÏcÌ.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Mohl bych ti prodat p·r vÏcÌ.
};  

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_211_Skip_WELCOME (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_WELCOME_Condition;
	information		= GRD_211_Skip_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_211_Skip_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_211_Skip_WELCOME_Info()
{
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Poslyö, musel jsi b˝t pÏknÏ daleko, kdyû ses tu tak dlouho neuk·zal!
};
