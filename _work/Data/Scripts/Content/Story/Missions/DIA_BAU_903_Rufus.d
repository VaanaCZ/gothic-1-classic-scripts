// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Me manda Lefty. Os he traído un poco de agua.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Me manda Lefty. Os he traído un poco de agua.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Gracias, tío. ¡Mi boca es como un desierto!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //¡Agua! ¡Eh, tío! ¡No queda! No me digas que han bebido todos menos yo otra vez.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "¡Hola! Soy nuevo. Simplemente quería saber lo que sucede por aquí.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //¡Hola! Soy nuevo. Sólo quería saber lo que sucede por aquí.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Pregúntale a otro, ¿vale? No hago otra cosa que trabajar en los arrozales, y no sé nada.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Tío, ¡me encantaría decirle al Señor del Arroz que hiciera el trabajo sucio!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Si no te gusta, ¿por qué trabajas aquí?";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Si no te gusta, ¿por qué trabajas aquí?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //Sucedió el día que llegué aquí. Lefty, uno de los matones que trabaja para el Señor del Arroz, vino y me preguntó si podía echar una mano en los arrozales.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Claro, le dije. Era nuevo y quería resultar útil.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Al día siguiente, cuando estaba descansando un poco, el tipo volvió a aparecer.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //"""¿No querrás que tus colegas lo hagan todo solos, no?"" preguntó."
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Le dije que estaba agotado por la jornada anterior, y que necesitaba descansar. Pero no me escuchó.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Me agarró por el cuello y me arrastró de vuelta a los arrozales.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Desde aquel día, todos los días esperaba junto a mi puerta... hasta que me acostumbré a ir solo. No quería líos con estos tipos.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //Son asesinos, y será mejor que te apartes de ellos.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 1;
	description	= "¿Quién es el Señor del Arroz?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //¿Quién es el Señor del Arroz?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Fue uno de los primeros en llegar aquí. Ayudó a fundar el campamento y poner en marcha los arrozales.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //En la actualidad se limita a rondar el almacén hinchando su estómago, el muy cerdo.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
