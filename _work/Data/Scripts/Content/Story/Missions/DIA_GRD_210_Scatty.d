// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Co je tv� pr�ce?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Co tady m� na pr�ci?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //St�e��m ar�nu. Organizuju vs�zen�, naj�m�m nov� bojovn�ky... V�ak v�.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Chci se p�idat k t�boru. Pom��e� mi?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chci se p�idat k t�boru. Pom��e� mi?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Mo�n� bych mohl, musel bys m� ale n�jak p�esv�d�it.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //N�kolik nejlep��ch bojovn�k� ze v�ech t�� t�bor� sem chod�, aby si zde navz�jem pom��ilo s�ly.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Vyzvi n�koho z nich na souboj. Budu t� sledovat a kdy� bude� dobr�, zamysl�m se nad t�m.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, mistr ar�ny, ocen�, kdy� vyzvu jednoho z bojovn�k�.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Bojoval jsem s Kirgem!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Bojoval jsem s Kirgem!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Jist�, a prohr�l jsi.
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Ur�it� si nemysl�, �e m� t�mhle p�esv�d��...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Skute�nost, �e m� Kirgo porazil, u� na Scattyho takov� dojem neud�lala.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //A porazil jsi ho! To nen� na za��te�n�ka, jako jsi ty, �patn�! P�esv�d�il jsi m�!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty byl zaujat m�m bojem proti Kirgovi.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Vyzval jsem  Kharima!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Vyzval jsem  Kharima!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //A ten t� zml�til, hochu!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Vybral sis vhodn�ho protivn�ka! Ty bastardy z Nov�ho t�bora nem��u vyst�t.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Vypad� to, �e to vid� podobn� - jsi p�esn� ten typ chlapa, jak� pot�ebujeme!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"Kharim m� zbil! Scattymu se l�bila moje odvaha, ne v�ak m�j boj.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //A srazil jsi ho! Mus�m uznat, �e to nebylo �patn�. V�dycky byl jedn�m z nejpova�ovan�j��ch bojovn�k�.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Tohle na m� opravdu ud�lalo dojem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Nandal jsem to Kharimovi! Scatty byl dojat�.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager K�mpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Pro� nech�v� lidi z jin�ch t�bor�, aby se tady bili?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Myslel jsem, �e Star� a Nov� t�bor spolu nevych�zej� dob�e - tak pro� tady nech�v� jejich lidi bojovat?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To je jednoduch� - odehr�vaj� se tady jednou t�dn� souboje a kop��i poka�d� r�di vid�, kdy� je n�kter� z hrdlo�ez� z Nov�ho t�bora rozdrcen.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Pokud bojuje jeden z nich, pak se uzav�e v�ce s�zek - a to je skv�l� pro obchod!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Mezi n�mi, j� ty gr�zly z Nov�ho t�bora nem��u vyst�t - ale obchod je obchod.
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Chci uzav��t s�zku.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chci uzav��t s�zku.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Te� ale nen� ��dn� souboj.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //P��t� boje budou za n�kolik dn�. Bude to vyhl�eno.
	
};

// **************************************************
// 					Will K�mpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Chci bojovat v ar�n�!";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Chci bojovat v ar�n�!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Nem��u t� nechat bojovat, dokud se nep�ipoj� k jednomu z t�bor�!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Nikoho nezaj�maj� nez�visl� bojovn�ci!
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "Cvi�� v�bec bojovn�ky?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC,"Scatty, mistr ar�ny, m� m��e nau�it bojovat s JEDNORU�N�MI ZBRAN�MI.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Cvi�� v�bec bojovn�ky?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Jist�, ale ne pro z�bavu. Jestli chce�, abych t� cvi�il, mus� mi za to zaplatit.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chci se zlep�it v ovl�d�n� jednoru�n�ho me�e.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //To je dobr� rozhodnut�! Je�t� ne� se za�ne� u�it techniku, mus� se nau�it spr�vn� dr�et zbra�.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Za��te�n�ci oby�ejn� m�vaj� snahu dr�et jednoru�n� me� ob�ma rukama. T�mto zp�sobem rozhodn� neza��nej, to nen� dobr�.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Dr� zbra� v jedn� ruce, �epel� vzh�ru a �ermuj s n�.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Mus� se nau�it sladit pohyb zbran� s pohybem sv�ho t�la. Tak bude� p�i �toku rychlej��.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Kdy� si zapamatuje�, co jsem t� nau�il, tak bude tv�j boj v budoucnu elegantn�j�� a rychlej��.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ov�em, je�t� jednu v�c: N�kter� �dery zp�sob� v�t�� �kodu ne� ostatn�. Jako za��te�n�kovi se ti nebude �asto dost�vat �ance rozhoduj�c�ch �der�.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale �asem bude� d�lat pokroky a zlep�� se.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nem� dost rudy!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Nau� m� je�t� l�pe ovl�dat jednoru�n� me�.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobr�, z�klady zn�. Kdy� podr�� zbra� n�, umo�n� ti to mnohem siln�ji v�st prvn� �vih.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Mus� se h�bat, pamatuje�? Dob�e, te� mus� je�t� v�c pracovat t�lem. Po druh�m �deru se oto�. To protivn�ka zmate a tob� to umo�n� zaujmout optim�ln� pozici.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Je�t� jednou ve� �epel zprava doleva.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //A znovu kup�edu. Nezapome�: cvi�en�m k dokonalosti. Tak�e vzh�ru do toho, aby ses stal mistrem jednoru�n�ho me�e.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Vra� se, a� bude� m�t dost rudy!
	};
};
