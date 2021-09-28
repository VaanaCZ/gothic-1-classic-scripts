// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //Ah! Un volto nuovo.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Cosa vuoi?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //TI offro il mio aiuto. Tu sei nuovo di qui e quelli come te si cacciano sempre nei guai... Potrai risparmiartene molti, facendo una piccola donazione.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Solo 10 pezzi di metallo! Non è molto.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"E se non pago?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"E cosa ci guadagno?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Eccoti 10 pezzi di metallo. Se mi ritroverò nei guai, dovrai aiutarmi.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Eccoti 10 pezzi di metallo. Se mi ritroverò nei guai, dovrai aiutarmi.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Se mi troverò nelle vicinanze, potrai contare su di me. Mi troverai fra la piazza del mercato e il cancello sud.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Le altre zone sono di competenza di Fletcher e Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Ehi, vuoi imbrogliare la persona sbagliata! Torna quando avrai il metallo.
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //E cosa ci guadagno?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Mentre sarai nel mio distretto, ti proteggerò.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Se ti metti nei guai con la gente di Campo Nuovo, o se uno di quei pazzi della Setta ti fa innervosire, puoi contare su di me.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Se qualcosa non va con uno dei minatori, aiutiamo chiunque abbia pagato. Tutto qui.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //E se ti abbiamo pagato entrambi?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Allora ci mettiamo seduti e guardiamo lo spettacolo. Ma non succede molto spesso.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //E se non pago?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Ehi, amico, non avere fretta! Sei un novellino: dà un'occhiata in giro, raccogli un po' di metallo e, quando sei pronto per pagare, fallo.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Puoi pagare in qualsiasi momento, ma non contare su di me finché non avrai contribuito alle mie spese. Sono certo che hai capito.
	Info_AddChoice		(Info_Jackal_Hello,"CI vediamo più tardi.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //CI vediamo più tardi.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Abbi cura di te.
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "Ho ripensato a quell'offerta di protezione: eccoti 10 pezzi di metallo.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Ho ripensato a quell'offerta di protezione: eccoti 10 pezzi di metallo.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Hai fatto la scelta giusta, amico. D'ora in poi ti proteggerò.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Non vedo i 10 pezzi di metallo, amico. Torna quando li avrai.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "Come vanno le cose?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //Allora, come va?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Puoi sempre contare su di me, amico!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Hai fatto carriera in fretta! Bravo, amico!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Ehi, guardate! È il traditore che ha cambiato campo!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Non avresti dovuto farti coinvolgere da quei perdenti, così saresti ancora uno di noi!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Ehi, guardate! È quel tizio di Campo Nuovo che ci ha causato tutti quei problemi!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Se avessi dimostrato un po' più di coscienza allora, ora saresti dalla nostra parte: quella dei vincenti!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Guardate! Il tizio di Campo Palude.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Sei stato con quei pazzi per troppo tempo: ti hanno rammollito!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Neanche i soldi che mi hai dato per proteggerti ti aiuteranno, ora.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Avresti dovuto pagarmi quando ne hai avuta la possibilità.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Hai esagerato! Attaccare la miniera è stata un'idea molto stupida!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Sembra che abbia funzionato, e credimi, non puoi cambiare le cose!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //EHI, GENTE! TIRIAMOLO FUORI!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

