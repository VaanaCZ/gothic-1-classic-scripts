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
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nie wygl¹dasz mi na kogoœ, kto chcia³by nosiæ niewolnicze jarzmo nak³adane ludziom przez Magnatów.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Myœlê, ¿e jesteœ raczej poszukiwaczem - kimœ, kto szuka prawdziwej wiary. Czy czujesz, jak ogieñ trawi twoje cia³o podczas snu?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Widzê, ¿e pow¹tpiewasz w rzeczy opowiadane ci przez s³ugusów Magnatów. Przecie¿ wiesz, dlaczego nie mo¿na im ufaæ, prawda? To k³amcy!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Ich ³garstwa czyni¹ s³abych ludzi œlepcami. Ale twój duch jest silniejszy ni¿ ich k³amstwa!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Czy nie odczuwasz pragnienia wolnoœci ka¿dego dnia? Nie czujesz, jak z ka¿d¹ godzin¹ pragnienie to staje siê silniejsze? Pozwól mu pokierowaæ twoim duchem!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Czy wiesz, co robisz, próbuj¹c zag³uszyæ w sobie ten g³os? Wyrzekasz siê swojej duszy, wyrzekasz siê samego siebie! Nie pozwól, by strach tob¹ kierowa³.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Uwolnij siê. Przejrzyj na oczy! Œni¹cy zbudzi siê pewnego dnia, wyzwoli swoich poddanych i str¹ci niewiernych w najczarniejsze czeluœci piekie³.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Znikn¹ z tego œwiata jak nieczystoœci sp³ukane przez deszcz. Bêd¹ b³agaæ o litoœæ, ale wtedy bêdzie ju¿ dla nich za póŸno.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Wtedy zap³ac¹ cenê. Zap³ac¹ j¹ w³asn¹ krwi¹... I w³asnym ¿yciem.
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
	description = "Hej! Odezwa³eœ siê do mnie. Czy to znaczy, ¿e mogê ju¿ z tob¹ rozmawiaæ?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Odezwa³eœ siê do mnie. Czy to znaczy, ¿e mogê ju¿ z tob¹ rozmawiaæ?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Widzê, ¿e zaznajomi³eœ siê ju¿ z naszymi zasadami. To dobrze.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Wyczuwam w tobie wielk¹ si³ê ducha. Wkrótce bêdziesz gotów, by do nas do³¹czyæ.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Przemówi³em do ciebie, bo chcê daæ ci szansê udowodnienia swojej lojalnoœci.
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
	description = "W jaki sposób mogê udowodniæ swoj¹ lojalnoœæ?";
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
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //W jaki sposób mogê udowodniæ swoj¹ lojalnoœæ?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Przede wszystkim, potrzebujemy nowych dusz, które zechc¹ przy³¹czyæ siê do naszej spo³ecznoœci.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Jeœli chcesz mnie przekonaæ o swojej przydatnoœci dla naszego obozu, przyprowadŸ mi jeszcze jednego cz³owieka, który zechce zostaæ cz³onkiem Bractwa.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral wys³a³ mnie do Starego Obozu, gdzie mam zwerbowaæ nowego cz³onka dla Bractwa. To chyba niez³a okazja, ¿eby zjednaæ sobie jego sympatiê!");

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
	description = "Gdzie mam szukaæ nowych cz³onków Bractwa?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Gdzie mam szukaæ nowych cz³onków Bractwa?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Na pocz¹tek rozejrzyj siê w Starym Obozie. Wielu z tamtejszych ludzi ma ju¿ doœæ terroru i k³amstw. Potrzebuj¹ tylko odrobiny wsparcia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //W Nowym Obozie raczej wiele nie zwojujesz. Mieszkaj¹ tam sami barbarzyñcy.
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
	description = "Dlaczego tak desperacko szukacie nowych cz³onków?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Dlaczego tak desperacko szukacie nowych cz³onków?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Œni¹cy przemówi³ do naszego mistrza, oznajmiaj¹c, ¿e ma dla nas niezwykle wa¿n¹ wiadomoœæ.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Ale nie zebra³ jeszcze wszystkich si³. Dlatego potrzebuje NASZEJ si³y, by nawi¹zaæ ostateczny kontakt.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Dlatego przygotowujemy siê do wielkiego przyzwania. Im wiêcej ludzi weŸmie w nim udzia³, tym wiêksze bêd¹ szanse powodzenia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Jeœli chcesz dowiedzieæ siê wiêcej na ten temat, idŸ na œwi¹tynny dziedziniec. Tylko nie przeszkadzaj naszemu mistrzowi w medytacji!
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
	description = "Mistrzu, oto ktoœ, kto chcia³by ciê poznaæ!";
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
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Mistrzu, oto ktoœ, kto chcia³by ciê poznaæ!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Kogó¿ mi tu przyprowadzi³eœ? Czy jest godzien?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Có¿, bez twojego duchowego wsparcia zapewne siê nie obêdzie, Mistrzu.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Dobrze. Od dzisiaj ten cz³owiek bêdzie moim uczniem.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Ka¿dego dnia bêdziesz przychodzi³ do mojej chaty po nauki. Dla twojej duszy jeszcze nie jest zbyt póŸno.

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
	B_LogEntry			(CH1_RecruitDusty,"Dusty zosta³ uczniem Baal Tondrala. Moje zadanie skoñczone.");
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
	description = "Mistrzu! Chcia³bym do³¹czyæ do Bractwa.";
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
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistrzu! Chcia³bym do³¹czyæ do Bractwa. Czy mogê liczyæ na twoj¹ przychylnoœæ?
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Udowodni³eœ, ¿e jesteœ cz³owiekiem prawym. Cor Kalom powinien ciê przyj¹æ.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral uwa¿a, ¿e jestem godzien za³o¿yæ szatê Nowicjusza!");
};








