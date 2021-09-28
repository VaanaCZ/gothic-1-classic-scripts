// **************************************************
//						 EXIT 
// **************************************************

instance Info_GorHanis_Exit (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 999;
	condition		= Info_GorHanis_Exit_Condition;
	information		= Info_GorHanis_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_GorHanis_Exit_Condition()
{
	return 1;
};

func VOID Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "�Qu� est�s haciendo aqu�?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
	return 1;
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //�Yo? �Estoy luchando por la gloria del Durmiente!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 1;
	description 	= "�Luchas en la arena?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena_15_00"); //�Luchas en la arena?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Mis amos me enviaron aqu� desde el pantano para luchar por el Durmiente.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //�Lucho aqu� por su mayor gloria, para que todos los infieles puedan ver lo fuerte que me ha hecho su poder!
};

// **************************************************
//					Schl�fer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "�Qu� es el Durmiente?";
};                       

FUNC INT Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Sleeper_Info()
{
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //�Qu� es el Durmiente?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //En nuestro campamento encontrar�s sacerdotes que podr�n responder mejor a esa pregunta.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Pero te dir� algo: el Durmiente es nuestro redentor; �l nos ha guiado hasta este lugar y �l nos sacar� de aqu�.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //�Quieres decir que est�s esperando a que tu dios te libere?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //�S�! Y la espera pronto llegar� a su fin. En estos momentos se est� preparando una gran invocaci�n.
};

// **************************************************
//					Gro�e Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "�Qu� tipo de invocaci�n ten�is planeada?";
};                       

FUNC INT Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Summoning_Info()
{
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //�Qu� clase de invocaci�n est�is preparando?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //�Nuestros profetas dicen que la invocaci�n com�n del Durmiente es la llave de la libertad!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Si quieres saber m�s acerca de ello, ven a nuestro campamento.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 0;
	condition		= Info_GorHanis_WayToST_Condition;
	information		= Info_GorHanis_WayToST_Info;
	permanent		= 1;
	description 	= "�Podr�as indicarme c�mo se va a tu campamento?";
};                       

FUNC INT Info_GorHanis_WayToST_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning) )
	{
		return 1;
	};
};

func VOID Info_GorHanis_WayToST_Info()
{
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //�Podr�as decirme c�mo llegar a vuestro campamento?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //Aqu� en el Campamento Viejo siempre hay novicios dispuestos a acompa�ar a reci�n llegados como t� hasta nuestro campamento. �No tienes m�s que hablar con ellos!
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_Charge_Condition;
	information		= Info_GorHanis_Charge_Info;
	permanent		= 0;
	description 	= "�Te desaf�o a un duelo en la arena!";
};                       

FUNC INT Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Charge_Info()
{
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //�Te desaf�o a un duelo en la arena!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //No servir� a la gloria del Durmiente si masacro a un vagabundo cualquiera delante del p�blico.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //S�lo me enfrentar� a ti cuando te hayas convertido en un oponente digno.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Pero estoy seguro de que no todos los guerreros del Campamento Viejo o del Nuevo tienen tantos principios.�
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_ChargeGood_Condition;
	information		= Info_GorHanis_ChargeGood_Info;
	permanent		= 1;
	description 	= "�Soy ya lo bastante fuerte para luchar contigo?";
};                       

FUNC INT Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func VOID Info_GorHanis_ChargeGood_Info()
{
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //�Soy ya lo suficientemente fuerte como para enfrentarme a ti?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //�No! �Tu fuerza es insuficiente; no eres un oponente digno de m�!
};























/*

// infos 
instance Info_TPL_1422_GorHanis (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis_Condition;
	information		= Info_TPL_1422_GorHanis_Info;
	important			= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1422_GorHanis_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_PC_Mage_LoadSword3 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis_Info()
{
	AI_Output (self, other,"Info_TPL_1422_GorHanis_08_01"); //Was machst du hier?
};


instance Info_TPL_1422_GorHanis1 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis1_Condition;
	information		= Info_TPL_1422_GorHanis1_Info;
	important			= 0;
	permanent		= 0;
	description		= "Ich will helfen den Schl�fer zu erwecken."; 
};

FUNC int Info_TPL_1422_GorHanis1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis1_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis1_15_01"); //Ich will helfen den Schl�fer zu erwecken.
	AI_Output (self, other,"Info_TPL_1422_GorHanis1_08_02"); //Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du l�gst, wird der Hohenpriester dir schon eine Lektion erteilen.
};



instance Info_TPL_1422_GorHanis2 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis2_Condition;
	information		= Info_TPL_1422_GorHanis2_Info;
	important			= 0;
	permanent		= 0;
	description		= "Das geht dich nichts an!"; 
};

FUNC int Info_TPL_1422_GorHanis2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis2_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis2_15_01"); //Das geht dich nichts an!
	AI_Output (self, other,"Info_TPL_1422_GorHanis2_08_02"); //Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen. 
};


instance Info_TPL_1422_GorHanis3 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis3_Condition;
	information		= Info_TPL_1422_GorHanis3_Info;
	important			= 0;
	permanent		= 0;
	description		= "Wie seit ihr an dem Priester vorbei gekommen?"; 
};

FUNC int Info_TPL_1422_GorHanis3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis2 )) || ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis1 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis3_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis3_15_01"); //Wie seit ihr an dem Priester vorbei gekommen?
	AI_Output (self, other,"Info_TPL_1422_GorHanis3_08_02"); //Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit im gesprochen hat, dass Gl�ck wirst du nicht haben. Geh nur (lacht).
};

*/
