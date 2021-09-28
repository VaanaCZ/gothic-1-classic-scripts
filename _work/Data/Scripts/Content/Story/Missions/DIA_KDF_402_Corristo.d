instance  KDF_402_Corristo_Exit (C_INFO)
{
	npc			=  KDF_402_Corristo;
	nr			=  999;
	condition	=  KDF_402_Corristo_Exit_Condition;
	information	=  KDF_402_Corristo_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KDF_402_Corristo_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_402_Corristo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


// ************************ Intruder **************************

instance  Info_Corristo_Intruder (C_INFO)
{
	npc			=	KDF_402_Corristo;
	nr			=	1;
	condition	=	Info_Corristo_Intruder_Condition;
	information	=	Info_Corristo_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Corristo_Intruder_Condition()
{
	if	Npc_IsInState(self,ZS_Talk)
	&&	( (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

FUNC VOID  Info_Corristo_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //�Qu� est�s haciendo aqu�? �T� aqu� no pintas nada! �Largo!

	AI_StopProcessInfos	(self);
};






//--------------------------------------------------------------------------
// 							�BER DIE MAGIER
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_EXPLAINMAGE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINMAGE_Condition;
	information		= KDF_402_Corristo_EXPLAINMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dime qu� tal es ser mago."; 
};

FUNC int  KDF_402_Corristo_EXPLAINMAGE_Condition()
{	
	if (!Npc_KnowsInfo (hero,KDF_402_Corristo_WANNBEKDF))
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_EXPLAINMAGE_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Dime, �c�mo es eso de ser mago?
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Somos Magos del Fuego. Somos los servidores de Innos, el m�s grande de todos los dioses.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Nuestra magia es un regalo de los dioses. Hemos sido elegidos para ser sacerdotes, tutores y jueces.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Es un regalo que supone una constante carga para nosotros. Una tarea que define nuestras vidas.
};  
//--------------------------------------------------------------------------
// 							MAGIERAUFNAHME
//--------------------------------------------------------------------------
instance KDF_402_Corristo_WANNBEKDF (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_WANNBEKDF_Condition;
	information		= KDF_402_Corristo_WANNBEKDF_Info;
	important		= 0;
	permanent		= 1;
	description     = "Me gustar�a ingresar en el C�rculo m�gico.";
};

FUNC int  KDF_402_Corristo_WANNBEKDF_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_WANNBEKDF_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Me gustar�a entrar en el C�rculo m�gico.
	AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //As� que quieres convertirte en Mago del C�rculo de Fuego, �eh? Hm.

	
	if	(hero.level < 10)
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Todav�a no est�s preparado. Vuelve cuando hayas aprendido m�s.
		
		AI_StopProcessInfos	( self );
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Son muchos los que han querido unirse a nosotros, pero a lo largo de los a�os s�lo he tomado a uno de ellos como mi aprendiz. Todos los dem�s han fracasado.
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Tu esp�ritu est� maduro y est�s preparado para unirte a nosotros. Si quieres convertirte en mago, primero debo probarte. Av�same cuando est�s preparado para la prueba.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices (KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic	(GE_BecomeFiremage,	LOG_NOTE);
		B_LogEntry	(GE_BecomeFiremage,"Corristo me ha dicho que me permitir� unirme al c�rculo de los Magos del Fuego, pero no antes de haberme puesto a prueba.");
	};
};
//--------------------------------------------------------------------------
// 							DIE PROBE 
//-------------------------------------------------------------------------- 
instance  KDF_402_Corristo_KDFTEST (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KDFTEST_Condition;
	information		= KDF_402_Corristo_KDFTEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Estoy dispuesto a ello. Ponme a prueba."; 
};

FUNC int  KDF_402_Corristo_KDFTEST_Condition()
{	
	if (Corristo_KDFAufnahme == 1)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KDFTEST_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Estoy preparado. Ponme a prueba.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Espl�ndido. Has rendido un servicio a la Hermandad en los pantanos, �verdad?
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"S�.",KDF_402_Corristo_KDFTEST_JA); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"No.",KDF_402_Corristo_KDFTEST_NO); 

};  
FUNC VOID  KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //S�.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //�Cu�l es el nombre de nuestro dios?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos.",KDF_402_Corristo_KDFTEST_ADANOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"El Durmiente.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos",KDF_402_Corristo_KDFTEST_INNOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"G�mez",KDF_402_Corristo_KDFTEST_GOMEZ);
};

