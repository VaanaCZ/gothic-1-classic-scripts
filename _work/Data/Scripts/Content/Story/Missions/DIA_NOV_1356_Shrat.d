// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Shrat_Exit (C_INFO)
{
	npc			=  Nov_1356_Shrat;
	nr			=  999;
	condition	=  DIA_Shrat_Exit_Condition;
	information	=  DIA_Shrat_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Shrat_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance  DIA_Shrat_WhyHere (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_WhyHere_Condition;
	information	= DIA_Shrat_WhyHere_Info;
	permanent	= 0;
	description	= "�Qu� haces aqu�?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //�Acaso te he dado permiso para que me dirijas la palabra?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //�Era una broma! �Esos malditos chiflados me est�n poniendo de los nervios; por eso estoy aqu�!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //'�No me dirijas la palabra!' '�Reza por el perd�n del Durmiente!' '�Tu misi�n es extraordinariamente importante!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Es como para volverle loco a uno; no es de extra�ar que todos est�n desquiciados aqu�.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Yo soy Shrat, novicio del primer rango; �y eso es lo que siempre ser�!
};

// **************************************************
//				Hilfe bei Join PSI ??
// **************************************************

instance DIA_Shrat_JoinPSI (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_JoinPSI_Condition;
	information	= DIA_Shrat_JoinPSI_Info;
	permanent	= 0;
	description	= "Quiero ingresar en la Hermandad. �Puedes ayudarme?";
};                       

FUNC int DIA_Shrat_JoinPSI_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

FUNC void DIA_Shrat_JoinPSI_Info()
{
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Quiero ingresar en la Hermandad; �puedes ayudarme?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //�Quieres ingresar aqu�? La verdad es que yo estoy intentando pensar en c�mo escaparme.
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Podr�amos vagar por la colonia. Robarle su dinero a algunos atontados, reunir algo de mineral... �qu� te parece?
};

// **************************************************
//					Komm mit
// **************************************************

instance DIA_Shrat_ComeWithMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_ComeWithMe_Condition;
	information	= DIA_Shrat_ComeWithMe_Info;
	permanent	= 1;
	description	= "�Vamos juntos! �Ven conmigo!";
};                       

FUNC int DIA_Shrat_ComeWithMe_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER]==FALSE) )
	{
		return 1;
	};
};

FUNC void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //�Viajemos juntos! �Ven conmigo!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //�Eso es lo que yo quer�a o�r! �Vamos!

	Npc_ExchangeRoutine (self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// **************************************************
//					Verlassen
// **************************************************

instance DIA_Shrat_LeaveMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 700;
	condition	= DIA_Shrat_LeaveMe_Condition;
	information	= DIA_Shrat_LeaveMe_Info;
	permanent	= 1;
	description	= "Aqu� se separan nuestros caminos. Ir� solo.";
};                       

FUNC int DIA_Shrat_LeaveMe_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER]==TRUE)
	{
		return 1;
	};
};

FUNC void DIA_Shrat_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Aqu� se separan nuestros caminos; yo seguir� solo.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //De acuerdo. Yo volver� a mi escondite en el pantano. �Cu�date!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
