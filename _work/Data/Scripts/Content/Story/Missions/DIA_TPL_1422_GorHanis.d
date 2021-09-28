// **************************************************
//						 EXIT 
// **************************************************

instance Info_GorHanis_Exit (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 999;
	condition		= Info_GorHanis_Exit_Condition;
	information		= Info_GorHanis_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_GorHanis_Exit_Condition()
{
	return 1;
};

func VOID Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Co tady dìláš?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
	return 1;
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Co tady dìláš?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Já?! Bojuju za slávu Spáèe!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 1;
	description 	= "Bojuješ v arénì?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena_15_00"); //Bojuješ v arénì?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Byl jsem vyslaný svými mistry z bažin, abych bojoval za Spáèe.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Budu tu bojovat za jeho vìtší slávu - tak mùžou všichni nevìrci poznat, jakou silou mì obdaøila jeho moc!
};

// **************************************************
//					Schläfer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "Co je to Spáè?";
};                       

FUNC INT Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Sleeper_Info()
{
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //Co je to Spáè?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //V našem táboøe najdeš knìze, kteøí ti tuhle otázku budou schopni zodpovìdìt lépe než já.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Mùžu ti øíci akorát tohle: Spáè je náš spasitel, který nás pøivedl na tohle místo a který nás odtud zase vyvede.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //Tím chceš øíci, že èekáte, až vás váš bùh osvobodí?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //Ano! A to èekání brzy skonèí. Právì se pøipravuje velké vzývání!
};

// **************************************************
//					Große Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "Jaký druh vzývání pøipravujete?";
};                       

FUNC INT Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Summoning_Info()
{
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //Jaký druh vzývání pøipravujete?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //Naši proroci øíkají, že spoleèné vzývání Spáèe je naším klíèem ke svobodì!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Jestli se chceš o tom dozvìdìt víc, jdi do našeho tábora.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 0;
	condition		= Info_GorHanis_WayToST_Condition;
	information		= Info_GorHanis_WayToST_Info;
	permanent		= 1;
	description 	= "Mùžeš mi popsat cestu do vašeho tábora?";
};                       

FUNC INT Info_GorHanis_WayToST_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning) )
	{
		return 1;
	};
};

func VOID Info_GorHanis_WayToST_Info()
{
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //Mùžeš mi popsat cestu do vašeho tábora?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //Ve Starém táboøe je nìkolik novicù, kteøí jsou ochotní doprovázet nové pøíchozí jako jsi ty do našeho tábora. Musíš si jim jenom øíci.
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_Charge_Condition;
	information		= Info_GorHanis_Charge_Info;
	permanent		= 0;
	description 	= "Vyzývám tì na souboj v arénì!";
};                       

FUNC INT Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Charge_Info()
{
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //Vyzývám tì na souboj v arénì!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //Neposloužilo by pøíliš Spáèovì slávì, kdybych pøed obecenstvem zabil nìjakého bøídila.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //Budu proti tobì bojovat jedinì v pøípadì, že mi budeš dùstojným protivníkem.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Jsem si jistý, že bojovníci ze Starého nebo Nového tábora nejsou všichni zásadoví muži...…
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_ChargeGood_Condition;
	information		= Info_GorHanis_ChargeGood_Info;
	permanent		= 1;
	description 	= "Jsem už dost silný, abych se s tebou mohl utkat?";
};                       

FUNC INT Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func VOID Info_GorHanis_ChargeGood_Info()
{
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //Jsem už dost silný, abych se s tebou mohl utkat?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //Ne! Nemáš dost síly - nejsi pro mì protivník!
};























/*

// infos 
instance Info_TPL_1422_GorHanis (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis_Condition;
	information		= Info_TPL_1422_GorHanis_Info;
	important			= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1422_GorHanis_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_PC_Mage_LoadSword3 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis_Info()
{
	AI_Output (self, other,"Info_TPL_1422_GorHanis_08_01"); //Was machst du hier?
};


instance Info_TPL_1422_GorHanis1 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis1_Condition;
	information		= Info_TPL_1422_GorHanis1_Info;
	important			= 0;
	permanent		= 0;
	description		= "Ich will helfen den Schläfer zu erwecken."; 
};

FUNC int Info_TPL_1422_GorHanis1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis1_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis1_15_01"); //Ich will helfen den Schläfer zu erwecken.
	AI_Output (self, other,"Info_TPL_1422_GorHanis1_08_02"); //Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du lügst, wird der Hohenpriester dir schon eine Lektion erteilen.
};



instance Info_TPL_1422_GorHanis2 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis2_Condition;
	information		= Info_TPL_1422_GorHanis2_Info;
	important			= 0;
	permanent		= 0;
	description		= "Das geht dich nichts an!"; 
};

FUNC int Info_TPL_1422_GorHanis2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis2_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis2_15_01"); //Das geht dich nichts an!
	AI_Output (self, other,"Info_TPL_1422_GorHanis2_08_02"); //Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen. 
};


instance Info_TPL_1422_GorHanis3 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis3_Condition;
	information		= Info_TPL_1422_GorHanis3_Info;
	important			= 0;
	permanent		= 0;
	description		= "Wie seit ihr an dem Priester vorbei gekommen?"; 
};

FUNC int Info_TPL_1422_GorHanis3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis2 )) || ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis1 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis3_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis3_15_01"); //Wie seit ihr an dem Priester vorbei gekommen?
	AI_Output (self, other,"Info_TPL_1422_GorHanis3_08_02"); //Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit im gesprochen hat, dass Glück wirst du nicht haben. Geh nur (lacht).
};

*/
