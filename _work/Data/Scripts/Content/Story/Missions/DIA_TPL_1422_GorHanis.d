// **************************************************
//						 EXIT 
// **************************************************

instance Info_GorHanis_Exit (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 999;
	condition		= Info_GorHanis_Exit_Condition;
	information		= Info_GorHanis_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_GorHanis_Exit_Condition()
{
	return 1;
};

func VOID Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Co tu robisz?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
	return 1;
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Co tu robisz?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Ja? Walcz� ku chwale wielkiego �ni�cego!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 1;
	description 	= "Walczysz na arenie?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena_15_00"); //Walczysz na arenie?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Zosta�em wybrany przez moich mistrz�w, by broni� na arenie honoru obozu na bagnie.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Przy�wieca mi wi�c wy�szy cel. Walcz�, by pokaza� niewiernym jak wielka jest pot�ga �ni�cego!
};

// **************************************************
//					Schl�fer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "Kim jest �ni�cy?";
};                       

FUNC INT Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Sleeper_Info()
{
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //W naszym obozie znajdziesz �wi�tych m��w, kt�rzy odpowiedz� ci na to pytanie znacznie lepiej ni� ja.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Powiem ci tylko tyle: �ni�cy b�dzie naszym zbawicielem. Przyprowadzi� nas tutaj i z jego pomoc� uda si� nam st�d wydosta�.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //Chcesz przez to powiedzie�, �e czekacie a� wasz b�g zwr�ci wam wolno��?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //Tak! Nasze oczekiwanie wkr�tce dobiegnie ko�ca. W tej chwili przygotowujemy si� do rytua�u wielkiego przyzwania.
};

// **************************************************
//					Gro�e Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "Na czym polega rytua�, kt�ry planujecie?";
};                       

FUNC INT Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Summoning_Info()
{
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //Na czym polega rytua�, kt�ry planujecie?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //Nasi prorocy przewidzieli, �e wsp�lne przywo�anie �ni�cego jest jedyn� drog� do odzyskania wolno�ci!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Je�li chcesz si� jeszcze czego� dowiedzie�, powiniene� uda� si� do naszego obozu.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 0;
	condition		= Info_GorHanis_WayToST_Condition;
	information		= Info_GorHanis_WayToST_Info;
	permanent		= 1;
	description 	= "M�g�by� opisa� mi drog� do waszego obozu?";
};                       

FUNC INT Info_GorHanis_WayToST_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning) )
	{
		return 1;
	};
};

func VOID Info_GorHanis_WayToST_Info()
{
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //M�g�by� opisa� mi drog� do waszego obozu?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //W Starym Obozie znajdziesz kilku Nowicjuszy Bractwa, kt�rzy ch�tnie wska�� ci drog� do obozu na bagnie. Znajd� kt�rego� z nich i porozmawiaj z nim!
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_Charge_Condition;
	information		= Info_GorHanis_Charge_Info;
	permanent		= 0;
	description 	= "Wyzywam ci� na pojedynek na arenie!";
};                       

FUNC INT Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Charge_Info()
{
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //Wyzywam ci� na pojedynek na arenie!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //Zabicie kogo� takiego jak ty nie przysporzy raczej chwa�y �ni�cemu.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //Stan� z tob� w szranki dopiero w tedy, gdy oka�esz si� godnym rywalem.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Ale jestem pewien, �e wojownicy z Nowego Obozu nie b�d� mieli takich skrupu��w...�
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_ChargeGood_Condition;
	information		= Info_GorHanis_ChargeGood_Info;
	permanent		= 1;
	description 	= "Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?";
};                       

FUNC INT Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func VOID Info_GorHanis_ChargeGood_Info()
{
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //Czy jestem ju� do�� silny, �eby si� z tob� zmierzy�?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //Nie! Jeste� jeszcze zbyt s�aby. Nie sprostasz mi w walce!
};























/*

// infos 
instance Info_TPL_1422_GorHanis (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis_Condition;
	information		= Info_TPL_1422_GorHanis_Info;
	important			= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1422_GorHanis_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_PC_Mage_LoadSword3 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis_Info()
{
	AI_Output (self, other,"Info_TPL_1422_GorHanis_08_01"); //Was machst du hier?
};


instance Info_TPL_1422_GorHanis1 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis1_Condition;
	information		= Info_TPL_1422_GorHanis1_Info;
	important			= 0;
	permanent		= 0;
	description		= "Ich will helfen den Schl�fer zu erwecken."; 
};

FUNC int Info_TPL_1422_GorHanis1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis1_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis1_15_01"); //Ich will helfen den Schl�fer zu erwecken.
	AI_Output (self, other,"Info_TPL_1422_GorHanis1_08_02"); //Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du l�gst, wird der Hohenpriester dir schon eine Lektion erteilen.
};



instance Info_TPL_1422_GorHanis2 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis2_Condition;
	information		= Info_TPL_1422_GorHanis2_Info;
	important			= 0;
	permanent		= 0;
	description		= "Das geht dich nichts an!"; 
};

FUNC int Info_TPL_1422_GorHanis2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis2_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis2_15_01"); //Das geht dich nichts an!
	AI_Output (self, other,"Info_TPL_1422_GorHanis2_08_02"); //Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen. 
};


instance Info_TPL_1422_GorHanis3 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis3_Condition;
	information		= Info_TPL_1422_GorHanis3_Info;
	important			= 0;
	permanent		= 0;
	description		= "Wie seit ihr an dem Priester vorbei gekommen?"; 
};

FUNC int Info_TPL_1422_GorHanis3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis2 )) || ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis1 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis3_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis3_15_01"); //Wie seit ihr an dem Priester vorbei gekommen?
	AI_Output (self, other,"Info_TPL_1422_GorHanis3_08_02"); //Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit im gesprochen hat, dass Gl�ck wirst du nicht haben. Geh nur (lacht).
};

*/
