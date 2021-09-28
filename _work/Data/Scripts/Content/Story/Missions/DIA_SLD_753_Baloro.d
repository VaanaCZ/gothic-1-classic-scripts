//****************************************************
//	Typ der den SC an der Nase herum führt!
//****************************************************

//Variablen:
//--------------------------------------
var int SLD_753_Baloro_SC_choice;
var int SLD_753_Baloro_SC_wills_wissen;
var int SLD_753_Baloro_SC_besorgt_den_Kram;
//--------------------------------------





instance DIA_SLD_753_Baloro (C_INFO)
{
	npc				= SLD_753_Baloro;
	condition		= DIA_SLD_753_Baloro_Condition;
	information		= DIA_SLD_753_Baloro_Intro_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_753_Baloro_Condition()
{
	return 1;
};

func void DIA_SLD_753_Baloro_Intro_Info()
{
	AI_Output (self, other,"DIA_SLD_753_Baloro_Intro_08_01"); //¡Eh, tú! ¿Qué pasa?
};

// ********************** Was meinst du? *****************

instance DIA_SLD_753_Baloro_Wasmeinstdu (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Wasmeinstdu_Condition;
	information	= DIA_SLD_753_Baloro_Wasmeinstdu_Info;
	important	= 0;	
	permanent	= 0;
	description = "¡Hola!";
};                       

FUNC int DIA_SLD_753_Baloro_Wasmeinstdu_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_753_Baloro_Wasmeinstdu_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //¡Hola!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //¡Estás paseando por aquí como si anduvieras buscando algo!
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //¿De verdad? Mm, puede que tengas razón. ¿Por qué?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //¡Estupendo! ¡Pregúntame a mí! ¡Tal vez pueda ayudarte!


};

// ********************** Woran hast du dabei gedacht *****************

instance DIA_SLD_753_Baloro_Worumgehts (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Worumgehts_Condition;
	information	= DIA_SLD_753_Baloro_Worumgehts_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "¿Qué tienes pensado?";
};                       

FUNC int DIA_SLD_753_Baloro_Worumgehts_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))	&& (SLD_753_Baloro_SC_choice == 0) )
	{
	return 1;
	};
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //¿Qué tenías en mente?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //¿Qué es lo que necesitas?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //¿Qué hay de una buena espada, una armadura sólida o poder entrar en la mina?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //¡Ah, no! ¡Eso no es nada!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //¡Puedo darte algo que hará que se le salgan los ojos de las órbitas! ¡Puedo proporcionarte un arma que derrotará a cualquier enemigo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //Sólo tienes que hacerme un pequeño favor y será tuya. ¿Qué me dices?

	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Debo tenerlo.",DIA_SLD_753_Baloro_Worumgehts_ja);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"No me creo una sola palabra de lo que dice.",DIA_SLD_753_Baloro_Exit_Info);
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_ja()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //¿Qué tendré que hacer para conseguirla?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //¡Es muy sencillo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //¡Consígueme 5 manzanas, 2 botellas de aguardiente de arroz, 6 botellas de cerveza, 3 hogazas de pan, 2 trozos de queso y 2 racimos de uvas y asunto resuelto!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Puedes creerme si te digo que no te arrepentirás. Es como acabo de decirte; ¡con ella podrás derrotar a cualquier enemigo!
	
	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Debo tenerlo.",DIA_SLD_753_Baloro_Worumgehts_jaklar);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"El tipo se está cachondeando.",DIA_SLD_753_Baloro_Exit_Info);
};
	
FUNC VOID DIA_SLD_753_Baloro_Worumgehts_jaklar()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //¡De acuerdo! ¡Entonces voy a ver qué puedo hacer!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //¡Genial! ¡Pero date prisa!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //¡No te olvides: 5 manzanas, 2 botellas de aguardiente de arroz, 6 botellas de cerveza, 3 hogazas de pan, 2 trozos de queso y 2 racimos de uvas! ¿Vale?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //¡Por supuesto!
	
	
//********	Auftragannahme	**************************
	


	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_RUNNING ;
	
		
	Log_CreateTopic		(Baloros_Waffe,		LOG_MISSION);
	Log_SetTopicStatus	(Baloros_Waffe,		LOG_RUNNING);
	B_LogEntry			(Baloros_Waffe,		"Baloro ha prometido venderme un arma soberbia si le traigo 5 manzanas, 2 botellas de aguardiente de arroz, 5 botellas de cerveza, 3 barras de pan, 2 trozos de queso y 2 racimos de uvas."); 

	AI_StopProcessInfos	( self );
};
	



