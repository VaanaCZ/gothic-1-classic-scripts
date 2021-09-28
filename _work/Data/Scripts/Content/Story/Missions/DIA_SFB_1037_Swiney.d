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
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jestem najlepszym in¿ynierem, jakiego ta przeklêta kolonia kiedykolwiek widzia³a, ch³opcze.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Pilnujê, ¿eby nasi ch³opcy nie œci¹gnêli sobie na g³owy sterty kamieni kopi¹c w niew³aœciwym miejscu.
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
	description = "Chcia³bym do was do³¹czyæ, jako Kret.";
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
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chcia³bym do was do³¹czyæ, jako Kret.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Czy¿by? Tylko nie oczekuj zbyt wiele po tej robocie. Trzy porcje ry¿u na dzieñ. Resztê musisz sobie sam za³atwiæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Wiesz dlaczego odwalamy ca³¹ tê brudn¹ robotê? ¯eby pewnego dnia móc wyjœæ na wolnoœæ z tego przeklêtego wiêzienia.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Ca³y nasz urobek jest sk³adowany na wielkim kopcu. Raz w miesi¹cu ka¿dy z nas dostaje 50 bry³ek, ¿eby móc siê porz¹dnie upiæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To najwa¿niejsze rzeczy, które powinieneœ wiedzieæ.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Masz chocia¿ jakieœ doœwiadczenie w tej robocie?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"Nie.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Tak.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Tak.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //To œwietnie! Zatem wiesz, na co nale¿y uwa¿aæ. Masz tu swój strój roboczy. Kilof musisz znaleŸæ sobie sam. Mi³ej zabawy.
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nie.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //No jasne! Dlaczego to zawsze ja muszê was uœwiadamiaæ. S³uchaj uwa¿nie: weŸ te ciuchy i za³ó¿ je na siebie - tutaj.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Gdyby kawa³ek rudy spad³ ci na bos¹ stopê, zosta³byœ kalek¹ do koñca ¿ycia. Oczywiœcie wtedy by³byœ dla nas znacznie mniej przydatny.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Gdzieœ w pobli¿u powinien le¿eæ jakiœ kilof.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Oczywiœcie wiele z nim nie zdzia³asz... Mówi siê trudno...
	
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
	description = "Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?";
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
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Jak du¿o rudy uda³o siê wam uzbieraæ do tej pory?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Magowie mówi¹, ¿e mamy ju¿ niemal ca³¹ potrzebn¹ iloœæ. Kiedy bêdziesz w Nowym Obozie rzuæ okiem na kopiec.
	AI_StopProcessInfos	(self);
};


