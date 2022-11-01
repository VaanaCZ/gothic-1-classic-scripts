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
	description = "Przysyła mnie Lewus. Przyniosłem wam wodę.";
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
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Przysyła mnie Lewus. Przyniosłem wam wodę.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //Dzięki, kolego. Jeszcze trochę, a zacząłbym pić z kałuży!
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
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //Chyba ci się skończyła! Trudno, wezmę trochę od innych.
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

	AI_Output (self, other,"DIA_Horatio_Hello_09_00"); //Co tu robisz? Szukasz kłopotów?
	
	Info_ClearChoices(DIA_Horatio_Hello );
	Info_AddChoice	 (DIA_Horatio_Hello,"Kłopotów? A co  - grozisz mi, robolu?!",DIA_Horatio_Hello_PissOff);
	Info_AddChoice	 (DIA_Horatio_Hello,"Spokojnie! Jestem tu nowy.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output (other, self,"DIA_Horatio_Hello_BeCool_15_00"); //Spokojnie! Jestem tu nowy.
	AI_Output (self, other,"DIA_Horatio_Hello_BeCool_09_01"); //Hmmm... Wyglądasz w porządku. Chociaż nigdy nie wiadomo - zawsze znajdzie się jakiś nowy, który wyobraża sobie niewiadomo co.
	Info_ClearChoices(DIA_Horatio_Hello );
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output (other, self,"DIA_Horatio_Hello_PissOff_15_00"); //Kłopotów? A co - grozisz mi, robolu?!
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_01"); //Tylko dlatego, że pracuję w polu, myślisz, że nie dam sobie rady z kimś takim jak ty?
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_02"); //No, jeśli szukasz guza, to chodź!
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
	description = "Przepraszam, nie chciałem być złośliwy.";
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
	AI_Output (other, self,"DIA_Horatio_SORRY_15_00"); //Przepraszam, nie chciałem być złośliwy.
	AI_Output (self, other,"DIA_Horatio_SORRY_09_01"); //Trzeba było pomyśleć o tym wcześniej, chłopcze.
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
	description = "Co ktoś taki jak ty robi w towarzystwie zbieraczy?";
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
	AI_Output (other, self,"DIA_Horatio_Story_15_00"); //Co ktoś taki jak ty robi w towarzystwie zbieraczy?
	AI_Output (self, other,"DIA_Horatio_Story_09_01"); //Lee też mnie o to pytał. Nie chce już walczyć, no chyba że w obronie własnej.
	AI_Output (self, other,"DIA_Horatio_Story_09_02"); //Raz zabiłem człowieka i jak dla mnie to było o jeden raz za dużo. Zresztą dlatego właśnie trafiłem do tej zapchlonej kolonii.
	AI_Output (other, self,"DIA_Horatio_Story_15_03"); //Jak to się stało?
	AI_Output (self, other,"DIA_Horatio_Story_09_04"); //Zwykła bójka w karczmie. Nie chciałem zabić faceta - chyba po prostu za mocno go walnąłem.
	AI_Output (self, other,"DIA_Horatio_Story_09_05"); //Byłem wtedy kowalem. Najwyraźniej nie doceniłem własnej siły.
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
	description = "Dlaczego dołączyłeś do TEGO obozu?";
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
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_00"); //Dlaczego dołączyłeś właśnie do TEGO obozu?
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_01"); //Już ci mówię: do wyboru miałem tylko tych świrów z Sekty, a nie uśmiechało mi się pranie mózgu, któremu chcieli mnie poddać.
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_02"); //W Starym Obozie miałbym za dużo kłopotów ze Strażnikami, a tutaj Najemnicy i Szkodniki traktują mnie z szacunkiem.
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_03"); //To znaczy - boją się ciebie...
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_04"); //Może. Tak, czy inaczej - tutaj znalazłem spokój. Radzę ci pójść w moje ślady.
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
	description = "Możesz mnie wyszkolić tak, bym był równie silny jak ty?";
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
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Możesz mnie wyszkolić tak bym był równie silny jak ty?
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_09_01"); //Nawet gdybym mógł - po co ci to?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Chcę wykończyć Ryżowego Księcia i jego zbirów!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Dobre pytanie. Przemyślę je sobie.",DIA_Horatio_PleaseTeachSTR_BACK);
	};
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Samoobrona!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Żeby pokazać im, że nie łatwo mną pomiatać.",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic		(CH1_HoratiosTeachings,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_RUNNING);
	B_LogEntry			(CH1_HoratiosTeachings,"Horacy, zbieracz ryżu z Nowego Obozu, może mi pokazać, jak skuteczniej zadawać ciosy. Niestety, nie udało mi się jeszcze znaleźć odpowiedzi na pytanie DLACZEGO miałby to zrobić.");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //Żeby pokazać tym sukinsynom, że nie można mną pomiatać.
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //I zanim byś się obejrzał, sam stałbyś się jednym z tych sukinsynów... Nie, drogi panie, to nie jest właściwa motywacja.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Co samoobrony!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //Do tego potrzeba szybkości, a nie siły. Myślisz, że gruchotanie kości pomoże ci wieść spokojne życie?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Dobre pytanie. Przemyślę to sobie.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Chcę wykończyć Ryżowego Księcia i jego zbirów!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmmm... Wielu już próbowało przed tobą.
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
	description = "Przemyślałem sobie to wszystko jeszcze raz...";
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
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_15_00"); //Przemyślałem sobie to wszystko jeszcze raz...
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_09_01"); //No i? Wymyśliłeś coś lepszego?
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
	Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Nie.",DIA_Horatio_ThoughtSTR_NoIdea);
	
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Tak. Chcę przeciwstawić się Ryżowemu Księciu i jego zbirom!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Nie.
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Tak myślałem.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Tak. Chciałbym przeciwstawić się Ryżowemu Księciu i jego zbirom!
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmmm... Wielu już próbowało przed tobą.
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
		PrintScreen	("Siła + 5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100; 
		PrintScreen	("Siła: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
				
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Jeśli chcesz mocno uderzyć, musisz najpierw popracować nad odpowiednią techniką. To pierwsza zasada dobrego kowala.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Naucz się uderzać całą ręką - od ramienia po nadgarstek.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //Im lepiej sobie z tym poradzisz, tym silniejszy będzie twój cios. Sam się wkrótce przekonasz...
};

//--------------------------------------------------------------

INSTANCE DIA_Horatio_HelpSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_HelpSTR_Condition;
	information	= DIA_Horatio_HelpSTR_Info;
	permanent	= 0;
	description = "MOGĘ pokonać Ryżowego Księcia - jeśli mi pomożesz!";
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
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_00"); //MOGĘ pokonać Ryżowego Księcia i jego bandytów - jeśli mi pomożesz!
	AI_Output (self, other,"DIA_Horatio_HelpSTR_09_01"); //Dobrze! Przysięgłem, że nigdy nie zaatakuję innego człowieka, ale nie powiedziałem, że nie pokażę komuś jak to zrobić!
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_02"); //Zamieniam się w słuch.
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_SUCCESS);
	B_LogEntry			(CH1_HoratiosTeachings,"Horacy pokazał mi jak efektywnie wykorzystać moją siłę w walce. Dobry z niego człowiek.");
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
	description = "Dzięki za pomoc!";
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
	AI_Output (other, self,"DIA_Horatio_Thanks_15_00"); //Dzięki za pomoc!
	AI_Output (self, other,"DIA_Horatio_Thanks_09_01"); //Wykorzystaj tę wiedzę wyłącznie w słusznej sprawie!
};



