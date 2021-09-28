//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Jdeme.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Ještì se uvidíme.
	};
	AI_StopProcessInfos	(self);
};

//*********************************************
//					First
//*********************************************

instance DIA_Milten_First (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_First_Condition;
	information	= DIA_Milten_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Milten_First_Condition()
{
	if ( (CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) )
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func VOID DIA_Milten_First_Info()
{
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Bez povolení mistra Corrista nesmíš pøekroèit tenhle práh.
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello_Condition;
	information	= DIA_Milten_Hello_Info;
	permanent	= 0;
	description = "Hledám Velkého mága Kruhu ohnì.";
};                       

FUNC INT DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Hledám Velkého mága Kruhu ohnì.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //To je Corristo. Co mu chceš?
};

//*********************************************
//					GotoCorristo
//*********************************************
	
instance DIA_Milten_GotoCorristo (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_GotoCorristo_Condition;
	information	= DIA_Milten_GotoCorristo_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_GotoCorristo_Condition()
{
	if  ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	{
		return 1;
	};
};

func VOID DIA_Milten_GotoCorristo_Info()
{
	if ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) )
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Hledám Velkého mága Kruhu ohnì.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //To je Corristo. Co mu chceš?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Mám dopis pro Velkého mága Kruhu ohnì.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Ukaž mi ten dopis.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Tady je,
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //A co takhle nìjakou odmìnu?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //To už nebude tøeba.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Slyšeli jsme, co jste dokázali ve Starém dole. Bez dùlních èervù se ruda získává daleko snadnìji.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Corristo o vašem úspìchu taky ví. Chce s tebou mluvit. Jdi za ním.
};

//*********************************************
//				 Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Letter_Condition;
	information	= DIA_Milten_Letter_Info;
	permanent	= 0;
	description = "Mám dopis pro Velkého mága Kruhu ohnì.";
};                       

