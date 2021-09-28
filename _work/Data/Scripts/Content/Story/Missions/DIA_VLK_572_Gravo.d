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
	description 	= "Co s�ycha�?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Odk�d rzuci�em robot� w kopalni, nie mog� narzeka�.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //A sk�d bierzesz �rodki na utrzymanie?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Pomagam ludziom w rozwi�zywaniu ich problem�w.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Je�li podpadniesz kt�remu� z wp�ywowych ludzi, zg�o� si� do mnie. Razem co� wymy�limy.
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
	description 	= "Gdybym mia� k�opoty TY m�g�by� mi pom�c? W jaki spos�b?";
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
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Gdybym mia� k�opoty, TY m�g�by� mi pom�c? W jaki spos�b?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //No za��my, �e nadepn��e� na odcisk Thorusowi. Lepiej nigdy nie w�azi� mu w drog�, ale wypadki si� zdarzaj�...
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus potrafi by� bardzo uparty. Jak raz si� na ciebie wkurzy, nie b�dzie chcia� zamieni� z tob� s�owa. A to ju� bardzo niedobrze.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Jako ��todzi�b, musisz go mie� po swojej stronie. Wi�c przychodzisz do mnie i m�wisz w czym rzecz. Znam tu wiele os�b, z kt�rych zdaniem liczy si� nawet Thorus.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Oni szepn� o tobie dobre s��wko i Thorus przestanie si� na ciebie boczy�. Oczywi�cie ch�opcy nie zrobi� tego za darmo. Takie przys�ugi kosztuj�.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //A ja pilnuj�, �eby ruda trafi�a do w�a�ciwych os�b...

	B_LogEntry(GE_TraderOC,"Kopacz Gravo oferuje przydatne us�ugi. Gdybym podpad� kiedy� wp�ywowym ludziom ze Starego Obozu, mam si� zg�osi� do niego.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Zgadza si�. Zagi�� na ciebie parol.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Poprosz� paru ludzi, �eby go troch� uspokoili. 100 bry�ek rudy i b�dzie po sprawie.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Zobaczmy ile tu masz... Tak, powinno wystarczy�. Mo�esz uzna� spraw� za nieby��.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Tylko nikomu ani s�owa. Zachowuj si�, jakby w og�le nic si� nie sta�o.
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
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //To maj� by� k�opoty? To jest cholerna katastrofa! Obawiam si�, �e on najch�tniej rozdar�by ci� na strz�py.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Spr�buj� przekona� paru ludzi, �eby si� za tob� wstawili, ale to nie b�dzie tanio kosztowa�. 500 bry�ek rudy, je�li nie wi�cej!
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Zobaczmy ile tu masz... Widz�, �e ci si� poszcz�ci�o. Wezm� te 500 bry�ek i spr�buj� to wszystko odkr�ci�.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //I pami�taj: nigdy, przenigdy nie wspominaj, �e pomog�em ci za�atwi� t� spraw�. Trzymaj j�zyk za z�bami. Zrozumiano?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Nie mam tyle przy sobie.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Przykro mi, ch�opcze, ale w takim razie nic nie mog� dla ciebie zrobi�.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Z tego co mi wiadomo, nie masz z nim �adnego zatargu.
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
	description 	= "Mo�esz mi pom�c? Chyba mam k�opoty.";
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
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Mo�esz mi pom�c? Chyba mam k�opoty.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Mog� spr�bowa�, ale uprzedzam - moja pomoc b�dzie ci� kosztowa�a od 100 do 500 bry�ek rudy!
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pom� mi z Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pom� mi z Thorusem.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Pom� mi z Gomezem.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Pom� mi z Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Pom� mi z Thorusem.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Pom� mi z Gomezem.
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
	description 	= "Mo�esz mi powiedzie�, kt�re Cienie nale�� do najbardziej wp�ywowych?";
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
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Mo�esz mi powiedzie�, kt�re Cienie nale�� do najbardziej wp�ywowych?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Chcesz mie� po swojej stronie najwa�niejszych ludzi, co?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Najpot�niejszym z Cieni jest Diego. Do jego zaufanych ludzi nale�� R�czka, �wistak i Z�y.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter i Fisk handluj� na targowisku. Maj� szerok� klientel�, w tym nawet Stra�nik�w, wi�c s� do�� wp�ywowi.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //No i jest jeszcze Scatty. On rz�dzi na arenie, organizuje walki i takie tam. Wielu ludzi jest mu winnych pieni�dze, wi�c on r�wnie� jest spor� szych�.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter i Fisk handluj� r�nymi dobrami na targowisku.");

	
};











