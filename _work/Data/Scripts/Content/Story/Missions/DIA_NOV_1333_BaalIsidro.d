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
	description = "Nevypad� p��li� spokojen�.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Nevypad� moc ��astn�.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Tak� nejsem!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Pot�ebuju se zbavit cel� hromady drogy.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //Ty tady m� prod�vat zbo�� ze Sektovn�ho t�bora?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Ano. Ale pr�v� se nem��u vzchopit.
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
	description = "Uka�, co m�.";
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
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Uka�, co m�.
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Tady...
};

// ************************************************************
// 					 Ich verkaufe f�r dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Mohl bych ti prodat drogu - samoz�ejm� po dohod�.";
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
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Mohl bych ti prodat drogu - samoz�ejm� po dohod�.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Zapome� na to - nejsem v�bec tak opil�. M�l by ses s t�m ztratit.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Novic Baal Isidro se cel� den mot� v baru na jeze�e a pop�j�. M�l by prod�vat sv�j d�l drogy, ale nedb� na to. Snad bych ho mohl p�esv�d�it, aby m� to nechal ud�lat. Jak ale na to?"); 
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
	description = "N�co ti pov�m - m� probl�m. Baal Kagan se postar�, abys byl vym�n�n.";
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
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //N�co ti pov�m - m� probl�m. Baal Kagan zajist�, �e t� vym�n�.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Co�e? Sp�� se mnou bude m�t slitov�n�! Pot�ebuju se toho zbo�� zbavit...
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro byl o�ividn� zmaten�, kdy� jsem mu nab�dl, �e ho nahrad�m. Nesta�ilo to v�ak k tomu, aby m� to nechal ud�lat.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Kagan se chyst� opilce Baala Isidra nahradit n�k�m jin�m. Mysl�m, �e te� u� moji nab�dku p�ijme!");
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
	description = "Tady - dej si na m� je�t� jednu.";
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
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Tady - dej si na m� je�t� jednu.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //D�ky, �lov��e. P�ip�j�m na tvoje zdrav�!

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
		    B_LogEntry	(CH1_DealerJob,"Posledn� lok m� �lechetn� nab�dky zlomil zb�vaj�c� �petku odporu Baala Isidra. Mysl�m, �e te� u� moji nab�dku p�ijme!");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidro nad�en� p�ijal pit�, ale je�t� st�le mi nechce sv��it prodej drogy.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); //Co? Kde?
	};
};

// ************************************************************
// 					 �brleg's dir!
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
	description = "P�em��lej o tom - dej mi drogu a o zisk se rozd�l�me.";
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
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //P�em��lej o tom - dej mi drogu a o zisk se rozd�l�me.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Ach, �lov��e, pot�ebuju se toho zbo�� zbavit. Nem�l bys na m� koukat jako na bl�zna, jo?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //D�v�m ti sv� slovo.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Dob�e, tady je to zbo��... M�l bys za n�j dostat aspo� 400 nuget�. To znamen� po 200 nuget� pro ka�d�ho. Po�k�m tady. P�ij� hned, jak bude� m�t tu rudu.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //V�, kdo si vezme v�t�� ��st?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Pokud v�m, j� jsem s t�m za�al.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //C�t�m se te� mnohem l�p, kdy� jsem se zbavil toho zbo��.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro mi p�edal d�vku lodyh drogy. Pokud v�echnu drogu prod�m, d� mi polovinu zisku, co� �in� 200 nuget�.");	
	
		//Item�bergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items �bergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Ne, �lov��e. Mn� se to poda��...
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
	description = "Prodal jsem tu drogu. Tady je tv�ch 200 nuget�.";
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
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //A co m�ch 200 nuget�?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Tady jsou.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Dob�e... Te� u� nikdy nebudu Baala Kagana prokl�nat. (drsn� sm�ch)
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Obchodovat s tebou byl dobr� n�pad.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro se nemusel nam�hat, aby dostal sv�ch 200 nuget�.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Nem�m to u sebe.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Tak si to obstarej!
		AI_StopProcessInfos	(self);
	};
};

