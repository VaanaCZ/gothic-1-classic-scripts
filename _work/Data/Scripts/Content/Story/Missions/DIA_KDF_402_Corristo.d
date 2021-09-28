instance  KDF_402_Corristo_Exit (C_INFO)
{
	npc			=  KDF_402_Corristo;
	nr			=  999;
	condition	=  KDF_402_Corristo_Exit_Condition;
	information	=  KDF_402_Corristo_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KDF_402_Corristo_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_402_Corristo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


// ************************ Intruder **************************

instance  Info_Corristo_Intruder (C_INFO)
{
	npc			=	KDF_402_Corristo;
	nr			=	1;
	condition	=	Info_Corristo_Intruder_Condition;
	information	=	Info_Corristo_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Corristo_Intruder_Condition()
{
	if	Npc_IsInState(self,ZS_Talk)
	&&	( (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

FUNC VOID  Info_Corristo_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co ty tu robisz? Nie masz tu czego szukaæ! Precz!

	AI_StopProcessInfos	(self);
};






//--------------------------------------------------------------------------
// 							ÜBER DIE MAGIER
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_EXPLAINMAGE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINMAGE_Condition;
	information		= KDF_402_Corristo_EXPLAINMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Powiedz mi - jak to jest byæ magiem?"; 
};

FUNC int  KDF_402_Corristo_EXPLAINMAGE_Condition()
{	
	if (!Npc_KnowsInfo (hero,KDF_402_Corristo_WANNBEKDF))
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_EXPLAINMAGE_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Powiedz mi - jak to jest byæ magiem?
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Jesteœmy Magami Ognia. S³u¿ymy Innosowi - najpotê¿niejszemu z bogów.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Nasza magia jest darem niebios. Jesteœmy kap³anami, nauczycielami i sêdziami jednoczeœnie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Dar, który jest jednoczeœnie wielkim ciê¿arem. To zadanie, które okreœla cel naszego ¿ycia.
};  
//--------------------------------------------------------------------------
// 							MAGIERAUFNAHME
//--------------------------------------------------------------------------
instance KDF_402_Corristo_WANNBEKDF (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_WANNBEKDF_Condition;
	information		= KDF_402_Corristo_WANNBEKDF_Info;
	important		= 0;
	permanent		= 1;
	description     = "Chcia³bym przyst¹piæ do magicznego Krêgu.";
};

FUNC int  KDF_402_Corristo_WANNBEKDF_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_WANNBEKDF_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Chcia³bym przyst¹piæ do magicznego Krêgu.
	AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //A wiêc chcesz zostaæ Magiem z Krêgu Ognia? Hmmm...

	
	if	(hero.level < 10)
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jesteœ jeszcze gotów. Wróæ do mnie, kiedy zdobêdziesz wiêcej doœwiadczenia.
		
		AI_StopProcessInfos	( self );
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Wielu chcia³o nale¿eæ do naszego Krêgu, ale przez te wszystkie lata przyj¹³em tylko jednego ucznia. Wszyscy pozostali zawiedli.
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Twój duch jest dojrza³y i gotów do próby. Zanim zostaniesz magiem musisz pomyœlnie przejœæ egzamin. Daj mi znaæ, kiedy bêdziesz gotów.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices (KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic	(GE_BecomeFiremage,	LOG_NOTE);
		B_LogEntry	(GE_BecomeFiremage,"Corristo zgodzi³ siê przyj¹æ mnie do krêgu Magów Ognia, ale najpierw chce poddaæ mnie testowi.");
	};
};
//--------------------------------------------------------------------------
// 							DIE PROBE 
//-------------------------------------------------------------------------- 
instance  KDF_402_Corristo_KDFTEST (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KDFTEST_Condition;
	information		= KDF_402_Corristo_KDFTEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem gotów. Mo¿esz poddaæ mnie próbie."; 
};

FUNC int  KDF_402_Corristo_KDFTEST_Condition()
{	
	if (Corristo_KDFAufnahme == 1)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KDFTEST_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Jestem gotów. Mo¿esz poddaæ mnie próbie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Dobrze. S³u¿y³eœ Bractwu na bagnach, czy¿ nie?
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Tak.",KDF_402_Corristo_KDFTEST_JA); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Nie.",KDF_402_Corristo_KDFTEST_NO); 

};  
FUNC VOID  KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Tak.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Jak ma na imiê najwy¿szy z bogów?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos.",KDF_402_Corristo_KDFTEST_ADANOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Œni¹cy.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos.",KDF_402_Corristo_KDFTEST_INNOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez.",KDF_402_Corristo_KDFTEST_GOMEZ);
};

