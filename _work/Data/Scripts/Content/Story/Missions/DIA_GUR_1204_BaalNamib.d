// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE DIA_BaalNamib_EXIT(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 999;
	condition		= DIA_BaalNamib_EXIT_Condition;
	information		= DIA_BaalNamib_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalNamib_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger) 
// ************************************************************
// ************************************************************

INSTANCE DIA_BaalNamib_NoTalk(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 1;
	condition		= DIA_BaalNamib_NoTalk_Condition;
	information		= DIA_BaalNamib_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalNamib_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalNamib_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalNamib_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalNamib_NoTalk);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,DIALOG_ENDE					,DIA_BaalNamib_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"¿Va todo bien, amigo?",DIA_BaalNamib_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"¡Que el Durmiente te acompañe!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalNamib_NoTalk,"¡Hola! ¡Soy nuevo!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //¡Hola! ¡Soy nuevo aquí!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Hi_02_01"); //[Suspiro]
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //¡Que el Durmiente sea contigo!
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Sleeper_02_01"); //[Suspiro]
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //¿Hay algún problema, amigo?
	AI_Output (self, other,"DIA_BaalNamib_NoTalk_Imp_02_01"); //[Suspiro]
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					BN spricht dich an
// ************************************************************

INSTANCE DIA_BaalNamib_FirstTalk(C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	nr				= 1;
	condition		= DIA_BaalNamib_FirstTalk_Condition;
	information		= DIA_BaalNamib_FirstTalk_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT DIA_BaalNamib_FirstTalk_Condition()
{
	if (BaalNamib_Ansprechbar==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalNamib_FirstTalk_Info()
{	
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_00"); //[Suspiro]
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_01"); //El Durmiente te ha elegido. ¿Estás seguro de querer unirte a nosotros?

	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"NO DECIR NADA.",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice 		(DIA_BaalNamib_FirstTalk,"¡Sí, quiero adorar al Durmiente!",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output (other, self,"DIA_BaalNamib_FirstTalk_Mute_15_00"); //[Suspiro]
	AI_Output (self, other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //¿Y bien?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output 			(other, self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //¡Sí, quiero seguir al Durmiente!
	AI_Output 			(self, other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //Ve a ver a Cor Kalorn. ¡Dile que te envío porque eres un verdadero defensor de la fe!
	Info_ClearChoices 	(DIA_BaalNamib_FirstTalk);

	B_LogEntry			(CH1_JoinPsi,"La actuación de Lester ha salido bien. Baal Namib ha hablado conmigo, y está convencido de que ahora soy un verdadero creyente. Ahora, ¡se supone que debo ver al Gurú Cor Kalom en su laboratorio de alquimia!");
	B_GiveXP			(XP_ImpressBaalNamib);
};

//-----------------------------------------------------
// BESSERE RÜSTUNG NOVIZEN
//-----------------------------------------------------
instance  GUR_1204_BaalNamib_ARMOR (C_INFO)
{
	npc				= GUR_1204_BaalNamib;
	condition		= GUR_1204_BaalNamib_ARMOR_Condition;
	information		= GUR_1204_BaalNamib_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Me gustaría tener una armadura mejor."; 
};

FUNC int  GUR_1204_BaalNamib_ARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NOV)
	&& (!Npc_HasItems (hero,NOV_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  GUR_1204_BaalNamib_ARMOR_Info()
{
	AI_Output (hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//Preferiría tener una armadura mejor.
	
	if (Kapitel < 3)
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");//Todavía no te ha llegado el momento de llevar la armadura pesada de los novicios.
	}
	else if (Npc_HasItems (hero, ItMinugget) < VALUE_NOV_ARMOR_H )
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Vuelve cuando tengas mineral suficiente.
	}
	else
	{
		AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//¡Esta armadura protegerá tu cuerpo, del mismo modo que el Durmiente protege tu espíritu!
		CreateInvItem (self,NOV_ARMOR_H);
		B_GiveInvItems (self, hero, NOV_ARMOR_H, 1);
		B_GiveInvItems (hero, self, ItMinugget,VALUE_NOV_ARMOR_H);
	};
};  

////////////////////////////////////////
////////////////////////////////////////
/////////		Kap 2			////////
////////////////////////////////////////
////////////////////////////////////////

// **************************************************************************
//					BAAL NAMIB SCHICKT DEN SPIELER ZU YBERION 
// **************************************************************************
INSTANCE Info_BaalNamib_BROTHERHOOD (C_INFO)
{
	npc			= GUR_1204_BaalNamib;
	condition	= Info_BaalNamib_BROTHERHOOD_Condition;
	information	= Info_BaalNamib_BROTHERHOOD_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Puedo hacer algo por la Hermandad?";
};

FUNC INT Info_BaalNamib_BROTHERHOOD_Condition()
{
//	return (kapitel == 2) ;
};

FUNC VOID Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_15_01"); //¿Qué tareas puedo llevar a cabo en pro de la Hermandad?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Nuestro Maestro, el sabio Y'Berion, ha solicitado que le enviemos un novicio. Dado que ya eres un miembro de la comunidad, acude a su presencia  y ofrécele tus servicios. 
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"De acuerdo, iré a verlo ahora mismo.",Info_BaalNamib_BROTHERHOOD_OK);
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"¿Dónde puedo encontrar a Y'Berion?",Info_BaalNamib_BROTHERHOOD_YBWO);  
	Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"¿Sabes lo que Y'Berion quiere que haga?",Info_BaalNamib_BROTHERHOOD_YBWAS);
	var C_NPC Kalom;
	Kalom = Hlp_GetNpc (GUR_1201_CORKALOM); 
	Npc_ExchangeRoutine (Kalom,"kapitel2");
	AI_ContinueRoutine (Kalom);
};
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //¿Dónde puedo encontrar a Y'Berion?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Está en el interior de la colina del templo. Como siempre.

};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //¿Sabes qué es lo que Y'Berion quiere que haga?
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Va a tener lugar una gran invocación. Pero para que pueda dar comienzo, necesitamos un objeto mágico. 
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion busca hombres con el coraje suficiente para que le consigan el artefacto.
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //Parece fácil
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Si fuera fácil, ya tendríamos el objeto. Habla primero con Y'Berion. Él te lo explicará.
};	
FUNC VOID Info_BaalNamib_BROTHERHOOD_OK()
{
	AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //De acuerdo, iré a verle de inmediato.
	AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Que el Durmiente te proteja.
	Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
};	
