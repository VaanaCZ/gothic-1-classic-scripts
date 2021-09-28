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
	description = "Kdo jsi?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //Kdo jsi?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Jsem Wolf. Vyrábím zbroj.

	B_LogEntry			(GE_TraderNC,"Wolf dodává banditùm zbroj. Obvykle bývá ve své chatrèi v pøední èásti velké obytné jeskynì.");
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
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //Hej! Teï jsi jedním z nás, chlapèe.
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
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //Obchoduješ ještì s nìèím jiným?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Nakupuju od lovcù kožešiny a kùže. Jestli nìco takového máš, koupím to.
	

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
	description		= "Jak stáhnu kožešiny a kùže?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //Jak stáhnu kožešiny a kùže?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //Po cestì do Nového tábora pøijdeš k Aidanovi. Nauèí tì stahovat zvìø.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford a Drax se potloukají severnì od Starého tábora. Je to po cestì k místu výmìny.
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
	description = "Sháním lepší zbroj.";
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
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Sháním lepší zbroj.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Teï když jsi jedním z nás, mùžu ti jednu prodat.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Nemùžu ti nic prodat. Lares by mì zabil, kdybych prodal zbroj cizincùm.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Chci støední zbroj.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //Žádná ruda, žádná zbroj.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //To je dobrá zbroj. Ne sice tak dobrá jako ta, co nosím já, ale ochrání tì také dobøe.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //Mùžeš mi prodat tìžkou zbroj?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //Žádná ruda, žádná zbroj.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //Tahle zbroj tì ochrání pøed každým nebezpeèím! Nosím ji sám a pøežívám už dost dlouho. V neposledním díky téhle zbroji.

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
	description		= "Rád bych se nauèil zacházet s lukem."; 
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Rád bych se nauèil zacházet s lukem.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Mùžu tì to nauèit. Ale nemùžu to dìlat jenom pro radost. Pøedevším musím také nìco jíst.
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Kolik?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //Všechno, co tì nauèím, bude stát 50 nugetù. A bez smlouvání.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Bandita Wolf mì mùže nauèit používat LUK.");
	
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
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Nauè mì zacházet s lukem.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Tvùj zásah záleží na tvé zruènosti. Èím pohotovìjší budeš, tím pøesnìji zasáhne tvùj šíp cíl.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Tvoje obratnost urèuje vzdálenost, ze které dokážeš zasáhnout cíl. Aby se z tebe stal dobrý støelec, mìl bys vylepšovat obojí rovnomìrnì.
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Chci se zlepšit v umìní lukostøelby.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Už je z tebe dobrý lovec. Teï si osvojíš zbývající znalosti.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Aby ses stal dobrým støelcem, musíš se o to pøestat snažit.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Objev zákony zraku, napìtí, dráhy a cíle. Vždy buï ve støehu a buï pøipravený.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Teï už jsi velmi dobøe zvládl techniku. Tak pojï a vyzkoušej své znalosti a umìní.
			
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
	description = "Mùžeš mì nìco nauèit?";
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
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Mùžeš mì nìco nauèit?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Tvá zruènost pøedurèuje úspìch pøi lovu.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Bandita Wolf mi mùže ukázat, jak si zlepšit OBRATNOST.");
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
	description = "Gorn øíkal, že mi potøebuješ nìco naléhavého sdìlit?";
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
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn øíkal, že mi potøebuješ nìco naléhavého sdìlit?
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //Jsem rád, že ses pøed odchodem ještì zastavil!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //Pøed èím?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //Pøed tím, než odejdeš navštívit ten 'Nepøíliš Svobodný dùl'.
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
	description = "Co se dìje?";
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
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_01"); //Co se dìje?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Dostal jsem nápad jak vyrobit úplnì novou zbroj.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //Och, a jak?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Pancéøové krunýøe dùlních èervù jsou z nejpevnìjšího materiálu, který znám.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //Nemyslím ty malé nepoškozené vzorky, které se našly v Gomezovì zakopaném dole...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //...NEEE. Ty ne. V našem dole je daleko nebezpeènìjší typ.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //Brnìní tìch bestií je témìø neprorazitelné.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Když mi pøineseš pár tìch ochranných plátù, pokusím se z nich vyrobit zbroj...
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
	description = "Jak dostanu krunýø z tìch bestií?";
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
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //Jak ty pláty z tìch bestií dostanu?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //To je celkem snadné. Zadní pláty jsou pøipevnìné k tìlu jenom podél okrajù.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Vezmi bøitvu a odøízni je podél teèkované èáry.
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //Dobøe, mám to! Podívám se, jestli takové ochranné pláty nenajdu.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nauèit se: Odøíznout ochranné pláty", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,"Bandita Wolf z Nového tábora mi nabídl, že mi zhotoví brnìní z ochranných krunýøù dùlních èervù. Ukázal mi, jak se z mrtvého dùlního èerva odøezávají."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Znalost odstranìní krunýøù - dùlní èerv - bojovník");

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
	description = "A øíkáš mi to jen tak, aniž bys za to nìco chtìl?";
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
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //A øíkáš mi to jen tak, aniž bys za to nìco chtìl?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //Ne tak docela...Pokud se mi z tìch plátù podaøí vyrobit dobrou zbroj, budu.. hodnì brzy... hodnì moc... och, zapomeò na to!
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
	description = "Nasbíral jsem nìjaké ty krunýøe  dùlních èervù!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Nasbíral jsem nìjaké ty ochranné pláty z dùlních èervù!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To nestaèí! To nestaèí na celou zbroj.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Pøines ještì další pláty!
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
	description = "Už jsem nasbíral dost krunýøù dùlních èervù!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Už jsem nasbíral dost ochranných plátù z dùlních èervù!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Vynikající!!! Mùžu se ihned pustit do práce!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak dlouho to bude trvat?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Nemám nejmenší pøedstavu. Je to úplnì nový postup, èlovìèe!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Prostì se tu obèas zastav, když budeš nìkde blízko!

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,"Wolf ode mì dostal patnáct takovýchto krunýøù dùlních èervù. Mám se vrátit pozdìji.");
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
	description = "Jak jsi daleko s tou zbrojí?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Jak jsi daleko s tou zbrojí?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //Bude to asi chvilku trvat, èlovìèe! Tyhle pláty jsou opravdu tìžký materiál. Ještì jsem poøád nepøišel na zpùsob, jak je spojit dohromady!
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Dej mi ještì èas, pøijdu na to!
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
	description = "Jak jsi daleko s tou zbrojí?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Jak daleko ses dostal s tou zbrojí?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Nakonec jsem pøišel na to, jak ty ochranné pláty spojit dohromady!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Znamená to, že je zbroj hotova?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Ano, èlovìèe. Tady je. Vypadá doopravdy silnìjší než jakákoliv jiná zbroj tady v táboøe.
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Díky, nìco ti dlužím!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //To je v poøádku! Už jsem pøišel na to, jak pokrýt svoje výdaje!

	B_LogEntry			(CH4_MCPlateArmor,"Zbroj je dokonèena. Brilantní práce, nejlepší bojová ochrana, jakou jsem kdy vidìl.");
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
	description		= "Kde tady dostanu luk?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Kde tady dostanu luk?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //To jsi na správné adrese. Za dobrou rudu nabízím kvalitu.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Bandita Wolf obchoduje s LUKY.");

};  





