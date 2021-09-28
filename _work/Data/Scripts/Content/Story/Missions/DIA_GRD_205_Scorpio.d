// **************************************
//					EXIT 
// **************************************

instance DIA_Scorpio_Exit (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 999;
	condition	= DIA_Scorpio_Exit_Condition;
	information	= DIA_Scorpio_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Scorpio_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scorpio_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Was willst du hier?
// **************************************

instance DIA_Scorpio_Hello (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_Hello_Condition;
	information	= DIA_Scorpio_Hello_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Scorpio_Hello_Condition()
{	
	if	!C_NpcBelongsToOldcamp (other)
	&&	(Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Hello_Info()
{
	AI_Output (self, other,"DIA_Scorpio_Hello_13_00"); //Kdo T� pustil dovnit�?
	AI_Output (other, self,"DIA_Scorpio_Hello_15_01"); //Thorus.
	AI_Output (self, other,"DIA_Scorpio_Hello_13_02"); //A co tady chce�?

	Info_ClearChoices 	(DIA_Scorpio_Hello);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Jen chci vid�t, jak to tu vypad�.",DIA_Scorpio_Hello_JustLooking);
	Info_Addchoice 		(DIA_Scorpio_Hello,"M�m zpr�vu pro m�gy.",DIA_Scorpio_Hello_Mages);
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Nesu n�jakou drogu z ba�in pro Gomeze.",DIA_Scorpio_Hello_Kraut);
	};
	if (Npc_KnowsInfo(hero, Info_Thorus_ReadyForGomez))
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"P�i�el jsem, abych se setkal s Gomezem. Chci se k v�m p�idat.",DIA_Scorpio_Hello_Join);
	};
};

func void DIA_Scorpio_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_JustLooking_15_00"); //Jen chci vid�t, jak to tu vypad�.
	AI_Output (self, other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Z�bavn�.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Mages()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Mages_15_00"); //M�m zpr�vu pro m�gy.
	AI_Output (self, other,"DIA_Scorpio_Hello_Mages_13_01"); //Ty pracuje� pro m�gy? S t�m nechci nic m�t...
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Kraut()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Kraut_15_00"); //Nesu n�jakou drogu z ba�in pro Gomeze.
	AI_Output (self, other,"DIA_Scorpio_Hello_Kraut_13_01"); //Tak ji odevzdej v tom dom� se dv�ma str�emi p�ede dve�mi.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Join()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_00"); //P�i�el jsem, abych se setkal Gomezem. Chci se k v�m p�idat.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_01"); //Ty? Co bys tak pro n�s mohl d�lat?
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_02"); //St�nov� se mnou byli velmi spokojeni.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_03"); //Nikdo z n�s tady nechce o St�nech ani sly�et. Tady jsme MY.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

// **************************************
//			REFUSE TRAIN
// **************************************

instance DIA_Scorpio_REFUSETRAIN (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_REFUSETRAIN_Condition;
	information	= DIA_Scorpio_REFUSETRAIN_Info;
	permanent	= 1;
	description = "Nau�� m� bojovat?";
};                       

FUNC int DIA_Scorpio_REFUSETRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scorpio_Hello) && (Npc_GetTrueGuild (hero) != GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_REFUSETRAIN_Info()
{
	AI_Output (other, self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Nau�� m� bojovat?
	AI_Output (self, other,"DIA_Scorpio_REFUSETRAIN_13_01"); //Cvi��m jenom str�e. Dokud t� k nim Thorus nejmenuje, bude� si muset naj�t n�koho jin�ho.
	
};

//*******************************
//*********�����������***********
//********* KAPITEL 3 ***********
//*********...........***********
//*******************************


/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_WELCOME (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_WELCOME_Condition;
	information		= GRD_205_Scorpio_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_WELCOME_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_WELCOME_Info()
{
	
	AI_Output (self, other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //D�t se k n�m byla tvoje nejlep�� volba v �ivot�!
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_CROSSBOW (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_CROSSBOW_Condition;
	information		= GRD_205_Scorpio_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Bude� m� cvi�it?"; 
};

FUNC int  GRD_205_Scorpio_CROSSBOW_Condition()
{	
	if (Kapitel >= 4)
	|| (Npc_GetTrueGuild (hero) == GIL_GRD) 
	
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_CROSSBOW_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Bude� m� cvi�it?
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //Pokud m� dost rudy, nau��m t�, jak pou��vat samost��l. Zapla� mi 200 nuget�.
	if (log_scorpiocrossbow == FALSE)
	&& (Kapitel <= 4)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Scorpio m� m��e nau�it pou��vat SAMOST��L.");
		log_scorpiocrossbow = TRUE;
	}
	else if (log_scorpiocrossbow == FALSE)
	&& (Kapitel > 4)
	{
		Log_CreateTopic   	(GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Scorpio m� m��e nau�it pou��vat SAMOST��L.");
		log_scorpiocrossbow = TRUE;
	};
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),GRD_205_Scorpio_CROSSBOW_OK);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW,DIALOG_BACK,GRD_205_Scorpio_CROSSBOW_BACK);

};  
func void GRD_205_Scorpio_CROSSBOW_BACK()
{
	Info_ClearChoices	(GRD_205_Scorpio_CROSSBOW );
};

func void GRD_205_Scorpio_CROSSBOW_OK()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_OK_15_01"); //Nau� m� je�t� l�pe zach�zet se samost��lem.
	if (Npc_HasItems (hero,ItMiNugget)>= 200)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Dobr�, tak za�neme.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Sev�i �chyt ��pu a dr� jej t�sn� proti ramenu. Pak se soust�e� na zam��en�.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //V prvn�ch dnech bude� m�t pocit, jakoby ti rameno m�lo upadnout.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //Ale u� po t�dnu bude� m�t rameno jako k�men!
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Zam�� p��mo na c�l pod�l nata�en�ho ��pu. ��p ze samost��lu m� daleko v�t�� pr�bojnost ne� ��p z oby�ejn�ho luku, tak�e zp�sob� v�t�� �kody!
			B_GiveInvItems (hero,other,ItMiNugget,200);
			GRD_205_Scorpio_CROSSBOW.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_07"); //DV� ST� nuget� p�kn� sem, na ruku. Jestli nem� dost nuget�, tak si je obstarej!
	};
};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_CROSSBOW2 (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_CROSSBOW2_Condition;
	information		= GRD_205_Scorpio_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nau� m� je�t� l�pe zach�zet se samost��lem."; 
};

