//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcShaman_EXIT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	nr			= 999;
	condition	= Info_OrcShaman_EXIT_Condition;
	information	= Info_OrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_OrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcShaman_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info THX
//---------------------------------------------------------------------
instance  Info_OrcShaman_THX (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_THX_Condition;
	information	= Info_OrcShaman_THX_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_THX_Condition()
{	
	if	(Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC void  Info_OrcShaman_THX_Info()
{
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Dlu�it d�ky, cizin�e.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Zl� sk�eti m� cht�j� zab�t.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Sta�� brat�i b�t dneska nep��tel�.
}; 

//---------------------------------------------------------------------
//	Info WHO
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHO_Condition;
	information	= Info_OrcShaman_WHO_Info;
	important	= 0;
	permanent	= 0;
	description = "Kdo jsi?";
};

FUNC int  Info_OrcShaman_WHO_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHO_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Kdo jsi?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //J� se jmenovat Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //B�t synem ducha. Lid� tomu ��kat �aman.
}; 

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance  Info_OrcShaman_TONGUE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_TONGUE_Condition;
	information	= Info_OrcShaman_TONGUE_Info;
	important	= 0;
	permanent	= 0;
	description = "Kde ses nau�il n� jazyk?";
};

FUNC int  Info_OrcShaman_TONGUE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_TONGUE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Jak ses nau�il n� jazyk?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak b�t otrok lid� v dole.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Ut�ct pry�. To b�t u� p�ed mnoha zimami.
}; 

//---------------------------------------------------------------------
//	Info MINE
//---------------------------------------------------------------------
instance  Info_OrcShaman_MINE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MINE_Condition;
	information	= Info_OrcShaman_MINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Tys byl otrok v dole? Ve kter�m dole?";
};

FUNC int  Info_OrcShaman_MINE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_TONGUE))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MINE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Tys byl otrok v dole? Ve kter�m dole?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //D�l b�t pod vesnic� v Kotlin�.
}; 

//---------------------------------------------------------------------
//	Info WHY
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHY_Condition;
	information	= Info_OrcShaman_WHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Pro� jsou tvoji brat�i proti tob�?";
};

FUNC int  Info_OrcShaman_WHY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Pro� jsou tvoji brat�i proti tob�?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak b�t v nep��zni.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Ztratit velkou �ctu v KRUSHAKA.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //V��it mi, KRUSHAK b�t zl� d�mon..
}; 

//---------------------------------------------------------------------
//	Info KRUSHAK
//---------------------------------------------------------------------
instance  Info_OrcShaman_KRUSHAK (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_KRUSHAK_Condition;
	information	= Info_OrcShaman_KRUSHAK_Info;
	important	= 0;
	permanent	= 0;
	description = "Co znamen� KRUSHAK?";
};

FUNC int  Info_OrcShaman_KRUSHAK_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_WHY))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_KRUSHAK_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //Co to znamen� KRUSHAK?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Lid� tomu ��kat SP�T.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Mysl� 'Sp��'?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Ano, lid� tomu ��kat SP��!
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_OrcShaman_SLEEPER (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SLEEPER_Condition;
	information	= Info_OrcShaman_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Co v� o Sp��ovi?";
};

FUNC int  Info_OrcShaman_SLEEPER_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_KRUSHAK))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Co v� o Sp��ovi?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //B�t p�t brat��. To b�t p�ed mnoha zimami!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //B�t synov� ducha, tak jako Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Mysl� p�t �aman�!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Vyru�ovat KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Cht�t porazit klan nep��tel!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //P�t brat�� potom postavit pro KRUSHAKA chr�m pod zem�!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Podzemn� chr�m pro Sp��e! Ten, co m�l na mysli Xardas, kdy� mluvil o vstupu v 'sk�et�m m�st�'!
}; 

//---------------------------------------------------------------------
//	Info CURSE
//---------------------------------------------------------------------
instance  Info_OrcShaman_CURSE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_CURSE_Condition;
	information	= Info_OrcShaman_CURSE_Info;
	important	= 0;
	permanent	= 0;
	description = "Co se stalo v tom podzemn�m chr�mu?";
};

