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
	description = "Nic neříkej";
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
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nevypadáš na někoho, kdo se podrobil otroctví Rudobaronů.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Vypadáš spíše jako hledač - někdo, kdo hledá pravou víru. Necítíš ve svém těle oheň, který tě v noci udržuje v bdělosti?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Aha, pochybuješ o tom, že to, co se ti Rudobaronovi otroci pokoušejí říci, je pravdivé a odůvodněné. Ty také víš, proč o tom pochybuješ. Protože lžou!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //S takovými lžemi se pokoušejí ovládat slabé duše. Tvoje duše je ale silnější než jejich lži!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Nepociťuješ každodenně touhu po svobodě? Necítíš ji stále silněji? Provází tvou duši. Nech ji působit!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Víš, co se děje, když se to snažíš zapudit? Popíráš svojí duši, popíráš sebe sama! Nenech strach, aby panoval tvému životu!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Osvoboď se. Pochop! Spáč PROCITNE. Osvobodí tě a všechny ty pochybovačné nevěrce zatratí.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Jako smetí, které spláchne déšť, zmizí z tohoto světa. Budou bědovat, naříkat a kát se, ale bude už příliš pozdě.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Pak zaplatí svůj dluh. Zaplatí vlastní krví. A svými životy.
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
	description = "Hej! Teď si mluvil ke mně. Znamená to, že já teď smím mluvit k tobě?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Teď si mluvil ke mně. Znamená to, že já teď mám mluvit k tobě?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Vidím, že ses již sžil s naším řádem. To je dobře.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Cítím tvou velkou duchovní sílu! Brzy se budeš moci připojit k naší komunitě.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Mluvil jsem k tobě, protože jsem ti chtěl dát příležitost, abys dokázal svou oddanost.
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
	description = "Jak můžu dokázat svou oddanost?";
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
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Jak můžu dokázat svou oddanost?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Především potřebujeme nové duše, které by se přidaly k naší komunitě.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Tím, že do našeho tábora přivedeš jednoho nebo více mužů, dokážeš, že jsi ochoten naší komunitě prokazovat dobré služby.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral mě vyslal do Starého tábora, abych naverboval pro Bratrstvo nové lidi. Doufám, že to bude dobrá příležitost, jak se mu dostat do přízně!");

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
	description = "Kde mám hledat nové členy do Bratrstva?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Kde mám hledat nové členy do Bratrstva?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Takovým dobrým místem je Starý tábor, protože lidé tam jsou již přesyceni strachem a lžemi. Potřebují nějakým způsobem pomoci.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //V Novém táboře bys nejspíš úspěšný nebyl. Muži, kteří tam žijí, jsou barbaři.
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
	description = "Proč tak moc potřebujete nové členy?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Proč tak moc potřebuješ nové členy?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Spáč promluvil k našemu mistrovi a sdělil mu, že má pro nás důležitou zprávu.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Nepodařilo se mu však nashromáždit dostatečnou sílu. Proto potřebujeme VLASTNÍ sílu, abysme se s ním dokázali spojit.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Protože připravujeme velké vzývání, pravděpodobnost úspěchu se zvýší s počtem zúčastněných mužů.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Jestli se chceš o tom dozvědět víc, jdi do velkého dvora naproti chrámovému vrchu. Neruš ale našeho mistra při meditacích!
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
	description = "Je tady někdo, mistře, kdo by se chtěl s vámi seznámit.";
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
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Je tady někdo, mistře, kdo by se chtěl s vámi seznámit.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Koho jsi přivedl? Je toho hoden?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Určitě bude potřebovat vaše duchovní vedení, mistře.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Velmi dobře. Ode dneška bude jedním z mých žáků.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Budeš za mnou chodit každý den do mé chýše a naslouchat mým slovům. Tvá duše pak bude zachráněna.

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
	B_LogEntry			(CH1_RecruitDusty,"Dusty je teď učněm Baala Tondrala. Splnil jsem svůj úkol.");
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
	description = "Mistře! Chtěl bych se přidat k Bratrstvu! Potřebuji tvou přímluvu.";
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
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mistře! Chtěl bych se přidat k Bratrstvu! Potřebuji tvou přímluvu.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Prokázal jsi svou způsobilost. Jdi za Corem Kalomem a oblékni roucho.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral rozhodl, že jsem hoden nosit roucho novice!");
};