FUNC int  GRD_205_Scorpio_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1) 
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_CROSSBOW2_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01"); //Nau� m� je�t� l�pe zach�zet se samost��lem.
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02"); //To bude st�t 300 nuget�.
  
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW2);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),GRD_205_Scorpio_CROSSBOW2_OK);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW2,DIALOG_BACK,  GRD_205_Scorpio_CROSSBOW2_BACK);
	

};  
func void GRD_205_Scorpio_CROSSBOW2_BACK()
{
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW);
};

func void GRD_205_Scorpio_CROSSBOW2_OK()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01"); //Tak za�neme.
	if (Npc_HasItems (hero,ItMiNugget)>= 300)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Dob�e. Pokud p�i rozmachu pokr�� kolena, tv� �vihy budou p�esn�j�� a r�zn�j��.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //Mus� se nau�it odhadnout, jakou rychlost� se pohybuje tv�j protivn�k.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Vyst�el ��p do dr�hy pohybuj�c�ho se c�le, abys jej zas�hl a poslal k zemi.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //Pokud m� v�ce ne� jeden c�l, pak nesm� pl�tvat �asem. Sundej je jednoho po druh�m v napl�novan�m po�ad�.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //Tak jsem t� nau�il v�echno, co um�m.
		B_GiveInvItems (hero,other,ItMiNugget,300);
		GRD_205_Scorpio_CROSSBOW2.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07"); //Uvid�me, jestli n�kde dok�e� sehnat T�I STA nuget�.
	};
};
/*------------------------------------------------------------------------
Ab Kapitel 4 steht Scorpio draussen, damit der Spieler bei ihm noch lernen kann								
------------------------------------------------------------------------*/
/*------------------------------------------------------------------------
//							hey PC!								//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_HeyPC (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_HeyPC_Condition;
	information		= GRD_205_Scorpio_HeyPC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_HeyPC_Condition()
{	
	if (kapitel >= 4)
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_HeyPC_Info()
{
	AI_Output (self, other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Hej, ��dnej strach, �lov��e. Poj� sem!
};

/*------------------------------------------------------------------------
//							Scorpio ist abgehauen								//
------------------------------------------------------------------------*/
instance  GRD_205_Scorpio_BANISHED (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_BANISHED_Condition;
	information		= GRD_205_Scorpio_BANISHED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jsi v po��dku?"; 
};

FUNC int  GRD_205_Scorpio_BANISHED_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_205_Scorpio_HeyPC))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_BANISHED_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //Jsi v po��dku?
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //Miz�m odsud. Nestar�m se o ty pobudy, kter� str�e vyhodily.
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //M�m tady p�r p�kn�ch v�ci�ek ze zbrojnice. Kdy� bude� pot�ebovat n�jakou zbra�, dej mi v�d�t.
	if (Scorpio_Exile == FALSE)
	{
	Log_CreateTopic   	(GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"Scorpio z�stal ve Star�m t�bo�e a te� ob�v� spolu s Cavalornem loveckou ch��i mezi Star�m a Nov�m t�borem.");
	Scorpio_Exile = TRUE;
	};
};  

/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_TRADE (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_TRADE_Condition;
	information		= GRD_205_Scorpio_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Uka�, co m�."; 
	trade			= 1;
};

FUNC int  GRD_205_Scorpio_TRADE_Condition()
{	
	if( Npc_KnowsInfo (hero,GRD_205_Scorpio_BANISHED))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_TRADE_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Uka�, co m�.
	
};  
