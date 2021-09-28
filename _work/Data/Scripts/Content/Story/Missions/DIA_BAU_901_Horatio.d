// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Horatio_EXIT (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 999;
	condition	= DIA_Horatio_EXIT_Condition;
	information	= DIA_Horatio_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Horatio_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Wasser
// ************************************************************

INSTANCE Info_Horatio_Wasser(C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 800;
	condition	= Info_Horatio_Wasser_Condition;
	information	= Info_Horatio_Wasser_Info;
	permanent	= 1;
	description = "Lefty mÏ poslal. P¯inesl jsem ti trochu vody.";
};                       

FUNC INT Info_Horatio_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Poslal mÏ Lefty. P¯inesl jsem trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //DÌky, p¯Ìteli! JeötÏ chvÌli a zaËal bych pÌt bahno!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //Uû nic nezbylo. Vezmu si trochu od ostatnÌch.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************
	var int horatio_trouble;
// ************************************************************

INSTANCE DIA_Horatio_Hello (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Hello_Condition;
	information	= DIA_Horatio_Hello_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Horatio_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_Hello_Info()
{	
	AI_GotoNpc	(self, hero);

	AI_Output (self, other,"DIA_Horatio_Hello_09_00"); //Co tady dÏl·ö? Hled·ö problÈmy?
	
	Info_ClearChoices(DIA_Horatio_Hello );
	Info_AddChoice	 (DIA_Horatio_Hello,"ProblÈmy? S k˝m? S nÏjak˝m rolnÌkem?",DIA_Horatio_Hello_PissOff);
	Info_AddChoice	 (DIA_Horatio_Hello,"Hej, klÌdek! Jsem tady nov˝.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output (other, self,"DIA_Horatio_Hello_BeCool_15_00"); //Hej, klÌdek! Jsem tady nov˝.
	AI_Output (self, other,"DIA_Horatio_Hello_BeCool_09_01"); //Ha... P¯ipad·ö mi v po¯·dku... Jeden nikdy nevÌ. Po¯·d p¯ich·zejÌ novÌ chlapi.
	Info_ClearChoices(DIA_Horatio_Hello );
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output (other, self,"DIA_Horatio_Hello_PissOff_15_00"); //ProblÈmy? S k˝m? S nÏjak˝m rolnÌkem?
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_01"); //ée pracuju na polÌch jeötÏ neznamen·, ûe se nedok·ûu ubr·nit takov˝m chlapÌk˘m, jako jsi ty.
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_02"); //Tak pojÔ, jestli chceö mÌt problÈmy!
	horatio_trouble = TRUE;
	
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						SORRY (PERM)
// ************************************************************

INSTANCE DIA_Horatio_SORRY (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_SORRY_Condition;
	information	= DIA_Horatio_SORRY_Info;
	permanent	= 1;
	description = "Je mi lÌto toho, co jsem ¯ekl o rolnÌcÌch.";
};                       

FUNC INT DIA_Horatio_SORRY_Condition()
{
	if (horatio_trouble == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_SORRY_Info()
{	
	AI_Output (other, self,"DIA_Horatio_SORRY_15_00"); //Je mi lÌto toho, co jsem ¯ekl o rolnÌcÌch.
	AI_Output (self, other,"DIA_Horatio_SORRY_09_01"); //MÏl bys nap¯ed myslet, hochu!
};

// ************************************************************
// 					Horatios Story
// ************************************************************

INSTANCE DIA_Horatio_Story (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Story_Condition;
	information	= DIA_Horatio_Story_Info;
	permanent	= 0;
	description = "Co dÏl· chlap jako ty mezi rolnÌkama?";
};                       

FUNC INT DIA_Horatio_Story_Condition()
{
	if ( (horatio_trouble==FALSE) && (Npc_KnowsInfo(hero,DIA_Horatio_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Story_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Story_15_00"); //Co dÏl· chlap jako ty mezi rolnÌkama?
	AI_Output (self, other,"DIA_Horatio_Story_09_01"); //Lee mÏ o to poû·dal. Ale uû se neperu - s v˝jimkou sebeobrany.
	AI_Output (self, other,"DIA_Horatio_Story_09_02"); //Jednou jsem zabil jednoho chlapÌka, a to jednou bylo aû moc. To je d˘vod, proË mÏ poslali do tÈhle zpropadenÈ kolonie - takov˝ je z·kon.
	AI_Output (other, self,"DIA_Horatio_Story_15_03"); //Jak se to stalo?
	AI_Output (self, other,"DIA_Horatio_Story_09_04"); //Byla to obyËejn· hospodsk· rvaËka. NechtÏl jsem toho kluka zabÌt, jenom jsem ho praötil moc silnÏ.
	AI_Output (self, other,"DIA_Horatio_Story_09_05"); //Byl jsem tehdy kov·¯. NevÏdÏl jsem, jakou m·m vlastnÏ sÌlu...
};

// ************************************************************
// 						Warum hier?
// ************************************************************

INSTANCE DIA_Horatio_WhyHere (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_WhyHere_Condition;
	information	= DIA_Horatio_WhyHere_Info;
	permanent	= 0;
	description = "ProË ses dal k TOMUHLE t·boru?";
};                       

FUNC INT DIA_Horatio_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_WhyHere_Info()
{	
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_00"); //ProË ses dal k TOMUHLE t·boru?
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_01"); //Jedno ti ¯eknu: jedin· dalöÌ moûnost byla d·t se k tÏm sekt·¯sk˝m bl·zn˘m. Ale j· nem·m nejmenöÌ chuù nechat si od jejich Guru vym˝t mozek.
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_02"); //Ve StarÈm t·bo¯e jsem mÏl spoustu problÈm˘ se str·ûemi, ale u ûold·k˘ a bandit˘ jsem mÏl aspoÚ nÏjak˝ respekt.
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_03"); //MÏli z tebe strach...
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_04"); //Moûn·. Ale kaûdop·dnÏ jsem naöel svoje mÌsto tady a ty bys mÏl zkusit to samÈ.
};

// ************************************************************
// 						Bitte STR
// ************************************************************
	var int horatio_StrFree;
// ************************************************************

INSTANCE DIA_Horatio_PleaseTeachSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_PleaseTeachSTR_Condition;
	information	= DIA_Horatio_PleaseTeachSTR_Info;
	permanent	= 0;
	description = "NauËÌö mÏ, jak se st·t tak siln˝m jako jsi ty?";
};                       

FUNC INT DIA_Horatio_PleaseTeachSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_PleaseTeachSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_15_00"); //NauËÌö mÏ, jak se st·t tak siln˝m jako jsi ty?
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_09_01"); //I kdybych mohl - JAK bys pak svoji sÌlu vyuûil?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Mohl bych pak vy¯Ìdit R˝ûovÈho Lorda a jeho tlupu!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Dobr· ot·zka. Budu o tom p¯em˝ölet...",DIA_Horatio_PleaseTeachSTR_BACK);
	};
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Sebeobrana!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"NauËil bych ty bastardy, jak se mnou majÌ spr·vnÏ mluvit!",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic		(CH1_HoratiosTeachings,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_RUNNING);
	B_LogEntry			(CH1_HoratiosTeachings,"Horatio, rolnÌk z r˝ûov˝ch polÌ NovÈho t·bora, mÏ m˘ûe nauËit, jak silnÏji ude¯it. NÏjak vöak nem˘ûu najÌt spr·vnou odpovÏÔ na jeho ot·zku PRO».");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //NauËil bych ty bastardy, jak se mnou majÌ spr·vnÏ mluvit!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //P¯edtÌm bys mÏl vÏdÏt, ûe ses s·m stal jednÌm z tÏch bastard˘... Ne, sire, na to tÏ p¯ipravovat nebudu.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Sebeobrana!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //To chce rychlost, ne sÌlu. MyslÌö, ûe rozbÌt nÏkomu lebku, je lepöÌ, neû sjednat mÌr?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Dobr· ot·zka. Budu o tom p¯em˝ölet...
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Mohl bych pak vy¯Ìdit R˝ûovÈho Lorda a jeho tlupu!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmm... Nebyl bys prvnÌ, kdo se o to pokusil.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

// ************************************************************
// 						Nachgedacht (STR)
// ************************************************************

INSTANCE DIA_Horatio_ThoughtSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_ThoughtSTR_Condition;
	information	= DIA_Horatio_ThoughtSTR_Info;
	permanent	= 1;
	description = "CelÈ jsem si to jeötÏ promyslel...";
};                       

FUNC INT DIA_Horatio_ThoughtSTR_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_ThoughtSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_15_00"); //CelÈ jsem si to jeötÏ promyslel...
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_09_01"); //No a? Vymyslel jsi nÏco lepöÌho?
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
	Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Ne.",DIA_Horatio_ThoughtSTR_NoIdea);
	
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Ano. Chci b˝t schopen dostat R˝ûovÈho Lorda a jeho tlupu! ",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Ne.
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Myslel jsem si to.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Ano. Chci b˝t schopen dostat R˝ûovÈho Lorda a jeho tlupu!
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmm... Nebyl bys prvnÌ, kdo se o to pokusil.
	horatio_StrFree = TRUE;
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

// ************************************************************
//					Will Ricelord kˆpfen
// ************************************************************

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if (other.attribute[ATR_STRENGTH]<=(100-5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintScreen	("SÌla +5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100; 
		PrintScreen	("SÌla: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
				
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Pokud chceö ude¯it plnou silou, musÌö zn·t spr·vnou taktiku.To je prvnÌ vÏc, kterou se jako kov·¯ nauËÌö.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //NauË se rozm·chnout celou rukou, od ramene po z·pÏstÌ.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //»Ìm lÌp to zvl·dneö, tÌm silnÏjöÌ bude r·na. Rychle tÏ to vyËerp·.
};

//--------------------------------------------------------------

INSTANCE DIA_Horatio_HelpSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_HelpSTR_Condition;
	information	= DIA_Horatio_HelpSTR_Info;
	permanent	= 0;
	description = "PORAZÕM R˝ûovÈho Lorda a jeho tlupu - kdyû mi pom˘ûeö!";
};                       

FUNC INT DIA_Horatio_HelpSTR_Condition()
{
	if (horatio_StrFree == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_HelpSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_00"); //PORAZÕM R˝ûovÈho Lorda a jeho tlupu - kdyû mi pom˘ûeö!
	AI_Output (self, other,"DIA_Horatio_HelpSTR_09_01"); //Dob¯e! P¯Ìsahal jsem, ûe uû na nikoho neza˙toËÌm, ale nikdy jsem ne¯ekl, ûe to nenauËÌm nÏkoho, kdo to udÏl·!
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_02"); //Jsem jedno ucho!
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_SUCCESS);
	B_LogEntry			(CH1_HoratiosTeachings,"Horatio mÏ nauËil, jak v boji pouûÌvat sÌlu a jak silnÏji ude¯it. RyzÌ duöe, tenhle chlapÌk.");
};

// ************************************************************
// 							Thanks (PERM)
// ************************************************************

INSTANCE DIA_Horatio_Thanks (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_Thanks_Condition;
	information	= DIA_Horatio_Thanks_Info;
	permanent	= 1;
	description = "DÌky za tvou pomoc!";
};                       

FUNC INT DIA_Horatio_Thanks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Thanks_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Thanks_15_00"); //DÌky za tvou pomoc!
	AI_Output (self, other,"DIA_Horatio_Thanks_09_01"); //Pouûij svÈ umÏnÌ pro dobro vÏci a pro NIC JIN…HO.
};



