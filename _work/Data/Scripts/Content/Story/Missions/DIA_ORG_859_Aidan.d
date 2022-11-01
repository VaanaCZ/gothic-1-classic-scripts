// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Co tady děláš?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tady děláš?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Jsem lovec. Žiju z prodeje kůží a zubů.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Platí se za to?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Když víš, jak správně ty bestie rozřezat, tak jo.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Adan, lovec žijící na cestě mezi Starým a Novým táborem, mě může naučit kuchat zvěř.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Chci se naučit rozřezávat zvěř.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Chci se naučit rozřezávat zvěř.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Co bys chtěl vědět?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Vyjmout zuby (cena: 1 dovednostní bod, 50 nugetů)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Stáhnout kožešinu (cena:1 dovednostní bod, 100 nugetů)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Vyjmout drápy (cena: 1 dovednostní bod, 50 nugetů)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Stáhnout plaza (cena: 1 dovednostní bod, 100 nugetů)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Naučil jsem tě všechno, co vím.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Jak dostanu zuby?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Naučit se: vytahovat zuby", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Nejdůležitější je zajistit, aby se zuby netříštily. Tomu se vyhneš tak, že vložíš nůž blízko středu zubu a opatrně ho vypáčíš.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Tak si můžeš vzít zuby vlků, stínových příšer a kousavců.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahování zubů - vlk, skřetí pes, chňapavec, kousavec, lovecký pes, stínová šelma");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
			PrintScreen	("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak dostanu kůži těch příšer?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Naučit se: stahovat kožešinu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Důležité je kůži stahovat zezadu dopředu. Jakmile se ti napne, už je to snadné. Kožešiny se velmi cení!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Kůže vlků a stínových příšer se můžou použít na oděv. Když prohlídneš kožešinu zabitého zvířete, hned poznáš, jestli ji půjde použít nebo ne. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahování kožešiny - vlk, skřetí pes, chňapavec, kousavec, lovecký pes, stínová šelma, trol");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
			PrintScreen	("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Naučit se: vytahovat drápy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Ukaž mi, jak dostanu drápy!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Je to v podstatě velmi jednoduché, pokud víš jak na to. Ohneš drápy dopředu - nikdy ne dozadu - ale NESMÍŠ je vytahovat!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Drápy můžeš dostat hlavně z ještěrek. Teď už víš, jak vzít z příšer drápy.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahování drápů - ještěrka, chňapavec, číhavec, kousavec, břitvoun");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
			PrintScreen	("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Naučit se: stahovat plazí kůži", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co musím dávat pozor, když stahuji plazí kůži?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Jediní plazi, kteří jsou k tomuhle účelu vhodní, jsou číhavci a močáloví žraloci.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Když nařízneš kůži po stranách, sloupne se sama. Teď už bys měl umět stahovat plazy.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahování plazů - číhavec, močálový žralok");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potřebuješ víc zkušeností, jinak ti mé vědomosti nebudou k ničemu.
			PrintScreen	("Nedostatek zkušenostních bodů!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdřív chci vidět nějakou rudu. Jak jsem řekl: všechno má svou cenu!
	};
};