FUNC VOID  KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //No.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //No necesitamos a hombres que nieguen sus acciones.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Sirve como guerrero o cavador. El sendero de la magia siempre estar� cerrado para ti.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //Incorrecto. Puede que seas de alguna utilidad para la Guardia.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //El Durmiente.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Parece que has estado pasando demasiado tiempo entre los hermanos del pantano. Tal vez deber�as quedarte all�.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //�Cu�l es la mayor de las virtudes?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"El honor de un guerrero.",KDF_402_Corristo_KDFTEST_FIGHT); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Humildad ante la magia.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"La disciplina de un hombre.",KDF_402_Corristo_KDFTEST_DISZIPLIN); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Respeto reverencial por los dioses.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
FUNC VOID  KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //G�mez.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //�Creo que la Guardia es lo m�s indicado para ti! �Habla con Thorus!
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
//--------------------------------------------------------------------------
// 							DIE PROBE 3
//--------------------------------------------------------------------------
FUNC VOID  KDF_402_Corristo_KDFTEST_FIGHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //El honor de un guerrero.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //�Creo que la Guardia es lo m�s indicado para ti! �Habla con Thorus!
	AI_StopProcessInfos	( self );

};
FUNC VOID  KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Humildad frente a la magia.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Has contestado adecuada y correctamente. Te ense�ar� el arte de la magia.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //S�gueme hasta la Sala de la Magia, donde prestar�s el antiguo juramento.

	AI_StopProcessInfos	( self );
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
FUNC VOID  KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //La disciplina de un hombre.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Has contestado adecuada y correctamente. Te ense�ar� el arte de la magia.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //S�gueme hasta la Sala de la Magia, donde prestar�s el antiguo juramento.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();

};
FUNC VOID  KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Temor ante los dioses.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmmm.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Has contestado adecuada y correctamente. Te ense�ar� el arte de la magia.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //S�gueme hasta la Sala de la Magia, donde prestar�s el antiguo juramento.
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();
};
//--------------------------------------------------------------------------
// 							DAS AUFNAHMERITUAL
//--------------------------------------------------------------------------
instance KDF_402_Corristo_AUFNAHME (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_AUFNAHME_Condition;
	information		= KDF_402_Corristo_AUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_402_Corristo_AUFNAHME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"OCC_CHAPEL_UPSTAIRS") < 500)
	&& (Corristo_KDFAufnahme == 4)
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_AUFNAHME_Info()
{
	
	Corristo_KDFAufnahme = 5;
	B_Story_Feueraufnahme();
	AI_UnequipWeapons (hero); 
	AI_SetWalkmode (hero,NPC_WALK); 
	AI_GotoNpc (hero,self);
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Estamos reunidos aqu� para ordenar a un servidor del Fuego.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Ahora presta el juramento del Fuego.
	Snd_Play   ("howling_01");
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Juro por el poder de los dioses.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Juro por el poder de los dioses.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //Juro por la fuerza del Fuego sagrado.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //Juro por la fuerza del Fuego sagrado.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...que mi saber y mis actos ser�n uno con la llama de ahora en adelante y para siempre.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...que mi saber y mis actos ser�n uno con la llama de ahora en adelante y para siempre.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...hasta que mi cuerpo regrese al reino de Beliar y el fuego de mi alma se apague.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...hasta que mi cuerpo regrese al reino de Beliar y el fuego de mi alma se apague.
	AI_StopProcessInfos	( self );
};
instance KDF_402_Corristo_ROBE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_ROBE_Condition;
	information		= KDF_402_Corristo_ROBE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_402_Corristo_ROBE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_402_Corristo_AUFNAHME))
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_ROBE_Info()
{
	Snd_Play			("MFX_Heal_Cast"); 
	
	CreateInvItem		(hero,KDF_ARMOR_L);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_01"); //Al pronunciar las palabras del juramento has formado un v�nculo con el Fuego.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_02"); //Lleva esta t�nica como s�mbolo del v�nculo eterno.
	AI_StopProcessInfos	(self);
	AI_EquipBestArmor	(hero);
	AI_UnequipWeapons	(hero);
	Npc_SetTrueGuild	(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

	B_LogEntry		(GE_BecomeFiremage,"He superado la prueba y hecho el juramento del Fuego. A partir de ahora, �vestir� la t�nica roja del C�rculo del Fuego!");
	Log_CreateTopic	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Corristo puede ense�arme los C�RCULOS m�gicos e incrementar mi MANA. Se encuentra en la casa de los Magos del Fuego.");	
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_MANA (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_MANA_Condition;
	information		= KDF_402_Corristo_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Necesito m�s poder m�gico."; 
};

FUNC int  KDF_402_Corristo_MANA_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF) 
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_MANA_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_MANA_Info_15_01"); //Necesito m�s poder m�gico.
	AI_Output (self, other,"KDF_402_Corristo_MANA_Info_14_02"); //Puedo ayudarte a aumentar tu poder. El uso que hagas de �l es asunto tuyo.
	
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK	,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);
};  
func void KDF_402_Corristo_MANA_BACK()
{
	Info_ClearChoices	(KDF_402_Corristo_MANA);
};

