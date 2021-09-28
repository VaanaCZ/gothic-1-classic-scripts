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
		AI_Output (other, self,"VLK_585_Aleph_Exit_Info_15_01"); //Powodzenia!
		AI_Output (self, other,"VLK_585_Aleph_Exit_Info_05_02"); //Có¿, wiesz, gdzie mnie znaleŸæ.
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
	AI_Output (self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //He he he, stra¿nicy nigdy mnie nie z³api¹!
};
// ***************** ALEPH ERKLÄRT SEINE ARBEITSHALTUNG *****************************

instance  VLK_585_Aleph_GUARDS (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GUARDS_Condition;
	information		= VLK_585_Aleph_GUARDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co masz na myœli?"; 
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
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_01"); //Co masz na myœli?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Pracujê tylko wtedy, gdy w pobli¿u jest jakiœ Stra¿nik, który mo¿e mnie zobaczyæ. Poza tym tylko sobie odpoczywam.
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_03"); //I nie robi¹ siê podejrzliwi?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Oczywiœcie, ¿e tak! Wydobywam mniej rudy ni¿ inny Kopacze, wiêc muszê nadrabiaæ braki drobnym handlem wymiennym.
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Mam oczy szeroko otwarte, wiêc dowiedzia³em siê kilku ciekawych rzeczy. Masz mo¿e przy sobie trochê rudy? Jakieœ 10 bry³ek?

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
	description		= "(daj 10 bry³ek rudy)";
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
	AI_Output (other,self,"VLK_585_Aleph_INFO_Info_15_01"); //Jasne, oto 10 bry³ek.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Dziêki. IdŸ do g³ównego szybu i zejdŸ na dó³ po rusztowaniu. Powinieneœ trafiæ na dwie boczne jaskinie.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_03"); //W drugiej z nich jest stra¿nik i stara m³ocarnia.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Gdzieœ niedaleko znajdziesz napój uzdrawiaj¹cy, tylko uwa¿aj na pe³zacze!
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_05"); //Gdybyœ potrzebowa³ najœwie¿szych informacji zg³oœ siê do mnie. Na pewno bêdê móg³ ci pomóc.
	
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
	
	AI_Output (self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Donios³eœ na mnie Brandickowi? Spadaj st¹d!
	
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
	description     = "Masz dla mnie jeszcze jakieœ po¿yteczne informacje?";
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
	AI_Output (other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Masz dla mnie jeszcze jakieœ po¿yteczne informacje?
	AI_Output (self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Jasne, a masz 10 bry³ek rudy?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GLEN_Condition;
	information		= VLK_585_Aleph_GLEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "(daj 10 bry³ek rudy)";
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
	
	AI_Output (other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //Za tak¹ cenê oczekujê czegoœ naprawdê dobrego!
	AI_Output (self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //W kopalni mo¿na znaleŸæ mnóstwo zamkniêtych skrzyñ. Glen, jeden z Kopaczy na górze, mo¿e ci dostarczyæ parê wytrychów.
	
	B_GiveInvItems (hero, self, ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHLÜSSEL*****************************
func void B_Aleph_StorageShedKey()
{
	B_LogEntry		(CH2_StorageShed,"Aleph sprzeda³ mi klucz do skrzyñ ze sk³adowiska!");
};

instance VLK_585_Aleph_SCHUPPEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_SCHUPPEN_Condition;
	information		= VLK_585_Aleph_SCHUPPEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?";
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
	
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Có¿... To zale¿y...
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //Od iloœci bry³ek rudy, które jestem gotów zap³aciæ?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Szybko siê uczysz.
	
	Info_ClearChoices ( VLK_585_Aleph_SCHUPPEN );
	
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,DIALOG_BACK 	   ,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap³aæ 50 bry³ek rudy.",VLK_585_Aleph_SCHUPPEN_50 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap³aæ 30 bry³ek rudy.",VLK_585_Aleph_SCHUPPEN_30 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Zap³aæ 15 bry³ek rudy.",VLK_585_Aleph_SCHUPPEN_15 );
};


func void VLK_585_Aleph_SCHUPPEN_50 ()
{
	
	if (Npc_HasItems (hero, ItMiNugget) >= 50)
	{ 
		AI_Output			(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 bry³ek to chyba uczciwa cena!
		AI_Output			(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Jesteœ bardzo hojny! Oto klucz. WeŸ te¿ ten pierœcieñ. Zawsze przynosi³ mi szczêœcie.

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
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //Nie masz tyle przy sobie!
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
		AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 bry³ek powinno wystarczyæ.
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //W porz¹dku. Tak siê sk³ada, ¿e mam ten klucz przy sobie.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //Nie masz tyle przy sobie!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
};	
func void VLK_585_Aleph_SCHUPPEN_15 ()
{
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //15 bry³ek wystarczy?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 bry³ek? Za 15 bry³ek nie mam pojêcia o jakim kluczu mówisz!
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
	description		= "Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?"; 
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
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Wiesz mo¿e coœ o kluczu do skrzyni ze sk³adowiska?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Có¿, to zale¿y...
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //Od iloœci bry³ek rudy, które jestem gotów zap³aciæ?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Szybko siê uczysz. To ciê bêdzie kosztowaæ 100 bry³ek.
	
	Info_ClearChoices ( VLK_585_Aleph_DIRTY );
	
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Zap³aæ 100 bry³ek rudy)",VLK_585_Aleph_DIRTY_100 );
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Nie p³aæ)",VLK_585_Aleph_DIRTY_NO );
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems (hero,ItMinugget)>=100
	{ 
		AI_Output (other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Niech bêdzie, ty zdzierco. Masz tu swoje 100 bry³ek.
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Trzeba by³o ze mn¹ nie zadzieraæ. Oto twój klucz.
		B_GiveInvItems	(hero, self, ItMinugget,100);
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		Info_ClearChoices	( VLK_585_Aleph_DIRTY );
		VLK_585_Aleph_DIRTY.permanent = 0;	
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Masz mnie za g³upca?! 100 bry³ek, to moje ostatnie s³owo!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Nie bêdê wyrzuca³ w b³oto takiej iloœci rudy!
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //To po co mnie w ogóle zaczepiasz?
	VLK_585_Aleph_DIRTY.permanent = 0;	
};
