// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Darrion_Exit (C_INFO)
{
	npc			=  Nov_1312_Darrion;
	nr			=  999;
	condition	=  DIA_Darrion_Exit_Condition;
	information	=  DIA_Darrion_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Darrion_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Hallo
// **************************************************

instance  DIA_Darrion_Hello (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 1;
	condition	= DIA_Darrion_Hello_Condition;
	information	= DIA_Darrion_Hello_Info;
	permanent	= 0;
	description	= "Zdar - jsem tady nov� a cht�l bych se n�co dov�d�t o t�bo�e.";
};                       

FUNC int  DIA_Darrion_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Darrion_Hello_Info()
{
	AI_Output (other, self,"DIA_Darrion_Hello_15_00"); //Zdar - jsem tady nov� a cht�l bych se n�co dov�d�t o t�boru.
	AI_Output (self, other,"DIA_Darrion_Hello_11_01"); //Pak jsi p�i�el na �patn� m�sto. Od t� doby, co se templ��i za�ali p�ipravovat k boji, tu m�me ve dne v noci napilno.
	AI_Output (self, other,"DIA_Darrion_Hello_11_02"); //Nem�m moc �asu na ot�zky. Tak m� nevyru�uj - pokud si nechce� n�co koupit.
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,"Novic Darrion obchoduje se ZBRAN�MI. Tr�v� v�t�inu �asu v kov�rn�.");
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Darrion_Trade (C_INFO)
{
	npc			= Nov_1312_Darrion;
	nr			= 800;
	condition	= DIA_Darrion_Trade_Condition;
	information	= DIA_Darrion_Trade_Info;
	permanent	= 1;
	description	= "Cht�l bych s tebou obchodovat!";
	trade 		= 1;
};                       

FUNC int  DIA_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Darrion_Trade_Info()
{
	AI_Output (other, self,"DIA_Darrion_Trade_15_00"); //Cht�l bych s tebou obchodovat!
	AI_Output (self, other,"DIA_Darrion_Trade_11_01"); //Dob�e! Tady - to jsou zbran�, kter� m�m zrovna k dispozici.

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};
