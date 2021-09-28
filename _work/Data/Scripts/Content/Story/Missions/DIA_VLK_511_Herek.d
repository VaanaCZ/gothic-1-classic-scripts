// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Herek_Exit (C_INFO)
{
	npc			= Vlk_511_Herek;
	nr			= 999;
	condition	= DIA_Herek_Exit_Condition;
	information	= DIA_Herek_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Herek_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Herek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Herek_Bully (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Bully_Condition;
	information		= DIA_Herek_Bully_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Herek_Bully_Condition()
{	
	if ( (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Bully_Info()
{
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Aspetta! È vero che hai parlato con Bloodwyn?
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //Perché? Cosa vuoi?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //Sei stato davvero carino a rifiutare di dargli i soldi per la protezione!
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //Significa che tutti noi dovremo pagare anche per te!
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Farò in modo che la prossima volta ti ricordi ciò che devi fare.
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

// **************************************************
// 					Motz
// **************************************************

INSTANCE DIA_Herek_Motz (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Motz_Condition;
	information		= DIA_Herek_Motz_Info;
	permanent		= 0;
	description		= "Come vanno le cose?";
};

FUNC INT DIA_Herek_Motz_Condition()
{	
	if (Herek_ProtectionBully==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Motz_Info()
{
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //Come vanno le cose?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //In questo campo non c'è abbastanza spazio per tutti e due!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Prego?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Se fosse per me, non dureresti a lungo!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //Sai perché sono qui? Ho ucciso una decina di uomini in una sola notte, così! He he he!
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
		
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					Anlegen!
// **************************************************

INSTANCE DIA_Herek_Anlegen (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Anlegen_Condition;
	information		= DIA_Herek_Anlegen_Info;
	permanent		= 1;
	description		= "Pensi di essere un tipo pericoloso, vero? Provaci con me...";
};

FUNC INT DIA_Herek_Anlegen_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Motz)) || (Npc_KnowsInfo(hero,DIA_Herek_Bully)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Anlegen_Info()
{
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Pensi di essere un tipo pericoloso, vero? Perché non ci provi con me...
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Sei stanco di vivere? D'accordo, se è questo che vuoi!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


