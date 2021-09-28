// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						TRAIN ANGEBOT								
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINOFFER (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINOFFER_Condition;
	information		= SLD_709_Cord_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Quiero mejorar mi manejo de las armas a una mano."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Quiero mejorar mi manejo de armas de una mano.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Cómo no. Pero tendrás que pagar por ello. Quiero 30 pepitas.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Cord, el mercenario, puede enseñarme a combatir con ARMAS DE UNA MANO. Durante el día, se le puede encontrar en la meseta rocosa situada junto al lago.");
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAIN_Condition;
	information		= SLD_709_Cord_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30); 
};

FUNC int  SLD_709_Cord_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 0)
	{
		return TRUE;
	};
};
FUNC void  SLD_709_Cord_TRAIN_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Quiero mejorar mi manejo de armas de una mano.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //¡Buena decisión! Antes de mejorar tu técnica, debes aprender la manera correcta de sostener el arma.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Los principiantes suelen sujetar las armas de una mano con ambos puños. Será mejor que no desarrolles este hábito; no será más que un obstáculo.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Sujeta el arma con una mano, con la hoja hacia arriba y dale vueltas.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Tienes que hacer que el movimiento de tu arma esté en armonía con tus propios movimientos. Eso dará velocidad a tu ataque.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Si no olvidas lo que te he enseñado, en el futuro tus combates serán más elegantes y mucho más veloces.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //Ah, una cosa más. ¡Algunos impactos infligen más daño que otros! Al ser un principiante, no es probable que consigas dar un impacto definitivo.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Pero, cuanto más vayas progresando, mejor lo harás.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //No tienes suficiente mineral.
	};
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINAGAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINAGAIN_Condition;
	information		= SLD_709_Cord_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50); 
};

FUNC int  SLD_709_Cord_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINAGAIN_Info()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Enséñame a manejar armas de una mano con mayor destreza.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Bueno, ya sabes lo fundamental. Si sostienes la espada un poco más abajo, podrás darle más fuerza a tu primer mandoble.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Utiliza la inercia; ¿te acuerdas? Vale, ahora necesitas utilizar más tu cuerpo. Cuando hayas dado dos mandobles, haz un giro. Eso confundirá a tu oponente y te pondrá en una posición ventajosa.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Entonces desplaza tu espada de derecha a izquierda una vez más.
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //Y vuelta al frente. No te olvides de que la práctica perfecciona. Así que ponte a ello y te convertirás en un verdadero maestro en el arte de la lucha con armas de una mano.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //No tienes suficiente mineral.
	};
}; 