FUNC int  Info_OrcShaman_CURSE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_SLEEPER))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_CURSE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Co se stalo v tom podzemn�m chr�mu?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Brat�i potom d�t srdce KRUSHAKOVI.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Ale KRUSHAK b�t zl�. KRUSHAK prokl�t v�echny, co postavit chr�m.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Brat�i nem�t srdce, ale b�t mrtv� a ��t. B�t oboj�.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK m�t te� srdce brat��. Srdce te� b�t KRUSHAKOVA s�la.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Co se stalo s d�ln�ky, kte�� vystav�li ten chr�m?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK prokl�t v�echny. I d�ln�ky. B�t v�ichni mrtv� i ��t. Oboj� najednou.
}; 

//---------------------------------------------------------------------
//	Info OUTSIDE
//---------------------------------------------------------------------
instance  Info_OrcShaman_OUTSIDE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OUTSIDE_Condition;
	information	= Info_OrcShaman_OUTSIDE_Info;
	important	= 0;
	permanent	= 0;
	description = "A sk�eti na povrchu s t�m nic neud�lali?";
};

FUNC int  Info_OrcShaman_OUTSIDE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_CURSE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OUTSIDE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //A sk�eti na povrchu s t�m nic neud�lali?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Uzav��t chr�m. Brat�i dnes uct�vat KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK b�t vysv�cen�, ne se st�t zl�.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak si myslet, �e vysv�cen� b�t �patn� v�c. Muset ��ct, �e KRUSHAK b�t zl�.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Brat�i o tom necht�t sly�et. Brat�i ��kat Ur-Shak odej�t. Brat�i vyhnat Ur-Shaka.
}; 

//---------------------------------------------------------------------
//	Info INTEMPLE
//---------------------------------------------------------------------
instance  Info_OrcShaman_INTEMPLE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_INTEMPLE_Condition;
	information	= Info_OrcShaman_INTEMPLE_Info;
	important	= 0;
	permanent	= 0;
	description = "Pot�ebuju se dostat do toho podzemn�ho chr�mu. M��e� m� tam dov�st?";
};

FUNC int  Info_OrcShaman_INTEMPLE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OUTSIDE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_INTEMPLE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Pot�ebuju se dostat do toho podzemn�ho chr�mu. M��e� m� tam dov�st?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak ��ct cizinci d�ky. Cizinec zachr�nit Ur-Shaka.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ale vstup do chr�mu b�t doma. Ur-Shak nesm�t j�t dom�.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //V�m, mysl� t�m, �e by t� nepustili zp�tky do sk�et�ho m�sta.
};

//---------------------------------------------------------------------
//	Info MAP
//---------------------------------------------------------------------
instance  Info_OrcShaman_MAP (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MAP_Condition;
	information	= Info_OrcShaman_MAP_Info;
	important	= 0;
	permanent	= 0;
	description = "M��e� mi uk�zat na map�, kde to sk�et� m�sto le��?";
};

FUNC int  Info_OrcShaman_MAP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE)
	&&	Npc_HasItems (hero, ItWrWorldmap)
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MAP_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //M��e� mi uk�zat na map�, kde to sk�et� m�sto le��?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Domov Ur-Shaka b�t tam, kde mapa pr�zdn�.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Cizinec d�t mapu, Ur-Shak ji dokon�it!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(�kr�be do mapy)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //ڞasn�, jsi dobr� kartograf. D�ky!

	B_GiveInvItems  (hero, self, ItWrWorldmap, 1);
	Npc_RemoveInvItem(self, ItWrWorldmap);
	CreateInvItem	 (self, ItWrWorldmap_Orc);
	B_GiveInvItems  (self, hero, ItWrWorldmap_Orc, 1);
}; 

//---------------------------------------------------------------------
//	Info FIGHT
//---------------------------------------------------------------------
instance  Info_OrcShaman_FIGHT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FIGHT_Condition;
	information	= Info_OrcShaman_FIGHT_Info;
	important	= 0;
	permanent	= 0;
	description = "Dobr�, budu muset bojovat podle sv�ho.";
};

FUNC int  Info_OrcShaman_FIGHT_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FIGHT_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Dobr�, budu muset bojovat podle sv�ho.
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Brat�i doma b�t velmi siln�! Bratr� b�t h���dn� moc!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Cizinec tam nechodit. Mnoho bojovn�k�! Cizinec zem��t!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Dal�� synov� ducha b�t doma. Kdy� cizinec ud�lat ohe�, potom cizinec zem��t!
}; 

//---------------------------------------------------------------------
//	Info OTHERWAY
//---------------------------------------------------------------------
instance  Info_OrcShaman_OTHERWAY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OTHERWAY_Condition;
	information	= Info_OrcShaman_OTHERWAY_Info;
	important	= 0;
	permanent	= 0;
	description = "Dob�e, dob�e, budu ale muset n�jak naj�t cestu do chr�mu!";
};

