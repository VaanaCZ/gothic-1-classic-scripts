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
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co tady d�l�? Tady nem� co pohled�vat! Zmiz!

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
	description		= "�ekni mi - jak� to je b�t m�gem."; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //�ekni mi - jak� to je, b�t m�gem.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Jsme m�gov� Ohn�. Jsme slu�ebn�ci Innose, nejvy���ho ze v�ech boh�.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Na�e kouzla jsou dar bo��. Byli jsme zvoleni, abychom p�sobili jako kn��, u�itel� a soudci.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Je to dar, kter� je na��m trval�m b�emenem. �kolem, kter� ur�uje na�e �ivoty.
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
	description     = "Cht�l bych vstoupit do magick�ho Kruhu.";
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
	AI_Output (other, self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Cht�l bych vstoupit do magick�ho Kruhu.
	AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //Tak ty se chce� st�t m�gem Kruhu ohn�? Hm...

	
	if	(hero.level < 10)
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Je�t� nem� dostate�n� v�domosti. Vra� se, a� bude� zn�t v�c.
		
		AI_StopProcessInfos	( self );
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Mnoz� se k n�m cht�li p�idat, ale za ta l�ta jsem p�ijal jen jedin�ho za sv�ho u�edn�ka. V�ichni ostatn� neusp�li.
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Tvoje du�e je vyzr�l� a p�ipraven� se k n�m p�idat. Jestli se chce� st�t m�gem, mus�m t� nejd��ve vyzkou�et. �ekni mi, a� bude� p�ipraven na zkou�ku.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices (KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic	(GE_BecomeFiremage,	LOG_NOTE);
		B_LogEntry	(GE_BecomeFiremage,"Corristo mi �ekl, �e mi dovol� p�idat se ke Kruhu m�g� Ohn�. Nejd��v v�ak mus�m slo�it zkou�ku.");
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
	description		= "Jsem p�ipraven. Vyzkou�ej m�."; 
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
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Jsem p�ipraven. Vyzkou�ej m�.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Dob�e. Slou�il jsi Bratrstvu u ba�in, �e ano?
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ano.",KDF_402_Corristo_KDFTEST_JA); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ne",KDF_402_Corristo_KDFTEST_NO); 

};  
FUNC VOID  KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Ano.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Jak se jmenuje n� b�h?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos.",KDF_402_Corristo_KDFTEST_ADANOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Sp��.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos.",KDF_402_Corristo_KDFTEST_INNOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez.",KDF_402_Corristo_KDFTEST_GOMEZ);
};

