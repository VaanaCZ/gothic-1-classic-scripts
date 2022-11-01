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
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Spáč s tebou, cizinče!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Jsem tady, abych tě přivedl na správnou cestu.
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
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Cesta Spáčova. On sám je tou silou, která nás osvobodí.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Guru připravují v našem táboře velké vzývání - chtějí navázat spojení se Spáčem.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Dosud k nám promlouval jen ve vizích - ale teď nastal čas, kdy s ním vstoupíme ve spojení.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Budeme k tomu potřebovat co nejvíce pomocníků. Když budem soustředit své duchovní síly, pak se k němu jejich prostřednictvím dostaneme.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Náš tábor je odsud dost daleko, v bažinách - jestli chceš, můžu tě tam dovést.
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
	description = "Co z toho budu mít, když se k vám přidám?";
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
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co z toho budu mít, když se k vám přidám?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Možná se staneš jedním z vyvolených lidí, kteří od Spáče dostanou dar magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Nebo se ti možná dostane nejvyšší pocty a staneš se templářem. Jen ti nejlepší bojovníci z nás můžou získat takové postavení.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Pokud bude Spáč s tebou, můžeš dokonce spojit obojí - nejlepší z templářů dostanou také dar magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Vidíš, naše Bratrstvo ti nabízí spoustu příležitostí.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Měl bys to zvážit, než se rozhodneš pro jiný tábor!
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
	description = "Kdo je ten Spáč?";
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
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Kdo je ten Spáč?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Spáč k nám promlouvá prostřednictvím snů a vidin.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Od té doby, co s ním Y´Berion poprvé před pěti lety vstoupil do spojení, nás stále vede.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Všichni přívrženci Bratrstva se zřekli tří bohů. Modlíme se za spásu jenom ke Spáčovi.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Spásu od čeho?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Od tohohle zpropadeného místa, přece! Spáč nám ukáže cestu ke svobodě!
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
	description = "Co vám Spáč říká?";
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
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co vám Spáč říká?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Dovedl nás k bažinám, ke zřícenině starého chrámu. Tam jsme vybudovali náš tábor.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Dal nám nezávislost - nikdo z nás nemusí pracovat v dolech.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Ukázal nám, co dokáže droga z bažin. Prodáváme ji do ostatních táborů a měníme ji za to, co potřebujeme.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //A některým z nás předal dar magie. Stará a mocná kouzla, která se liší od těch, která používají mágové této říše.
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
	description = "Povídej mi o Spáčově magii.";
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
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Povídej mi o Spáčově magii.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Ten dar nám umožňuje řídit věci silou vlastní mysli.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Do tajů tohoto kouzla byli zasvěceni jen Guru našeho Bratrstva.
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
	description = "Vezmi mě do vašeho tábora. Chci si ho prohlédnout.";
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
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Vezmi mě do vašeho tábora. Chci si ho prohlédnout.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez, misionář Bratrstva, hledá ve Starém táboře nové věřící pro SPÁČE! Nabídl mi doprovod do Tábora v bažinách, domova bratrstva.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Velmi dobře! Půjdu napřed. Následuj mě!
	
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
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Dal sis na čas, bratře! Támhle dole je tábor.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Projdi branou a promluv s mými bratry. Doufám, žes sem nepřišel pronic zanic.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Zeptej se na Cora Kaloma. Stará se o novice a žáky.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Já se vrátím do Starého tábora - je tam pořád dost nevěrců, kteří potřebují navést na správnou cestu
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Hodně štěstí.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"Tábor v bažinách je pode mnou. Můj společník mi poradil, abych si promluvil s Cor Kalomem. Je vůdcem a učitelem noviců.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


