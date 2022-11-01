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
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Dlužit díky, cizinče.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Zlí skřeti mě chtějí zabít.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Staří bratři být dneska nepřátelé.
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
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Já se jmenovat Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Být synem ducha. Lidé tomu říkat šaman.
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
	description = "Kde ses naučil náš jazyk?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Jak ses naučil náš jazyk?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak být otrok lidí v dole.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Utéct pryč. To být už před mnoha zimami.
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
	description = "Tys byl otrok v dole? Ve kterém dole?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Tys byl otrok v dole? Ve kterém dole?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Důl být pod vesnicí v Kotlině.
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
	description = "Proč jsou tvoji bratři proti tobě?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Proč jsou tvoji bratři proti tobě?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak být v nepřízni.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Ztratit velkou úctu v KRUSHAKA.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Věřit mi, KRUSHAK být zlý démon..
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
	description = "Co znamená KRUSHAK?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //Co to znamená KRUSHAK?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Lidé tomu říkat SPÁT.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Myslíš 'Spáč'?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Ano, lidé tomu říkat SPÁČ!
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
	description = "Co víš o Spáčovi?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Co víš o Spáčovi?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Být pět bratří. To být před mnoha zimami!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Být synové ducha, tak jako Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Myslíš pět šamanů!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Vyrušovat KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Chtít porazit klan nepřátel!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Pět bratří potom postavit pro KRUSHAKA chrám pod zemí!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Podzemní chrám pro Spáče! Ten, co měl na mysli Xardas, když mluvil o vstupu v 'skřetím městě'!
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
	description = "Co se stalo v tom podzemním chrámu?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Co se stalo v tom podzemním chrámu?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Bratři potom dát srdce KRUSHAKOVI.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Ale KRUSHAK být zlý. KRUSHAK proklít všechny, co postavit chrám.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Bratři nemít srdce, ale být mrtví a žít. Být obojí.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK mít teď srdce bratří. Srdce teď být KRUSHAKOVA síla.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Co se stalo s dělníky, kteří vystavěli ten chrám?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK proklít všechny. I dělníky. Být všichni mrtví i žít. Obojí najednou.
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
	description = "A skřeti na povrchu s tím nic neudělali?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //A skřeti na povrchu s tím nic neudělali?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Uzavřít chrám. Bratři dnes uctívat KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK být vysvěcený, ne se stát zlý.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak si myslet, že vysvěcení být špatná věc. Muset říct, že KRUSHAK být zlý.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Bratři o tom nechtít slyšet. Bratři říkat Ur-Shak odejít. Bratři vyhnat Ur-Shaka.
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
	description = "Potřebuju se dostat do toho podzemního chrámu. Můžeš mě tam dovést?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Potřebuju se dostat do toho podzemního chrámu. Můžeš mě tam dovést?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak říct cizinci díky. Cizinec zachránit Ur-Shaka.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ale vstup do chrámu být doma. Ur-Shak nesmět jít domů.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Vím, myslíš tím, že by tě nepustili zpátky do skřetího města.
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
	description = "Můžeš mi ukázat na mapě, kde to skřetí město leží?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Můžeš mi ukázat na mapě, kde to skřetí město leží?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Domov Ur-Shaka být tam, kde mapa prázdná.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Cizinec dát mapu, Ur-Shak ji dokončit!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(škrábe do mapy)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Úžasné, jsi dobrý kartograf. Díky!

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
	description = "Dobrá, budu muset bojovat podle svého.";
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
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Dobrá, budu muset bojovat podle svého.
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Bratři doma být velmi silní! Bratrů být hóóódně moc!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Cizinec tam nechodit. Mnoho bojovníků! Cizinec zemřít!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Další synové ducha být doma. Když cizinec udělat oheň, potom cizinec zemřít!
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
	description = "Dobře, dobře, budu ale muset nějak najít cestu do chrámu!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Dobře, dobře, budu ale muset nějak najít cestu do chrámu!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak znát cestu! Cizinec mít ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU??? Co je to Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //To být znamení přátelství! Bratři si vážit ULU-MULU!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Když cizinec mít ULU-MULU, pak cizinec nezemřít!
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
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Cizinec jít k příteli Ur-Shaka!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Přítel Ur-Shaka dá ULU-MULU! Cizinec nosit ULU-MULU a pak nezemřít!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Dobře, dobře, tomu 'nezemřít' rozumím, ale kde najdu tvého přítele?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Přítel Ur-Shaka být v dole lidí. Přítel neutéct s Ur-Shakem. Přítel pak být nemocný.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byl jsi zavřený ve Svobodném dole?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byls vězněm v tom opuštěném dole?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Drželi tě zavřeného v Starém dole?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Byls vězněm v tom opuštěném dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak neznat to slovo.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Drželi tě zavřeného v Starém dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nerozumět!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Byl jsi zavřený ve Svobodném dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak být vězeň v dole pod vesnicí v Kotlině.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak myslet, že tomu lidi tak říkat!

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
	description = "Díky za tvou pomoc!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Děkuju ti za pomoc!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak říkat děkuju cizinci. Cizinec zachránit Ur-Shaka. Cizinec teď být přítel Ur-Shaka!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Dát příteli dar. Ur-Shak dát talisman! Talisman ochránit před dechem ohnivé ještěrky!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nesmět jít domu. Ur-Shak teď žít tady! Přítel přijít, když potřebovat pomoc!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Snad tvojí nabídku budu moci využít!

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
	description = "Jak se máš, můj příteli?";
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
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Jak se máš, můj příteli?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak být zdravý!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak teď hledat svoje vlastní ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Možná Ur-Shak přijít domu s vlastním ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Přítel přijít, když potřebovat pomoc!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Být opatrný!
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

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak zdravit přítele!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //Přítel mít ULU-MULU! To být dobře!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Přítel nezapomenout držet ULU-MULU v ruce, až přecházet most!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //Přítel nemít ULU-MULU! To nebýt dobře!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Přítel nepřecházet most, jinak zemřít!
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
	description = "Co děláš tak blízko města?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Co děláš tak blízko města?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak pozorovat bratry doma!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak věřit, že KRUSHAK brzy procitnout!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak počkat tady a bojovat s KRUSHAKEM, až se probudit.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Spáč se už brzy probudí??? Doufám, že se mýlíš!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Vzhledem k tomu, co jsem o tom arcidémonovi slyšel, raději bych, aby spal!
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
	description = "Říkal jsi mi, že tvoji bratři uzavřeli chrám!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Při naší poslední schůzce jsi mi říkal, že tvoji bratři uzavřeli chrám!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Ur-Shakovi bratři uzavřít chrám pod zemí velmi pečlivě!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Přítel nechodit dovnitř!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Přítel použít kouzla od bratří, kteří být synové ducha, tak jako Ur-Shak!
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
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Muset jít do jeskyně bratří, kde být synové ducha, tak jako Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Přítel ale muset dávat pozor, když používat kouzlo!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Bratři Ur-Shaka to nemít rádi! ULU-MULU nepomáhat, když přítel používat kouzlo!

	B_LogEntry		(CH4_EnterTemple,"Před skřetím městem jsem se znovu setkal se šamanem Ur-Shakem. Řekl mi, že pouze skřetím kouzlem se mohu dostat do předsálí podzemního chrámu. Ostatní skřetí šamani mají ve svých jeskyních právě taková kouzla.");
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
	description = "Vede do chrámu ještě nějaká jiná cesta?";
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
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle lässt sich nicht öffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Přítel najít na sloupu figurku!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Přítel teď moci otevřít bránu do chrámového sálu!

		B_LogEntry	(CH4_EnterTemple,"Do chrámu však vede i jiná cesta. Budu k tomu muset použít figurku Spáče z posvátného sloupu skřetích šamanů. Ta otevře vrata chrámu.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Přítel teď muset vzít ze sloupu figurku!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figurka teď otevřít vrata chrámového sálu!

		B_LogEntry	(CH4_EnterTemple,"Do chrámu vede další cesta. V posvátném sloupu skřetích šamanů je figurka Spáče, která otevře vrata chrámu. Ur-Shakovi bratři se nepotěší, až uvidí, že používám jejich svatou ikonu.");
	};
}; 

