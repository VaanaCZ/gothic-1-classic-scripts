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
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Jsi tu nový, viď? Měl bys vědět, že se strážemi není dobré mít problémy.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Když budou chtít peníze za ochranu, raději zaplať, jinak bude polovina tábora proti tobě.
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
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hej, ty! Slyšel jsem, že jsi nezaplatil Bloodwynovi peníze za ochranu?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Co chceš?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Varovat tě! Bloodwyn zaplatil pár lidem: ti po tobě půjdou.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Viděl jsem, jak mluví s lidmi jako Herek, a bůhví, koho si ještě najal!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Co se týká Hereka, je tvé varování trochu opožděné.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Musel mluvit ještě s někým dalším, tolik toho vím. Tak buď opatrný.
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
	description		= "Proč jsi mi vyprávěl celou tu historku o Bloodwynovi?";
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
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Proč jsi mi vyprávěl celou tu historku o Bloodwynovi?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Protože službička by se měla oplatit. A ty nevypadáš jako někdo, kdo by to nepochopil.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //A protože já jsem prokázal laskavost TOBĚ, rád bych ti dal příležitost mi to oplatit.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Zapomeň na to! Nic ti nedlužím!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Co máš přesně na mysli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nic ti nedlužím!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //(kysele) Och! Pak se ztrať!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Co máš přesně na mysli?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Už mi nezbyla žádná ruda a Bloodwyn už mě taky obral.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Když jsem ti teď pomohl, měl bys mu dát 10 nugetů, které mu dlužím, jo? Řekni mu, že je to ode mě.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Já, platit za tebe? Na to zapomeň!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Uvidím, co budu moci udělat.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Uvidím, co budu moci udělat.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Díky, člověče! Zachránil jsi mě! Řekneš mi, až se věci urovnají, viď?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Já, platit za tebe? Na to zapomeň!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Asi jsem se v tobě mýlil. Příště už se mnou nepočítej.
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
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Tak? Výborně! Tak jsme si kvit.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"COŽEEE? Utratil jsem 10 nugetů za otrapu, kterého jsem ani neznal?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Tak. Ruka ruku myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COŽEEE? Utratil jsem 10 nugetů za otrapu, kterého jsem ani neznal?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Vypadá to tak.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Tak. Ruka ruku myje.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
