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
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Je všechno v poøádku, pøíteli?",DIA_BaalNamib_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Spáè buï s tebou!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"Zdar! Jsem tu nový!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //Zdar! Jsem tu nový!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Hi_02_01"); //(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //Spáè buï s tebou!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Sleeper_02_01"); //(vzdech)
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //Je všechno v poøádku, pøíteli?
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Imp_02_01"); //(vzdech)
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
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_00"); //(vzdech)
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_01"); //Spáè si tì vyvolil. Chceš se k nám opravdu pøidat?

	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"NEØÍKEJ NIC",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"Ano, chci následovat Spáèe!",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output (other, self,"DIA_BaalNamib_FirstTalk_Mute_15_00"); //(vzdech)
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //Všechno v poøádku?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output 			(other, self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Ano, chci následovat Spáèe!
	AI_Output 			(self, other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //Jdi za Corem Kalomem. Øekni mu, že jsem tì vyslal, protože jsi opravdový služebník víry!
	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);

	B_LogEntry			(CH1_JoinPsi,"Lesterùv scénáø zapracoval. Baal Namib se mnou promluvil a je pøesvìdèený, že jsem opravdovì vìøící. Nyní mùžu jít navštívit guru Cora Kaloma do jeho alchymistické dílny!");
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
	description		= "Rád bych lepší zbroj."; 
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
	AI_Output (hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//Rád bych lepší zbroj.
	
	if (Kapitel < 3)
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");//Ještì nepøišel èas, abys oblékl tìžkou zbroj novice.
	}
	else if (Npc_HasItems (hero, ItMinugget) < VALUE_NOV_ARMOR_H )
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Vra se, až budeš mít dost rudy.
	}
	else
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//Tahle zbroj ochrání tvoje tìlo, tak jako Spáè ochrání tvoji duši!
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
	description = "Mùžu pro Bratrstvo vykonat nìjaké úkoly?";
};

FUNC INT Info_BaalNamib_BROTHERHOOD_Condition()
{
//	return (kapitel == 2) ;
};

FUNC VOID Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_15_01"); //Mùžu pro Bratrstvo vykonat nìjaké úkoly?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Náš mistr, moudrý Y´Berion, nechal poslat pro novice. Protože jsi nyní èlenem komunity, jdi za ním a nabídni mu své služby. 
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Dobrá, pùjdu za ním hned.",Info_BaalNamib_BROTHERHOOD_OK);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Kde najdu Y´Beriona?",Info_BaalNamib_BROTHERHOOD_YBWO);  
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Víš, co ode mì Y´Berion chce?",Info_BaalNamib_BROTHERHOOD_YBWAS);
	var C_NPC Kalom;
	Kalom = Hlp_GetNpc (GUR_1201_CORKALOM); 
	Npc_ExchangeRoutine (Kalom,"kapitel2");
	AI_ContinueRoutine (Kalom);
};
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Kde najdu Y´Beriona?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Je v chrámu, jako vždy.

};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Víš, co ode mì Y´Berion chce?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Bude se konat velké vzývání. Aby ale mohlo zaèít, potøebujeme jeden magický pøedmìt. 
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y´Berion hledá odvážné muže, kteøí by mu ten artefakt opatøili.
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //To zní jako snadný úkol.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Kdyby to bylo snadné, už bysme ten pøedmìt mìli. Promluv si nejdøíve s Y´Berionem. Všechno ti vysvìtlí.
};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_OK()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //Dobrá, hned mu øeknu.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Kéž tì Spáè ochrání!
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
};	
