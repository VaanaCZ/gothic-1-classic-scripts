// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Horatio_EXIT (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 999;
	condition	= DIA_Horatio_EXIT_Condition;
	information	= DIA_Horatio_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Horatio_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Wasser
// ************************************************************

INSTANCE Info_Horatio_Wasser(C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 800;
	condition	= Info_Horatio_Wasser_Condition;
	information	= Info_Horatio_Wasser_Info;
	permanent	= 1;
	description = "Przysy³a mnie Lewus. Przynios³em wam wodê.";
};                       

FUNC INT Info_Horatio_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Przysy³a mnie Lewus. Przynios³em wam wodê.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //Dziêki, kolego. Jeszcze trochê, a zacz¹³bym piæ z ka³u¿y!
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
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //Chyba ci siê skoñczy³a! Trudno, wezmê trochê od innych.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************
	var int horatio_trouble;
// ************************************************************

INSTANCE DIA_Horatio_Hello (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Hello_Condition;
	information	= DIA_Horatio_Hello_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Horatio_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_Hello_Info()
{	
	AI_GotoNpc	(self, hero);

	AI_Output (self, other,"DIA_Horatio_Hello_09_00"); //Co tu robisz? Szukasz k³opotów?
	
	Info_ClearChoices(DIA_Horatio_Hello );
	Info_AddChoice	 (DIA_Horatio_Hello,"K³opotów? A co  - grozisz mi, robolu?!",DIA_Horatio_Hello_PissOff);
	Info_AddChoice	 (DIA_Horatio_Hello,"Spokojnie! Jestem tu nowy.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output (other, self,"DIA_Horatio_Hello_BeCool_15_00"); //Spokojnie! Jestem tu nowy.
	AI_Output (self, other,"DIA_Horatio_Hello_BeCool_09_01"); //Hmmm... Wygl¹dasz w porz¹dku. Chocia¿ nigdy nie wiadomo - zawsze znajdzie siê jakiœ nowy, który wyobra¿a sobie niewiadomo co.
	Info_ClearChoices(DIA_Horatio_Hello );
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output (other, self,"DIA_Horatio_Hello_PissOff_15_00"); //K³opotów? A co - grozisz mi, robolu?!
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_01"); //Tylko dlatego, ¿e pracujê w polu, myœlisz, ¿e nie dam sobie rady z kimœ takim jak ty?
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_02"); //No, jeœli szukasz guza, to chodŸ!
	horatio_trouble = TRUE;
	
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						SORRY (PERM)
// ************************************************************

INSTANCE DIA_Horatio_SORRY (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_SORRY_Condition;
	information	= DIA_Horatio_SORRY_Info;
	permanent	= 1;
	description = "Przepraszam, nie chcia³em byæ z³oœliwy.";
};                       

FUNC INT DIA_Horatio_SORRY_Condition()
{
	if (horatio_trouble == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_SORRY_Info()
{	
	AI_Output (other, self,"DIA_Horatio_SORRY_15_00"); //Przepraszam, nie chcia³em byæ z³oœliwy.
	AI_Output (self, other,"DIA_Horatio_SORRY_09_01"); //Trzeba by³o pomyœleæ o tym wczeœniej, ch³opcze.
};

// ************************************************************
// 					Horatios Story
// ************************************************************

INSTANCE DIA_Horatio_Story (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Story_Condition;
	information	= DIA_Horatio_Story_Info;
	permanent	= 0;
	description = "Co ktoœ taki jak ty robi w towarzystwie zbieraczy?";
};                       

FUNC INT DIA_Horatio_Story_Condition()
{
	if ( (horatio_trouble==FALSE) && (Npc_KnowsInfo(hero,DIA_Horatio_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Story_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Story_15_00"); //Co ktoœ taki jak ty robi w towarzystwie zbieraczy?
	AI_Output (self, other,"DIA_Horatio_Story_09_01"); //Lee te¿ mnie o to pyta³. Nie chce ju¿ walczyæ, no chyba ¿e w obronie w³asnej.
	AI_Output (self, other,"DIA_Horatio_Story_09_02"); //Raz zabi³em cz³owieka i jak dla mnie to by³o o jeden raz za du¿o. Zreszt¹ dlatego w³aœnie trafi³em do tej zapchlonej kolonii.
	AI_Output (other, self,"DIA_Horatio_Story_15_03"); //Jak to siê sta³o?
	AI_Output (self, other,"DIA_Horatio_Story_09_04"); //Zwyk³a bójka w karczmie. Nie chcia³em zabiæ faceta - chyba po prostu za mocno go waln¹³em.
	AI_Output (self, other,"DIA_Horatio_Story_09_05"); //By³em wtedy kowalem. NajwyraŸniej nie doceni³em w³asnej si³y.
};

// ************************************************************
// 						Warum hier?
// ************************************************************

INSTANCE DIA_Horatio_WhyHere (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_WhyHere_Condition;
	information	= DIA_Horatio_WhyHere_Info;
	permanent	= 0;
	description = "Dlaczego do³¹czy³eœ do TEGO obozu?";
};                       

FUNC INT DIA_Horatio_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_WhyHere_Info()
{	
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_00"); //Dlaczego do³¹czy³eœ w³aœnie do TEGO obozu?
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_01"); //Ju¿ ci mówiê: do wyboru mia³em tylko tych œwirów z Sekty, a nie uœmiecha³o mi siê pranie mózgu, któremu chcieli mnie poddaæ.
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_02"); //W Starym Obozie mia³bym za du¿o k³opotów ze Stra¿nikami, a tutaj Najemnicy i Szkodniki traktuj¹ mnie z szacunkiem.
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_03"); //To znaczy - boj¹ siê ciebie...
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_04"); //Mo¿e. Tak, czy inaczej - tutaj znalaz³em spokój. Radzê ci pójœæ w moje œlady.
};

// ************************************************************
// 						Bitte STR
// ************************************************************
	var int horatio_StrFree;
// ************************************************************

INSTANCE DIA_Horatio_PleaseTeachSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_PleaseTeachSTR_Condition;
	information	= DIA_Horatio_PleaseTeachSTR_Info;
	permanent	= 0;
	description = "Mo¿esz mnie wyszkoliæ tak, bym by³ równie silny jak ty?";
};                       

FUNC INT DIA_Horatio_PleaseTeachSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_PleaseTeachSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Mo¿esz mnie wyszkoliæ tak bym by³ równie silny jak ty?
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_09_01"); //Nawet gdybym móg³ - po co ci to?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Chcê wykoñczyæ Ry¿owego Ksiêcia i jego zbirów!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Dobre pytanie. Przemyœlê je sobie.",DIA_Horatio_PleaseTeachSTR_BACK);
	};
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Samoobrona!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"¯eby pokazaæ im, ¿e nie ³atwo mn¹ pomiataæ.",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic		(CH1_HoratiosTeachings,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_RUNNING);
	B_LogEntry			(CH1_HoratiosTeachings,"Horacy, zbieracz ry¿u z Nowego Obozu, mo¿e mi pokazaæ, jak skuteczniej zadawaæ ciosy. Niestety, nie uda³o mi siê jeszcze znaleŸæ odpowiedzi na pytanie DLACZEGO mia³by to zrobiæ.");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //¯eby pokazaæ tym sukinsynom, ¿e nie mo¿na mn¹ pomiataæ.
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //I zanim byœ siê obejrza³, sam sta³byœ siê jednym z tych sukinsynów... Nie, drogi panie, to nie jest w³aœciwa motywacja.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Co samoobrony!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //Do tego potrzeba szybkoœci, a nie si³y. Myœlisz, ¿e gruchotanie koœci pomo¿e ci wieœæ spokojne ¿ycie?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Dobre pytanie. Przemyœlê to sobie.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Chcê wykoñczyæ Ry¿owego Ksiêcia i jego zbirów!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmmm... Wielu ju¿ próbowa³o przed tob¹.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

// ************************************************************
// 						Nachgedacht (STR)
// ************************************************************

INSTANCE DIA_Horatio_ThoughtSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_ThoughtSTR_Condition;
	information	= DIA_Horatio_ThoughtSTR_Info;
	permanent	= 1;
	description = "Przemyœla³em sobie to wszystko jeszcze raz...";
};                       

FUNC INT DIA_Horatio_ThoughtSTR_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_ThoughtSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_15_00"); //Przemyœla³em sobie to wszystko jeszcze raz...
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_09_01"); //No i? Wymyœli³eœ coœ lepszego?
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
	Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Nie.",DIA_Horatio_ThoughtSTR_NoIdea);
	
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Tak. Chcê przeciwstawiæ siê Ry¿owemu Ksiêciu i jego zbirom!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Nie.
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Tak myœla³em.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Tak. Chcia³bym przeciwstawiæ siê Ry¿owemu Ksiêciu i jego zbirom!
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmmm... Wielu ju¿ próbowa³o przed tob¹.
	horatio_StrFree = TRUE;
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

// ************************************************************
//					Will Ricelord köpfen
// ************************************************************

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if (other.attribute[ATR_STRENGTH]<=(100-5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintScreen	("Si³a + 5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100; 
		PrintScreen	("Si³a: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
				
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Jeœli chcesz mocno uderzyæ, musisz najpierw popracowaæ nad odpowiedni¹ technik¹. To pierwsza zasada dobrego kowala.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Naucz siê uderzaæ ca³¹ rêk¹ - od ramienia po nadgarstek.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //Im lepiej sobie z tym poradzisz, tym silniejszy bêdzie twój cios. Sam siê wkrótce przekonasz...
};

//--------------------------------------------------------------

INSTANCE DIA_Horatio_HelpSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_HelpSTR_Condition;
	information	= DIA_Horatio_HelpSTR_Info;
	permanent	= 0;
	description = "MOGÊ pokonaæ Ry¿owego Ksiêcia - jeœli mi pomo¿esz!";
};                       

FUNC INT DIA_Horatio_HelpSTR_Condition()
{
	if (horatio_StrFree == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_HelpSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_00"); //MOGÊ pokonaæ Ry¿owego Ksiêcia i jego bandytów - jeœli mi pomo¿esz!
	AI_Output (self, other,"DIA_Horatio_HelpSTR_09_01"); //Dobrze! Przysiêg³em, ¿e nigdy nie zaatakujê innego cz³owieka, ale nie powiedzia³em, ¿e nie poka¿ê komuœ jak to zrobiæ!
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_02"); //Zamieniam siê w s³uch.
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_SUCCESS);
	B_LogEntry			(CH1_HoratiosTeachings,"Horacy pokaza³ mi jak efektywnie wykorzystaæ moj¹ si³ê w walce. Dobry z niego cz³owiek.");
};

// ************************************************************
// 							Thanks (PERM)
// ************************************************************

INSTANCE DIA_Horatio_Thanks (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_Thanks_Condition;
	information	= DIA_Horatio_Thanks_Info;
	permanent	= 1;
	description = "Dziêki za pomoc!";
};                       

FUNC INT DIA_Horatio_Thanks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Thanks_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Thanks_15_00"); //Dziêki za pomoc!
	AI_Output (self, other,"DIA_Horatio_Thanks_09_01"); //Wykorzystaj tê wiedzê wy³¹cznie w s³usznej sprawie!
};



