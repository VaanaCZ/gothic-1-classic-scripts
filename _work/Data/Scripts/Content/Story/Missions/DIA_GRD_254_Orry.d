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
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Postaraj siê dotrzeæ do Starego Obozu w jednym kawa³ku!
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
	description		= "Czym siê tutaj zajmujesz?"; 
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
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Dbam o to, by nikt niepowo³any nie dosta³ siê w pobli¿e miejsca wymiany. Zw³aszcza ci bandyci z Nowego Obozu.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Hej, to ciebie dziœ zrzucili tutaj, co?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Zgadza siê.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //W takim razie uwa¿aj na ludzi z Nowego Obozu!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Ja jestem ze Starego Obozu, tak jak wszyscy, których widzia³eœ na miejscu wymiany.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Zak³adam, ¿e rozmawia³eœ ju¿ z Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Nie.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Tak.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Wiêc zrób to! On zajmuje siê wszystkimi nowoprzyby³ymi.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Od niego dowiesz siê wszystkiego co ¿ó³todziób wiedzieæ powinien.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Tak, rozmawia³em.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //To dobrze. Zatem wiesz ju¿ mniej wiêcej co i jak.
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
	description		= "Dlaczego mam uwa¿aæ na ludzi z Nowego Obozu?"; 
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
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Dlaczego mam uwa¿aæ na ludzi z Nowego Obozu?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //W porównaniu z Nowym Obozem, Stary Obóz to ciche i przytulne miejsce!
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nowy Obóz nie otrzymuje ¿adnych przesy³ek z zewn¹trz. Te szkodniki po prostu kradn¹ wszystko, czego potrzebuj¹.
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
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Tutaj wszystkim rz¹dz¹ Magnaci, handluj¹cy rud¹. Pod nimi s¹ Stra¿nicy, a nastêpnie Cienie. Najni¿sz¹ kastê stanowi¹ Kopacze.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Ka¿dy, kto tu trafi, zaczyna jako Kopacz. Jeœli masz wiêksze ambicje, musisz zostaæ przyjêty do Cieni.
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
	description		= "Kiedy tutaj wyl¹dowa³em, jeden z waszych uderzy³ mnie w twarz."; 
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
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kiedy tutaj wyl¹dowa³em, jeden z waszych uderzy³ mnie w twarz.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Robi¹ tak z wszystkimi nowymi. Mówi¹ na to "Chrzest Wody".
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Rozumiem. Czy w Starym Obozie jest wielu takich zawadiaków?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Jest kilka czarnych owiec. Ale nie zrobi¹ ci krzywdy, jeœli zap³acisz im za ochronê.
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
	description		= "Widzia³em, jak spuszczano tutaj jak¹œ kobietê."; 
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
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Widzia³em, jak spuszczano tutaj jak¹œ kobietê.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Có¿, Magnaci dostaj¹ wszystko, czego zapragn¹.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzieæ, ¿e król wymienia kobiety na rudê?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie one te¿ trafiaj¹ tutaj prosto z wiêzienia. Gdyby Gomez nie œci¹gn¹³ ich tutaj, dalej gni³yby w jakimœ lochu.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Sam ju¿ nie wiem, co jest dla nich gorsze...
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
	description		= "Potrzebujê broni..."; 
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
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Potrzebujê broni...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Rozejrzyj siê trochê przy zamkniêtej kopalni, w g³êbi kanionu. Na pewno coœ tam znajdziesz.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Tylko nie wdawaj siê w powa¿ne bójki uzbrojony w g³upi kilof. To bardzo ciê¿ka i nieporêczna broñ.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Niedoœwiadczony wojownik powinien pos³ugiwaæ siê nim tylko w ostatecznoœci.
	
};