FUNC INT DIA_Milten_Letter_Condition()
{
	if	( (Npc_KnowsInfo(hero, DIA_Milten_Hello)) && ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) ) )
	&&	(Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Letter_Info()
{
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //Mám dopis pro Velkého mága Kruhu ohnì.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Jsi kurýr z vnìjšího svìta?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Ano. Mágové mi dali ten dopis krátce pøedtím, než mì poslali do téhle kolonie.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Ukaž mi ten dopis.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Nejdøív chci svoji odmìnu.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Tady je,",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Tady je,
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Ten dopis je adresován Xardasovi.
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //A co je na tom tak divného?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas už není dlouho Innosùv služebník. Odešel od nás už pøed celými vìky a dal se na èernou magii.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Žije ve vìži uprostøed skøetího území a soustøedí se na studium.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Øekl, že by mohl pøijít na to, co se pokazilo na Bariéøe.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Poèkej tu. Hned se vrátím.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");

	if		Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
	}
	else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Nejdøív chci svoji odmìnu.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo øekne Torrezovi, aby ti ji dal, jakmile dostane ten dopis.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Jsem Innosùv služebník - nikdy nelžu. Teï mi dej ten dopis.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Radìji bych ten dopis dal Torrezovi sám.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Tady je,",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Radìji bych ten dopis dal Torrezovi sám.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Ty nechceš, abych ho èetl, viï?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Ne. Chci nejdøív vidìt odmìnu.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Dobrá. Když teda chceš. Poèkej tady.

	Info_ClearChoices	(DIA_Milten_Letter);
	AI_StopProcessInfos	(self);

	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//				 Got Brief
//*********************************************

instance DIA_Milten_ComesBack (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_ComesBack_Condition;
	information	= DIA_Milten_ComesBack_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_ComesBack_Condition()
{
	if ( (Npc_KnowsInfo(hero, DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo nemìl moc velkou radost, když vidìl, jak malou dùvìru máš ve služebníky Innosovy.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Ale øíkal, že máš jít k Torrezovi a vzít si obvyklou odmìnu.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo byl celý bez sebe potìšením. Øekl, že mùžeš jít k Torrezovi a vybrat si svou odmìnu.
	};
};

//*********************************************
//			Wo finde ich Torrez?
//*********************************************
	
instance DIA_Milten_WoTorrez (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_WoTorrez_Condition;
	information	= DIA_Milten_WoTorrez_Info;
	permanent	= 0;
	description	= "Kde najdu Torreze?";
};                       

FUNC INT DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WoTorrez_Info()
{
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Kde najdu Torreze?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Je celý den pøed budovou chrámu.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //V noci je uvnitø jako všichni ostatní - ale do chrámu smìjí vstoupit jenom mágové, takže s ním mùžeš mluvit jedinì pøes den.
};

//*********************************************
//				Noch ein Brief
//*********************************************
	
instance DIA_Milten_NochEinBrief (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_NochEinBrief_Condition;
	information	= DIA_Milten_NochEinBrief_Info;
	permanent	= 0;
	description = "Mám dopis od mágù Kruhu vody.";
};                       

FUNC INT DIA_Milten_NochEinBrief_Condition()
{
	if ( (Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_NochEinBrief_Info()
{
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //Mám dopis od mágù Kruhu vody.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ach! Výbornì! Dám ho Corristovi.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Až se vrátíš do Nového tábora, mágové Vody tì jistì odmìní za tvoji snahu.
	
	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems (other,self,Cronos_Brief,1);
};

//*********************************************
//					PERM
//*********************************************
	
instance DIA_Milten_PERM (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_PERM_Condition;
	information	= DIA_Milten_PERM_Info;
	permanent	= 0;
	description = "Øekni mi nìco o mázích Ohnì.";
};                       

FUNC INT DIA_Milten_PERM_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_PERM_Info()
{
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Øekni mi nìco o mázích Ohnì.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Kruh ohnì èerpá moc z milosti Innos. Bùh svìtla, pravdy a spravedlnosti na nás dozírá.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Mágové se sami rozhodli, že se stanou vyvolenými - a takhle stanovili i ostatní.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Mìl jsem štìstí, že jsem byl pøijatý. Stal jsem se Corristovým uèedníkem. Nejspíš potøeboval nìjakou zábavu.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Od té doby jsem se pak snažil každý den zlepšovat v magickém umìní, abych byl pøijatý to dalšího Kruhu.
};

//*********************************************
//					WannaMage
//*********************************************
	
instance DIA_Milten_WannaMage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_WannaMage_Condition;
	information	= DIA_Milten_WannaMage_Info;
	permanent	= 1;
	description = "Chci se taky stát kouzelnickým uènìm - jako ty.";
};                       

FUNC INT DIA_Milten_WannaMage_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Chci se taky stát kouzelnickým uènìm - jako ty.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo mì vybral, protože jsem vykonal nìco významného pro Rudobarony.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Dokud nevykonáš nìco opravdu významného, nikdy tì do uèení nevezme.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Kromì toho musíš patøit ke Starému táboru. Pochybuju, že by Corristo pøijal do uèení nìkoho, kdo je èlenem nìjakého jiného tábora.
};





		
	







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHWAIT_Condition;
	information	= Info_Milten_SHWAIT_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHWAIT_Condition()
{
	if ( Npc_GetDistToWP ( hero, "OW_PATH_274")<1000)
	{
		return 1;
	};	
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc		(self,hero);
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Buï zdráv! Mùj pøítel Lester z tábora v bažinách mi øekl o tvých velkých skutcích!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Jsem ohromený. Stal ses velmi silný.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Dìlám, jak umím.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Jistì. Poøád skromný, že ano?
};

//***************************************************************************
//	Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHGORN_Condition;
	information	= Info_Milten_SHGORN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Potkal jsem Gorna.";
};

FUNC int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //Potkal jsem Gorna.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Opravdu? Kde?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //U staré rozvaliny kláštera u moøe. Hledali jsme tam oba poklad.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Jsem pøesvìdèený, že mi všechno o tom bude vyprávìt, až se spolu zase setkáme.
};

//***************************************************************************
//	Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLESTER_Condition;
	information	= Info_Milten_SHLESTER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Byli jsme s Lesterem v horské pevnosti.";
};

FUNC int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, PC_Psionic_FINISH))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Byli jsme s Lesterem v horské pevnosti.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Øíkal mi o tom. Podle všeho je možné ti vìøit.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Kde jste se vy ètyøi doposud setkávali?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Och, tu i onde. Setkávali jsme se na nejrùznìjších místech.
};

