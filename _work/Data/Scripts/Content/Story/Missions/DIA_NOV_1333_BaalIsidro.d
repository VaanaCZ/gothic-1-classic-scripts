// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalIsidro_EXIT(C_INFO)
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 999;
	condition	= DIA_BaalIsidro_EXIT_Condition;
	information	= DIA_BaalIsidro_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalIsidro_Hello(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Hello_Condition;
	information	= DIA_BaalIsidro_Hello_Info;
	permanent	= 0;
	description = "Nevypadáš pøíliš spokojenì.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Nevypadáš moc šastnì.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Také nejsem!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Potøebuju se zbavit celé hromady drogy.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //Ty tady máš prodávat zboží ze Sektovního tábora?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Ano. Ale právì se nemùžu vzchopit.
};

// ************************************************************
// 					 	TRADE
// ************************************************************

INSTANCE DIA_BaalIsidro_TRADE(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 800;
	condition	= DIA_BaalIsidro_TRADE_Condition;
	information	= DIA_BaalIsidro_TRADE_Info;
	permanent	= 1;
	description = "Ukaž, co máš.";
	trade 		= 1;
};                       

FUNC INT DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_TRADE_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Ukaž, co máš.
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Tady...
};

// ************************************************************
// 					 Ich verkaufe für dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Mohl bych ti prodat drogu - samozøejmì po dohodì.";
};                       

FUNC INT DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Mohl bych ti prodat drogu - samozøejmì po dohodì.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Zapomeò na to - nejsem vùbec tak opilý. Mìl by ses s tím ztratit.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Novic Baal Isidro se celý den motá v baru na jezeøe a popíjí. Mìl by prodávat svùj díl drogy, ale nedbá na to. Snad bych ho mohl pøesvìdèit, aby mì to nechal udìlat. Jak ale na to?"); 
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

INSTANCE DIA_BaalIsidro_Problem(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Problem_Condition;
	information	= DIA_BaalIsidro_Problem_Info;
	permanent	= 0;
	description = "Nìco ti povím - máš problém. Baal Kagan se postará, abys byl vymìnìn.";
};                       

FUNC INT DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Problem_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Nìco ti povím - máš problém. Baal Kagan zajistí, že tì vymìní.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Cože? Spáè se mnou bude mít slitování! Potøebuju se toho zboží zbavit...
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro byl oèividnì zmatený, když jsem mu nabídl, že ho nahradím. Nestaèilo to však k tomu, aby mì to nechal udìlat.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Kagan se chystá opilce Baala Isidra nahradit nìkým jiným. Myslím, že teï už moji nabídku pøijme!");
	};	
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
	var int BaalIsidro_GotDrink;
// ************************************************************

INSTANCE DIA_BaalIsidro_Drink(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Drink_Condition;
	information	= DIA_BaalIsidro_Drink_Info;
	permanent	= 1;
	description = "Tady - dej si na mì ještì jednu.";
};                       

FUNC INT DIA_BaalIsidro_Drink_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Drink_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Tady - dej si na mì ještì jednu.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Díky, èlovìèe. Pøipíjím na tvoje zdraví!

		if 		(Npc_HasItems(other,ItFoBooze))
		{
			B_GiveInvItems	(other,self,ItFoBooze,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBooze);		
		}
		else if (Npc_HasItems(other,ItFoBeer))
		{
			B_GiveInvItems	(other,self,ItFoBeer,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBeer);		
		}
		else if (Npc_HasItems(other,ItFoWine))
		{
			B_GiveInvItems	(other,self,ItFoWine,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoWine);		
		};
		
		BaalIsidro_GotDrink = TRUE;

		if	Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem)
		{
		    B_LogEntry	(CH1_DealerJob,"Poslední lok mé šlechetné nabídky zlomil zbývající špetku odporu Baala Isidra. Myslím, že teï už moji nabídku pøijme!");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidro nadšenì pøijal pití, ale ještì stále mi nechce svìøit prodej drogy.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); //Co? Kde?
	};
};

// ************************************************************
// 					 Übrleg's dir!
// ************************************************************
	var int BaalIsidro_DealerJob;
// ************************************************************

INSTANCE DIA_BaalIsidro_ThinkAgain(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_ThinkAgain_Condition;
	information	= DIA_BaalIsidro_ThinkAgain_Info;
	permanent	= 1;
	description = "Pøemýšlej o tom - dej mi drogu a o zisk se rozdìlíme.";
};                       

FUNC INT DIA_BaalIsidro_ThinkAgain_Condition()
{
	if	( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob!=LOG_RUNNING)&&(BaalIsidro_DealerJob!=LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_ThinkAgain_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Pøemýšlej o tom - dej mi drogu a o zisk se rozdìlíme.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Ach, èlovìèe, potøebuju se toho zboží zbavit. Nemìl bys na mì koukat jako na blázna, jo?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Dávám ti své slovo.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Dobøe, tady je to zboží... Mìl bys za nìj dostat aspoò 400 nugetù. To znamená po 200 nugetù pro každého. Poèkám tady. Pøijï hned, jak budeš mít tu rudu.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Víš, kdo si vezme vìtší èást?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Pokud vím, já jsem s tím zaèal.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Cítím se teï mnohem líp, když jsem se zbavil toho zboží.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro mi pøedal dávku lodyh drogy. Pokud všechnu drogu prodám, dá mi polovinu zisku, což èiní 200 nugetù.");	
	
		//Itemübergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items übergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Ne, èlovìèe. Mnì se to podaøí...
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

INSTANCE DIA_BaalIsidro_RUNNING(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_RUNNING_Condition;
	information	= DIA_BaalIsidro_RUNNING_Info;
	permanent	= 0;
	description = "Prodal jsem tu drogu. Tady je tvých 200 nugetù.";
};                       

FUNC INT DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_RUNNING_Info()
{	
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //Prodal jsem tu drogu.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //A co mých 200 nugetù?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Tady jsou.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Dobøe... Teï už nikdy nebudu Baala Kagana proklínat. (drsný smích)
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Obchodovat s tebou byl dobrý nápad.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro se nemusel namáhat, aby dostal svých 200 nugetù.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Nemám to u sebe.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Tak si to obstarej!
		AI_StopProcessInfos	(self);
	};
};

