
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
	description = "Widzê, ¿e jesteœ myœliwym.";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Widzê, ¿e jesteœ myœliwym.
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Na to wygl¹da... Czego chcesz?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Móg³byœ nauczyæ mnie polowaæ?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Parê sztuczek móg³bym ci pokazaæ, ale to bêdzie kosztowaæ.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Ile dok³adnie?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Na pocz¹tek wystarczy ³yk dobrego piwa, potem zobaczymy.
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
	description = "Proszê, oto piwo. Teraz opowiedz mi o polowaniu.";
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
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Proszê, oto piwo. Teraz opowiedz mi o polowaniu.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Œcierwojady - tak nazywamy te wielkie ptaszyska - nale¿y atakowaæ jeden po drugim. Na szczêœcie ³atwo odci¹gn¹æ jednego osobnika od reszty stada.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Jeœli podejdziesz do nich zbyt blisko, zaczn¹ siê denerwowaæ, a¿ wreszcie rzuc¹ siê w twoj¹ stronê. Lepiej, ¿ebyœ w tej chwili mia³ broñ w pogotowiu.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Jeœli uda ci siê trafiæ œcierwojada zanim on dziobnie ciebie, jak najszybciej wyprowadŸ kolejne uderzenie. Przy odrobinie szczêœcia uda ci siê go pokonaæ bez zadraœniêcia.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //A jeœli ON dziobnie ciê pierwszy... Có¿, lepiej, ¿eby nie dziobn¹³.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nie mam piwa.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //To poszukaj! To najlepsza rada, jak¹ otrzymasz ode mnie za darmo. A skoro ju¿ bêdziesz szuka³, znajdŸ dla mnie jeszcze parê bry³ek rudy.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Mogê ci wiele opowiedzieæ o ró¿nych zwierzakach, ale to ciê bêdzie kosztowa³o.
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Drax mo¿e mnie nauczyæ patroszenia zwierzyny, jeœli zap³acê cenê, której za¿¹da. Znajdê go na drodze pomiêdzy Starym Obozem a miejscem wymiany.");
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
	description = "Czego jeszcze mo¿esz mnie nauczyæ?";
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
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Czego jeszcze mo¿esz mnie nauczyæ?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Wielu rzeczy, ale g³upie piwo nie wystarczy.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wprawny ³owca potrafi zdobyæ k³y, pazury i skórê zwierzyny. Nie jest to ³atwe, ale doœæ op³acalne.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //W ka¿dym razie ka¿dy kupiec chêtnie je od ciebie odkupi.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Du¿o ¿¹dasz za swoje us³ugi.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Usuwanie k³ów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Œci¹ganie futer (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Usuwanie pazurów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Skórowanie gadów (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Powiedzia³em ci ju¿ wszystko co wiem.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Du¿o ¿¹dasz za swoje us³ugi.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Byæ mo¿e, ale wiedza, któr¹ mogê ci przekazaæ pozwoli ci szybko odzyskaæ zainwestowan¹ kwotê.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Wszystkie zwierzêta, które zabijesz nie wiedz¹c jak je oprawiæ, po prostu zgnij¹.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //A to najzwyklejsze marnotrawstwo. Za ich skórê móg³byœ zarobiæ sporo pieniêdzy.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Na twoim miejscu spróbowa³bym mo¿liwie szybko posi¹œæ te umiejêtnoœci.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak mogê zdobyæ k³y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie k³ów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Przede wszystkim musisz uwa¿aæ, ¿eby k³y nie popêka³y podczas wyci¹gania. W tym celu wbij nó¿ w pobli¿u œrodka zêba i delikatnie go podwa¿aj.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Warto zabieraæ k³y wilków, cieniostworów i zêbaczy
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Najpierw chcê zobaczyæ trochê rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak mogê zdobyæ skóry upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Nowa umiejêtnoœæ: Œci¹ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Najpierw chcê zobaczyæ trochê rudy. W tej kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Poka¿ mi jak zdobyæ pazury upolowanej zwierzyny.
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Prawdê mówi¹c to dziecinnie proste, trzeba tylko znaæ odpowiedni¹ metodê. Wygnij pazury do przodu - nigdy do ty³u! I pod ¿adnym pozorem nie próbuj ich wyci¹gaæ!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Najlepiej pozyskiwaæ pazury jaszczurów. Od tej pory bêdziesz wiedzia³, które zwierzêta dostarczaj¹ dobrych pazurów.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Najpierw chcê zobaczyæ trochê rudy. W tej kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiejêtnoœæ: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co powinienem zwracaæ uwagê zdzieraj¹c skórê z gadów?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Najpierw chcê zobaczyæ trochê rudy. W tej kolonii nic nie ma za darmo!
	};
};
