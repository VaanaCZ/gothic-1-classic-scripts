// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Spáè s tebou, cizinèe!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Jsem tady, abych tì pøivedl na správnou cestu.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "A jaká je ta správná cesta?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //A jaká je ta správná cesta?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Cesta Spáèova. On sám je tou silou, která nás osvobodí.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Guru pøipravují v našem táboøe velké vzývání - chtìjí navázat spojení se Spáèem.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Dosud k nám promlouval jen ve vizích - ale teï nastal èas, kdy s ním vstoupíme ve spojení.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Budeme k tomu potøebovat co nejvíce pomocníkù. Když budem soustøedit své duchovní síly, pak se k nìmu jejich prostøednictvím dostaneme.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Náš tábor je odsud dost daleko, v bažinách - jestli chceš, mùžu tì tam dovést.
};

// **************************************************
//					Vorteile für mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Co z toho budu mít, když se k vám pøidám?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co z toho budu mít, když se k vám pøidám?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Možná se staneš jedním z vyvolených lidí, kteøí od Spáèe dostanou dar magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Nebo se ti možná dostane nejvyšší pocty a staneš se templáøem. Jen ti nejlepší bojovníci z nás mùžou získat takové postavení.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Pokud bude Spáè s tebou, mùžeš dokonce spojit obojí - nejlepší z templáøù dostanou také dar magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Vidíš, naše Bratrstvo ti nabízí spoustu pøíležitostí.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Mìl bys to zvážit, než se rozhodneš pro jiný tábor!
};

// **************************************************
//					Schläfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Kdo je ten Spáè?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Kdo je ten Spáè?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Spáè k nám promlouvá prostøednictvím snù a vidin.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Od té doby, co s ním Y´Berion poprvé pøed pìti lety vstoupil do spojení, nás stále vede.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Všichni pøívrženci Bratrstva se zøekli tøí bohù. Modlíme se za spásu jenom ke Spáèovi.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Spásu od èeho?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Od tohohle zpropadeného místa, pøece! Spáè nám ukáže cestu ke svobodì!
};

// **************************************************
//			Was hat Schläfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Co vám Spáè øíká?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co vám Spáè øíká?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Dovedl nás k bažinám, ke zøíceninì starého chrámu. Tam jsme vybudovali náš tábor.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Dal nám nezávislost - nikdo z nás nemusí pracovat v dolech.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Ukázal nám, co dokáže droga z bažin. Prodáváme ji do ostatních táborù a mìníme ji za to, co potøebujeme.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //A nìkterým z nás pøedal dar magie. Stará a mocná kouzla, která se liší od tìch, která používají mágové této øíše.
};

// **************************************************
//		Erzähl mir von der MAgie des Schläfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Povídej mi o Spáèovì magii.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Povídej mi o Spáèovì magii.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Ten dar nám umožòuje øídit vìci silou vlastní mysli.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Do tajù tohoto kouzla byli zasvìceni jen Guru našeho Bratrstva.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Vezmi mì do vašeho tábora. Chci si ho prohlédnout.";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Vezmi mì do vašeho tábora. Chci si ho prohlédnout.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez, misionáø Bratrstva, hledá ve Starém táboøe nové vìøící pro SPÁÈE! Nabídl mi doprovod do Tábora v bažinách, domova bratrstva.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Velmi dobøe! Pùjdu napøed. Následuj mì!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Tak tady jsme... Dole leží tábor Bratrstva.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Dal sis na èas, bratøe! Támhle dole je tábor.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Projdi branou a promluv s mými bratry. Doufám, žes sem nepøišel pronic zanic.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Zeptej se na Cora Kaloma. Stará se o novice a žáky.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Já se vrátím do Starého tábora - je tam poøád dost nevìrcù, kteøí potøebují navést na správnou cestu
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Hodnì štìstí.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"Tábor v bažinách je pode mnou. Mùj spoleèník mi poradil, abych si promluvil s Cor Kalomem. Je vùdcem a uèitelem novicù.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