//***************************************************************************
//	Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHYOU_Condition;
	information	= Info_Milten_SHYOU_Info;
	important	= 0;
	permanent	= 0;
	description	= "Co tady dìláš?";
};

FUNC int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT))
	{
		return 1;
	};	
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //Co dìláš tady?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Nedaleko odtud je prastarý kamenný kruh. V jeho støedu leží vstup do podzemních prostor.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Nìjaká hrobka?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Ano, nìco takového.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //V té hrobce je nìco, co bych chtìl mít.
};

//***************************************************************************
//	Info SHME
//***************************************************************************
instance Info_Milten_SHME (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHME_Condition;
	information	= Info_Milten_SHME_Info;
	important	= 0;
	permanent	= 0;
	description	= "Hledám ohniskový kámen. Nìkde musí být.";
};

FUNC int Info_Milten_SHME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_SHWAIT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	{
		return 1;
	};	
};

func void Info_Milten_SHME_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Hledám ohniskový kámen. Nìkde musí být.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Vypadá to, jako bysme oba nìco hledali na stejném místì.
};

//***************************************************************************
//	Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHPROBLEM_Condition;
	information	= Info_Milten_SHPROBLEM_Info;
	important	= 0;
	permanent	= 0;
	description	= "Proè nejdeš dolù do té hrobky a nevezmeš si to, co hledáš?";
};

FUNC int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHYOU))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Proè nejdeš dolù do té hrobky a nevezmeš si to, co hledáš?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Och, to je dlouhý pøíbìh. Musel bych jít hodnì do minulosti, abych to mohl vysvìtlit.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Vyprávìj, já nespìchám.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Dobøe!  Po vytvoøení magické Bariéry, která nás všechny uvìznila...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...jeden mág schoval tady dole nìjaký magický artefakt.
};

//***************************************************************************
//	Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHFOCUS_Condition;
	information	= Info_Milten_SHFOCUS_Info;
	important	= 0;
	permanent	= 0;
	description	= "Není ten artefakt jeden z pìti ohniskových kamenù?";
};

FUNC int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Není ten artefakt jeden z pìti ohniskových kamenù?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Pøesnì tak! Takže ty už znáš pøíbìh pìti ohniskových kamenù?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Neøíkej mi, že taky hledáš ohnisko!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Ne. Mì ohniskový kámen nezajímá. Já hledám skøetí talisman.
};

//***************************************************************************
//	Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSEAL_Condition;
	information	= Info_Milten_SHSEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ten artefakt byl zapeèetìn?";
};

FUNC int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Ten artefakt byl zapeèetìn?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Ano. Chrání ho mocné kouzlo. První vykradaè hrobù, který se pokusí ukrást ohnisko...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //...bude proklet a zaèarován do nesmrtelné bytosti, která nepozná odpoèinek a která bude støežit hrobku pøed dalšími vykradaèi hrobù.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Jak se vymaníš z toho prokletí?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //To už nebude tøeba.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Pøed nìkolika lety se jeden Rudobaron, který z dlouhé chvíle lovil skøety, neopatrnì pøiblížil k hrobce a vstoupil do ní.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Teï je ON strážcem toho pokladu tady dole.
};

//***************************************************************************
//	Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHTALISMAN_Condition;
	information	= Info_Milten_SHTALISMAN_Info;
	important	= 0;
	permanent	= 0;
	description	= "A co ten talisman?";
};

FUNC int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHFOCUS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //A co ten talisman?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Myslím, že ho jeho bývalý majitel používal k vlastní obranì pøed rozzlobenými skøety.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Jestli mám pravdu, pak mùže být ten talisman velice užiteèný.
};

//***************************************************************************
//	Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER_Condition;
	information	= Info_Milten_SHOFFER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Mìli bychom hrobku prohledat spoleènì.";
};

