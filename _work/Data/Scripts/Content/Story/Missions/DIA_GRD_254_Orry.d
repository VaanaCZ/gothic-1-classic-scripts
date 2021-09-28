// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Postaraj si� dotrze� do Starego Obozu w jednym kawa�ku!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Czym si� tutaj zajmujesz?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Czym si� tutaj zajmujesz?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Dbam o to, by nikt niepowo�any nie dosta� si� w pobli�e miejsca wymiany. Zw�aszcza ci bandyci z Nowego Obozu.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Hej, to ciebie dzi� zrzucili tutaj, co?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Zgadza si�.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //W takim razie uwa�aj na ludzi z Nowego Obozu!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Ja jestem ze Starego Obozu, tak jak wszyscy, kt�rych widzia�e� na miejscu wymiany.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Zak�adam, �e rozmawia�e� ju� z Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Nie.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Tak.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Wi�c zr�b to! On zajmuje si� wszystkimi nowoprzyby�ymi.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Od niego dowiesz si� wszystkiego co ��todzi�b wiedzie� powinien.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Tak, rozmawia�em.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //To dobrze. Zatem wiesz ju� mniej wi�cej co i jak.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Dlaczego mam uwa�a� na ludzi z Nowego Obozu?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Dlaczego mam uwa�a� na ludzi z Nowego Obozu?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //W por�wnaniu z Nowym Obozem, Stary Ob�z to ciche i przytulne miejsce!
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nowy Ob�z nie otrzymuje �adnych przesy�ek z zewn�trz. Te szkodniki po prostu kradn� wszystko, czego potrzebuj�.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "A Stary Ob�z?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Stary Ob�z?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Tutaj wszystkim rz�dz� Magnaci, handluj�cy rud�. Pod nimi s� Stra�nicy, a nast�pnie Cienie. Najni�sz� kast� stanowi� Kopacze.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Ka�dy, kto tu trafi, zaczyna jako Kopacz. Je�li masz wi�ksze ambicje, musisz zosta� przyj�ty do Cieni.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Robi� tak z wszystkimi nowymi. M�wi� na to "Chrzest Wody".
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Rozumiem. Czy w Starym Obozie jest wielu takich zawadiak�w?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Jest kilka czarnych owiec. Ale nie zrobi� ci krzywdy, je�li zap�acisz im za ochron�.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Widzia�em, jak spuszczano tutaj jak�� kobiet�."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Widzia�em, jak spuszczano tutaj jak�� kobiet�.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //C�, Magnaci dostaj� wszystko, czego zapragn�.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzie�, �e kr�l wymienia kobiety na rud�?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie one te� trafiaj� tutaj prosto z wi�zienia. Gdyby Gomez nie �ci�gn�� ich tutaj, dalej gni�yby w jakim� lochu.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Sam ju� nie wiem, co jest dla nich gorsze...
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Potrzebuj� broni..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Potrzebuj� broni...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Rozejrzyj si� troch� przy zamkni�tej kopalni, w g��bi kanionu. Na pewno co� tam znajdziesz.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Tylko nie wdawaj si� w powa�ne b�jki uzbrojony w g�upi kilof. To bardzo ci�ka i niepor�czna bro�.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Niedo�wiadczony wojownik powinien pos�ugiwa� si� nim tylko w ostateczno�ci.
	
};



