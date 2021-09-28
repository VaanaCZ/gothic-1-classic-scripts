// **************************************************
//						 EXIT 
// **************************************************

instance  Stt_311_Fisk_Exit (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 999;
	condition	= Stt_311_Fisk_Exit_Condition;
	information	= Stt_311_Fisk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					First
// **************************************************

instance  Stt_311_Fisk_First (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 1;
	condition	= Stt_311_Fisk_First_Condition;
	information	= Stt_311_Fisk_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_First_Condition()
{
		return 1;
};

FUNC VOID  Stt_311_Fisk_First_Info()
{
	AI_Output		(self, other,"Stt_311_Fisk_First_12_00"); //Hej, èlovìèe. Já jsem Fisk. Obchoduju se zbožím všeho druhu. Jestli budeš kdykoliv a cokoliv potøebovat - tady jsi na správném místì.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Fisk, jeden ze Stínù, obchoduje se vším zbožím, zejména však se ZBRANÌMI. Bývá obvykle na tržišti."); 
	
};

// **************************************************
//					Handeln
// **************************************************

instance  Stt_311_Fisk_Trade (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_Trade_Condition;
	information	= Stt_311_Fisk_Trade_Info;
	permanent	= 1;
	description = "Ukaž mi svoje zboží.";
	trade		= 1;
};                       

FUNC int  Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Trade_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_Trade_15_00"); //Ukaž mi svoje zboží.
};



instance  Stt_311_Fisk_WhistlersSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 801;
	condition	= Stt_311_Fisk_WhistlersSword_Condition;
	information	= Stt_311_Fisk_WhistlersSword_Info;
	permanent	= 1;
	description = "Chtìl bych koupit meè. Ne ale nìjaký obyèejný. Chtìl bych nìjaký se zdobením.";
};                       

FUNC int  Stt_311_Fisk_WhistlersSword_Condition()
{
	if ( (Fisk_ForgetSword==FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE)  )
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_15_00"); //Chtìl bych koupit meè. Ne ale nìjaký obyèejný. Chtìl bych nìjaký se zdobením.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_01"); //Mám jeden takový. Stín, který ho chtìl koupit, už ke mnì nikdy znovu nepøišel.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_02"); //Bude to 110 nugetù, bereš?
	Fisk_SCknows110 = TRUE;

	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Možná pozdìji.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Whistlerovi jsi ho chtìl prodat za sto...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Ano, vezmu si ho.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output (other, self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Možná pozdìji.
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //Whistlerovi jsi ho chtìl prodat za sto...
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //Ach! Poèkej... pravda, málem jsem ti øekl moc málo! Myslel jsem samozøejmì 500.
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //Pìt set?
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //Pøíliš málo? Radìji bys za 1000? Tím líp pro mì. Dobøe, popøemýšlím o tom - radìji si ho nechám!
	
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Ano, vezmu si ho.
	
	if (Npc_HasItems(other,itminugget) >= 110)
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //Udìlal jsi dobrý obchod!
		B_GiveInvItems(other, self,itminugget,110);
		CreateInvItem (self,Whistlers_Schwert);
		B_GiveInvItems(self, other,Whistlers_Schwert,1);
		Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
		
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //Mám obavy, že nemáš dost rudy. Budu ti ten meè ještì nìjaký èas držet, ale nebudu èekat moc dlouho!
	};
};

// **************************************************
//					Forget Sword
// **************************************************

instance  Stt_311_Fisk_ForgetSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_ForgetSword_Condition;
	information	= Stt_311_Fisk_ForgetSword_Info;
	permanent	= 1;
	description = "O Whistlerovì meèi...";
};                       

