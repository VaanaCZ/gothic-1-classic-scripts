// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "¿Qué estás haciendo aquí?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //¿Qué estáis haciendo aquí?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Estamos recogiendo hierba del pantano para que nuestros hermanos la procesen de modo que pueda ser fumada más tarde.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Es muy peligroso recogerla en el pantano, pero sólo crece allí. En realidad, eso es bueno.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //¿Por qué?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Porque entonces los otros dos campamentos no pueden obtenerla. Somos los únicos que pueden recoger hierba del pantano en toda la colonia.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Podemos vendérsela a los otros dos campamentos y somos nosotros quienes fijamos el precio.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Me manda Baal Orun. Voy a llevar toda la cosecha a Kalom.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Vengo de parte de Baal Orun. Tengo que llevarle toda la cosecha a Kalorn.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //¿Es que te crees que es así de fácil?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Cualquiera podría decir eso. 'Vengo de parte de Baal Orun' y ¡zas! Adiós a toda la hierba.
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"¡Ve a preguntarle si no me crees!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"¡Pero es verdad que me manda Baal Orun!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Pero, ¡de verdad que vengo de parte de Baal Orun!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Sí, claro.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //¡Vete a verle si no me crees!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Tengo una idea mejor. ¡Demuestra tu lealtad haciendo una pequeña tarea para nosotros!
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "¿Y qué quieres que haga?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //¿Y qué es lo que quieres que haga?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //La verdad es que es poca cosa. Trabajar en el pantano es un poco arriesgado y además están esas malditas moscas de sangre.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //¡El trabajo sería mucho más fácil sin ellas! ¿Me entiendes?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran sólo me dará la hierba del pantano cuando haya matado a todas las moscas de sangre en un radio de 20 pasos.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "No veo más moscas de sangre por ninguna parte.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //No veo moscas de sangre por ninguna parte.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //¡Pero hay algunos insectos más a menos de veinte pasos!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //¡No vas a librarte tan fácilmente!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //No hay más insectos a la vista. ¡Has hecho un buen trabajo!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //¡Alguien que trabaja así de bien o está de nuestro lado o es un idiota!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Un idiota sería demasiado estúpido como para engañarme, ¿verdad?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Aquí tienes la cosecha; llévasela a Cor Kalorn.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Si tiene alguna queja y dice que no es suficiente, dile que mueva el culo y venga aquí para que se haga una idea de lo duro que es este trabajo.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran me ha dado la segunda mitad de la cosecha de hoy de hierba del pantano. Veamos si Cor Kalom está satisfecho con la cantidad.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran me ha dado la cosecha de hoy de hierba del pantano. No parece mucho. Quizá haya un segundo grupo de cosechadores.");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "¿Cómo va la recolección?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //¿Cómo va la cosecha?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Sí, sí, búrlate de mí. Seguro que los Gurús te dan trabajos mejores.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Bueno, por lo menos yo no tengo que hacer el trabajo sucio. Eso lo hace la 'infantería'. Je, je.
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "De nuevo voy a llevar todas las hierbas a Cor Kalom.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Tengo que volver a llevarle toda la hierba a Cor Kalorn.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //¿Otra vez?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Ahora no irás a pedirme que te libre de los tiburones de la ciénaga, ¿verdad? De verdad que no dispongo de mucho tiempo.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //¡Vale, vale! ¡Aquí tienes las malditas hierbas; llévatelas!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








