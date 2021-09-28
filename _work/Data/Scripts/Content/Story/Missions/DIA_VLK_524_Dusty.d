// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "Sono nuovo di qui. Come vanno le cose?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Sono nuovo di qui. Come vanno le cose?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Sparisci! Mi sto facendo il culo in miniera da due settimane. E per cosa?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Tutto ciò che ottengo è qualche briciola di metallo, che se ne va quasi tutta per il cibo.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Ho parlato con Baal Parvez. Mi ha rivelato alcune cose interessanti sulla Setta.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Penso che farei meglio ad andare là invece di fare lo schiavo per Gomez.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "Non ti piace qui? Allora perché non te ne vai e basta?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Non ti piace qui? Allora perché non te ne vai e basta?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Perché non sono sicuro su ciò che troverò. Avevo un amico, Melvin, che è andato alla Setta una settimana fa.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Da allora non ho più avuto sue notizie. Finché non riceverò un suo messaggio, me ne resterò qui!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, un minatore di Campo Vecchio, non è contento di vivere qui. Sta pensando d'unirsi alla Fratellanza della palude.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "Io sono stato alla Setta e ho incontrato Melvin.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Io sono stato alla Setta e ho incontrato Melvin.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //Cosa ti ha detto?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Sembra gli piaccia di più stare lì che essere maltrattato dalle guardie.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //Ehi, amico! Si sta divertendo da solo? Devo raggiungerlo! Però non riuscirò mai a uscire da questo campo.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Davvero? Perché?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Le guardie hanno scoperto che voglio andarmene. Devo aver parlato troppo.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Ho bisogno di almeno 100 pezzi di metallo per corromperle.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "Se ti dessi i 100 pezzi di metallo per corrompere le guardie?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //Se ti dessi i 100 pezzi di metallo per corrompere le guardie?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //Lo faresti davvero? Perché?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Beh! Diciamo che non sei il solo a desiderare che tu arrivi alla Setta.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //Vuoi venire con me?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "Io verrò SICURAMENTE con te alla Setta.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //Io verrò SICURAMENTE con te alla Setta.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //Ottimo! Sono pronto. Possiamo partire quando vuoi.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Non dimenticare: abbiamo bisogno di 100 pezzi di metallo per le guardie.

	B_LogEntry	(CH1_RecruitDusty,"Ho convinto Dusty il minatore a unirsi alla Fratellanza di Campo Palude. Ora devo corrompere le guardie, dopodiché lo porterò direttamente da Baal Tondral.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "Sono pronto: andiamo!";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Sono pronto: andiamo!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Bene! Andiamo al cancello sud: le guardie di quello a nord non si lasciano corrompere.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Forse dovresti occuparti tu del metallo. Io non sono molto bravo in questo genere di cose.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Va bene: andiamo!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty mi ha sconsigliato di utilizzare l'ingresso principale a nord. Sembra che sia più facile corrompere le guardie di quello a sud.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

