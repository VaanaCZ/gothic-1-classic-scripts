
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Jenom se tu rozhlížím.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Nedělej problémy.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jsi Ian, šéf toho dolu?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Ty jsi Ian, šéf toho dolu?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Ano, jsem Ian. A tohle je můj důl. Ničeho se nedotýkej a nic nerozbij.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Není to Gomezův důl?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Není to Gomezův důl?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Ano, jistě, že je to důl Starého tábora. Ale je tady jediný šéf - a to jsem já.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Můžeš mi říci něco o zdejší produkci rudy?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Můžeš mi říci něco o zdejší produkci rudy?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Těžíme ve dne v noci. To znamená 200 pytlů měsíčně do skladu a dalších 20 pytlů na přetavení.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Z rudy, kterou dodáváme králi, se můžou ukovat stovky ostří.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Slyšel jsem, že ta ruda má kouzelnou moc. Řekni mi o tom něco."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //Slyšel jsem, že ta ruda má kouzelnou moc. Řekni mi o tom něco.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Ta magická moc dodává kovu speciální vlastnosti. Zbraně, které jsou z něj ukovány, se nelámou, jejich ostří jsou ostřejší než obyčejně.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Armáda vybavená takovými zbraněmi má rozhodující převahu v boji.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Řekni mi víc o té rudě."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Řekni mi víc o té rudě.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Naneštěstí během procesu tavení magické kouzlo rudy vyprchává. V horkovzdušných tavicích pecích u Severního moře znají správnou techniku tavení.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Ale zbraně vyrobené z téhle rudy jsou i bez magického kouzla výjimečně trvanlivé a mají daleko větší účinek než zbraně obyčejné.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Řekni mi něco o dole."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Povídej mi o dolu.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Jestli se chceš tady porozhlédnout, musíš být opatrný. V jeskyních jsou důlní červi. Měl bys raději zůstat v hlavní šachtě.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //A nechat templáře na pokoji. Sice se většinu času jen tak procházejí, ale když přijdou červi, jsou to nejlepší bojovníci, jaké vůbec můžeme na naší straně mít.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Budu si to pamatovat.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Musím něco dělat. A neruš moje chlapy při práci.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Jen se tu rozhlížím.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mám tady opatřit seznam věcí pro tábor."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Mám tady opatřit seznam věcí pro tábor.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //To by mohl říci každý. Ztrať se.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Poslal mě Diego. Mám tady opatřit seznam."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Poslal mě Diego. Mám tady opatřit seznam.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //Dobře, tady je seznam. Řekni jim, aby si s dodávkou pospíšili.
	B_LogEntry  (CH1_BringList,"Ian mi bez problémů vydal seznam.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Musí tu někde být hnízdo důlních červů.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Musí tu někde být hnízdo důlních červů.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Jsou tu zřejmě tucty jejich hnízd.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Poslyš, potřebuju se teď dostat do jejich hnízda...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Nemám čas se teď o to starat. Drtička přestala pracovat. Před několika hodinami se rozbilo ozubené kolo.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Nemám potuchy, kde vzít nové.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Postarej se mi o to ozubené kolo a já se pak postarám o tvůj problém.

	B_LogEntry		(CH2_MCEggs,"Ian, velitel dolu, mi nepomůže hledat hnízdo. Měl bych mu obstarat nové ozubené kolo pro jeho rozbitou drtičku rudy. Zmínil se o opuštěné postranní štole, kde bych mohl najít starou drtičku.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ozubené kolo? Kde si myslíš, že ho vezmu?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ozubené kolo? Kde si myslíš, že ho vezmu?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Nemám představu. Jsem stejně bezradný jako ty!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //V postranní šachtě je ale stará porouchaná drtička. Možná by se dalo vzít tam.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mám to ozubené kolo.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Mám to ozubené kolo.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hej, dobrá práce. Myslím, že funguje. No a teď ty, hledáš hnízdo důlního červa... hmmm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Běž za Asghanem a řekni mu, aby ti otevřel vrata, aby ses dostal do temných šachet.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Řekni mu jenom 'Všechno jde dobře'. Tím bude srozuměný s tím, že jsem ti dal povolení.

	B_LogEntry		(CH2_MCEggs,"Přinesl jsem Ianovi ozubené kolo z vyřazené drtičky rudy. Ian prohlásil, že mám Asghanovi říci VŠECHNO BUDE V POŘÁDKU. Potom mi otevře vrata do temných šachet.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Pořád hledám červí hnízdo.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Pořád hledám červí hnízdo.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Už jsem ti řekl, abys šel za Asghanem. Je to velitel stráží. Najdeš ho někde na nejnižší úrovni.

	B_LogEntry		(CH2_MCEggs,"Pokud chci najít hnízdo důlních červů, musím si nejdříve promluvit s Asghanem.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Našel jsem hnízdo!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Našel jsem hnízdo!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //Tak už tady budeme konečně mít mír a klid, hahaha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Bez urážky. Dobrá práce, hochu!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Tady si vezmi basu piv za svoji snahu.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Našel jsem hnízdo! A vajíčka královny důlních červů!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Našel jsem hnízdo! A vajíčka královny důlních červů!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Cože? Tohle jsou všechna vajíčka, co jsi našel? Nu, co. Ukázal jsi, že umíš bojovat.
};
