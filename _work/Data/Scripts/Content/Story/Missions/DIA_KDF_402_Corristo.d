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
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co tady dìláš? Tady nemáš co pohledávat! Zmiz!

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
	description		= "Øekni mi - jaké to je být mágem."; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Øekni mi - jaké to je, být mágem.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Jsme mágové Ohnì. Jsme služebníci Innose, nejvyššího ze všech bohù.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Naše kouzla jsou dar boží. Byli jsme zvoleni, abychom pùsobili jako knìží, uèitelé a soudci.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Je to dar, který je naším trvalým bøemenem. Úkolem, který urèuje naše životy.
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
	description     = "Chtìl bych vstoupit do magického Kruhu.";
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
	AI_Output (other, self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Chtìl bych vstoupit do magického Kruhu.
	AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //Tak ty se chceš stát mágem Kruhu ohnì? Hm...

	
	if	(hero.level < 10)
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Ještì nemáš dostateèné vìdomosti. Vra se, až budeš znát víc.
		
		AI_StopProcessInfos	( self );
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Mnozí se k nám chtìli pøidat, ale za ta léta jsem pøijal jen jediného za svého uèedníka. Všichni ostatní neuspìli.
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Tvoje duše je vyzrálá a pøipravená se k nám pøidat. Jestli se chceš stát mágem, musím tì nejdøíve vyzkoušet. Øekni mi, až budeš pøipraven na zkoušku.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices (KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic	(GE_BecomeFiremage,	LOG_NOTE);
		B_LogEntry	(GE_BecomeFiremage,"Corristo mi øekl, že mi dovolí pøidat se ke Kruhu mágù Ohnì. Nejdøív však musím složit zkoušku.");
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
	description		= "Jsem pøipraven. Vyzkoušej mì."; 
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
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Jsem pøipraven. Vyzkoušej mì.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Dobøe. Sloužil jsi Bratrstvu u bažin, že ano?
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ano.",KDF_402_Corristo_KDFTEST_JA); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ne",KDF_402_Corristo_KDFTEST_NO); 

};  
FUNC VOID  KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Ano.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Jak se jmenuje náš bùh?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos.",KDF_402_Corristo_KDFTEST_ADANOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Spáè.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos.",KDF_402_Corristo_KDFTEST_INNOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez.",KDF_402_Corristo_KDFTEST_GOMEZ);
};

