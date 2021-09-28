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
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Je�t� se uvid�me.
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
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Bez povolen� mistra Corrista nesm� p�ekro�it tenhle pr�h.
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
	description = "Hled�m Velk�ho m�ga Kruhu ohn�.";
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
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Hled�m Velk�ho m�ga Kruhu ohn�.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //To je Corristo. Co mu chce�?
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
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Hled�m Velk�ho m�ga Kruhu ohn�.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //To je Corristo. Co mu chce�?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //M�m dopis pro Velk�ho m�ga Kruhu ohn�.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Au�enwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Uka� mi ten dopis.
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
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //A co takhle n�jakou odm�nu?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //To u� nebude t�eba.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Sly�eli jsme, co jste dok�zali ve Star�m dole. Bez d�ln�ch �erv� se ruda z�sk�v� daleko snadn�ji.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Corristo o va�em �sp�chu taky v�. Chce s tebou mluvit. Jdi za n�m.
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
	description = "M�m dopis pro Velk�ho m�ga Kruhu ohn�.";
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
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //M�m dopis pro Velk�ho m�ga Kruhu ohn�.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Jsi kur�r z vn�j��ho sv�ta?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Ano. M�gov� mi dali ten dopis kr�tce p�edt�m, ne� m� poslali do t�hle kolonie.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Uka� mi ten dopis.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Nejd��v chci svoji odm�nu.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Tady je,",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Tady je,
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Ten dopis je adresov�n Xardasovi.
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //A co je na tom tak divn�ho?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas u� nen� dlouho Innos�v slu�ebn�k. Ode�el od n�s u� p�ed cel�mi v�ky a dal se na �ernou magii.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //�ije ve v�i uprost�ed sk�et�ho �zem� a soust�ed� se na studium.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //�ekl, �e by mohl p�ij�t na to, co se pokazilo na Bari��e.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Po�kej tu. Hned se vr�t�m.
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
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Nejd��v chci svoji odm�nu.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo �ekne Torrezovi, aby ti ji dal, jakmile dostane ten dopis.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Jsem Innos�v slu�ebn�k - nikdy nel�u. Te� mi dej ten dopis.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Rad�ji bych ten dopis dal Torrezovi s�m.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Tady je,",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Rad�ji bych ten dopis dal Torrezovi s�m.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Ty nechce�, abych ho �etl, vi�?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Ne. Chci nejd��v vid�t odm�nu.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Dobr�. Kdy� teda chce�. Po�kej tady.

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
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo nem�l moc velkou radost, kdy� vid�l, jak malou d�v�ru m� ve slu�ebn�ky Innosovy.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Ale ��kal, �e m� j�t k Torrezovi a vz�t si obvyklou odm�nu.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo byl cel� bez sebe pot�en�m. �ekl, �e m��e� j�t k Torrezovi a vybrat si svou odm�nu.
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
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Je cel� den p�ed budovou chr�mu.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //V noci je uvnit� jako v�ichni ostatn� - ale do chr�mu sm�j� vstoupit jenom m�gov�, tak�e s n�m m��e� mluvit jedin� p�es den.
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
	description = "M�m dopis od m�g� Kruhu vody.";
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
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //M�m dopis od m�g� Kruhu vody.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ach! V�born�! D�m ho Corristovi.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //A� se vr�t� do Nov�ho t�bora, m�gov� Vody t� jist� odm�n� za tvoji snahu.
	
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
	description = "�ekni mi n�co o m�z�ch Ohn�.";
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
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //�ekni mi n�co o m�z�ch Ohn�.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Kruh ohn� �erp� moc z milosti Innos. B�h sv�tla, pravdy a spravedlnosti na n�s doz�r�.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //M�gov� se sami rozhodli, �e se stanou vyvolen�mi - a takhle stanovili i ostatn�.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //M�l jsem �t�st�, �e jsem byl p�ijat�. Stal jsem se Corristov�m u�edn�kem. Nejsp� pot�eboval n�jakou z�bavu.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Od t� doby jsem se pak sna�il ka�d� den zlep�ovat v magick�m um�n�, abych byl p�ijat� to dal��ho Kruhu.
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
	description = "Chci se taky st�t kouzelnick�m u�n�m - jako ty.";
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
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Chci se taky st�t kouzelnick�m u�n�m - jako ty.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo m� vybral, proto�e jsem vykonal n�co v�znamn�ho pro Rudobarony.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Dokud nevykon� n�co opravdu v�znamn�ho, nikdy t� do u�en� nevezme.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Krom� toho mus� pat�it ke Star�mu t�boru. Pochybuju, �e by Corristo p�ijal do u�en� n�koho, kdo je �lenem n�jak�ho jin�ho t�bora.
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
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Bu� zdr�v! M�j p��tel Lester z t�bora v ba�in�ch mi �ekl o tv�ch velk�ch skutc�ch!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Jsem ohromen�. Stal ses velmi siln�.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //D�l�m, jak um�m.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Jist�. Po��d skromn�, �e ano?
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
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //U star� rozvaliny kl�tera u mo�e. Hledali jsme tam oba poklad.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Jsem p�esv�d�en�, �e mi v�echno o tom bude vypr�v�t, a� se spolu zase setk�me.
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
	description	= "Byli jsme s Lesterem v horsk� pevnosti.";
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
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Byli jsme s Lesterem v horsk� pevnosti.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //��kal mi o tom. Podle v�eho je mo�n� ti v��it.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Kde jste se vy �ty�i doposud setk�vali?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Och, tu i onde. Setk�vali jsme se na nejr�zn�j��ch m�stech.
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
	description	= "Co tady d�l�?";
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
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //Co d�l� tady?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Nedaleko odtud je prastar� kamenn� kruh. V jeho st�edu le�� vstup do podzemn�ch prostor.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //N�jak� hrobka?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Ano, n�co takov�ho.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //V t� hrobce je n�co, co bych cht�l m�t.
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
	description	= "Hled�m ohniskov� k�men. N�kde mus� b�t.";
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
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Hled�m ohniskov� k�men. N�kde mus� b�t.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Vypad� to, jako bysme oba n�co hledali na stejn�m m�st�.
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
	description	= "Pro� nejde� dol� do t� hrobky a nevezme� si to, co hled�?";
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
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Pro� nejde� dol� do t� hrobky a nevezme� si to, co hled�?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Och, to je dlouh� p��b�h. Musel bych j�t hodn� do minulosti, abych to mohl vysv�tlit.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Vypr�v�j, j� nesp�ch�m.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Dob�e!  Po vytvo�en� magick� Bari�ry, kter� n�s v�echny uv�znila...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...jeden m�g schoval tady dole n�jak� magick� artefakt.
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
	description	= "Nen� ten artefakt jeden z p�ti ohniskov�ch kamen�?";
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
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Nen� ten artefakt jeden z p�ti ohniskov�ch kamen�?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //P�esn� tak! Tak�e ty u� zn� p��b�h p�ti ohniskov�ch kamen�?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Ne��kej mi, �e taky hled� ohnisko!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Ne. M� ohniskov� k�men nezaj�m�. J� hled�m sk�et� talisman.
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
	description	= "Ten artefakt byl zape�et�n?";
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
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Ten artefakt byl zape�et�n?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Ano. Chr�n� ho mocn� kouzlo. Prvn� vykrada� hrob�, kter� se pokus� ukr�st ohnisko...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //...bude proklet a za�arov�n do nesmrteln� bytosti, kter� nepozn� odpo�inek a kter� bude st�e�it hrobku p�ed dal��mi vykrada�i hrob�.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Jak se vyman� z toho proklet�?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //To u� nebude t�eba.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //P�ed n�kolika lety se jeden Rudobaron, kter� z dlouh� chv�le lovil sk�ety, neopatrn� p�ibl�il k hrobce a vstoupil do n�.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Te� je ON str�cem toho pokladu tady dole.
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
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Mysl�m, �e ho jeho b�val� majitel pou��val k vlastn� obran� p�ed rozzloben�mi sk�ety.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Jestli m�m pravdu, pak m��e b�t ten talisman velice u�ite�n�.
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
	description	= "M�li bychom hrobku prohledat spole�n�.";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //M�li bysme hrobku prohledat spole�n�. Ty dostane� talisman a j� ohniskov� k�men.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //Dob�e, je tu ale jeden mal� probl�m...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Probl�m?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Ano. Ten str�ce je dole v hrobce...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //Nem��eme ho rozsekat na kousky?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //To by nebylo moc snadn�. Mysl�m, �e je v�jime�n� necitliv� v��i norm�ln�m zbran�m.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Nech m� h�dat, ty u� m� p�ipraven� pl�n, vi�?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Ech... no... M�m pl�n, ale nedok�u ho prov�st s�m.
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
	description	= "Pov�dej!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Pov�dej!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //M�m s sebou kouzeln� svitek s velmi mocn�m za��k�vadlem.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //To kouzlo zni�� v�echny nemrtv�, kter� zas�hne.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Pak by m�lo b�t vybr�n� hrobky hra�ka.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Hmmm... Dob�e... Ne tak docela! Ten str�ce tam u� nen� tak docela s�m.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Nejsp� n�jak� pozd�j�� vykrada� hrob�, kter� nebyl o moc �sp�n�j�� ne� ten prvn�.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Jednou jsem se�el dolu a byl jsem m�lem zabit. Jeden mu� tam s�m j�t nem��e.
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
	description	= "Dej mi ten kouzeln� svitek a ud�l�me to spole�n�!";
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
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Dej mi ten kouzeln� svitek a ud�l�me to spole�n�!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Dob�e, velmi dob�e. Doufal jsem, �e to �ekne�!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //M�me ale jenom jeden kouzeln� svitek. pou�ijeme ho na str�ce!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Ten druh� nemrtv� m��e b�t zabit i v norm�ln�m boji.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Aha. Kter� cesta vede ke kamenn�mu kruhu?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Poj� za mnou.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"Pobl� kamenn�ho kruhu jsem potkal Miltena, m�ga Ohn�. �ekl mi, �e jeden z ohniskov�ch kamen�, kter� hled�m, je pod t�mto kamenn�m �tvarem.");
	B_LogEntry		(CH3_Stonehenge,"Milten mi dal kouzeln� svitek, kter� mi pom��e porazit nemrtv�ho str�ce krypty. P�jdeme do krypty spole�n�.");
	
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

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Tak, jsme tady. Tenhle tunel vede p��mo do hrobky. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Tak poj�me nav�t�vit str�ce!

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
	description	= "Jsem zran�n�. Pomoz mi, pros�m.";
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
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Jsem zran�n�. Pomoz mi, pros�m.

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Vezmi si l��iv� lektvar.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //U� mi ��dn� l��iv� lektvar nezbyl.
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
	description	= "Str�ce st�le �ije!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Str�ce st�le �ije!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Tak ho zni� kouzeln�m svitkem.
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
	description	= "Pou�il jsem kouzeln� svitek!";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Pou�il jsem kouzeln� svitek - ale ne na str�ce!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //To je katastrofa! Pak ho mus� porazit n�jak�m jin�m zp�sobem!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Snad m��e� koupit dal�� kouzeln� svitek nebo runu v jednom z t�bor�.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Po�k�m tady na tebe. Tady se sejdeme.

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
	description	= "M�m nov� svitek 'Smrt nemrtv�mu'.";
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
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //M�m nov� svitek 'Smrt Nemrtv�mu'.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //V�born�. Te� m��eme na dal�� n�v�t�vu k tomu str�ci.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Jdi prvn�, p�jdu za tebou.

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

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Vid�m, �e u� jsi o hrobku ztratil z�jem.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Jestli se rozmysl�, m��em se setkat tam co p�edt�m.

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
	description = "M��eme se znovu opov�it j�t do t� hrobky?";
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

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //M��eme se znovu opov�it j�t do t� hrobky?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Jsem p�ipraven. Jdi nap�ed, j� p�jdu za tebou.

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

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Dob�e. M� talisman.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Tady, vem si ho. To byla na�e domluva!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //D�kuju, p��teli. Nikdy ti nezapomenu, jak jsi mi pomohl.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Vr�t�m se do Star�ho t�bora, snad se tam sejdeme.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Spole�n� jsme porazili nemrtv�ho STR��CE pod kamenn�m kruhem. Milten si vzal sv�j pod�l ko�isti a vr�til se zp�tky do Star�ho t�bora.");
	B_LogEntry		(CH3_Stonehenge,"Saturas bude r�d, �e jsem tu na�el ohniskov� k�men!");
	
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

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Oni... Oni jsou mrtv�... v�ichni MRTV�. Nedok�zal jsem jim pomoci... J�... nebyl jsem tam... J�...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Uklidni se, Miltene, u� jsem se s Diegem potkal na druh� stran� t�bora.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Dob�e, pak u� to v�. Co ��kal Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Jestli najdu Gorna a Lestera, budu je varovat a po�lu je na m�sto va�eho srazu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Hodn� �t�st� a d�vej pozor!
		B_LogEntry		(CH4_Firemages,"Milten se skr�v� nedaleko Star�ho t�bora, stejn� jako Diego. Tento m�g Ohn� varuje v bezpe�n� vzd�lenosti od hlavn� br�ny p��choz�, aby nepadli do rukou str��m.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Uklidni se, Miltene, co se stalo?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Zabili m�gy Ohn�. V�ECHNY krom� m�, byl jsem taky v bl�zkosti smrti.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Rad�ji mi ten p��b�h �ekni cel� od za��tku, jedno po druh�m.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Dob�e. Uklidni se, Miltene, klid.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //V�echno za�alo zavalen�m Star�ho dolu...
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //Star� d�l byl ZAVALEN???
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Ano. Stalo se to velmi rychle. Nikdo z dolu neunikl.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Str�e zablokovaly vchod do dolu.
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
	description = "Jak se mohl d�l zavalit?";
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
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Jak se mohl d�l zavalit?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Nem�m zd�n�. N�kter� z kop���, kte�� �ekali vp�edu u vchodu, ��kali n�co o siln�m zem�t�esen� a velk�m oblaku d�mu, kter� vych�zel z tunelu.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //Byl jsi tam?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Ano. Proto v�m o tom z�valu.
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
	description = "Pro� by Rudobaroni cht�li zab�t m�gy Ohn�?";
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
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Cos to ��kal o m�z�ch Ohn�?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Jenom v�m, �e byli v�ichni zabiti Rudobarony kr�tce po zavalen� dolu.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Kdy� jsem se vr�til po na�em dobrodru�stv� u kamenn�ho kruhu, str�e u br�ny m� znenad�n� napadly.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Vyk�ikovaly na m� slova 'zr�dce' a 'kolaborant'. Jen taktak, �e se mi poda�ilo uprchnout.
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
	description = "Pro� by Rudobaroni cht�li zab�t m�gy? To ned�v� smysl...";
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
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Pro� by Rudobaroni cht�li zab�t m�gy? To ned�v� smysl...
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //To je pravda. Str�e mi nedaly mo�nost se ani zeptat. Okam�it� tasily me�e.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Snad v� Diego v�c. Byl zrovna v t�bo�e, kdy� se to v�echno za�alo hroutit.
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
	description = "M�l by ses ukr�t. Daleko odtud.";
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
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //M�l by ses ukr�t. Daleko odtud.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Ne. Diego a j� jsme se dohodli, �e budeme hl�dat ob� br�ny a varovat na�e nic netu��c� p��tele z jin�ch t�bor�.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //�ekni to, pros�m, Diegovi!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Pot�, co mi Diego �ekl o neuv��iteln�ch ud�lostech, potkal jsem p�ed Star�m t�borem Miltena. Douf�m, �e je nechyt�.");
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
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Ukr�v� se na druh� stran� Star�ho t�bora, bl�zko zadn� br�ny.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //�ekni mu to, pros�m!

	B_LogEntry			(CH4_Firemages,"Milten m� zastavil p�ed Star�m t�borem a �ekl mi o zavalen� Star�ho dolu a vyvra�d�n� m�g� Ohn�.");
	B_LogEntry			(CH4_Firemages,"Diego se zdr�uje na druh� stran� Star�ho t�bora, pobl� zadn� br�ny. M�l bych si s n�m promluvit, bude v�d�t v�ce o tom, co se p�ihodilo.");
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

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Nazdar, p��teli, u� jsem t� nevid�l v��nost.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Nazdar, Miltene. Hodn� se toho stalo, co jsme se vid�li naposledy.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Cht�l bych ti v�echno vypr�v�t, ale nem�m te� �as. Hrozn� sp�ch�m.
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
	description		= "Miltene, pot�ebuju tvoji pomoc!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Miltene, pot�ebuju tvoji pomoc!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Co se d�je? Jak ti m��u pomoci?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Poj�me n�kam, kde budeme moci mluvit.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Dob�e. Poj� za mnou.

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

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //No tak mi �ekni, co se d�je?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Pot�ebuju magick� s�ly rudn� haldy, ale m�m pocit, �e by nebylo rozumn� po��dat ostatn� m�gy Vody.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //D�l� si legraci!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //Te� nen� na legraci �as. Mysl�m to smrteln� v�n�.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Vid�l jsem Xardase, toho nekromanta!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Pracoval jsem pod jeho velen�m!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? Za��n� m� d�sit!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Od t� doby, co ode�el ze Star�ho t�bora, s n�m nikdo nemluvil.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //J� ano!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Na co pot�ebuje� ty s�ly ze rudn� haldy?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Chci je transformovat do tohoto me�e.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Joj, to je ale zbra�!
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
	description		= "Xardas mi dal kouzeln� za��k�vadlo!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas mi dal kouzeln� za��k�vadlo, kter� provede tu transformaci.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Bude� ho muset p�edn�st, zat�mco j� se budu me�em dot�kat t� rudn� haldy!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm... Hmmm... To vypad�, jako bych musel jenom od��kat to za��k�vadlo...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Dostaneme se ale do sv�ru se Saturasem a ostatn�mi m�gy!
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
	description		= "Mus�me to riskovat!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Mus�me to riskovat!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //Je to VELMI, VELMI d�le�it�!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //D�le�it� pro V�ECHNY obyvatele kolonie.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Nerozum�m.
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Dostaneme se odtud ven! Mus� mi v��it!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Dobr�! Mus� to pro n�s ud�lat, naprosto ti v���m.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Krom� toho to vypad�, �e Xardas ti tak� v���.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //P�ij� za mnou dolu k hald� a... Nikomu ani muk!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Dob�e, sejdeme se teda u rudn� haldy! Navid�nou!
	
	B_LogEntry			(CH5_Uriziel,"M�l bych p�esv�d�it sv�ho p��tele Miltena, aby mi pomohl p�en�st do me�e energii. Setk�me se u �pat� rudn� haldy m�g� Vody.");
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

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //M� me� a za��k�vadlo?
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
	description		= "Tady, vezmi si to za��k�vadlo!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Tady, vezmi si to za��k�vadlo!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Jsi p�ipraven?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Tak, jak se jen d� na tento bl�zniv� podnik!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Nu�e, do toho!

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
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Neuv��iteln�! Ten oby�ejn� �ediv� drahokam se te� t�pyt� modravou barvou!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //To je dobr� znamen�! Magick� s�ly rudn� haldy jsou te� z�ejm� v tom star�m me�i!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Na�e mal� p�edstaven� v�ak z�ejm� p�il�kalo p�r div�k�!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //M�l by ses ihned teleportovat na n�jak� jin� m�sto!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //A co ty?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //O m� si strach ned�lej, n�co vymysl�m. A te� u� b�!

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