FUNC VOID  KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Ne.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Nepot�ebujeme mu�e, kter� zap�r� sv� �iny.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Bu� rad�ji u�ite�n� jako bojovn�k nebo kop��. Cesta k magii pro tebe z�stane prov�dy uzav�en�.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //To nen� spr�vn�. Mo�n� by t� mohly vyu��t str�e.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //Sp��.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Vypad� jako n�kdo, kdo str�vil p��li� �asu mezi bratry z ba�in. Mo�n� bys m�l rad�ji z�stat tam.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Jak� je nejvy��� ctnost?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"�est bojovn�ka.",KDF_402_Corristo_KDFTEST_FIGHT); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Pokora p�ed tv��� magie.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Uk�zn�nost mu�e.",KDF_402_Corristo_KDFTEST_DISZIPLIN); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Bohabojnost.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
FUNC VOID  KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //Gomez.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //Mysl�m, �e tv� m�sto bude u str��! Promluv s Thorusem!
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
//--------------------------------------------------------------------------
// 							DIE PROBE 3
//--------------------------------------------------------------------------
FUNC VOID  KDF_402_Corristo_KDFTEST_FIGHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //�est bojovn�ka.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //Mysl�m, �e tv� m�sto bude u str��! Promluv s Thorusem!
	AI_StopProcessInfos	( self );

};
FUNC VOID  KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Pokora p�ed tv��i magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Odpov�dal jsi dob�e a spr�vn�. Budu t� u�it um�n� magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //N�sleduj m� do S�lu magie, kde slo�� prastar� slib.

	AI_StopProcessInfos	( self );
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
FUNC VOID  KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Uk�zn�nost mu�e.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Odpov�dal jsi dob�e a spr�vn�. Budu t� u�it um�n� magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //N�sleduj m� do S�lu magie, kde slo�� prastar� slib.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();

};
FUNC VOID  KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Bohabojnost.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Odpov�dal jsi dob�e a spr�vn�. Budu t� u�it um�n� magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //N�sleduj m� do S�lu magie, kde slo�� prastar� slib.
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
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Dnes jsme se tu shrom�dili, abysme vysv�tili slu�ebn�ka Ohn�.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Te� prones p��sahu ohn�.
	Snd_Play   ("howling_01");
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //P��sah�m p�i moci bo��...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //P��sah�m p�i moci bo��...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //...p��sah�m p�i moci svat�ho Ohn�...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //...p��sah�m p�i moci svat�ho Ohn�...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...�e m� v�domosti a m� skutky vejdou od tohoto okam�iku a nav�dy v jednotu s ohn�m...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...�e m� v�domosti a m� skutky vejdou od tohoto okam�iku a nav�dy v jednotu s ohn�m...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...dokud m� t�lo nebude navr�ceno ��i Beliarov� a ohe� m�ho �ivota nepohasne.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...dokud m� t�lo nebude navr�ceno ��i Beliarov� a ohe� m�ho �ivota nepohasne.
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
	
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_01"); //Pronesen�m slov t�to p��sahy jsi nyn� vstoupil ve spojen� s Ohn�m.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_02"); //Nos toto roucho na znamen� v��n�ho svazku.
	AI_StopProcessInfos	(self);
	AI_EquipBestArmor	(hero);
	AI_UnequipWeapons	(hero);
	Npc_SetTrueGuild	(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

	B_LogEntry		(GE_BecomeFiremage,"Slo�il jsem zkou�ku a pronesl p��sahu Ohn�. Nyn� sm�m nosit roucho Kruhu ohn�! ");
	Log_CreateTopic	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Corristo m� m��e nau�it magick� KRUHY a zv��it moji magickou energii. Ob�v� d�m m�g� Ohn�.");	
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
	description		= "Pot�ebuji v�ce magick� moci."; 
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
	AI_Output (other, self,"KDF_402_Corristo_MANA_Info_15_01"); //Pot�ebuji v�ce magick� moci.
	AI_Output (self, other,"KDF_402_Corristo_MANA_Info_14_02"); //M��u ti pomoci zv�t�it tvoji s�lu. Jak ji pou�ije�, je u� tvoje v�c.
	
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
	description		= "Vysv�tli mi v�znam kouzeln�ch Kruh�."; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Vysv�tli mi v�znam kouzeln�ch Kruh�.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Jist�. Tyhle Kruhy zn�zor�uj�, �e sd�l� kouzlo.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Jsou tady pro v�d�n�, dovednost a u�en� nov�ch kouzeln�ch za��k�vadel.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Aby ses mohl p�idat k dal��mu Kruhu, mus� proj�t p�edchoz�m.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Vy�aduje to dlouh� u�en� a tak� bude� pot�ebovat z�skat spoustu zku�enost�, ne� dos�hne� vy���ch kruh�.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Ale tvoje �sil� o jejich dosa�en� bude poka�d� odm�n�no nov�mi a mocn�j��mi kouzly. Kouzeln� Kruhy jsou v�ak je�t� n���m v�ce.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //Jsou sou��st� �ivota. Budou v�dy s tebou. Ber je jako sou��st sebe sama.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Abys porozum�l jejich moci, mus� poznat s�m sebe.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Jsem p�ipraven vstoupit do Prvn�ho Kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Vstoupit do prvn�ho z kouzeln�ch Kruh� znamen� nau�it se pou��vat kouzeln� runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Ka�d� runa obsahuje strukturu zvl�tn�ho kouzeln�ho za��k�vadla.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Spolu se sv�mi vlastn�mi kouzeln�mi silami bude� schopen vyu��vat kouzlo run.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_05"); //Ale narozd�l od kouzeln�ch svitk�, kter� jsou tak� kouzeln�mi formulemi, magick� s�la run zaji��uje, �e struktura za��k�vadla p�etrv�v�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Ka�d� runa je zdrojem magick� s�ly, kterou m��e� kdykoliv zase zru�it.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Svoji vlastn� kouzelnou moc vyu�ije� tehdy, kdy� pou�ije� runu, podobn� jako je tomu s kouzeln�m svitkem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_08"); //Se vstupem do ka�d�ho dal��ho Kruhu se nau�� vyu��vat tak� dal�� kouzeln� runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Vyu�ij moc run k pozn�n� sebe sama.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Jsem p�ipraven vstoupit do Druh�ho kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Nau�il ses rozum�t kouzeln�m znak�m. Nade�el �as prohloubit toto porozum�n�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Jakmile se p�id� ke Druh�mu kruhu, nau�� se z�klad�m mocn�j��ch bojov�ch za��k�vadel a v�em taj�m ranhoji�stv�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Bude� se ale muset nau�it je�t� v�c, jestli chce� poznat opravdov� tajemstv� magie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_05"); //V�, �e ka�dou runu m��e� pou��vat jak �asto chce�, dokud nevy�erp� sv� vlastn� s�ly.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Ne� bude� jednat, rozmysli si c�l sv�ho jedn�n�. Nabyl jsi s�ly, kter� t� snadno m��e dov�st k z�hub� a zni�en�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Opravdov� kouzeln�k ale u��v� kouzla jen tehdy, kdy� je to nezbytn�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Pokud porozum� situaci, pak pozn� moc run.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS3_Info_15_01"); //M��e� m� p�ipravit do T�et�ho kruhu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_02"); //T�et� kouzeln� kruh je jedn�m z nejd�le�it�j��ch krok� v �ivot� m�ga. Jakmile ho dos�hne�, p�est�v� b�t hleda�em.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Do�el jsi u� po cest� magie opravdu daleko. Nau�il ses pou��vat kouzeln� runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Tato znalost je v�chodisko pro tvoj� dal�� cestu. Pou��vej tyto runy s uv�en�m.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_05"); //Runy m��e� nebo nemus� pou��vat. Ale mus� se rozhodnout pro jednu z t�chto mo�nost�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Jakmile se rozhodne�, neost�chej se vyu��t sv�ch sil.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Jakmile porozum� sv� cest�, pak pozn� s�lu rozhodnut�.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Jsem p�ipraven vstoupit do P�t�ho kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Dokon�il jsi prvn� t�i Kruhy. Nyn� nade�el �as nau�it se tajemstv� magie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Kouzlo run je zalo�eno na kamenech. Existuj� kouzeln� kameny, vytvo�en� z kouzeln� rudy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Z t� sam� rudy, kter� se t�� tady v dolech. Tato ruda je obda�ena magick�mi formulemi templ���. Tyto runy jsou upraveny jako n�stroje na�� moci.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_05"); //S t�mito runami, kter� u� ovl�d�, m� cel� v�d�n� chr�mov� sf�ry v mal��ku.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Te� u� v� v�echno, co jsem t� mohl nau�it.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Jakmile porozum� magii, objev� tajemstv� moci.
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
	AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Mist�e, cht�l bych nosit vzne�en� roucho Ohn�.
	if (Kapitel < 3) 
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Je�t� nem� dostate�n� v�domosti. Vra� se, a� bude� zn�t v�c.
		//AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems (hero,ItMinugget)< VALUE_KDF_ARMOR_H) 
	{ 
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nem� dost rudy.
	}	
	else
	{	
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Nade�el �as. Jsi hoden nosit vzne�en� roucho Ohn�.
		
		CreateInvItem		(hero,KDF_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		B_GiveInvItems      (hero, self, ItMinugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor	(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};
	
};  
