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
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Co jsem skonèil s prací v dole, nemùu si stìovat.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A odkud teï bereš rudu?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pomáhám lidem, kteøí mají problémy.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Jestli se tu dostaneš do problémù s vlivnımi lidmi, budu ti schopen nìjak pomoci.
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
	description 	= "Kdy budu v nesnázích, TY bys mi mohl pomoci? Jak?";
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
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Kdy budu v nesnázích, TY bys mi mohl pomoci? Jak?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No, øeknìme, e máš problém s Thorusem. Lepší bude, kdy se s ním do problému nikdy nedostaneš, ale jeden nikdy neví.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus dokáe bıt pìknì neústupnı - kdy se jednou na nìkoho naštve, u s ním nikdy nepromluví. A to je zlá vìc.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako zelenáè jsi na nìm závislı. Pak teda pøijdeš za mnou. Znám tady øadu lidí, kterım Thorus naslouchá.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Ztratí u nìj za tebe slovo a Thorus bude zase kamarád. Ti hoši však pochopitelnì za tenhle druh laskavosti chtìjí vidìt nìjakou rudu. Tvoji rudu.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A já se starám, aby se ta ruda dostala do správnıch rukou...

	B_LogEntry(GE_TraderOC,"Kopáè Gravo poskytuje zvláštní sluby. Pokud se v táboøe dostanu do konfliktu s dùleitımi lidmi, mùu mu zaplatit za to, e vše urovná.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Pravda je, e jsi zapsanı v jeho špatnıch knihách.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Budu muset promluvit s pár lidma. 100 nugetù a já se o ten problém postarám.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Uka, kolik máš... Ach! To by mìlo staèit. Mùeš ten problém povaovat za vyøešenı.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //A nikomu o tom neøíkej. Dìlej, jako by se nic nestalo.
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
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Tomu øíkáš nesnáz? To je skromné oznaèení. Myslím, e by tì za to nejradìji roztrhal na kousky, hochu.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Jestli mám nìjaké lidi pøesvìdèit, aby ho zase uklidnili, tak to nebude vùbec levné. Bude tì to stát aspoò 500 nugetù.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Podívejme, co to tady máš... zdá se, e jsi boháè. Vezmu si tìch 500 nugetù a smetem tu záleitost ze stolu.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //A pamatuj: nikdo a se nedozví, e jsem se o ten problém postaral já - take to nikomu neøíkej, rozumíš?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nemám tolik.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Pak pro tebe nebudu moci nic udìlat - je mi líto, chlapèe.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Co já vím, tak s tebou nemá problém - nemìj obavy.
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
	description 	= "Mùeš mi pomoci - myslím, e mám problém.";
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
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Mùeš mi pomoci - myslím, e mám problém.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Taky myslím, ale varuju tì, mùe tì to stát 100 a 500 nugetù.
	
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
	description 	= "Mùeš mi øíci, kterı ze Stínù tady patøí k vlivnım lidem?";
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
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Mùeš mi øíci, kterı ze Stínù tady patøí k vlivnım lidem?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chceš udìlat dojem na správné lidi, viï?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego má ze Stínù nejvìtší moc. Vìøí Fingersovi, Whistlerovi a Slyovi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter a Fisk prodávají své zboí na trhovém námìstí. Mají spousty zákazníkù, dokonce i mezi stráemi, a to z nich dìlá dùleité osoby.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //A pak je tu Scatty. Ten má na starosti arénu a rozhoduje, kdo bude bojovat a tak. Spousta lidí mu dluí rudu - je teda dost dùleitı.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter a Fisk obchodují na trišti s rùznım zboím.");

	
};











