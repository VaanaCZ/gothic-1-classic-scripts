// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Jsem tady nov�. Kdo jsi?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jsem tady nov�. Kdo jsi?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jsem Baal Taran ze Sp��ova Bratrstva.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Co to je Sp��ovo Bratrstvo?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Co to je Sp��ovo Bratrstvo?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jsme komunita vyznava�� nov� v�ry.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //N� t�bor se rozkl�d� na v�chod� v ba�in�ch. P�i�el jsem ���it Sp��ovo u�en� cizinc�m, jako jsi ty.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Kdo je ten Sp��?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kdo je ten Sp��?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Sp�� je n� spasitel. Zjevil se p�ed p�ti lety skrze na�eho mistra Y�Beriona.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od t� doby se z��k�me t�� boh�. A ty bys to m�l ud�lat tak�.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bohov� dopustili, abychom byli vyk�z�ni do tohoto v�zen�. Sp�� n�s ale dovede ke svobod�.
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Pov�dej mi o Sp��ov� u�en�.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Pov�dej mi o Sp��ov� u�en�.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Sp�� je mocn� bytost, mo�n� je�t� mocn�j�� ne� Innos, b�h sv�tla.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Je v na�� du�i. Jeho s�la je v�ak st�le omezen�. Spal po tis�ce let, ale okam�ik jeho procitnut� je u� bl�zko.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Zvolil n�s, abysme byli sv�dky jeho procitnut� a ���ili jeho u�en�.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Tak poslouchej, v�ichni, kdo se p�idaj� ke Sp��ovi, z�skaj� nesmrteln� du�e, ale ti, kte�� se postav� proti n�mu, budou potrest�ni.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Sp�� je v�ak milosrdn� a poslal d�kaz sv� moci v�em, kdo o n�m pochybovali.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "Jak vypad� cesta ke svobod�?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak vypad� cesta ke svobod�?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //P�ipravujeme se na velk� vz�v�n� Sp��e, p�i kter�m vstoup� v�ichni novicov� spole�n� ve spojen�.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //P�i tomto vz�v�n� Sp�� uk�e cestu ke svobod�.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "Jak v� b�h dok�zal svou moc?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Jak v� b�h dok�zal svou moc?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Promluvil k n�m skrze vize. Kdo sly�el jeho hlas, p�estal o jeho moci pochybovat.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Kdy� vezme� drogu, kter� roste v ba�in�ch, bude� Sp��ovi bl� a bude� ho moci sly�et. N�kte�� dokonce vid� obrazy.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Aha.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Jak se dostanu do t�bora Bratrstva?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Jak se dostanu do t�bora Bratrstva?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Nem�m �as. Ale Baal Parvez by tu n�kde v t�bo�e m�l b�t tak�.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Je pobl� tr�i�t�, na druh� stran� od hradu. Mysl�m, �e bude ve sv� chatr�i.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Novic jm�nem Baal Parvez m� m��e dov�st do t�bora Bratrstva v ba�in�ch. Najdu ho na tr�i�ti za hradem Star�ho t�bora.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Pot�ebuji se dostat do hradu. M��e� mi pomoci?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Pot�ebuji se dostat do hradu. M��e� mi pomoci?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Ob�v�m se, �e ne, brat�e. Jen n�kte�� z n�s sm�j� vstoupit do hradu a to jsou ti, kte�� z�sobuj� Gomeze drogou.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Sb�r�me tady drogu z ba�in a ��st j� pak prod�me do Star�ho t�bora a vym�n�me za zbo�� z vn�j��ho sv�ta.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Kdybys byl jedn�m z kur�r�, kte�� pracuj� pro Cor Kaloma, mohl by ses na hrad dostat. Ale to bys musel b�t jedn�m z n�s.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A co v�bec chce� na hrad� d�lat?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Chci se tam s n�k�m setkat.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"M�m dopis pro Velk�ho m�ga Kruhu ohn�.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Chci se tam s n�k�m setkat.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Tak? A s k�m? A pro� nepo�k�, a� doty�n� vyjde ven?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Do toho ti nic nen�.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"On je jedn�m z m�g�.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //M�m dopis pro Velk�ho m�ga Kruhu ohn�.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Och? A kde jsi k n�mu p�i�el? Dali ti ho m�gov�, je�t� ne� t� sem vyhnali, co?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jsi hloup�, kdy� o tom ��k� lidem. Ale nem�j obavy - j� to nikomu ne�eknu!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Ale pro svoje vlastn� dobro to stejn� nikomu ne��kej. Zdej�� lidi by za takovouhle v�c byli schopn� komukoliv pod��znout krk!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //V�t�ina lid� by r�da dostala odm�nu za zpr�vu z vn�j��ho sv�ta.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //On je jedn�m z m�g�.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Och! Dob�e, ti nikdy neopust� hrad. Opravdu se mus� dostat dovnit�.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Co od nich v�bec chce�? Kouzeln� runy? Nebo lektvary?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Do toho ti nic nen�.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Ano.  ",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To nen� tvoje v�c.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dob�e, �lov��e. Jen jsem cht�l pomoci...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Ano.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //V�d�l jsem to! Co jin�ho by mohl chlap�k, jako ty, cht�t od m�g�.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //M��u ti d�t jednu dobrou radu: zapome� na m�gy. Cht�j� za sv� zbo�� p��li� rudy.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Kouzeln� runy a lektvary jsou daleko levn�j�� v na�em t�bo�e.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