FUNC VOID  KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Nie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Nie potrzebujemy tu ludzi, którzy wypieraj¹ siê w³asnych czynów.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Spróbuj szczêœcia jako wojownik, albo Kopacz. Œcie¿ka magii bêdzie dla ciebie zamkniêta ju¿ na zawsze.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //To nieprawid³owa odpowiedŸ. Mo¿e w Stra¿y bêdzie z ciebie wiêcej po¿ytku.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //Œni¹cy.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Wygl¹da na to, ¿e zbyt du¿o czasu spêdzi³eœ poœród wyznawców Œni¹cego. Chyba lepiej bêdzie, jeœli tam wrócisz.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Jaka jest najwa¿niejsza z cnót?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Honor wojownika.",KDF_402_Corristo_KDFTEST_FIGHT); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Pokora w obliczu magii.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Dyscyplina.",KDF_402_Corristo_KDFTEST_DISZIPLIN); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Bogobojnoœæ.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
FUNC VOID  KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //Gomez.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //Myœlê, ¿e ktoœ taki jak ty przyda siê raczej w Stra¿y. Porozmawiaj z Thorusem!
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
//--------------------------------------------------------------------------
// 							DIE PROBE 3
//--------------------------------------------------------------------------
FUNC VOID  KDF_402_Corristo_KDFTEST_FIGHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //Honor wojownika.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //Myœlê, ¿e ktoœ taki jak ty przyda siê raczej w Stra¿y. Porozmawiaj z Thorusem!
	AI_StopProcessInfos	( self );

};
FUNC VOID  KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Pokora w obliczu magii.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Udzieli³eœ m¹drych, przemyœlanych odpowiedzi. Mo¿esz zostaæ moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //ChodŸ za mn¹. Zaprowadzê ciê do Komnaty Magii, gdzie z³o¿ysz staro¿ytne œlubowanie.

	AI_StopProcessInfos	( self );
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
FUNC VOID  KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Dyscyplina.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Udzieli³eœ m¹drych, przemyœlanych odpowiedzi. Mo¿esz zostaæ moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //ChodŸ za mn¹. Zaprowadzê ciê do Komnaty Magii, gdzie z³o¿ysz staro¿ytne œlubowanie.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();

};
FUNC VOID  KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Bogobojnoœæ.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Udzieli³eœ m¹drych, przemyœlanych odpowiedzi. Mo¿esz zostaæ moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //ChodŸ za mn¹. Zaprowadzê ciê do Komnaty Magii, gdzie z³o¿ysz staro¿ytne œlubowanie.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();
};
//--------------------------------------------------------------------------
// 							DAS AUFNAHMERITUAL
//--------------------------------------------------------------------------
instance KDF_402_Corristo_AUFNAHME (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_AUFNAHME_Condition;
	information		= KDF_402_Corristo_AUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_402_Corristo_AUFNAHME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"OCC_CHAPEL_UPSTAIRS") < 500)
	&& (Corristo_KDFAufnahme == 4)
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_AUFNAHME_Info()
{
	
	Corristo_KDFAufnahme = 5;
	B_Story_Feueraufnahme();
	AI_UnequipWeapons (hero); 
	AI_SetWalkmode (hero,NPC_WALK); 
	AI_GotoNpc (hero,self);
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Zebraliœmy siê tu dzisiaj, aby przyj¹æ do naszego grona nowego s³ugê Ognia.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Teraz z³o¿ysz przysiêgê Ognia.
	Snd_Play   ("howling_01");
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //...Przysiêgam, na potêgê œwiêtego Ognia...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //...Przysiêgam, na potêgê œwiêtego Ognia...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z p³omieniem...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z p³omieniem...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy p³omieñ mego ¿ycia wygaœnie.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy p³omieñ mego ¿ycia wygaœnie.
	AI_StopProcessInfos	( self );
};
instance KDF_402_Corristo_ROBE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_ROBE_Condition;
	information		= KDF_402_Corristo_ROBE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_402_Corristo_ROBE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_402_Corristo_AUFNAHME))
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_ROBE_Info()
{
	Snd_Play			("MFX_Heal_Cast"); 
	
	CreateInvItem		(hero,KDF_ARMOR_L);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_01"); //Wyg³aszaj¹c s³owa przysiêgi zosta³eœ po wsze czasy zwi¹zany ze œwiêtym Ogniem.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_02"); //Noœ tê szatê na znak tego przymierza.
	AI_StopProcessInfos	(self);
	AI_EquipBestArmor	(hero);
	AI_UnequipWeapons	(hero);
	Npc_SetTrueGuild	(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

	B_LogEntry		(GE_BecomeFiremage,"Przeszed³em test i z³o¿y³em przysiêgê Ognia. Od tej pory mogê nosiæ czerwon¹ szatê Krêgu Ognia!");
	Log_CreateTopic	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Corristo mo¿e mnie wprowadziæ w krêgi magii oraz zwiêkszyæ moj¹ mana. Znajdê go w siedzibie Magów Ognia.");	
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_MANA (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_MANA_Condition;
	information		= KDF_402_Corristo_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebujê wiêkszej mocy magicznej."; 
};

FUNC int  KDF_402_Corristo_MANA_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF) 
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_MANA_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_MANA_Info_15_01"); //Potrzebujê wiêkszej mocy magicznej.
	AI_Output (self, other,"KDF_402_Corristo_MANA_Info_14_02"); //Poka¿ê ci, jak zwiêkszyæ twoje zdolnoœci magiczne. Jak je wykorzystaæ, zale¿y ju¿ tylko od ciebie.
	
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK	,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);
};  
func void KDF_402_Corristo_MANA_BACK()
{
	Info_ClearChoices	(KDF_402_Corristo_MANA);
};

