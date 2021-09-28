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
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co ty tu robisz? Nie masz tu czego szuka�! Precz!

	AI_StopProcessInfos	(self);
};






//--------------------------------------------------------------------------
// 							�BER DIE MAGIER
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_EXPLAINMAGE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINMAGE_Condition;
	information		= KDF_402_Corristo_EXPLAINMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Powiedz mi - jak to jest by� magiem?"; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Powiedz mi - jak to jest by� magiem?
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Jeste�my Magami Ognia. S�u�ymy Innosowi - najpot�niejszemu z bog�w.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Nasza magia jest darem niebios. Jeste�my kap�anami, nauczycielami i s�dziami jednocze�nie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Dar, kt�ry jest jednocze�nie wielkim ci�arem. To zadanie, kt�re okre�la cel naszego �ycia.
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
	description     = "Chcia�bym przyst�pi� do magicznego Kr�gu.";
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
	AI_Output (other, self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Chcia�bym przyst�pi� do magicznego Kr�gu.
	AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //A wi�c chcesz zosta� Magiem z Kr�gu Ognia? Hmmm...

	
	if	(hero.level < 10)
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jeste� jeszcze got�w. Wr�� do mnie, kiedy zdob�dziesz wi�cej do�wiadczenia.
		
		AI_StopProcessInfos	( self );
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Wielu chcia�o nale�e� do naszego Kr�gu, ale przez te wszystkie lata przyj��em tylko jednego ucznia. Wszyscy pozostali zawiedli.
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Tw�j duch jest dojrza�y i got�w do pr�by. Zanim zostaniesz magiem musisz pomy�lnie przej�� egzamin. Daj mi zna�, kiedy b�dziesz got�w.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices (KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic	(GE_BecomeFiremage,	LOG_NOTE);
		B_LogEntry	(GE_BecomeFiremage,"Corristo zgodzi� si� przyj�� mnie do kr�gu Mag�w Ognia, ale najpierw chce podda� mnie testowi.");
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
	description		= "Jestem got�w. Mo�esz podda� mnie pr�bie."; 
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
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Jestem got�w. Mo�esz podda� mnie pr�bie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Dobrze. S�u�y�e� Bractwu na bagnach, czy� nie?
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Tak.",KDF_402_Corristo_KDFTEST_JA); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Nie.",KDF_402_Corristo_KDFTEST_NO); 

};  
FUNC VOID  KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Tak.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Jak ma na imi� najwy�szy z bog�w?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos.",KDF_402_Corristo_KDFTEST_ADANOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"�ni�cy.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos.",KDF_402_Corristo_KDFTEST_INNOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez.",KDF_402_Corristo_KDFTEST_GOMEZ);
};