func void KDF_402_Corristo_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK								,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);

};

func void KDF_402_Corristo_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK								,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);

};
//--------------------------------------------------------------------------
// 							ERL�UTERUNG DER KREISE
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_EXPLAINCIRCLES (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information		= KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important		= 0;
	permanent		= 0;
	description		= "Por favor, explica el significado de los C�rculos m�gicos."; 
};

FUNC int  KDF_402_Corristo_EXPLAINCIRCLES_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF) 
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_EXPLAINCIRCLES_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Por favor, expl�came el significado de los C�rculos m�gicos.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Por supuesto. Los C�rculos simbolizan tu parte de la magia.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Representan el conocimiento, la habilidad y el aprendizaje de nuevos conjuros m�gicos.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Debes pasar por cada C�rculo antes de poder unirte al siguiente.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Hacen falta muchas horas de estudio y necesitar�s mucha experiencia para alcanzar los C�rculos superiores.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Pero tus esfuerzos por alcanzarlos se ver�n recompensados cada vez con m�s y m�s poderosos conjuros. Sin embargo, los C�rculos de la magia son m�s que eso.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //Son parte de tu vida. Siempre estar�n contigo. Convi�rtelos en parte de ti.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Para comprender su poder necesitas primero reconocer el tuyo propio.
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS1 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS1_Condition;
	information		= KDF_402_Corristo_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDF_402_Corristo_KREIS1_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(Npc_KnowsInfo (hero,KDF_402_Corristo_EXPLAINCIRCLES))
	&&	(Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS1_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Estoy preparado para entrar en el Primer C�rculo.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Entrar en el primero de los C�rculos m�gicos conlleva el aprendizaje de la utilizaci�n de las runas m�gicas.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Cada runa contiene la estructura de un conjuro m�gico especial.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Al utilizar tus poderes m�gicos, podr�s ejecutar la magia de la runa.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_05"); //Pero, a diferencia de los pergaminos m�gicos, que tambi�n son f�rmulas m�gicas, el poder m�gico de la runa asegura la continuada integridad de la estructura del conjuro.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Cada runa es una fuente de poder al que puedes recurrir en cualquier momento.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Tu propio poder m�gico se agota al utilizar una runa, al igual que ocurre con un pergamino de conjuro.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_08"); //Con cada C�rculo al que accedas tambi�n ir�s aprendiendo a utilizar m�s runas.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Utiliza el poder de las runas para reconocerte a ti mismo.
		KDF_402_Corristo_KREIS1.permanent	= 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS2 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS2_Condition;
	information		= KDF_402_Corristo_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDF_402_Corristo_KREIS2_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS2_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Estoy listo para entrar en el Segundo C�rculo.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Has aprendido a utilizar las runas. Ahora llega el momento de profundizar en su comprensi�n.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Cuando accedas al Segundo C�rculo, aprender�s los fundamentos de los m�s potentes conjuros de batalla y, sobre todo, el secreto de la curaci�n.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Pero, si quieres reconocer los verdaderos secretos de la magia, has de aprender muchas cosas.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Sabes que puedes utilizar todas las runas con la frecuencia que quieras hasta que hayas agotado tus propios poderes.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Pero antes de actuar, piensa acerca del sentido de tus actos. Has obtenido poderes con los que puedes sembrar muerte y destrucci�n con gran facilidad.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Pero un verdadero mago s�lo utiliza la magia cuando es necesario.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Comprende la situaci�n y as� reconocer�s el poder de las runas.
		KDF_402_Corristo_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS3 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS3_Condition;
	information		= KDF_402_Corristo_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDF_402_Corristo_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	 
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS3_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS3_Info_15_01"); //�Puedes ense�arme el Tercer C�rculo?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_02"); //El Tercer C�rculo de la Magia es uno de los pasos m�s importantes de la vida de un mago. Una vez lo hayas alcanzado, habr�s dejado de ser un buscador.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Ya has llegado muy lejos en el sendero de la magia. Has aprendido el uso de las runas.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Este conocimiento constituye los cimientos de tu sendero posterior. Utiliza las runas de manera ponderada.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_05"); //Puedes utilizar una runa o no hacerlo. Pero debes escoger una de estas posibilidades.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_06"); //No dudes en utilizar tus poderes en cuanto hayas tomado una decisi�n.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Alcanza la compresi�n de tu sendero y entonces reconocer�s el poder de la decisi�n.
		KDF_402_Corristo_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS4 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS4_Condition;
	information		= KDF_402_Corristo_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDF_402_Corristo_KREIS4_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS4_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Estoy preparado para entrar en el Cuarto C�rculo.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Ya has completado los tres primeros C�rculos. Ha llegado la hora de que aprendas los secretos de la magia.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_03"); //La magia de las runas se basa en la piedra. Son piedras m�gicas, hechas de mineral m�gico.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Se trata del mismo mineral que se extrae en las minas. �ste es dotado de f�rmulas m�gicas en los templos, donde las runas son transformadas en instrumentos de nuestro poder.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_05"); //Con las runas que ya controlas, tienes a tu disposici�n todo el conocimiento de los templos del reino.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Ya has aprendido cuanto puedo ense�arte.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Alcanza la compresi�n de la magia y entonces descubrir�s el secreto del poder.
		KDF_402_Corristo_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE									
------------------------------------------------------------------------*/

instance  KDF_402_Corristo_HEAVYARMOR (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_HEAVYARMOR_Condition;
	information		= KDF_402_Corristo_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_CorristoHighRobe,VALUE_KDF_ARMOR_H); 
};

FUNC int  KDF_402_Corristo_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_HEAVYARMOR_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Maestro, me gustar�a llevar la Gran T�nica del Fuego.
	if (Kapitel < 3) 
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Todav�a no est�s preparado. Vuelve cuando hayas aprendido m�s.
		//AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems (hero,ItMinugget)< VALUE_KDF_ARMOR_H) 
	{ 
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //No tienes suficiente mineral.
	}	
	else
	{	
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Ha llegado la hora. Eres digno de llevar la Gran T�nica del Fuego.
		
		CreateInvItem		(hero,KDF_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		B_GiveInvItems      (hero, self, ItMinugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor	(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};
	
};  
