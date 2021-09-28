// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"�Qui�n eres?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //�Qui�n eres?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Yo soy Nefarius. Mago del C�rculo del Agua.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"�D�nde puedo encontrar a Saturas?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //�D�nde puedo encontrar a Saturas?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Atraviesa el gran portal circular. All� le encontrar�s.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"�Me gustar�a convertirme en Mago del C�rculo del Agua!";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //�Me gustar�a convertirme en Mago del C�rculo del Agua!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //(Se r�e) �No tan deprisa, muchacho!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Para que permitamos que un muchacho se una a nosotros, primero tiene que haber hecho algo grande.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //Y tiene que habernos servido durante alg�n tiempo.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Si vas totalmente en serio, deber�as unirte a nuestros mercenarios. As� podr�s servirnos.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //Y tal vez un d�a se te conceda la oportunidad de hacer algo grande.
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"�Estoy listo para el C�rculo del Agua?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //�Estoy preparado para el C�rculo del Agua?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //�nete a nuestros mercenarios y ya veremos.
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Ya veo que te has unido a nuestros mercenarios. Excelente, excelente.
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //El tiempo har� el resto.
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //�Hay alguna noticia de nuestros amigos del Campamento Viejo?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //�G�mez ha hecho asesinar a todos los Magos del Fuego!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //�No! �El muy cretino! �Ya le dije a Corristo que no era de fiar! �Debes informar de ello a Saturas!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //�Espera!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Te has enfrentado a grandes peligros en nuestro nombre.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Creo que ya est�s preparado para vestir la t�nica de un Mago del Agua.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //�Pero ahora ve a hablar con Saturas! �Date prisa!
	};
	AI_StopProcessInfos	(self);
};