FUNC VOID  KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Nie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Nie potrzebujemy tu ludzi, kt�rzy wypieraj� si� w�asnych czyn�w.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Spr�buj szcz�cia jako wojownik, albo Kopacz. �cie�ka magii b�dzie dla ciebie zamkni�ta ju� na zawsze.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //To nieprawid�owa odpowied�. Mo�e w Stra�y b�dzie z ciebie wi�cej po�ytku.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //�ni�cy.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Wygl�da na to, �e zbyt du�o czasu sp�dzi�e� po�r�d wyznawc�w �ni�cego. Chyba lepiej b�dzie, je�li tam wr�cisz.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Jaka jest najwa�niejsza z cn�t?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Honor wojownika.",KDF_402_Corristo_KDFTEST_FIGHT); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Pokora w obliczu magii.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Dyscyplina.",KDF_402_Corristo_KDFTEST_DISZIPLIN); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Bogobojno��.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
FUNC VOID  KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //Gomez.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //My�l�, �e kto� taki jak ty przyda si� raczej w Stra�y. Porozmawiaj z Thorusem!
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
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //My�l�, �e kto� taki jak ty przyda si� raczej w Stra�y. Porozmawiaj z Thorusem!
	AI_StopProcessInfos	( self );

};
FUNC VOID  KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Pokora w obliczu magii.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Udzieli�e� m�drych, przemy�lanych odpowiedzi. Mo�esz zosta� moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //Chod� za mn�. Zaprowadz� ci� do Komnaty Magii, gdzie z�o�ysz staro�ytne �lubowanie.

	AI_StopProcessInfos	( self );
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
FUNC VOID  KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Dyscyplina.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Udzieli�e� m�drych, przemy�lanych odpowiedzi. Mo�esz zosta� moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //Chod� za mn�. Zaprowadz� ci� do Komnaty Magii, gdzie z�o�ysz staro�ytne �lubowanie.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();

};
FUNC VOID  KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Bogobojno��.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Udzieli�e� m�drych, przemy�lanych odpowiedzi. Mo�esz zosta� moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //Chod� za mn�. Zaprowadz� ci� do Komnaty Magii, gdzie z�o�ysz staro�ytne �lubowanie.
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
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Zebrali�my si� tu dzisiaj, aby przyj�� do naszego grona nowego s�ug� Ognia.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Teraz z�o�ysz przysi�g� Ognia.
	Snd_Play   ("howling_01");
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //...Przysi�gam, na pot�g� �wi�tego Ognia...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //...Przysi�gam, na pot�g� �wi�tego Ognia...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z p�omieniem...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z p�omieniem...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy p�omie� mego �ycia wyga�nie.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy p�omie� mego �ycia wyga�nie.
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
	
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_01"); //Wyg�aszaj�c s�owa przysi�gi zosta�e� po wsze czasy zwi�zany ze �wi�tym Ogniem.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_02"); //No� t� szat� na znak tego przymierza.
	AI_StopProcessInfos	(self);
	AI_EquipBestArmor	(hero);
	AI_UnequipWeapons	(hero);
	Npc_SetTrueGuild	(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

	B_LogEntry		(GE_BecomeFiremage,"Przeszed�em test i z�o�y�em przysi�g� Ognia. Od tej pory mog� nosi� czerwon� szat� Kr�gu Ognia!");
	Log_CreateTopic	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Corristo mo�e mnie wprowadzi� w kr�gi magii oraz zwi�kszy� moj� mana. Znajd� go w siedzibie Mag�w Ognia.");	
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
	description		= "Potrzebuj� wi�kszej mocy magicznej."; 
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
	AI_Output (other, self,"KDF_402_Corristo_MANA_Info_15_01"); //Potrzebuj� wi�kszej mocy magicznej.
	AI_Output (self, other,"KDF_402_Corristo_MANA_Info_14_02"); //Poka�� ci, jak zwi�kszy� twoje zdolno�ci magiczne. Jak je wykorzysta�, zale�y ju� tylko od ciebie.
	
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
// 							ERL�UTERUNG DER KREISE
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_EXPLAINCIRCLES (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information		= KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wyja�nij mi znaczenie magicznych Kr�g�w."; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Wyja�nij mi znaczenie magicznych Kr�g�w.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Oczywi�cie. Kr�gi symbolizuj� tw�j udzia� w magicznych mocach.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Symbolizuj� wiedz�, umiej�tno�ci i poznanie magicznych zakl�� i formu�.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Musisz uko�czy� ka�dy Kr�g, zanim wolno ci b�dzie przyst�pi� do nast�pnego.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Czeka ci� wiele godzin �wicze�. To trudna droga, z kt�rej �atwo zboczy�, ale nagroda warta jest po�wi�cenia.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Za ka�dym razem, kiedy awansujesz do kolejnego Kr�gu, poznasz nowe, pot�niejsze zakl�cia. Oczywi�cie magiczne Kr�gi to co� wi�cej ni� tylko mocniejsze czary.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //To istotna cz�� twojego �ycia. One zawsze b�d� z tob�. Uczy� je cz�ci� siebie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Pojmuj�c ich pot�g�, pojmiesz pot�g� siebie samego.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Jestem gotowy do przyst�pienia do Pierwszego Kr�gu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Przyst�pienie do Pierwszego Kr�gu wi��e si� z poznaniem tajnik�w magii runicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Ka�da runa zawiera esencj� szczeg�lnego zakl�cia magicznego.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Wykorzystuj�c swoje zdolno�ci magiczne, b�dziesz w stanie j� uwolni�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_05"); //W odr�nieniu od magicznych zwoj�w zawieraj�cych formu�y zakl��, magia zawarta w runach jest trwa�a.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Runy s� �r�d�em czarodziejskiej mocy, na kt�rym mo�esz polega� w ka�dej sytuacji.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Twoja w�asna magia potrzebna jest podczas korzystania z run tak samo, jak gdy korzystasz z magicznych zwoj�w.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_08"); //W miar� awansowania do kolejnych Kr�g�w, b�dziesz poznawa� nowe runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Wykorzystaj drzemi�c� w runach moc do poznania samego siebie.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Jestem gotowy do przyst�pienia do Drugiego Kr�gu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Pozna�e� ju� magiczn� natur� j�zyka runicznego. Teraz zg��bisz jego tajniki.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Po przyst�pieniu do Drugiego Kr�gu poznasz silniejsze zakl�cia ofensywne oraz tajemnic� magii uzdrawiaj�cej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Musisz si� jeszcze wiele nauczy�, zanim dane ci b�dzie pozna� prawdziwe oblicze magii.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Wiesz ju�, �e runy mog� by� wykorzystywane do chwili wyczerpania twoich w�asnych pok�ad�w si�y magicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Jednak zanim przyst�pisz do dzia�ania, zastan�w si� nad celem, jaki ci przy�wieca. Moce, kt�rymi b�dziesz dysponowa� mog� nie�� �mier� i zniszczenie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Ale prawdziwy mag wykorzystuje swoje zdolno�ci tylko wtedy, gdy jest to absolutnie niezb�dne.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Kiedy w pe�ni u�wiadomisz sobie ten fakt, zrozumiesz prawd� kryj�c� si� za magi� runiczn�.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Mo�esz mnie wprowadzi� w arkana Trzeciego Kr�gu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_02"); //Trzeci Kr�g to jeden z najwa�niejszych etap�w w �yciu ka�dego maga. Przyst�puj�c do niego przestajesz by� uczniem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Zaszed�e� ju� bardzo daleko na �cie�ce magii. Potrafisz pos�ugiwa� si� runami.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Ta wiedza pos�u�y za fundament twojej dalszej nauki. U�ywaj magii runicznej �wiadomie i z rozwag�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_05"); //To, czy z niej skorzystasz, czy nie, powinno zale�e� wy��cznie od ciebie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Wyb�r, kt�rego dokonasz, musi by� ostateczny. W magii nie ma miejsca na wahanie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Wyobra� sobie wyra�nie �cie�k�, kt�r� chcesz kroczy� i ponie� wszelkie konsekwencje swojego wyboru.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Jestem gotowy do przyst�pienia do Czwartego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Uko�czy�e� ju� pierwsze trzy Kr�gi. Nadesz�a pora, by� zg��bi� prawdziw� natur� magii.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Magia runiczna jest zakl�ta w kamieniu. W ko�cu runy to fragmenty magicznej rudy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Tej samej rudy, kt�ra wydobywana jest w kopalniach. Z pomoc� bog�w runy nasycane s� magi� w naszych �wi�tyniach staj�c si� narz�dziem naszej pot�gi.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_05"); //Z twoj� znajomo�ci� magii runicznej, ca�a wiedza zgromadzona przez wszystkie �wi�tynie w tym kr�lestwie stoi przed tob� otworem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Nauczy�em ci� wszystkiego, co sam potrafi�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Pami�taj: poznanie natury magii jest kluczem do poznania natury pot�gi i w�adzy.
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
	AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Mistrzu, chcia�bym nosi� szat� Arcymaga Ognia.
	if (Kapitel < 3) 
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jeste� jeszcze got�w. Wr�� do mnie, kiedy zdob�dziesz wi�cej do�wiadczenia.
		//AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems (hero,ItMinugget)< VALUE_KDF_ARMOR_H) 
	{ 
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	}	
	else
	{	
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Tw�j czas wreszcie nadszed�. Jeste� godzien, by nosi� szat� Arcymaga Ognia.
		
		CreateInvItem		(hero,KDF_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		B_GiveInvItems      (hero, self, ItMinugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor	(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};
	
};  
