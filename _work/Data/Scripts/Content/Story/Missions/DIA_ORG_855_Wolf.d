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
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Jsem Wolf. Vyr�b�m zbroj.

	B_LogEntry			(GE_TraderNC,"Wolf dod�v� bandit�m zbroj. Obvykle b�v� ve sv� chatr�i v p�edn� ��sti velk� obytn� jeskyn�.");
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
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //Hej! Te� jsi jedn�m z n�s, chlap�e.
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
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //Obchoduje� je�t� s n���m jin�m?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Nakupuju od lovc� ko�e�iny a k��e. Jestli n�co takov�ho m�, koup�m to.
	

};

//****************************************
//				Wo J�ger
//****************************************

instance  Org_855_Wolf_WhereHunter (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 900;
	condition		= Org_855_Wolf_WhereHunter_Condition;
	information		= Org_855_Wolf_WhereHunter_Info;
	permanent		= 1;
	description		= "Jak st�hnu ko�e�iny a k��e?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //Jak st�hnu ko�e�iny a k��e?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //Po cest� do Nov�ho t�bora p�ijde� k Aidanovi. Nau�� t� stahovat zv��.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford a Drax se potloukaj� severn� od Star�ho t�bora. Je to po cest� k m�stu v�m�ny.
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
	description = "Sh�n�m lep�� zbroj.";
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
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Sh�n�m lep�� zbroj.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Te� kdy� jsi jedn�m z n�s, m��u ti jednu prodat.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Nem��u ti nic prodat. Lares by m� zabil, kdybych prodal zbroj cizinc�m.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Chci st�edn� zbroj.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //��dn� ruda, ��dn� zbroj.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //To je dobr� zbroj. Ne sice tak dobr� jako ta, co nos�m j�, ale ochr�n� t� tak� dob�e.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //M��e� mi prodat t�kou zbroj?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //��dn� ruda, ��dn� zbroj.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //Tahle zbroj t� ochr�n� p�ed ka�d�m nebezpe��m! Nos�m ji s�m a p�e��v�m u� dost dlouho. V neposledn�m d�ky t�hle zbroji.

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
	description		= "R�d bych se nau�il zach�zet s lukem."; 
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //R�d bych se nau�il zach�zet s lukem.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //M��u t� to nau�it. Ale nem��u to d�lat jenom pro radost. P�edev��m mus�m tak� n�co j�st.
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Kolik?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //V�echno, co t� nau��m, bude st�t 50 nuget�. A bez smlouv�n�.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Bandita Wolf m� m��e nau�it pou��vat LUK.");
	
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
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Nau� m� zach�zet s lukem.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Tv�j z�sah z�le�� na tv� zru�nosti. ��m pohotov�j�� bude�, t�m p�esn�ji zas�hne tv�j ��p c�l.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Tvoje obratnost ur�uje vzd�lenost, ze kter� dok�e� zas�hnout c�l. Aby se z tebe stal dobr� st�elec, m�l bys vylep�ovat oboj� rovnom�rn�.
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
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Chci se zlep�it v um�n� lukost�elby.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //U� je z tebe dobr� lovec. Te� si osvoj� zb�vaj�c� znalosti.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Aby ses stal dobr�m st�elcem, mus� se o to p�estat sna�it.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Objev z�kony zraku, nap�t�, dr�hy a c�le. V�dy bu� ve st�ehu a bu� p�ipraven�.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Te� u� jsi velmi dob�e zvl�dl techniku. Tak poj� a vyzkou�ej sv� znalosti a um�n�.
			
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
	description = "M��e� m� n�co nau�it?";
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
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //M��e� m� n�co nau�it?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Tv� zru�nost p�edur�uje �sp�ch p�i lovu.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Bandita Wolf mi m��e uk�zat, jak si zlep�it OBRATNOST.");
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
	description = "Gorn ��kal, �e mi pot�ebuje� n�co nal�hav�ho sd�lit?";
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
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn ��kal, �e mi pot�ebuje� n�co nal�hav�ho sd�lit?
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //Jsem r�d, �e ses p�ed odchodem je�t� zastavil!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //P�ed ��m?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //P�ed t�m, ne� odejde� nav�t�vit ten 'Nep��li� Svobodn� d�l'.
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
	description = "Co se d�je?";
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
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_01"); //Co se d�je?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Dostal jsem n�pad jak vyrobit �pln� novou zbroj.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //Och, a jak?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Panc��ov� krun��e d�ln�ch �erv� jsou z nejpevn�j��ho materi�lu, kter� zn�m.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //Nemysl�m ty mal� nepo�kozen� vzorky, kter� se na�ly v Gomezov� zakopan�m dole...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //...NEEE. Ty ne. V na�em dole je daleko nebezpe�n�j�� typ.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //Brn�n� t�ch besti� je t�m�� neproraziteln�.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Kdy� mi p�inese� p�r t�ch ochrann�ch pl�t�, pokus�m se z nich vyrobit zbroj...
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
	description = "Jak dostanu krun�� z t�ch besti�?";
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
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //Jak ty pl�ty z t�ch besti� dostanu?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //To je celkem snadn�. Zadn� pl�ty jsou p�ipevn�n� k t�lu jenom pod�l okraj�.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Vezmi b�itvu a od��zni je pod�l te�kovan� ��ry.
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //Dob�e, m�m to! Pod�v�m se, jestli takov� ochrann� pl�ty nenajdu.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Nau�it se: Od��znout ochrann� pl�ty", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,"Bandita Wolf z Nov�ho t�bora mi nab�dl, �e mi zhotov� brn�n� z ochrann�ch krun��� d�ln�ch �erv�. Uk�zal mi, jak se z mrtv�ho d�ln�ho �erva od�ez�vaj�."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Znalost odstran�n� krun��� - d�ln� �erv - bojovn�k");

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
	description = "A ��k� mi to jen tak, ani� bys za to n�co cht�l?";
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
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //A ��k� mi to jen tak, ani� bys za to n�co cht�l?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //Ne tak docela...Pokud se mi z t�ch pl�t� poda�� vyrobit dobrou zbroj, budu.. hodn� brzy... hodn� moc... och, zapome� na to!
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
	description = "Nasb�ral jsem n�jak� ty krun��e  d�ln�ch �erv�!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Nasb�ral jsem n�jak� ty ochrann� pl�ty z d�ln�ch �erv�!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //To nesta��! To nesta�� na celou zbroj.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //P�ines je�t� dal�� pl�ty!
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
	description = "U� jsem nasb�ral dost krun��� d�ln�ch �erv�!";
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
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //U� jsem nasb�ral dost ochrann�ch pl�t� z d�ln�ch �erv�!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Vynikaj�c�!!! M��u se ihned pustit do pr�ce!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Jak dlouho to bude trvat?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Nem�m nejmen�� p�edstavu. Je to �pln� nov� postup, �lov��e!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Prost� se tu ob�as zastav, kdy� bude� n�kde bl�zko!

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,"Wolf ode m� dostal patn�ct takov�chto krun��� d�ln�ch �erv�. M�m se vr�tit pozd�ji.");
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
	description = "Jak jsi daleko s tou zbroj�?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Jak jsi daleko s tou zbroj�?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //Bude to asi chvilku trvat, �lov��e! Tyhle pl�ty jsou opravdu t�k� materi�l. Je�t� jsem po��d nep�i�el na zp�sob, jak je spojit dohromady!
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Dej mi je�t� �as, p�ijdu na to!
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
	description = "Jak jsi daleko s tou zbroj�?";
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
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Jak daleko ses dostal s tou zbroj�?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Nakonec jsem p�i�el na to, jak ty ochrann� pl�ty spojit dohromady!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Znamen� to, �e je zbroj hotova?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Ano, �lov��e. Tady je. Vypad� doopravdy siln�j�� ne� jak�koliv jin� zbroj tady v t�bo�e.
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //D�ky, n�co ti dlu��m!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //To je v po��dku! U� jsem p�i�el na to, jak pokr�t svoje v�daje!

	B_LogEntry			(CH4_MCPlateArmor,"Zbroj je dokon�ena. Brilantn� pr�ce, nejlep�� bojov� ochrana, jakou jsem kdy vid�l.");
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
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //To jsi na spr�vn� adrese. Za dobrou rudu nab�z�m kvalitu.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Bandita Wolf obchoduje s LUKY.");

};  





