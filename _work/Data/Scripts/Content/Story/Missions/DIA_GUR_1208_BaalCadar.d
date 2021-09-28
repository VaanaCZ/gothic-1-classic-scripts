// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalCadar_Exit (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 999;
	condition	= DIA_BaalCadar_Exit_Condition;
	information	= DIA_BaalCadar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungl‰ubiger) 
// ************************************************************
	var int BaalCadar_Ansprechbar;
	var int BaalCadar_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalCadar_NoTalk(C_INFO)
{
	npc				= GUR_1208_BaalCadar;
	nr				= 2;
	condition		= DIA_BaalCadar_NoTalk_Condition;
	information		= DIA_BaalCadar_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalCadar_NoTalk_Condition()
{
	if	Npc_IsInState(self,ZS_TALK)
	&&	(BaalCadar_Ansprechbar==FALSE)
	&&	(Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY)
	&&	(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalCadar_NoTalk);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,DIALOG_ENDE					,DIA_BaalCadar_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Je vöechno v po¯·dku, p¯Ìteli?",DIA_BaalCadar_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Sp·Ë buÔ s tebou!",DIA_BaalCadar_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Zdar! Jsem tu nov˝!",DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Hi_15_00"); //Zdar! Jsem tu nov˝!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Sleeper_15_00"); //Sp·Ë buÔ s tebou!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Sleeper_02_01"); //(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Imp_15_00"); //Je vöechno v po¯·dku, p¯Ìteli?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Imp_02_01"); //(vzdech)
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

/*


	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_01"); //Du solltest deinen Weg mit Bedacht w‰hlen und nach reiflicher ‹berlegung. 
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_02"); //Bedenke wie du entscheidest. In den anderen Lagern bekommst zwar Schutz und Nahrung, aber ist es das, was du willst?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_15_03"); //Was erwartet mich, was es wert w‰re, zu euch zu kommen?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_04"); //Ich kˆnnte dir jetzt erz‰hlen, das die Templer einen unbezwinglichen Willen haben,das die magische Macht der Gurus, die Vorstellungskraft von Feuer- und Wassermagiern bei weitem ¸bersteigt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_05"); //Das unsere Nahrung auch satt macht. Aber das ist es nicht, was diese Gemeinschaft ausmacht.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_06"); //Was dich hier erwartet, ist die Gabe. Du wirst einen Weg beschreiten, der dir sehr viel abverlangt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_07"); //Aber das was du erreichen wirst ist eine Grˆﬂe, eine Macht die dir Erleuchtung schenkt. Eine Macht, die dich zur Freiheit f¸hrt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_08"); //Ist es nicht das, was du willst?... Freiheit?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_09"); //Also solltest du nicht die Frage stellen, warum du her kommen solltest, die Frage ist viel mehr, warum solltest du nicht?
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    (GE_TeacherPSI,"Baal Cadar kann mir zeigen, wie ich meine geistige Kraft verbessern kann.");
*/

// **************************************************
// 						 Sleep Spell
// **************************************************

INSTANCE DIA_BaalCadar_SleepSpell (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 1;
	condition	= DIA_BaalCadar_SleepSpell_Condition;
	information	= DIA_BaalCadar_SleepSpell_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_BaalCadar_SleepSpell_Condition()
{
	var C_NPC Nov1336; Nov1336=Hlp_GetNpc(Nov_1336_Novize);
	var C_NPC Nov1340; Nov1340=Hlp_GetNpc(Nov_1340_Novize);
	var C_NPC Nov1345; Nov1345=Hlp_GetNpc(Nov_1345_Novize);
	
	if ( Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_SleepSpell_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_00"); //Co dÏl·ö? PokouöÌm se meditovat se sv˝mi û·ky.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_01"); //Kdo tÏ nauËil pouûÌvat Sp·Ëovu magickou moc?
	AI_Output (other, self,"DIA_BaalCadar_SleepSpell_15_02"); //Nikdo. Bylo to snadnÈ.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_03"); //Zd· se, ûe jsi bystr˝ û·k. Budu tÏ uËit.

	BaalCadar_Ansprechbar = TRUE;
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry		(CH1_JoinPsi,"Baal Cadar mÏ m· za vnÌmavÈho uËnÏ! ");
	B_GiveXP		(XP_ImpressBaalCadar);
};

/*------------------------------------------------------------------------
						MANA								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_Teach (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_Teach_Condition;
	information		= Gur_1208_BaalCadar_Teach_Info;
	permanent		= 1;
	description		= "ChtÏl bych se nauËit, jak zvÏtöit sÌlu sv˝ch kouzel. "; 
};

FUNC int  Gur_1208_BaalCadar_Teach_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_Teach_Info_15_01"); //ChtÏl bych se nauËit, jak zvÏtöit sÌlu svÈho kouzla.
	AI_Output (self, other,"Gur_1208_BaalCadar_Teach_Info_02_02"); //KlÌËem je sÌla tvojÌ duöe.
	
	if (log_baalcadartrain == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Guru Baal Cadar mi m˘ûe pomoci vylepöit MAGICKOU ENERGII.");
		log_baalcadartrain = TRUE;
	};
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
};
func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);

};
/*------------------------------------------------------------------------
							DIE KREISE DER BRUDERSCHAFT									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_FIRSTTEST (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information		= Gur_1208_BaalCadar_FIRSTTEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "NauË mÏ magii run."; 
};

FUNC int  Gur_1208_BaalCadar_FIRSTTEST_Condition()
{	
	if	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //NauË mÏ magii run.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //MnozÌ se nauËili jazyku run, ale jen nÏkte¯Ì pochopili jejich kouzlo.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //PokusÌm se tÏ to nauËit.
	
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    	(GE_TeacherPSI,"Baal Cadar mÏ m˘ûe nauËit magickÈ KRUHY runovÈ magie.");
		
};

/*------------------------------------------------------------------------
							DER ERSTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS1 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS1_Condition;
	information		= Gur_1208_BaalCadar_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jsem p¯ipraven vstoupit do PrvnÌho kruhu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS1_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(Npc_KnowsInfo (hero,Gur_1208_BaalCadar_FIRSTTEST))
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS1_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS1_Info_15_01"); //Jsem p¯ipraven vstoupit do PrvnÌho kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_02"); //Poslouchej m· slova.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_03"); //P¯ed dlouhou dobou se zjevil Sp·Ë a seslal lidstvu vizi.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_04"); //MnozÌ lidÈ vöak odmÌtali jeho znamenÌ vnÌmat, neboù byli p¯Ìliö zaslepeni touhou po rudÏ.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Jen Y¥Berion  s hrstkou dalöÌch se sebral a zaloûil Bratrstvo.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_06"); //V okamûiku, kdy vyslyöeli Sp·Ëovo poselstvÌ, se zrodil PrvnÌ kruh. Kouzlu run porozumÏl kaûd˝, kdo n·sledoval Sp·Ëe.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};
	AI_StopProcessInfos	( self );

};
/*------------------------------------------------------------------------
							DER ZWEITE KREIS									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS2 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS2_Condition;
	information		= Gur_1208_BaalCadar_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jsem p¯ipraven vstoupit do DruhÈho kruhu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS2_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS2_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS2_Info_15_01"); //Jsem p¯ipraven vstoupit do DruhÈho kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Pak naslouchej a vÏz.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_03"); //Sp·Ë dovedl Y¥Beriona a jeho vÏ¯ÌcÌ û·ky na toto mÌsto, kde se usadili.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_04"); //Pracovali bez odpoËinku - dny, t˝dny, mÏsÌce. Vyrostl Nov˝ t·bor. P¯id·vali se k nÏmu novÌ a novÌ lidÈ, kte¯Ì n·sledovali Sp·Ëovo poselstvÌ.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_05"); //SpoleËnÏ se pak pokusili o spojenÌ se Sp·Ëem na duchovnÌ ˙rovni.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_06"); //Tak se zrodil Druh˝ kruh.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							DER DRITTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS3 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS3_Condition;
	information		= Gur_1208_BaalCadar_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jsem p¯ipraven vstoupit do T¯etÌho kruhu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 2)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS3_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS3_Info_15_01"); //Jsem p¯ipraven vstoupit do T¯etÌho kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Zapamatuj si toto:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_03"); //Vize se staly jasnÏjöÌ, ale sÌla Bratrstva nestaËila pro nav·z·nÌ spojenÌ.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_04"); //Jeden z Guru, alchymista, ten problÈm vy¯eöil. P¯ipravil lektvar extrahovan˝ z v˝mÏöku z Ëelisti d˘lnÌho Ëerva. Brat¯i pak spojili svÈ modlitby a jejich duchovnÌ sÌla se poprvÈ sjednotila.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_05"); //V tu dobu se novicovÈ vydali do t·bor˘, aby tam zvÏstovali Sp·Ëovo uËenÌ a p¯esvÏdËovali nevÏrce o vÌ¯e.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_06"); //Tak byl dovröen T¯etÌ kruh.
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
						DER VIERTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS4 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS4_Condition;
	information		= Gur_1208_BaalCadar_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jsem p¯ipraven vstoupit do P·tÈho kruhu."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS4_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 3)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS4_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS4_Info_15_01"); //Jsem p¯ipraven vstoupit do P·tÈho kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_02"); //UbÏhla dlouh· doba od zaloûenÌ t·bora. Mnoho se toho zmÏnilo.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_03"); //VÌra zesÌlila, byla upevÚov·na a öÌ¯ena.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_04"); //NezapomnÏli jsme vöak na naöe posl·nÌ. Nevzd·vali jsme se pokus˘ o vz˝v·nÌ Sp·Ëe.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_05"); //Vytrvalost a sÌla vÌry p¯edstavujÌ »tvrt˝ kruh.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_06"); //TeÔ vÌö vöechno, co bratr pot¯ebuje o kouzlech vÏdÏt. Jsi dobr˝ û·k.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  Gur_1208_BaalCadar_SELLSTUFF (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information		= Gur_1208_BaalCadar_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Gur_1208_BaalCadar_SELLSTUFF_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if  (log_baalcadarsell == FALSE)
	{
		Log_CreateTopic   	(GE_TraderPSI,LOG_NOTE);
		B_LogEntry			(GE_TraderPSI,"Guru Baal Cadar prod·v· RUNY, KOUZELN… SVITKY, LEKTVARY, AMULETY a PRSTENY.");
		log_baalcadarsell = TRUE;
	};	
	AI_Output (other, self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //R·d bych zÌskal magickÈ spisy.

};  






     
