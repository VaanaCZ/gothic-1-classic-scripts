// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "Jak to jde?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Jak to jde?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Není to zlé. Když umíš dobře vařit, máš tady spoustu přátel.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Nechceš nějaký z mých rýžových nákypů?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Díky.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Mohl bys pro mě udělat laskavost.
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="Co pro tebe můžu udělat?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Co bych měl udělat?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Musíš být zvyklý na dobré jídlo. Mám nový recept: ragú ze žravých štěnic po zlodějsku s rýží a houbami.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Můžeš mít, kolik si jen vzpomeneš, ale budeš potřebovat: 3 žravé štěnice a pár pekelných hub - 5 by mělo stačit.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Chceš, abych se pozvracel?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"To zní dobře.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Chceš, abych se pozvracel?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Nemusíš to sníst, ale mohl bys to aspoň zkusit! Jestli se ti podaří ty věci sehnat, vzpomeň si na mě.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Už jsem někoho poslal, ale ještě se nevrátil - zřejmě zběhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, kuchař který žije na Vnějším okruhu, mě poslal, abych mu pro nový kuchařský recept opatřil 3 žravé štěnice a 5 pekelných hub.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //To zní dobře.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Tak jdi a sežeň mi ty věci.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Poslední, kterého jsem poslal, se ještě nevrátil - zřejmě zběhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, kuchař žijící na Vnějším okruhu, mě poslal, abych mu pro nový kuchařský recept opatřil 3 žravé štěnice a 5 pekelných hub. Až to bude hotové, také z toho budu něco mít.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "Mám ty věci, co jsi po mně chtěl!";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Mám ty věci, co jsi po mně chtěl!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Výborně, musím je přidat, pak bude to ragú hotové... Počkej...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items übergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"Snaf byl velmi spokojený, když jsem mu přinesl ty přísady.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"Ode dneška mi bude každý den dávat ragú ze žravých štěnic.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "Řekl jsi mi, že můžu mít tolik ragú, kolik budu chtít...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Řekl jsi mi, že můžu mít tolik ragú, kolik budu chtít...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //A to je pravda. Tady jsou tři porce.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Jistě! Ale dnes nic nezbylo. Přijď zase zítra.
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "Kde najdu žravé štěnice?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Kde najdu žravé štěnice?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Všude, kde se válí odpadky. Něco bys mohl najít u té opuštěné chatrče nedaleko hradní zdi.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Nedej se zmást jejich nevábným vzhledem. Jakmile se uvaří, jsou znamenité.
	
    B_LogEntry( CH1_SnafsRecipe,"Poblíž zpustlých chatrčí u hradních zdí se vyskytují žravé štěnice.");			
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "Kde najdu houby?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Kde najdu houby?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Když projdeš jižní branou - to je ta zhroucená věž - uvidíš přímo před sebou pláň. Tam rostou houby.
	
	B_LogEntry( CH1_SnafsRecipe,"Pekelné houby najdu na planině před zřícenou věží jižní brány.");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "Kdo byl ten chlapík, kterého jsi poslal přede mnou?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Kdo byl ten chlapík, kterého jsi poslal přede mnou?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Jmenoval se Nek. Byl tady hrozně nespokojený - myslím, že je teď v Novém táboře.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Poslal jsem ho nasbírat houby - ale už se nevrátil zpátky...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"Kuchař Snaf viděl Neka naposledy, když odešel sbírat houby.");
};







	
	 