FUNC int  Info_OrcShaman_OTHERWAY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_FIGHT))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OTHERWAY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Dob�e, dob�e, budu ale muset n�jak naj�t cestu do chr�mu!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak zn�t cestu! Cizinec m�t ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU??? Co je to Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //To b�t znamen� p��telstv�! Brat�i si v�it ULU-MULU!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Kdy� cizinec m�t ULU-MULU, pak cizinec nezem��t!
};

//---------------------------------------------------------------------
//	Info ULUMULU
//---------------------------------------------------------------------
instance  Info_OrcShaman_ULUMULU (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ULUMULU_Condition;
	information	= Info_OrcShaman_ULUMULU_Info;
	important	= 0;
	permanent	= 0;
	description = "Kde dostanu to Ulu-Mulu?";
};

FUNC int  Info_OrcShaman_ULUMULU_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OTHERWAY))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_ULUMULU_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Kde dostanu to Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Cizinec j�t k p��teli Ur-Shaka!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //P��tel Ur-Shaka d� ULU-MULU! Cizinec nosit ULU-MULU a pak nezem��t!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Dob�e, dob�e, tomu 'nezem��t' rozum�m, ale kde najdu tv�ho p��tele?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //P��tel Ur-Shaka b�t v dole lid�. P��tel neut�ct s Ur-Shakem. P��tel pak b�t nemocn�.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byl jsi zav�en� ve Svobodn�m dole?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byls v�zn�m v tom opu�t�n�m dole?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Dr�eli t� zav�en�ho v Star�m dole?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Byls v�zn�m v tom opu�t�n�m dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak neznat to slovo.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Dr�eli t� zav�en�ho v Star�m dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nerozum�t!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Byl jsi zav�en� ve Svobodn�m dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak b�t v�ze� v dole pod vesnic� v Kotlin�.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak myslet, �e tomu lidi tak ��kat!

	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
};

//---------------------------------------------------------------------
//	Info BYEBYE
//---------------------------------------------------------------------
instance  Info_OrcShaman_BYEBYE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_BYEBYE_Condition;
	information	= Info_OrcShaman_BYEBYE_Info;
	important	= 0;
	permanent	= 0;
	description = "D�ky za tvou pomoc!";
};

FUNC int  Info_OrcShaman_BYEBYE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_ULUMULU))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_BYEBYE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //D�kuju ti za pomoc!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak ��kat d�kuju cizinci. Cizinec zachr�nit Ur-Shaka. Cizinec te� b�t p��tel Ur-Shaka!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //D�t p��teli dar. Ur-Shak d�t talisman! Talisman ochr�nit p�ed dechem ohniv� je�t�rky!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nesm�t j�t domu. Ur-Shak te� ��t tady! P��tel p�ij�t, kdy� pot�ebovat pomoc!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Snad tvoj� nab�dku budu moci vyu��t!

	B_Story_FriendOfUrShak	();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info FRIENDLYHELLO
//---------------------------------------------------------------------
instance  Info_OrcShaman_FRIENDLYHELLO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FRIENDLYHELLO_Condition;
	information	= Info_OrcShaman_FRIENDLYHELLO_Info;
	important	= 0;
	permanent	= 0;
	description = "Jak se m�, m�j p��teli?";
};

FUNC int  Info_OrcShaman_FRIENDLYHELLO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_BYEBYE)
	&&	FriendOfUrShak
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FRIENDLYHELLO_Info()
{
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Jak se m�, m�j p��teli?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak b�t zdrav�!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak te� hledat svoje vlastn� ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Mo�n� Ur-Shak p�ij�t domu s vlastn�m ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //P��tel p�ij�t, kdy� pot�ebovat pomoc!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //B�t opatrn�!
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info ORCCITY
//---------------------------------------------------------------------
instance  Info_OrcShaman_ORCCITY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ORCCITY_Condition;
	information	= Info_OrcShaman_ORCCITY_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_ORCCITY_Condition()
{	
	if	(Npc_GetDistToWP(hero, "SPAWN_OW_WARAN_ORC_01")<1000)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_ORCCITY_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(hero, self);

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak zdravit p��tele!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //P��tel m�t ULU-MULU! To b�t dob�e!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //P��tel nezapomenout dr�et ULU-MULU v ruce, a� p�ech�zet most!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //P��tel nem�t ULU-MULU! To neb�t dob�e!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //P��tel nep�ech�zet most, jinak zem��t!
	};
}; 

