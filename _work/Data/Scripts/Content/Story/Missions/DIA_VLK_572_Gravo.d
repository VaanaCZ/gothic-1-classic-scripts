// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "Jak to jde?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Jak to jde?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Co jsem skon�il s prac� v dole, nem��u si st�ovat.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A odkud te� bere� rudu?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pom�h�m lidem, kte�� maj� probl�my.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Jestli se tu dostane� do probl�m� s vlivn�mi lidmi, budu ti schopen n�jak pomoci.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "Kdy� budu v nesn�z�ch, TY bys mi mohl pomoci? Jak?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Kdy� budu v nesn�z�ch, TY bys mi mohl pomoci? Jak?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No, �ekn�me, �e m� probl�m s Thorusem. Lep�� bude, kdy� se s n�m do probl�mu nikdy nedostane�, ale jeden nikdy nev�.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus dok�e b�t p�kn� ne�stupn� - kdy� se jednou na n�koho na�tve, u� s n�m nikdy nepromluv�. A to je zl� v�c.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako zelen�� jsi na n�m z�visl�. Pak teda p�ijde� za mnou. Zn�m tady �adu lid�, kter�m Thorus naslouch�.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Ztrat� u n�j za tebe slovo a Thorus bude zase kamar�d. Ti ho�i v�ak pochopiteln� za tenhle druh laskavosti cht�j� vid�t n�jakou rudu. Tvoji rudu.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A j� se star�m, aby se ta ruda dostala do spr�vn�ch rukou...

	B_LogEntry(GE_TraderOC,"Kop�� Gravo poskytuje zvl�tn� slu�by. Pokud se v t�bo�e dostanu do konfliktu s d�le�it�mi lidmi, m��u mu zaplatit za to, �e v�e urovn�.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Pravda je, �e jsi zapsan� v jeho �patn�ch knih�ch.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Budu muset promluvit s p�r lidma. 100 nuget� a j� se o ten probl�m postar�m.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Uka�, kolik m�... Ach! To by m�lo sta�it. M��e� ten probl�m pova�ovat za vy�e�en�.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //A nikomu o tom ne��kej. D�lej, jako by se nic nestalo.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //I don't have that much.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Then I can't do anything for you - I'm sorry, boy.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Tomu ��k� nesn�z? To je skromn� ozna�en�. Mysl�m, �e by t� za to nejrad�ji roztrhal na kousky, hochu.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Jestli m�m n�jak� lidi p�esv�d�it, aby ho zase uklidnili, tak to nebude v�bec levn�. Bude t� to st�t aspo� 500 nuget�.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Pod�vejme, co to tady m�... zd� se, �e jsi boh��. Vezmu si t�ch 500 nuget� a smetem tu z�le�itost ze stolu.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //A pamatuj: nikdo a� se nedozv�, �e jsem se o ten probl�m postaral j� - tak�e to nikomu ne��kej, rozum�?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nem�m tolik.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Pak pro tebe nebudu moci nic ud�lat - je mi l�to, chlap�e.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Co j� v�m, tak s tebou nem� probl�m - nem�j obavy.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "M��e� mi pomoci - mysl�m, �e m�m probl�m.";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //M��e� mi pomoci - mysl�m, �e m�m probl�m.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Taky mysl�m, ale varuju t�, m��e t� to st�t 100 a� 500 nuget�.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomoz mi s Diegem.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomoz mi s Thorusem.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomoz mi s Gomezem.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Pomoz mi s Diegem.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Pomoz mi s Thorusem.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Pomoz mi s Gomezem.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 1;
	description 	= "M��e� mi ��ci, kter� ze St�n� tady pat�� k vlivn�m lidem?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //M��e� mi ��ci, kter� ze St�n� tady pat�� k vlivn�m lidem?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chce� ud�lat dojem na spr�vn� lidi, vi�?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego m� ze St�n� nejv�t�� moc. V��� Fingersovi, Whistlerovi a Slyovi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter a Fisk prod�vaj� sv� zbo�� na trhov�m n�m�st�. Maj� spousty z�kazn�k�, dokonce i mezi str�emi, a to z nich d�l� d�le�it� osoby.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //A pak je tu Scatty. Ten m� na starosti ar�nu a rozhoduje, kdo bude bojovat a tak. Spousta lid� mu dlu�� rudu - je teda dost d�le�it�.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter a Fisk obchoduj� na tr�i�ti s r�zn�m zbo��m.");

	
};











