// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Czym się tutaj zajmujesz?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Jestem myśliwym. Utrzymuję się ze sprzedaży skór i kłów zabitych zwierząt.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Da się z tego wyżyć?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Jeśli potrafi się zręcznie oporządzać zwierzynę - tak, i to całkiem nieźle!

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Aidan, myśliwy mieszkający na drodze pomiędzy Starym a Nowym Obozem, może mnie nauczyć, jak patroszyć upolowaną zwierzynę.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Chciałbym się nauczyć oprawiać zwierzynę.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Chciałbym się nauczyć oprawiać zwierzynę.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //A co chcesz wiedzieć?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Usuwanie kłów (koszt: 1 punkt umiejętności, 50 bryłek rudy)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Ściąganie futer (koszt: 1 punkt umiejętności, 100 bryłek rudy)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Usuwanie pazurów (koszt: 1 punkt umiejętności, 50 bryłek rudy)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Skórowanie gadów (koszt: 1 punkt umiejętności, 100 bryłek rudy)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Nauczyłem cię już wszystkiego co sam wiem.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Jak mogę zdobyć kły upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiejętność: Zdobywanie kłów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Przede wszystkim musisz uważać, żeby kły nie popękały podczas wyciągania. W tym celu wbij nóż w pobliżu środka zęba i delikatnie go podważaj.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Warto zabierać kły wilków, cieniostworów i zębaczy
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność zdobywania kłów wilków, orkowych psów, zębaczy, kąsaczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak mogę zdobyć skóry upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nowa umiejętność: Ściąganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Zaczynaj skórowanie od zadu, przesuwając się stopniowo ku głowie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafią być bardzo cenne!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Futra wilków i cieniostworów można wykorzystać do szycia odzieży. Badając futro zabitego zwierza łatwo ocenisz, czy nadaje się do dalszego wykorzystania. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność ściągania futer z wilków, orkowych psów, cieniostworów i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiejętność: Zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Pokaż mi jak zdobyć pazury upolowanej zwierzyny.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Prawdę mówiąc to dziecinnie proste, trzeba tylko znać odpowiednią metodę. Wygnij pazury do przodu - nigdy do tyłu! I pod żadnym pozorem nie próbuj ich wyciągać!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Najlepiej pozyskiwać pazury jaszczurów. Od tej pory będziesz wiedział, które zwierzęta dostarczają dobrych pazurów.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność wyciągania pazurów jaszczurów, zębaczy, topielców, kąsaczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nowa umiejętność: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co powinienem zwracać uwagę zdzierając skórę z gadów?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Skóry topielców i bagiennych węży są szczególnie cenne.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Jeśli przetniesz skórę na bokach, powinna sama odejść od mięsa. Myślę, że od tej pory poradzisz już sobie ze skórowaniem gadów.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność skórowania jaszczurów i błotnych węży");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};
