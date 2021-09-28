// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "�Qu� tal?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //�C�mo van las cosas?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Eres nuevo aqu�, �verdad? Ser� mejor que sepas que no debes meterte en problemas con los guardias.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Cuando te pidan el dinero de la protecci�n, ser� mejor que se lo des; si no tendr�s a medio Campamento en tu contra.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //�Eh, t�! He o�do que no quieres pagarle dinero por protecci�n a Bloodwyn. �Es eso cierto?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //�Qu� es lo que quieres?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //�Prevenirte! Bloodwyn ha pagado a algunos tipos para que te liquiden.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //�Le he visto hablar con gente como Herek y Dios sabe a qui�n m�s ha contratado!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Tu aviso acerca de Herek llega un poco tarde.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Por lo que yo s�, tambi�n debe haber hablado con algunos m�s. As� que ten cuidado.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "�Por qu� me contaste la historia de Bloodwyn?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //�Por qu� me has contado lo de Bloodwyn?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Porque los favores pueden devolverse. Y no pareces ser alguien que no comprenda eso.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //Y, dado que yo te he hecho un favor, quiero darte la oportunidad de devolverlo.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"�Olv�dalo! �No te debo nada!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"�Qu� tienes pensado exactamente?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //�No te debo nada!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //�Oh! �Entonces, pi�rdete!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //�Qu� es exactamente lo que tienes en mente?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //No me queda nada de mineral y adem�s Bloodwyn tambi�n me ha esquilmado.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Ahora que te he ayudado, podr�as pagarle las 10 pepitas que le debo, �no? Dile que es de mi parte.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"�Que yo te pague? �Ni hablar!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Ver� lo que puedo hacer.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Ver� qu� puedo hacer.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //�Gracias, t�o! �Me has salvado el pellejo! Av�same cuando el asunto est� solucionado, por favor.
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //�Que yo pague por ti? �Ni hablar!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Parece que me equivocaba respecto a ti. En el futuro, no cuentes conmigo.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "�Pagu� a Bloodwyn!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //�He pagado a Bloodwyn!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //�De veras? �Genial! Ahora estamos en paz.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"�QUEEEEE�? �He gastado 10 pepitas en una pista que ya sab�a?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"S�. Hoy por ti, ma�ana por m�.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //�C�MO? �Me he gastado 10 pepitas en una pista que ya conoc�a?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Parece que s�...
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //S�. Favor por favor.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