FUNC int Info_Milten_SHOFFER_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSEAL)
	&&		Npc_KnowsInfo(hero, Info_Milten_SHTALISMAN)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Mìli bysme hrobku prohledat spoleènì. Ty dostaneš talisman a já ohniskový kámen.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //Dobøe, je tu ale jeden malý problém...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Problém?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Ano. Ten strážce je dole v hrobce...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //Nemùžeme ho rozsekat na kousky?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //To by nebylo moc snadné. Myslím, že je výjimeènì necitlivý vùèi normálním zbraním.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Nech mì hádat, ty už máš pøipravený plán, viï?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Ech... no... Mám plán, ale nedokážu ho provést sám.
};

//***************************************************************************
//	Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2 (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER2_Condition;
	information	= Info_Milten_SHOFFER2_Info;
	important	= 0;
	permanent	= 0;
	description	= "Povídej!";
};

FUNC int Info_Milten_SHOFFER2_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Povídej!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Mám s sebou kouzelný svitek s velmi mocným zaøíkávadlem.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //To kouzlo znièí všechny nemrtvé, které zasáhne.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Pak by mìlo být vybrání hrobky hraèka.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Hmmm... Dobøe... Ne tak docela! Ten strážce tam už není tak docela sám.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Nejspíš nìjaký pozdìjší vykradaè hrobù, který nebyl o moc úspìšnìjší než ten první.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Jednou jsem sešel dolu a byl jsem málem zabit. Jeden muž tam sám jít nemùže.
};

//***************************************************************************
//	Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHACCEPT_Condition;
	information	= Info_Milten_SHACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description	= "Dej mi ten kouzelný svitek a udìláme to spoleènì!";
};

FUNC int Info_Milten_SHACCEPT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER2)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Dej mi ten kouzelný svitek a udìláme to spoleènì!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Dobøe, velmi dobøe. Doufal jsem, že to øekneš!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Máme ale jenom jeden kouzelný svitek. použijeme ho na strážce!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Ten druhý nemrtvý mùže být zabit i v normálním boji.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Aha. Která cesta vede ke kamennému kruhu?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Pojï za mnou.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"Poblíž kamenného kruhu jsem potkal Miltena, mága Ohnì. Øekl mi, že jeden z ohniskových kamenù, které hledám, je pod tímto kamenným útvarem.");
	B_LogEntry		(CH3_Stonehenge,"Milten mi dal kouzelný svitek, který mi pomùže porazit nemrtvého strážce krypty. Pùjdeme do krypty spoleènì.");
	
	CreateInvItem		(self,	ItArScrollDestroyUndead);
	B_GiveInvItems  (self, hero, ItArScrollDestroyUndead, 1);

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self, "SHGuide");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHARRIVED_Condition;
	information	= Info_Milten_SHARRIVED_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<500) )
	{
		return TRUE;
	};	
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Tak, jsme tady. Tenhle tunel vede pøímo do hrobky. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Tak pojïme navštívit strážce!

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHHEAL_Condition;
	information	= Info_Milten_SHHEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Jsem zranìný. Pomoz mi, prosím.";
};

FUNC int Info_Milten_SHHEAL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&		(hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&&		(Npc_HasItems(hero,ItFo_Potion_Health_02) == 0)								)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Jsem zranìný. Pomoz mi, prosím.

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Vezmi si léèivý lektvar.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //Už mi žádný léèivý lektvar nezbyl.
	};	

	AI_StopProcessInfos		(self);
};

//***************************************************************************
//	Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHRUNNING_Condition;
	information	= Info_Milten_SHRUNNING_Info;
	important	= 0;
	permanent	= 1;
	description	= "Strážce stále žije!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Strážce stále žije!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Tak ho zniè kouzelným svitkem.
};

//***************************************************************************
//	Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSCROLL_Condition;
	information	= Info_Milten_SHSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Použil jsem kouzelný svitek!";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Použil jsem kouzelný svitek - ale ne na strážce!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //To je katastrofa! Pak ho musíš porazit nìjakým jiným zpùsobem!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Snad mùžeš koupit další kouzelný svitek nebo runu v jednom z táborù.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Poèkám tady na tebe. Tady se sejdeme.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHWait");
};

