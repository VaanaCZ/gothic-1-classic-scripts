// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "Non dire nulla.";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Non sembri uno schiavo dei baroni delle miniere.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Sembri più un pellegrino, alla ricerca della vera fede. Non senti un fuoco ardere al tuo interno, che t'impedisce di dormire la notte?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Non credi agli schiavi dei baroni delle miniere. Fai bene: sono dei bugiardi.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Con le loro menzogne cercano di controllare gli spiriti deboli. Il tuo, però, è più forte delle loro bugie!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Non senti il desiderio di libertà crescere in te, giorno dopo giorno? Permettigli di guidare il tuo spirito!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Sai cosa succede, se tenti di soffocarlo? Rinneghi il tuo stesso essere! Non permettere alle paure di governare la tua vita!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Libera te stesso. Devi capire! Il Dormiente si risveglierà e ti libererà, spazzando via tutti questi dannati infedeli.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Come i rifiuti sono spazzati via dalla pioggia, anch'essi svaniranno da questo mondo. Si lamenteranno, pentendosi fra le lacrime, ma sarà troppo tardi.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Pagheranno col sangue e con la vita il prezzo delle loro azioni.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "Ehi! Mi hai parlato! Vuol dire che ora posso rivolgermi a te?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Ehi! Mi hai parlato! Vuol dire che ora posso rivolgermi a te?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Ti sei abituato alle nostre regole. Molto bene.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Percepisco la tua grande forza spirituale. Presto potrai entrare a far parte della nostra comunità.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Ti ho parlato perché voglio offrirti la possibilità di dimostrare la tua fedeltà.
};

// **************************************************
// 				Loyalität beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "Come posso dimostrare la mia lealtà?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Come posso dimostrare la mia lealtà?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Prima di tutto, abbiamo bisogno che nuove anime si uniscano alla nostra comunità.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Reclutando un altro uomo per noi, dimostrerai che sei intenzionato a servire la nostra comunità.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral mi ha inviato a Campo Vecchio, a trovare nuove reclute per la Fratellanza. Penso sia un'ottima occasione per fargli una buona impressione!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "Dove posso reclutare nuovi membri per la Fratellanza?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Dove posso reclutare nuovi membri per la Fratellanza?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Campo Vecchio è un buon posto: la gente viene nutrita con paure e bugie e ha bisogno di aiuto.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //Non credo che avresti molto successo a Campo Nuovo. Quel posto è abitato da barbari.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "Perché hai un bisogno così disperato di nuovi membri?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Perché hai un bisogno così disperato di nuovi membri?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Il Dormiente ha parlato al nostro maestro, rivelandogli che ha un importante messaggio per noi.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Però non è ancora abbastanza potente. Per questo motivo ha bisogno della NOSTRA forza per contattarci.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Per questo stiamo preparando una grande invocazione: più uomini parteciperanno, maggiori saranno le probabilità di successo.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Se vuoi saperne di più, vai nel grande spiazzo davanti alla collina del tempio. Ma non disturbare la meditazione del maestro!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "Qui c'è qualcuno che vorrebbe fare la tua conoscenza, maestro!";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Qui c'è qualcuno che vorrebbe fare la tua conoscenza, maestro!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Chi mi hai portato? È una persona valorosa?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Ha molto bisogno della tua guida spirituale, maestro.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Molto bene. D'ora in poi sarà uno dei miei discepoli.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Verrai nella mia capanna ogni giorno per ascoltare la mia parola. La tua anima può ancora salvarsi.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Heißt das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lösen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,"Ora Dusty è un discepolo di Baal Tondral. La missione è riuscita.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "Maestro! Voglio unirmi alla Fratellanza.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Maestro! Voglio unirmi alla Fratellanza e ho bisogno che ti pronunci in mio favore.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Hai dimostrato il tuo valore. Vai da Cor Kalom e indossa la veste.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral mi ritiene degno di indossare la veste da novizio!");
};








