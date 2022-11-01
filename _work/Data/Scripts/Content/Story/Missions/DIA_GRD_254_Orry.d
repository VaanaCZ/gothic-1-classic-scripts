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
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Postaraj się dotrzeć do Starego Obozu w jednym kawałku!
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
	description		= "Czym się tutaj zajmujesz?"; 
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
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Czym się tutaj zajmujesz?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Dbam o to, by nikt niepowołany nie dostał się w pobliże miejsca wymiany. Zwłaszcza ci bandyci z Nowego Obozu.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Hej, to ciebie dziś zrzucili tutaj, co?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Zgadza się.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //W takim razie uważaj na ludzi z Nowego Obozu!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Ja jestem ze Starego Obozu, tak jak wszyscy, których widziałeś na miejscu wymiany.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Zakładam, że rozmawiałeś już z Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Nie.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Tak.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Więc zrób to! On zajmuje się wszystkimi nowoprzybyłymi.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Od niego dowiesz się wszystkiego co żółtodziób wiedzieć powinien.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Tak, rozmawiałem.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //To dobrze. Zatem wiesz już mniej więcej co i jak.
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
	description		= "Dlaczego mam uważać na ludzi z Nowego Obozu?"; 
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
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Dlaczego mam uważać na ludzi z Nowego Obozu?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //W porównaniu z Nowym Obozem, Stary Obóz to ciche i przytulne miejsce!
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nowy Obóz nie otrzymuje żadnych przesyłek z zewnątrz. Te szkodniki po prostu kradną wszystko, czego potrzebują.
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
	description		= "A Stary Obóz?"; 
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
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Stary Obóz?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Tutaj wszystkim rządzą Magnaci, handlujący rudą. Pod nimi są Strażnicy, a następnie Cienie. Najniższą kastę stanowią Kopacze.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Każdy, kto tu trafi, zaczyna jako Kopacz. Jeśli masz większe ambicje, musisz zostać przyjęty do Cieni.
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
	description		= "Kiedy tutaj wylądowałem, jeden z waszych uderzył mnie w twarz."; 
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
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kiedy tutaj wylądowałem, jeden z waszych uderzył mnie w twarz.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Robią tak z wszystkimi nowymi. Mówią na to "Chrzest Wody".
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Rozumiem. Czy w Starym Obozie jest wielu takich zawadiaków?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Jest kilka czarnych owiec. Ale nie zrobią ci krzywdy, jeśli zapłacisz im za ochronę.
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
	description		= "Widziałem, jak spuszczano tutaj jakąś kobietę."; 
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
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Widziałem, jak spuszczano tutaj jakąś kobietę.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Cóż, Magnaci dostają wszystko, czego zapragną.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzieć, że król wymienia kobiety na rudę?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie one też trafiają tutaj prosto z więzienia. Gdyby Gomez nie ściągnął ich tutaj, dalej gniłyby w jakimś lochu.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Sam już nie wiem, co jest dla nich gorsze...
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
	description		= "Potrzebuję broni..."; 
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
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Potrzebuję broni...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Rozejrzyj się trochę przy zamkniętej kopalni, w głębi kanionu. Na pewno coś tam znajdziesz.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Tylko nie wdawaj się w poważne bójki uzbrojony w głupi kilof. To bardzo ciężka i nieporęczna broń.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Niedoświadczony wojownik powinien posługiwać się nim tylko w ostateczności.
	
};



