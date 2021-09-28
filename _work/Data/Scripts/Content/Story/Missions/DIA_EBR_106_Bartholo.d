// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Kdo jsi?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Kdo jsi?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Jmenuji se Bartholo. Star�m se o to, aby Rudobaroni dost�vali sv� dod�vky.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //M�m toho na starosti spoustu - od drogy z ba�in a� po potravinov� z�soby pro �eny.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //A taky m�m na starosti dohl�et, aby ti pitom� kucha�i odv�d�li dobrou pr�ci.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //M�li by b�t excelentn�. Gomez se nespokoj� s ��dn�m �lendri�nem. Posledn�mi dv�ma kucha�i nakrmil ryby v �ece.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Cht�l bych s tebou obchodovat.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schl�ssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Cht�l bych s tebou obchodovat.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //M��u toho nab�dnout hodn� - pokud m� dost rudy.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "M�m pro Gomeze trochu drogy z ba�in. Pos�l� ji Cor Kalom.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //M�m pro Gomeze trochu drogy z ba�in. Pos�l� ji Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Uka� mi to!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Dobr�! Gomez u� za��n� b�t netrp�liv�. M� �t�st�, �es to p�inesl u� dneska!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //A co takhle platit?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Ne tak zhurta... T�k, tady. 500 nuget�, jak to bylo domluveno.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo mi dal za z�silku drogy 500 nuget�. ");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Na posl��ka t� drogy moc nem�! Douf�m, �es tu z�silku u� nerozprodal n�kde jinde! Vra� se, a� bude� m�t to spr�vn� mno�stv�!
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//V�d�l jsem, �e se k n�m n�kdo pokou�� dostat p�es pentagram!
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Ale na rozd�l od toho zr�dn�ho kov��e Stonea tebe u� nebudeme pot�ebovat!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Kde je Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Za katrem! Ale ty bude� v okam�iku pod drnem!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Dejte mu, chlapi, roztrhejte ho na kusy!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
