// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Balor_Exit (C_INFO)
{
	npc			=  Nov_1304_Balor;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Balor_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Kraut abholen
// **************************************************
	var int Balor_BotenDay;
// **************************************************

instance  DIA_Balor_FetchWeed (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_FetchWeed_Condition;
	information	= DIA_Balor_FetchWeed_Info;
	permanent	= 0;
	description	= "Me manda Baal Orun. Voy a recoger toda la hierba del pantano.";
};                       

FUNC int  DIA_Balor_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Vengo de parte de Baal Orun. Tengo que llevarme toda la hierba del pantano.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Mejor. As� no tengo que llev�rsela yo. Aqu� la tienes.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //No te olvides de ir a ver a Viran en la otra punta del pantano, si es que no lo has hecho ya.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Si no, tu cargamento parecer� un poco escaso, y la gente podr�a pensar que vendiste la otra mitad. Je, je, je.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor me ha dado la cosecha de hoy de hierba del pantano para Cor Kalom.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"Seg�n Balor, hay un segundo grupo de cosechadores trabajando al otro lado del pantano. Dado que no tengo permiso para preguntar nada a Baal Orun, debo recorrer el pantano en busca del segundo grupo, me guste o no."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verh�kern?
// **************************************************
	var int Balor_PlayerCheating;
// **************************************************

instance  DIA_Balor_SellUnder (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_SellUnder_Condition;
	information	= DIA_Balor_SellUnder_Info;
	permanent	= 0;
	description	= "En cualquier caso, �a qui�n podr�a vender las hierbas?";
};                       

FUNC int  DIA_Balor_SellUnder_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_SellUnder_Info()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //�Y a qui�n iba a venderle yo las hierbas?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //�Oh, oh! Ahora te he dado ideas, �eh?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Olv�dalo, s�lo era una idea.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Si conoces a alguien, podemos ir a medias.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"No... Dime... �qui�n?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Olv�dalo, no era m�s que una idea.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Si sabes de alguien, podemos ir a medias.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Bueno, puede que yo conozca a alguien en el Campamento Nuevo que estar�a interesado en las hierbas.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //�Pero si te pillan los Gur�s, te echar�n a los tiburones de la ci�naga! Yo no s� nada, �vale?
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //No; dime qui�n es.
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //�Tienes algo en mente! �Te digo que si la mercanc�a no le llega a Cor Kalorn, estaremos metidos hasta el cuello en problemas!
};

// **************************************************
//				Name des Dealers
// **************************************************
	var int Balor_TellsNCDealer;
// **************************************************

instance  DIA_Balor_TellDealer (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_TellDealer_Condition;
	information	= DIA_Balor_TellDealer_Info;
	permanent	= 1;
	description	= "De acuerdo. �Qui�n es el comprador en el Campamento Nuevo?";
};                       

FUNC int  DIA_Balor_TellDealer_Condition()
{
	if ( (Balor_PlayerCheating==TRUE) && (Balor_TellsNCDealer==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_TellDealer_Info()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Vale; �qui�n es el comprador en el Campamento Nuevo?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //�Es que piensas que voy a darte el nombre para que te vayas corriendo con las hierbas? �No es as� como funcionan las cosas!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Quiero 50 pepitas por adelantado. Luego, ya veremos.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Olv�dalo.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"La mitad es lo justo. Aqu� tienes.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50 me parece bien. Aqu� las tienes.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Muy bien... Mira, su nombre es Cipher. Probablemente podr�s encontrarle en la taberna del lago.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Ten cuidado y no te dejes enga�ar.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor ha mencionado a un hombre llamado Cipher al que le gustar�a comprar la cosecha de hierba del pantano. Puedo encontrarlo en la taberna del lago del Campamento Nuevo. Sin embargo, me meter�a en muchos problemas con los Gur�s.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher compra y vende todo tipo de bienes en la taberna del lago. Est� especialmente interesado en las entregas importantes de hierba del pantano.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //No veo mis 50 pepitas. Quiero 50 pepitas, ni una menos, �de acuerdo?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Olv�dalo.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //�No te creas que puedes entrar sencillamente en el Campamento Nuevo y vend�rselas a cualquiera! Si no sabes el nombre, no conseguir�s vend�rselas a nadie.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //A menos que dejes que alg�n bandido te pegue un buen porrazo en el colodrillo.
	Info_ClearChoices 	(DIA_Balor_TellDealer);
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Balor_RipOff (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 5;
	condition	= DIA_Balor_RipOff_Condition;
	information	= DIA_Balor_RipOff_Info;
	permanent	= 0;
	description	= "Voy a recoger la siguiente remesa para Cor Kalom.";
};                       

FUNC int  DIA_Balor_RipOff_Condition()
{
	if ( (Balor_BotenDay<=(Wld_GetDay()-2)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_RipOff_Info()
{
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //Soy yo de nuevo. Tengo que recoger el pr�ximo cargamento.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //�Claro! �Para venderlo otra vez en el Campamento Nuevo!
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Quiero 50 pepitas; el pago habitual por adelantado.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //�Otra vez t�? Bueno, aqu� lo tienes, pero no hagas ninguna estupidez, �entiendes?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //No ser�a capaz.
		CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
		B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
	};
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Balor_Perm (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_Perm_Condition;
	information	= DIA_Balor_Perm_Info;
	permanent	= 1;
	description	= "�Seguid esforz�ndoos en recoger!";
};                       

FUNC int  DIA_Balor_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_Perm_Info()
{
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //�T� sigue recogiendo!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //Pues claro, �qu� te crees que estoy haciendo? �Toc�ndome las pelotas?
};
