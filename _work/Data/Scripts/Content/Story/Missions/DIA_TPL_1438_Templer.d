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
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Je�t� se uvid�me!
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //K� Sp�� procitne!
	
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
	description		= "Co d�laj� templ��i v dolu?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Co d�laj� templ��i v dolu?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Lov�me tady d�ln� �ervy. Jdi zp�tky do t�bora, tam bude� v bezpe��.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pro� lov�te �ervy?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Pro� lov�te �ervy?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Pro jejich �elisti. Obsahuj� cenn� v�m�ek.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Jak� druh v�m�ku?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Jed. Jedin� n� Guru Cor Kalom v�, jak z n�j p�ipravit lektvar.
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
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Jeden z nejmocn�j��ch mu�� cel�ho Bratrstva. Zn� mnoh� tajemstv� a dok�e ovl�dat mysl jin�ch lid�!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Krom� toho je alchymista. P�ipravuje lektvary, d�ky kter�m m��eme navazovat duchovn� kontakt se Sp��em. Jdi do t�bora. Po��d hled�me n�jak� lidi!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Budu o tom p�em��let.
};  
//---------------------WENN DIE EIERSUCHE L�UFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hled�m hn�zdo d�ln�ch �erv�."; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Hled�m hn�zdo d�ln�ch �erv�.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Jdi za Gorem Na Videm, Gorem Na Koshem nebo Gorem Na Barem. Ti v�d� o �ervech mnohem v�ce ne� j�.

	B_LogEntry		(CH2_MCEggs,"U vchodu do Star�ho dolu jsem se zeptal jednoho templ��e na hn�zdo d�ln�ch �erv�. Odk�zal m� na t�i dal�� templ��e - Gora Na Vida, Gora Na Koshe a Gora Na Bara. Tahle jm�na, kter� pou��vaj� v Bratrstvu, m� p�iv�d�j� k ��lenstv�.");  
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
	description		= "Jak odd�l�m d�ln�mu �ervovi �elisti?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Jak odd�l�m d�ln�mu �ervovi �elisti?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Nen� to tak snadn�. Nau��m t� to.
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
	description		= "Nau�it se odd�lit �ervovi �elisti (1 dovednostn� bod)"; 
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
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //M��e� m� nau�it, jak se odstra�uj� �elisti?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Nejd��v mus� ud�lat hlubok� z��ez do masa. D�vej pozor, abys neporu�il �elistn� �l�zu. Pokud to ud�l�, v�m�ek vyst��kne pry�.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //To mus� b�t docela mrzut�.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //To si pi�! U� jsi nav�t�vil Korgura T��prs��ka, lovce �erv�? Ale ne, to bylo, ne� jsi p�i�el. Dobr�, pokra�ujme...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //�ezej kolem �l�zy, d�lej hlubok� z��ez a potom odstra� maso spole�n� s �elistma. Kdy� je uchop� takhle, nebude� m�t pot�e s odstran�n�m �elist�.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Jak odstranit �elisti - d�ln� �ervi");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Nau�it se: Od��znout �elisti d�ln�ch �erv�", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