FUNC VOID  KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Ne.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Nepotøebujeme muže, který zapírá své èiny.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Buï radìji užiteèný jako bojovník nebo kopáè. Cesta k magii pro tebe zùstane provždy uzavøená.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //To není správnì. Možná by tì mohly využít stráže.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //Spáè.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Vypadáš jako nìkdo, kdo strávil pøíliš èasu mezi bratry z bažin. Možná bys mìl radìji zùstat tam.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Jaká je nejvyšší ctnost?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Èest bojovníka.",KDF_402_Corristo_KDFTEST_FIGHT); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Pokora pøed tváøí magie.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Ukáznìnost muže.",KDF_402_Corristo_KDFTEST_DISZIPLIN); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Bohabojnost.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
FUNC VOID  KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //Gomez.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //Myslím, že tvé místo bude u stráží! Promluv s Thorusem!
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
//--------------------------------------------------------------------------
// 							DIE PROBE 3
//--------------------------------------------------------------------------
FUNC VOID  KDF_402_Corristo_KDFTEST_FIGHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //Èest bojovníka.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //Myslím, že tvé místo bude u stráží! Promluv s Thorusem!
	AI_StopProcessInfos	( self );

};
FUNC VOID  KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Pokora pøed tváøi magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Odpovídal jsi dobøe a správnì. Budu tì uèit umìní magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //Následuj mì do Sálu magie, kde složíš prastarý slib.

	AI_StopProcessInfos	( self );
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
FUNC VOID  KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Ukáznìnost muže.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Odpovídal jsi dobøe a správnì. Budu tì uèit umìní magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //Následuj mì do Sálu magie, kde složíš prastarý slib.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();

};
FUNC VOID  KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Bohabojnost.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Odpovídal jsi dobøe a správnì. Budu tì uèit umìní magie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //Následuj mì do Sálu magie, kde složíš prastarý slib.
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
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Dnes jsme se tu shromáždili, abysme vysvìtili služebníka Ohnì.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Teï prones pøísahu ohnì.
	Snd_Play   ("howling_01");
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Pøísahám pøi moci boží...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Pøísahám pøi moci boží...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //...pøísahám pøi moci svatého Ohnì...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //...pøísahám pøi moci svatého Ohnì...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...že mé vìdomosti a mé skutky vejdou od tohoto okamžiku a navždy v jednotu s ohnìm...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...že mé vìdomosti a mé skutky vejdou od tohoto okamžiku a navždy v jednotu s ohnìm...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...dokud mé tìlo nebude navráceno øíši Beliarovì a oheò mého života nepohasne.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...dokud mé tìlo nebude navráceno øíši Beliarovì a oheò mého života nepohasne.
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
	
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_01"); //Pronesením slov této pøísahy jsi nyní vstoupil ve spojení s Ohnìm.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_02"); //Nos toto roucho na znamení vìèného svazku.
	AI_StopProcessInfos	(self);
	AI_EquipBestArmor	(hero);
	AI_UnequipWeapons	(hero);
	Npc_SetTrueGuild	(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

	B_LogEntry		(GE_BecomeFiremage,"Složil jsem zkoušku a pronesl pøísahu Ohnì. Nyní smím nosit roucho Kruhu ohnì! ");
	Log_CreateTopic	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Corristo mì mùže nauèit magické KRUHY a zvýšit moji magickou energii. Obývá dùm mágù Ohnì.");	
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
	description		= "Potøebuji více magické moci."; 
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
	AI_Output (other, self,"KDF_402_Corristo_MANA_Info_15_01"); //Potøebuji více magické moci.
	AI_Output (self, other,"KDF_402_Corristo_MANA_Info_14_02"); //Mùžu ti pomoci zvìtšit tvoji sílu. Jak ji použiješ, je už tvoje vìc.
	
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
	description		= "Vysvìtli mi význam kouzelných Kruhù."; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Vysvìtli mi význam kouzelných Kruhù.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Jistì. Tyhle Kruhy znázoròují, že sdílíš kouzlo.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Jsou tady pro vìdìní, dovednost a uèení nových kouzelných zaøíkávadel.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Aby ses mohl pøidat k dalšímu Kruhu, musíš projít pøedchozím.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Vyžaduje to dlouhé uèení a také budeš potøebovat získat spoustu zkušeností, než dosáhneš vyšších kruhù.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Ale tvoje úsilí o jejich dosažení bude pokaždé odmìnìno novými a mocnìjšími kouzly. Kouzelné Kruhy jsou však ještì nìèím více.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //Jsou souèástí života. Budou vždy s tebou. Ber je jako souèást sebe sama.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Abys porozumìl jejich moci, musíš poznat sám sebe.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Jsem pøipraven vstoupit do Prvního Kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Vstoupit do prvního z kouzelných Kruhù znamená nauèit se používat kouzelné runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Každá runa obsahuje strukturu zvláštního kouzelného zaøíkávadla.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Spolu se svými vlastními kouzelnými silami budeš schopen využívat kouzlo run.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_05"); //Ale narozdíl od kouzelných svitkù, které jsou také kouzelnými formulemi, magická síla run zajišuje, že struktura zaøíkávadla pøetrvává.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Každá runa je zdrojem magické síly, kterou mùžeš kdykoliv zase zrušit.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Svoji vlastní kouzelnou moc využiješ tehdy, když použiješ runu, podobnì jako je tomu s kouzelným svitkem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_08"); //Se vstupem do každého dalšího Kruhu se nauèíš využívat také další kouzelné runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Využij moc run k poznání sebe sama.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Jsem pøipraven vstoupit do Druhého kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Nauèil ses rozumìt kouzelným znakùm. Nadešel èas prohloubit toto porozumìní.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Jakmile se pøidáš ke Druhému kruhu, nauèíš se základùm mocnìjších bojových zaøíkávadel a všem tajùm ranhojièství.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Budeš se ale muset nauèit ještì víc, jestli chceš poznat opravdová tajemství magie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Víš, že každou runu mùžeš používat jak èasto chceš, dokud nevyèerpáš své vlastní síly.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Než budeš jednat, rozmysli si cíl svého jednání. Nabyl jsi síly, která tì snadno mùže dovést k záhubì a znièení.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Opravdový kouzelník ale užívá kouzla jen tehdy, když je to nezbytné.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Pokud porozumíš situaci, pak poznáš moc run.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Mùžeš mì pøipravit do Tøetího kruhu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_02"); //Tøetí kouzelný kruh je jedním z nejdùležitìjších krokù v životì mága. Jakmile ho dosáhneš, pøestáváš být hledaèem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Došel jsi už po cestì magie opravdu daleko. Nauèil ses používat kouzelné runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Tato znalost je východisko pro tvojí další cestu. Používej tyto runy s uvážením.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_05"); //Runy mùžeš nebo nemusíš používat. Ale musíš se rozhodnout pro jednu z tìchto možností.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Jakmile se rozhodneš, neostýchej se využít svých sil.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Jakmile porozumíš své cestì, pak poznáš sílu rozhodnutí.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Jsem pøipraven vstoupit do Pátého kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Dokonèil jsi první tøi Kruhy. Nyní nadešel èas nauèit se tajemství magie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Kouzlo run je založeno na kamenech. Existují kouzelné kameny, vytvoøené z kouzelné rudy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Z té samé rudy, která se tìží tady v dolech. Tato ruda je obdaøena magickými formulemi templáøù. Tyto runy jsou upraveny jako nástroje naší moci.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_05"); //S tìmito runami, které už ovládáš, máš celé vìdìní chrámové sféry v malíèku.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Teï už víš všechno, co jsem tì mohl nauèit.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Jakmile porozumíš magii, objevíš tajemství moci.
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
	AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Mistøe, chtìl bych nosit vznešené roucho Ohnì.
	if (Kapitel < 3) 
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Ještì nemáš dostateèné vìdomosti. Vra se, až budeš znát víc.
		//AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems (hero,ItMinugget)< VALUE_KDF_ARMOR_H) 
	{ 
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nemáš dost rudy.
	}	
	else
	{	
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Nadešel èas. Jsi hoden nosit vznešené roucho Ohnì.
		
		CreateInvItem		(hero,KDF_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		B_GiveInvItems      (hero, self, ItMinugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor	(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};
	
};  