//***************************************************************************
//	Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHNEWSCROLL_Condition;
	information	= Info_Milten_SHNEWSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Mám nový svitek 'Smrt nemrtvému'.";
};

FUNC int Info_Milten_SHNEWSCROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSCROLL)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)	
	&&		((Npc_HasItems(hero, ItArScrollDestroyUndead)>0) ||	(Npc_HasItems(hero, ItArRuneDestroyUndead)>0))	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Mám nový svitek 'Smrt Nemrtvému'.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Výbornì. Teï mùžeme na další návštìvu k tomu strážci.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Jdi první, pùjdu za tebou.

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHFollow");
};

//***************************************************************************
//	Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLEAVE_Condition;
	information	= Info_Milten_SHLEAVE_Info;
	important	= 1;
	permanent	= 1;
};

FUNC int Info_Milten_SHLEAVE_Condition()
{
	if	 Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)		
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")>10000)
  	&&	(self.aivar[AIV_PARTYMEMBER] ==	TRUE)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Vidím, že už jsi o hrobku ztratil zájem.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Jestli se rozmyslíš, mùžem se setkat tam co pøedtím.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self,	"SHWait");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHCONTINUE_Condition;
	information	= Info_Milten_SHCONTINUE_Info;
	important	= 0;
	permanent	= 1;
	description = "Mùžeme se znovu opovážit jít do té hrobky?";
};

FUNC int Info_Milten_SHCONTINUE_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	&&	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Mùžeme se znovu opovážit jít do té hrobky?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Jsem pøipraven. Jdi napøed, já pùjdu za tebou.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSUCCESS_Condition;
	information	= Info_Milten_SHSUCCESS_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && Npc_HasItems(hero, ItMi_OrcTalisman))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Dobøe. Máš talisman.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Tady, vem si ho. To byla naše domluva!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Dìkuju, pøíteli. Nikdy ti nezapomenu, jak jsi mi pomohl.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Vrátím se do Starého tábora, snad se tam sejdeme.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Spoleènì jsme porazili nemrtvého STRÁŽCE pod kamenným kruhem. Milten si vzal svùj podíl koøisti a vrátil se zpátky do Starého tábora.");
	B_LogEntry		(CH3_Stonehenge,"Saturas bude rád, že jsem tu našel ohniskový kámen!");
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self, "ReturnToOC");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWARN_Condition;
	information	= Info_Milten_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Oni... Oni jsou mrtví... všichni MRTVÍ. Nedokázal jsem jim pomoci... Já... nebyl jsem tam... Já...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Uklidni se, Miltene, už jsem se s Diegem potkal na druhé stranì tábora.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Dobøe, pak už to víš. Co øíkal Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Jestli najdu Gorna a Lestera, budu je varovat a pošlu je na místo vašeho srazu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Hodnì štìstí a dávej pozor!
		B_LogEntry		(CH4_Firemages,"Milten se skrývá nedaleko Starého tábora, stejnì jako Diego. Tento mág Ohnì varuje v bezpeèné vzdálenosti od hlavní brány pøíchozí, aby nepadli do rukou strážím.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Uklidni se, Miltene, co se stalo?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Zabili mágy Ohnì. VŠECHNY kromì mì, byl jsem taky v blízkosti smrti.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Radìji mi ten pøíbìh øekni celý od zaèátku, jedno po druhém.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Dobøe. Uklidni se, Miltene, klid.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Všechno zaèalo zavalením Starého dolu...
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //Starý dùl byl ZAVALEN???
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Ano. Stalo se to velmi rychle. Nikdo z dolu neunikl.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Stráže zablokovaly vchod do dolu.
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCMINE_Condition;
	information	= Info_Milten_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Jak se mohl dùl zavalit?";
};

FUNC int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Jak se mohl dùl zavalit?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Nemám zdání. Nìkterý z kopáèù, kteøí èekali vpøedu u vchodu, øíkali nìco o silném zemìtøesení a velkém oblaku dýmu, který vycházel z tunelu.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //Byl jsi tam?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Ano. Proto vím o tom závalu.
};

