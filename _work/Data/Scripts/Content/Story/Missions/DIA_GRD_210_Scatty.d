// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Co je tvá práce?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Co tady máš na práci?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Střežím arénu. Organizuju vsázení, najímám nové bojovníky... Však víš.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Chci se přidat k táboru. Pomůžeš mi?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chci se přidat k táboru. Pomůžeš mi?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Možná bych mohl, musel bys mě ale nějak přesvědčit.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Několik nejlepších bojovníků ze všech tří táborů sem chodí, aby si zde navzájem poměřilo síly.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Vyzvi někoho z nich na souboj. Budu tě sledovat a když budeš dobrý, zamyslím se nad tím.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, mistr arény, ocení, když vyzvu jednoho z bojovníků.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Bojoval jsem s Kirgem!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Bojoval jsem s Kirgem!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Jistě, a prohrál jsi.
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Určitě si nemyslíš, že mě tímhle přesvědčíš...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Skutečnost, že mě Kirgo porazil, už na Scattyho takový dojem neudělala.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //A porazil jsi ho! To není na začátečníka, jako jsi ty, špatné! Přesvědčil jsi mě!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty byl zaujat mým bojem proti Kirgovi.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Vyzval jsem  Kharima!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Vyzval jsem  Kharima!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //A ten tě zmlátil, hochu!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Vybral sis vhodného protivníka! Ty bastardy z Nového tábora nemůžu vystát.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Vypadá to, že to vidíš podobně - jsi přesně ten typ chlapa, jaký potřebujeme!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"Kharim mě zbil! Scattymu se líbila moje odvaha, ne však můj boj.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //A srazil jsi ho! Musím uznat, že to nebylo špatné. Vždycky byl jedním z nejpovažovanějších bojovníků.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Tohle na mě opravdu udělalo dojem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Nandal jsem to Kharimovi! Scatty byl dojatý.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kämpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Proč necháváš lidi z jiných táborů, aby se tady bili?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Myslel jsem, že Starý a Nový tábor spolu nevycházejí dobře - tak proč tady necháváš jejich lidi bojovat?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To je jednoduché - odehrávají se tady jednou týdně souboje a kopáči pokaždé rádi vidí, když je některý z hrdlořezů z Nového tábora rozdrcen.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Pokud bojuje jeden z nich, pak se uzavře více sázek - a to je skvělé pro obchod!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Mezi námi, já ty grázly z Nového tábora nemůžu vystát - ale obchod je obchod.
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Chci uzavřít sázku.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chci uzavřít sázku.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Teď ale není žádný souboj.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Příští boje budou za několik dní. Bude to vyhlášeno.
	
};

// **************************************************
// 					Will Kämpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Chci bojovat v aréně!";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Chci bojovat v aréně!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Nemůžu tě nechat bojovat, dokud se nepřipojíš k jednomu z táborů!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Nikoho nezajímají nezávislí bojovníci!
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "Cvičíš vůbec bojovníky?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC,"Scatty, mistr arény, mě může naučit bojovat s JEDNORUČNÍMI ZBRANĚMI.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Cvičíš vůbec bojovníky?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Jistě, ale ne pro zábavu. Jestli chceš, abych tě cvičil, musíš mi za to zaplatit.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chci se zlepšit v ovládání jednoručního meče.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //To je dobré rozhodnutí! Ještě než se začneš učit techniku, musíš se naučit správně držet zbraň.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Začátečníci obyčejně mívají snahu držet jednoruční meč oběma rukama. Tímto způsobem rozhodně nezačínej, to není dobré.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Drž zbraň v jedné ruce, čepelí vzhůru a šermuj s ní.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musíš se naučit sladit pohyb zbraně s pohybem svého těla. Tak budeš při útoku rychlejší.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Když si zapamatuješ, co jsem tě naučil, tak bude tvůj boj v budoucnu elegantnější a rychlejší.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ovšem, ještě jednu věc: Některé údery způsobí větší škodu než ostatní. Jako začátečníkovi se ti nebude často dostávat šance rozhodujících úderů.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale časem budeš dělat pokroky a zlepšíš se.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nemáš dost rudy!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Nauč mě ještě lépe ovládat jednoruční meč.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobrá, základy znáš. Když podržíš zbraň níž, umožní ti to mnohem silněji vést první švih.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musíš se hýbat, pamatuješ? Dobře, teď musíš ještě víc pracovat tělem. Po druhém úderu se otoč. To protivníka zmate a tobě to umožní zaujmout optimální pozici.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Ještě jednou veď čepel zprava doleva.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //A znovu kupředu. Nezapomeň: cvičením k dokonalosti. Takže vzhůru do toho, aby ses stal mistrem jednoručního meče.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Vrať se, až budeš mít dost rudy!
	};
};
