
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
	description = "Widz�, �e jeste� my�liwym.";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Widz�, �e jeste� my�liwym.
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Na to wygl�da... Czego chcesz?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //M�g�by� nauczy� mnie polowa�?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Par� sztuczek m�g�bym ci pokaza�, ale to b�dzie kosztowa�.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Ile dok�adnie?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Na pocz�tek wystarczy �yk dobrego piwa, potem zobaczymy.
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
	description = "Prosz�, oto piwo. Teraz opowiedz mi o polowaniu.";
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
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Prosz�, oto piwo. Teraz opowiedz mi o polowaniu.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //�cierwojady - tak nazywamy te wielkie ptaszyska - nale�y atakowa� jeden po drugim. Na szcz�cie �atwo odci�gn�� jednego osobnika od reszty stada.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Je�li podejdziesz do nich zbyt blisko, zaczn� si� denerwowa�, a� wreszcie rzuc� si� w twoj� stron�. Lepiej, �eby� w tej chwili mia� bro� w pogotowiu.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Je�li uda ci si� trafi� �cierwojada zanim on dziobnie ciebie, jak najszybciej wyprowad� kolejne uderzenie. Przy odrobinie szcz�cia uda ci si� go pokona� bez zadra�ni�cia.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //A je�li ON dziobnie ci� pierwszy... C�, lepiej, �eby nie dziobn��.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nie mam piwa.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //To poszukaj! To najlepsza rada, jak� otrzymasz ode mnie za darmo. A skoro ju� b�dziesz szuka�, znajd� dla mnie jeszcze par� bry�ek rudy.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Mog� ci wiele opowiedzie� o r�nych zwierzakach, ale to ci� b�dzie kosztowa�o.
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Drax mo�e mnie nauczy� patroszenia zwierzyny, je�li zap�ac� cen�, kt�rej za��da. Znajd� go na drodze pomi�dzy Starym Obozem a miejscem wymiany.");
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
	description = "Czego jeszcze mo�esz mnie nauczy�?";
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
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Czego jeszcze mo�esz mnie nauczy�?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Wielu rzeczy, ale g�upie piwo nie wystarczy.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wprawny �owca potrafi zdoby� k�y, pazury i sk�r� zwierzyny. Nie jest to �atwe, ale do�� op�acalne.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //W ka�dym razie ka�dy kupiec ch�tnie je od ciebie odkupi.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Du�o ��dasz za swoje us�ugi.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Powiedzia�em ci ju� wszystko co wiem.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Du�o ��dasz za swoje us�ugi.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //By� mo�e, ale wiedza, kt�r� mog� ci przekaza� pozwoli ci szybko odzyska� zainwestowan� kwot�.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Wszystkie zwierz�ta, kt�re zabijesz nie wiedz�c jak je oprawi�, po prostu zgnij�.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //A to najzwyklejsze marnotrawstwo. Za ich sk�r� m�g�by� zarobi� sporo pieni�dzy.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Na twoim miejscu spr�bowa�bym mo�liwie szybko posi��� te umiej�tno�ci.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak mog� zdoby� k�y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiej�tno��: Zdobywanie k��w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak mog� zdoby� sk�ry upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Nowa umiej�tno��: �ci�ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiej�tno��: Zdobywanie pazur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Poka� mi jak zdoby� pazury upolowanej zwierzyny.
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiej�tno��: Sk�rowanie jaszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
	};
};
