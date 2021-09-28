// ************************************************************
// 			  				   EXIT 
// ************************************************************
	var int Pock_ForgetAll;
// ************************************************************

INSTANCE DIA_Pock_EXIT (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 999;
	condition	= DIA_Pock_EXIT_Condition;
	information	= DIA_Pock_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Pock_EXIT_Info()
{	
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Pock_Wasser(C_INFO) // E1
{
	npc			= Bau_902_Pock;
	nr			= 800;
	condition	= Info_Pock_Wasser_Condition;
	information	= Info_Pock_Wasser_Info;
	permanent	= 1;
	description = "Me manda Lefty. Os he traído un poco de agua.";
};                       

FUNC INT Info_Pock_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Pock_Wasser_Info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Me manda Lefty. Os he traído un poco de agua.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //¡Gracias, muchacho! ¡La necesitaba!
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Pero no te queda. Da igual, muchacho. Le pediré a los demás.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Pock_Hello (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_Hello_Condition;
	information	= DIA_Pock_Hello_Info;
	permanent	= 0;
	description	= "¡Hola! Soy nuevo aquí.";
};                       

FUNC INT DIA_Pock_Hello_Condition()
{
	if (Pock_ForgetAll == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_Hello_Info()
{	
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //¡Hola! Soy nuevo aquí.
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //Me alegro de ver una cara nueva.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Debes llevar aquí mucho tiempo, ¿no?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Has dado en el clavo, muchacho. Fui uno de los primeros.
};

// ************************************************************
// 						Weißt ne Menge
// ************************************************************

INSTANCE DIA_Pock_KnowMuch (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_KnowMuch_Condition;
	information	= DIA_Pock_KnowMuch_Info;
	permanent	= 0;
	description	= "En ese caso debes saber mucho de este lugar.";
};                       

FUNC INT DIA_Pock_KnowMuch_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_KnowMuch_Info()
{	
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //En ese caso debes saber mucho de este lugar.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //Más o menos. Me paso la mayor parte del tiempo aquí, recogiendo arroz.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); //Así es como he llegado a viejo. Nos dan arroz y algo de aguardiente. No es mucho, pero basta.
};

// ************************************************************
// 							Warum hier?
// ************************************************************

INSTANCE DIA_Pock_WhyJail (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 2;
	condition	= DIA_Pock_WhyJail_Condition;
	information	= DIA_Pock_WhyJail_Info;
	permanent	= 0;
	description	= "¿Por qué estás aquí?";
};                       

FUNC INT DIA_Pock_WhyJail_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_WhyJail_Info()
{	
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //¿Por qué estás aquí?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Por los impuestos, muchacho. Mi cobertizo estaba tan vacío como mi estómago, y no pude pagar.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //Un día llegaron los soldados y me trajeron aquí. Pero esto no es peor que lo que había fuera. Al menos aquí no paso hambre.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //Siempre había pagado mis impuestos, toda mi vida. ¡Pero eso no bastó para ese hijo de perra de la corona!
};

// ************************************************************
// 						PERM (Forget)
// ************************************************************

INSTANCE DIA_Pock_ForgotAll (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_ForgotAll_Condition;
	information	= DIA_Pock_ForgotAll_Info;
	permanent	= 1;
	description	= "¿Todo va bien?";
};                       

FUNC INT DIA_Pock_ForgotAll_Condition()
{
	if (Pock_ForgetAll == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_ForgotAll_Info()
{	
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //¿Todo va bien?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //Me alegro de ver una cara nueva.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //¡Espera! Hablamos antes.
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //¡No! No puede ser. No te he visto en mi vida.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Claro...
};

