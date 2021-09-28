// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_Exit (C_INFO)
{
	npc			= Tpl_1415_Templer;
	nr			= 999;
	condition	= DIA_Tpl_1415_Torwache_Exit_Condition;
	information	= DIA_Tpl_1415_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tpl_1415_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tpl_1415_Torwache_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_First (C_INFO)
{
	npc				= Tpl_1415_Templer;
	nr				= 2;
	condition		= DIA_Tpl_1415_Torwache_First_Condition;
	information		= DIA_Tpl_1415_Torwache_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Tpl_1415_Torwache_First_Condition()
{	
	if (Kapitel >= 2)
	{
		return FALSE;
	};

	if (Npc_GetDistToWP(other,"PSI_START") > 800)
	{
		Npc_SetRefuseTalk(self,30);
	};
	
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Tpl_1415_Torwache_First_Info()
{
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_00"); //Buï zdráv, cizinèe!
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_01"); //Šlapeš po svaté pùdì. Tohle je Bratrstvo Spáèe.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_02"); //Co nám pøinášíš?
	
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
	Info_AddChoice		(DIA_Tpl_1415_Torwache_First,"Jsem tady nový. Chci si prohlédnout váš tábor.",DIA_Tpl_1415_Torwache_First_JustLooking);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_Tpl_1415_Torwache_First,"Chci s k vám pøidat.",DIA_Tpl_1415_Torwache_First_Join);
	};
};

func void DIA_Tpl_1415_Torwache_First_Join()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_First_Join_15_00"); //Slyšel jsem, že hledáte nové lidi. Chci se k vám pøidat.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_01"); //Pak buï vítán. Bratrstvo Spáèe má místo pro každého, kdo se chce nechat vést duchem Spáèe.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_02"); //Jestli to myslíš vážnì, mìl by ses pokusit upoutat pozornost Baala Namiba. Pøebývá na dvoøe, hned za branou.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_04"); //Nesmíš na nìj ale mluvit. Poèkej, až tì sám vyzve.
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
};

func void DIA_Tpl_1415_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00"); //Jsem tady nový. Chci si prohlédnout váš tábor.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01"); //Cizinci jsou tu vítáni.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02"); //Je ale dùležité dodržovat pravidla. Jsou urèité oblasti, do kterých cizinci nesmìjí.
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
};

// **************************************************
// 				Wie sieht's im Lager aus?
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_Sit (C_INFO)
{
	npc				= Tpl_1415_Templer;
	nr				= 2;
	condition		= DIA_Tpl_1415_Torwache_Sit_Condition;
	information		= DIA_Tpl_1415_Torwache_Sit_Info;
	permanent		= 1;
	description		= "Jak to v táboøe jde?";
};

FUNC INT DIA_Tpl_1415_Torwache_Sit_Condition()
{	
	return 1;
};

FUNC VOID DIA_Tpl_1415_Torwache_Sit_Info()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_Sit_15_00"); //Jak to v táboøe jde?
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_Sit_13_01"); //Všude klid. Tak pojï.
};
/*------------------------------------------------------------------------
//						TEMPLERAUFNAHME							//
------------------------------------------------------------------------*/
instance Tpl_1415_Torwache_TEMPLERAUFNAHME	 (C_INFO)
{
	npc				= Tpl_1415_Templer;
	condition		= Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition;
	information		= Tpl_1415_Torwache_TEMPLERAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition()
{	
	if (( Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS))
	&& ( Npc_GetTrueGuild  (hero) == GIL_NOV)
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Tpl_1415_Torwache_TEMPLERAUFNAHME_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01"); //Hej, slyšel jsem, co se stalo v dole. Boží dílo. Zasloužíš si být jmenován templáøem!
	AI_Output (self, other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02"); //Promluv si s Corem Angarem!

	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Mìl bych si promluvit s Corem Angarem. Možná mi dovolí pøidat se k templáøùm.");
};


/*------------------------------------------------------------------------
						Novizenröckchen							
------------------------------------------------------------------------*/

instance  Tpl_1415_Templer_ROCK (C_INFO)
{
	npc				= Tpl_1415_Templer;
	condition		= Tpl_1415_Templer_ROCK_Condition;
	information		= Tpl_1415_Templer_ROCK_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potøebuji zbroj."; 
};

FUNC int  Tpl_1415_Templer_ROCK_Condition()
{	
	if (Kapitel < 2)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1415_Templer_ROCK_Info()
{
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_Info_15_01"); //Potøebuji zbroj.
	AI_Output (self, other,"Tpl_1415_Templer_ROCK_Info_13_02"); //Templáøskou zbroj jako nosím já si musíš nejdøíve zasloužit. Ale mùžeš mít bederní roušku novice.
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_Info_15_03"); //Lepší než nic...
	AI_Output (self, other,"Tpl_1415_Templer_ROCK_Info_13_04"); //Za takové volnomyšlenkáøství ji nedostaneš!

	Info_ClearChoices (Tpl_1415_Templer_ROCK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,DIALOG_BACK,Tpl_1415_Templer_ROCK_BACK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,B_BuildBuyArmorString(NAME_TorwachenPsiRock,VALUE_NOV_ARMOR_L),Tpl_1415_Templer_ROCK_BUY);
};

func void Tpl_1415_Templer_ROCK_BACK()
{
	Info_ClearChoices (Tpl_1415_Templer_ROCK);
};

func void Tpl_1415_Templer_ROCK_BUY()
{
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_BUY_15_01"); //Dobøe, dej mi tu bederní pokrývku.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_NOV_ARMOR_L)
	{
		AI_Output (self, other,"Tpl_1415_Templer_ROCK_BUY_13_02"); //Vra se, až budeš mít dost rudy!
	}
	else
	{
		AI_Output (self, other,"Tpl_1415_Templer_ROCK_BUY_13_03"); //Tenhle kousek odìvu ti mùže zachránit život!
		B_GiveInvItems (hero, self, ItMinugget, VALUE_NOV_ARMOR_L);
		CreateInvItem (self, NOV_ARMOR_L);
		B_GiveInvItems (self, hero, NOV_ARMOR_L, 1);
		Tpl_1415_Templer_ROCK.permanent = 0;
	};

};










