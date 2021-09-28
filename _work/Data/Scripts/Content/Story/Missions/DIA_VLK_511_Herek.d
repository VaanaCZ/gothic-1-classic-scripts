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
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //�Espera! He o�do decir que has hablado con Bloodwyn.
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //�Por qu�? �Qu� es lo que quieres?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //�Fue genial por tu parte que te negaras a pagarle dinero de protecci�n!
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //�Eso quiere decir que nosotros tendremos que pagar tambi�n tu parte!
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Voy a hacer que lo recuerdes la pr�xima vez que te lo pida.
	
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
	description		= "�Qu� tal?";
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
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //�Y c�mo van las cosas?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //�En este campamento no hay sitio para los dos!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //�Perd�n?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //�Si de m� dependiera, no durar�as mucho aqu�!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //�Sabes por qu� estoy aqu�? Mat� a doce personas en una noche, as� de f�cil... �Je, je, je!
	
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
	description		= "As� que crees que eres uno de los tipos duros, �verdad? Demu�stramelo...";
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
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Entonces crees que eres un tipo duro, �eh? �Por qu� no pruebas conmigo?
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //�Quieres que te mate? �Vale, si es eso lo que quieres!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


