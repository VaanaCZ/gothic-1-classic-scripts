// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "Co tady d�l�?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Co tady d�l�te?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Sb�r�me tady drogu z ba�in, kterou zpracov�vaj� na�i brat�i, aby j� bylo potom mo�n� kou�it.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Sb�r v ba�in�ch je velmi nebezpe�n�, ale ta droga neroste nikde jinde. A vlastn� je to tak dob�e.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Pro�?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Proto�e tak j� ostatn� dva t�bory nedostanou. Jsme jedin� z kolonie, kdo m��e sb�rat drogu z ba�in.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //M��eme s n� obchodovat s ostatn�ma dv�ma t�bory - MY si m��eme stanovit cenu.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Poslal m� Baal Orun. M�m p�edat celou sklize� Kalomovi.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Poslal m� Baal Orun. M�m p�edat celou sklize� Kalomovi.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //P�edstavuje� si to dost jednou�e, co?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //To by mohl ��ci ka�d�: 'poslal m� Baal Orun' - f��� - a cel� sklize� je tatam.
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Jdi za n�m a zeptej se ho, kdy� mi nev���!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Ale Baal Orun m� skute�n� poslal!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Ale Baal Orun m� skute�n� poslal!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Jist�.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Jdi za n�m a zeptej se ho, kdy� mi nev���!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //M�m lep�� n�pad. Doka� svou oddanost t�m, �e pro n�s ud�l� malou slu�bi�ku!
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "A co m�m ud�lat?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //A co m�m ud�lat?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //Jenom mali�kost. Pr�ce v ba�in�ch je trochu nebezpe�n�, a je�t� ke v�emu jsou tam ty proklat� krvav� mouchy.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Pr�ce by byla daleko snaz�� bez nich! U� ch�pe�?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran mi dal drogu z ba�in, kdy� jsem vyhladil v�echny krvav� mouchy v okruhu 20 krok�.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "U� tu ��dn� krvav� mouchy nevid�m.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //U� tu ��dn� krvav� mouchy nevid�m.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unver�ndert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Na ka�d�m dvan�ct�m kroku jsou ale dal�� hovada!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Ty se ti tak snadno odstranit nepoda��!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //U� tu nejsou ��dn� potvory. Odvedl jsi dobrou pr�ci!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Ten, kdo takhle pracuje, je bu� na na�� stran�, nebo je �pln� idiot!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Ale idiot by byl p��li� hloup�, aby m� p�elstil, nem�m pravdu?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Tak si vezmi tu sklize� a p�edej ji Cor Kalomovi.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Jestli si bude st�ovat, �e j� nen� dost, vzka� mu, a� pohne sv�m zadkem sem a j� mu ud�l�m p�edstavu o tom, jak t�k� je to pr�ce.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi p�edal druhou polovinu dne�n� sklizn� drogy z ba�in. Uvid�me, jestli bude Cor Kalom s t�mto mno�stv�m spokojen�.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran mi dal dne�n� sklize� drogy z ba�in. Nevypad� to, �e je j� dost. Snad je tu je�t� druh� skupina sb�ra��.");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "Jak jde skl�zen�?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Jak jde skl�zen�?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Jasn�, jasn�, te� jsi m� pobavil. Jsem p�esv�d�en�, �e jsi od Guru dostal n�co lep��ho na pr�ci.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Jist�, aspo� tu �pinavou pr�ci nebudu muset d�lat s�m. Od toho je 'p�chota' - hehehe!
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "Jsem tu, abych pro Cora Kaloma znovu p�evzal celou sklize�.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Jsem tu, abych pro Cora Kaloma znovu p�evzal celou sklize�.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Znovu?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Jen mi te� ne��kej, �e m�m zab�t v�echny ty mo��lov� �raloky! Opravdu nem�m moc �asu.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Dob�e, dob�e! Tady je ta zatracen� sklize�!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








