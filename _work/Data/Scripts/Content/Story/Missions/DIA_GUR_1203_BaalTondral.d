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
	description = "Nic nie m�w.";
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
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nie wygl�dasz mi na kogo�, kto chcia�by nosi� niewolnicze jarzmo nak�adane ludziom przez Magnat�w.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //My�l�, �e jeste� raczej poszukiwaczem - kim�, kto szuka prawdziwej wiary. Czy czujesz, jak ogie� trawi twoje cia�o podczas snu?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Widz�, �e pow�tpiewasz w rzeczy opowiadane ci przez s�ugus�w Magnat�w. Przecie� wiesz, dlaczego nie mo�na im ufa�, prawda? To k�amcy!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Ich �garstwa czyni� s�abych ludzi �lepcami. Ale tw�j duch jest silniejszy ni� ich k�amstwa!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Czy nie odczuwasz pragnienia wolno�ci ka�dego dnia? Nie czujesz, jak z ka�d� godzin� pragnienie to staje si� silniejsze? Pozw�l mu pokierowa� twoim duchem!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Czy wiesz, co robisz, pr�buj�c zag�uszy� w sobie ten g�os? Wyrzekasz si� swojej duszy, wyrzekasz si� samego siebie! Nie pozw�l, by strach tob� kierowa�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Uwolnij si�. Przejrzyj na oczy! �ni�cy zbudzi si� pewnego dnia, wyzwoli swoich poddanych i str�ci niewiernych w najczarniejsze czelu�ci piekie�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Znikn� z tego �wiata jak nieczysto�ci sp�ukane przez deszcz. B�d� b�aga� o lito��, ale wtedy b�dzie ju� dla nich za p�no.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Wtedy zap�ac� cen�. Zap�ac� j� w�asn� krwi�... I w�asnym �yciem.
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
	description = "Hej! Odezwa�e� si� do mnie. Czy to znaczy, �e mog� ju� z tob� rozmawia�?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Odezwa�e� si� do mnie. Czy to znaczy, �e mog� ju� z tob� rozmawia�?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Widz�, �e zaznajomi�e� si� ju� z naszymi zasadami. To dobrze.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Wyczuwam w tobie wielk� si�� ducha. Wkr�tce b�dziesz got�w, by do nas do��czy�.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Przem�wi�em do ciebie, bo chc� da� ci szans� udowodnienia swojej lojalno�ci.
};

// **************************************************
// 				Loyalit�t beweisen
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
	description = "W jaki spos�b mog� udowodni� swoj� lojalno��?";
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
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //W jaki spos�b mog� udowodni� swoj� lojalno��?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Przede wszystkim, potrzebujemy nowych dusz, kt�re zechc� przy��czy� si� do naszej spo�eczno�ci.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Je�li chcesz mnie przekona� o swojej przydatno�ci dla naszego obozu, przyprowad� mi jeszcze jednego cz�owieka, kt�ry zechce zosta� cz�onkiem Bractwa.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral wys�a� mnie do Starego Obozu, gdzie mam zwerbowa� nowego cz�onka dla Bractwa. To chyba niez�a okazja, �eby zjedna� sobie jego sympati�!");

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
	description = "Gdzie mam szuka� nowych cz�onk�w Bractwa?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Gdzie mam szuka� nowych cz�onk�w Bractwa?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Na pocz�tek rozejrzyj si� w Starym Obozie. Wielu z tamtejszych ludzi ma ju� do�� terroru i k�amstw. Potrzebuj� tylko odrobiny wsparcia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //W Nowym Obozie raczej wiele nie zwojujesz. Mieszkaj� tam sami barbarzy�cy.
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
	description = "Dlaczego tak desperacko szukacie nowych cz�onk�w?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Dlaczego tak desperacko szukacie nowych cz�onk�w?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //�ni�cy przem�wi� do naszego mistrza, oznajmiaj�c, �e ma dla nas niezwykle wa�n� wiadomo��.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Ale nie zebra� jeszcze wszystkich si�. Dlatego potrzebuje NASZEJ si�y, by nawi�za� ostateczny kontakt.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Dlatego przygotowujemy si� do wielkiego przyzwania. Im wi�cej ludzi we�mie w nim udzia�, tym wi�ksze b�d� szanse powodzenia.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Je�li chcesz dowiedzie� si� wi�cej na ten temat, id� na �wi�tynny dziedziniec. Tylko nie przeszkadzaj naszemu mistrzowi w medytacji!
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
	description = "Mistrzu, oto kto�, kto chcia�by ci� pozna�!";
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
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Mistrzu, oto kto�, kto chcia�by ci� pozna�!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Kog� mi tu przyprowadzi�e�? Czy jest godzien?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //C�, bez twojego duchowego wsparcia zapewne si� nie ob�dzie, Mistrzu.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Dobrze. Od dzisiaj ten cz�owiek b�dzie moim uczniem.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Ka�dego dnia b�dziesz przychodzi� do mojej chaty po nauki. Dla twojej duszy jeszcze nie jest zbyt p�no.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Hei�t das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC l�sen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal l�schen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,"Dusty zosta� uczniem Baal Tondrala. Moje zadanie sko�czone.");
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
	description = "Mistrzu! Chcia�bym do��czy� do Bractwa.";
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
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistrzu! Chcia�bym do��czy� do Bractwa. Czy mog� liczy� na twoj� przychylno��?
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Udowodni�e�, �e jeste� cz�owiekiem prawym. Cor Kalom powinien ci� przyj��.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral uwa�a, �e jestem godzien za�o�y� szat� Nowicjusza!");
};








