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
	description		= "Czym si� tutaj zajmujesz?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Jestem my�liwym. Utrzymuj� si� ze sprzeda�y sk�r i k��w zabitych zwierz�t.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Da si� z tego wy�y�?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Je�li potrafi si� zr�cznie oporz�dza� zwierzyn� - tak, i to ca�kiem nie�le!

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Aidan, my�liwy mieszkaj�cy na drodze pomi�dzy Starym a Nowym Obozem, mo�e mnie nauczy�, jak patroszy� upolowan� zwierzyn�.");
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
	description = "Chcia�bym si� nauczy� oprawia� zwierzyn�.";
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
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Chcia�bym si� nauczy� oprawia� zwierzyn�.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //A co chcesz wiedzie�?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Usuwanie k��w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"�ci�ganie futer (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Usuwanie pazur�w (koszt: 1 punkt umiej�tno�ci, 50 bry�ek rudy)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Sk�rowanie gad�w (koszt: 1 punkt umiej�tno�ci, 100 bry�ek rudy)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Nauczy�em ci� ju� wszystkiego co sam wiem.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Jak mog� zdoby� k�y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nowa umiej�tno��: Zdobywanie k��w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Przede wszystkim musisz uwa�a�, �eby k�y nie pop�ka�y podczas wyci�gania. W tym celu wbij n� w pobli�u �rodka z�ba i delikatnie go podwa�aj.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Warto zabiera� k�y wilk�w, cieniostwor�w i z�baczy
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� zdobywania k��w wilk�w, orkowych ps�w, z�baczy, k�saczy, ogar�w i cieniostwor�w.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak mog� zdoby� sk�ry upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nowa umiej�tno��: �ci�ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Zaczynaj sk�rowanie od zadu, przesuwaj�c si� stopniowo ku g�owie. Spr�buj kilka razy. To nie jest takie trudne, a futra potrafi� by� bardzo cenne!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Futra wilk�w i cieniostwor�w mo�na wykorzysta� do szycia odzie�y. Badaj�c futro zabitego zwierza �atwo ocenisz, czy nadaje si� do dalszego wykorzystania. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� �ci�gania futer z wilk�w, orkowych ps�w, cieniostwor�w i trolli");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiej�tno��: Zdobywanie pazur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Poka� mi jak zdoby� pazury upolowanej zwierzyny.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Prawd� m�wi�c to dziecinnie proste, trzeba tylko zna� odpowiedni� metod�. Wygnij pazury do przodu - nigdy do ty�u! I pod �adnym pozorem nie pr�buj ich wyci�ga�!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Najlepiej pozyskiwa� pazury jaszczur�w. Od tej pory b�dziesz wiedzia�, kt�re zwierz�ta dostarczaj� dobrych pazur�w.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� wyci�gania pazur�w jaszczur�w, z�baczy, topielc�w, k�saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
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
			
			PrintScreen	("Nowa umiej�tno��: Sk�rowanie jaszczur�w", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co powinienem zwraca� uwag� zdzieraj�c sk�r� z gad�w?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Sk�ry topielc�w i bagiennych w�y s� szczeg�lnie cenne.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Je�li przetniesz sk�r� na bokach, powinna sama odej�� od mi�sa. My�l�, �e od tej pory poradzisz ju� sobie ze sk�rowaniem gad�w.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiej�tno�� sk�rowania jaszczur�w i b�otnych w�y");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Musisz najpierw zdoby� troch� wi�cej do�wiadczenia. Inaczej moja wiedza b�dzie bezu�yteczna.
			PrintScreen	("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Najpierw chc� zobaczy� troch� rudy. W tej kolonii nic nie ma za darmo!
	};
};
