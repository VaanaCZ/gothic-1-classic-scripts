
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Por aqu� debe haber un nido de reptadores de la mina."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Debe haber un nido de reptadores de las minas por aqu�.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //�Toda la maldita monta�a es un enorme nido de reptadores!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //�Por qu� has cerrado este pozo?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Daba igual cu�ntos reptadores mat�bamos, porque segu�an viniendo m�s y m�s.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Parece que debe haber un nido cerca. �D�jame abrir la puerta!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //�No! �Esta puerta s�lo puede abrirse con permiso de Ian! No haremos nada antes.
	
	B_LogEntry		(CH2_MCEggs,"Asghan, el jefe de los guardias de la mina, no abrir� la puerta, pues quiere el permiso de Ian.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Oye Asghan, ya puedes abrir la puerta."; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Oye Asghan, ya puedes abrir la puerta.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Ya te lo he dicho: s�lo si Ian...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Todo va a ir bien... y saludos de Ian.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Bueno, si Ian se responsabiliza de esto... �pero s�lo con una condici�n!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //�Con qu� condici�n?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Tr�eme a dos o tres templarios a modo de refuerzos; �no quiero estar s�lo cuando los reptadores salgan del pozo!
	
	B_LogEntry		(CH2_MCEggs,"Aunque Ian ha dado su permiso, Asghan no me abrir� la puerta hasta que haya reunido a algunos templarios como refuerzos frente a la entrada.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Se han hecho todos los preparativos. �Ya se puede abrir la puerta!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Se han hecho todos los preparativos. �Ya se puede abrir la puerta!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //De acuerdo, abre ya el pozo. Que empiece el espect�culo.
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"He logrado reunir a suficientes templarios frente a la puerta de Asghan. �Qu� nos aguardar� en la oscuridad que hay tras ella?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Los reptadores de la mina ya no deben suponer ninguna amenaza!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //�Los reptadores de las minas ya no deben suponer ninguna amenaza!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //�sas son buenas noticias. �Enviar� un mensajero a Thorus!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz l�uft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Qu� tal est�s?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Eh, �qu� tal est�s?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Vale... mientras que a nadie se le ocurra la idea de abrir la puerta, no tendr� que hacer da�o a nadie.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //�Qu� tiene de especial esta puerta?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Los reptadores de las minas. Los feroces reptadores de las minas. Los hay a montones.
};  



































