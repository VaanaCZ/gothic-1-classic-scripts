// ************************ EXIT **************************

instance  VLK_585_Aleph_Exit (C_INFO)
{
	npc			=  VLK_585_Aleph;
	nr			=  999;
	condition	=  VLK_585_Aleph_Exit_Condition;
	information	=  VLK_585_Aleph_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_585_Aleph_Exit_Info()
{
	if	!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH)
	{
		AI_Output (other, self,"VLK_585_Aleph_Exit_Info_15_01"); //Hodnì štìstí!
		AI_Output (self, other,"VLK_585_Aleph_Exit_Info_05_02"); //Dobøe, víš kde mì najdeš.
	};
	
	AI_StopProcessInfos	( self );

};
// ***************** ALEPH IST EIN FAULPELZ *****************************
instance VLK_585_Aleph_CLEVER (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_CLEVER_Condition;
	information		= VLK_585_Aleph_CLEVER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void  VLK_585_Aleph_CLEVER_Info()
{
	AI_Output (self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //Hehehe, stráže mì nikdy nedostanou!
};
// ***************** ALEPH ERKLÄRT SEINE ARBEITSHALTUNG *****************************

instance  VLK_585_Aleph_GUARDS (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GUARDS_Condition;
	information		= VLK_585_Aleph_GUARDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak to myslíš?"; 
};

FUNC int  VLK_585_Aleph_GUARDS_Condition()
{	
	if Npc_KnowsInfo (hero,VLK_585_Aleph_CLEVER) 
	{
		return 1;
	};
};

FUNC void  VLK_585_Aleph_GUARDS_Info()
{
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_01"); //Jak to myslíš?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Pracuju jen tehdy, když jsou stráže blízko nebo když mì mùžou vidìt. Jinak se jenom procházím.
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_03"); //Nedostanou podezøení?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Jo, jistì, narubu míò rudy než ostatní. Není to nikdy dost, a tak musím dìlat trochu obchod.
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Jsem jedno ucho, takže se dozvídám užiteèné informace. Nemáš náhodou sebou nìjakou rudu? Øeknìme 10 nugetù?

	Npc_ExchangeRoutine (self,"BUSY");
	
	var C_Npc Brandick; 				
	Brandick = Hlp_GetNpc(GRD_261_Brandick);
	Npc_ExchangeRoutine (Brandick,"WATCH");
	AI_ContinueRoutine(Brandick);	// TEST!!!
};
// ***************** ALEPH BIETET INFO *****************************

instance VLK_585_Aleph_INFO (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_INFO_Condition;
	information		= VLK_585_Aleph_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "(dej 10 nugetù)";
};

FUNC int  VLK_585_Aleph_INFO_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  (Npc_KnowsInfo (hero, VLK_585_Aleph_GUARDS) ) 
	{
		return 1;
	};
};

func void  VLK_585_Aleph_INFO_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_INFO_Info_15_01"); //Dobøe, tady máš 10 nugetù.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Díky. Když pùjdeš do hlavní šachty a pùjdeš po lávkách poøád dolu, dostaneš se za chvíli do dvojité jeskynì.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_03"); //V té druhé je stráž a také tam stojí stará drtièka.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Povalují se tam hojivé lektvary, ale mìj se na pozoru pøed èervy!
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_05"); //A kdybys nìco potøeboval, nebo nìco slyšel, vra se zpátky ke mnì, urèitì ti budu schopen pomoci...
	
	B_GiveInvItems (hero, other, ItMiNugget,10);
};
// ***************** WIRD ALEPH ANGESCHWÄRZT IST ER SAUER*****************************
instance VLK_585_Aleph_ANGRY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_ANGRY_Condition;
	information		= VLK_585_Aleph_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};	

FUNC int  VLK_585_Aleph_ANGRY_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_ANGRY_Info()
{
	
	AI_Output (self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Tys mì podvedl s Brandickem? Ztra se!
	
	AI_StopProcessInfos	( self );
	Npc_SetTempAttitude (self,ATT_ANGRY);
};
//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_KEY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_KEY_Condition;
	information		= VLK_585_Aleph_KEY_Info;
	important		= 0;
	permanent		= 0;
	description     = "Máš ještì nìjaké užiteèné informace?";
};
FUNC int  VLK_585_Aleph_KEY_Condition()
{
	if ! ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) &&  ( Npc_KnowsInfo (hero, VLK_585_Aleph_INFO))
	{
		return 1;
	};
};

