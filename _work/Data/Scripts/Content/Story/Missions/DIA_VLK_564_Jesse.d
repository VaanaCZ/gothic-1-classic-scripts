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
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Jsi tu nov˝, viÔ? MÏl bys vÏdÏt, ûe se str·ûemi nenÌ dobrÈ mÌt problÈmy.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Kdyû budou chtÌt penÌze za ochranu, radÏji zaplaù, jinak bude polovina t·bora proti tobÏ.
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
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hej, ty! Slyöel jsem, ûe jsi nezaplatil Bloodwynovi penÌze za ochranu?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Co chceö?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Varovat tÏ! Bloodwyn zaplatil p·r lidem: ti po tobÏ p˘jdou.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //VidÏl jsem, jak mluvÌ s lidmi jako Herek, a b˘hvÌ, koho si jeötÏ najal!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Co se t˝k· Hereka, je tvÈ varov·nÌ trochu opoûdÏnÈ.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Musel mluvit jeötÏ s nÏk˝m dalöÌm, tolik toho vÌm. Tak buÔ opatrn˝.
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
	description		= "ProË jsi mi vypr·vÏl celou tu historku o Bloodwynovi?";
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
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //ProË jsi mi vypr·vÏl celou tu historku o Bloodwynovi?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Protoûe sluûbiËka by se mÏla oplatit. A ty nevypad·ö jako nÏkdo, kdo by to nepochopil.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //A protoûe j· jsem prok·zal laskavost TOBÃ, r·d bych ti dal p¯Ìleûitost mi to oplatit.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"ZapomeÚ na to! Nic ti nedluûÌm!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Co m·ö p¯esnÏ na mysli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nic ti nedluûÌm!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //(kysele) Och! Pak se ztraù!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Co m·ö p¯esnÏ na mysli?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Uû mi nezbyla û·dn· ruda a Bloodwyn uû mÏ taky obral.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Kdyû jsem ti teÔ pomohl, mÏl bys mu d·t 10 nuget˘, kterÈ mu dluûÌm, jo? ÿekni mu, ûe je to ode mÏ.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"J·, platit za tebe? Na to zapomeÚ!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"UvidÌm, co budu moci udÏlat.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //UvidÌm, co budu moci udÏlat.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //DÌky, ËlovÏËe! Zachr·nil jsi mÏ! ÿekneö mi, aû se vÏci urovnajÌ, viÔ?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //J·, platit za tebe? Na to zapomeÚ!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Asi jsem se v tobÏ m˝lil. P¯ÌötÏ uû se mnou nepoËÌtej.
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
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Tak? V˝bornÏ! Tak jsme si kvit.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"COéEEE? Utratil jsem 10 nuget˘ za otrapu, kterÈho jsem ani neznal?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Tak. Ruka ruku myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COéEEE? Utratil jsem 10 nuget˘ za otrapu, kterÈho jsem ani neznal?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Vypad· to tak.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Tak. Ruka ruku myje.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
