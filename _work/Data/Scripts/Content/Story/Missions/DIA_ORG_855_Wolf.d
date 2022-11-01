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
	description = "Kim jesteś?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //Kim jesteś?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Jestem płatnerzem. Mówią na mnie Wilk.

	B_LogEntry			(GE_TraderNC,"Wilk zaopatruje Szkodniki w zbroje. Zwykle przesiaduje przed swoją chatą, w wielkiej jaskini.");
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
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //Hej, teraz jesteś jednym z nas!
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
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //Zajmujesz się czymś jeszcze?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Skupuję skóry i futra od myśliwych. Gdybyś miał kiedyś taki towar na zbyciu - zgłoś się do mnie.
	

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
	description		= "Jak mogę zdobyć futra albo skóry?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //Jak mogę zdobyć futra albo skóry?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //Przy drodze do Nowego Obozu kręci się Aidan. On może cię nauczyć, jak ściągać skórę ze zwierząt.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford i Drax polują zwykle na północ od Starego Obozu, na drodze do miejsca wymiany.
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
	description = "Potrzebuję lepszej zbroi.";
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
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Potrzebuję lepszej zbroi.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Teraz, kiedy jesteś jednym z nas, mogę ci jakąś sprzedać.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Nie mogę ci nic sprzedać. Lares zabiłby mnie, gdyby dowiedział się, że sprzedaję zbroje obcym.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Potrzebuję wzmocnionego pancerza.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //To solidny pancerz. Oczywiście nie tak dobry jak ten, który mam na sobie, ale zapewnia niezłą ochronę.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //Możesz mi sprzedać ciężki pancerz?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //Nie ma rudy, nie ma zbroi.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //Ta zbroja uchroni cię przed każdym zagrożeniem. Sam taką noszę, i jak dotąd nie zostałem nawet draśnięty. To bardzo solidny pancerz.

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
	description		= "Chciałbym nauczyć się strzelać z łuku."; 
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Chciałbym nauczyć się strzelać z łuku.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Cóż, mógłbym cię nauczyć, ale to będzie kosztować. Ja też muszę jeść, no nie?
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Ile?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //50 bryłek, bez targowania.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Szkodnik imieniem Wilk może mnie nauczyć strzelania z łuku.");
	
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
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Naucz mnie strzelać z łuku.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Twoja celność zależy głównie od twojej zręczności. Im bardziej zwinnie będą twoje ruchy, tym pewniej twoje strzały będą trafiały w cel.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Twoje umiejętności wpłyną na odległość z jakiej będziesz mógł skutecznie razić wrogów. Jeśli chcesz kiedyś zostać strzelcem wyborowym, musisz systematycznie rozwijać zarówno zręczność jak i umiejętności.
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Chciałbym sprawniej posługiwać się łukiem.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Jesteś już całkiem niezłym myśliwym. Teraz pora abyś poznał resztę najważniejszych informacji.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Dobry łucznik bierze pod uwagę wiele czynników zewnętrznych, ale robi to odruchowo, nieświadomie.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Odkryj tajniki funkcjonowania twojego oka, pamiętaj o sile naciągu i wyobrażaj sobie trajektorię lotu strzały, ale przede wszystkim - zawsze bądź czujny!
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Opanowałeś już większość tajników strzelania z łuku. Teraz pozostało ci tylko rozwijać twoje umiejętności podczas polowania i walki.
			
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
	description = "Możesz mnie czegoś nauczyć?";
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
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Możesz mnie czegoś nauczyć?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Powodzenie podczas polowania zależy przede wszystkim od twojej zręczności.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Szkodnik imieniem Wilk może pomóc mi zwiększyć moją zwinność.");
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
	description = "Gorn powiedział, że chcesz ze mną pilnie porozmawiać.";
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
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn powiedział, że chcesz ze mną pilnie porozmawiać?
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //Dobrze, że zdążyłeś zajrzeć do mnie przed wymarszem!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //Przed jakim wymarszem?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //Przed waszym wymarszem do Niezupełnie-Wolnej-Kopalni.
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
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Mam pomysł na zupełnie nowy rodzaj pancerza.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //Czyżby? A cóż to za pomysł?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Pancerze pełzaczy są niezwykle twarde. Znacznie trwalsze niż choćby stal.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //Oczywiście nie mam tu na myśli tych wychudzonych osobników, które nawiedzały zawaloną kopalnię Gomeza...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //... O nie, one nie wystarczą. W NASZEJ kopalni żyją PRAWDZIWE PEŁZACZE. Większe, silniejsze i jeszcze bardziej wredne.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //Pancerz tych bestii jest niemal nie do przebicia!
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Gdybyś mógł mi przynieść kilka płytek z ich pancerzy, mógłbym z nich poskładać nie lada zbroję!
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
	description = "W jaki sposób mam oddzielić te płytki od zwłok pełzaczy?";
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
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //W jaki sposób mam oddzielić te płytki od zwłok pełzaczy?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //To proste. Płytki na grzbiecie przymocowane są tylko przy krawędziach.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Wystarczy wziąć ostry nóż i "ciąć wzdłuż przerywanej linii".
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //W porządku. Postaram się przynieść ci kilka płytek z pancerzy pełzaczy.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nowa umiejętność: Wycinanie płytek pancerza", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,"Wilk, Szkodnik z Nowego Obozu, zaproponował mi wykonanie zbroi z pancerzy pełzaczy. Pokazał mi jak należy je usuwać z martwych potworów."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Umiejętność usuwania pancerzy z martwych pełzaczy-wojowników.");

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
	description = "I mówisz mi to wszystko nie żądając niczego w zamian?";
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
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //I mówisz mi to wszystko nie żądając niczego w zamian?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //No niezupełnie... Jeśli uda mi się sklecić z tych płytek porządną zbroję, będę... bardzo szybko... bardzo dużo... Ach, nieważne!
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
	description = "Przyniosłem ci kilka tych płytek, o które prosiłeś!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Przyniosłem ci kilka tych płytek, o które prosiłeś!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To za mało! Nie starczy na całą zbroję!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Przynieś mi więcej płytek!
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
	description = "Zebrałem mnóstwo płytek z pancerzy pełzaczy!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Zebrałem mnóstwo płytek z pancerzy pełzaczy!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Fantastycznie! Natychmiast zabieram się do roboty!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak długo to zajmie?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Nie mam pojęcia. To coś zupełnie nowego. Jeszcze nigdy czegoś takiego nie robiłem!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Będziesz musiał zaglądać do mnie od czasu do czasu.

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,"Dałem Wilkowi 15 tych płytek z pancerzy. Teraz potrzebuje trochę czasu, żeby sporządzić z nich dla mnie nową zbroję.");
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
	description = "Jak postępują prace nad nowym pancerzem?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Jak postępują prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //To zajmie dłużej niż myślałem! Te płytki są niezwykle twarde. Nie bardzo wiem jak mam je ze sobą połączyć!
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Daj mi jeszcze trochę czasu! Dam radę, zaufaj mi!
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
	description = "Jak postępują prace nad nowym pancerzem?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Jak postępują prace nad nowym pancerzem?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Udało mi się wreszcie znaleźć sposób na połączenie płytek ze sobą!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Czy to znaczy, że zbroja jest już gotowa!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Dokładnie! Oto i ona! Jest twardsza niż jakikolwiek pancerz jaki widziałem na oczy!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Dzięki, jestem twoim dłużnikiem!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //Nie ma o czym mówić! Na pewno na tym nie stracę! Co to, to nie! Ha Ha!

	B_LogEntry			(CH4_MCPlateArmor,"Wilk skończył już moją nową zbroję. To najlepszy pancerz, jaki w życiu widziałem!");
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
	description		= "Gdzie mogę kupić jakiś łuk?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Gdzie mogę kupić jakiś łuk?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Trafiłeś pod właściwy adres. Mam tu dobry towar za bardzo przystępne ceny.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Szkodnik imieniem Wilk sprzedaje łuki.");

};  





