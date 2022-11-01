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
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Co jsem skončil s prací v dole, nemůžu si stěžovat.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A odkud teď bereš rudu?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pomáhám lidem, kteří mají problémy.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Jestli se tu dostaneš do problémů s vlivnými lidmi, budu ti schopen nějak pomoci.
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
	description 	= "Když budu v nesnázích, TY bys mi mohl pomoci? Jak?";
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
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Když budu v nesnázích, TY bys mi mohl pomoci? Jak?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No, řekněme, že máš problém s Thorusem. Lepší bude, když se s ním do problému nikdy nedostaneš, ale jeden nikdy neví.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus dokáže být pěkně neústupný - když se jednou na někoho naštve, už s ním nikdy nepromluví. A to je zlá věc.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako zelenáč jsi na něm závislý. Pak teda přijdeš za mnou. Znám tady řadu lidí, kterým Thorus naslouchá.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Ztratí u něj za tebe slovo a Thorus bude zase kamarád. Ti hoši však pochopitelně za tenhle druh laskavosti chtějí vidět nějakou rudu. Tvoji rudu.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A já se starám, aby se ta ruda dostala do správných rukou...

	B_LogEntry(GE_TraderOC,"Kopáč Gravo poskytuje zvláštní služby. Pokud se v táboře dostanu do konfliktu s důležitými lidmi, můžu mu zaplatit za to, že vše urovná.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Pravda je, že jsi zapsaný v jeho špatných knihách.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Budu muset promluvit s pár lidma. 100 nugetů a já se o ten problém postarám.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Ukaž, kolik máš... Ach! To by mělo stačit. Můžeš ten problém považovat za vyřešený.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //A nikomu o tom neříkej. Dělej, jako by se nic nestalo.
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
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Tomu říkáš nesnáz? To je skromné označení. Myslím, že by tě za to nejraději roztrhal na kousky, hochu.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Jestli mám nějaké lidi přesvědčit, aby ho zase uklidnili, tak to nebude vůbec levné. Bude tě to stát aspoň 500 nugetů.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Podívejme, co to tady máš... zdá se, že jsi boháč. Vezmu si těch 500 nugetů a smetem tu záležitost ze stolu.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //A pamatuj: nikdo ať se nedozví, že jsem se o ten problém postaral já - takže to nikomu neříkej, rozumíš?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nemám tolik.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Pak pro tebe nebudu moci nic udělat - je mi líto, chlapče.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Co já vím, tak s tebou nemá problém - neměj obavy.
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
	description 	= "Můžeš mi pomoci - myslím, že mám problém.";
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
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Můžeš mi pomoci - myslím, že mám problém.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Taky myslím, ale varuju tě, může tě to stát 100 až 500 nugetů.
	
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
	description 	= "Můžeš mi říci, který ze Stínů tady patří k vlivným lidem?";
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
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Můžeš mi říci, který ze Stínů tady patří k vlivným lidem?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chceš udělat dojem na správné lidi, viď?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego má ze Stínů největší moc. Věří Fingersovi, Whistlerovi a Slyovi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter a Fisk prodávají své zboží na trhovém náměstí. Mají spousty zákazníků, dokonce i mezi strážemi, a to z nich dělá důležité osoby.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //A pak je tu Scatty. Ten má na starosti arénu a rozhoduje, kdo bude bojovat a tak. Spousta lidí mu dluží rudu - je teda dost důležitý.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter a Fisk obchodují na tržišti s různým zbožím.");

	
};











