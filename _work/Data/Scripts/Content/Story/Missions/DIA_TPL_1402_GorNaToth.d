// ***************************** 
//				EXIT 
// *****************************

instance DIA_TPL_1402_GorNaToth_Exit (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 999;
	condition	= DIA_TPL_1402_GorNaToth_Exit_Condition;
	information	= DIA_TPL_1402_GorNaToth_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_TPL_1402_GorNaToth_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_TPL_1402_GorNaToth_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ***************************** 
//			Abweisend 
// *****************************
instance DIA_GorNaToth_Abweisend (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_Abweisend_Condition;
	information	= DIA_GorNaToth_Abweisend_Info;
	permanent	= 1;
	description = "Můžeš mě cvičit?";
};                       

FUNC int DIA_GorNaToth_Abweisend_Condition()
{
	if	!Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked)
	&&	!C_NpcBelongsToPsiCamp(hero)  
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_Abweisend_Info()
{
	AI_Output			(other, self,"DIA_GorNaToth_AngarTalked_15_00"); //Můžeš mě cvičit?
	AI_Output			(self, other,"DIA_GorNaToth_AngarTalked_11_01"); //Jdi mi z očí, ty nemehlo. Cvičím jen Spáčovy templáře.
	AI_StopProcessInfos	(self);
};

// ***************************** 
//			AngarTalked 
// *****************************

instance DIA_GorNaToth_AngarTalked (C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 1;
	condition	= DIA_GorNaToth_AngarTalked_Condition;
	information	= DIA_GorNaToth_AngarTalked_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_GorNaToth_AngarTalked_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer))
	{
		return 1;
	};
};