//***************************************************************************
//	Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCKDW_Condition;
	information	= Info_Milten_OCKDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Proè by Rudobaroni chtìli zabít mágy Ohnì?";
};

FUNC int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Cos to øíkal o mázích Ohnì?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Jenom vím, že byli všichni zabiti Rudobarony krátce po zavalení dolu.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Když jsem se vrátil po našem dobrodružství u kamenného kruhu, stráže u brány mì znenadání napadly.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Vykøikovaly na mì slova 'zrádce' a 'kolaborant'. Jen taktak, že se mi podaøilo uprchnout.
};

//***************************************************************************
//	Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWHY_Condition;
	information	= Info_Milten_OCWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Proè by Rudobaroni chtìli zabít mágy? To nedává smysl...";
};

FUNC int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Proè by Rudobaroni chtìli zabít mágy? To nedává smysl...
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //To je pravda. Stráže mi nedaly možnost se ani zeptat. Okamžitì tasily meèe.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Snad ví Diego víc. Byl zrovna v táboøe, když se to všechno zaèalo hroutit.
};

//***************************************************************************
//	Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCYOU_Condition;
	information	= Info_Milten_OCYOU_Info;
	important	= 0;
	permanent	= 0;
	description = "Mìl by ses ukrýt. Daleko odtud.";
};

FUNC int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Mìl by ses ukrýt. Daleko odtud.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Ne. Diego a já jsme se dohodli, že budeme hlídat obì brány a varovat naše nic netušící pøátele z jiných táborù.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Øekni to, prosím, Diegovi!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Poté, co mi Diego øekl o neuvìøitelných událostech, potkal jsem pøed Starým táborem Miltena. Doufám, že je nechytí.");
	};
};

//***************************************************************************
//	Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCDIEGO_Condition;
	information	= Info_Milten_OCDIEGO_Info;
	important	= 0;
	permanent	= 0;
	description = "Kde najdu Diega?";
};

FUNC int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero, Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero, Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero, Info_Diego_OCSTORY)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Kde najdu Diega?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Ukrývá se na druhé stranì Starého tábora, blízko zadní brány.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Øekni mu to, prosím!

	B_LogEntry			(CH4_Firemages,"Milten mì zastavil pøed Starým táborem a øekl mi o zavalení Starého dolu a vyvraždìní mágù Ohnì.");
	B_LogEntry			(CH4_Firemages,"Diego se zdržuje na druhé stranì Starého tábora, poblíž zadní brány. Mìl bych si s ním promluvit, bude vìdìt více o tom, co se pøihodilo.");
};










//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_LOADSWORD_Condition;
	information	= Info_Milten_LOADSWORD_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	};	
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Nazdar, pøíteli, už jsem tì nevidìl vìènost.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Nazdar, Miltene. Hodnì se toho stalo, co jsme se vidìli naposledy.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Chtìl bych ti všechno vyprávìt, ale nemám teï èas. Hroznì spìchám.
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD1_Condition;
	information		= Info_Milten_LOADSWORD1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Miltene, potøebuju tvoji pomoc!"; 
};

FUNC int Info_Milten_LOADSWORD1_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Miltene, potøebuju tvoji pomoc!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Co se dìje? Jak ti mùžu pomoci?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Pojïme nìkam, kde budeme moci mluvit.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Dobøe. Pojï za mnou.

	Npc_ExchangeRoutine	(self,	"LSAway");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSAWAY_Condition;
	information		= Info_Milten_LSAWAY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD1)
	&&	(Npc_GetDistToWP(hero, "NC_KDW04_IN") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //No tak mi øekni, co se dìje?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Potøebuju magické síly rudné haldy, ale mám pocit, že by nebylo rozumné požádat ostatní mágy Vody.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //Dìláš si legraci!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //Teï není na legraci èas. Myslím to smrtelnì vážnì.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Vidìl jsem Xardase, toho nekromanta!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Pracoval jsem pod jeho velením!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? Zaèínáš mì dìsit!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Od té doby, co odešel ze Starého tábora, s ním nikdo nemluvil.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //Já ano!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Na co potøebuješ ty síly ze rudné haldy?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Chci je transformovat do tohoto meèe.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Joj, to je ale zbraò!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Jmenuje se URIZIEL!
};


