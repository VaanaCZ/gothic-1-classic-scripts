// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Jak to jde?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Jak to jde?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Jsi tu nov�, vi�? M�l bys v�d�t, �e se str�emi nen� dobr� m�t probl�my.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Kdy� budou cht�t pen�ze za ochranu, rad�ji zapla�, jinak bude polovina t�bora proti tob�.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hej, ty! Sly�el jsem, �e jsi nezaplatil Bloodwynovi pen�ze za ochranu?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Co chce�?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Varovat t�! Bloodwyn zaplatil p�r lidem: ti po tob� p�jdou.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Vid�l jsem, jak mluv� s lidmi jako Herek, a b�hv�, koho si je�t� najal!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Co se t�k� Hereka, je tv� varov�n� trochu opo�d�n�.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Musel mluvit je�t� s n�k�m dal��m, tolik toho v�m. Tak bu� opatrn�.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Pro� jsi mi vypr�v�l celou tu historku o Bloodwynovi?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Pro� jsi mi vypr�v�l celou tu historku o Bloodwynovi?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Proto�e slu�bi�ka by se m�la oplatit. A ty nevypad� jako n�kdo, kdo by to nepochopil.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //A proto�e j� jsem prok�zal laskavost TOB�, r�d bych ti dal p��le�itost mi to oplatit.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Zapome� na to! Nic ti nedlu��m!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Co m� p�esn� na mysli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nic ti nedlu��m!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //(kysele) Och! Pak se ztra�!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Co m� p�esn� na mysli?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //U� mi nezbyla ��dn� ruda a Bloodwyn u� m� taky obral.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Kdy� jsem ti te� pomohl, m�l bys mu d�t 10 nuget�, kter� mu dlu��m, jo? �ekni mu, �e je to ode m�.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"J�, platit za tebe? Na to zapome�!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Uvid�m, co budu moci ud�lat.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Uvid�m, co budu moci ud�lat.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //D�ky, �lov��e! Zachr�nil jsi m�! �ekne� mi, a� se v�ci urovnaj�, vi�?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //J�, platit za tebe? Na to zapome�!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Asi jsem se v tob� m�lil. P��t� u� se mnou nepo��tej.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Zaplatil jsem Bloodwynovi!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Zaplatil jsem Bloodwynovi!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Tak? V�born�! Tak jsme si kvit.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"CO�EEE? Utratil jsem 10 nuget� za otrapu, kter�ho jsem ani neznal?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Tak. Ruka ruku myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //CO�EEE? Utratil jsem 10 nuget� za otrapu, kter�ho jsem ani neznal?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Vypad� to tak.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Tak. Ruka ruku myje.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
