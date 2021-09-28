// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Ci si vede.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Abbi cura di te, ragazzo.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Non preoccuparti di nulla, qui nel campo. Ci penseremo noi a te.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Ehi, tu!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //Parli con me?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Ti avverto! Da queste parti, la gente come te si ritrova spesso in grossi guai!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //E quasi tutti quelli che incontri sono veri e propri bastardi!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Pensano di poterti fare ciò che vogliono, ma non lo permetteremo.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomez vuole la pace nel campo e noi guardie ci occupiamo di mantenerla. Ma è un lavoro che costa parecchio.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Ecco perché ti chiedo del metallo. Prendilo come un segno d'amicizia. Tu aiuti noi e noi aiutiamo te. Se ti ritroverai nei guai, correremo a darti una mano.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Perché no? Quanto metallo vuoi?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Stai dicendo che dovrei pagare la protezione? Posso cavarmela da solo.",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Mi stai minacciando?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //Stai dicendo che dovrei pagare per la vostra protezione? No, grazie! Posso cavarmela da solo.
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Fai come vuoi, ragazzo. Ti pentirai di aver rifiutato un'offerta amichevole!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Mi stai minacciando?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Al contrario! Ti offro la mia amicizia!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Perché no? Quanto metallo vuoi?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Non molto. 10 pezzi. Tutto qui.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Non ho 10 pezzi di metallo.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Ecco a te. Avrò bisogno di un paio d'amici.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Ecco a te. Avrò bisogno di un paio d'amici.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Sembri un tipo in gamba. D'ora in poi, ti sorveglieremo.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Ma questo non significa che puoi fare ciò che vuoi, capito?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Non ho 10 pezzi di metallo.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Allora prenderò tutto ciò che possiedi. Potrai darmi il resto la prossima volta che c'incontreremo.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Vediamo...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Guarda un po'! Qualcuno non sa contare fino a 10!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Prenderò tutto ciò che hai, per dimenticare che mi hai mentito.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Ah! Accetto anche piccole donazioni. È il pensiero che conta! Grazie per il metallo, ragazzo!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //D'ora in poi, ti sorveglierò per tutto il tempo che sarai nel campo.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Uhm... Sei davvero al verde. Beh! C'è sempre una prossima volta...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Ah! Che piacere vederti, amico mio!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //È il momento del contributo giornaliero! Altri 10 pezzi di metallo, grazie!
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Ecco, prendili. 10 pezzi non sono molti, per un amico.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Non pagherò. Mi hai spillato abbastanza metallo.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Ehi, tu!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Cosa vuoi, adesso?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //È il momento di dimostrare la tua sincera amicizia.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Dammi 10 pezzi di metallo e siamo a posto. Che ne dici?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Ecco, prendili. 10 pezzi non sono molti per un amico.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //La penso esattamente allo stesso modo!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Non pagherò. Mi hai spillato abbastanza metallo.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Mi deludi! Non siamo più amici? Allora stai attento a non farti picchiare o derubare, d'ora in poi!
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Non ti preoccupare... Sono in grado di badare a me stesso.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Vedremo...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "Ho cambiato idea. Dopo tutto, penso che pagherò i tuoi 10 pezzi di metallo.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Ho cambiato idea. Dopo tutto, penso che pagherò i tuoi 10 pezzi di metallo.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Ottimo! Lo vedi che sai prendere le decisioni giuste?
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //E d'ora in poi pagherai il contributo giornaliero, vero?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Allora torna quando ne avrai abbastanza.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse mi ha inviato a pagare questi 10 pezzi di metallo al posto suo.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse mi ha inviato a pagare questi 10 pezzi di metallo al posto suo.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Quello che dovresti fare è pagare il TUO contributo.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Non preoccuparti di Jesse. È solo un perdente, non andrà lontano.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //No. Pagherò per lui. Prendi questo metallo e lascialo in pace!
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //D'accordo, amico. Se è questo che vuoi...
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Oh! Sembra che io non abbia abbastanza metallo.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //Questo è un segno, amico! Pensaci bene. Pagare per quel vagabondo è uno spreco di metallo!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Ora sei uno di noi. Ben fatto! Le guardie hanno bisogno di tipi come te!
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //Il traditore è fra noi! PUAH! E ti facevi chiamare guardia!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Abbiamo lasciato scappare uno dei Maghi del Fuoco ribelli!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //Quell'Ombra ci ha traditi!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Aspetta un momento! Di che stai parlando, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Così sei in combutta con Campo Nuovo, eh?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //No, aspetta! Io...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Pensavi di poterci imbrogliare per sempre!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Tutto questo non ha senso...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //I traditori come te devono morire.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //MUORI, TRADITORE!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, il nuovo guardiano dell'entrata principale, ha reagito allo stesso modo di Bloodwyn. Non so come, ma tutto ciò deve essere in qualche modo collegato alla mia ricerca delle pietre focalizzatrici.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, il guardiano del cancello posteriore di Campo Vecchio, mi ha chiamato traditore e rinnegato. Non ha voluto ascoltarmi e mi si è scagliato contro!");
			B_LogEntry			(CH4_BannedFromOC,"Sembra che io sia stato bandito da Campo Vecchio!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Così hai osato avventurarti fuori da Campo Nuovo? Un'idea molto stupida!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //Così hai osato avventurarti fuori dal tuo Campo Palude? Un'idea molto stupida!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Cosa? Che vuoi dire?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Non hai sentito parlare dell'attacco alla tua miniera?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Ma cosa...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Non possiamo permetterti di andare in giro a rivelare qualcosa.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Ehi, io non voglio guai...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Dovevi pensarci prima!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Ascolta. Ne ho abbastanza di questa storia...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //Anch'io! UCCIDETELO!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Ora i cancelli di Campo Vecchio sono chiusi. Le guardie che li custodiscono attaccheranno chiunque tenti d'avvicinarsi.");
	};
	
	AI_StopProcessInfos	(self);
};

