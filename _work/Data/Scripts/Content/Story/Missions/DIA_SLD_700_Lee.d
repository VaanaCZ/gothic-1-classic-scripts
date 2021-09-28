//*********************************************************
//							EXIT									
//*********************************************************

instance  Sld_700_Lee_Exit (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  999;
	condition	=  Sld_700_Lee_Exit_Condition;
	information	=  Sld_700_Lee_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*********************************************************
//						Greet									
//*********************************************************

instance  Sld_700_Lee_Greet (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Greet_Condition;
	information	=  Sld_700_Lee_Greet_Info;
	permanent	=  0;
	description = "Ty jsi velitel žoldákù, viï?";
};                       

FUNC int  Sld_700_Lee_Greet_Condition()
{
	return 1;
};

FUNC VOID  Sld_700_Lee_Greet_Info()
{
	AI_Output (other, self,"DIA_Lee_Greet_15_00"); //Ty jsi velitel žoldákù, viï?
	AI_Output (self, other,"DIA_Lee_Greet_08_01"); //Pøesnì tak, hochu!
};

//*********************************************************
//						Define									
//*********************************************************

instance  Sld_700_Lee_Define (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Define_Condition;
	information	=  Sld_700_Lee_Define_Info;
	permanent	=  0;
	description = "Jaké úkoly dávají mágové žoldákùm?";
};                       

FUNC int  Sld_700_Lee_Define_Condition()
{
	if (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Define_Info()
{
	AI_Output (other, self,"DIA_Lee_Define_15_00"); //Jaké úkoly dávají mágové žoldákùm?
	AI_Output (self, other,"DIA_Lee_Define_08_01"); //Velmi jednoduché: chránit rudu - chránit mágy.
	AI_Output (self, other,"DIA_Lee_Define_08_02"); //Obèas pro nás mají mágové zvláštní úkoly.
};

//*********************************************************
//						Mitmachen									
//*********************************************************

instance  Sld_700_Lee_Mitmachen (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  2;
	condition	=  Sld_700_Lee_Mitmachen_Condition;
	information	=  Sld_700_Lee_Mitmachen_Info;
	permanent	=  0;
	description = "Chtìl bych se k vám pøidat!";
};                       

FUNC int  Sld_700_Lee_Mitmachen_Condition()
{
	if	(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Lee_Mitmachen_15_00"); //Chtìl bych se k vám pøidat!
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_01"); //Ty máš ale nervy! Ty si vážnì myslíš, že pøijmu každého, kdo sem pøijde?
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_02"); //Mùžeš se stát jedním z nás až potom, co strávíš urèitý èas v táboøe. Budu tì pozorovat!
};

//*********************************************************
//						NowReady for Sld?									
//*********************************************************
	var int Lee_SldPossible;
//*********************************************************

instance  Sld_700_Lee_NowReady (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  700;
	condition	=  Sld_700_Lee_NowReady_Condition;
	information	=  Sld_700_Lee_NowReady_Info;
	permanent	=  1;
	description = "Chtìl bych se stát žoldákem mágù - jsem na to už pøipravený?";
};                       

FUNC int  Sld_700_Lee_NowReady_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	&&	(Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_NowReady_Info()
{
	AI_Output (other, self,"DIA_Lee_NowReady_15_00"); //Chtìl bych se stát žoldákem mágù - jsem na to už pøipravený?
	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Tvoje skutky vykonané pro lidi ve Starém dolu ukázaly, že jsi docela správný chlap.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Byl bych ochotný pøijmout tì k žoldákùm.
	
		if hero.level < 10
		{
			AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Ale ještì nejsi pøipravený stát se žoldákem. Musíš ještì získat nìjaké zkušenosti, potom budeš patøit k nám.
	    	AI_StopProcessInfos	(self);
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //I'll give you a chance. How about it?
	    	Lee_SldPossible = TRUE;
		};
	}
	else
	{	
		if hero.level < 10
		{
			AI_Output (self, other,"DIA_Lee_NowReady_08_01"); //Ještì nemáš dost zkušeností. Potøebuješ ještì zlepšit své schopnosti.
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Dám ti pøíležitost. Co ty na to?
	    	Lee_SldPossible = TRUE;
		};
	};
};

/*------------------------------------------------------------------------
							SÖLDNER WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMESLDNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMESLDNOW_Condition;
	information		= Sld_700_Lee_BECOMESLDNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chci se stát žoldákem."; 
};

FUNC int  Sld_700_Lee_BECOMESLDNOW_Condition()
{	
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	{
		return TRUE;
	};
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Chci se stát žoldákem.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //Dobré rozhodnutí. Nebudeš litovat.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Øekni mi nìco: Proè? Proè jsi se pøidal k nám a ne ke Starému táboru nebo k Bratrstvu?

	Log_CreateTopic		(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry			(GE_BecomeMercenary,"Lee mì nechal, abych se pøidal k žoldákùm.");
	
	Info_ClearChoices	(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Ostatní tábory nejsou tak dobré.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Chtìl jsem svobodu od samého zaèátku.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Nìco mì k tomu táhlo.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};
  
FUNC void  Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //Ostatní tábory nejsou tak dobré.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Jedna vìc je tady nade všechno dùležitá, totiž nadìje na svobodu. Vítej, ŽOLDÁKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Chtìl jsem svobodu od samého zaèátku.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //Dostaneme naší svobodu nazpìt. Vítej, ŽOLDÁKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Nìco mì k tomu táhlo.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //Hlavní vìc, nevzdat se, aby nás ta Bariéra nepolapila navždycky. Vítej, ŽOLDÁKU!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################
/*------------------------------------------------------------------------
							SZENE DAMM									
------------------------------------------------------------------------*/

instance Sld_700_Lee_DAMNPAST (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_DAMNPAST_Condition;
	information		= Sld_700_Lee_DAMNPAST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_700_Lee_DAMNPAST_Condition()
{	
	if (Saturas_BringFoci == 5)
	&& (Npc_GetDistToNpc (hero,self) < 1000)	
	&& (Npc_GetDistToWp (self,"NC_DAM") < 1000) 
	{
		return TRUE;
	};
};
func void  Sld_700_Lee_DAMNPAST_Info()
{
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Bývaly èasy, kdy jsem vedl úplnì jiný život.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //Byl jsem jedním z nejlepších generálù téhle zemì.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Celý život jsem strávil v boji za svou vlast.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Šlechta mì ale nemìla v oblibì, protože král naslouchal mým radám. A také vìdìla, že pøedstavuju hrozbu pro jejich špinavé obchody.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //Nepoèítal jsem s jejich zákeøností. Použili proti mnì královu ženu.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Byl jsem obvinìn z její nesmyslné vraždy. Král Rhobar nemìl jinou volbu.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Služby, které jsem vlasti prokázal, mì zachránily pøed šibenicí. Ale byl jsem zbaven svobody.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Jednoho dne budu zase svobodný. Pak se vrátím a pomstím se.
	
	AI_AlignToWP		(self);
	
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Provedu svoji pomstu.
	
	Npc_ExchangeRoutine (self,"START");
	
	var C_NPC Homer;
	Homer = Hlp_GetNpc	(BAU_935_HOMER);
	Npc_ExchangeRoutine	(Homer,"START"); 
	AI_ContinueRoutine	(Homer);
};

//*********************************************************
//						FMTaken									
//*********************************************************

instance  Sld_700_Lee_FMTaken (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_FMTaken_Condition;
	information	=  Sld_700_Lee_FMTaken_Info;
	permanent	=  1;
	description = "Co si myslíš o dolu?";
};                       

FUNC int  Sld_700_Lee_FMTaken_Condition()
{
	if	FMTaken
	{
		return TRUE;
	};
};

FUNC VOID  Sld_700_Lee_FMTaken_Info()
{
	AI_Output (other, self,"DIA_Lee_FMTaken_15_00"); //Co si myslíš o dolu?
	
	if (Lee_freeminereport == 0) 					//SC hat jetzt die Möglichkeit, Lee über die freie Mine zu informieren! ***Björn***
	{
	
		AI_Output (self, other,"DIA_Lee_FMTaken_08_01"); //Zašli pøíliš daleko a budou toho litovat.
	
	}
	else
	{
		AI_Output			(hero, self,"Info_Lee_now_freeminefree_15_01"); 	//Už by nemìli nikdy pøedstavovat hrozbu!
		AI_Output			(self, hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); 	//Udìlal jsi toho pro náš tábor mnoho. Pro muže, jako jsi ty, budu mít vždycky dobré místo.
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); 		//Dìkuju. Pùjdu si svou cestou.
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); 		//Ještì moment!
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); 		//Vem si tuhle magickou runu jako vyjádøení našeho vdìku za tvoje velké èiny.
		AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); 		//Dìkuju!
		AI_Output			(hero,	self,"Info_Exit_Info_15_01"); 				//Ještì se uvidíme.


		B_LogEntry			(CH4_BannedFromOC,	"Informoval jsem Leeho o èistce, kterou jsme s Gornem provedli ve Svobodném dole. Byl velmi potìšen.");
		
 	   	B_GiveInvItems (self,other, ItArRuneFirestorm, 1);
		B_GiveXP (500);		
		Lee_freeminereport = 0;
	};
};

/*------------------------------------------------------------------------
						WECHSEL VON GRD ZU SLD								
------------------------------------------------------------------------*/
instance  Sld_700_Lee_CHANGESIDE (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_CHANGESIDE_Condition;
	information		= Sld_700_Lee_CHANGESIDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Vypovìdìli mì ze Starého tábora, chtìl bych se pøidat k vám!"; 
};

FUNC int  Sld_700_Lee_CHANGESIDE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};

};

