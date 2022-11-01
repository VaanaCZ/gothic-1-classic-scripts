// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Kim jesteś?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kim jesteś?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jestem najlepszym inżynierem, jakiego ta przeklęta kolonia kiedykolwiek widziała, chłopcze.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Pilnuję, żeby nasi chłopcy nie ściągnęli sobie na głowy sterty kamieni kopiąc w niewłaściwym miejscu.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Chciałbym do was dołączyć, jako Kret.";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chciałbym do was dołączyć, jako Kret.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Czyżby? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ryżu na dzień. Resztę musisz sobie sam załatwić.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Wiesz dlaczego odwalamy całą tę brudną robotę? Żeby pewnego dnia móc wyjść na wolność z tego przeklętego więzienia.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Cały nasz urobek jest składowany na wielkim kopcu. Raz w miesiącu każdy z nas dostaje 50 bryłek, żeby móc się porządnie upić.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To najważniejsze rzeczy, które powinieneś wiedzieć.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Masz chociaż jakieś doświadczenie w tej robocie?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"Nie.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Tak.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Tak.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //To świetnie! Zatem wiesz, na co należy uważać. Masz tu swój strój roboczy. Kilof musisz znaleźć sobie sam. Miłej zabawy.
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nie.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //No jasne! Dlaczego to zawsze ja muszę was uświadamiać. Słuchaj uważnie: weź te ciuchy i załóż je na siebie - tutaj.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Gdyby kawałek rudy spadł ci na bosą stopę, zostałbyś kaleką do końca życia. Oczywiście wtedy byłbyś dla nas znacznie mniej przydatny.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Gdzieś w pobliżu powinien leżeć jakiś kilof.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Oczywiście wiele z nim nie zdziałasz... Mówi się trudno...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Jak dużo rudy udało się wam uzbierać do tej pory?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Jak dużo rudy udało się wam uzbierać do tej pory?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Magowie mówią, że mamy już niemal całą potrzebną ilość. Kiedy będziesz w Nowym Obozie rzuć okiem na kopiec.
	AI_StopProcessInfos	(self);
};