//---------------------------------------------------------------------
//	Info YOUHERE
//---------------------------------------------------------------------
instance  Info_OrcShaman_YOUHERE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_YOUHERE_Condition;
	information	= Info_OrcShaman_YOUHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Co d�l� tak bl�zko m�sta?";
};

FUNC int  Info_OrcShaman_YOUHERE_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_YOUHERE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Co d�l� tak bl�zko m�sta?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak pozorovat bratry doma!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak v��it, �e KRUSHAK brzy procitnout!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak po�kat tady a bojovat s KRUSHAKEM, a� se probudit.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Sp�� se u� brzy probud�??? Douf�m, �e se m�l�!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Vzhledem k tomu, co jsem o tom arcid�monovi sly�el, rad�ji bych, aby spal!
}; 

//---------------------------------------------------------------------
//	Info SEAL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SEAL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SEAL_Condition;
	information	= Info_OrcShaman_SEAL_Info;
	important	= 0;
	permanent	= 0;
	description = "��kal jsi mi, �e tvoji brat�i uzav�eli chr�m!";
};

FUNC int  Info_OrcShaman_SEAL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SEAL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //P�i na�� posledn� sch�zce jsi mi ��kal, �e tvoji brat�i uzav�eli chr�m!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Ur-Shakovi brat�i uzav��t chr�m pod zem� velmi pe�liv�!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //P��tel nechodit dovnit�!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //P��tel pou��t kouzla od brat��, kte�� b�t synov� ducha, tak jako Ur-Shak!
}; 

//---------------------------------------------------------------------
//	Info SCROLL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SCROLL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SCROLL_Condition;
	information	= Info_OrcShaman_SCROLL_Info;
	important	= 0;
	permanent	= 0;
	description = "Kde najdu to kouzlo?";
};

FUNC int  Info_OrcShaman_SCROLL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SEAL)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SCROLL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Kde najdu to kouzlo?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Muset j�t do jeskyn� brat��, kde b�t synov� ducha, tak jako Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //P��tel ale muset d�vat pozor, kdy� pou��vat kouzlo!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Brat�i Ur-Shaka to nem�t r�di! ULU-MULU nepom�hat, kdy� p��tel pou��vat kouzlo!

	B_LogEntry		(CH4_EnterTemple,"P�ed sk�et�m m�stem jsem se znovu setkal se �amanem Ur-Shakem. �ekl mi, �e pouze sk�et�m kouzlem se mohu dostat do p�eds�l� podzemn�ho chr�mu. Ostatn� sk�et� �amani maj� ve sv�ch jeskyn�ch pr�v� takov� kouzla.");
}; 

//---------------------------------------------------------------------
//	Info IDOL
//---------------------------------------------------------------------
instance  Info_OrcShaman_IDOL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_IDOL_Condition;
	information	= Info_OrcShaman_IDOL_Info;
	important	= 0;
	permanent	= 0;
	description = "Vede do chr�mu je�t� n�jak� jin� cesta?";
};

FUNC int  Info_OrcShaman_IDOL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SCROLL)
	&&	!OrcCity_Sanctum_OuterGateOpen
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_IDOL_Info()
{
	//SN: fliegt raus, da der Hinweis jetzt sofort nach dem Hinweis mit der Scroll gegeben wird.
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle l�sst sich nicht �ffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //P��tel naj�t na sloupu figurku!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //P��tel te� moci otev��t br�nu do chr�mov�ho s�lu!

		B_LogEntry	(CH4_EnterTemple,"Do chr�mu v�ak vede i jin� cesta. Budu k tomu muset pou��t figurku Sp��e z posv�tn�ho sloupu sk�et�ch �aman�. Ta otev�e vrata chr�mu.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //P��tel te� muset vz�t ze sloupu figurku!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figurka te� otev��t vrata chr�mov�ho s�lu!

		B_LogEntry	(CH4_EnterTemple,"Do chr�mu vede dal�� cesta. V posv�tn�m sloupu sk�et�ch �aman� je figurka Sp��e, kter� otev�e vrata chr�mu. Ur-Shakovi brat�i se nepot��, a� uvid�, �e pou��v�m jejich svatou ikonu.");
	};
}; 

