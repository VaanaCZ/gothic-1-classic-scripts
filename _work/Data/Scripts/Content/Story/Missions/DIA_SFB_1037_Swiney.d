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
	description = "Kdo jsi?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kdo jsi?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jsem nejlep�� d�ln� in�en�r, kter�ho kdy tahle zpropaden� kolonie spat�ila, milej zlatej.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Jsem p�esv�d�en�, �e by se polovina na�ich chlap� nemusela nechat zab�t padaj�c�mi kameny, kdyby nebyla tak stupidn� a kopala na spr�vn�ch m�stech.
};

// ************************************************************
// 						Sch�rfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Cht�l bych se k v�m p�idat jako ruda�!";
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
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Cht�l bych se k v�m p�idat jako ruda�!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Tak? Nemysli si ale, �e t�m z�sk� n�co zvl�tn�ho. Obn�� to t�i porce r��e denn� a nic v�c, co bys musel na vlastn� o�i vid�t.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //V�, pro� to d�l�me? D�l�me to proto, abysme odtud jednoho dne mohli odej�t za svobodou.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //To znamen�, �e se v�echna ruda vyt�� a pak putuje na velkou rudnou haldu. A jednou za m�s�c dostane ka�d�, kdo tady pracoval, 50 nuget�, aby se mohl zp�t do n�moty.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To je nejd�le�it�j�� v�c, kterou bys m�l v�d�t.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //M� s touhle prac� aspo� n�jak� zku�enosti?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"Ne.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Ano.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Ano.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Dobr�! Pak v�, na co tu d�vat pozor. Tady m� ochrann� od�v. Mus� si obstarat sv�j vlastn� krump��. Hodn� �sp�ch�!
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Ne.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Samoz�ejm�, �e ne! Pro� po��d j�? Dob�e, Poslouchej pozorn�. Vezme� tenhle materi�l a polo�� ho - sem.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Kdy� ti spadne magick� nuget na nohu a ty p�itom nebude� na sob� m�t ochrann� od�v, bude� na do�ivot� mrz�k a bude� m�t pro n�s jen polovi�n� hodnotu, ne� si m�l p�edt�m.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //N�kde tady bude le�et krump��.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Ale moc u� toho nevydr�� - co se d� d�lat...
	
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
	description = "Kolik rudy jste u� nahromadili?";
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
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Kolik rudy jste u� nahromadili?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //M�gov� ��kaj�, �e u� j� nebude tolik pot�eba. Jdi do Nov�ho t�bora a prohl�dni si haldu.
	AI_StopProcessInfos	(self);
};


