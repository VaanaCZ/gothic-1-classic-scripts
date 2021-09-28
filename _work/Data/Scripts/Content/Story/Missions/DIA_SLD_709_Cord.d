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
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //C�mo no. Pero tendr�s que pagar por ello. Quiero 30 pepitas.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Cord, el mercenario, puede ense�arme a combatir con ARMAS DE UNA MANO. Durante el d�a, se le puede encontrar en la meseta rocosa situada junto al lago.");
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
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //�Buena decisi�n! Antes de mejorar tu t�cnica, debes aprender la manera correcta de sostener el arma.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Los principiantes suelen sujetar las armas de una mano con ambos pu�os. Ser� mejor que no desarrolles este h�bito; no ser� m�s que un obst�culo.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Sujeta el arma con una mano, con la hoja hacia arriba y dale vueltas.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Tienes que hacer que el movimiento de tu arma est� en armon�a con tus propios movimientos. Eso dar� velocidad a tu ataque.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Si no olvidas lo que te he ense�ado, en el futuro tus combates ser�n m�s elegantes y mucho m�s veloces.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //Ah, una cosa m�s. �Algunos impactos infligen m�s da�o que otros! Al ser un principiante, no es probable que consigas dar un impacto definitivo.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Pero, cuanto m�s vayas progresando, mejor lo har�s.
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
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Ens��ame a manejar armas de una mano con mayor destreza.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Bueno, ya sabes lo fundamental. Si sostienes la espada un poco m�s abajo, podr�s darle m�s fuerza a tu primer mandoble.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Utiliza la inercia; �te acuerdas? Vale, ahora necesitas utilizar m�s tu cuerpo. Cuando hayas dado dos mandobles, haz un giro. Eso confundir� a tu oponente y te pondr� en una posici�n ventajosa.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Entonces desplaza tu espada de derecha a izquierda una vez m�s.
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //Y vuelta al frente. No te olvides de que la pr�ctica perfecciona. As� que ponte a ello y te convertir�s en un verdadero maestro en el arte de la lucha con armas de una mano.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //No tienes suficiente mineral.
	};
}; 