FUNC int  Stt_311_Fisk_ForgetSword_Condition()
{
	if (Fisk_ForgetSword==TRUE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ForgetSword_15_00"); //Pojïme si ještì promluvit o tom Whistlerovì meèi.
	AI_Output (self, other,"Stt_311_Fisk_ForgetSword_12_01"); //Mùžeš mu øíci, že svùj meè nikdy nedostane.
};

// **************************************************
//					MordragKO
// **************************************************
	var int Fisk_GetNewHehler;
// **************************************************

instance  Stt_311_Fisk_MordragKO (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_MordragKO_Condition;
	information	= Stt_311_Fisk_MordragKO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_MordragKO_Condition()
{
	if (MordragKO_HauAb == TRUE)  
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_MordragKO_Info()
{
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_00"); //Hej, ty!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_01"); //Mordrag byl jeden z mých nejdùležitìjších dodavatelù, ty idiote!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_02"); //Jestli se chceš pøidat k našemu táboru, bude pro tebe velmi obtížné získat MÙJ hlas!

	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Obchoduješ s majetkem Rudobaronù! To bude Thoruse zajímat...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Klid! Možná to mùžu nìjak napravit, ne?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice	 (Stt_311_Fisk_MordragKO,"Pak mi polib zadek!",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //Klid! Možná to mùžu nìjak napravit, ne?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //Nevím ale, jak bys to chtìl udìlat. Ledaže bys mi našel nového pøechovávaèe vìcí z Nového tábora!
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //Jak si myslíš, že bych nìkoho takového našel?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //Jak jsem øekl, nevìøím, že bys to mìl u mì nìkdy dobrý.
	
	Log_CreateTopic(CH1_FiskNewDealer, LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_RUNNING);
	B_LogEntry( CH1_FiskNewDealer,"Poté, co jsem vyhnal Mordraga, chce po mì obchodník Fisk z tržištì, abych mu našel nového pøechovávaèe.");
	
	Fisk_GetNewHehler = LOG_RUNNING;
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //Pak mi polib zadek!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	
	AI_StopProcessInfos	(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //Obchoduješ s vìcmi, které patøí Rudobaronùm. Thoruse to bude zajímat.
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //Tak takhle ne, mladíku!
};

// **************************************************
//					New Hehler
// **************************************************

instance  Stt_311_Fisk_HehlerSuccess (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 10;
	condition	= Stt_311_Fisk_HehlerSuccess_Condition;
	information	= Stt_311_Fisk_HehlerSuccess_Info;
	permanent	= 0;
	description	= "Mám nìkoho z Nového tábora, kdo by chtìl s tebou obchodovat.";
};                       

FUNC int  Stt_311_Fisk_HehlerSuccess_Condition()
{
	if ( (Fisk_GetNewHehler==LOG_RUNNING) && (Npc_KnowsInfo(hero,Org_843_Sharky_Fisk)))  
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_00"); //Mám nìkoho z Nového tábora, kdo by chtìl s tebou obchodovat.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_01"); //Ne! Kdo by si to byl pomyslel. Vypadá to, že se tu pokoušíš být oblíbený...
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_02"); //Vypadá, že se ti to taky povedlo! Kdo to je?
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_03"); //Jmenuje se Sharky.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_04"); //Sharky? Je ještì horší než Mordrag.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_05"); //Co se týèe Diega... nemusíš už mít obavy.
	
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);

	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_SUCCESS);
	B_LogEntry( CH1_FiskNewDealer,"Fisk je spokojený, protože Sharky pøevzal Mordragovu práci.");
};
/*------------------------------------------------------------------------
							RÜSTUNG									
------------------------------------------------------------------------*/

instance  Stt_311_Fisk_ARMOR (C_INFO)
{
	npc				= Stt_311_Fisk;
	condition		= Stt_311_Fisk_ARMOR_Condition;
	information		= Stt_311_Fisk_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Máš pro mì nìjakou zbroj?"; 
};

FUNC int  Stt_311_Fisk_ARMOR_Condition()
{	
	if (Kapitel < 2)
	&& (Npc_KnowsInfo (hero, Stt_311_Fisk_First))
	{
		return TRUE;
	};

};
FUNC void  Stt_311_Fisk_ARMOR_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_Info_15_01"); //Máš pro mì také zbroj?
	AI_Output (self, other,"Stt_311_Fisk_ARMOR_Info_12_02"); //Ano, urèitì budeš spokojený.
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
	Info_Addchoice (Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);

};  

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Dej mi lehké kopáèské kalhoty.
	
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_L)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //Vra se, až budeš mít dost rudy!
	}
	else
	{
		AI_Output		(self,	other,	"Stt_311_Fisk_ARMOR_L_Info_12_03"); //Dobrá volba!
		B_GiveInvItems	(hero,	self,	ItMinugget, VALUE_VLK_ARMOR_L);
		CreateInvItem	(self,			VLK_ARMOR_L);
		B_GiveInvItems	(self,	hero,	VLK_ARMOR_L, 1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Dej mi kopáèské kalhoty.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_M)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //Vra se, až budeš mít dost rudy!
	}
	else
	{
		AI_Output		(self, other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //Dobrá volba!
		B_GiveInvItems	(hero, self, ItMinugget, VALUE_VLK_ARMOR_M);
		CreateInvItem	(self, VLK_ARMOR_M);
		B_GiveInvItems	(self,hero, VLK_ARMOR_M, 1);
	};
};







