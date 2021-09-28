// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "Salve! Sono nuovo di qui.";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Salve! Sono nuovo di qui!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Cosa vuoi da me?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Voglio diventare uno di voi e far parte del campo.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Cerchi qualcuno che metta una buona parola per te, vero?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Se vuoi che parli di te con Diego, devi farmi un favore.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "Che tipo di favore?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Che tipo di favore?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Mi serve una delle armi di Fisk, un commerciante della piazza del mercato.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Non vuole vendermela. Si tratta di uno spadone decorato.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Ti darò 100 pezzi di metallo per comprare l'arma al mio posto. Ma non parlargli di me.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"D'accordo. Dammi i 100 pezzi e te la porto.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"Non hai pensato che potrei semplicemente scappare col metallo?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"Perché non vuole venderti lo spadone?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //D'accordo. Dammi i 100 pezzi e te la porto.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Eccoli. Torna subito da me!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Whistler mi aiuterà, se gli farò un favore: devo andare al mercato e comprare una spada da Fisk.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Non hai pensato che potrei semplicemente scappare col metallo?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Non dimenticare: la colonia è piccola! Ti troverei ovunque andassi!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Perché non vuole venderti lo spadone?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Abbiamo avuto una piccola discussione.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //E allora?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //E allora non ti serve di sapere altro!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Fisk vuole 110 pezzi di metallo per lo spadone, ora.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk vuole 110 pezzi di metallo per lo spadone, ora.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //E tu vuoi che ti dia altri 10 pezzi...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Pensavo desiderassi avere quell'arma.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Ecco! Prendi e fai in fretta!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "Non posso prendere lo spadone. Ecco i tuoi 100 pezzi di metallo.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Non posso prendere lo spadone. Ecco i tuoi 100 pezzi di metallo.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Idiota! Non abbiamo bisogno di cretini come te, qui! Sparisci!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Dove sono i 100 pezzi di metallo? Farai meglio a ridarmeli subito, o ti ritroverai in guai grossi!
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Eccoti! Volevi scappare col mio metallo, vero? Vieni qui, figliolo!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Ho incasinato tutto. Whistler è veramente in collera con me.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "Ho il tuo spadone...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Ho il tuo spadone...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //Non è stato troppo difficile, vero? Comunque... Tu fai un favore a me, io faccio un favore a te.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Se Diego dovesse chiedermi qualcosa, parlerò bene di te. Fino ad allora... Auguri!
	
	B_LogEntry (CH1_JoinOC,"Whistler era contento, quando gli ho consegnato la spada che mi aveva chiesto. Mi raccomanderà a Diego.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Whistler era contento, quando gli ho consegnato la spada che mi aveva chiesto. Sfortunatamente, non ne ricaverò nulla: non posso più diventare un'Ombra.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Come va?
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Bene! Tu fai un favore a me, io faccio un favore a te. Dirò a Diego che sei un uomo affidabile.
};





	
	





















