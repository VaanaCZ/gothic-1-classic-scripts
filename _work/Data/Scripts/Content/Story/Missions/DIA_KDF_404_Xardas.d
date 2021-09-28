//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //KDO SI DOVOLUJE M� RU�IT P�I STUDI�CH?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Jmenuju se...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Nezaj�m� m�, jak se jmenuje�. Je to ned�le�it�.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //D�le�it� je jen to, �e jsi za ta l�ta prvn� �lov�k, kter� roz�e�il h�danku m�ch Golem�.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Byli tu je�t� jin� n�v�t�vn�ci?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Byli tu je�t� jin� n�v�t�vn�ci?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Ne moc, ale jakmile m� za�ali obt�ovat, nechal jsem je konfrontovat s jednou z m�ch nadp�irozen�ch p��er.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Ty jsi nerad vyru�ov�n, vi�?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Poslal m� Saturas. Pot�ebujeme tvoji pomoc!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Poslal m� Saturas. Pot�ebujeme tvoj� pomoc!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //M�gov� Vody se chystaj� pou��t svoj� velkou rudnou haldu...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Rudn� halda NEN� spr�vn� �e�en�!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //Nen�?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NE!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "V�ichni m�gov� Ohn� jsou mrtv�!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //V�ichni m�gov� Ohn� jsou mrtv�!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez je povra�dil.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //To m� nep�ekvapuje. T�m bl�zniv�m barbar�m na hrad�, hlavn� Gomezovi, nikdy nen� co v��it.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo a dal�� m�gov� si sami zvolili �ibenici, kdy� pom�hali Gomezovi p�evz�t moc.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "O tom takzvan�m 'Sp��ovi' se ��k�, �e je to zl� arcid�mon.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //O tom takzvan�m 'Sp��ovi' se ��k�, �e je to zl� arcid�mon.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Toho si vytvo�ilo Bratrstvo z ba�in.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Te� m�gov� Vody v��� tomu, �e jsou v�ichni v kolonii ve velk�m nebezpe��.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Je to v�t�� nebezpe��, ne� si kdokoliv uvnit� Bari�ry dok�e p�edstavit. 
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "Pokud exploze rudn� haldy toto velk� nebezpe�� neodvr�t�...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Pokud exploze rudn� haldy toto velk� nebezpe�� neodvr�t�...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //...Zapome� na rudnou haldu! Jej� s�la Bari�ru neotev�e.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Kdyby Corristo a Saturas nepl�tvali v minul�ch letech �asem na bl�zniv� a zbyte�n� z�le�itosti, pak by v�ichni v�d�li, co j� v�m.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //A co?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //��dn� z dvan�cti m�g� se od t� doby nep�estal pt�t, pro� se jim vytvo�en� Bari�ry vymklo z rukou a pro� nabyla tak obrovsk�ch rozm�r�.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "P�i�el jsi na to, pro� se to stalo?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //P�i�el jsi na to, pro� se to stalo? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Dobr�, jedno je jist�: odpov�� le�� hluboko pod m�stem sk�et�.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Pod m�stem sk�et�?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Sk�eti nejsou zv��ata, jak si mnoz� mysl�. Jejich kultura je tak star� jako lidsk�.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //P�ed n�kolika stolet�mi vyvolalo p�t sk�et�ch �aman� velmi star�ho arcid�mona, proto�e doufali, �e d� jejich klanu s�lu, se kterou by porazili sv� nep��tele.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Ten arcid�mon, to byl Sp��?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Sk�eti mu tohle jm�no dali a� mnohem pozd�ji. Nem��u ale ��ci, pro� mu ho dali, ani pro� se te� t� nadp�irozen� bytosti d�s�!
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "Pro� ne?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Pro� ne?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //V���m, �e ty bys mohl... NE, jsem si jist, ty bude� muset vykonat jin� �kol!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Jak�?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Pozorn� poslouchej: Sk�eti vyhostili z toho m�sta jednoho �amana.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Pro� ho vyhostili?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Pro� ho vyhostili?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Um�raj�c� sk�et� bojovn�k p�i v�slechu jedn�m m�m d�monem nebyl schopen dlouho odpov�dat na ot�zky.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "Co m� ten sk�et� �aman spole�n�ho s m�m �kolem?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Co m� ten sk�et� �aman spole�n�ho s m�m �kolem?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //�ekne ti zbytek toho p��b�hu o Sp��ovi.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //N�jak� sk�et� �aman bude asi sotva ochotn� se mnou mluvit!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Chce�, abych ti pomohl nebo ne?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Ano, chci, ale...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Pak u� ��dn� ot�zky!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Najdi toho �amana. Nen� u� dlouhou dobu se sv�mi bratry ve sk�et�m m�st� zadob�e, tak�e t� mo�n� vyslechne je�t� p�edt�m, ne� t� prom�n� v �ivou pochode�!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //P�kn� p�edstava!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Kde je ten vyho�t�n� �aman?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Kde je ten vyho�t�n� �aman?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Jdi na v�chod ke star� citadele. Nem��e� ji minout, je na vrcholu hory, kterou uvid� u� z d�lky.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //Jak se dostanu dovnit�?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //��kaj� j� star� citadela, ale zbylo z n� sotva v�c ne� z�kladov� zdi. Je to u� po mnoho desetilet� z��cenina.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "Dostanu od toho �amana odpov�di!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Dostanu od toho �amana odpov�di!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //M�j slu�ebn�k ti u� p�ipravil teleporta�n� runu na pentagram na podlaze.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //To ti usnadn� pozd�j�� n�vrat zp�t.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Hled�m magick� v�d�n�."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Hled�m magick� v�d�n�.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "M�m odpov�di od sk�et�ho �amana!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //M�m odpov�di od sk�et�ho �amana!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //V�born�, tak pov�dej!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //P�t sk�et�ch �aman� vyvolalo Sp��e, kter�ho vytvo�ili v podzemn�m chr�mu, do kter�ho je vstup v sk�et�m m�st�.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //To je pravda!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Proto�e byl nevd��n�, zaklel jejich srdce a odsoudil je k v��n�mu byt� jako nesmrteln� stv�ry!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Velmi dob�e, velmi dob�e!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Sk�eti zav�eli chr�m a za�ali p�in�et ob�ti, aby toho d�mona usm��ili!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Na�el jsi cestu ke vchodu do toho chr�mu?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Ano, je jeden sk�et, kter�...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Bez t�ch podrobnost�! Jdi do podzemn�ho chr�mu! Tam najde� zp�sob jak zni�it Bari�ru!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Nerozum�m!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Necht�l jsi snad po mn�, abych ti pom�hal s odstran�n�m Bari�ry?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //To je pravda, ale...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //PAK TEDY B̎. U� se promrhalo spoustu �asu! Jdi do podzemn�ho chr�mu a najdi tam odpov��!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Na�el jsem cestu do podzemn�ho chr�mu!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Na�el jsem cestu do podzemn�ho chr�mu!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //NA�EL... To je pozoruhodn�!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Stal ses velmi mocn�! Siln�j�� ne� kdokoliv jin� uvnit� Bari�ry.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Mo�n� jsi doopravdy ten mu� ze sk�et�ho proroctv�!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Proroctv�? Jak� proroctv�?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Proroctv�? Jak� proroctv�?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Prastar� sk�et� dokumenty napsan� kr�tce p�ed uzav�en�m podzemn�ho chr�mu se zmi�ovaly o 'Svat�m nep��teli'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //O Svat�m nep��teli?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //N�kdo, kdo prov�dy odstran� SP��E z na�eho sv�ta!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //A j� m�m b�t t�m, kdo byl v tom star�m proroctv� zm�n�n??? Mus� se m�lit, ur�it�!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Mo�n�... Mo�n� ne!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Na�el jsem zvl�tn� me�."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Na�el jsem zvl�tn� me�.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Uka� mi ho.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //To je zaj�mav�... Je na n�m naps�no 'URIZIEL'.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //Sly�el jsem o tom me�i. Je to zbra� z d�vn�ch dob, kdy lidsk� plemeno bylo je�t� mlad�.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Ta zbra� je ukov�na z nezn�m�ho materi�lu. A nikde nen� naps�no, kdo ji vytvo�il!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Jeho ost�� je obda�eno neuv��itelnou moc�, ale nevid�m ��dnou kouzelnou auru! 
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "URIZIEL je obda�en neuv��itelnou moc�?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL je obda�en neuv��itelnou moc�?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Stoj� ps�no, �e majitel t� zbran� dok�zal protnout i to nejsiln�j�� brn�n� a p�ekonat i to nejmocn�j�� ochrann� kouzlo.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //Jak se mohla sk�et�m tahle mocn� zbra� dostat do rukou?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Tvrd� se, �e ji sk�eti vzali jednomu mocn�mu v�le�n�kovi. Nev�d�li, jak ji pou��vat, ale ukryli ji!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Neukryli ji ale dob�e!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je mo�n� obnovit b�valou moc t�to zbran�?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Je mo�n� obnovit b�valou moc t�to zbran�?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Pot�eboval bys k tomu velmi siln� zdroj magick� s�ly.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Mysl� natolik siln�, aby prorazil magickou Bari�ru?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Asi tak siln�...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //A krom� toho bys pot�eboval zvl�tn� magickou formuli, kter� by tu s�lu p�etransformovala.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Dej mi trochu �asu a j� tu magickou formuli vytvo��m.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "J� se zat�m pod�v�m po n�jak� lep�� zbroji!"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //J� se zat�m pod�v�m po n�jak� lep�� zbroji!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Tahle zal�tan� proti�erv� zbroj byla v podzemn�m chr�mu mockr�t prora�ena!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Tyhle modr� hadry by m� v podzemn�m chr�mu sotva ochr�nily!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //Ten nemrtv� zanechal v m� zbroji po��dn� d�ry!
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //M�l bys j�t do moj� star� v�e.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Tvoj� star� v�e?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Potopila se v jednom z v�chodn�ch jezer p�i jednom zem�t�esen�. Vrcholy jsou nad povrchem st�le viditeln�.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Z�stalo v n� n�kolik artefakt�. Nikdy jsem se nesna�il je dostat zp�tky.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Jak se tam dostanu?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Od toho zem�t�esen� jsem tam nebyl, tak�e si k n� bude� muset naj�t cestu s�m.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Tady je kl��. Je od truhly, ve kter� jsem obvykle ukl�dal obzvl᚝ vz�cn� artefakty.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Aha! Vid�m, �e nos� rudnou zbroj.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Jak vid�m, na�el jsi rudnou zbroj.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Na�el jsem ji v jedn� z t�ch truhel v potopen� v�i.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Pat�ila gener�lovi, kter� v bitv� proti sk�et�m pou��val URIZIEL.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Douf�m, �e mi p�inese v�c �t�st� ne� jemu!
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "M� hotovou tu formuli na obnoven� s�ly URIZIELA?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //M� hotovou tu formuli na obnoven� s�ly URIZIELA?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Je hotov�. Nebude� ji moci ale pou��t s�m.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Pro� ne?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Mus� b�t vyslovena n�jak�m m�gem, zat�mco ty se bude� dot�kat me�em zdroje s�ly.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Pak se budu muset porozhl�dnout po n�jak� pomoci!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Vyslov tu formuli a obnov d��v�j�� s�lu me�e. Bude� ji pot�ebovat!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Proto�e jsem m�g, bude pro m� t�k� vl�dnout URIZIELEM!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Proto�e jsem m�g, bude pro m� t�k� vl�dnout URIZIELEM!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Je tu jedno �e�en�...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Nejd��v ale mus� obnovit d��v�j�� s�lu ost��! Pak se vra�!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Obnovil jsem s�lu URIZIELA!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Obnovil jsem s�lu URIZIELA!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //To je neuv��iteln�, me� znovu z�skal svou p�vodn� s�lu. Te� m� opravdu mocnou zbra�!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige L�sung f�r�s Ich-brauch-Orc-Statue-Massaker ***Bj�rn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "��kal jsi, �e existuje n�jak� zp�sob, jak bych mohl URIZIEL ovl�dat, p�esto�e jsem m�g?"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //��kal jsi, �e existuje n�jak� zp�sob, jak bych mohl URIZIEL ovl�dat, p�esto�e jsem m�g?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Pod�vej se na URIZIEL zbl�zka. V�imne� si modr�ho drahokamu v �epeli.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //V n�m je obsa�ena magick� s�la ost��.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Kdy� ten drahokam odstran�m, budu moci vytvo�it kouzelnou runu, kter� bude obsahovat atributy samotn�ho URIZIELA.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Magick� runa vytvo�en� z URIZIELA?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //V boji bude ta runa stejn� siln� jako me�!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Nezapome� ale, �e jedin� n�kter� m�g �est�ho kruhu je schopen ovl�dat takhle mocnou runu!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Odstra� z URIZIELA ten drahokam!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Odstra� z URIZIELA ten drahokam!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Nejsi ale je�t� pod velen�m �est�ho magick�ho kruhu!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Tohle rozhodnut� je kone�n�. Opravdu chce�, abych ten drahokam odstranil?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"ANO, ud�lej to!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"NE, ned�lej to!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //ANO, ud�lej to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Jestli to opravdu chce�... Tady je pr�zdn� me� a runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items �bergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas odstranil z URIZIELU kouzeln� k�men. S�la t�to �epele spo��v� v kouzeln� run� nev�dan� moci.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NE, ned�lej to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Jak si p�eje�. Ost�� si zachov� magickou moc!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//M��e� m� u�it?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //P�ivedu t� k �est�mu kruhu magie.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Uv�dom si, �e jen ti nejmocn�j�� m�gov� se mohou p�idat k �est�mu kruhu. Je vyhrazen pro ty, jejich� �ivoty jsou znamen�mi.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Tv� znamen� je sjednocen� �ivl�.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //�est� kruh ti umo�n� vyu��t jakoukoliv runu.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //A nezapome�: neuplat�uj moc, ale slu� j�.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() �bergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem f�r Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Je�t� ne. U� jsi zb�hl�, ale nem� je�t� dost v�domost�. A� t� nejd��ve cvi�� Saturas, j� ti d�m pokyny pozd�ji.
		
		AI_StopProcessInfos	( self );
	};
};

	
