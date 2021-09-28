//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Wasz zamek jest bardzo du¿y.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Wasz zamek jest bardzo du¿y.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Chyba ciê jeszcze tutaj nie widzia³em. Kim jesteœ?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Jestem tu nowy. Chcia³em siê trochê rozejrzeæ.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 10;
	description = "Mo¿esz mi opowiedzieæ o tym zamku?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Mo¿esz mi opowiedzieæ o tym zamku?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Co tu du¿o mówiæ: Gomez i jego ludzie zajêli go po wielkim buncie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Od pocz¹tku wiedzia³em, ¿e warto bêdzie stan¹æ po jego stronie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Wielu z nas, jeszcze jako wiêŸniowie zamkniêci w lochach lub zmuszani do pracy w kopalni, uznawa³o zwierzchnictwo Gomeza.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Czy te lochy znajduj¹ siê pod zamkiem?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Tak, ale teraz œwiec¹ pustk¹. Nikt tam nie schodzi³ od czasu wielkiego buntu.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "Jak wygl¹da ¿ycie stra¿nika?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jak wygl¹da ¿ycie stra¿nika?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Jest spokojne. Jesteœmy najwiêkszym i najsilniejszym obozem w kolonii. Nikt nie œmie nas zaczepiaæ.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Rozumiem.
	AI_StopProcessInfos	(self);
};

	














/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Dokona³eœ w³aœciwego wyboru. Spodoba ci siê bycie Stra¿nikiem!
	AI_StopProcessInfos	(self);
};
