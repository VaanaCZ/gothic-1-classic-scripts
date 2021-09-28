// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //K� by ses vr�til cel�!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co tady d�l�? Tady nem� co pohled�vat! Zmiz!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "M�m d�le�it� zpr�vy z t�bora Bratrstva!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //M�m d�le�it� zpr�vy z t�bora Bratrstva!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Mus� b�t opravdu d�le�it� zpr�va, jestli�e ti Cronos povolil m� nav�t�vit!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y�Berion je mrtev!";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y�Berion je mrtev! Zem�el b�hem ritu�ln�ho vz�v�n� Sp��e.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y�Berion je mrtev�? To je �patn� zpr�va, vskutku �patn�!
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Kdo te� vede Bratrstvo? Ten mocichtiv� a zabedn�n� Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Ne! Kalom se od Bratrstva odvr�til. Vzal sebou p�r templ���. Nikdo nev�, kam ode�li.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Pro� to v�echno? Byl na druh�m m�st� za Y�Berionem!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Jist� ud�losti p�esv�d�ily Guru, �e jsou na �patn� cest�. Z jejich boha se vyklubal zl� arcid�mon.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Jeden z Guru m� pod vlivem Sp��e m�lem zabil, p�esto�e jsem mu kr�tce p�edt�m zachr�nil �ivot.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom je jedin� Guru, kter� nechce uznat pravou podstatu t� pekeln� stv�ry, a proto opustil t�bor v ba�in�ch.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Aha! Dob�e, aspo� v tomto sm�ru m�me �t�st�. Cor Angar je dobr� mu�. Je drsn�, ale p�esto poctiv�.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Jestli�e n�kdo m��e Bratrstvo ochr�nit od �padku po t� duchovn� katastrof�, pak je to pr�v� on.

	B_LogEntry		(CH3_EscapePlanNC,"�ekl jsem Saturasovi o incidentech v t�bo�e v ba�in�ch. Byl r�d, �e Cor Angar p�evzal v Bratrstvu velen�.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "M�m tento almanach...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //M�m tento almanach...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y�Berion ho pou��val k pr�ci s t�m ohniskem.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Velmi dob�e. Pot�ebujeme v�domosti ulo�en� v t� knize, abysme um�li zach�zet s p�ti p�vodn�mi ohniskov�mi kameny.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Vezmu si ten almanach!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "M�m toto ohnisko...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //M�m toto ohnisko...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Dr�� kl��, kter� uvoln� v�echna pouta.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //To je jeden z t�ch kamen�, kter� byly pou�ity k vytvo�en� magick� Bari�ry.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //A pomoc� ohniskov� s�ly t�chto kamen� strhneme tu obrovskou energetickou st�nu.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Nespot�ebuje to ale obrovsk� mno�stv� s�ly?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //To jist�, ale po cel� ty roky jsme ne�navn� shroma��ovali rudu, nam�sto toho, abychom ji vym��ovali za luxusn� zbo�� s na�imi v�zniteli.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Jak jist� v�, ka�d� nuget obsahuje ur�it� mno�stv� magick� s�ly. S pomoc� energie, kter� je nahromad�n� v rudn� hald�, budeme schopni zni�it magickou Bari�ru.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //Vypad� to nebezpe�n�.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //Exploze bude sp�e magick� povahy a zni�� pouze to, co bylo pomoc� kouzel upraveno uvnit� Bari�ry. Lidsk�m bytostem nehroz� ��dn� nebezpe��.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Tady je to ohnisko. Doufejme, �e v�m doopravdy pom��e ve va�ich pl�nech s rudnou hromadou.

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co te� bude� d�lat s t�m ohniskem a almanachem?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Co te� bude� d�lat s t�m ohniskem a almanachem?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nic. Nejprve pot�ebujeme zb�vaj�c� �ty�i ohniskov� kameny!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Bohu�el ale nem�me ani jeden z t�ch �ty� magick�ch kamen�.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jsem ochoten pro v�s ty zb�vaj�c� �ty�i ohniskov� kameny naj�t!";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Jsem ochoten pro v�s ty zb�vaj�c� �ty�i ohniskov� kameny naj�t!
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //P�edev��m m�m s�m docela z�jem se odtud dostat.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Mus�m t� varovat. Jejich hled�n� bude stejn� obt�n�, jako nebezpe�n�.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Proto�e se konflikt se Star�m t�borem den ze dne hor��, nem��u ti sebou d�t ��dn� �old�ky.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Bude� si muset vysta�it �pln� s�m.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Dobr�... To pro m� nen� nic nezvykl�ho! Najdu zp�sob, jak ty v�ci za��dit.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Tv� v�ra je ti ke cti, bude� ale pot�ebovat p�r v�c�, kter� ti pom��ou!
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Vezmi si tuhle mapu. Je star�, ale jsou na n� vyzna�eny v�echny p�vodn� pozice ohniskov�ch kamen� z doby, kdy se vytv��ela Bari�ra.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Tyhle kouzeln� svitky ti umo�n� rychlej�� n�vrat do t�bora.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //A kone�n� si bude� tak� muset promluvit s Riordianem. Va�� pro t�bor lektvary.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Najde� ho v jeho chatr�i, tady v horn� vrstv�.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, tak to je za��tek. D�l� to dob�e.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //K uskute�n�n� na�eho pl�nu je�t� chyb� t�i ohniskov� kameny.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Te� jdi a porozhl�dni se po zb�vaj�c�ch ohniskov�ch kamenech.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //V�born�, to je druh� ohniskov� k�men, kter� jsi n�m donesl.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Bl��me se krok po kroku k na�emu c�li.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Seber odvahu a p�ines ty dva zb�vaj�c� ohniskov� kameny.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Neuv��iteln�, u� m�m pohromad� �ty�i ohniskov� kameny.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //U� n�m chyb� jen jedin�, pak je budeme m�t v�echny.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Ud�lal jsi pro na�� komunitu op�t obrovskou slu�bu. Najdi n�m posledn� ohniskov� k�men a brzy budeme v�ichni voln�.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //V�born�, te� m�me v�ech p�t ohniskov�ch kamen�.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Tv� �iny jsou pro n� t�bor nedoceniteln�. M� mou v��nou �ctu.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Jdi te� k Riordianovi. D� ti odm�nu za tv� nesm�rn� �sil�.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //�ekni si tak� Cronosovi, str�ci rudy. D� ti od na�� komunity dal�� dar.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"Poda�ilo se mi naj�t v�echny �ty�i ohniskov� kameny. Douf�m, �e mi to v Nov�m t�bo�e zajist� uzn�n�.");
		B_LogEntry		(CH3_BringFoci,"M�gov� Vody, Cronos a Riordian, mi sl�bili za ohniskov� kameny odm�nu. M�l bych se po nich j�t pod�vat.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Auftr�ge bekam.    ***Bj�rn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Vid�m, �e u� jsi vy�erpal teleporta�n� svitek. Tady m� nov�.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "Na�el jsem ohnisko v Ka�onu trol�!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Na�el jsem ohnisko v Trol�m ka�onu!

	B_LogEntry		(CH3_TrollCanyon,"Ohnisko z Trol�ho ka�onu je te� v bezpe�� u Saturase.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "Na�el jsem ohnisko v horsk� pevnosti!";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //Na�el jsem ohnisko v horsk� pevnosti!

	B_LogEntry		(CH3_Fortress,"Saturas ode m� dostal ohnisko z horsk� pevnosti.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "Na�el jsem ohnisko ve zbo�en�m kl�te�e!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Na�el jsem ohnisko ve zbo�en�m kl�te�e!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Byl tam �old�k Gorn a pomohl mi s hled�n�m.

	B_LogEntry		(CH3_MonasteryRuin,"Kone�n� jsem mohl Saturasovi d�t ohnisko ze zbo�en�ho kl�tera.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "Na�el jsem ohnisko pod kamenn�m kruhem!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Na�el jsem ohnisko pod kamenn�m kruhem!

	B_LogEntry		(CH3_Stonehenge,"Dal jsem Saturasovi ohnisko z krypty pod kamenn�m kruhem.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "M��e� u� tu rudnou haldu odp�lit?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //M��e� u� tu rudnou haldu odp�lit?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Te� u� m�me v�echny artefakty, kter� pot�ebujeme k proveden� na�eho pl�nu.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Bari�ru ale vytvo�ilo dvan�ct m�g�.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //V Kruhu vody nen� dost m�g�, kte�� by ��dili silovou energii a vedli ji spr�vn�m sm�rem.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //Co m��eme ud�lat?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Oce�uji, �e jsi toho pro na�i komunitu u� tolik ud�lal, jsme ti nesm�rn� zav�zan�...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //...ale v z�jmu v�ech obyvatel kolonie t� mus�m po��dat je�t� o jednu slu�bu.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "Je�t� jednu slu�bu?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //Je�t� jednu slu�bu?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Ano. Jdi do Star�ho t�bora a pokus se z�skat n�jak� m�gy Kruhu ohn� pro na�i v�c.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //M�GY OHN�??? Pro� by se m�li vzd�t sv�ho pohodln�ho �ivota?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //Zni�en� Bari�ry ukon�� jejich mocensk� postaven�!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //To je ten d�vod, pro� se mus� o tento �kol pokusit PR�V� TY. Zn� lidi ze v�ech t�bor� kolonie.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //P�ipome� m�g�m Ohn� star� �asy, kdy jsme spole�n� studovali um�n� magie.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "Dobr� tedy, pokus�m se p�esv�d�it m�gy Ohn�!";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //Dobr� tedy, pokus�m se p�esv�d�it m�gy Ohn�!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Nem��u ale sl�bit nic! Zd� se mi to bezm�la nemo�n�!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Mus� to zkusit. Kdy� se ti to nepoda��, pak u� zbude jen jeden...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Pr�v� jeden...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //... jeden CO?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Zapome� na to! MUS� se ti to pov�st!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Tady je kouzeln� runa. Dej ji Corristovi, Velk�mu m�govi Kruhu ohn� jako d�kaz na�� d�v�ry.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //S n� se m��e kdykoliv teleportovat do t�to m�stnosti, ani� by se setkal se str�emi.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Douf�m, �e to na�e star� p��tele p�esv�d�� o na�em dobr�m z�m�ru.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Jsem r�d, �e ses vr�til. Stalo se n�co �patn�ho!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Nech m� h�dat, Svobodn� d�l byl napaden str�emi Star�ho t�bora. Nikdo je nevid�l p�ich�zet...?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Pokra�uj... jak... ale samoz�ejm�... Ty v� o tom, co se stalo ve Star�m t�bo�e!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Chvilku p�ed tebou p�i�el Gorn.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Co p�im�lo Gomeze, �e si troufl k tak agresivn�mu �inu?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Mus� mu b�t jasn�, �e takov� hanebn� �in jenom vyprovokuje v�lku.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Star� d�l se zhroutil potom, co ho zatopila voda!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Star� d�l se zhroutil potom, co ho zatopila voda!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Zhroutil... jist�... pak cel� ta v�c d�v� smysl.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez stoj� z�dy ke zdi. Je nebezpe�n�j�� ne� kdy jindy. Nem� u� co ztratit, je schopn� �ehokoliv!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez zabil v�echny m�gy Ohn�!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez zabil v�echny m�gy Ohn�!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //ZABIL JE??? Jak mohl, p�i jm�nu Beliarovu, tohle ud�lat?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Postavili se proti �toku na Svobodn� d�l a protivili se Gomezovi.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Pak jsme v�ichni ztraceni. Bez ostatn�ch �esti m�g� nebudeme nikdy schopni usm�rnit s�lu masivu rudn� haldy.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Ale p�esto ti d�kuju za to, �e jsi mi tu hroznou zpr�vu sd�lil.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas nem�l p��li� radost, kdy� jsem mu pov�d�l o incidentech ve Star�m t�bo�e. To, co se p�ihodilo znamen�, �e sv�j pl�n na �nik... budou muset prov�st BEZ m�g� Ohn�.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Byl jsem vyho�t�n ze Star�ho t�bora, proto�e jsem v�m pom�hal!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Byl jsem vyho�t�n ze Star�ho t�bora, proto�e jsem v�m pom�hal!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //U� teda nepat�� ke Star�mu t�boru?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Pak v�tej do na�� komunity!

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Kdy� jsem byl vyk�z�n ze Star�ho t�bora, Saturas m� p�iv�tal v Nov�m t�bo�e.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znamen� to, �e m� p�ijmou �old�ci?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Znamen� to, �e m� p�ijmou �old�ci?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //�ekni Leeovi, dohl�dne na to. Pak se ke mn� vra�.

	B_LogEntry			(CH4_BannedFromOC,"Lee, velitel �old�k�, se mnou chce mluvit. M�m se k n�mu dostavit a pak se vr�tit k Saturasovi."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znamen� to, �e te� pat��m do spolku m�g� Vody?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Znamen� to, �e te� pat��m do spolku m�g� Vody?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Je�t� ne. Nejd��ve mus� slo�it p��sahu Vody.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //J� u� jsem ale slo�il p��sahu Ohn�!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //To neznamen�, �e t�m sv�j slib poru��!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Uch... Nerozum�m...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Roz���� svoji p��sahu. Tak se stane� m�gem obou �ivl�!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Pak bude� m�t s�lu Ohn�, zrovna tak jako moudrost Vody!

	B_LogEntry			(CH4_BannedFromOC,"Saturas m� nech� p�idat se ke Kruhu vody, ani� bych musel zru�it p��sahu Ohni."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jsem p�ipraven slo�it p��sahu."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jsem p�ipraven slo�it p��sahu.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Slu�ebn�ku Ohn�, te� dostane� po�ehn�n� Vody!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Nyn� prones slova p��sahy:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //P��sah�m p�i bo�� moci...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //P��sah�m p�i bo�� moci...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...a na s�lu svat� Vody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...a na s�lu svat� Vody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...�e m� v�d�n� a skutky budu od tohoto okam�iku a prov�dy v jednot� s Vodou...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...�e m� v�d�n� a skutky budu od tohoto okam�iku a prov�dy v jednot� s Vodou...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...dokud m� t�lo nebude navr�ceno ��i Beliarov� a voda m�ho �ivota nevyschne
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...dokud m� t�lo nebude navr�ceno ��i Beliarov� a voda m�ho �ivota nevyschne
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Touto p��sahou jsi v sob� sjednotil s�lu Ohn� a po�ehn�n� Vody.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //M� nyn� ve svazku to, co d��ve bylo rozd�leno. K� jde tv�j �ivot ve znamen� jednoty t�chto �ivl�.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Obl�kni si toto roucho na znamen� svazku se svatou Vodou a Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Te� jsem spojencem Kruhu vody. Nyn� m�m p��stup k ob�ma �kol�m magie."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "M��e� m� cvi�it?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //M��e� m� cvi�it?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Je toho hodn�, co se mus� nau�it. Budu t� cvi�it, a� na to bude� p�ipraven.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Existuje je�t� jeden Kruh, kter� nezn�. Budu t� o n�m u�it, jakmile bude� na to p�ipraven.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //U� jsi zvl�dl P�t� kouzeln� kruh! V� u� to, co j�.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //U� t� v�c u�it nedok�u!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, v�dce m�g� Vody, u�� magick�m KRUH�M. St�le p�eb�v� u pentagramu v horn� rovin�.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Jsem p�ipraven vstoupit do P�t�ho kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Vstoupit do prvn�ho z kouzeln�ch kruh� znamen� nau�it se pou��vat kouzeln� runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Ka�d� runa obsahuje strukturu zvl�tn�ho kouzeln�ho za��k�vadla.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Spolu se sv�mi vlastn�mi kouzeln�mi silami bude� schopen vyu��vat kouzlo run.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Ale narozd�l od kouzeln�ch svitk�, kter� jsou tak� kouzeln�mi formulemi, magick� s�la run zaji��uje, �e struktura za��k�vadla p�etrv�v�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Ka�d� runa je zdrojem magick� s�ly, kterou m��e� kdykoliv zase zru�it.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Svoji vlastn� kouzelnou moc vyu�ije� tehdy, kdy� pou�ije� runu, podobn� jako je tomu s kouzeln�m svitkem.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Se vstupem do ka�d�ho dal��ho Kruhu se nau�� vyu��vat tak� dal�� kouzeln� runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Vyu�ij moc run k pozn�n� sebe sama.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Jsem p�ipraven vstoupit do Druh�ho kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Nau�il ses rozum�t kouzeln�m znak�m. Nade�el �as prohloubit toto porozum�n�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Jakmile se p�id� ke Druh�mu kruhu, nau�� se z�klad�m mocn�j��ch bojov�ch za��k�vadel a v�em taj�m ranhoji�stv�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Bude� se ale muset nau�it je�t� v�c, jestli chce� poznat opravdov� tajemstv� magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //V�, �e ka�dou runu m��e� pou��vat jak �asto chce�, dokud nevy�erp� sv� vlastn� s�ly.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Ne� bude� jednat, rozmysli si c�l sv�ho jedn�n�. Nabyl jsi s�ly, kter� t� snadno m��e dov�st k z�hub� a zni�en�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Opravdov� m�g ale u��v� kouzla jen tehdy, kdy� je to nezbytn�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Pokud porozum� situaci, pak pozn� moc run.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //M��e� m� p�ipravit do T�et�ho kruhu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //T�et� kouzeln� kruh je jedn�m z nejd�le�it�j��ch krok� v �ivot� m�ga. Jakmile ho dos�hne�, p�est�v� b�t hleda�em.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Do�el jsi u� po cest� magie opravdu daleko. Nau�il ses pou��vat kouzeln� runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Tato znalost je v�chodisko pro tvoj� dal�� cestu. Pou��vej tyto runy s uv�en�m.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Runy m��e� nebo nemus� pou��vat. Ale mus� se rozhodnout pro jednu z t�chto mo�nost�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Jakmile se rozhodne�, neost�chej se vyu��t sv�ch sil.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Jakmile porozum� sv� cest�, pak pozn� s�lu rozhodnut�.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Jsem p�ipraven vstoupit do P�t�ho kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Dokon�il jsi prvn� t�i Kruhy. Nyn� nade�el �as nau�it se tajemstv� magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Kouzlo run je zalo�eno na kamenech. Existuj� kouzeln� kameny, vytvo�en� z kouzeln� rudy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Z t� sam� rudy, kter� se t�� tady v dolech. Tato ruda je obda�ena magick�mi formulemi templ���. Tyto runy jsou upraveny jako n�stroje na�� moci.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //S t�mito runami, kter� u� ovl�d�, m� cel� v�d�n� chr�mov� sf�ry v mal��ku.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Jakmile porozum� magii, objev� tajemstv� moci.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER F�NFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Jsem p�ipraven vstoupit do P�t�ho kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Spr�vn�. Budu t� u�it o s�le P�t�ho kruhu.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Bou�e Ohn� a Vody a S�la, kter� ni�� nemrtv�, jsou kouzla, kter� m��e� t�mito runami vyvol�vat.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Nejmocn�j�� za��k�vadlo P�t�ho kruhu je ale Smrteln� vln�n�. Pokud vlastn� jeho runu, pak m� nebezpe�nou moc.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Tento druh kouzla ale pou��vej co nejm�n�. Je to dar boha temnot.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Te� zn� v�echno, co jsem t� mohl nau�it.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Poznej sv� mo�nosti, pak bude� zn�t svoji opravdovou moc.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Cht�l bych nosit vzne�en� roucho Vody.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Je�t� nenade�el �as, abys nosil vzne�en� roucho.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //S t�mhle mno�stv�m rudy nezaplat� ani v�robn� n�klady.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Nade�el tv�j �as. Jsi hoden nosit vzne�en� roucho Vody.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee m� p�ijmul k �old�k�m.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee m� p�ijmul k �old�k�m.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Dob�e. V�born�. Te� pat�� ofici�ln� k na�� komunit�.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Bu� v�t�n!

	B_LogEntry			(CH4_BannedFromOC,"Saturas m� ofici�ln� uvedl jako �old�ka. ");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Kdy� jsi m� pos�lal k m�g�m Ohn�, ��kal jsi, �e byl... N�KDO.";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Bj�rn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Bj�rn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Kdy� jsi m� pos�lal k m�g�m Ohn�, ��kal jsi, �e byl... N�KDO.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Dobr�, doufal jsem, �e to dok�u bez tvoj� pomoci, v�ci se m�n�...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //Kdo je ten ON?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Dob�e, dob�e!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //P�ed mnoha mnoha lety...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Zkra� to, pros�m!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Bu� trp�liv�! Dobr�, kdy� jsme - n�s dvan�ct m�g� - tvo�ili tehdy Bari�ru, na�e magick� s�ly byly sm�rov�ny a ��zeny t�in�ct�m m�gem.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //T�in�ct�m m�gem? Myslel jsem, �e jich bylo jen dvan�ct!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //V�t�ina lid�, kter� neza�ila nejstar�� obdob� kolonie, tomu v���.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Ten t�in�ct� m�g byl n� v�dce. To v�echno se stalo p�edt�m, ne� jsme byli rozd�leni do Kruh� Ohn� a Vody.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Opustil ale Star� t�bor, kter� byl tehdy jedin�m v kolonii.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jak se ten t�in�ct� m�g jmenoval?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Jak se ten t�in�ct� m�g jmenoval?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Jmenoval se Xardas. Sotva si n�kdo vzpomene na tu starou historii!
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ti kte�� si vzpomenou, ho te� naz�vaj� NEKROMANT!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Pro� opustil Star� t�bor?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Pro� opustil Star� t�bor?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Za�al zkoumat vyvol�v�n� mrtv�ch a magick�ch stv�r.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez nebyl jedin�, kdo ho varoval. V�t�ina m�g� se postavila proti n�mu i proti jeho bezbo�n�m praktik�m.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //Co se stalo pak?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //Narozd�l od Gomeze to nebyl vrahoun, a tak se mu poda�ilo vyhnout konfliktu a odej�t.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Kde je ten m�g dneska?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Kde je ten m�g dneska?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //�ije v odlou�en� ve v�i uprost�ed zem� sk�et�.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //To je p�ibli�n� u nejji�n�j��ho c�pu kolonie.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "P�jdu za Xardasem a po��d�m ho o pomoc!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //P�jdu za Xardasem a po��d�m ho o pomoc!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Je jedin�, kdo n�m m��e pomoci.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Pokud si ale nebude v�d�t rady nebo n�m nepom��e...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //BUDE!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Je tu je�t� jeden probl�m...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Probl�m?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Probl�m?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Ano. B�hem let jsme se n�kolikr�t pokou�eli s Xardasem spojit.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Z�ejm� v�ak necht�l b�t vyru�ov�n.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Co to znamen�?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //��dn� z kur�r� se od n�j z v�e nevr�til.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Bude� muset vymyslet zp�sob, jak proj�t p�es ty stv�ry.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Za��n� to b�t zaj�mav�!
	
	B_LogEntry			(CH4_FindXardas,"Saturas m� varoval p�ed stv�rami nekromanta Xardase. V knihovn� m�g� Vody jsou spisy o s�le i slabin�ch t�chto netvor�. M�l bych si ud�lat �as a pro��st si je.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jak se dostanu p�es ty stv�ry?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Jak se dostanu p�es ty stv�ry?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Kdybych v�d�l, �ekl bych ti to!
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Poradil bych ti, aby ses porozhl�dl v na�� knihovn�.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Mo�n� ve star�ch knih�ch najde� n�co o s�le i slabin�ch magi� vytvo�en�ch stv�r.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Prohled�m knihovnu. A nem�j obavy...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Vr�t�m se!

	B_LogEntry			(CH4_FindXardas,"V knihovn� m�g� Vody jsou spisy o s�le i slabin�ch t�chto netvor�. M�l bych si ud�lat �as a pro��st si je.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schl�sselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Mluvil jsi s Xardasem?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Tedy...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Ne...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Cel� ta z�le�itost nen� takov�, jak si mysl�...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Tedy...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Tedy...? Co, teda?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //�h ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir d�rfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Ne...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Pro� ne?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Nedok�zal jsem se dostat do t� oblasti...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Mus� ho naj�t a po��dat ho o radu!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Cel� ta z�le�itost nen� takov�, jak si mysl�...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Co to m� znamenat? Mus� naj�t zp�sob, jak odp�lit tu rudnou haldu!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Ta rudn� halda... uch... ehm... Vyrostla po��dn� vysoko!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Najdi Xardase, mus� pomoci!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius �ekl, �e u� jsem hoden nosit roucho m�ga Vody."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius �ekl, �e u� jsem hoden nosit roucho m�ga Vody.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Pak v�tej do na�� komunity!
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Znamen� to, �e te� pat��m do spolku m�g� Vody?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Je�t� ne. Nejd��ve mus� slo�it p��sahu Vody.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Jsem p�ipraven slo�it p��sahu."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jsem p�ipraven slo�it p��sahu.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Nyn� prones slova p��sahy:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //P��sah�m p�i bo�� moci...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //P��sah�m p�i bo�� moci...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...a na s�lu svat� Vody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...a na s�lu svat� Vody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...�e m� v�d�n� a skutky budu od tohoto okam�iku a prov�dy v jednot� s Vodou...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...�e m� v�d�n� a skutky budu od tohoto okam�iku a prov�dy v jednot� s Vodou...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...dokud m� t�lo nebude navr�ceno ��i Beliarov� a voda m�ho �ivota nevyschne
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...dokud m� t�lo nebude navr�ceno ��i Beliarov� a voda m�ho �ivota nevyschne
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Obl�kni si toto roucho na znamen� svazku se svatou Vodou a Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas m� p�ijal do Kruhu vody.");

	AI_StopProcessInfos	(self);
};

