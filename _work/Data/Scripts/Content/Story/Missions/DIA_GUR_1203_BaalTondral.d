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
	description = "Nic nie mów.";
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
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nie wyglądasz mi na kogoś, kto chciałby nosić niewolnicze jarzmo nakładane ludziom przez Magnatów.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Myślę, że jesteś raczej poszukiwaczem - kimś, kto szuka prawdziwej wiary. Czy czujesz, jak ogień trawi twoje ciało podczas snu?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Widzę, że powątpiewasz w rzeczy opowiadane ci przez sługusów Magnatów. Przecież wiesz, dlaczego nie można im ufać, prawda? To kłamcy!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Ich łgarstwa czynią słabych ludzi ślepcami. Ale twój duch jest silniejszy niż ich kłamstwa!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Czy nie odczuwasz pragnienia wolności każdego dnia? Nie czujesz, jak z każdą godziną pragnienie to staje się silniejsze? Pozwól mu pokierować twoim duchem!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Czy wiesz, co robisz, próbując zagłuszyć w sobie ten głos? Wyrzekasz się swojej duszy, wyrzekasz się samego siebie! Nie pozwól, by strach tobą kierował.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Uwolnij się. Przejrzyj na oczy! Śniący zbudzi się pewnego dnia, wyzwoli swoich poddanych i strąci niewiernych w najczarniejsze czeluści piekieł.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Znikną z tego świata jak nieczystości spłukane przez deszcz. Będą błagać o litość, ale wtedy będzie już dla nich za późno.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Wtedy zapłacą cenę. Zapłacą ją własną krwią... I własnym życiem.
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
	description = "Hej! Odezwałeś się do mnie. Czy to znaczy, że mogę już z tobą rozmawiać?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Odezwałeś się do mnie. Czy to znaczy, że mogę już z tobą rozmawiać?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Widzę, że zaznajomiłeś się już z naszymi zasadami. To dobrze.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Wyczuwam w tobie wielką siłę ducha. Wkrótce będziesz gotów, by do nas dołączyć.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Przemówiłem do ciebie, bo chcę dać ci szansę udowodnienia swojej lojalności.
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
	description = "W jaki sposób mogę udowodnić swoją lojalność?";
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
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //W jaki sposób mogę udowodnić swoją lojalność?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Przede wszystkim, potrzebujemy nowych dusz, które zechcą przyłączyć się do naszej społeczności.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Jeśli chcesz mnie przekonać o swojej przydatności dla naszego obozu, przyprowadź mi jeszcze jednego człowieka, który zechce zostać członkiem Bractwa.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral wysłał mnie do Starego Obozu, gdzie mam zwerbować nowego członka dla Bractwa. To chyba niezła okazja, żeby zjednać sobie jego sympatię!");

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
	description = "Gdzie mam szukać nowych członków Bractwa?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Gdzie mam szukać nowych członków Bractwa?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Na początek rozejrzyj się w Starym Obozie. Wielu z tamtejszych ludzi ma już dość terroru i kłamstw. Potrzebują tylko odrobiny wsparcia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //W Nowym Obozie raczej wiele nie zwojujesz. Mieszkają tam sami barbarzyńcy.
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
	description = "Dlaczego tak desperacko szukacie nowych członków?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Dlaczego tak desperacko szukacie nowych członków?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Śniący przemówił do naszego mistrza, oznajmiając, że ma dla nas niezwykle ważną wiadomość.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Ale nie zebrał jeszcze wszystkich sił. Dlatego potrzebuje NASZEJ siły, by nawiązać ostateczny kontakt.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Dlatego przygotowujemy się do wielkiego przyzwania. Im więcej ludzi weźmie w nim udział, tym większe będą szanse powodzenia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Jeśli chcesz dowiedzieć się więcej na ten temat, idź na świątynny dziedziniec. Tylko nie przeszkadzaj naszemu mistrzowi w medytacji!
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
	description = "Mistrzu, oto ktoś, kto chciałby cię poznać!";
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
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Mistrzu, oto ktoś, kto chciałby cię poznać!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Kogóż mi tu przyprowadziłeś? Czy jest godzien?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Cóż, bez twojego duchowego wsparcia zapewne się nie obędzie, Mistrzu.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Dobrze. Od dzisiaj ten człowiek będzie moim uczniem.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Każdego dnia będziesz przychodził do mojej chaty po nauki. Dla twojej duszy jeszcze nie jest zbyt późno.

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
	B_LogEntry			(CH1_RecruitDusty,"Dusty został uczniem Baal Tondrala. Moje zadanie skończone.");
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
	description = "Mistrzu! Chciałbym dołączyć do Bractwa.";
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
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistrzu! Chciałbym dołączyć do Bractwa. Czy mogę liczyć na twoją przychylność?
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Udowodniłeś, że jesteś człowiekiem prawym. Cor Kalom powinien cię przyjąć.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral uważa, że jestem godzien założyć szatę Nowicjusza!");
};








