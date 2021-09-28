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
	description = "Nic neøíkej";
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
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nevypadáš na nìkoho, kdo se podrobil otroctví Rudobaronù.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Vypadáš spíše jako hledaè - nìkdo, kdo hledá pravou víru. Necítíš ve svém tìle oheò, kterı tì v noci udruje v bdìlosti?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Aha, pochybuješ o tom, e to, co se ti Rudobaronovi otroci pokoušejí øíci, je pravdivé a odùvodnìné. Ty také víš, proè o tom pochybuješ. Protoe lou!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //S takovımi lemi se pokoušejí ovládat slabé duše. Tvoje duše je ale silnìjší ne jejich li!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Nepociuješ kadodennì touhu po svobodì? Necítíš ji stále silnìji? Provází tvou duši. Nech ji pùsobit!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Víš, co se dìje, kdy se to snaíš zapudit? Popíráš svojí duši, popíráš sebe sama! Nenech strach, aby panoval tvému ivotu!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Osvoboï se. Pochop! Spáè PROCITNE. Osvobodí tì a všechny ty pochybovaèné nevìrce zatratí.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Jako smetí, které spláchne déš, zmizí z tohoto svìta. Budou bìdovat, naøíkat a kát se, ale bude u pøíliš pozdì.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Pak zaplatí svùj dluh. Zaplatí vlastní krví. A svımi ivoty.
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
	description = "Hej! Teï si mluvil ke mnì. Znamená to, e já teï smím mluvit k tobì?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Teï si mluvil ke mnì. Znamená to, e já teï mám mluvit k tobì?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Vidím, e ses ji sil s naším øádem. To je dobøe.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Cítím tvou velkou duchovní sílu! Brzy se budeš moci pøipojit k naší komunitì.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Mluvil jsem k tobì, protoe jsem ti chtìl dát pøíleitost, abys dokázal svou oddanost.
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
	description = "Jak mùu dokázat svou oddanost?";
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
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Jak mùu dokázat svou oddanost?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Pøedevším potøebujeme nové duše, které by se pøidaly k naší komunitì.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Tím, e do našeho tábora pøivedeš jednoho nebo více muù, dokáeš, e jsi ochoten naší komunitì prokazovat dobré sluby.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral mì vyslal do Starého tábora, abych naverboval pro Bratrstvo nové lidi. Doufám, e to bude dobrá pøíleitost, jak se mu dostat do pøíznì!");

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
	description = "Kde mám hledat nové èleny do Bratrstva?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Kde mám hledat nové èleny do Bratrstva?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Takovım dobrım místem je Starı tábor, protoe lidé tam jsou ji pøesyceni strachem a lemi. Potøebují nìjakım zpùsobem pomoci.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //V Novém táboøe bys nejspíš úspìšnı nebyl. Mui, kteøí tam ijí, jsou barbaøi.
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
	description = "Proè tak moc potøebujete nové èleny?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Proè tak moc potøebuješ nové èleny?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Spáè promluvil k našemu mistrovi a sdìlil mu, e má pro nás dùleitou zprávu.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Nepodaøilo se mu však nashromádit dostateènou sílu. Proto potøebujeme VLASTNÍ sílu, abysme se s ním dokázali spojit.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Protoe pøipravujeme velké vzıvání, pravdìpodobnost úspìchu se zvıší s poètem zúèastnìnıch muù.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Jestli se chceš o tom dozvìdìt víc, jdi do velkého dvora naproti chrámovému vrchu. Neruš ale našeho mistra pøi meditacích!
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
	description = "Je tady nìkdo, mistøe, kdo by se chtìl s vámi seznámit.";
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
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Je tady nìkdo, mistøe, kdo by se chtìl s vámi seznámit.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Koho jsi pøivedl? Je toho hoden?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Urèitì bude potøebovat vaše duchovní vedení, mistøe.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Velmi dobøe. Ode dneška bude jedním z mıch ákù.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Budeš za mnou chodit kadı den do mé chıše a naslouchat mım slovùm. Tvá duše pak bude zachránìna.

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
	B_LogEntry			(CH1_RecruitDusty,"Dusty je teï uènìm Baala Tondrala. Splnil jsem svùj úkol.");
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
	description = "Mistøe! Chtìl bych se pøidat k Bratrstvu! Potøebuji tvou pøímluvu.";
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
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistøe! Chtìl bych se pøidat k Bratrstvu! Potøebuji tvou pøímluvu.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Prokázal jsi svou zpùsobilost. Jdi za Corem Kalomem a oblékni roucho.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral rozhodl, e jsem hoden nosit roucho novice!");
};