FUNC VOID DIA_GorNaToth_AngarTalked_Info()
{
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_11_00"); //Mluvil s tebou Cor Angar? Co říkal?
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,"Říká, že nejsi hoden nosit templářskou zbroj.",DIA_GorNaToth_AngarTalked_Unworthy);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,"Říkal, že vždycky nesnášel močálové žraloky.",DIA_GorNaToth_AngarTalked_Shark);	
	Info_AddChoice			(DIA_GorNaToth_AngarTalked,"Říkal, že se mám vrátit, jakmile se stanu templářem.",DIA_GorNaToth_AngarTalked_Normal);	
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Normal_15_00"); //Říkal, že se mám vrátit, jakmile se stanu templářem.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_01"); //To by znamenalo, že má o tobě vysoké mínění. To neříká každému.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Normal_11_02"); //Je čest, když si někoho vůbec všimne. Ke MNĚ naposledy promluvil asi před dvěma měsíci.
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Shark_15_00"); //Říkal, že vždycky nesnášel močálové žraloky.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_01"); //Cože...? (rozhodně) Čeká na mě svatý úkol.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Shark_11_02"); //Přání mého pána je mi rozkazem.
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output (other, self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00"); //Říká, že nejsi hoden nosit templářskou zbroj.
	AI_Output (self, other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01"); //Nikdy! To neměl říkat! Ne MNĚ!
	Info_ClearChoices		(DIA_GorNaToth_AngarTalked);
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

//-------------------------------------------------------
// AUFNAHME BEI DEN TEMPLERN
//-------------------------------------------------------
instance  TPL_1402_GorNaToth_GETSTUFF (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_GETSTUFF_Condition;
	information		= TPL_1402_GorNaToth_GETSTUFF_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chtěl bych si vzít svoji templářskou zbroj."; 
};

FUNC int  TPL_1402_GorNaToth_GETSTUFF_Condition()
{	
	if (Npc_KnowsInfo (hero,GUR_1202_CorAngar_WANNABETPL))
	&& (Npc_GetTrueGuild (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_GETSTUFF_Info()
{
	AI_Output			(other, self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01"); //Chtěl bych si vzít svoji templářskou zbroj.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02"); //Je mi potěšením mít tu čest předat naši zbroj muži,který našel vajíčka důlního červa.
	AI_Output			(self, other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03"); //Ať tě tahle zbroj ochraňuje tak, jako Spáč chrání Bratrstvo!
	
	B_LogEntry			(GE_BecomeTemplar,"Gor Na Toth mi dal moji první templářskou zbroj. Právě jsem se stal řádným členem rodu bojovníků!");

	Log_CreateTopic		(GE_TraderPSI,		LOG_NOTE);
	B_LogEntry			(GE_TraderPSI,"Gor Na Toth má k dispozici lepší templářskou ZBROJ. Výměnou očekává velkorysou dotaci Bratrstvu. Přes den ho najdu na cvičišti.");
	
	CreateInvItem		(hero, TPL_ARMOR_L);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_EquipBestArmor	(hero);
};  

/*------------------------------------------------------------------------
//							ARMOR
------------------------------------------------------------------------*/
instance  TPL_1402_GorNaToth_ARMOR (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_ARMOR_Condition;
	information		= TPL_1402_GorNaToth_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potřebuju lepší zbroj."; 
};

FUNC int  TPL_1402_GorNaToth_ARMOR_Condition()
{	
	if	(Npc_KnowsInfo(hero,TPL_1402_GorNaToth_GETSTUFF))
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_ARMOR_Info()
{
	AI_Output				(other, self,"Info_GorNaToth_ARMOR_15_01"); //Potřebuji lepší zbroj.
	AI_Output				(self, other,"Info_GorNaToth_ARMOR_11_02"); //Mohl bych ti dát lepší zbroj, ale musíš poskytnout Bratrstvu šlechetný příspěvek.

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	DIALOG_BACK	,	TPL_1402_GorNaToth_ARMOR_BACK);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,VALUE_TPL_ARMOR_H) ,TPL_1402_GorNaToth_ARMOR_H);	
	Info_AddChoice			(TPL_1402_GorNaToth_ARMOR,	B_BuildBuyArmorString(NAME_GorNaTothTpl,VALUE_TPL_ARMOR_M),	TPL_1402_GorNaToth_ARMOR_M);	


};

func void TPL_1402_GorNaToth_ARMOR_M ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_M_15_01"); //Chtěl bych střední templářskou zbroj.

	if (Kapitel < 3)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_02"); //Ještě nemáš dost zkušeností! Prokaž svou vážnost jako templář a pak budeš hoden nosit lepší zbroj.
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_M)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_03"); //Jakmile budeš schopen naší komunitě poskytnout příslušný dar, budeš mít lepší zbroj!
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_M_11_04"); //Teď, když jsi schopen poskytnout příslušný dar, bude tě chránit nová zbroj.
		B_GiveInvItems	    (hero, self, ItMiNugget,	VALUE_TPL_ARMOR_M);
		
		CreateInvItem		(hero, TPL_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_H ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_H_15_01"); //Rád bych těžkou templářskou zbroj.

	if (Kapitel < 4)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_02"); //Ještě nemáš dost zkušeností! Prokaž svou vážnost jako člen naší komunity a pak budeš hoden nosit takovouto vybranou zbroj.
	}
	else if (Npc_HasItems(hero, ItMiNugget)<VALUE_TPL_ARMOR_H)
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_03"); //Zasloužil sis nosit takovouhle zbroj, ale v tomto okamžiku nejsi schopen poskytnout komunitě příslušný dar.
	}
	else
	{
		AI_Output			(self, hero,"Info_GorNaToth_ARMOR_H_11_04"); //On tohohle okamžiku nos tuto zbroj jako znamení nejvyšší cti!

		B_GiveInvItems  	(hero, self, ItMiNugget,VALUE_TPL_ARMOR_H);

		CreateInvItem		(self, ItAmArrow);				//SN: Kronkelgegenstand, damit die Bildschrimausgabe "1 Gegenstand erhalten" stimmt (Rüstung geht nicht, da dann immer Gor Na Toth seine eigene erst auszieht, und eine Sekunde nackt dasteht)
		B_GiveInvItems  	(self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero,	ItAmArrow);

		CreateInvItem		(hero, TPL_ARMOR_H);
		AI_EquipBestArmor	(hero);
	};

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK ()
{
	AI_Output				(hero, self,"Info_GorNaToth_ARMOR_BACK_15_01"); //Rozmyslel jsem se!
	AI_Output				(self, hero,"Info_GorNaToth_ARMOR_BACK_11_02"); //Jak chceš. Víš, kde mě najdeš!

	Info_ClearChoices		(TPL_1402_GorNaToth_ARMOR);
};


//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE TPL_1402_GorNaToth_Teach(C_INFO)
{
	npc			= TPL_1402_GorNaToth;
	nr			= 10;
	condition	= TPL_1402_GorNaToth_Teach_Condition;
	information	= TPL_1402_GorNaToth_Teach_Info;
	permanent	= 1;
	description = "Můžeš mě cvičit?";
};                       

FUNC INT TPL_1402_GorNaToth_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID TPL_1402_GorNaToth_Teach_Info()
{
	AI_Output			(other,self,"TPL_1402_GorNaToth_Teach_15_00"); //Můžeš mě cvičit?
	AI_Output			(self,other,"TPL_1402_GorNaToth_Teach_11_01"); //Síla a obratnost jsou zrovna tak důležité jako síla mysli.
	
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);

	if (log_gornatothtrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Templář Gor Na Toth mi může pomoci zvýšit moji SÍLU, OBRATNOST a MAGICKOU ENERGII.");
		log_gornatothtrain = TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_BACK()
{
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
};

func void TPL_1402_GorNaToth_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};
func void TPL_1402_GorNaToth_Teach_MAN_1()
{
	B_BuyAttributePoints(other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_5()
{
	B_BuyAttributePoints(other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(TPL_1402_GorNaToth_Teach);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,DIALOG_BACK									,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice		(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)			,TPL_1402_GorNaToth_Teach_MAN_1);
};
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  TPL_1402_GorNaToth_TRAIN (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_TRAIN_Condition;
	information		= TPL_1402_GorNaToth_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0); 
};

FUNC int  TPL_1402_GorNaToth_TRAIN_Condition()
{	
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 1)
	&& (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_TRAIN_Info()
{
	if	(log_gornatothfight == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Templář Gor Na Toth mě může naučit bojovat s JEDNORUČNÍMI zbraněmi.");
		log_gornatothfight = TRUE;
	};
	AI_Output (other, self,"TPL_1402_GorNaToth_TRAIN_Info_15_00"); //Chci se zlepšit v ovládání jednoručního meče.
	
	if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
	{
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_01"); //To je dobré rozhodnutí! Ještě než se začneš učit techniku, musíš se naučit správně držet zbraň.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_02"); //Začátečníci obyčejně mívají snahu držet jednoruční meč oběma rukama. Tímto způsobem rozhodně nezačínej, to není dobré.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_03"); //Drž zbraň v jedné ruce, čepelí vzhůru a šermuj s ní.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_04"); //Musíš se naučit sladit pohyb zbraně s pohybem svého těla. Tak budeš při útoku rychlejší.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_05"); //Když si zapamatuješ, co jsem tě naučil, tak bude tvůj boj v budoucnu elegantnější a rychlejší.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_06"); //Ovšem, ještě jednu věc: Některé údery způsobí větší škodu než ostatní. Jako začátečníkovi se ti nebude často dostávat šance rozhodujících úderů.
		AI_Output			(self,other,"TPL_1402_GorNaToth_TRAIN_11_07"); //Ale časem budeš dělat pokroky a zlepšíš se.
		TPL_1402_GorNaToth_TRAIN.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  TPL_1402_GorNaToth_TRAINAGAIN (C_INFO)
{
	npc				= TPL_1402_GorNaToth;
	condition		= TPL_1402_GorNaToth_TRAINAGAIN_Condition;
	information		= TPL_1402_GorNaToth_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2,			LPCOST_TALENT_1H_2,0); 
};

FUNC int  TPL_1402_GorNaToth_TRAINAGAIN_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 1)
	&& (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};

};
FUNC void  TPL_1402_GorNaToth_TRAINAGAIN_Info()
{
	AI_Output (other, self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01"); //Nauč mě ještě lépe ovládat jednoruční meč.
	if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
	{
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02"); //Dobrá, základy znáš. Když podržíš zbraň níž, umožní ti to mnohem silněji vést první švih.
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03"); //Musíš se hýbat, pamatuješ? Dobře, teď musíš ještě víc pracovat tělem. Po druhém úderu se otoč. To protivníka zmate a tobě to umožní zaujmout optimální pozici.
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04"); //Ještě jednou veď čepel zprava doleva.
		AI_Output (self, other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05"); //A znovu kupředu. Nezapomeň: cvičením k dokonalosti. Takže vzhůru do toho, aby ses stal mistrem jednoručního meče.
		TPL_1402_GorNaToth_TRAINAGAIN.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
}; 
