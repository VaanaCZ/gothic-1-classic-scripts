/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Org_873_Cipher_Exit (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  999;
	condition	=  Org_873_Cipher_Exit_Condition;
	information	=  Org_873_Cipher_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ******************************
// 			Hallo
// ******************************

instance  Org_873_Cipher_Hello (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Hello_Condition;
	information	=  Org_873_Cipher_Hello_Info;
	permanent	=  0;
	description = "¿Qué tal?";
};                       

FUNC int  Org_873_Cipher_Hello_Condition()
{
	if (Balor_TellsNCDealer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Hello_Info()
{
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //¿Cómo van las cosas?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //¡Le hemos puesto otra zancadilla a Gómez!
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Tres guardias muertos y muchas cosas que vender. ¡Esto merece un trago!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //¿Eres tú uno de los que suelen lanzar incursiones al Campamento Viejo?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //No. Sólo cuando merece la pena.
};

// ******************************
// 			Fisk
// ******************************

instance  Org_873_Cipher_Fisk (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Fisk_Condition;
	information	=  Org_873_Cipher_Fisk_Info;
	permanent	=  1;
	description = "Fisk, del Campamento Viejo, está buscando un nuevo socio comercial.";
};                       

FUNC int  Org_873_Cipher_Fisk_Condition()
{
	if (Fisk_GetNewHehler==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Fisk_Info()
{
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk del Campamento Viejo anda en busca de un nuevo socio.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //No me interesa.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Pero puede que a Sharky sí le interese. Si te lo encuentras, díselo.
};

// ******************************
// 			Balor sent Me
// ******************************
	var int Cipher_Trade;
// ******************************

instance  Org_873_Cipher_FromBalor (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_FromBalor_Condition;
	information	=  Org_873_Cipher_FromBalor_Info;
	permanent	=  1;
	description = "¿Qué puedes ofrecer?";
};                       

FUNC int  Org_873_Cipher_FromBalor_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_FromBalor_Info()
{
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //¿Qué me ofreces?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Permíteme que te lo pregunte de otra manera. ¿Qué ME ofreces? Sólo me interesan los envíos importantes.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor me ha dicho que estarías interesado en la hierba del pantano.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mmmmmm. ¿Quieres vender?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //En eso no puedo ayudarte.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Entonces vuelve cuando puedas hacerlo.
	};
};

// ******************************
// 			TRADE
// ******************************

instance  Org_873_Cipher_TRADE (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_TRADE_Condition;
	information	=  Org_873_Cipher_TRADE_Info;
	permanent	=  1;
	description = "Hagamos un trato.";
	trade		= 1;
};                       

FUNC int  Org_873_Cipher_TRADE_Condition()
{
	if ( Cipher_Trade == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_TRADE_Info()
{
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Hagamos un trato.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //¿Qué es lo que quieres?
};
