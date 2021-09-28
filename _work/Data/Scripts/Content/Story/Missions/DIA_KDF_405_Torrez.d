//***********************************************
//					EXIT	
//***********************************************

instance  DIA_Torrez_Exit (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  999;
	condition	=  DIA_Torrez_Exit_Condition;
	information	=  DIA_Torrez_Exit_Info;
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  DIA_Torrez_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFirebolt))
	{
	CreateInvItem (self, ItArRuneFirebolt);
	};
};

//***********************************************
//					Hallo	
//***********************************************

instance  DIA_Torrez_Hello (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_Hello_Condition;
	information	=  DIA_Torrez_Hello_Info;
	permanent	=  0;
	description =  "Szukam Arcymistrza Magów Ognia!";
};                       

FUNC int  DIA_Torrez_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Hello_Info()
{
	AI_Output (other, self,"DIA_Torrez_Hello_15_00"); //Szukam Arcymistrza Magów Ognia!
	AI_Output (self, other,"DIA_Torrez_Hello_04_01"); //Zg³oœ siê do Miltena. A teraz znikaj!
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					Belohnung WÄHLEN	
//***********************************************

instance  DIA_Torrez_Belohnung (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_Belohnung_Condition;
	information	=  DIA_Torrez_Belohnung_Info;
	permanent	=  0;
	description =  "Przynios³em list z zewn¹trz i mam sobie wybraæ nagrodê.";
};                       

FUNC int  DIA_Torrez_Belohnung_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_Belohnung_Info()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_15_00"); //Przysy³a mnie Corristo. Przynios³em mu list z zewn¹trz i mam sobie wybraæ nagrodê.
	AI_Output (self, other,"DIA_Torrez_Belohnung_04_01"); //Wyœwiadczy³eœ nam wielk¹ przys³ugê i otrzymasz ka¿d¹ nagrodê, jakiej za¿¹dasz.
	
	Info_ClearChoices	(DIA_Torrez_Belohnung);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Esencja ducha (maks. Mana +5)",DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice		(DIA_Torrez_Belohnung,"3 zwoje (kula ognia, grom i przemiana w œcierwojada)",DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Pierœcieñ zwinnoœci (Zrêcznoœæ +5)",DIA_Torrez_Belohnung_Dex);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Pierœcieñ si³y (Si³a +5)",DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Str_15_00"); //Wezmê ten pierœcieñ si³y.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Str_04_01"); //Tak jak siê spodziewa³em. Proszê, oto on.
	CreateInvItem(self, Staerkering);
	B_GiveInvItems (self, hero, Staerkering, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Dex_15_00"); //Wezmê pierœcieñ zwinnoœci.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Dex_04_01"); //Zwinnoœæ zawsze powinna iœæ przed si³¹. To by³ m¹dry wybór.
	CreateInvItem(self, Ring_des_Geschicks);
	B_GiveInvItems (self, hero, Ring_des_Geschicks, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Scrolls_15_00"); //Wezmê te zwoje z zaklêciami.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Scrolls_04_01"); //Wykorzystaj je m¹drze! Ka¿dego z nich mo¿esz u¿yæ tylko raz!
	CreateInvItems(self, ItArScrollFireball, 3);
	B_GiveInvItems (self, hero, ItArScrollFireball, 3);//Wegen Bildschirmausgabe, wird direkt angepasst
	Npc_RemoveInvItems(other, ItArScrollFireball, 2);
	CreateInvItem(other, ItArScrollTrfScavenger);
	CreateInvItem(other, ItArScrollChainLightning);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_ManaMax_15_00"); //Chcia³bym dostaæ ten napój!
	AI_Output (self, other,"DIA_Torrez_Belohnung_ManaMax_04_01"); //M¹dra decyzja! To najcenniejszy z przedmiotów, które mog³eœ wybraæ. Wypij ten napój, a twoja si³a znacznie wroœnie!
	CreateInvItem(self, ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

//***********************************************
//					Brief TAUSCH
//***********************************************

instance  DIA_Torrez_BriefTausch (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_BriefTausch_Condition;
	information	=  DIA_Torrez_BriefTausch_Info;
	permanent	=  0;
	description =  "Mam dla ciebie list! Ale najpierw chcê dostaæ swoj¹ nagrodê!";
};                       

FUNC int  DIA_Torrez_BriefTausch_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_BriefTausch_Info()
{
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_00"); //Mam dla ciebie list! Ale najpierw chcê dostaæ swoj¹ nagrodê!
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_01"); //Dlaczego nie porozmawiasz z Miltenem?
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_02"); //Ju¿ to zrobi³em.
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_03"); //Rozumiem. Mam tu twoj¹ nagrodê. Poka¿ mi list. Teraz!
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_04"); //Oto on!
		
	if (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_05"); //W nagrodê otrzymasz pierœcieñ si³y. To niezwykle rzadki artefakt. Z pewnoœci¹ bardzo ci siê przyda.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_06"); //A teraz idŸ st¹d!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_01, 1);
		CreateInvItems(self, Staerkering, 1);
		B_GiveInvItems(self,other, Staerkering, 1);
		B_GiveXP(XP_XardasLetter);
	}
	else if (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_07"); //Pieczêæ zosta³a z³amana.
		AI_Output (other, self,"DIA_Torrez_BriefTausch_15_08"); //Có¿, wypadki siê zdarzaj¹.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_09"); //Jako zap³atê dostaniesz napój uzdrawiaj¹cy. Ciesz siê, pos³añcy, którzy przynosz¹ otwarte listy zwykle nie dostaj¹ nic!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_02, 1);
		CreateInvItems(self, ItFo_Potion_Health_03, 1);
		B_GiveInvItems(self, other, ItFo_Potion_Health_03, 1);
		B_GiveXP(XP_XardasLetterOPEN);
	};
	var C_NPC corristo; corristo = Hlp_GetNpc(KdF_402_Corristo);
	
	CreateInvItems(corristo, ItWr_Fire_Letter_02, 1);
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					PERM
//***********************************************

instance  DIA_Torrez_PERM (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_PERM_Condition;
	information	=  DIA_Torrez_PERM_Info;
	permanent	=  1;
	description =  "Co s³ychaæ w œwiecie magii?";
};                       

FUNC int  DIA_Torrez_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_PERM_Info()
{
	AI_Output (other, self,"DIA_Torrez_PERM_15_00"); //Co s³ychaæ w œwiecie magii?
	AI_Output (self, other,"DIA_Torrez_PERM_04_01"); //Nie twój interes!
	AI_StopProcessInfos	( self );
};










///////////////////////////////////////////
///////////////////////////////////////////
/////////////   Kapitel 3   ///////////////
///////////////////////////////////////////
///////////////////////////////////////////

//---------------------------------------------------------
//					WÄHREND DER AUFNAHME	
//---------------------------------------------------------
instance KDF_405_Torrez_BOOK (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_BOOK_Condition;
	information		= KDF_405_Torrez_BOOK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_405_Torrez_BOOK_Condition()
{	
	if    (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	&&    (Npc_KnowsInfo (hero,KDF_403_Drago_RUNE))
	{
		return TRUE;
	};
};
func void  KDF_405_Torrez_BOOK_Info()
{
	
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_01"); //Dla ka¿dego magicznego Krêgu powsta³a ksiêga, opisuj¹ca jego zasady. Powinieneœ je uwa¿nie przestudiowaæ. Wiedza to potêga!
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_02"); //WeŸ ksiêgê Pierwszego Krêgu i przeczytaj j¹ uwa¿nie. Zrozumiesz naturê Ognia.
	CreateInvItem (self,ItWr_Book_Circle_01);
	B_GiveInvItems(self,hero,ItWr_Book_Circle_01, 1);
	AI_StopProcessInfos	( self );
};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDF_405_Torrez_SELLBOOKS (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_SELLBOOKS_Condition;
	information		= KDF_405_Torrez_SELLBOOKS_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poszukujê magicznych ksi¹g."; 
	trade 			= 1;
};

FUNC int  KDF_405_Torrez_SELLBOOKS_Condition()
	{	
		if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
		{
			return TRUE;
		};
	
	};
FUNC void  KDF_405_Torrez_SELLBOOKS_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_SELLBOOKS_Info_15_01"); //Poszukujê magicznych ksi¹g.
};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG						
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_GREET (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_GREET_Condition;
	information		= KDF_405_Torrez_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, Magu!"; 
};

FUNC int  KDF_405_Torrez_GREET_Condition()
	{
		return TRUE;
	};


FUNC void  KDF_405_Torrez_GREET_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_GREET_Info_15_01"); //Witaj, Magu!
	AI_Output (self, other,"KDF_405_Torrez_GREET_Info_04_02"); //Niech Innos zawsze ma ciê w swojej opiece! Zajmujê siê sprzeda¿¹ magicznych artefaktów i mogê ci pokazaæ, jak zwiêkszyæ twoje zdolnoœci magiczne!
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Torrez sprzedaje zwoje z zaklêciami i runy. W ci¹gu dnia znajdê go na dziedziñcu.");

	Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Torrez mo¿e mi pokazaæ, jak zwiêkszyæ moj¹ mana. W ci¹gu dnia znajdê go na dziedziñcu.");
};
// 
instance  KDF_405_Torrez_MANA (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_MANA_Condition;
	information		= KDF_405_Torrez_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebujê wiêkszej mocy magicznej."; 
};

FUNC int  KDF_405_Torrez_MANA_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_MANA_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_MANA_Info_15_01"); //Potrzebujê wiêkszej mocy magicznej.
	AI_Output (self, other,"KDF_405_Torrez_MANA_Info_04_02"); //Poka¿ê ci, jak zwiêkszyæ twoje zdolnoœci magiczne. Jak je wykorzystaæ, zale¿y ju¿ tylko od ciebie.
	
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK							,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 5 (koszt: 5 punktów umiejêtnoœci)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 1 (koszt: 1 punkt umiejêtnoœci)",KDF_405_Torrez_MANA_MAN_1);
};  
func void KDF_405_Torrez_MANA_BACK()
{
	Info_ClearChoices	(KDF_405_Torrez_MANA);
};

func void KDF_405_Torrez_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 1);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 5 (koszt: 5 punktów umiejêtnoœci)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 1 (koszt: 1 punkt umiejêtnoœci)",KDF_405_Torrez_MANA_MAN_1);

};

func void KDF_405_Torrez_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 5 (koszt: 5 punktów umiejêtnoœci)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zwiêksz mana o 1 (koszt: 1 punkt umiejêtnoœci)",KDF_405_Torrez_MANA_MAN_1);

};
/*------------------------------------------------------------------------
							Magier Werden?									
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_WANNABEMAGE (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_WANNABEMAGE_Condition;
	information		= KDF_405_Torrez_WANNABEMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co powinienem zrobiæ, ¿eby zostaæ magiem?"; 
};

FUNC int  KDF_405_Torrez_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, KDF_405_Torrez_GREET))
	&& (Npc_GetTrueGuild (hero) != GIL_KDF)
	&& (!Npc_KnowsInfo (hero, KDF_402_Corristo_WANNBEKDF))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_WANNABEMAGE_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //Co powinienem zrobiæ, ¿eby zostaæ magiem?
	AI_Output (self, other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //Porozmawiaj z Mistrzem Corristo, jeœli znajdzie czas, ¿eby ciê wys³uchaæ.
};  
