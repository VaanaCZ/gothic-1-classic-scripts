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
	description = "�Qui�n eres?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //�Qui�n eres?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Soy el mejor ingeniero de minas que haya habido jam�s en esta maldita colonia, muchacho.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Soy el que asegura que a nuestros muchachos no les maten los derrumbamientos, s�lo porque son demasiado est�pidos como para raspar en el lugar adecuado.
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
	description = "�Me gustar�a unirme a vosotros como raspador!";
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
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //�Me gustar�a unirme a vosotros como raspador!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //�Ah, s�? No te creas que vas a sacar demasiado en limpio. Hay tres raciones de arroz al d�a; de los extras tendr�s que encargarte t�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //�Sabes por qu� estamos haciendo esto? Hacemos este trabajo para que alg�n d�a podamos salir libres de aqu�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Esto quiere decir que hay que entregar todo el mineral, que luego va a parar al mont�culo. Una vez al mes, a todos los que han estado trabajando aqu� se les dan 50 pepitas de oro para que se pongan ciegos.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //�sas son las cosas m�s importantes que debes saber.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //�Tienes por lo menos alguna experiencia en esto?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"No.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"S�.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //S�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //�Espl�ndido! Entonces sabes a qu� tienes que estar atento. Aqu� tienes tu vestimenta de protecci�n. Tendr�s que conseguir la piqueta por tu cuenta. Que te diviertas.
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //No.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //�Claro que no! �Por qu� siempre me toca a m�? Vale. Esc�chame atentamente. Coges esto y te lo pones; as�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Si te cae una pepita de mineral en el pie y no llevas tu vestimenta de protecci�n, te quedar�s tullido de por vida y para nosotros no valdr�s m�s que la mitad que antes.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Ya te encontrar�s una piqueta tirada por ah�.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Pero no podr�s hacer mucho con ella. Bueno, y qu�...
	
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
	description = "�Cu�nto mineral hab�is extra�do hasta la fecha?";
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
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //�Cu�nto mineral has conseguido por el momento?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Los magos dicen que no van a necesitar mucho m�s. Vete al Campamento Nuevo a ver el mont�culo.
	AI_StopProcessInfos	(self);
};


