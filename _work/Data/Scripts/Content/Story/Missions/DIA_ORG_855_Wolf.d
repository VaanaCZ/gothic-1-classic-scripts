//****************************************
//					EXIT
//****************************************

INSTANCE DIA_ORG_855_Wolf_Exit (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 999;
	condition	= DIA_ORG_855_Wolf_Exit_Condition;
	information	= DIA_ORG_855_Wolf_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//****************************************
//					Hallo
//****************************************

INSTANCE DIA_Wolf_Hello (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_Hello_Condition;
	information	= DIA_Wolf_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //Kim jesteœ?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Jestem p³atnerzem. Mówi¹ na mnie Wilk.

	B_LogEntry			(GE_TraderNC,"Wilk zaopatruje Szkodniki w zbroje. Zwykle przesiaduje przed swoj¹ chat¹, w wielkiej jaskini.");
};

//****************************************
//				Bin ORG!
//****************************************

INSTANCE DIA_Wolf_GreetORG (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_GreetORG_Condition;
	information	= DIA_Wolf_GreetORG_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Wolf_GreetORG_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Wolf_GreetORG_Info()
{
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //Hej, teraz jesteœ jednym z nas!
};

//****************************************
//				TRADE
//****************************************

instance  Org_855_Wolf_TRADE (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 800;
	condition		= Org_855_Wolf_TRADE_Condition;
	information		= Org_855_Wolf_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Org_855_Wolf_TRADE_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_TRADE_Info()
{
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //Zajmujesz siê czymœ jeszcze?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Skupujê skóry i futra od myœliwych. Gdybyœ mia³ kiedyœ taki towar na zbyciu - zg³oœ siê do mnie.
	

};

//****************************************
//				Wo Jäger
//****************************************

instance  Org_855_Wolf_WhereHunter (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 900;
	condition		= Org_855_Wolf_WhereHunter_Condition;
	information		= Org_855_Wolf_WhereHunter_Info;
	permanent		= 1;
	description		= "Jak mogê zdobyæ futra albo skóry?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //Jak mogê zdobyæ futra albo skóry?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //Przy drodze do Nowego Obozu krêci siê Aidan. On mo¿e ciê nauczyæ, jak œci¹gaæ skórê ze zwierz¹t.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford i Drax poluj¹ zwykle na pó³noc od Starego Obozu, na drodze do miejsca wymiany.
};

//****************************************
//				Sell Armor
//****************************************

INSTANCE DIA_Wolf_SellArmor (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 700;
	condition	= DIA_Wolf_SellArmor_Condition;
	information	= DIA_Wolf_SellArmor_Info;
	permanent	= 1;
	description = "Potrzebujê lepszej zbroi.";
};                       

FUNC INT DIA_Wolf_SellArmor_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Wolf_Hello)) 
	&& (!Npc_KnowsInfo(hero, Info_Wolf_ARMORFINISHED)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_SellArmor_Info()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Potrzebujê lepszej zbroi.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Teraz, kiedy jesteœ jednym z nas, mogê ci jak¹œ sprzedaæ.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Nie mogê ci nic sprzedaæ. Lares zabi³by mnie, gdyby dowiedzia³ siê, ¿e sprzedajê zbroje obcym.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Potrzebujê wzmocnionego pancerza.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //To solidny pancerz. Oczywiœcie nie tak dobry jak ten, który mam na sobie, ale zapewnia niez³¹ ochronê.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //Mo¿esz mi sprzedaæ ciê¿ki pancerz?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //Ta zbroja uchroni ciê przed ka¿dym zagro¿eniem. Sam tak¹ noszê, i jak dot¹d nie zosta³em nawet draœniêty. To bardzo solidny pancerz.

		B_GiveInvItems		(hero, self, ItMinugget,VALUE_ORG_ARMOR_H);
		
		CreateInvItem 		(hero,ORG_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

/*------------------------------------------------------------------------
							BOGENSCHIESSEN	DAS ANGEBOT							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINOFFER (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINOFFER_Condition;
	information		= ORG_855_Wolf_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia³bym nauczyæ siê strzelaæ z ³uku."; 
};

FUNC int  ORG_855_Wolf_TRAINOFFER_Condition()
{	
	if( Npc_GetTalentSkill (hero,NPC_TALENT_BOW) != 2)
	{
		return TRUE;
	};
};

FUNC void  ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Chcia³bym nauczyæ siê strzelaæ z ³uku.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Có¿, móg³bym ciê nauczyæ, ale to bêdzie kosztowaæ. Ja te¿ muszê jeœæ, no nie?
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Ile?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //50 bry³ek, bez targowania.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Szkodnik imieniem Wilk mo¿e mnie nauczyæ strzelania z ³uku.");
	
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAIN_Condition;
	information		= ORG_855_Wolf_TRAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50); 
};

FUNC int  ORG_855_Wolf_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Naucz mnie strzelaæ z ³uku.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Twoja celnoœæ zale¿y g³ównie od twojej zrêcznoœci. Im bardziej zwinnie bêd¹ twoje ruchy, tym pewniej twoje strza³y bêd¹ trafia³y w cel.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Twoje umiejêtnoœci wp³yn¹ na odleg³oœæ z jakiej bêdziesz móg³ skutecznie raziæ wrogów. Jeœli chcesz kiedyœ zostaæ strzelcem wyborowym, musisz systematycznie rozwijaæ zarówno zrêcznoœæ jak i umiejêtnoœci.
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINAGAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINAGAIN_Condition;
	information		= ORG_855_Wolf_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_2,	LPCOST_TALENT_BOW_2,50); 
};

FUNC int  ORG_855_Wolf_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Chcia³bym sprawniej pos³ugiwaæ siê ³ukiem.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Jesteœ ju¿ ca³kiem niez³ym myœliwym. Teraz pora abyœ pozna³ resztê najwa¿niejszych informacji.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Dobry ³ucznik bierze pod uwagê wiele czynników zewnêtrznych, ale robi to odruchowo, nieœwiadomie.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Odkryj tajniki funkcjonowania twojego oka, pamiêtaj o sile naci¹gu i wyobra¿aj sobie trajektoriê lotu strza³y, ale przede wszystkim - zawsze b¹dŸ czujny!
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Opanowa³eœ ju¿ wiêkszoœæ tajników strzelania z ³uku. Teraz pozosta³o ci tylko rozwijaæ twoje umiejêtnoœci podczas polowania i walki.
			
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
}; 
//---------------------------------------------------------------
//     					 DEX
//---------------------------------------------------------------
INSTANCE ORG_855_Wolf_Teach(C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 100;
	condition	= ORG_855_Wolf_Teach_Condition;
	information	= ORG_855_Wolf_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT ORG_855_Wolf_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Powodzenie podczas polowania zale¿y przede wszystkim od twojej zrêcznoœci.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Szkodnik imieniem Wilk mo¿e pomóc mi zwiêkszyæ moj¹ zwinnoœæ.");
	log_wolftrain = TRUE;
	};
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
};
func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0) ,ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


//---------------------------------------------------------------------
//	Info GOOD
//---------------------------------------------------------------------
INSTANCE Info_Wolf_GOOD (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_GOOD_Condition;
	information	= Info_Wolf_GOOD_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gorn powiedzia³, ¿e chcesz ze mn¹ pilnie porozmawiaæ.";
};                       

FUNC INT Info_Wolf_GOOD_Condition()
{
	if	Gorn_GotoWolf
	{
		return TRUE;
	};
};

func VOID Info_Wolf_GOOD_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn powiedzia³, ¿e chcesz ze mn¹ pilnie porozmawiaæ?
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //Dobrze, ¿e zd¹¿y³eœ zajrzeæ do mnie przed wymarszem!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //Przed jakim wymarszem?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //Przed waszym wymarszem do Niezupe³nie-Wolnej-Kopalni.
	};
};

//---------------------------------------------------------------------
//	Info SPEAK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SPEAK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SPEAK_Condition;
	information	= Info_Wolf_SPEAK_Info;
	important	= 0;	
	permanent	= 0;
	description = "O co chodzi?";
};                       

FUNC INT Info_Wolf_SPEAK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_GOOD)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SPEAK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_01"); //O co chodzi?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Mam pomys³ na zupe³nie nowy rodzaj pancerza.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //Czy¿by? A có¿ to za pomys³?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Pancerze pe³zaczy s¹ niezwykle twarde. Znacznie trwalsze ni¿ choæby stal.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //Oczywiœcie nie mam tu na myœli tych wychudzonych osobników, które nawiedza³y zawalon¹ kopalniê Gomeza...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //... O nie, one nie wystarcz¹. W NASZEJ kopalni ¿yj¹ PRAWDZIWE PE£ZACZE. Wiêksze, silniejsze i jeszcze bardziej wredne.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //Pancerz tych bestii jest niemal nie do przebicia!
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Gdybyœ móg³ mi przynieœæ kilka p³ytek z ich pancerzy, móg³bym z nich posk³adaæ nie lada zbrojê!
};

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SKIN (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SKIN_Condition;
	information	= Info_Wolf_SKIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?";
};                       

FUNC INT Info_Wolf_SKIN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SKIN_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //W jaki sposób mam oddzieliæ te p³ytki od zw³ok pe³zaczy?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //To proste. P³ytki na grzbiecie przymocowane s¹ tylko przy krawêdziach.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Wystarczy wzi¹æ ostry nó¿ i "ci¹æ wzd³u¿ przerywanej linii".
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //W porz¹dku. Postaram siê przynieœæ ci kilka p³ytek z pancerzy pe³zaczy.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nowa umiejêtnoœæ: Wycinanie p³ytek pancerza", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,"Wilk, Szkodnik z Nowego Obozu, zaproponowa³ mi wykonanie zbroi z pancerzy pe³zaczy. Pokaza³ mi jak nale¿y je usuwaæ z martwych potworów."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ usuwania pancerzy z martwych pe³zaczy-wojowników.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info PROFIT
//---------------------------------------------------------------------
INSTANCE Info_Wolf_PROFIT (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_PROFIT_Condition;
	information	= Info_Wolf_PROFIT_Info;
	important	= 0;	
	permanent	= 0;
	description = "I mówisz mi to wszystko nie ¿¹daj¹c niczego w zamian?";
};                       

FUNC INT Info_Wolf_PROFIT_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_PROFIT_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //I mówisz mi to wszystko nie ¿¹daj¹c niczego w zamian?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //No niezupe³nie... Jeœli uda mi siê skleciæ z tych p³ytek porz¹dn¹ zbrojê, bêdê... bardzo szybko... bardzo du¿o... Ach, niewa¿ne!
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESFEW (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESFEW_Condition;
	information	= Info_Wolf_MCPLATESFEW_Info;
	important	= 0;	
	permanent	= 0;
	description = "Przynios³em ci kilka tych p³ytek, o które prosi³eœ!";
};                       

FUNC INT Info_Wolf_MCPLATESFEW_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) > 0)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) < 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Przynios³em ci kilka tych p³ytek, o które prosi³eœ!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To za ma³o! Nie starczy na ca³¹ zbrojê!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Przynieœ mi wiêcej p³ytek!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESENOUGH (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESENOUGH_Condition;
	information	= Info_Wolf_MCPLATESENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy!";
};                       

FUNC INT Info_Wolf_MCPLATESENOUGH_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) >= 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESENOUGH_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Zebra³em mnóstwo p³ytek z pancerzy pe³zaczy!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastycznie! Natychmiast zabieram siê do roboty!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak d³ugo to zajmie?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Nie mam pojêcia. To coœ zupe³nie nowego. Jeszcze nigdy czegoœ takiego nie robi³em!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Bêdziesz musia³ zagl¹daæ do mnie od czasu do czasu.

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,"Da³em Wilkowi 15 tych p³ytek z pancerzy. Teraz potrzebuje trochê czasu, ¿eby sporz¹dziæ z nich dla mnie now¹ zbrojê.");
	B_GiveXP			(XP_DeliveredMCPlates);
	
	B_GiveInvItems	(hero, self, ItAt_Crawler_02,	15);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORINWORK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORINWORK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORINWORK_Condition;
	information	= Info_Wolf_ARMORINWORK_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak postêpuj¹ prace nad nowym pancerzem?";
};                       

FUNC INT Info_Wolf_ARMORINWORK_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	!= LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORINWORK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Jak postêpuj¹ prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //To zajmie d³u¿ej ni¿ myœla³em! Te p³ytki s¹ niezwykle twarde. Nie bardzo wiem jak mam je ze sob¹ po³¹czyæ!
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Daj mi jeszcze trochê czasu! Dam radê, zaufaj mi!
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORFINISHED (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORFINISHED_Condition;
	information	= Info_Wolf_ARMORFINISHED_Info;
	important	= 0;	
	permanent	= 0;
	description = "Jak postêpuj¹ prace nad nowym pancerzem?";
};                       

FUNC INT Info_Wolf_ARMORFINISHED_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	== LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Jak postêpuj¹ prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Uda³o mi siê wreszcie znaleŸæ sposób na po³¹czenie p³ytek ze sob¹!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Czy to znaczy, ¿e zbroja jest ju¿ gotowa!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Dok³adnie! Oto i ona! Jest twardsza ni¿ jakikolwiek pancerz jaki widzia³em na oczy!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Dziêki, jestem twoim d³u¿nikiem!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //Nie ma o czym mówiæ! Na pewno na tym nie stracê! Co to, to nie! Ha Ha!

	B_LogEntry			(CH4_MCPlateArmor,"Wilk skoñczy³ ju¿ moj¹ now¹ zbrojê. To najlepszy pancerz, jaki w ¿yciu widzia³em!");
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_SUCCESS);

	B_GiveXP			(XP_GorMCPlateArmor);

	CreateInvItem		(self, CRW_ARMOR_H);
	B_GiveInvItems      (self,hero,CRW_ARMOR_H,1);
};

/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  Org_855_Wolf_SELLBOW (C_INFO)
{
	npc				= Org_855_Wolf;
	condition		= Org_855_Wolf_SELLBOW_Condition;
	information		= Org_855_Wolf_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mogê kupiæ jakiœ ³uk?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Gdzie mogê kupiæ jakiœ ³uk?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Trafi³eœ pod w³aœciwy adres. Mam tu dobry towar za bardzo przystêpne ceny.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Szkodnik imieniem Wilk sprzedaje ³uki.");

};  





