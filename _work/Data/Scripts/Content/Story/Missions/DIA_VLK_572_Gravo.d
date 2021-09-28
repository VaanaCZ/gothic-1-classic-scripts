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
	description 	= "Co s³ychaæ?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Odk¹d rzuci³em robotê w kopalni, nie mogê narzekaæ.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A sk¹d bierzesz œrodki na utrzymanie?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pomagam ludziom w rozwi¹zywaniu ich problemów.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Jeœli podpadniesz któremuœ z wp³ywowych ludzi, zg³oœ siê do mnie. Razem coœ wymyœlimy.
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
	description 	= "Gdybym mia³ k³opoty TY móg³byœ mi pomóc? W jaki sposób?";
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
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Gdybym mia³ k³opoty, TY móg³byœ mi pomóc? W jaki sposób?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No za³ó¿my, ¿e nadepn¹³eœ na odcisk Thorusowi. Lepiej nigdy nie w³aziæ mu w drogê, ale wypadki siê zdarzaj¹...
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus potrafi byæ bardzo uparty. Jak raz siê na ciebie wkurzy, nie bêdzie chcia³ zamieniæ z tob¹ s³owa. A to ju¿ bardzo niedobrze.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako ¿ó³todziób, musisz go mieæ po swojej stronie. Wiêc przychodzisz do mnie i mówisz w czym rzecz. Znam tu wiele osób, z których zdaniem liczy siê nawet Thorus.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Oni szepn¹ o tobie dobre s³ówko i Thorus przestanie siê na ciebie boczyæ. Oczywiœcie ch³opcy nie zrobi¹ tego za darmo. Takie przys³ugi kosztuj¹.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A ja pilnujê, ¿eby ruda trafi³a do w³aœciwych osób...

	B_LogEntry(GE_TraderOC,"Kopacz Gravo oferuje przydatne us³ugi. Gdybym podpad³ kiedyœ wp³ywowym ludziom ze Starego Obozu, mam siê zg³osiæ do niego.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Zgadza siê. Zagi¹³ na ciebie parol.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Poproszê paru ludzi, ¿eby go trochê uspokoili. 100 bry³ek rudy i bêdzie po sprawie.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Zobaczmy ile tu masz... Tak, powinno wystarczyæ. Mo¿esz uznaæ sprawê za nieby³¹.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Tylko nikomu ani s³owa. Zachowuj siê, jakby w ogóle nic siê nie sta³o.
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
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //To maj¹ byæ k³opoty? To jest cholerna katastrofa! Obawiam siê, ¿e on najchêtniej rozdar³by ciê na strzêpy.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Spróbujê przekonaæ paru ludzi, ¿eby siê za tob¹ wstawili, ale to nie bêdzie tanio kosztowaæ. 500 bry³ek rudy, jeœli nie wiêcej!
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Zobaczmy ile tu masz... Widzê, ¿e ci siê poszczêœci³o. Wezmê te 500 bry³ek i spróbujê to wszystko odkrêciæ.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //I pamiêtaj: nigdy, przenigdy nie wspominaj, ¿e pomog³em ci za³atwiæ tê sprawê. Trzymaj jêzyk za zêbami. Zrozumiano?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nie mam tyle przy sobie.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Przykro mi, ch³opcze, ale w takim razie nic nie mogê dla ciebie zrobiæ.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Z tego co mi wiadomo, nie masz z nim ¿adnego zatargu.
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
	description 	= "Mo¿esz mi pomóc? Chyba mam k³opoty.";
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
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Mo¿esz mi pomóc? Chyba mam k³opoty.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Mogê spróbowaæ, ale uprzedzam - moja pomoc bêdzie ciê kosztowa³a od 100 do 500 bry³ek rudy!
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomó¿ mi z Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomó¿ mi z Thorusem.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pomó¿ mi z Gomezem.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Pomó¿ mi z Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Pomó¿ mi z Thorusem.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Pomó¿ mi z Gomezem.
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
	description 	= "Mo¿esz mi powiedzieæ, które Cienie nale¿¹ do najbardziej wp³ywowych?";
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
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Mo¿esz mi powiedzieæ, które Cienie nale¿¹ do najbardziej wp³ywowych?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chcesz mieæ po swojej stronie najwa¿niejszych ludzi, co?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Najpotê¿niejszym z Cieni jest Diego. Do jego zaufanych ludzi nale¿¹ R¹czka, Œwistak i Z³y.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter i Fisk handluj¹ na targowisku. Maj¹ szerok¹ klientelê, w tym nawet Stra¿ników, wiêc s¹ doœæ wp³ywowi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //No i jest jeszcze Scatty. On rz¹dzi na arenie, organizuje walki i takie tam. Wielu ludzi jest mu winnych pieni¹dze, wiêc on równie¿ jest spor¹ szych¹.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter i Fisk handluj¹ ró¿nymi dobrami na targowisku.");

	
};