func void  VLK_585_Aleph_KEY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Máš ještì nìjaké užiteèné informace?
	AI_Output (self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Jistì, máš 10 nugetù?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GLEN_Condition;
	information		= VLK_585_Aleph_GLEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "(dej 10 nugetù)";
};
FUNC int  VLK_585_Aleph_GLEN_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  ( Npc_KnowsInfo (hero,VLK_585_Aleph_KEY) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_GLEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //Za tuhle rudu oèekávám dobré informace!
	AI_Output (self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //Je tu hromada zamèených truhel. Glen, vrchní kopáè, ti mùže dát pár paklíèù.
	
	B_GiveInvItems (hero, self, ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHLÜSSEL*****************************
func void B_Aleph_StorageShedKey()
{
	B_LogEntry		(CH2_StorageShed,"Aleph mi prodal klíè od truhlic ve skladu!");
};

instance VLK_585_Aleph_SCHUPPEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_SCHUPPEN_Condition;
	information		= VLK_585_Aleph_SCHUPPEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "Víš nìco o klíèi od tìch truhel ve skladové jeskyni?";
};
FUNC int  VLK_585_Aleph_SCHUPPEN_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( !Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_SCHUPPEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Víš nìco o klíèi od tìch truhel ve skladové jeskyni?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Jistì, to záleží na...
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //Tak kolik nugetù ti mám dát?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Uèíš se rychle.
	
	Info_ClearChoices ( VLK_585_Aleph_SCHUPPEN );
	
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,DIALOG_BACK 	   ,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zapla 50 nugetù.",VLK_585_Aleph_SCHUPPEN_50 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zapla 30 nugetù.",VLK_585_Aleph_SCHUPPEN_30 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zapla 15 nugetù.",VLK_585_Aleph_SCHUPPEN_15 );
};


func void VLK_585_Aleph_SCHUPPEN_50 ()
{
	
	if (Npc_HasItems (hero, ItMiNugget) >= 50)
	{ 
		AI_Output			(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 nugetù by ti mìlo víc než staèit!
		AI_Output			(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Jak šlechetné! Tady je klíè. A ten prsten si vezmi taky. Mnì vždycky pøináší štìstí.

		CreateInvItems		(self, ItKe_OM_03,	1);			// nur für die korrekte Textausgaben!!!
		B_GiveInvItems      (self, hero, ItKe_OM_03, 2);
		Npc_RemoveInvItem	(hero, ItKe_OM_03);

		Npc_RemoveInvItem	(self, Staerkering);
		CreateInvItem		(hero, Staerkering);

		B_GiveInvItems	    (hero, self, ItMinugget,50);  

		Npc_SetPermAttitude (self, ATT_FRIENDLY ); 
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN);
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //Tolik rudy nemáš!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_30 ()
{
	
	
	if (Npc_HasItems (hero, ItMiNugget) >= 30)
	{ 
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		B_GiveInvItems	(hero, self, ItMinugget,30);  
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN );
		AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 nugetù by mìlo staèit.
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //Dobøe, náhodou mám ten klíè sebou.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //Tolik rudy nemáš!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
};	
func void VLK_585_Aleph_SCHUPPEN_15 ()
{
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //Bude ti 15 nugetù staèit?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 nugetù? Já o žádném klíèi nic nevím!
	VLK_585_Aleph_SCHUPPEN.permanent = 0;
};	
func void VLK_585_Aleph_SCHUPPEN_Back ()
{
	Info_ClearChoices	(  VLK_585_Aleph_SCHUPPEN );
	VLK_585_Aleph_SCHUPPEN.permanent = 1;
};

// WENN DER SPIELER ALEPH BEI BRANDICK ANGESCHWÄRZT HAT
instance  VLK_585_Aleph_DIRTY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_DIRTY_Condition;
	information		= VLK_585_Aleph_DIRTY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Víš nìco o klíèi od tìch truhel ve skladové jeskyni?"; 
};

FUNC int  VLK_585_Aleph_DIRTY_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};


FUNC void  VLK_585_Aleph_DIRTY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Víš nìco o klíèi od tìch truhel ve skladové jeskyni?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Jistì, to záleží na...
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //Tak kolik nugetù ti mám dát?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Uèíš se rychle. Chci 100 nugetù.
	
	Info_ClearChoices ( VLK_585_Aleph_DIRTY );
	
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(zapla 100 nugetù)",VLK_585_Aleph_DIRTY_100 );
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(nepla)",VLK_585_Aleph_DIRTY_NO );
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems (hero,ItMinugget)>=100
	{ 
		AI_Output (other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Dobrá, ty podvodníku. Tady je 100 nugetù.
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Nemìl bys mì dráždit. Tady je ten klíè.
		B_GiveInvItems	(hero, self, ItMinugget,100);
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		Info_ClearChoices	( VLK_585_Aleph_DIRTY );
		VLK_585_Aleph_DIRTY.permanent = 0;	
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Myslíš, že jsem tak stupidní nebo co? 100 nugetù a ani o jeden míò!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Nemùžu vyhodit 100 nugetù!
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //Hej, jsi to ty, kdo mì v jednom kuse pøemlouvá!
	VLK_585_Aleph_DIRTY.permanent = 0;	
};