func void KDF_402_Corristo_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK								,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);

};

func void KDF_402_Corristo_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK								,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);

};
//--------------------------------------------------------------------------
// 							ERLÄUTERUNG DER KREISE
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_EXPLAINCIRCLES (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information		= KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wyjaœnij mi znaczenie magicznych Krêgów."; 
};

FUNC int  KDF_402_Corristo_EXPLAINCIRCLES_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF) 
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_EXPLAINCIRCLES_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Wyjaœnij mi znaczenie magicznych Krêgów.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Oczywiœcie. Krêgi symbolizuj¹ twój udzia³ w magicznych mocach.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Symbolizuj¹ wiedzê, umiejêtnoœci i poznanie magicznych zaklêæ i formu³.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Musisz ukoñczyæ ka¿dy Kr¹g, zanim wolno ci bêdzie przyst¹piæ do nastêpnego.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Czeka ciê wiele godzin æwiczeñ. To trudna droga, z której ³atwo zboczyæ, ale nagroda warta jest poœwiêcenia.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Za ka¿dym razem, kiedy awansujesz do kolejnego Krêgu, poznasz nowe, potê¿niejsze zaklêcia. Oczywiœcie magiczne Krêgi to coœ wiêcej ni¿ tylko mocniejsze czary.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //To istotna czêœæ twojego ¿ycia. One zawsze bêd¹ z tob¹. Uczyñ je czêœci¹ siebie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Pojmuj¹c ich potêgê, pojmiesz potêgê siebie samego.
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS1 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS1_Condition;
	information		= KDF_402_Corristo_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDF_402_Corristo_KREIS1_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(Npc_KnowsInfo (hero,KDF_402_Corristo_EXPLAINCIRCLES))
	&&	(Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS1_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Jestem gotowy do przyst¹pienia do Pierwszego Krêgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Przyst¹pienie do Pierwszego Krêgu wi¹¿e siê z poznaniem tajników magii runicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Ka¿da runa zawiera esencjê szczególnego zaklêcia magicznego.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Wykorzystuj¹c swoje zdolnoœci magiczne, bêdziesz w stanie j¹ uwolniæ.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_05"); //W odró¿nieniu od magicznych zwojów zawieraj¹cych formu³y zaklêæ, magia zawarta w runach jest trwa³a.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Runy s¹ Ÿród³em czarodziejskiej mocy, na którym mo¿esz polegaæ w ka¿dej sytuacji.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Twoja w³asna magia potrzebna jest podczas korzystania z run tak samo, jak gdy korzystasz z magicznych zwojów.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_08"); //W miarê awansowania do kolejnych Krêgów, bêdziesz poznawa³ nowe runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Wykorzystaj drzemi¹c¹ w runach moc do poznania samego siebie.
		KDF_402_Corristo_KREIS1.permanent	= 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS2 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS2_Condition;
	information		= KDF_402_Corristo_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDF_402_Corristo_KREIS2_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS2_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Jestem gotowy do przyst¹pienia do Drugiego Krêgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Pozna³eœ ju¿ magiczn¹ naturê jêzyka runicznego. Teraz zg³êbisz jego tajniki.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Po przyst¹pieniu do Drugiego Krêgu poznasz silniejsze zaklêcia ofensywne oraz tajemnicê magii uzdrawiaj¹cej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Musisz siê jeszcze wiele nauczyæ, zanim dane ci bêdzie poznaæ prawdziwe oblicze magii.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Wiesz ju¿, ¿e runy mog¹ byæ wykorzystywane do chwili wyczerpania twoich w³asnych pok³adów si³y magicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Jednak zanim przyst¹pisz do dzia³ania, zastanów siê nad celem, jaki ci przyœwieca. Moce, którymi bêdziesz dysponowa³ mog¹ nieœæ œmieræ i zniszczenie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Ale prawdziwy mag wykorzystuje swoje zdolnoœci tylko wtedy, gdy jest to absolutnie niezbêdne.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Kiedy w pe³ni uœwiadomisz sobie ten fakt, zrozumiesz prawdê kryj¹c¹ siê za magi¹ runiczn¹.
		KDF_402_Corristo_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS3 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS3_Condition;
	information		= KDF_402_Corristo_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDF_402_Corristo_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	 
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS3_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Mo¿esz mnie wprowadziæ w arkana Trzeciego Krêgu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_02"); //Trzeci Kr¹g to jeden z najwa¿niejszych etapów w ¿yciu ka¿dego maga. Przystêpuj¹c do niego przestajesz byæ uczniem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Zaszed³eœ ju¿ bardzo daleko na œcie¿ce magii. Potrafisz pos³ugiwaæ siê runami.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Ta wiedza pos³u¿y za fundament twojej dalszej nauki. U¿ywaj magii runicznej œwiadomie i z rozwag¹.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_05"); //To, czy z niej skorzystasz, czy nie, powinno zale¿eæ wy³¹cznie od ciebie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Wybór, którego dokonasz, musi byæ ostateczny. W magii nie ma miejsca na wahanie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_07"); //WyobraŸ sobie wyraŸnie œcie¿kê, któr¹ chcesz kroczyæ i ponieœ wszelkie konsekwencje swojego wyboru.
		KDF_402_Corristo_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS4 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS4_Condition;
	information		= KDF_402_Corristo_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDF_402_Corristo_KREIS4_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS4_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Jestem gotowy do przyst¹pienia do Czwartego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Ukoñczy³eœ ju¿ pierwsze trzy Krêgi. Nadesz³a pora, byœ zg³êbi³ prawdziw¹ naturê magii.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Magia runiczna jest zaklêta w kamieniu. W koñcu runy to fragmenty magicznej rudy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Tej samej rudy, która wydobywana jest w kopalniach. Z pomoc¹ bogów runy nasycane s¹ magi¹ w naszych œwi¹tyniach staj¹c siê narzêdziem naszej potêgi.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_05"); //Z twoj¹ znajomoœci¹ magii runicznej, ca³a wiedza zgromadzona przez wszystkie œwi¹tynie w tym królestwie stoi przed tob¹ otworem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Nauczy³em ciê wszystkiego, co sam potrafiê.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Pamiêtaj: poznanie natury magii jest kluczem do poznania natury potêgi i w³adzy.
		KDF_402_Corristo_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE									
------------------------------------------------------------------------*/

instance  KDF_402_Corristo_HEAVYARMOR (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_HEAVYARMOR_Condition;
	information		= KDF_402_Corristo_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_CorristoHighRobe,VALUE_KDF_ARMOR_H); 
};

FUNC int  KDF_402_Corristo_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_HEAVYARMOR_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Mistrzu, chcia³bym nosiæ szatê Arcymaga Ognia.
	if (Kapitel < 3) 
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jesteœ jeszcze gotów. Wróæ do mnie, kiedy zdobêdziesz wiêcej doœwiadczenia.
		//AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems (hero,ItMinugget)< VALUE_KDF_ARMOR_H) 
	{ 
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	}	
	else
	{	
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Twój czas wreszcie nadszed³. Jesteœ godzien, by nosiæ szatê Arcymaga Ognia.
		
		CreateInvItem		(hero,KDF_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		B_GiveInvItems      (hero, self, ItMinugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor	(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};
	
};  