FUNC void  Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Vypovìdìli mì ze Starého tábora, chtìl bych se pøidat k vám!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Udìlal jsi toho pro náš tábor mnoho. Pro muže, jako jsi ty, budu mít vždycky dobré místo.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Zkrátíme to. Vítej do Nového tábora, ŽOLDÁKU!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //Tady je zbroj. Dobøe, že jsi tu s náma.

	CreateInvItem		(self, SLD_ARMOR_M);
	B_GiveInvItems      (self, hero, SLD_ARMOR_M, 1);
	Npc_GetInvItemBySlot(hero, INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{	
		AI_EquipArmor	(hero, item);
	};
	
	Npc_SetTrueGuild	(hero, GIL_SLD);
	hero.guild = GIL_SLD;

	B_LogEntry			(CH4_BannedFromOC,"Pøevlékl jsem kabát. Poté, co mì vyhostili ze Starého tábora, pøidal jsem se k žoldákùm. A teï zpátky za Saturasem!");

	Log_CreateTopic 	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Lee mì mùže nauèit bojovat s OBOURUÈNÍMI ZBRANÌMI. Kromì toho mi mùže pomoci zdokonalit moji SÍLU a OBRATNOST. ");
};  

/*------------------------------------------------------------------------
							ARMOR									
------------------------------------------------------------------------*/
instance  Sld_700_Lee_ARMOR (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ARMOR_Condition;
	information		= Sld_700_Lee_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potøebuju lepší zbroj."; 
};

