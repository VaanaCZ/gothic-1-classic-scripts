instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Ještì se uvidíme!
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Ké Spáè procitne!
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co dìlají templáøi v dolu?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Co dìlají templáøi v dolu?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Lovíme tady dùlní èervy. Jdi zpátky do tábora, tam budeš v bezpeèí.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Proè lovíte èervy?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Proè lovíte èervy?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Pro jejich èelisti. Obsahují cennı vımìšek.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Jakı druh vımìšku?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Jed. Jedinì náš Guru Cor Kalom ví, jak z nìj pøipravit lektvar.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kdo je Cor Kalom?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Kdo je Cor Kalom?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Jeden z nejmocnìjších muù celého Bratrstva. Zná mnohá tajemství a dokáe ovládat mysl jinıch lidí!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Kromì toho je alchymista. Pøipravuje lektvary, díky kterım mùeme navazovat duchovní kontakt se Spáèem. Jdi do tábora. Poøád hledáme nìjaké lidi!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Budu o tom pøemıšlet.
};  
//---------------------WENN DIE EIERSUCHE LÄUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hledám hnízdo dùlních èervù."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Hledám hnízdo dùlních èervù.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Jdi za Gorem Na Videm, Gorem Na Koshem nebo Gorem Na Barem. Ti vìdí o èervech mnohem více ne já.

	B_LogEntry		(CH2_MCEggs,"U vchodu do Starého dolu jsem se zeptal jednoho templáøe na hnízdo dùlních èervù. Odkázal mì na tøi další templáøe - Gora Na Vida, Gora Na Koshe a Gora Na Bara. Tahle jména, která pouívají v Bratrstvu, mì pøivádìjí k šílenství.");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak oddìlím dùlnímu èervovi èelisti?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Jak oddìlím dùlnímu èervovi èelisti?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Není to tak snadné. Nauèím tì to.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauèit se oddìlit èervovi èelisti (1 dovednostní bod)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Mùeš mì nauèit, jak se odstraòují èelisti?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Nejdøív musíš udìlat hlubokı záøez do masa. Dávej pozor, abys neporušil èelistní lázu. Pokud to udìláš, vımìšek vystøíkne pryè.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //To musí bıt docela mrzuté.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //To si piš! U jsi navštívil Korgura Tøíprsáka, lovce èervù? Ale ne, to bylo, ne jsi pøišel. Dobrá, pokraèujme...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Øezej kolem lázy, dìlej hlubokı záøez a potom odstraò maso spoleènì s èelistma. Kdy je uchopíš takhle, nebudeš mít potíe s odstranìním èelistí.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Jak odstranit èelisti - dùlní èervi");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Nauèit se: Odøíznout èelisti dùlních èervù", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Nedostatek zkušenostních bodù!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
