// *************************************************************************
// 									FIND NPC
// *************************************************************************

INSTANCE Info_FindNPC_NC(C_INFO)
{
	nr			= 900;
	condition	= Info_FindNPC_NC_Condition;
	information	= Info_FindNPC_NC_Info;
	permanent	= 1;
	description = "Где я могу найти...";
};                       

FUNC INT Info_FindNPC_NC_Condition()
{
	return 1;
};

FUNC VOID Info_FindNPC_NC_Info()
{
	Info_ClearChoices(Info_FindNPC_NC);
	Info_AddChoice(Info_FindNPC_NC, DIALOG_BACK, Info_FindNPC_NC_BACK);

	VAR C_NPC Cronos;		Cronos = Hlp_GetNpc(KdW_604_Cronos);
	if (Cronos.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC,"...одного из магов?", Info_FindNPC_NC_Mage);
	};
	
	VAR C_NPC Gorn;		Gorn = Hlp_GetNpc(PC_Fighter);
	if (Gorn.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC,"...Горна?", Info_FindNPC_NC_Gorn);
	};

	VAR C_NPC Lares;		Lares = Hlp_GetNpc(Org_801_Lares);
	if (Lares.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC,"...Ларса?", Info_FindNPC_NC_Lares);
	};
	
	VAR C_NPC Lee;			Lee	= Hlp_GetNpc(Sld_700_Lee);
	if (Lee.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC,"...Ли?", Info_FindNPC_NC_Lee);
	};
};

FUNC VOID Info_FindNPC_NC_BACK()
{
	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 			Gorn
// **********************

FUNC VOID Info_FindNPC_NC_Gorn()
{
	AI_Output(other,self,"Info_FindNPC_NC_Gorn_15_00"); //Где я могу найти Горна?

	VAR C_NPC Gorn;		Gorn = Hlp_GetNpc(PC_Fighter);
	
	if (Npc_GetDistToNpc(self, Gorn) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Gorn);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_06_01"); //Когда зайдешь в пещеру, держись правой стороны. Там будет несколько домиков. Он живет в одном из них.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_07_01"); //Когда зайдешь в пещеру, держись правой стороны. Там будет несколько домиков. Он живет в одном из них.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_13_01"); //Когда зайдешь в пещеру, держись правой стороны. Там будет несколько домиков. Он живет в одном из них.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_08_01"); //Когда зайдешь в пещеру, держись правой стороны. Там будет несколько домиков. Он живет в одном из них.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_11_01"); //Когда зайдешь в пещеру, держись правой стороны. Там будет несколько домиков. Он живет в одном из них.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 			Lares
// **********************

FUNC VOID Info_FindNPC_NC_Lares()
{
	AI_Output(other,self,"Info_FindNPC_NC_Lares_15_00"); //Где я могу найти Ларса?

	VAR C_NPC Lares;		Lares = Hlp_GetNpc(Org_801_Lares);
	
	if (Npc_GetDistToNpc(self, Lares) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Lares);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_06_01"); //С левой стороны большой пещеры, в дальнем конце. Ты не промахнешься. Как только тебя остановят, считай, ты нашел его.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_07_01"); //С левой стороны большой пещеры, в дальнем конце. Ты не промахнешься. Как только тебя остановят, считай, ты нашел его.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_13_01"); //С левой стороны большой пещеры, в дальнем конце. Ты не промахнешься. Как только тебя остановят, считай, ты нашел его.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_08_01"); //С левой стороны большой пещеры, в дальнем конце. Ты не промахнешься. Как только тебя остановят, считай, ты нашел его.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_11_01"); //С левой стороны большой пещеры, в дальнем конце. Ты не промахнешься. Как только тебя остановят, считай, ты нашел его.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 		Lee
// **********************

FUNC VOID Info_FindNPC_NC_Lee()
{
	AI_Output(other,self,"Info_FindNPC_NC_Lee_15_00"); //Где я могу найти Ли?

	VAR C_NPC Lee;		Lee = Hlp_GetNpc(Sld_700_Lee);
	
	if (Npc_GetDistToNpc(self, Lee) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Lee);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_06_01"); //Иди в большую пещеру, держись правой стороны и поднимайся наверх.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_07_01"); //Иди в большую пещеру, держись правой стороны и поднимайся наверх.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_13_01"); //Иди в большую пещеру, держись правой стороны и поднимайся наверх.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_08_01"); //Иди в большую пещеру, держись правой стороны и поднимайся наверх.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_11_01"); //Иди в большую пещеру, держись правой стороны и поднимайся наверх.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 		Magier (Cronos)
// **********************

FUNC VOID Info_FindNPC_NC_Mage()
{
	AI_Output(other,self,"Info_FindNPC_NC_Cronos_15_00"); //Где я могу найти мага?

	VAR C_NPC Cronos;		Cronos = Hlp_GetNpc(KdW_604_Cronos);
	
	if (Npc_GetDistToNpc(self, Cronos) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Cronos);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_06_01"); //Они живут в отдельной части пещеры, на самом верху. Но иногда их можно увидеть возле железной горы посередине пещеры.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_07_01"); //Они живут в отдельной части пещеры, на самом верху. Но иногда их можно увидеть возле железной горы посередине пещеры.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_13_01"); //Они живут в отдельной части пещеры, на самом верху. Но иногда их можно увидеть возле железной горы посередине пещеры.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_08_01"); //Они живут в отдельной части пещеры, на самом верху. Но иногда их можно увидеть возле железной горы посередине пещеры.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_11_01"); //Они живут в отдельной части пещеры, на самом верху. Но иногда их можно увидеть возле железной горы посередине пещеры.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};




// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

FUNC VOID B_AssignFindNpc_NC (VAR C_NPC slf)
{
	Info_FindNPC_NC.npc = Hlp_GetInstanceID(slf);
};