FUNC int  Sld_700_Lee_ARMOR_Condition()
{	
	if  (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ARMOR_Info()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_Info_15_01"); //Potøebuju lepší zbroj.
	AI_Output				(self, other,"Sld_700_Lee_ARMOR_Info_08_02"); //Na svoji zbroj si musíš nejdøíve vydìlat. Nehledì na to, že tì pøijde draho.
	
	Info_ClearChoices	(Sld_700_Lee_ARMOR);
	Info_AddChoice		(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs, VALUE_SLD_ARMOR_M) ,Sld_700_Lee_ARMOR_M);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs, VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};  
func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices (Sld_700_Lee_ARMOR);
};
func void Sld_700_Lee_ARMOR_M()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Chtìl bych støední zbroj.
	if (Kapitel < 3)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Ještì nejsi dost zkušený, abys nosil lepší zbroj. Pøijï, až budeš mít víc zkušeností.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Bez rudy nedostaneš žádnou zbroj.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Tahle zbroj je pìkná práce. Ochrání tvé tìlo velmi dobøe.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_M);
		CreateInvItem		(hero,SLD_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};
func void Sld_700_Lee_ARMOR_H()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Dej mi tìžkou zbroj.
	if (Kapitel < 4)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Ještì nejsi dost zkušený, abys nosil tìžkou zbroj. Pøijï, až budeš mít víc zkušeností.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Bez rudy nedostaneš žádnou zbroj.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Tahle zbroj je nejlepší kousek, jaký kdy byl uvnitø Bariéry. A vìø mi, má cenu rudy.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_H);

		CreateInvItem		(hero,SLD_ARMOR_H);	//SN: ohne B_GiveInvItem, weil sonst Lee nackt dasteht!

		// nur wegen Bildschirmausgabe "1 Gegenstand erhalten"
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};

};
/*------------------------------------------------------------------------
							STR + DEX								
------------------------------------------------------------------------*/
INSTANCE Sld_700_Lee_Teach(C_INFO)
{
	npc			= Sld_700_Lee;
	nr			= 10;
	condition	= Sld_700_Lee_Teach_Condition;
	information	= Sld_700_Lee_Teach_Info;
	permanent	= 1;
	description = "Mùžeš mì nìco nauèit?";
};                       