// ********************** Ich hab´s noch nicht dabei *****************	


instance DIA_SLD_753_Baloro_habsnichtdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsnichtdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsnichtdabei_Info;
	important	= 0;	
	permanent	= 1;
	description = "¡Todavía no he podido conseguirte lo tuyo!";
};                       

FUNC int DIA_SLD_753_Baloro_habsnichtdabei_Condition()
{
	if 	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)   
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsnichtdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //¡Todavía no he podido conseguirte tus cosas! ¿Me puedes decir otra vez qué eran? ¡Había tantas cosas distintas!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //¡Vale! Te lo repetiré despacio. Quiero que consigas...
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //¡5 manzanas, 2 botellas de aguardiente de arroz, 6 botellas de cerveza, 3 hogazas de pan, 2 trozos de queso y 2 racimos de uvas! ¿Lo has cogido esta vez?
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //¡Perfecto! ¡Claro! ¡Me daré prisa!

	AI_StopProcessInfos	( self );	
};


// ********************** Ich hab´s  dabei *****************	

instance DIA_SLD_753_Baloro_habsdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsdabei_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "¡Tengo todo el material!";
};                       

FUNC int DIA_SLD_753_Baloro_habsdabei_Condition()
{
	if (	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)      
		&&   (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Worumgehts))	
		&& (SLD_753_Baloro_SC_choice == 0) 
		&& (Npc_HasItems(other,ItFoApple)>=5)  
		&& (Npc_HasItems(other,ItFoBooze)>=2) 
		&& (Npc_HasItems(other,ItFoBeer)>=5) 
		&& (Npc_HasItems(other,ItFoLoaf)>=3) 
		&& (Npc_HasItems(other,ItFoCheese)>=2) 
		&& (Npc_HasItems(other,ItFo_wineberrys_01)>=2) )
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //¡Te lo traigo todo! Y ahora haremos el trato con la superarma esa, ¿no?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //¡Primero déjame ver las cosas!
	
	CreateInvItems(other, ItFoApple, 14);
	
	B_GiveInvItems(other, self, ItFoApple, 19); //Nötig für die Ausschrift "19 Itmes abgegeben", wird sofort angeglichen.
	
	Npc_RemoveInvItems ( other,ItFoBooze,2);
	Npc_RemoveInvItems ( other,ItFoBeer,5);
	Npc_RemoveInvItems ( other,ItFoLoaf,3);
	Npc_RemoveInvItems ( other,ItFoCheese,2);
	Npc_RemoveInvItems ( other,ItFo_wineberrys_01,2);
	
	Npc_RemoveInvItems ( self,ItFoApple,14);
	CreateInvItems	(self,ItFoBooze,2);
	CreateInvItems	(self,ItFoBeer,5);
	CreateInvItems	(self,ItFoLoaf,3);
	CreateInvItems	(self,ItFoCheese,2);
	CreateInvItems	(self,ItFo_wineberrys_01,2);

	
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //¡Aquí están!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //¡Sí, estupendo!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //¡Bueno, pues ahora dame el arma!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //¡Olvídalo!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //¿Cómo?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //¿De verdad pensabas que ibas a conseguir algo a cambio? ¡Si eres lo bastante idiota como para creértelo, te lo tienes merecido!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //¡Me asombra que sigas vivo! ¡Si te crees todo lo que te dice la gente, no vas a durar mucho aquí!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //¡Pero no importa! ¡Ahora tenemos suficientes provisiones para una fiesta! ¡Muchas gracias! Tal vez volvamos a encontrarnos. ¡Je, je, je!
	
	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_SUCCESS ;
	B_GiveXP (300);
	B_LogEntry			(Baloros_Waffe,		"¡Debería haber imaginado que no se podía confiar en este memo! No importa, ¡ya he aprendido la lección!"); 

	Log_SetTopicStatus	(Baloros_Waffe,		LOG_SUCCESS);
	
	AI_StopProcessInfos	( self );	
};