//---------------------------------------------------------------------
//	Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD4_Condition;
	information		= Info_Milten_LOADSWORD4_Info;
	important		= 0;
	permanent		= 0;
	description		= "Xardas mi dal kouzelné zaøíkávadlo!"; 
};

FUNC int Info_Milten_LOADSWORD4_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSAWAY)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD4_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas mi dal kouzelné zaøíkávadlo, které provede tu transformaci.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Budeš ho muset pøednést, zatímco já se budu meèem dotýkat té rudné haldy!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm... Hmmm... To vypadá, jako bych musel jenom odøíkat to zaøíkávadlo...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Dostaneme se ale do sváru se Saturasem a ostatními mágy!
};







//---------------------------------------------------------------------
//	Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSRISK_Condition;
	information		= Info_Milten_LSRISK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Musíme to riskovat!"; 
};

FUNC int Info_Milten_LSRISK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD4)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Musíme to riskovat!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //Je to VELMI, VELMI dùležité!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Dùležité pro VŠECHNY obyvatele kolonie.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Nerozumím.
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Dostaneme se odtud ven! Musíš mi vìøit!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Dobrá! Musíš to pro nás udìlat, naprosto ti vìøím.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Kromì toho to vypadá, že Xardas ti také vìøí.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Pøijï za mnou dolu k haldì a... Nikomu ani muk!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Dobøe, sejdeme se teda u rudné haldy! Navidìnou!
	
	B_LogEntry			(CH5_Uriziel,"Mìl bych pøesvìdèit svého pøítele Miltena, aby mi pomohl pøenést do meèe energii. Setkáme se u úpatí rudné haldy mágù Vody.");
	Npc_ExchangeRoutine	(self,	"LSOreHeap");
	B_ExchangeRoutine	(Sld_726_Soeldner,	"loadsword");

	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSOREHEAP_Condition;
	information		= Info_Milten_LSOREHEAP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSOREHEAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSRISK )
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Máš meè a zaøíkávadlo?
};
	
//***************************************************************************
//	Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSNOW_Condition;
	information		= Info_Milten_LSNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tady, vezmi si to zaøíkávadlo!"; 
};

FUNC int Info_Milten_LSNOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSOREHEAP)
	&&	Npc_HasItems (hero, Mythrilklinge01)
	&&	Npc_HasItems (hero, Scroll4Milten)
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 1000)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Tady, vezmi si to zaøíkávadlo!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Jsi pøipraven?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Tak, jak se jen dá na tento bláznivý podnik!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Nuže, do toho!

	B_GiveInvItems 	(hero, self, Scroll4Milten, 1);	
	B_GiveInvItems 	(hero, self, Mythrilklinge01, 1);	

	StartChaptersSix = TRUE;

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_CHAPTERSIX_Condition;
	information		= Info_Milten_CHAPTERSIX_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_CHAPTERSIX_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSNOW)
	&&	StartChaptersSix
	{
		return TRUE;
	};	
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(6);
};
	
//---------------------------------------------------------------------
//	Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSDONE_Condition;
	information		= Info_Milten_LSDONE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSDONE_Condition()
{
	if	(Kapitel == 6)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc				(self, hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //Hotovo!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Neuvìøitelné! Ten obyèejný šedivý drahokam se teï tøpytí modravou barvou!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //To je dobré znamení! Magické síly rudné haldy jsou teï zøejmì v tom starém meèi!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Naše malé pøedstavení však zøejmì pøilákalo pár divákù!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Mìl by ses ihned teleportovat na nìjaké jiné místo!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //A co ty?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //O mì si strach nedìlej, nìco vymyslím. A teï už bìž!

	B_Story_UrizielLoaded	();
	
	AI_StopProcessInfos	(self);
};




//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
