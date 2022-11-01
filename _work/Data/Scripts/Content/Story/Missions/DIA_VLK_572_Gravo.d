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
	description 	= "Co słychać?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Co słychać?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Odkąd rzuciłem robotę w kopalni, nie mogę narzekać.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A skąd bierzesz środki na utrzymanie?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pomagam ludziom w rozwiązywaniu ich problemów.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Jeśli podpadniesz któremuś z wpływowych ludzi, zgłoś się do mnie. Razem coś wymyślimy.
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
	description 	= "Gdybym miał kłopoty TY mógłbyś mi pomóc? W jaki sposób?";
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
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Gdybym miał kłopoty, TY mógłbyś mi pomóc? W jaki sposób?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No załóżmy, że nadepnąłeś na odcisk Thorusowi. Lepiej nigdy nie włazić mu w drogę, ale wypadki się zdarzają...
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus potrafi być bardzo uparty. Jak raz się na ciebie wkurzy, nie będzie chciał zamienić z tobą słowa. A to już bardzo niedobrze.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako żółtodziób, musisz go mieć po swojej stronie. Więc przychodzisz do mnie i mówisz w czym rzecz. Znam tu wiele osób, z których zdaniem liczy się nawet Thorus.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Oni szepną o tobie dobre słówko i Thorus przestanie się na ciebie boczyć. Oczywiście chłopcy nie zrobią tego za darmo. Takie przysługi kosztują.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A ja pilnuję, żeby ruda trafiła do właściwych osób...

	B_LogEntry(GE_TraderOC,"Kopacz Gravo oferuje przydatne usługi. Gdybym podpadł kiedyś wpływowym ludziom ze Starego Obozu, mam się zgłosić do niego.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Zgadza się. Zagiął na ciebie parol.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Poproszę paru ludzi, żeby go trochę uspokoili. 100 bryłek rudy i będzie po sprawie.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Zobaczmy ile tu masz... Tak, powinno wystarczyć. Możesz uznać sprawę za niebyłą.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Tylko nikomu ani słowa. Zachowuj się, jakby w ogóle nic się nie stało.
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
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //To mają być kłopoty? To jest cholerna katastrofa! Obawiam się, że on najchętniej rozdarłby cię na strzępy.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Spróbuję przekonać paru ludzi, żeby się za tobą wstawili, ale to nie będzie tanio kosztować. 500 bryłek rudy, jeśli nie więcej!
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Zobaczmy ile tu masz... Widzę, że ci się poszczęściło. Wezmę te 500 bryłek i spróbuję to wszystko odkręcić.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //I pamiętaj: nigdy, przenigdy nie wspominaj, że pomogłem ci załatwić tę sprawę. Trzymaj język za zębami. Zrozumiano?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nie mam tyle przy sobie.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Przykro mi, chłopcze, ale w takim razie nic nie mogę dla ciebie zrobić.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Z tego co mi wiadomo, nie masz z nim żadnego zatargu.
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
	description 	= "Możesz mi pomóc? Chyba mam kłopoty.";
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
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Możesz mi pomóc? Chyba mam kłopoty.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Mogę spróbować, ale uprzedzam - moja pomoc będzie cię kosztowała od 100 do 500 bryłek rudy!
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomóż mi z Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomóż mi z Thorusem.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomóż mi z Gomezem.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Pomóż mi z Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Pomóż mi z Thorusem.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Pomóż mi z Gomezem.
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
	description 	= "Możesz mi powiedzieć, które Cienie należą do najbardziej wpływowych?";
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
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Możesz mi powiedzieć, które Cienie należą do najbardziej wpływowych?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chcesz mieć po swojej stronie najważniejszych ludzi, co?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Najpotężniejszym z Cieni jest Diego. Do jego zaufanych ludzi należą Rączka, Świstak i Zły.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter i Fisk handlują na targowisku. Mają szeroką klientelę, w tym nawet Strażników, więc są dość wpływowi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //No i jest jeszcze Scatty. On rządzi na arenie, organizuje walki i takie tam. Wielu ludzi jest mu winnych pieniądze, więc on również jest sporą szychą.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter i Fisk handlują różnymi dobrami na targowisku.");

	
};











