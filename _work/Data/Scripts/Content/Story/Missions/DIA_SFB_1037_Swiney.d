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
	description = "¿Quién eres?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //¿Quién eres?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Soy el mejor ingeniero de minas que haya habido jamás en esta maldita colonia, muchacho.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Soy el que asegura que a nuestros muchachos no les maten los derrumbamientos, sólo porque son demasiado estúpidos como para raspar en el lugar adecuado.
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
	description = "¡Me gustaría unirme a vosotros como raspador!";
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
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //¡Me gustaría unirme a vosotros como raspador!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //¿Ah, sí? No te creas que vas a sacar demasiado en limpio. Hay tres raciones de arroz al día; de los extras tendrás que encargarte tú.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //¿Sabes por qué estamos haciendo esto? Hacemos este trabajo para que algún día podamos salir libres de aquí.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Esto quiere decir que hay que entregar todo el mineral, que luego va a parar al montículo. Una vez al mes, a todos los que han estado trabajando aquí se les dan 50 pepitas de oro para que se pongan ciegos.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //Ésas son las cosas más importantes que debes saber.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //¿Tienes por lo menos alguna experiencia en esto?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"No.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Sí.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Sí.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //¡Espléndido! Entonces sabes a qué tienes que estar atento. Aquí tienes tu vestimenta de protección. Tendrás que conseguir la piqueta por tu cuenta. Que te diviertas.
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //No.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //¡Claro que no! ¿Por qué siempre me toca a mí? Vale. Escúchame atentamente. Coges esto y te lo pones; así.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Si te cae una pepita de mineral en el pie y no llevas tu vestimenta de protección, te quedarás tullido de por vida y para nosotros no valdrás más que la mitad que antes.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Ya te encontrarás una piqueta tirada por ahí.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Pero no podrás hacer mucho con ella. Bueno, y qué...
	
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
	description = "¿Cuánto mineral habéis extraído hasta la fecha?";
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
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //¿Cuánto mineral has conseguido por el momento?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Los magos dicen que no van a necesitar mucho más. Vete al Campamento Nuevo a ver el montículo.
	AI_StopProcessInfos	(self);
};