FUNC INT Sld_700_Lee_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	  
	{
		return TRUE;
	};
};

FUNC VOID Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Mùžeš mì nìco nauèit?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Mùžu ti pomoci stát se silnìjší a obratnìjší.
	
	
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString( NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND1 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND1_Condition;
	information		= Sld_700_Lee_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND1_Condition()
{	
	if 	( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
			&& ((Npc_GetTrueGuild    (hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //Chci se nauèit zacházet s obouruèním meèem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //Dobøe, ale nejdøív musíme pobrat základy.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Meè musíš držet vodorovnì. Potøebuješ silnìjší rozmach, abys mohl na nepøítele zaútoèit takovou tìžkou zbraní.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Zvedni ruku a rozmáchni se rovnou dolu. To obvykle staèí na to, abys nepøítele srazil k zemi.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Toho momentu pak využiješ k novému rozmáchnutí.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Obouruèní meèe jsou ideální k zasazování boèních úderù, kterými si nepøítele udržíš od tìla.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //To by mohlo pro zaèátek staèit. Trénuj.
	
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND2 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND2_Condition;
	information		= Sld_700_Lee_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND2_Condition()
{	
	if
		( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
			&& ( (Npc_GetTrueGuild    (hero) == GIL_SLD) ||  ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //Chci se dozvìdìt víc o boji s obouruèním meèem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Ze všeho nejdøíve musíš zaujmout základní postoj. Meè musíš držet svisle, stranou od tìla a údery vést silnì obìma rukama.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Švihnout rychle dolu a ostøí vést pøes rameno. Pak máš šanci provést rychlý švih napravo.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //Tvùj protivník nebude mít šanci se k tobì dostat.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Nebo meèem švihni z levé horní strany smìrem dopøedu, abys odrazil protivníka dozadu.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Poøád se otáèej, abys následnému švihu vždy dodával potøebnou sílu, která protivníka srazí.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //Pokud to nebude staèit, zbylý švih využij k novému napøáhnutí meèe.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //Až útok dokonèíš, zneškodni protivníka a vyèkej na další souboj.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //Klíèem k úspìchu je mìnit postoje a polohy.
	
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};  