// **********************	EXIT\ Spieler will Rechenschaft	*****************	

instance DIA_SLD_753_Baloro_letztes_Wort (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_letztes_Wort_Condition;
	information	= DIA_SLD_753_Baloro_letztes_Wort_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "¡Eh, tío! ¡No puedes hacerme eso!";
	
};                       

FUNC int DIA_SLD_753_Baloro_letztes_Wort_Condition()
	{
		if (SLD_753_Baloro_SC_besorgt_den_Kram == LOG_SUCCESS)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_letztes_Wort_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //¡Eh, tío! ¡No puedes hacerme esto!
			AI_Output (self, other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //¿Qué más quieres? ¡Esfúmate! ¡Vete a incordiar a otro o te pego una tunda! ¿Entendido?
		
			SLD_753_Baloro_SC_wills_wissen = 1	;
			
			AI_StopProcessInfos	(self);	
		
		};



// **********************	EXIT\ Spieler will´s wissen	*****************	

instance DIA_SLD_753_Baloro_SC_wills_wissen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_SC_wills_wissen_Condition;
	information	= DIA_SLD_753_Baloro_SC_wills_wissen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "¡Me temo que voy a tener que darte un guantazo!";
	
};                       

FUNC int DIA_SLD_753_Baloro_SC_wills_wissen_Condition()
	{
		if (SLD_753_Baloro_SC_wills_wissen == 1)
		{
	
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Attack()
{
//	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

FUNC VOID DIA_SLD_753_Baloro_SC_wills_wissen_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //¡Me temo que voy a verme obligado a darte un mamporro!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //¡Ya te has divertido! ¡Ahora piérdete, tío!
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //¡Me parece que no me has entendido!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //¡Bueno, ya vale! ¡Tú lo has querido! ¡Estabas avisado!
	
	DIA_SLD_753_Baloro_Attack () ;
	
};




// **********************	EXIT	*****************	


instance DIA_SLD_753_Baloro_Exit (C_INFO)
{
	npc			= SLD_753_Baloro;
	nr			=999;
	condition	= DIA_SLD_753_Baloro_Exit_Condition;
	information	= DIA_SLD_753_Baloro_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= "Tengo que continuar.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Exit_Condition()
	{
		if    ((SLD_753_Baloro_SC_wills_wissen == 0)	&&  (SLD_753_Baloro_SC_besorgt_den_Kram == 0)    )
		{
		return 1;
		};
	};


FUNC VOID DIA_SLD_753_Baloro_Exit_Info()
{		
		
				if ( (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))  &&   (SLD_753_Baloro_SC_choice == 0)	)  
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //¡No, no! ¡Déjalo! ¡No me interesa!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //¡Bueno! ¡Como tú quieras! ¡Tuviste tu oportunidad!
						
						SLD_753_Baloro_SC_choice = 1 ;
					}
				else
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //¡Lo siento! ¡Desgraciadamente, no tengo tiempo para charlar!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //¡Oh, estás ocupado! ¡Ya nos veremos!
					};
			
	
	AI_StopProcessInfos	( self );
};


// **********************	EXIT\ wie war das mit deinem Angebot	*****************	

instance DIA_SLD_753_Baloro_Angebotdochannehmen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Angebotdochannehmen_Condition;
	information	= DIA_SLD_753_Baloro_Angebotdochannehmen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Me lo he pensado. Me gustaría que volviéramos a tu oferta.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Angebotdochannehmen_Condition()
	{
		if (SLD_753_Baloro_SC_choice == 1)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Angebotdochannehmen_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //He meditado sobre ello. Me gustaría volver a lo de tu oferta.
			AI_Output (self, other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //¡Demasiado tarde! ¡Tuviste tu oportunidad!
		
			
			AI_StopProcessInfos	(self);	
		
		};

