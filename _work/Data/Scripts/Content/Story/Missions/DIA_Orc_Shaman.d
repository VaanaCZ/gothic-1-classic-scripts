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
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Dlužit díky, cizinèe.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Zlí skøeti mì chtìjí zabít.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Staøí bratøi být dneska nepøátelé.
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
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Být synem ducha. Lidé tomu øíkat šaman.
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
	description = "Kde ses nauèil náš jazyk?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Jak ses nauèil náš jazyk?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak být otrok lidí v dole.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Utéct pryè. To být už pøed mnoha zimami.
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
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Dùl být pod vesnicí v Kotlinì.
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
	description = "Proè jsou tvoji bratøi proti tobì?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Proè jsou tvoji bratøi proti tobì?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak být v nepøízni.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Ztratit velkou úctu v KRUSHAKA.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Vìøit mi, KRUSHAK být zlý démon..
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
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Lidé tomu øíkat SPÁT.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Myslíš 'Spáè'?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Ano, lidé tomu øíkat SPÁÈ!
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
	description = "Co víš o Spáèovi?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Co víš o Spáèovi?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Být pìt bratøí. To být pøed mnoha zimami!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Být synové ducha, tak jako Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Myslíš pìt šamanù!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Vyrušovat KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Chtít porazit klan nepøátel!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Pìt bratøí potom postavit pro KRUSHAKA chrám pod zemí!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Podzemní chrám pro Spáèe! Ten, co mìl na mysli Xardas, když mluvil o vstupu v 'skøetím mìstì'!
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
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Bratøi potom dát srdce KRUSHAKOVI.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Ale KRUSHAK být zlý. KRUSHAK proklít všechny, co postavit chrám.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Bratøi nemít srdce, ale být mrtví a žít. Být obojí.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK mít teï srdce bratøí. Srdce teï být KRUSHAKOVA síla.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Co se stalo s dìlníky, kteøí vystavìli ten chrám?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK proklít všechny. I dìlníky. Být všichni mrtví i žít. Obojí najednou.
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
	description = "A skøeti na povrchu s tím nic neudìlali?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //A skøeti na povrchu s tím nic neudìlali?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Uzavøít chrám. Bratøi dnes uctívat KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK být vysvìcený, ne se stát zlý.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak si myslet, že vysvìcení být špatná vìc. Muset øíct, že KRUSHAK být zlý.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Bratøi o tom nechtít slyšet. Bratøi øíkat Ur-Shak odejít. Bratøi vyhnat Ur-Shaka.
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
	description = "Potøebuju se dostat do toho podzemního chrámu. Mùžeš mì tam dovést?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Potøebuju se dostat do toho podzemního chrámu. Mùžeš mì tam dovést?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak øíct cizinci díky. Cizinec zachránit Ur-Shaka.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ale vstup do chrámu být doma. Ur-Shak nesmìt jít domù.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Vím, myslíš tím, že by tì nepustili zpátky do skøetího mìsta.
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
	description = "Mùžeš mi ukázat na mapì, kde to skøetí mìsto leží?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Mùžeš mi ukázat na mapì, kde to skøetí mìsto leží?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Domov Ur-Shaka být tam, kde mapa prázdná.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Cizinec dát mapu, Ur-Shak ji dokonèit!
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
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Bratøi doma být velmi silní! Bratrù být hóóódnì moc!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Cizinec tam nechodit. Mnoho bojovníkù! Cizinec zemøít!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Další synové ducha být doma. Když cizinec udìlat oheò, potom cizinec zemøít!
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
	description = "Dobøe, dobøe, budu ale muset nìjak najít cestu do chrámu!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Dobøe, dobøe, budu ale muset nìjak najít cestu do chrámu!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak znát cestu! Cizinec mít ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU??? Co je to Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //To být znamení pøátelství! Bratøi si vážit ULU-MULU!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Když cizinec mít ULU-MULU, pak cizinec nezemøít!
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
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Cizinec jít k pøíteli Ur-Shaka!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Pøítel Ur-Shaka dá ULU-MULU! Cizinec nosit ULU-MULU a pak nezemøít!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Dobøe, dobøe, tomu 'nezemøít' rozumím, ale kde najdu tvého pøítele?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Pøítel Ur-Shaka být v dole lidí. Pøítel neutéct s Ur-Shakem. Pøítel pak být nemocný.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byl jsi zavøený ve Svobodném dole?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byls vìznìm v tom opuštìném dole?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Drželi tì zavøeného v Starém dole?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Byls vìznìm v tom opuštìném dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak neznat to slovo.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Drželi tì zavøeného v Starém dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nerozumìt!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Byl jsi zavøený ve Svobodném dole?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak být vìzeò v dole pod vesnicí v Kotlinì.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak myslet, že tomu lidi tak øíkat!

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
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Dìkuju ti za pomoc!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak øíkat dìkuju cizinci. Cizinec zachránit Ur-Shaka. Cizinec teï být pøítel Ur-Shaka!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Dát pøíteli dar. Ur-Shak dát talisman! Talisman ochránit pøed dechem ohnivé ještìrky!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nesmìt jít domu. Ur-Shak teï žít tady! Pøítel pøijít, když potøebovat pomoc!
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
	description = "Jak se máš, mùj pøíteli?";
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
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Jak se máš, mùj pøíteli?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak být zdravý!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak teï hledat svoje vlastní ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Možná Ur-Shak pøijít domu s vlastním ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Pøítel pøijít, když potøebovat pomoc!
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

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak zdravit pøítele!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //Pøítel mít ULU-MULU! To být dobøe!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Pøítel nezapomenout držet ULU-MULU v ruce, až pøecházet most!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //Pøítel nemít ULU-MULU! To nebýt dobøe!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Pøítel nepøecházet most, jinak zemøít!
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
	description = "Co dìláš tak blízko mìsta?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Co dìláš tak blízko mìsta?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak pozorovat bratry doma!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak vìøit, že KRUSHAK brzy procitnout!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak poèkat tady a bojovat s KRUSHAKEM, až se probudit.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Spáè se už brzy probudí??? Doufám, že se mýlíš!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Vzhledem k tomu, co jsem o tom arcidémonovi slyšel, radìji bych, aby spal!
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
	description = "Øíkal jsi mi, že tvoji bratøi uzavøeli chrám!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Pøi naší poslední schùzce jsi mi øíkal, že tvoji bratøi uzavøeli chrám!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Ur-Shakovi bratøi uzavøít chrám pod zemí velmi peèlivì!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Pøítel nechodit dovnitø!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Pøítel použít kouzla od bratøí, kteøí být synové ducha, tak jako Ur-Shak!
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
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Muset jít do jeskynì bratøí, kde být synové ducha, tak jako Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Pøítel ale muset dávat pozor, když používat kouzlo!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Bratøi Ur-Shaka to nemít rádi! ULU-MULU nepomáhat, když pøítel používat kouzlo!

	B_LogEntry		(CH4_EnterTemple,"Pøed skøetím mìstem jsem se znovu setkal se šamanem Ur-Shakem. Øekl mi, že pouze skøetím kouzlem se mohu dostat do pøedsálí podzemního chrámu. Ostatní skøetí šamani mají ve svých jeskyních právì taková kouzla.");
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
	description = "Vede do chrámu ještì nìjaká jiná cesta?";
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
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Pøítel najít na sloupu figurku!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Pøítel teï moci otevøít bránu do chrámového sálu!

		B_LogEntry	(CH4_EnterTemple,"Do chrámu však vede i jiná cesta. Budu k tomu muset použít figurku Spáèe z posvátného sloupu skøetích šamanù. Ta otevøe vrata chrámu.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Pøítel teï muset vzít ze sloupu figurku!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figurka teï otevøít vrata chrámového sálu!

		B_LogEntry	(CH4_EnterTemple,"Do chrámu vede další cesta. V posvátném sloupu skøetích šamanù je figurka Spáèe, která otevøe vrata chrámu. Ur-Shakovi bratøi se nepotìší, až uvidí, že používám jejich svatou ikonu.");
	};
}; 

