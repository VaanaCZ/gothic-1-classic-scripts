
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Widzę, że jesteś myśliwym.";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Widzę, że jesteś myśliwym.
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Na to wygląda... Czego chcesz?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Mógłbyś nauczyć mnie polować?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Parę sztuczek mógłbym ci pokazać, ale to będzie kosztować.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Ile dokładnie?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Na początek wystarczy łyk dobrego piwa, potem zobaczymy.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Proszę, oto piwo. Teraz opowiedz mi o polowaniu.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Proszę, oto piwo. Teraz opowiedz mi o polowaniu.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Ścierwojady - tak nazywamy te wielkie ptaszyska - należy atakować jeden po drugim. Na szczęście łatwo odciągnąć jednego osobnika od reszty stada.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Jeśli podejdziesz do nich zbyt blisko, zaczną się denerwować, aż wreszcie rzucą się w twoją stronę. Lepiej, żebyś w tej chwili miał broń w pogotowiu.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Jeśli uda ci się trafić ścierwojada zanim on dziobnie ciebie, jak najszybciej wyprowadź kolejne uderzenie. Przy odrobinie szczęścia uda ci się go pokonać bez zadraśnięcia.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //A jeśli ON dziobnie cię pierwszy... Cóż, lepiej, żeby nie dziobnął.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nie mam piwa.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //To poszukaj! To najlepsza rada, jaką otrzymasz ode mnie za darmo. A skoro już będziesz szukał, znajdź dla mnie jeszcze parę bryłek rudy.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Mogę ci wiele opowiedzieć o różnych zwierzakach, ale to cię będzie kosztowało.
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Drax może mnie nauczyć patroszenia zwierzyny, jeśli zapłacę cenę, której zażąda. Znajdę go na drodze pomiędzy Starym Obozem a miejscem wymiany.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Czego jeszcze możesz mnie nauczyć?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Czego jeszcze możesz mnie nauczyć?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Wielu rzeczy, ale głupie piwo nie wystarczy.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wprawny łowca potrafi zdobyć kły, pazury i skórę zwierzyny. Nie jest to łatwe, ale dość opłacalne.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //W każdym razie każdy kupiec chętnie je od ciebie odkupi.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Dużo żądasz za swoje usługi.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Usuwanie kłów (koszt: 1 punkt umiejętności, 50 bryłek rudy)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Ściąganie futer (koszt: 1 punkt umiejętności, 100 bryłek rudy)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Usuwanie pazurów (koszt: 1 punkt umiejętności, 50 bryłek rudy)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Skórowanie gadów (koszt: 1 punkt umiejętności, 100 bryłek rudy)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Powiedziałem ci już wszystko co wiem.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Dużo żądasz za swoje usługi.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Być może, ale wiedza, którą mogę ci przekazać pozwoli ci szybko odzyskać zainwestowaną kwotę.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Wszystkie zwierzęta, które zabijesz nie wiedząc jak je oprawić, po prostu zgniją.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //A to najzwyklejsze marnotrawstwo. Za ich skórę mógłbyś zarobić sporo pieniędzy.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Na twoim miejscu spróbowałbym możliwie szybko posiąść te umiejętności.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak mogę zdobyć kły upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiejętność: Zdobywanie kłów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Przede wszystkim musisz uważać, żeby kły nie popękały podczas wyciągania. W tym celu wbij nóż w pobliżu środka zęba i delikatnie go podważaj.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Warto zabierać kły wilków, cieniostworów i zębaczy
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność zdobywania kłów wilków, orkowych psów, zębaczy, kąsaczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak mogę zdobyć skóry upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Nowa umiejętność: Ściąganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Zaczynaj skórowanie od zadu, przesuwając się stopniowo ku głowie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafią być bardzo cenne!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Futra wilków i cieniostworów można wykorzystać do szycia odzieży. Badając futro zabitego zwierza łatwo ocenisz, czy nadaje się do dalszego wykorzystania. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność ściągania futer z wilków, orkowych psów, cieniostworów i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiejętność: Zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Pokaż mi jak zdobyć pazury upolowanej zwierzyny.
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Prawdę mówiąc to dziecinnie proste, trzeba tylko znać odpowiednią metodę. Wygnij pazury do przodu - nigdy do tyłu! I pod żadnym pozorem nie próbuj ich wyciągać!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Najlepiej pozyskiwać pazury jaszczurów. Od tej pory będziesz wiedział, które zwierzęta dostarczają dobrych pazurów.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność wyciągania pazurów jaszczurów, zębaczy, topielców, kąsaczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nowa umiejętność: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co powinienem zwracać uwagę zdzierając skórę z gadów?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Skóry topielców i bagiennych węży są szczególnie cenne.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Jeśli przetniesz skórę na bokach, powinna sama odejść od mięsa. Myślę, że od tej pory poradzisz już sobie ze skórowaniem gadów.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejętność skórowania jaszczurów i błotnych węży");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Musisz najpierw zdobyć trochę więcej doświadczenia. Inaczej moja wiedza będzie bezużyteczna.
			PrintScreen	("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Najpierw chcę zobaczyć trochę rudy. W tej kolonii nic nie ma za darmo!
	};
};
