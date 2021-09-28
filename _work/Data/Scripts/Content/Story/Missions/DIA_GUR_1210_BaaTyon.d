// **************************************************
//						EXIT
// **************************************************

instance  DIA_BaalTyon_Exit (C_INFO)
{
	npc			=  Gur_1210_BaalTyon;
	nr			=  999;
	condition	=  DIA_BaalTyon_Exit_Condition;
	information	=  DIA_BaalTyon_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTyon_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTyon_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger) 
// ************************************************************
	var int BaalTyon_Ansprechbar;
	var int BaalTyon_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalTyon_NoTalk(C_INFO)
{
	npc				= GUR_1210_BaalTyon;
	nr				= 1;
	condition		= DIA_BaalTyon_NoTalk_Condition;
	information		= DIA_BaalTyon_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalTyon_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalTyon_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTyon_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalTyon_NoTalk);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,DIALOG_ENDE					,DIA_BaalTyon_NoTalk_ENDE);
	if (Npc_HasItems(other,SpecialJoint)>=1)
	{
		info_AddChoice	(DIA_BaalTyon_NoTalk,"(Ofrecer llamada onírica preparada)",DIA_BaalTyon_SpecialJoint);
	};
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"¿Va todo bien, amigo?",DIA_BaalTyon_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"¡Que el Durmiente te acompañe!",DIA_BaalTyon_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"¡Hola! ¡Soy nuevo!",DIA_BaalTyon_NoTalk_Hi);
};

func void DIA_BaalTyon_NoTalk_Hi()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Hi_15_00"); //¡Hola! ¡Soy nuevo aquí!
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Hi_11_01"); //[Suspiro]
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Sleeper()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Sleeper_15_00"); //¡Que el Durmiente sea contigo!
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Sleeper_11_01"); //[Suspiro]
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Imp()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Imp_15_00"); //¿Hay algún problema, amigo?
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Imp_11_01"); //[Suspiro]
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

func void DIA_BaalTyon_SpecialJoint()
{
	AI_Output			(other, self,"DIA_BaalTyon_SpecialJoint_15_00"); //¡Tome, Maestro! Un modesto obsequio de su estudiante.
	AI_StopProcessInfos	(self);

	B_GiveInvItems	(hero, self, SpecialJoint, 1);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItem			(self, SpecialJoint);

	AI_Output			(self, other,"DIA_BaalTyon_SpecialJoint_11_01"); //Mmmmmm.

	BaalTyon_Ansprechbar = TRUE;
	Npc_SetRefuseTalk	(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE; //SN: Workaround, da in diese Situation das INVINCIBLE-Flag nicht automatisch gelöscht wird!
};

// **************************************************
//					Hatte Vision
// **************************************************

instance  DIA_BaalTyon_Vision (C_INFO)
{
	npc			=  Gur_1210_BaalTyon;
	nr			=  1;
	condition	=  DIA_BaalTyon_Vision_Condition;
	information	=  DIA_BaalTyon_Vision_Info;
	permanent	=  0;
	important	=  1;	
};                       

FUNC int  DIA_BaalTyon_Vision_Condition()
{
	if ( (BaalTyon_Ansprechbar==TRUE) && (Npc_RefuseTalk(self)==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTyon_Vision_Info()
{
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_00"); //¡En nombre del Durmiente! ¡He tenido una visión!
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_01"); //Ha sido increíble. He visto que tendremos un nuevo hermano, uno que no es como los que le precedieron.
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_02"); //Estaba haciéndonos algo... En su mano portaba una espada, y descendía por un ancho tramo de escaleras. En ese momento se acabó la visión.
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_03"); //Se parecía mucho a TI. ¿Quién eres? ¿Qué es lo que quieres?
	AI_Output			(other, self,"DIA_BaalTyon_Vision_15_04"); //No soy más que un modesto servidor del Durmiente.
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_05"); //Vete a ver a Cor Kalorn. Él se ocupará de ti.
	
	self.npctype 	=	NPCTYPE_MAIN;
	self.flags 		=	0;

	BaalTyon_Ansprechbar = FALSE;
	B_LogEntry			(CH1_JoinPsi,"Gracias a mi don especial, ¡Baal Tyon ha tenido una visión! ¡Ahora quiere que Cor Kalom se encargue de mí!");
	B_GiveXP			(XP_ImpressedBaalTyon);
	
	AI_StopProcessInfos	(self);
};


