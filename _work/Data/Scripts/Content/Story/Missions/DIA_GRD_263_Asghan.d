
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
	description		= "Por aquí debe haber un nido de reptadores de la mina."; 
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
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Debe haber un nido de reptadores de las minas por aquí.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //¡Toda la maldita montaña es un enorme nido de reptadores!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //¿Por qué has cerrado este pozo?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Daba igual cuántos reptadores matábamos, porque seguían viniendo más y más.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Parece que debe haber un nido cerca. ¡Déjame abrir la puerta!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //¡No! ¡Esta puerta sólo puede abrirse con permiso de Ian! No haremos nada antes.
	
	B_LogEntry		(CH2_MCEggs,"Asghan, el jefe de los guardias de la mina, no abrirá la puerta, pues quiere el permiso de Ian.");

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
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Ya te lo he dicho: sólo si Ian...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Todo va a ir bien... y saludos de Ian.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Bueno, si Ian se responsabiliza de esto... ¡pero sólo con una condición!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //¿Con qué condición?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Tráeme a dos o tres templarios a modo de refuerzos; ¡no quiero estar sólo cuando los reptadores salgan del pozo!
	
	B_LogEntry		(CH2_MCEggs,"Aunque Ian ha dado su permiso, Asghan no me abrirá la puerta hasta que haya reunido a algunos templarios como refuerzos frente a la entrada.");

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
	description		= "Se han hecho todos los preparativos. ¡Ya se puede abrir la puerta!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Se han hecho todos los preparativos. ¡Ya se puede abrir la puerta!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //De acuerdo, abre ya el pozo. Que empiece el espectáculo.
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"He logrado reunir a suficientes templarios frente a la puerta de Asghan. ¿Qué nos aguardará en la oscuridad que hay tras ella?");
		
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
	description		= "¡Los reptadores de la mina ya no deben suponer ninguna amenaza!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //¡Los reptadores de las minas ya no deben suponer ninguna amenaza!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Ésas son buenas noticias. ¡Enviaré un mensajero a Thorus!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz läuft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Qué tal estás?"; 
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
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Eh, ¿qué tal estás?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Vale... mientras que a nadie se le ocurra la idea de abrir la puerta, no tendré que hacer daño a nadie.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //¿Qué tiene de especial esta puerta?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Los reptadores de las minas. Los feroces reptadores de las minas. Los hay a montones.
};  



































