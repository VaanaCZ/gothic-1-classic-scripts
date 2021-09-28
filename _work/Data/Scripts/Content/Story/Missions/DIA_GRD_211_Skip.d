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
	description = "Co tady d�l�?";
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
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Co tady d�l�?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Star�m se o zbran� str��.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Prod�v� zbran�?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Jen Gomezovi a jeho mu��m.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Str�ce Skip prod�v� v zadn� ��sti n�dvo�� ZBRAN�. Av�ak jen Gomezov�m mu��m.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Jist� si rozum�me.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Poslal m� Thorus. ��kal mi, abych si vzal zbra�.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Gomez m� poslal. M� mi d�t n�jakou zbroj.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Gomez m� poslal. M� mi d�t n�jakou zbroj.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //Jako obvykle, co? M�m na sklad� novou zbroj a nejlep�� zbran�.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //Te� d�lej, a� jsi pry�. Nebo ti napr�sk�m.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Poslal m� Thorus. ��kal mi, abych si vzal zbra�.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //Och?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Tak pro� nejde� a nezept� se ho? ",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"��kal, �e kdy� mi ned� zbra�, tak t� m�m po��dn� nakopat do zadku.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Chce po mn�, abych pro n�j ud�lal n�co, co nikdo z v�s ud�lat nem��e, ch�pe�?",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //Jist� si rozum�me.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Chce po mn�, abych pro n�j ud�lal n�co, co nikdo z v�s ud�lat nem��e, ch�pe�?
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Tak? A p�edpokl�d�m, �e ho nenapadlo nic lep��ho, ne� t� za mnou poslat, �e jo?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Tak pro� nejde� a nezept� se ho? ",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"��kal, �e kdy� mi ned� zbra�, tak t� m�m po��dn� nakopat do zadku.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //��kal, �e kdy� mi ned� zbra�, tak t� m�m po��dn� nakopat do zadku.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Tak? No a j� to vid�m tak, �e pokud se odtud okam�it� neztrat�, tak nakopu zadek j� TOB�!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Tak pro� nejde� a nezept� se ho?
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //To si pi�, �e to ud�l�m. Ale ne te�. Vsad�m se, �e ho pobav�, a� usly�� ty poh�dky, cos o n�m vypr�v�l.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Nev�m sice, kdo t� sem vpustil, ale ud�l� nejl�p, kdy� se odtud co nejrychleji ztrat�!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //��kal, �e kdy� mi ned� zbra�, tak t� m�m po��dn� nakopat do zadku.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //No, dob�e. A co bys pot�eboval?
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
	description = "��kal jsem si, �e bych se je�t� jednou zeptal na tu zbroj...";
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
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //��kal jsem si, �e bych se je�t� jednou zeptal na tu zbroj...
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
	description		= "Pot�eboval bych p�r v�c�."; 
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
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Pot�eboval bych p�r v�c�.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Mohl bych ti prodat p�r v�c�.
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
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Posly�, musel jsi b�t p�kn� daleko, kdy� ses tu tak dlouho neuk�zal!
};
