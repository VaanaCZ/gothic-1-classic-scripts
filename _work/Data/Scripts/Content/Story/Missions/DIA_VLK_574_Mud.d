// **************************************************
var int Mud_Nerve;
const int NerveSec = 30;
var int Mud_NerveRealized;
// **************************************************

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Mud_Exit (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Exit_Condition;
	information	= DIA_Mud_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mud_Exit_Condition()
{
	//if (Npc_KnowsInfo(hero, DIA_Mud_FirstEXIT))
	//{
		return 1;
	//};
};

FUNC VOID DIA_Mud_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						First + EXIT
// **************************************************

INSTANCE DIA_Mud_FirstEXIT (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_FirstEXIT_Condition;
	information	= DIA_Mud_FirstEXIT_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_FirstEXIT_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_FirstEXIT_Info()
{
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_00"); //¡Hola, hombre! ¿Eres nuevo aquí? No te había visto nunca.
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_01"); //Voy a hacerte compañía, si no te importa. Seguro que necesitarás un amigo.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	Info_AddChoice	 (DIA_Mud_FirstEXIT,"¡Lárgate!",DIA_Mud_FirstEXIT_Verpiss);
	Info_AddChoice	 (DIA_Mud_FirstEXIT,"¿Por qué no? Date prisa.",DIA_Mud_FirstEXIT_Komm);
};

func void DIA_Mud_FirstEXIT_Verpiss()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Verpiss_15_00"); //¡Piérdete!
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Verpiss_07_01"); //No estás de muy buen humor hoy, ¿eh? Será mejor que te acompañe.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

func void DIA_Mud_FirstEXIT_Komm()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Komm_15_00"); //¿Por qué no? ¡Ven conmigo!
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Komm_07_01"); //¡Estupendo! Podemos hablar mientras andamos.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

// **************************************************
// 					Shut Up!
// **************************************************

INSTANCE DIA_Mud_ShutUp (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 3;
	condition	= DIA_Mud_ShutUp_Condition;
	information	= DIA_Mud_ShutUp_Info;
	permanent	= 1;
	description	= "¿Te puedes estar callado un minuto?";
};                       

FUNC INT DIA_Mud_ShutUp_Condition()
{
	
	if (Mud_NerveRealized == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_ShutUp_Info()
{
	AI_Output (other, self,"DIA_Mud_ShutUp_15_00"); //¿Podrías callarte un minuto, POR FAVOR?
	AI_Output (self, other,"DIA_Mud_ShutUp_07_01"); //Claro... ¿Qué tenías pensado? Cuantas más cosas puedas ver en el mapa, más cuesta.
	Npc_SetRefuseTalk(self, 300);
};

// **************************************************
// 					Verpiß dich
// **************************************************

INSTANCE DIA_Mud_GetLost (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 2;
	condition	= DIA_Mud_GetLost_Condition;
	information	= DIA_Mud_GetLost_Info;
	permanent	= 1;
	description	= "¡Lárgate!";
};                       

FUNC INT DIA_Mud_GetLost_Condition()
{
	return 1;
};

FUNC VOID DIA_Mud_GetLost_Info()
{
	AI_Output (other, self,"DIA_Mud_GetLost_15_00"); //¡Piérdete!
	AI_Output (self, other,"DIA_Mud_GetLost_07_01"); //Quieres estar solo un rato, ¿verdad? Lo comprendo. Me quedaré en un segundo plano.
};

// **************************************************
// 					DEFEATED
// **************************************************

INSTANCE DIA_Mud_Defeated (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_Defeated_Condition;
	information	= DIA_Mud_Defeated_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Defeated_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_Defeated_Info()
{
	AI_Output (self, other,"DIA_Mud_GetLost_07_00"); //¡Oye, tío, me has pegado! ¿A qué ha venido eso?
	AI_Output (other, self,"DIA_Mud_GetLost_15_01"); //¡En un segundo voy a volver a pegarte! ¡Me gusta hacerlo!
	AI_Output (self, other,"DIA_Mud_GetLost_07_02"); //¡Eres un lunático, tío! ¡No quiero tener nada que ver contigo!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
// 						 Nerve 0 
// **************************************************

INSTANCE DIA_Mud_Nerve_0 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_0_Condition;
	information	= DIA_Mud_Nerve_0_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_0_Condition()
{
	if ( (Mud_Nerve==0) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_0_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_0_07_00"); //Dime una cosa; ¿adónde vamos? ¿O se supone que ha de ser una sorpresa? Me gustan las sorpresas.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 1;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 1 
// **************************************************

INSTANCE DIA_Mud_Nerve_1 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_1_Condition;
	information	= DIA_Mud_Nerve_1_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_1_Condition()
{
	if ( (Mud_Nerve==1) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_1_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_1_07_00"); //No me hagas caso. Me quedaré contigo; no te preocupes.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 2;
	Mud_NerveRealized = TRUE;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 2 
// **************************************************

INSTANCE DIA_Mud_Nerve_2 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_2_Condition;
	information	= DIA_Mud_Nerve_2_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_2_Condition()
{
	if ( (Mud_Nerve==2) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_2_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_2_07_00"); //¿No tienes ningún plan sobre dónde quieres ir?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 3;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 3
// **************************************************

INSTANCE DIA_Mud_Nerve_3 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_3_Condition;
	information	= DIA_Mud_Nerve_3_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_3_Condition()
{
	if ( (Mud_Nerve==3) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_3_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_3_07_00"); //¿Estás buscando un lugar tranquilo? ¿Donde podamos charlar un poco o algo así?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 4;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 4
// **************************************************

INSTANCE DIA_Mud_Nerve_4 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_4_Condition;
	information	= DIA_Mud_Nerve_4_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_4_Condition()
{
	if ( (Mud_Nerve==4) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_4_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_4_07_00"); //¿Es posible que estemos andando en círculos? Quiero decir que no sé a dónde quieres ir.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 5;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 5
// **************************************************

INSTANCE DIA_Mud_Nerve_5 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_5_Condition;
	information	= DIA_Mud_Nerve_5_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_5_Condition()
{
	if ( (Mud_Nerve==5) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_5_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_5_07_00"); //Esto es muy divertido. Gracias por llevarme contigo. Podríamos hacerlo más a menudo; hoy todavía queda un montón de tiempo.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 6;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 6
// **************************************************

INSTANCE DIA_Mud_Nerve_6 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_6_Condition;
	information	= DIA_Mud_Nerve_6_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_6_Condition()
{
	if ( (Mud_Nerve==6) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_6_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_6_07_00"); //Ya me he acostumbrado a ti. Nos lo vamos a pasar muy bien; estoy seguro de ello. ¿Tú no? Por cierto, ¿dónde duermes? Puedes venir a mi casa; sin problemas.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 7;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 7
// **************************************************

INSTANCE DIA_Mud_Nerve_7 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_7_Condition;
	information	= DIA_Mud_Nerve_7_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_7_Condition()
{
	if ( (Mud_Nerve==7) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_7_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_7_07_00"); //¿Por qué te pusieron aquí? ¿Te gustan a ti también los animales? Eso no les gusta ni un pelo. Por eso me encerraron aquí.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 8;
	AI_StopProcessInfos	( self );
};


// **************************************************
// 						 Nerve 8
// **************************************************

INSTANCE DIA_Mud_Nerve_8 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_8_Condition;
	information	= DIA_Mud_Nerve_8_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_8_Condition()
{
	if ( (Mud_Nerve==8) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_8_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_8_07_00"); //Hay algunos que intentan darme palizas constantemente. Unos tipos horribles del Campamento Nuevo. Cuando vuelva a pasar les diré que la próxima vez tendrán que enfrentarse a ti. Eso les asustará muchísimo.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 9;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 9
// **************************************************

INSTANCE DIA_Mud_Nerve_9 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_9_Condition;
	information	= DIA_Mud_Nerve_9_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_9_Condition()
{
	if ( (Mud_Nerve==9) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_9_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_9_07_00"); //Esos bastardos del Campamento Nuevo van a quedarse asombrados cuando sepan que tengo un protector. Van a mearse encima. Será divertido. Normalmente liquidan a la gente con rapidez, pero ahora se lo pensarán dos veces.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 10;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 10
// **************************************************

INSTANCE DIA_Mud_Nerve_10 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_10_Condition;
	information	= DIA_Mud_Nerve_10_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_10_Condition()
{
	if ( (Mud_Nerve==10) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_10_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_10_07_00"); //¿Sabes una cosa? Voy a hacerte un favor. Voy a interceder por ti; quizá entonces te admitan en el Campamento. Entonces podríamos vernos todos los días.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 11;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 11
// **************************************************

INSTANCE DIA_Mud_Nerve_11 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_11_Condition;
	information	= DIA_Mud_Nerve_11_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_11_Condition()
{
	if ( (Mud_Nerve==11) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_11_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_11_07_00"); //Alguna gente piensa que soy un completo lunático. Pero alguien como tú nunca pasaría el rato con un lunático. La gente hablaría de ello. Así que por fin se darán cuenta de que estaban equivocados acerca de mí.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 12;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 12
// **************************************************

INSTANCE DIA_Mud_Nerve_12 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_12_Condition;
	information	= DIA_Mud_Nerve_12_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_12_Condition()
{
	if ( (Mud_Nerve==12) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_12_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_12_07_00"); //Eres el mejor amigo que tengo aquí. Los otros siempre andan queriendo librarse de mí. Te estoy agradecidísimo.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 13;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 13
// **************************************************

INSTANCE DIA_Mud_Nerve_13 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_13_Condition;
	information	= DIA_Mud_Nerve_13_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_13_Condition()
{
	if ( (Mud_Nerve==13) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_13_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_13_07_00"); //Mira, esto de correr todo el rato resulta agotador. ¿No deberíamos buscar algún lugar tranquilo y ponernos cómodos en alguna parte?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 14;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 14
// **************************************************

INSTANCE DIA_Mud_Nerve_14 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_14_Condition;
	information	= DIA_Mud_Nerve_14_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_14_Condition()
{
	if ( (Mud_Nerve==14) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_14_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_14_07_00"); //Eres como un hermano mayor para mí. Nunca tuve un hermano mayor. Ni menor. Mis padres no me querían. Pero estoy seguro de que les resultó difícil.
	AI_Output (other, self,"DIA_Mud_Nerve_14_15_01"); //Estoy seguro de ello.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 15;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 15
// **************************************************

INSTANCE DIA_Mud_Nerve_15 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_15_Condition;
	information	= DIA_Mud_Nerve_15_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_15_Condition()
{
	if ( (Mud_Nerve==15) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_15_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_15_07_00"); //¿De dónde eres? Debes estar contento de haber encontrado por fin a alguien que te comprenda. Yo soy de Khorinis. ¿Has estado allí? Bueno, pero no importa.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 16;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 16
// **************************************************

INSTANCE DIA_Mud_Nerve_16 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_16_Condition;
	information	= DIA_Mud_Nerve_16_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_16_Condition()
{
	if ( (Mud_Nerve==16) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_16_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_16_07_00"); //¿Tienes algo de comer para mí? Ya que soy una especie de visita, sería de buena educación darme algo. Eso son buenas maneras. Mis amigos en Khorinis me lo enseñaron. Me apreciaban mucho.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 17;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 17
// **************************************************

INSTANCE DIA_Mud_Nerve_17 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_17_Condition;
	information	= DIA_Mud_Nerve_17_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_17_Condition()
{
	if ( (Mud_Nerve==17) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_17_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_17_07_00"); //¿Crees que alguna vez nos visitará alguien? Es probable que no, porque no volverían a salir de aquí, ¿no?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 18;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 18
// **************************************************

INSTANCE DIA_Mud_Nerve_18 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_18_Condition;
	information	= DIA_Mud_Nerve_18_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_18_Condition()
{
	if ( (Mud_Nerve==18) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_18_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_18_07_00"); //Ahora que estás conmigo, podríamos darles lecciones a algunos. Estos bastardos llevan años abusando de mí. Cuando vea a uno de ellos, le voy a decir una cosa o dos.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 19;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 19
// **************************************************

INSTANCE DIA_Mud_Nerve_19 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_19_Condition;
	information	= DIA_Mud_Nerve_19_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_19_Condition()
{
	if ( (Mud_Nerve==19) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_19_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_19_07_00"); //Formamos un equipo ideal. Podríamos tomar el control del Campamento Viejo. Como somos un equipo, los Magnates del Mineral no supondrían ningún problema para mí. Discurriré un plan.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 0;
	AI_StopProcessInfos	( self );
};
