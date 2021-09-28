
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Ty tady lovíš, že jo?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Ty tady lovíš, že jo?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Vypadá to tak... co chceš?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Mùžeš mi dát nìjaké rady pro lov?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Mùžu tì nauèit pár vìcí - ale všechno má svoji cenu.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Kolik by to stálo?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Poøádný doušek piva by pro zaèátek mohl staèit - pak se uvidí.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Tady je, vezmi si pivo a vyprávìj mi o lovu.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Tady je, vezmi si pivo a vyprávìj mi o lovu.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Mrchožrouty, tak øíkáme tìm velkým ptákùm, je nejlepší lovit jednoho po druhém. Vylákat jednoho mrchožrouta z hejna je snadné.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Když pøijdeš moc blízko, jsou podráždìní. Za chvilku vyrazí tvým smìrem. V tom okamžiku bys na nì mìl èekat s pøipravenou zbraní.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Když se ti tu potvoru podaøí srazit, ještì než na tebe zaútoèí, musíš být poøád ve støehu, abys ji pak mohl dorazit, a sám se pøitom nezranil.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //Pokud udeøíš první TY - výbornì - ale nenech to udìlat je.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nemám žádné pivo.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Tak bìž a nìjaké sežeò. Takhle lacino už nikdy k žádné dobré radì nepøijdeš. A až pøijdeš pøíštì, pøines také nìjakou rudu!
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Mùžu ti dát pár informací o zvìøi, ale bude tì to nìco stát!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Bandita Drax mi nabídl, že mì nauèí kuchat zvìø, když mu zaplatím, oè požádá. Vìtšinou loví na cestì z tržištì do Starého tábora.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Co mi ještì mùžeš øíci o lovu?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Co mi ještì mùžeš øíci o lovu?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Spoustu - ale bude tì to stát mnohem víc než pivo.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Když víš jak, mùžeš si z tìch pøíšer vzít zuby, drápy a kùži. Je tìžké je získat, ale mají velkou cenu.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //Každý obchodník ty vìci s tebou vymìní.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Požaduješ toho za své rady moc.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Vyjmout zuby (cena: 1 dovednostní bod, 50 nugetù)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Stáhnout kožešinu (cena: 1 dovednostní bod, 100 nugetù)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Vyjmout drápy (cena: 1 dovednostní bod, 50 nugetù)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Stáhnout plaza (cena: 1 dovednostní bod, 100 nugetù)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Øekl jsem ti všechno, co vím.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Požaduješ toho za své rady moc.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Možná, ale ty na nich mùžeš vydìlat daleko víc.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Všechna ta zvìø, kterou zabiješ, ti shnije, když nebudeš vìdìt, jak ji rozøezat.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //Tím ztratíš možnost stáhnout ji z kùže a za vysokou cenu prodat kožešinu.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Já být tebou, pokusil bych si doplnit vìdomosti, jak nejvíce to pùjde.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak dostanu zuby?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nauèit se: vytahovat zuby", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Nejdùležitìjší je zajistit, aby se zuby netøíštily. Tomu se vyhneš tak, že vložíš nùž blízko støedu zubu a opatrnì ho vypáèíš.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Tak si mùžeš vzít zuby vlkù, stínových pøíšer a kousavcù.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahování zubù - vlk, skøetí pes, chòapavec, kousavec, lovecký pes, stínová šelma");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Musíš ještì získat zkušenosti, jinak ti mé rady nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak dostanu kùži tìch pøíšer?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Nauèit se: stahovat kožešinu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Dùležité je kùži stahovat zezadu dopøedu. Jakmile se ti napne, už je to snadné. Kožešiny se velmi cení!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Kùže vlkù a stínových pøíšer se mùžou použít na odìv. Když prohlídneš kožešinu zabitého zvíøete, hned poznáš, jestli ji pùjde použít, nebo ne. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahování kožešiny - vlk, skøetí pes, chòapavec, kousavec, lovecký pes, stínová šelma, trol");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Potøebuješ víc zkušeností, jinak ti mé vìdomosti nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nauèit se: vytahovat drápy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Ukaž mi, jak dostanu drápy!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Je to v podstatì velmi jednoduché, pokud víš jak na to. Ohneš drápy dopøedu - nikdy ne dozadu - ale NESMÍŠ je vytahovat!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Drápy mùžeš dostat hlavnì z ještìrek. Teï už víš, z kterých pøíšer drápy brát.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahování drápù - ještìrka, chòapavec, èíhavec, kousavec, bøitvoun");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Potøebuješ víc zkušeností, jinak ti mé vìdomosti nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nauèit se: stahovat plazí kùži", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co musím dávat pozor, když stahuji plazí kùži?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Jediní plazi, kteøí jsou k tomuhle úèelu vhodní, jsou èíhavci a moèáloví žraloci.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Když naøízneš kùži po stranách, sloupne se sama. Teï už bys mìl umìt stahovat plazy.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahování plazù - èíhavec, moèálový žralok");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Potøebuješ víc zkušeností, jinak ti mé vìdomosti nebudou k nièemu.
			PrintScreen	("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Nejdøív chci vidìt nìjakou rudu. Jak jsem øekl: všechno má svou cenu!
	};
};
