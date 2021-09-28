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
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Støeím arénu. Organizuju vsázení, najímám nové bojovníky... Však víš.
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
	description = "Chci se pøidat k táboru. Pomùeš mi?";
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
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chci se pøidat k táboru. Pomùeš mi?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Moná bych mohl, musel bys mì ale nìjak pøesvìdèit.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Nìkolik nejlepších bojovníkù ze všech tøí táborù sem chodí, aby si zde navzájem pomìøilo síly.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Vyzvi nìkoho z nich na souboj. Budu tì sledovat a kdy budeš dobrı, zamyslím se nad tím.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, mistr arény, ocení, kdy vyzvu jednoho z bojovníkù.");
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
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Jistì, a prohrál jsi.
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Urèitì si nemyslíš, e mì tímhle pøesvìdèíš...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Skuteènost, e mì Kirgo porazil, u na Scattyho takovı dojem neudìlala.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //A porazil jsi ho! To není na zaèáteèníka, jako jsi ty, špatné! Pøesvìdèil jsi mì!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty byl zaujat mım bojem proti Kirgovi.");
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
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //A ten tì zmlátil, hochu!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Vybral sis vhodného protivníka! Ty bastardy z Nového tábora nemùu vystát.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Vypadá to, e to vidíš podobnì - jsi pøesnì ten typ chlapa, jakı potøebujeme!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"Kharim mì zbil! Scattymu se líbila moje odvaha, ne však mùj boj.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //A srazil jsi ho! Musím uznat, e to nebylo špatné. Vdycky byl jedním z nejpovaovanìjších bojovníkù.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Tohle na mì opravdu udìlalo dojem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Nandal jsem to Kharimovi! Scatty byl dojatı.");
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
	description = "Proè necháváš lidi z jinıch táborù, aby se tady bili?";
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
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Myslel jsem, e Starı a Novı tábor spolu nevycházejí dobøe - tak proè tady necháváš jejich lidi bojovat?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To je jednoduché - odehrávají se tady jednou tıdnì souboje a kopáèi pokadé rádi vidí, kdy je nìkterı z hrdloøezù z Nového tábora rozdrcen.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Pokud bojuje jeden z nich, pak se uzavøe více sázek - a to je skvìlé pro obchod!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Mezi námi, já ty grázly z Nového tábora nemùu vystát - ale obchod je obchod.
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
	description = "Chci uzavøít sázku.";
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
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chci uzavøít sázku.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Teï ale není ádnı souboj.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Pøíští boje budou za nìkolik dní. Bude to vyhlášeno.
	
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
	description = "Chci bojovat v arénì!";
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
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Chci bojovat v arénì!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Nemùu tì nechat bojovat, dokud se nepøipojíš k jednomu z táborù!
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
	description = "Cvièíš vùbec bojovníky?";
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
    B_LogEntry(GE_TeacherOC,"Scatty, mistr arény, mì mùe nauèit bojovat s JEDNORUÈNÍMI ZBRANÌMI.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Cvièíš vùbec bojovníky?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Jistì, ale ne pro zábavu. Jestli chceš, abych tì cvièil, musíš mi za to zaplatit.


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
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chci se zlepšit v ovládání jednoruèního meèe.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //To je dobré rozhodnutí! Ještì ne se zaèneš uèit techniku, musíš se nauèit správnì dret zbraò.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Zaèáteèníci obyèejnì mívají snahu dret jednoruèní meè obìma rukama. Tímto zpùsobem rozhodnì nezaèínej, to není dobré.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Dr zbraò v jedné ruce, èepelí vzhùru a šermuj s ní.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musíš se nauèit sladit pohyb zbranì s pohybem svého tìla. Tak budeš pøi útoku rychlejší.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Kdy si zapamatuješ, co jsem tì nauèil, tak bude tvùj boj v budoucnu elegantnìjší a rychlejší.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ovšem, ještì jednu vìc: Nìkteré údery zpùsobí vìtší škodu ne ostatní. Jako zaèáteèníkovi se ti nebude èasto dostávat šance rozhodujících úderù.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale èasem budeš dìlat pokroky a zlepšíš se.
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
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Nauè mì ještì lépe ovládat jednoruèní meè.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobrá, základy znáš. Kdy podríš zbraò ní, umoní ti to mnohem silnìji vést první švih.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musíš se hıbat, pamatuješ? Dobøe, teï musíš ještì víc pracovat tìlem. Po druhém úderu se otoè. To protivníka zmate a tobì to umoní zaujmout optimální pozici.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Ještì jednou veï èepel zprava doleva.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //A znovu kupøedu. Nezapomeò: cvièením k dokonalosti. Take vzhùru do toho, aby ses stal mistrem jednoruèního meèe.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Vra se, a budeš mít dost rudy!
	};
};
