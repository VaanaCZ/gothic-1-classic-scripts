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
	description		= "Co tady dìláš?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tady dìláš?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Jsem lovec. Žiju z prodeje kùží a zubù.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Platí se za to?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Když víš, jak správnì ty bestie rozøezat, tak jo.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Adan, lovec žijící na cestì mezi Starým a Novým táborem, mì mùže nauèit kuchat zvìø.");
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
	description = "Chci se nauèit rozøezávat zvìø.";
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
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Chci se nauèit rozøezávat zvìø.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Co bys chtìl vìdìt?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Vyjmout zuby (cena: 1 dovednostní bod, 50 nugetù)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Stáhnout kožešinu (cena:1 dovednostní bod, 100 nugetù)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Vyjmout drápy (cena: 1 dovednostní bod, 50 nugetù)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Stáhnout plaza (cena: 1 dovednostní bod, 100 nugetù)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Nauèil jsem tì všechno, co vím.
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
			
			PrintScreen	("Nauèit se: vytahovat zuby", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Nejdùležitìjší je zajistit, aby se zuby netøíštily. Tomu se vyhneš tak, že vložíš nùž blízko støedu zubu a opatrnì ho vypáèíš.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Tak si mùžeš vzít zuby vlkù, stínových pøíšer a kousavcù.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahování zubù - vlk, skøetí pes, chòapavec, kousavec, lovecký pes, stínová šelma");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potøebuješ víc zkušeností, jinak ti mé vìdomosti nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak dostanu kùži tìch pøíšer?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nauèit se: stahovat kožešinu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Dùležité je kùži stahovat zezadu dopøedu. Jakmile se ti napne, už je to snadné. Kožešiny se velmi cení!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Kùže vlkù a stínových pøíšer se mùžou použít na odìv. Když prohlídneš kožešinu zabitého zvíøete, hned poznáš, jestli ji pùjde použít nebo ne. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahování kožešiny - vlk, skøetí pes, chòapavec, kousavec, lovecký pes, stínová šelma, trol");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potøebuješ víc zkušeností, jinak ti mé vìdomosti nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
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
			
			PrintScreen	("Nauèit se: vytahovat drápy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Ukaž mi, jak dostanu drápy!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Je to v podstatì velmi jednoduché, pokud víš jak na to. Ohneš drápy dopøedu - nikdy ne dozadu - ale NESMÍŠ je vytahovat!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Drápy mùžeš dostat hlavnì z ještìrek. Teï už víš, jak vzít z pøíšer drápy.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahování drápù - ještìrka, chòapavec, èíhavec, kousavec, bøitvoun");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potøebuješ víc zkušeností, jinak ti mé vìdomosti nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
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
			
			PrintScreen	("Nauèit se: stahovat plazí kùži", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co musím dávat pozor, když stahuji plazí kùži?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Jediní plazi, kteøí jsou k tomuhle úèelu vhodní, jsou èíhavci a moèáloví žraloci.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Když naøízneš kùži po stranách, sloupne se sama. Teï už bys mìl umìt stahovat plazy.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahování plazù - èíhavec, moèálový žralok");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Potøebuješ víc zkušeností, jinak ti mé vìdomosti nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
	};
};
