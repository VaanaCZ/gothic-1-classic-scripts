// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE DIA_BaalNamib_EXIT(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 999;
	condition		= DIA_BaalNamib_EXIT_Condition;
	information		= DIA_BaalNamib_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalNamib_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger) 
// ************************************************************
// ************************************************************

INSTANCE DIA_BaalNamib_NoTalk(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 1;
	condition		= DIA_BaalNamib_NoTalk_Condition;
	information		= DIA_BaalNamib_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalNamib_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalNamib_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalNamib_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalNamib_NoTalk);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,DIALOG_ENDE					,DIA_BaalNamib_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Wszystko w porz¹dku, kolego?",DIA_BaalNamib_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Niech Œni¹cy bêdzie z tob¹!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Czeœæ! Jestem tu nowy!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Hi_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //Niech Œni¹cy bêdzie z tob¹!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Sleeper_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //Wszystko w porz¹dku, kolego?
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Imp_02_01"); //(Wzdycha)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					BN spricht dich an
// ************************************************************

INSTANCE DIA_BaalNamib_FirstTalk(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 1;
	condition		= DIA_BaalNamib_FirstTalk_Condition;
	information		= DIA_BaalNamib_FirstTalk_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT DIA_BaalNamib_FirstTalk_Condition()
{
	if (BaalNamib_Ansprechbar==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalNamib_FirstTalk_Info()
{	
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_00"); //(Wzdycha)
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_01"); //Zosta³eœ wybrany przez Œni¹cego. Czy twoim ¿yczeniem naprawdê jest do³¹czyæ do nas?

	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"NIC NIE MÓW.",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"Tak, chcê pod¹¿aæ drog¹ Œni¹cego!",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output (other, self,"DIA_BaalNamib_FirstTalk_Mute_15_00"); //(Wzdycha)
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //Co takiego?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output 			(other, self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Tak, chcê pod¹¿aæ drog¹ Œni¹cego!
	AI_Output 			(self, other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //IdŸ do Cor Kaloma. Powiedz mu, ¿e przysy³am ciê do niego, bo widzê, i¿ twoja wiara jest szczera!
	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);

	B_LogEntry			(CH1_JoinPsi,"Zaaran¿owane przez Lestera przedstawienie zdzia³a³o cuda. Baal Namib przemówi³ do mnie i da³ siê przekonaæ, ¿e jestem prawdziwym wyznawc¹ kultu Œni¹cego. Teraz mam siê udaæ do laboratorium alchemicznego Cor Kaloma!");
	B_GiveXP			(XP_ImpressBaalNamib);
};

//-----------------------------------------------------
// BESSERE RÜSTUNG NOVIZEN
//-----------------------------------------------------
instance  GUR_1204_BaalNamib_ARMOR (C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	condition		= GUR_1204_BaalNamib_ARMOR_Condition;
	information		= GUR_1204_BaalNamib_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia³bym otrzymaæ lepsz¹ zbrojê."; 
};

FUNC int  GUR_1204_BaalNamib_ARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NOV)
	&& (!Npc_HasItems (hero,NOV_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  GUR_1204_BaalNamib_ARMOR_Info()
{
	AI_Output (hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//Chcia³bym otrzymaæ lepsz¹ zbrojê.
	
	if (Kapitel < 3)
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");//Minie jeszcze trochê czasu, zanim dane ci bêdzie nosiæ ciê¿k¹ zbrojê Nowicjusza.
	}
	else if (Npc_HasItems (hero, ItMinugget) < VALUE_NOV_ARMOR_H )
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Wróæ, gdy uzbierasz trochê wiêcej rudy.
	}
	else
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//Ta zbroja chroniæ bêdzie twoje cia³o, tak jak Œni¹cy chroni twoj¹ duszê!
		CreateInvItem (self,NOV_ARMOR_H);
		B_GiveInvItems (self, hero, NOV_ARMOR_H, 1);
		B_GiveInvItems (hero, self, ItMinugget,VALUE_NOV_ARMOR_H);
	};
};  

////////////////////////////////////////
////////////////////////////////////////
/////////		Kap 2			////////
////////////////////////////////////////
////////////////////////////////////////

// **************************************************************************
//					BAAL NAMIB SCHICKT DEN SPIELER ZU YBERION 
// **************************************************************************
INSTANCE Info_BaalNamib_BROTHERHOOD (C_INFO)
{
	npc			= GUR_1204_BaalNamib;
	condition	= Info_BaalNamib_BROTHERHOOD_Condition;
	information	= Info_BaalNamib_BROTHERHOOD_Info;
	important	= 0;
	permanent	= 0;
	description = "Czy s¹ jakieœ zadania, których móg³bym siê podj¹æ?";
};

FUNC INT Info_BaalNamib_BROTHERHOOD_Condition()
{
//	return (kapitel == 2) ;
};

FUNC VOID Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_15_01"); //Czy s¹ jakieœ zadania, których móg³bym siê podj¹æ?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Nasz mistrz, m¹dry Y'Berion, kaza³ sobie przys³aæ Nowicjusza. Jako ¿e jesteœ teraz jednym z nas, mo¿esz iœæ do niego i zaoferowaæ swoje us³ugi. 
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"W porz¹dku. Zajrzê do niego natychmiast.",Info_BaalNamib_BROTHERHOOD_OK);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Gdzie znajdê Y'Beriona?",Info_BaalNamib_BROTHERHOOD_YBWO);  
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Wiesz mo¿e jakie zadanie ma dla mnie Y'Berion?",Info_BaalNamib_BROTHERHOOD_YBWAS);
	var C_NPC Kalom;
	Kalom = Hlp_GetNpc (GUR_1201_CORKALOM); 
	Npc_ExchangeRoutine (Kalom,"kapitel2");
	AI_ContinueRoutine (Kalom);
};
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Gdzie znajdê Y'Beriona?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Jego siedziba znajduje siê pod œwi¹tynnym wzgórzem.

};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Wiesz mo¿e jakie zadanie ma dla mnie Y'Berion?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Aby dosz³o do wielkiego przyzwania musimy najpierw zdobyæ pewien magiczny artefakt. 
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion poszukuje œmia³ka, który zechce siê podj¹æ tego zadania.
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //To nie wydaje siê zbyt trudne.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Gdyby by³o ³atwe, ju¿ dawno mielibyœmy ten artefakt w naszym obozie. Porozmawiaj z Y'Berionem. On ci wszystko wyjaœni.
};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_OK()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //W porz¹dku. Zajrzê do niego natychmiast.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Niech Œni¹cy bêdzie z tob¹!
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
};	
