// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese k�nnen	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner N�he gezaubert wird -> er fordert auf, damit aufzuh�ren!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	P�nten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Pa� auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuh�ren)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche k�mpfen und der Spieler die Waffe wegsteckt) oder als Reaction �ber das news-Ged�chtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn pl�tzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	M�rder -> kann ihn pl�tzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC fr�her noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC fr�her besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zur�ckzugeben, seine Waffe wegzustecken -> "Wer nicht h�ren will mu� f�hlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(T�r,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC tr�gt Waffe des NSCs -> NSC ist st�rker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schw�cheren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schw�chere) SC	etwas nimmt, da� ihm geh�rt	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schw�cheren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Sch�tzling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs get�tet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// T�dlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	sch�cher als sein Kontrahent
											// 2. SC zieht Waffe oder n�hert sich mit Waffe und NSC ist schw�cher als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Schei�e, was ein H�llenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich St�rker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird gepl�ndert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC pl�ndert bewu�tlosen SC/aNSC. W�hrend er sich b�ckt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC pl�ndert bewu�tlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC �rgert sich dar�ber, da� er beim Durchsuchen eines bewu�tlosen/toten K�rpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, T�r) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schw�cheren	SC in seiner H�tte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zur�ckzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schw�cherer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer H�tte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zur�ckzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gem�se (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	dr�ben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	K�mpfer	schl�gt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist get�tet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der K�mpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC t�tet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schl�gerei" get�tet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, r�keln)

// Gr��e
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('F�r Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schl�fer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da dr�ben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung �ber 100
	var string	NoLearnYouAlreadyKnow	;	// Du mu�t erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im R�umen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespr�ch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC r�ckt NSC zu dicht auf die Pelle -> "Kann ich was f�r Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schw�cherem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht st�rkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des st�rkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gek�mpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schw�cher...
	var string	LookAway;					// Eingesch�chterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC tr�gt	Waffe des sch�cheren NSCs -> NSCs verlangt die Waffe zur�ck	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zur�ckweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC tr�gt	eine Waffe,	die	dem	NSC	geh�rt -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC tr�gt Waffe des NSCs -> NSC ist schw�cher (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC tr�gt Waffe des schw�cheren NSCs ->	NSCs verlangt die Waffe	zur�ck ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Schei�-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	st�rkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zur�ck

	VAR	STRING	TheyKilledMyFriend;			// NSC T�ter - NSC zu Opfer freundlich, zu T�ter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat geh�rt, da� der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Sch�tzling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/geh�rt hat, da� ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon geh�rt, da� Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann m�ssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde get�tet
	var	STRING	YouKilledEBr;				// Erzbaron get�tet
	VAR	STRING	YouKilledGur;				// Guru get�tet
	VAR	STRING	YouKilledMage;				// Guru get�tet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler get�tet.
	VAR	STRING	YouKilledNCfolk;			// S�ldner, Organisator, Sch�rfer oder Bauer get�tet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize get�tet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz sch�n	gepl�ttet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zuf�llig zu "Dialogen" zusammengew�rfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, da� das �rger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's f�r Dich, mu� nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte mu� wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man mu� eben aufpassen was man rumerz�hlt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man h�rt...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...fr�her w�re das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich h�r nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verla� Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, da� sich daran was �ndern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das w�re schon lange gekl�rt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...la� uns lieber �ber was anderes reden...
	VAR	STRING	Om;							// Ommm (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit R�cken zu dir)                                   
	var string	SC_HeyWaitASecond;			//SC: Warte mal! (Nsc im vorgeigehen anhalten)                                            
	var string DoesntWork;				
	var string PickBroke;				
	var string NeedKey;					
	var string NoMorePicks;				
	var string InvFull;					

};


instance SVM_0 (C_SVM)				// wird nur intern gebraucht...
{

};


// ********************************
// 		Die SVM-Instanzen		(ToDo: News noch �berarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese m�ssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Sch�rfer)	N�rgler, Alkoholiker, schimpft �ber	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//�Det�n esa hechicer�a!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//�Quieres que te d� una paliza? ���Detenla de inmediato!!!
	WeaponDown					=	"SVM_1_WeaponDown"					;//�Deja esa arma!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//�Aparta de una vez esa maldita arma!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//��D�jala!!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//�Si quieres que te parta la boca, ap�ntame otra vez!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//�Cuidado! Si intentas eso otra vez te parto la jeta.
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Olvidemos esa discusi�n sin importancia, �vale?
	Strange						=	"SVM_1_Strange"						;//�L�rgate, bastardo!
	DieMonster					=	"SVM_1_DieMonster"					;//�Maldito hijo de perra!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//�Te vas a enterar!
	NowWait						=	"SVM_1_NowWait"						;//Te voy a partir la cara...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//�Parece que quieres que te parta la cara!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//�Lo estabas pidiendo!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Har� que tengan que sacarte en cachitos.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//�Te advert� que apartaras tus manazas de mis cosas!
	DirtyThief					=	"SVM_1_DirtyThief"					;//�Te matar�, ladr�n!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//�Nadie se mete con mis amigos!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Has sacudido a uno de los nuestros. �Ahora me toca a m� ZURRARTE!
	Dead						=	"SVM_1_Dead"						;//�Aaaaargh!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//�Te arrepentir�s de eso!
	YesYes						=	"SVM_1_YesYes"						;//�Tranquilo! �Has vencido!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//�Mierda! �Corre todo lo que puedas!
	Help						=	"SVM_1_Help"						;//�Maldita sea!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//�Nos volveremos a ver!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Intenta eso otra vez y lo lamentar�s.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//�Es un arma preciosa! �D�mela!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//�Gracias por el mineral, h�roe!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//�Pobre imb�cil, ni siquiera tienes mineral!
	HandsOff					=	"SVM_1_HandsOff"					;//�Quita las manos!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//�P�rate!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//�Oye! �C�mo has entrado aqu�?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//�Crees que soy est�pido?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//�Sal de mi caba�a o llamar� a los guardias!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//�Aqu� no pintas nada! �L�rgate!
	WiseMove					=	"SVM_1_WiseMove"					;//�Chico listo!
	Alarm						=	"SVM_1_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//���ALERTA!!! ���INTRUSO!!!
	BehindYou					=	"SVM_1_BehindYou"					;//�Detr�s de ti!
	TheresAFight				=	"SVM_1_TheresAFight"				;//�Ah, una pelea!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//�M�s fuerte!
	CheerFight					=	"SVM_1_CheerFight"					;//�Luch�is como mujeres!
	CheerFriend					=	"SVM_1_CheerFriend"					;//�Acaba con �l!
	Ooh							=	"SVM_1_Ooh"							;//�Devu�lvesela!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//�Dale!
	RunCoward					=	"SVM_1_RunCoward"					;//�Vuelve, mariquita!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//�Ya ha tenido bastante!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//�Se lo merece!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//�Por qu� lo has matado? �Has firmado tu sentencia de muerte!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//�Buena pelea!
	Awake						=	"SVM_1_Awake"						;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Hola
	ALGreetings					=	"SVM_1_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_1_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_1_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Est� all�.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Vuelve en cuanto tengas m�s experiencia.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_1_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_1_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//�Puedo hacer algo por ti?
	MakeWay						=	"SVM_1_MakeWay"						;//�D�jame pasar!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//�Qu�tate de en medio, t�o!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//�Est�s sordo? ��APARTA!!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//�Otra vez buscas l�os?
	LookAway					=	"SVM_1_LookAway"					;//�Uhhhhh! �No he visto nada!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//�Vale, vale! �Qu�datelo!
	WhatsThat					=	"SVM_1_WhatsThat"					;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//�Vas por ah� con MI arma!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//�Dame eso!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//�Entonces qu�datelo! �No lo necesito!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Cogieron a uno de los nuestros. Si le pongo las manos encima a ese cerdo...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Maldita sea, �por qu� no me has despertado?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//�Te han dado una paliza? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//�Has tumbado a un magnate del mineral! �Est� realmente furioso contigo!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Has tumbado a un gur�. �Parece que te las apa�as para atraer problemas como un im�n!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//�Vencer a un mago es muy mala idea!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//�No puedes ir por ah� pegando a los novicios!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//�Deja en paz a mis muchachos!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Has zurrado a mi amigo...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//�No se tolerar� que causes problemas!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//�Si golpeas a alguien que est� bajo mi protecci�n, habr� repercusiones!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//�Capullo, me has robado! �No vuelvas a intentarlo!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//�Queremos recuperar nuestras cosas! �D�noslas!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//�Has robado a los magnates del mineral! �Para qu� demonios lo has hecho?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//�Has robado a los gur�s? L�stima que te pillaran.
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//�Has robado a los magos! �Qu� idea m�s est�pida!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//�Uno de los nuestros ha muerto y t� est�s implicado! �Si cometes el m�s m�nimo error, morir�s!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s loco?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//�Ha sido una lucha justa! �Me has dado una buena tunda, t�o!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...lo peor...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...tal vez, pero �qu� m�s da?...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...totalmente imb�cil...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...no es mi problema...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...�por qu� sucede eso una y otra vez?...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...debe de haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...no digas tantas chorradas, s�, s�...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...no deber�as creerte todo...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_1_Om"							;//Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einsch�chterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//�Sin hechicer�a!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//�OYE! �He dicho que sin magia!
	WeaponDown					=	"SVM_2_WeaponDown"					;//�Vamos, aparta eso!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//�Deja esa arma!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//�Cuidado a d�nde apuntas!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//�Si sigues apunt�ndome, me lo voy a tomar como algo personal!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Oye, �a qu� ven�a eso?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Olvid�moslo, �vale?
	Strange						=	"SVM_2_Strange"						;//�Qu� raro! �D�nde se ha ido?
	DieMonster					=	"SVM_2_DieMonster"					;//�Otro!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//�Me temo que tengo que eliminarte!
	NowWait						=	"SVM_2_NowWait"						;//�Es por tu culpa!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//�A�n no has tenido bastante?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//�Si eso es lo que quieres!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//�Sabes que aqu� no pintas nada!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//�Por qu� toqueteas cosas que no son tuyas?
	DirtyThief					=	"SVM_2_DirtyThief"					;//�Me has robado! �No lo olvidar�!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//�Nadie se mete con mis chicos!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//�Has matado a uno de los nuestros! �Pagar�s por ello!
	Dead						=	"SVM_2_Dead"						;//�Aaargh!
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//�Lo lamentar�s!
	YesYes						=	"SVM_2_YesYes"						;//�Tranquilo, tranquilo, has vencido!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//�Yo... s�lo estoy consiguiendo ayuda!
	Help						=	"SVM_2_Help"						;//�No tengo tiempo, tengo cosas que hacer!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//�Seguro que nos volveremos a ver!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//�No vuelvas a intentar eso!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//�Me quedar� con esa arma!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//�No necesitas tanto mineral!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//�No tienes mineral? �No parece que sea tu d�a de suerte!
	HandsOff					=	"SVM_2_HandsOff"					;//�Quita las manos!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//�Largo de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//�Oye! �C�mo has entrado aqu�?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//�No es muy inteligente por tu parte que me consideres est�pido!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//�Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//�Sal de mi caba�a o llamar� a los guardias!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//�Ap�rtate de las caba�as!
	WiseMove					=	"SVM_2_WiseMove"					;//�La decisi�n correcta!
	Alarm						=	"SVM_2_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//��ALERTA!!
	BehindYou					=	"SVM_2_BehindYou"					;//�Detr�s de ti!
	TheresAFight				=	"SVM_2_TheresAFight"				;//�Ah, una pelea!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//�Eso es todo?
	CheerFight					=	"SVM_2_CheerFight"					;//�Despierta, tortuga!
	CheerFriend					=	"SVM_2_CheerFriend"					;//�Buen golpe!
	Ooh							=	"SVM_2_Ooh"							;//�Eso duele!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//A�n se mueve.
	RunCoward					=	"SVM_2_RunCoward"					;//�Qu�date aqu�, canijo!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//�Ya ha tenido bastante!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//�Se lo merec�a!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//�Lo has matado! �Era necesario?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//�Fue una buena pelea, aunque demasiado corta!
	Awake						=	"SVM_2_Awake"						;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Hola.
	ALGreetings					=	"SVM_2_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_2_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_2_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Por all�.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Tienes que llegar al nivel avanzado antes de convertirte en maestro
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_2_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_2_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//�Puedo hacer algo por ti?
	MakeWay						=	"SVM_2_MakeWay"						;//�D�jame pasar!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//�Qu�tate de en medio!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//�L�rgate o te pasar� por encima!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_2_LookAway"					;//�No he visto nada! �No hay problema!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//�Vale! �Qu�datelo!
	WhatsThat					=	"SVM_2_WhatsThat"					;//�Eh? �Qu�?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//��sa que llevas ah� parece mi arma!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//�Venga, dame eso!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//�No lo necesito!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Alguien ha matado a uno de los nuestros. �Si lo cogemos, est� perdido!
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//�Por qu� me has despertado?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//�Te han dado una paliza? �Debo admitir que me parece bien!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//�Has vencido a un magnate del mineral!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Has tumbado a un gur�. �No s� si eso es valent�a o locura!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//�Para vencer a un mago... tienes que ser un hombre muy valiente!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//�Yo me aseguro de mantener el orden aqu�!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//�El motivo da igual! �Si golpeas a un cavador, te metes en un l�o!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//�Has pegado a un amigo m�o!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//�Deja en paz a los novicios!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//�No se pega a mis chicos! �Entiendes?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//�Por qu� me has robado?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Tienes algo que nos pertenece. �Nos gustar�a recuperarlo!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//�Has robado a los gur�s? �Tienes suerte de que no te hayan cogido!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//�A los magos no les gusta que la gente revuelva en sus cosas!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//�Uno de los nuestros pesa sobre tu conciencia! �Si cometes otro error, te tocar� a ti!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//�Ha sido una lucha justa! �Me has dado una buena tunda, t�o!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gem�se. "Ich schau noch�n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//�Basta de magia!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//�Ya basta de magia!
	WeaponDown					=	"SVM_3_WeaponDown"					;//�Deja esa arma!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//��Si sigues jugueteando con esa arma me voy a cabrear!!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//�Por qu� me apuntas?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//�Deja el arma si no quieres que me cabree!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Oye, �a qu� ven�a eso?
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//De acuerdo, consideremos que nuestra discusi�n ha sido un malentendido.
	Strange						=	"SVM_3_Strange"						;//�Ha desaparecido?
	DieMonster					=	"SVM_3_DieMonster"					;//�Maldito animal, no volver�s a molestarme!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//�Vas a morir enseguida!
	NowWait						=	"SVM_3_NowWait"						;//�Parece que debo explicarme mejor!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//�Parece que a�n no has tenido bastante!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//�T� lo has querido!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//�Aqu� no pintas nada! �Voy a tener que darte una tunda!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Supongo que tendr� que sacudirte en la mano; es el �nico idioma que entiendes.
	DirtyThief					=	"SVM_3_DirtyThief"					;//�Me est�s robando! �No me lo puedo creer!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//�No puedes ir por ah� pegando a todo el que te encuentras!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//�Has matado a uno de los nuestros! ��se ha sido tu �ltimo error!
	Dead						=	"SVM_3_Dead"						;//�Aaargh!
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//�Lo lamentar�s!
	YesYes						=	"SVM_3_YesYes"						;//�Has vencido! �Vale!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//�Mierda! �Corre todo lo que puedas!
	Help						=	"SVM_3_Help"						;//�Tengo que marcharme!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//�Nos volveremos a ver!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//�No vuelvas a intentar nada parecido!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//�Gracias por el arma!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//�Coger� un poco m�s de tu mineral!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//�No tienes mineral? �Qu� pena, t�o, qu� pena!
	HandsOff					=	"SVM_3_HandsOff"					;//�Quita las manos!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//�P�rate!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//�Oye! �De d�nde has salido?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//�No soy tan est�pido como crees!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//�Deja de rondar por aqu�!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//�Desaparece de mi caba�a o llamar� a los guardias!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//�Qu� haces? �Como te coja, vas a morir!
	WiseMove					=	"SVM_3_WiseMove"					;//�As� que sabes lo que te conviene!
	Alarm						=	"SVM_3_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//��ALERTA!!
	BehindYou					=	"SVM_3_BehindYou"					;//�Cuidado!
	TheresAFight				=	"SVM_3_TheresAFight"				;//�Una pelea!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//�Sac�dele!
	CheerFight					=	"SVM_3_CheerFight"					;//�Qu� intentas hacer?
	CheerFriend					=	"SVM_3_CheerFriend"					;//�Buen golpe!
	Ooh							=	"SVM_3_Ooh"							;//�Ooooh!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//�S�! �Muy bien!
	RunCoward					=	"SVM_3_RunCoward"					;//�Est� huyendo!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//�Ha acabado con �l!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//�Se lo merec�a desde hace bastante tiempo!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Ya no va a moverse m�s. Le has matado.
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Nada m�s que peleas...
	Awake						=	"SVM_3_Awake"						;//Un nuevo d�a y nada ha cambiado...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Eh, t�o.
	ALGreetings					=	"SVM_3_ALGreetings"					;//�Por G�mez, s�, s�!
	MageGreetings				=	"SVM_3_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_3_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Est� all�.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//No tienes suficiente experiencia. �No puedo ense�arte eso!
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_3_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_3_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//�Quer�as algo?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//�Puedo hacer algo por ti?
	MakeWay						=	"SVM_3_MakeWay"						;//�D�jame pasar!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//�Qu�tate de en medio, t�o!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//�Cu�ntas veces te lo tengo que decir? �D�jame pasar!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_3_LookAway"					;//�No he visto NADA! �Ni siquiera estoy aqu�!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//�Vale, vale! �Qu�datelo!
	WhatsThat					=	"SVM_3_WhatsThat"					;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//�Llevas encima mi arma!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//�Dame eso!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//�Lo que t� digas! �De todos modos, no lo necesito!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Han matado a otro de los nuestros. Ninguno saldremos con vida de aqu�...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//�Por qu� me has arrancado de mis sue�os?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//�Te merec�as esa paliza!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//�Has vencido a un magnate del mineral! Tienes ganas de l�os, �no?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Has vencido a un gur�. ��sa te la van a guardar!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//�Vencer a un mago te reportar� muchos problemas!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//�La pr�xima vez deja en paz a los novicios!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//�Si sacudes a un cavador, yo tendr� que hacer lo mismo contigo!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//�Has zurrado a uno de mis amigos!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//�Los novicios est�n bajo mi protecci�n! �D�jales en paz!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//�Los cavadores me pagan para que no tengan problemas! �Har� que siga siendo as�!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//�Me has robado, ladr�n asqueroso!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Tienes cosas que nos pertenecen. Ser� mejor que nos las devuelvas.
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//�Has robado a los gur�s! L�stima que te pillaran.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//�Deber�as ser m�s r�pido al tratar de robar a los magos!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//�Uno de los nuestros pesa sobre tu conciencia! �Un error m�s y te tocar� a ti!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//�Ha sido una lucha justa! �Me has dado una buena tunda, t�o!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Gr�nschn�beln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//�Basta de magia!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//�Ser� mejor que hagas caso de mi consejo y te dejes de hechicer�as!
	WeaponDown					=	"SVM_4_WeaponDown"					;//�Deja esa arma si no quieres meterte en un l�o!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//��Deja esa arma inmediatamente!!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//�A ver a d�nde apuntas con eso!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//�Si no te est�s quieto te quitar� tu juguete!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//�Eh! �Cuidado!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//�Olvidemos nuestra discusi�n sin importancia!
	Strange						=	"SVM_4_Strange"						;//�Sal! �Que se te vea!
	DieMonster					=	"SVM_4_DieMonster"					;//�Da igual cu�ntos mates, siguen viniendo m�s!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//�No vas a cumplir m�s a�os!
	NowWait						=	"SVM_4_NowWait"						;//Te ense�ar� a no incordiarme...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//�A�n no has tenido bastante?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//�T� lo has querido!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//�No fuiste muy listo al meterte aqu�!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//�Tus artima�as no pueden quedar sin castigo!
	DirtyThief					=	"SVM_4_DirtyThief"					;//�Te atreviste a robarme!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Meterte con nosotros no te reportar� ning�n beneficio.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//�Has matado a uno de los nuestros! �Ojo por ojo!
	Dead						=	"SVM_4_Dead"						;//�Aaargh!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//�Lo lamentar�s!
	YesYes						=	"SVM_4_YesYes"						;//�No hay problema! �Has vencido!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//�Largu�monos de aqu� r�pido!
	Help						=	"SVM_4_Help"						;//�Me estoy volviendo demasiado viejo para eso!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//�Esto no se me va a olvidar en mucho tiempo!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//�No vuelvas a intentar nada parecido!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//�Ser� mejor que me lleve esa arma!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//�Yo me ocupar� mejor de tu mineral!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Ni siquiera unas pocas pepitas de mineral.
	HandsOff					=	"SVM_4_HandsOff"					;//�Quita las manos!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//�L�rgate!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//�Aqu� no pintas nada!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//�No estoy de humor para esas bromas!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//�Sal o llamo a los guardias!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//�Qu� hac�as aqu� dentro?
	WiseMove					=	"SVM_4_WiseMove"					;//�Has tenido suerte!
	Alarm						=	"SVM_4_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//���INTRUSO!!!
	BehindYou					=	"SVM_4_BehindYou"					;//�Detr�s de ti!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Otra pelea.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//�M�s fuerte!
	CheerFight					=	"SVM_4_CheerFight"					;//�Eso es todo lo que puedes hacer?
	CheerFriend					=	"SVM_4_CheerFriend"					;//�Sac�dele!
	Ooh							=	"SVM_4_Ooh"							;//�Devu�lvesela!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//�Muy bien!
	RunCoward					=	"SVM_4_RunCoward"					;//�Ese cobarde huye!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//�Cuando era joven, los hombres eran duros!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//�Es por tu culpa!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//�Le has matado! �Has cometido un grave error!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//En los viejos tiempos, las peleas eran mejores.
	Awake						=	"SVM_4_Awake"						;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Saludos.
	ALGreetings					=	"SVM_4_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_4_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_4_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//�Puedes encontrarle all�!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_4_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_4_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//�Quer�as algo?
	MakeWay						=	"SVM_4_MakeWay"						;//D�jame pasar.
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//�Qu�tate de en medio!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//�Ap�rtate o lo lamentar�s!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_4_LookAway"					;//Ni veo, ni oigo, ni digo...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//�Qu�datelo!
	WhatsThat					=	"SVM_4_WhatsThat"					;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//�S� buen chico y devu�lveme mi arma!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//�Venga, dame eso!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//�Pues no lo hagas! �Me alegro de librarme de eso!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Si averiguamos qui�n mat� a uno de los nuestros...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//�Est�s interrumpiendo mi descanso!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//�Te han zurrado! �Te ven�a bien una paliza!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//�Has vencido a un magnate del mineral!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Has vencido a un gur�. Estoy impresionado. Pero ni se te ocurra intentarlo de nuevo.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Si has vencido a un mago... �debes ser un hombre valiente!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Debes estar loco para sacudir as� a un novicio.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//�Qu� cre�as que hac�as sacudiendo a un cavador?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//�Te has metido con uno de mis amigos! �Eso es muy arriesgado!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//�Si vuelves a poner la mano encima de un novicio lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Eres demasiado valiente; si tocas a uno de los protegidos, te podr�as meter en un l�o.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//�Mant�n las manos alejadas de mis cosas! �Te enteras?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Tienes cosas que nos pertenecen. �Devu�lvenoslas!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//�Has robado a los gur�s! �Al menos tendr�as que haber evitado que te pillaran!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//�A los magos no les gusta que haya gente revolviendo en sus cosas!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//�Uno de los nuestros pesa sobre tu conciencia! �Un error m�s y te tocar� a ti!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//�Hay otra caba�a vac�a en el Campamento Nuevo, y parece que est�s implicado de alg�n modo!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//�Me has dado una buena tunda, t�o! �Ha sido una lucha justa! �Pero ya ha acabado!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...debe de haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_4_Om"							;//Ommm
};


instance SVM_5 (C_SVM)				//Lebensk�nstler, offen, Fr�hlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewu�t, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//�Ser� mejor que pares esa magia!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//�Cuando te digo que dejes la magia, hablo en serio!
	WeaponDown					=	"SVM_5_WeaponDown"					;//�Qu� pretendes hacer con esa arma, t�o?
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//�Vega, aparta eso!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//�Est�s apunt�ndome, payaso!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//�Si no paras, yo tambi�n practicar� contigo!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//�Eh! �Est�s ciego o qu�?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//�Olvidemos nuestra discusi�n sin importancia! �Vale?
	Strange						=	"SVM_5_Strange"						;//�Estaba aqu� hace un instante! �Qu� raro!
	DieMonster					=	"SVM_5_DieMonster"					;//�Ahora te toca a ti, bastardo!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//�Te toca pagar!
	NowWait						=	"SVM_5_NowWait"						;//�Est�s pidiendo que te den una paliza urgentemente!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//�A�n no has tenido bastante?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//�De acuerdo, t� lo has querido!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//�Tendr�n que sacarte fuera!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Te lo advert�. �Si tocas mis cosas, te metes en un l�o!
	DirtyThief					=	"SVM_5_DirtyThief"					;//�Ladr�n! �Te ense�ar� modales!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//�Nadie se mete con mis chicos sin lamentarlo despu�s!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//�Has matado a uno de mis hombres! �Te voy a matar!
	Dead						=	"SVM_5_Dead"					;//�Aaargh!
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//�Lo lamentar�s!
	YesYes						=	"SVM_5_YesYes"						;//�Tranquilo! �Has vencido!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//��ste es demasiado grande para m�!
	Help						=	"SVM_5_Help"						;//�Maldita sea!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//�La pr�xima vez ser� distinto!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//�No vuelvas a intentar nada parecido!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//�Me gusta esa arma!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//�Har� que se invierta bien tu mineral!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//�Qu� mala suerte! �No hay mineral!
	HandsOff					=	"SVM_5_HandsOff"					;//�Quita las manos!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//�L�rgate de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//�Eh! �De d�nde has salido?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//�Buen chiste!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//�Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//�Sal de aqu� o llamo a los guardias!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//�Aqu� no pintas nada!
	WiseMove					=	"SVM_5_WiseMove"					;//�Aprendes r�pido!
	Alarm						=	"SVM_5_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//����ALERTA!!!!
	BehindYou					=	"SVM_5_BehindYou"					;//�Eh, cuidado!
	TheresAFight				=	"SVM_5_TheresAFight"				;//�Una pelea!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//�Dale!
	CheerFight					=	"SVM_5_CheerFight"					;//�Bien!
	CheerFriend					=	"SVM_5_CheerFriend"					;//�Sac�dele!
	Ooh							=	"SVM_5_Ooh"							;//�Cuidado!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//�Ya era hora!
	RunCoward					=	"SVM_5_RunCoward"					;//�Se est� escabullendo!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//�Yo dir�a que ha ganado con claridad!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//�Se lo merec�a!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//�Si vas por ah� matando gente, es normal que te metas en l�os!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//�Menuda pelea!
	Awake						=	"SVM_5_Awake"						;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//�Hola amigo!
	ALGreetings					=	"SVM_5_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_5_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_5_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Por all�.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//No puedo ense�arte nada porque eres bastante inexperto.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_5_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_5_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//�Puedo ayudarte?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//�Qu� quieres?
	MakeWay						=	"SVM_5_MakeWay"						;//D�jame pasar.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//�Vamos, quiero pasar!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//�Est�s sordo o quieres bronca?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_5_LookAway"					;//No he visto NADA... �Por qu�? �Qu� ha pasado?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//�Vale, qu�datelo!
	WhatsThat					=	"SVM_5_WhatsThat"					;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//�Preferir�a recuperar mi arma!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//�D�mela!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//�Hm, tampoco pasa nada! �Tengo m�s!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Se han cargado a uno de los nuestros. Si cojo a ese cerdo...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Eh, �a qu� viene eso? �Por qu� me has despertado?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//�Eh? �Te han zurrado? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//�Has vencido a un magnate del mineral! �Se qued� impresionado!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Has vencido a un gur�. Estoy impresionado. Pero ni se te ocurra intentarlo de nuevo.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Si has vencido a un mago... �debes ser un hombre valiente!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Debes estar loco para sacudir as� a un novicio.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//�Qu� cre�as que hac�as sacudiendo a un cavador?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//�Has sacudido a uno de mis amigos! �A qu� ven�a eso?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//�Si vuelves a poner la mano encima de un novicio lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Eres demasiado valiente; si tocas a uno de mis protegidos, podr�a resultarte muy peligroso.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//�C�mo te atreves a presentarte aqu�, ladr�n asqueroso?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Tienes cosas que nos pertenecen. �Ser� mejor que nos las devuelvas!
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//�Has robado a los gur�s! �Al menos tendr�as que haber evitado que te pillaran!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//�A los magos no les gusta que haya gente revolviendo en sus cosas!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//�Uno de los nuestros pesa sobre tu conciencia! �Un error m�s y te tocar� a ti!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//�Me has dado una buena tunda, t�o! �Ha sido una lucha justa! �Pero ha ya acabado!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Gr�lt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//�Basta de hechicer�a!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//�Det�n esa magia! �Ahora mismo!
	WeaponDown					=	"SVM_6_WeaponDown"					;//�Aparta esa arma!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//�Quieres que te d� una zurra? �Aparta eso!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//�Si no dejas eso va a pasarte algo malo!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//�Deja de apuntarme si no quieres que te parta la cara!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//�Eh! �Cuidado!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//�Eh, t�o! �Olvidemos nuestra discusi�n sin importancia! �Vale?
	Strange						=	"SVM_6_Strange"						;//�Sal! �Que se te vea!
	DieMonster					=	"SVM_6_DieMonster"					;//�Te voy a hacer picadillo, cerdo!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//�Te la has cargado!
	NowWait						=	"SVM_6_NowWait"						;//Te voy a partir la cara...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//�Parece que quieres que te parta la cara!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//�As� lo has querido!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//�Te voy a hacer picadillo!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Te lo advert�. �Si tocas mis cosas, te metes en un l�o!
	DirtyThief					=	"SVM_6_DirtyThief"					;//�Ladr�n! �Voy a acabar contigo!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//�Nadie se mete con mis chicos!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//�Has matado a uno de mis hombres! �Te voy a matar!
	Dead						=	"SVM_6_Dead"						;//�Aaargh!
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//�Lo lamentar�s!
	YesYes						=	"SVM_6_YesYes"						;//�S�, s�! �Tranquilo! �Has vencido!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//�Maldita sea, menudo animal! �L�rgate tan deprisa como puedas!
	Help						=	"SVM_6_Help"						;//�Maldita sea!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//��Acabar�s conoci�ndome!!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Si vuelves a intentar eso lo lamentar�s.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//�Esa arma parece muy manejable!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//�Gracias por el mineral, beber� a tu salud!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Mierda, ni siquiera tiene mineral...
	HandsOff					=	"SVM_6_HandsOff"					;//�Quita las manos!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//�L�rgate de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//�Eh! �De d�nde has salido?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//S�, �te crees que soy tonto?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//�Eh! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//�Sal o llamo a los guardias!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//�Qu� has estado haciendo aqu� dentro?
	WiseMove					=	"SVM_6_WiseMove"					;//�Has tenido suerte!
	Alarm						=	"SVM_6_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//���ALERTA!!! ���INTRUSO!!!
	BehindYou					=	"SVM_6_BehindYou"					;//�Detr�s de ti!
	TheresAFight				=	"SVM_6_TheresAFight"				;//�Ah, una pelea!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//�M�s fuerte!
	CheerFight					=	"SVM_6_CheerFight"					;//�Luch�is como mujeres!
	CheerFriend					=	"SVM_6_CheerFriend"					;//��Acaba con �l!!
	Ooh							=	"SVM_6_Ooh"							;//�No se lo consientas! �Dale una en los morros!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Dale. S�, se sigue moviendo.
	RunCoward					=	"SVM_6_RunCoward"					;//�Vuelve, cobarde!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//�Ha tenido suficiente!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//�Se lo merece!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//�Has firmado tu sentencia de muerte! �Eso te ense�ar� a no ir por ah� matando gente!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//�Ja ja ja! �Le has dado una lecci�n!
	Awake						=	"SVM_6_Awake"						;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//�Hola!
	ALGreetings					=	"SVM_6_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_6_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_6_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Est� all�.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_6_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_6_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//�Quer�as algo?
	MakeWay						=	"SVM_6_MakeWay"						;//�D�jame pasar!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//�Vamos, hazte a un lado!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//�Ap�rtate! �O quieres que te lo haga entender a golpes?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//�Otra vez buscas bronca?
	LookAway					=	"SVM_6_LookAway"					;//�No he visto nada! �De verdad!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//�Vale, vale, qu�datelo!
	WhatsThat					=	"SVM_6_WhatsThat"					;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//�Devu�lveme mi arma, buf�n!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//�Devu�lvemela, t�o!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//�No importa! �No voy a necesitarla!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Se han cargado a uno de los nuestros. Si cojo a ese cerdo...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Maldita sea, �por qu� me has despertado?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//�Te han pegado una buena paliza? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//�Has sacudido a un magnate del mineral! �Est� furioso contigo!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Has sacudido a un gur�. �Parece como si atrajeras los problemas como un im�n!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//�Vencer a un mago es una idea espantosa, t�o!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//�No puedes ir por ah� pegando a los novicios!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//�Deja en paz a mis muchachos!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Has zurrado a un amigo m�o...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//�No se tolerar� que causes problemas!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//�Si golpeas a alguien que est� bajo mi protecci�n, habr� repercusiones!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//�Capullo, me has robado! �No vuelvas a intentarlo!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//�Queremos recuperar nuestras cosas! �D�noslas!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//�Has robado a los magnates del mineral! �Para qu� demonios lo has hecho?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//�Has robado a los gur�s? L�stima que te pillaran.
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//�Has robado a los magos! �Qu� idea m�s est�pida!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//�Uno de los nuestros ha muerto y t� est�s implicado! �Si cometes el m�s m�nimo error, morir�s!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s loco?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//�Me has dado una buena tunda, t�o! �Ha sido una lucha justa! �Pero ya ha acabado!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//�Deja eso! �Deja eso!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//�Deja esa magia, d�jala!
	WeaponDown					=	"SVM_7_WeaponDown"					;//�Deja esa arma, d�jala!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//�Te lo digo en serio! �D�jala!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//�Me est�s apuntando? �Cuidado!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//�Crees que puedes intimidarme? �Est�s equivocado!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//�Me acordar� de eso! �Cuidado!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Olv�date de esa discusi�n, �vale?
	Strange						=	"SVM_7_Strange"						;//�D�nde se ha ido? �No puede ser! ��Es imposible!!
	DieMonster					=	"SVM_7_DieMonster"					;//�Te har� pedazos, animal!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//�Te voy a partir en dos! �Ahora te toca a ti! �Sin piedad!
	NowWait						=	"SVM_7_NowWait"						;//�Por fin me das una raz�n!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//�Quieres volver a intentarlo?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//�Sangre! ��Tu sangre!!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//�Te voy a partir en lonchas!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//�Deber�a cortarte los dedos!
	DirtyThief					=	"SVM_7_DirtyThief"					;//�Ladr�n asqueroso! �Quiero verte sufrir!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//�Aqu� nadie sacude a nadie excepto yo!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//�Has matado a uno de los nuestros!
	Dead						=	"SVM_7_Dead"						;//�Aaargh!
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//�No tendr�s mucho tiempo para lamentarte por ello!
	YesYes						=	"SVM_7_YesYes"						;//�Vale, vale!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//No tengo el arma adecuada. Nos volveremos a ver...
	Help						=	"SVM_7_Help"						;//�Maldita sea!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//�Nos vemos!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//�No vuelvas a hacer eso!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//�Me quedar� con esa arma!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//�Preferir�a matarte, pero el mineral tampoco me viene mal!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//�No tienes mineral? �Vago in�til!
	HandsOff					=	"SVM_7_HandsOff"					;//�Aparta tus manazas!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//�L�rgate! �Sal de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//�C�mo has entrado aqu�?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Te gusta aprovecharte de m�, �verdad?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//�L�rgate o llamar� a los guardias!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//�Aqu� no pintas nada!
	WiseMove					=	"SVM_7_WiseMove"					;//�Has tenido suerte! �Pero me habr�a gustado sobarte los morros!
	Alarm						=	"SVM_7_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//��ALERTA!!
	BehindYou					=	"SVM_7_BehindYou"					;//�Detr�s de ti!
	TheresAFight				=	"SVM_7_TheresAFight"				;//�Una pelea!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//�M�s fuerte!
	CheerFight					=	"SVM_7_CheerFight"					;//�Quiero ver sangre!
	CheerFriend					=	"SVM_7_CheerFriend"					;//��Dale la vuelta!!
	Ooh							=	"SVM_7_Ooh"							;//�Devu�lvele el golpe, idiota!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//��S�����!!
	RunCoward					=	"SVM_7_RunCoward"					;//��Vuelve con tu mam�!!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//�Ya ha tenido bastante!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//�Es por tu culpa!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Es un suicidio matar a alguien delante de testigos.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//�Buena pelea!
	Awake						=	"SVM_7_Awake"						;//�Hora de levantarse!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Hola.
	ALGreetings					=	"SVM_7_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_7_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_7_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//�Est�s ciego? �Por all�!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Tienes que llegar al nivel avanzado antes de convertirte en maestro
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_7_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_7_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//�Qu� quieres de m�?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//�Puedo hacer algo por ti?
	MakeWay						=	"SVM_7_MakeWay"						;//�D�jame pasar!
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//�Qu�tate de en medio!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//�Buscas bronca? �L�rgate de aqu�!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_7_LookAway"					;//�No he visto NADA!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//�Vale, vale! �Qu�datelo!
	WhatsThat					=	"SVM_7_WhatsThat"					;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//�Devu�lveme mi arma!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//�D�mela!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//�Vale! �Qu�datela! �Encontrar� otra soluci�n!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//�Uno de los nuestros ha muerto! �Esto clama venganza!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//�Por qu� me has despertado?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//�Te mereces la paliza que te han dado!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//�Has sacudido a un magnate del mineral! �Est� furioso contigo!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Has sacudido a un Gur�. �Parece como si atrajeras los problemas como un im�n!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//�Vencer a un mago es una idea espantosa, t�o!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//�As� que t� eres el que va por ah� pegando a los novicios!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//�Deja en paz a mis muchachos!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//�Has sacudido a la persona incorrecta! �Aqu� estamos muy unidos!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//�No se tolerar� que causes problemas!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//�Si golpeas a alguien que est� bajo mi protecci�n, habr� repercusiones!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//�Capullo, me has robado! �No vuelvas a intentarlo!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//�Queremos recuperar nuestras cosas! �D�noslas!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//�Has robado a los magnates del mineral! �Para qu� demonios lo has hecho?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//�Has robado a los gur�s? L�stima que te pillaran.
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//�Has robado a los magos! �Qu� idea m�s est�pida!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//�Uno de los nuestros ha muerto y t� est�s implicado! �Si cometes el m�s m�nimo error, morir�s!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//�Me has dado una buena tunda, t�o! �Ha sido una lucha justa! �Pero ya ha acabado!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, n�chtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//�No hagas hechizos cerca de m�!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//�Te digo que pares! �Ahora mismo!
	WeaponDown					=	"SVM_8_WeaponDown"					;//�Deja esa arma!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//�Como no apartes esa arma, te la vas a cargar!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//�Deja esa arma, idiota!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Gusano, �c�mo osas apuntarme?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//�Cuidado!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//De acuerdo, olvid�monos de nuestra discusi�n.
	Strange						=	"SVM_8_Strange"						;//�Sal! �S� que puedes o�rme!
	DieMonster					=	"SVM_8_DieMonster"					;//�Malditas criaturas!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Vas a morir. �No te lo tomes como algo personal!
	NowWait						=	"SVM_8_NowWait"						;//�Gusano, me est�s atacando! �Te vas a enterar...!
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//�No te tumb� ya en una ocasi�n? Vuelta a empezar...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//�Si no escuchas, tendr�s que recibir!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//�C�mo te atreves a venir por AQU�? �Espera un instante!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//�Supongo que tendr� que machacarte los dedos!
	DirtyThief					=	"SVM_8_DirtyThief"					;//�No deber�as haber robado eso!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//�Nadie se mete con mis chicos sin lamentarlo despu�s!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//�Matar a uno de los nuestros ha sido tu �ltimo error!
	Dead						=	"SVM_8_Dead"						;//�Aaargh!
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//�Lo vas a lamentar mucho!
	YesYes						=	"SVM_8_YesYes"						;//Tranquilo. �No pasa nada!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//�Preferir�a echar un vistazo a esta bestia desde lejos!
	Help						=	"SVM_8_Help"						;//�R�pido, salgamos de aqu�!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//�Nos volveremos a ver!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//�Si vuelves a intentar eso, morir�s!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//�Me gusta esa arma!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//�Creo que a�n no me has pagado el impuesto sobre el mineral!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//�Es normal que un vago como t� no tenga mineral!
	HandsOff					=	"SVM_8_HandsOff"					;//�Aparta tus manazas!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//�L�rgate de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Eh, �c�mo has entrado aqu�?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Eres un listillo, �verdad?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//�L�rgate o llamar� a los guardias!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//�Qu� has estado haciendo aqu� dentro?
	WiseMove					=	"SVM_8_WiseMove"					;//�Has tenido suerte!
	Alarm						=	"SVM_8_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//��ALERTA!! ����INTRUSO!!!!
	BehindYou					=	"SVM_8_BehindYou"					;//�Detr�s de ti!
	TheresAFight				=	"SVM_8_TheresAFight"				;//�Veamos qui�n se est� peleando!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//�M�s fuerte!
	CheerFight					=	"SVM_8_CheerFight"					;//�S�! �Vamos, vamos!
	CheerFriend					=	"SVM_8_CheerFriend"					;//�Bien! �No aflojes!
	Ooh							=	"SVM_8_Ooh"							;//�No se lo consientas! �Dale una en los morros!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//S�, dale. �A�n se mueve!
	RunCoward					=	"SVM_8_RunCoward"					;//�No vuelvas a aparecer por aqu�!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//�Vaya pelea m�s aburrida!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//�Se lo merece!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//Eso no era innecesario. Ahora tendr�s que afrontar las consecuencias.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//�Ha sido una buena pelea!
	Awake						=	"SVM_8_Awake"						;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Hola.
	ALGreetings					=	"SVM_8_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_8_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_8_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Est� por all�.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Tienes que llegar al nivel avanzado antes de convertirte en maestro
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_8_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_8_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//�Puedo hacer algo por ti?
	MakeWay						=	"SVM_8_MakeWay"						;//�Me dejas pasar por aqu�?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//�Qu�tate de en medio!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//�Quieres que te lo haga entender a golpes? �L�rgate de aqu�!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_8_LookAway"					;//Ejem... �Una vista preciosa!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//�Estupendo! Es tuya.
	WhatsThat					=	"SVM_8_WhatsThat"					;//�Eh! �Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//��sa que llevas es mi arma...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//�D�mela! �Ahora mismo!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Qu�datela, no la necesito.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Se han cargado a uno de los nuestros. Si cojo a ese cerdo...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//�Qu� pasa?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//�Eh? �Te han partido la cara? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//�Has vencido a un magnate del mineral! �Se qued� impresionado!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Has vencido a un gur�. Estoy impresionado. Pero ni se te ocurra intentarlo de nuevo.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Si has vencido a un mago... �debes ser un hombre valiente!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//�Sabes que los novicios est�n bajo mi protecci�n y, aun as�, les pones las manos encima?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//�Si tocas a los cavadores es como si echas mano a mis ingresos!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//No deber�as meterte con mis amigos.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//�Si vuelves a poner la mano encima de un novicio lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Si atacas a uno de mis protegidos, te podr�a costar la cabeza.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//�C�mo te atreves a presentarte aqu�, ladr�n asqueroso?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Tienes cosas que nos pertenecen. �Ser� mejor que nos las devuelvas!
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Has levantado a los gur�s algunas cosas, �verdad?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Has levantado a los magos un par de cosas, �verdad?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//�Uno de los nuestros pesa sobre tu conciencia! �Un error m�s y te tocar� a ti!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//�Me has dado una buena tunda, t�o! �Ha sido una lucha justa! �Pero ya ha acabado!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gem�tlicher H�ne, Besonnen, Brummiger B�r, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//�No quiero magia cerca de m�!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//�Te digo que pares! �Ahora mismo!
	WeaponDown					=	"SVM_9_WeaponDown"					;//�Tienes pensado atacarme?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Aparta eso si no quieres que te parta la cara.
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//�Cuidado con d�nde apuntas!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//�Aparta eso!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//�Eh! �Cuidado!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//I wouldn't mind forgetting about this little argument ...
	Strange						=	"SVM_9_Strange"						;//�Sal! �S� que puedes o�rme!
	DieMonster					=	"SVM_9_DieMonster"					;//�Estas bestias son est�pidas a m�s no poder!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//�Est�s acabado!
	NowWait						=	"SVM_9_NowWait"						;//�Vas a saber qui�n soy!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//�Eres jodidamente insistente!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//�Si no escuchas, tendr�s que recibir!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//�Vas a morir, intruso!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Te lo advert�. �Si tocas mis cosas, te metes en un l�o!
	DirtyThief					=	"SVM_9_DirtyThief"					;//�Ladr�n! �Voy a acabar contigo!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//�Nadie se mete con mis chicos!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//�Has matado a uno de mis hombres! �Te voy a matar!
	Dead						=	"SVM_9_Dead"						;//�Aaargh!
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Ya est�s muerto, s�lo que no lo sabes.
	YesYes						=	"SVM_9_YesYes"						;//Tranquilo. �No pasa nada!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//�Mierda, menuda bestia!
	Help						=	"SVM_9_Help"						;//�R�pido, salgamos de aqu�!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Seguro que nos volvemos a ver.
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//�La pr�xima vez te matar�!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//�Esta arma ahora es m�a!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//�Mineral! �Bueno, es mejor que nada!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Ni siquiera tiene mineral...
	HandsOff					=	"SVM_9_HandsOff"					;//�Quita las manos, amigo!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//�L�rgate de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//�Qu� haces aqu�?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//�Tienes pensado dejarme en rid�culo, t�o?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//�Eh, t�! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//�Sal o llamo a los guardias!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//�Qu� has estado haciendo aqu� dentro?
	WiseMove					=	"SVM_9_WiseMove"					;//�Tipo listo!
	Alarm						=	"SVM_9_Alarm"						;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//���ALERTA!!! ���INTRUSO!!!
	BehindYou					=	"SVM_9_BehindYou"					;//�Detr�s de ti!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Veamos lo buenos que son...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//�Sigue!
	CheerFight					=	"SVM_9_CheerFight"					;//�S�! �Vamos, vamos!
	CheerFriend					=	"SVM_9_CheerFriend"					;//�Bien!
	Ooh							=	"SVM_9_Ooh"							;//�Oh, ha golpeado donde duele!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//�Maravilloso control, chaval!
	RunCoward					=	"SVM_9_RunCoward"					;//�No vuelvas a aparecer por aqu�!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//La lucha est� decidida!
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//�Es por tu culpa!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//Eso era innecesario. Ahora tendr�s que afrontar las consecuencias.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//�Fue una buena pelea!
	Awake						=	"SVM_9_Awake"						;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Hola.
	ALGreetings					=	"SVM_9_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_9_MageGreetings"				;//�Por el honor de la magia!
	SectGreetings				=	"SVM_9_SectGreetings"				;//�Despierta!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//�Est�s ciego? �Por all�!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_9_HeyYou"						;//�Oye, t�!
	NotNow						=	"SVM_9_NotNow"						;//�Ahora no!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//�Puedo ayudarte?
	MakeWay						=	"SVM_9_MakeWay"						;//�D�jame pasar!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//�Hazte a un lado!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//�Vamos, ap�rtate!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//�Otra vez buscas bronca? �Por qu� siempre te metes conmigo?
	LookAway					=	"SVM_9_LookAway"					;//�Oh s�! �Qu� buen tiempo hace hoy!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//�Bien! Es tuyo.
	WhatsThat					=	"SVM_9_WhatsThat"					;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Contar� hasta tres, y despu�s me devolver�s el arma.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//�D�mela! �Ahora mismo!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Qu�datela, no la necesito.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Se han cargado a uno de los nuestros. Si cojo a ese cerdo...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//�Qu� pasa?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//�Eh? �Te han pegado una paliza? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//�Has vencido a un magnate del mineral! �Se qued� impresionado!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Has vencido a un gur�. Estoy impresionado. Pero ni se te ocurra intentarlo de nuevo.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Si has vencido a un mago... �debes ser un hombre valiente!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Debes estar loco para sacudir as� a un novicio.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//�Qu� cre�as que hac�as sacudiendo a un cavador?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//�Has sacudido a uno de mis amigos! �A qu� ven�a eso?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//�Si vuelves a poner la mano encima de un novicio lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Eres demasiado valiente; si tocas a uno de mis protegidos, podr�a resultarte muy peligroso.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//�C�mo te atreves a presentarte aqu�, ladr�n asqueroso?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//�Robar a los nuestros es lo peor que pod�as hacer! �Lo lamentar�s!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Has levantado a los gur�s algunas cosas, �verdad?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Has levantado a los magos un par de cosas, �verdad?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//�Uno de los nuestros pesa sobre tu conciencia! �Un error m�s y te tocar� a ti!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Una buena pelea. Tu entrenamiento ha merecido la pena.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...s�, si t� crees eso...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_9_Om"							;// Ommm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//�Basta de hechicer�a!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//���Detenla ahora mismo!!!
	WeaponDown					=	"SVM_10_WeaponDown"						;//�Deja esa arma!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//�Qu� crees que haces? �Quieres bronca conmigo?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//�Guarda eso o te lo guardo yo!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//�Si quieres l�os, sigue apunt�ndome!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//�Eh! �Cuidado! �Si lo haces una vez m�s, te la cargas!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//�Eh, t�o! �Olvidemos nuestra discusi�n sin importancia! �Vale?
	Strange						=	"SVM_10_Strange"						;//�Sal! �Que se te vea!
	DieMonster					=	"SVM_10_DieMonster"						;//�Bestias asquerosas!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//�Te la has cargado!
	NowWait						=	"SVM_10_NowWait"						;//�Te toca pagar!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//�Parece que quieres que te parta la cara!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//�As� lo has querido!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//�Te vas a enterar, intruso!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Te lo advert�. �Si tocas mis cosas, te metes en un l�o!
	DirtyThief					=	"SVM_10_DirtyThief"						;//�Ladr�n! �Voy a acabar contigo!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//�Nadie se mete con mis chicos!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//�Has matado a uno de mis hombres! �Te voy a matar!
	Dead						=	"SVM_10_Dead"							;//�Aaargh!
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//�Te vas a enterar! �Bastardo!
	YesYes						=	"SVM_10_YesYes"							;//�S�, s�! �Tranquilo! �Has vencido!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//�Menudo monstruo! �Corre todo lo que puedas!
	Help						=	"SVM_10_Help"							;//�Retirada!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//��Ya nos veremos!!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Si vuelves a intentar eso lo lamentar�s.
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//�Esta arma ahora es m�a!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//�Me quedar� con parte de tu mineral!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//�Maldita sea, no tiene mineral!
	HandsOff					=	"SVM_10_HandsOff"						;//�Canalla! �Aparta tus manazas!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//�L�rgate de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//�Eh! �De d�nde has salido?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//�Debes creer que soy tonto!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//�Eh, t�! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//�Sal o llamo a los guardias!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//�Qu� has estado haciendo aqu� dentro?
	WiseMove					=	"SVM_10_WiseMove"						;//�Has tenido suerte!
	Alarm						=	"SVM_10_Alarm"							;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//���ALERTA!!! ���INTRUSO!!!
	BehindYou					=	"SVM_10_BehindYou"						;//�Detr�s de ti!
	TheresAFight				=	"SVM_10_TheresAFight"					;//�Ah, una pelea!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//�M�s fuerte!
	CheerFight					=	"SVM_10_CheerFight"						;//�Sin piedad!
	CheerFriend					=	"SVM_10_CheerFriend"					;//��Acaba con �l!!
	Ooh							=	"SVM_10_Ooh"							;//�No se lo consientas!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//�Dale en la boca!
	RunCoward					=	"SVM_10_RunCoward"						;//�Vuelve, cobarde!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Un poco de viento y habr�a ca�do solo.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//�Se lo merece!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//�Has firmado tu sentencia de muerte! �Eso te ense�ar� a no ir por ah� matando gente!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//�Le has dado una lecci�n!
	Awake						=	"SVM_10_Awake"							;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//�Hola!
	ALGreetings					=	"SVM_10_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_10_MageGreetings"					;//�Por el honor de la magia!
	SectGreetings				=	"SVM_10_SectGreetings"					;//�Despierta!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Est� all�.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_10_HeyYou"							;//�Oye, t�!
	NotNow						=	"SVM_10_NotNow"							;//�Ahora no!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//�Puedo ayudarte?
	MakeWay						=	"SVM_10_MakeWay"						;//D�jame pasar.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//�Qu�tate de en medio!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//�Quieres que te lo haga entender a golpes? �Largo de aqu�!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//�Otra vez buscas bronca conmigo?
	LookAway					=	"SVM_10_LookAway"						;//En realidad no estoy aqu�...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//�Qu�datelo!
	WhatsThat					=	"SVM_10_WhatsThat"						;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//�Devu�lveme mi arma!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//�Devu�lvemela, t�o!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//�No importa! �No voy a necesitarla!
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Se han cargado a uno de los nuestros. �Estoy muy furioso!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//�Por qu� me has despertado?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//�Eh? �Te han pegado una buena paliza? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//�Has zurrado a un magnate del mineral!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Has vencido a uno de los gur�s.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Para vencer a un mago...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//�Antes de pegar a los novicios deber�as averiguar a qui�n est�s molestando!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//�Tengo que mantener el orden! �Deja en paz a mi gente!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//�Has pegado a un amigo m�o!
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//�Vuelve a poner las manos sobre un novicio y lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Si tocas a uno de mis protegidos, te costar� caro.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//�No vuelvas a intentarlo, ladr�n!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Tienes algo que nos pertenece. �Ser� mejor que lo devuelvas!
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Has levantando unas cuantas cosas a los gur�s. �No obstante, no fue muy inteligente que te pillaran haci�ndolo!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Has levantando un par de cosas a los magos, �verdad?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//�Uno de los nuestros pesa sobre tu conciencia! �Si cometes otro error, te tocar� a ti!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//�Felicidades! Has vencido. Ha sido una buena pelea.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vern�nftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//�No intentes ninguna hechicer�a cerca de m�!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//�Te digo que pares! �Ahora mismo!
	WeaponDown					=	"SVM_11_WeaponDown"						;//�Si buscas bronca, ven aqu�!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//�Aparta eso o te la cargas!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//�Deja eso!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//�As� que quieres bronca? �Est�s seguro?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//�Qu� haces? �Basta!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//De acuerdo, olvidemos nuestra peque�a discusi�n.
	Strange						=	"SVM_11_Strange"						;//�Mmh! �Maldita sea? �D�nde se ha metido?
	DieMonster					=	"SVM_11_DieMonster"						;//�Morir�n si siguen cruz�ndose en mi camino!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Si te haces enemigos, tienes que poder dominarlos. Muere.
	NowWait						=	"SVM_11_NowWait"						;//�No deber�as haber hecho eso!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//�No te tumb� ya en una ocasi�n? Vuelta a empezar...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//�Si no escuchas, vas a sufrir!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//�Eh, intruso! �Te voy a dar una lecci�n!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//�Supongo que tendr� que machacarte los dedos!
	DirtyThief					=	"SVM_11_DirtyThief"						;//�El robo no merece la pena!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//�Est�s perturbando mi zona! �Tengo que acabar contigo!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//�Matar a uno de los nuestros ha sido tu �ltimo error!
	Dead						=	"SVM_11_Dead"							;//�Aaargh!
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//�No deber�as haber hecho eso!
	YesYes						=	"SVM_11_YesYes"							;//�Vale, vale! �T� ganas!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//��ste es demasiado grande para m�!
	Help						=	"SVM_11_Help"							;//�Retirada!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//�Eso tendr� consecuencias, amigo!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//�No vuelvas a intentar eso!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//�Yo cuidar� tu arma mejor que t�!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//�Qu� amable eres dej�ndome parte de tu mineral!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//�Nada, no hay mineral!
	HandsOff					=	"SVM_11_HandsOff"						;//�Aparta tus sucias manos!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//�L�rgate de aqu� o har� que corras!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Eh, �c�mo has entrado aqu�?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//�No conmigo, colega!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//�Qu� se supone que sucede?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//La caba�a es m�a. �L�rgate o llamar� a los guardias!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//�Qu� estabas haciendo ah� dentro? �L�rgate si no quieres que te sacuda!
	WiseMove					=	"SVM_11_WiseMove"						;//�Bien! �No vuelvas a hacerlo!
	Alarm						=	"SVM_11_Alarm"							;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//��ALERTA!! ����INTRUSO!!!!
	BehindYou					=	"SVM_11_BehindYou"						;//�Detr�s de ti!
	TheresAFight				=	"SVM_11_TheresAFight"					;//�Veamos qui�n gana esta vez!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//�Venga, hazlo!
	CheerFight					=	"SVM_11_CheerFight"						;//�Deja de jugar con �l!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Oh, venga, puedes con �l, �no?
	Ooh							=	"SVM_11_Ooh"							;//�Oh! �No ha estado demasiado bien!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//�Mmh! No est� mal.
	RunCoward					=	"SVM_11_RunCoward"						;//�No vuelvas a aparecer por aqu�!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//�Buen golpe!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//�No importa! �Se lo merec�a!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//�Lo has matado, y te has metido en un buen l�o!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//�Muy bien! �Magn�fica actuaci�n!
	Awake						=	"SVM_11_Awake"							;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Hola.
	ALGreetings					=	"SVM_11_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_11_MageGreetings"					;//�Por el honor de la magia!
	SectGreetings				=	"SVM_11_SectGreetings"					;//�Despierta!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//�Est�s ciego? �Por all�!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Tienes que llegar al nivel avanzado antes de convertirte en maestro
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_11_HeyYou"							;//�Oye, t�!
	NotNow						=	"SVM_11_NotNow"							;//�Ahora no!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//�Qu� quieres?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//�Puedo hacer algo por ti?
	MakeWay						=	"SVM_11_MakeWay"						;//�Me dejas pasar por aqu�?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//�Qu�tate de en medio!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//�Quieres que te lo haga entender a golpes? �L�rgate de aqu�!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_11_LookAway"						;//�No voy a implicarme en esto!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//�Estupendo! Es tuya.
	WhatsThat					=	"SVM_11_WhatsThat"						;//�Eh! �Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//��sa que llevas es mi arma...?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//�Venga, d�mela!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Qu�datela, no la necesito.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Se han cargado a uno de los nuestros. Si cojo a ese cerdo...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//�Qu� pasa?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//�Eh? �Te han partido la cara? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Has vencido a un magnate del mineral. Es impresionante, pero est�pido. De hecho, muy est�pido.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Has vencido a un gur�.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//�Vencer a un mago... no es demasiado inteligente!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Yo protejo a estos muchachos, y t� has sacudido a uno de ellos...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//�Si tocas a los cavadores es como si echas mano a mis ingresos!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Quien hace da�o a mis amigos, me hace da�o a m�.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//�Si vuelves a poner la mano encima de un novicio lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Si atacas a uno de mis protegidos, te podr�a costar la cabeza.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//�C�mo te atreves a presentarte aqu�, ladr�n asqueroso?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Tienes cosas que nos pertenecen. �Ser� mejor que nos las devuelvas!
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Has levantado a los gur�s algunas cosas, �verdad?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Has levantado a los magos un par de cosas, �verdad?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//�Has infringido la norma principal! �No matar�s!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//Ha sido una buena pelea. Va a dolerme varios d�as. �Pero ya ha acabado!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o; eso es lo que pasa...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_11_Om"								;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-H�ndler		Nach au�en freundlich,jovial,Innen hinterh�ltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//�Det�n esa magia!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//�Cuando digo 'det�n la magia', hablo en serio!
	WeaponDown					=	"SVM_12_WeaponDown"						;//�Qu� pretendes hacer con el arma, t�o?
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//�Deja eso!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//�Me est�s apuntando!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//�Si no dejas de hacer eso, te vas a meter en un l�o!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//�Eh!, �est�s ciego o qu�?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Olvidemos esta discusi�n sin importancia, �vale?
	Strange						=	"SVM_12_Strange"						;//Estaba aqu� hace un momento. �Qu� raro!
	DieMonster					=	"SVM_12_DieMonster"						;//�Ha llegado tu hora, bastardo!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//�Te toca pagar!
	NowWait						=	"SVM_12_NowWait"						;//�Est�s pidiendo una buena paliza!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//�A�n no has tenido bastante?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//�De acuerdo, te lo has buscado!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//�Tendr�n que sacarte fuera!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Te lo advert�. �Si tocas mis cosas, te metes en un l�o!
	DirtyThief					=	"SVM_12_DirtyThief"						;//�Ladr�n! �Voy a ense�arte modales!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//�Nadie se mete con mis chicos sin lamentarlo despu�s!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//�Has matado a uno de mis hombres! �Te voy a matar!
	Dead						=	"SVM_12_Dead"							;//�Aaargh!
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//�Lo lamentar�s!
	YesYes						=	"SVM_12_YesYes"							;//�Tranquilo! Has ganado.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//�Me largo! ��se es demasiado grande para m�!
	Help						=	"SVM_12_Help"							;//�Maldita sea!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//�La pr�xima vez ser� distinto!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//�No vuelvas a intentar eso!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//�Me gusta esa arma!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//�Har� que se invierta bien tu mineral!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//�Maldita sea! �No hay mineral!
	HandsOff					=	"SVM_12_HandsOff"						;//�Quita las manos!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//�L�rgate de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//�Eh! �De d�nde has salido?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//�Te crees que soy est�pido?
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//�Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//�Sal de aqu� o llamo a los guardias!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//�Aqu� no pintas nada!
	WiseMove					=	"SVM_12_WiseMove"						;//�Aprendes r�pido!
	Alarm						=	"SVM_12_Alarm"							;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//����ALERTA!!!!
	BehindYou					=	"SVM_12_BehindYou"						;//�Eh, cuidado!
	TheresAFight				=	"SVM_12_TheresAFight"					;//�Una pelea!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//�Dale!
	CheerFight					=	"SVM_12_CheerFight"						;//�Bien!
	CheerFriend					=	"SVM_12_CheerFriend"					;//�Sac�dele!
	Ooh							=	"SVM_12_Ooh"							;//�Cuidado!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//�Ya era hora!
	RunCoward					=	"SVM_12_RunCoward"						;//�Se est� escabullendo!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//�Yo dir�a que ha ganado con claridad!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//�Se lo merec�a!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//�Si vas por ah� matando gente, es normal que te metas en l�os!
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//�Menuda pelea!
	Awake						=	"SVM_12_Awake"							;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//�Hola amigo!
	ALGreetings					=	"SVM_12_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_12_MageGreetings"					;//�Por el honor de la magia!
	SectGreetings				=	"SVM_12_SectGreetings"					;//�Despierta!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Por all�.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//No puedo ense�arte nada porque eres bastante inexperto.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//�Tienes que llegar al nivel avanzado antes de convertirte en maestro!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_12_HeyYou"							;//�Oye, t�!
	NotNow						=	"SVM_12_NotNow"							;//�Ahora no!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//�Puedo ayudarte?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//�Qu� quieres?
	MakeWay						=	"SVM_12_MakeWay"						;//D�jame pasar.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//�Vamos, quiero pasar!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//�Est�s sordo o quieres bronca?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_12_LookAway"						;//�Ha pasado algo? No he visto NADA...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//�Vale, qu�datelo!
	WhatsThat					=	"SVM_12_WhatsThat"						;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//�Me gustar�a recuperar mi arma!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//�D�mela!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//�Hm, tampoco pasa nada! �Tengo m�s!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Se han cargado a uno de los nuestros. Si cojo a ese cerdo...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Eh, �a qu� viene eso? �Por qu� me has despertado?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//�Eh? �Te han zurrado? �Te lo mereces!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//�Has vencido a un magnate del mineral! �Se qued� impresionado!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Has vencido a un gur�. Estoy impresionado. Pero ni se te ocurra intentarlo de nuevo.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Si has vencido a un mago... �debes ser un hombre valiente!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Debes estar loco para sacudir as� a un novicio.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//�Qu� cre�as que hac�as sacudiendo a un cavador?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//�Has sacudido a uno de mis amigos! �A qu� ven�a eso?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//�Si vuelves a poner la mano encima de un novicio lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Eres demasiado valiente; si tocas a uno de mis protegidos, podr�a resultarte muy peligroso.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//�C�mo te atreves a presentarte aqu�, ladr�n asqueroso?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Tienes cosas que nos pertenecen. �Ser� mejor que nos las devuelvas!
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//�Has robado a los gur�s! �Al menos tendr�as que haber evitado que te pillaran!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//�A los magos no les gusta que haya gente revolviendo en sus cosas!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//�Uno de los nuestros pesa sobre tu conciencia! �Un error m�s y te tocar� a ti!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Una buena pelea. Tu entrenamiento ha merecido la pena.
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o, eso es lo que pasa...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, �bereifrig, �hnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y�berion blind,	Mitl�ufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//�Basta de hechicer�a!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//��Basta, BASTA!!
	WeaponDown					=	"SVM_13_WeaponDown"						;//�Deja esa arma!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//�Deja esa arma!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//�Est�s apunt�ndome? �Cuidado!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Te diriges de cabeza a tu muerte. �Ser� mejor que apuntes hacia otro lado!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//�Para qu� es eso?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Olvidemos esa discusi�n, �de acuerdo?
	Strange						=	"SVM_13_Strange"						;//�D�nde se ha metido? �Es imposible!
	DieMonster					=	"SVM_13_DieMonster"						;//�Esta noche tendremos carne!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//�Ahora te toca a ti! �Sin piedad!
	NowWait						=	"SVM_13_NowWait"						;//Eso  va a significar una buena paliza...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//No quieres intentarlo de nuevo, �verdad?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//�T� lo has querido!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//�Te vas a enterar, intruso!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//�Deber�a cortarte los dedos!
	DirtyThief					=	"SVM_13_DirtyThief"						;//�Ladr�n asqueroso! �Voy a romperte las manos!
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//�Aqu� nadie sacude a nadie excepto yo!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//�Ha matado a uno de los nuestros!
	Dead						=	"SVM_13_Dead"							;//�Aaargh!
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//�No vas a tener mucho tiempo para lamentarte!
	YesYes						=	"SVM_13_YesYes"							;//�No hay problema, no hay ning�n problema!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//No tengo el arma adecuada. Ya nos veremos...
	Help						=	"SVM_13_Help"							;//�Guaaaaaaahhhh! �Largu�monos!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//�Ya nos veremos!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//�La pr�xima vez te matar�!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//�Bonita arma! �Es tuya? �No? �De acuerdo!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Supongo que no te importa que me quede con un poco de mineral.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//�Ni siquiera tienes mineral en tus bolsillos!
	HandsOff					=	"SVM_13_HandsOff"						;//�Canalla! �Aparta tus manazas! �Yo te lo doy!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//�Largo! �Sal de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//�Qu� haces aqu�?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//�Est�s intentando dejarme en rid�culo?
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//�Eh, t�! �Qu� haces rondando por aqu�?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//�Qu� haces aqu�? �L�rgate o llamo a los guardias!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//�Aqu� no pintas nada!
	WiseMove					=	"SVM_13_WiseMove"						;//�Has tenido suerte! �Me habr�a gustado partirte la cara!
	Alarm						=	"SVM_13_Alarm"							;//�Guardias! �Por aqu�!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//���ALERTA!!!
	BehindYou					=	"SVM_13_BehindYou"						;//�Detr�s de ti!
	TheresAFight				=	"SVM_13_TheresAFight"					;//A ver qui�n muerde el polvo.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//�S�, otra vez!
	CheerFight					=	"SVM_13_CheerFight"						;//�Quiero ver sangre!
	CheerFriend					=	"SVM_13_CheerFriend"					;//�Dale la vuelta!
	Ooh							=	"SVM_13_Ooh"							;//�Devu�lvele el golpe, idiota!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//��S����!!
	RunCoward					=	"SVM_13_RunCoward"						;//�S�, l�rgate!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//�Qu� comportamiento m�s triste! Un poco de viento y habr�a ca�do solo.
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//�Bah, se lo merece!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Es un suicidio matar a alguien delante de testigos.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//�Buena pelea!
	Awake						=	"SVM_13_Awake"							;//Aaaau (bostezo)
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//�Todo va bien?
	ALGreetings					=	"SVM_13_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_13_MageGreetings"					;//�Por el honor de la magia!
	SectGreetings				=	"SVM_13_SectGreetings"					;//�Despierta!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//�Est�s ciego? �Por all�!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Tienes que llegar al nivel avanzado antes de convertirte en maestro.
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_13_HeyYou"							;//�Oye, t�!
	NotNow						=	"SVM_13_NotNow"							;//�Ahora no!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//�Qu� quieres de m�?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//�Puedo hacer algo por ti?
	MakeWay						=	"SVM_13_MakeWay"						;//�D�jame pasar!
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//�Qu�tate de en medio!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//�Buscas bronca? �L�rgate de aqu�!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_13_LookAway"						;//�No he visto NADA!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Tranquilo. Es tuyo.
	WhatsThat					=	"SVM_13_WhatsThat"						;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//�Devu�lveme mi arma!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//�D�mela!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//�Vale! �Qu�datela! �Encontrar� otra soluci�n!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//�Uno de los nuestros ha muerto! �Esto clama venganza!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//�Por qu� me has despertado?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//�Te mereces la paliza que te han dado!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//�Has tumbado a un magnate del mineral! �Est� realmente furioso contigo!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Has tumbado a un gur�. �Parece que te las apa�as para atraer problemas como un im�n!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//�Vencer a un mago es muy mala idea!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//�As� que eres t� el que pega a los novicios!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//�Deja en paz a mis muchachos!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//No es buena idea acercarse a mis amigos.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//�No se tolerar� que causes problemas!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//�Si golpeas a alguien que est� bajo mi protecci�n, habr� repercusiones!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//�Me has robado! �No vuelvas a intentarlo!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//�Queremos recuperar nuestras cosas! �D�noslas!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//�Has robado a los magnates del mineral! �Para qu� demonios lo has hecho?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//�Has robado a los gur�s? L�stima que te pillaran.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//�Has robado a los magos! �Qu� idea m�s est�pida!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//�Uno de los nuestros ha muerto y t� est�s implicado! �Si cometes el m�s m�nimo error, morir�s!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//�Me has dado una buena tunda! �Ha sido una lucha justa, t�o! �Pero ya ha acabado!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o, eso es lo que pasa...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erz�hler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//�Det�n tu magia!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//�Ya me has o�do: det�n tu magia!
	WeaponDown					=	"SVM_14_WeaponDown"						;//�Qu� quieres con esa arma?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//�Deja esa arma!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//�Est�s apunt�ndome!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//�Quieres dejar de apuntarme?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//�Ten cuidado!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//�Olvidemos nuestra peque�a diferencia de opiniones!
	Strange						=	"SVM_14_Strange"						;//�Buen truco, acaba de desaparecer!
	DieMonster					=	"SVM_14_DieMonster"						;//Una criatura fastidiosa.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Tengo que matarte... �Como comprender�s, no es nada personal!
	NowWait						=	"SVM_14_NowWait"						;//�Por ahora es suficiente!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//No quieres bronca otra vez, �verdad?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//�As� lo has querido!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//�No se te ha invitado!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//�Mis propiedades no son para ti!
	DirtyThief					=	"SVM_14_DirtyThief"						;//�Has tomado prestado algo m�o! �Ahora tendr�s que pagar por ello!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//�Tienes que aprender a cumplir las normas!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//�Has matado a alguien!
	Dead						=	"SVM_14_Dead"							;//�Aaargh!
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//���UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//�Te arrepentir�s!
	YesYes						=	"SVM_14_YesYes"							;//�Vale, vale!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//�No quiero afrontar este desaf�o en este momento!
	Help						=	"SVM_14_Help"							;//�Tengo que volver a mis estudios!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//�Seguro que nos volveremos a ver!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//�Ser� mejor que no vuelvas a hacer eso!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//�Me quedar� con esa arma!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//�Seguro que el mineral resulta �til!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//�No tienes nada de mineral!
	HandsOff					=	"SVM_14_HandsOff"						;//�Aparta tus manazas!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//�Largo de aqu�!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//�C�mo has entrado?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//�Debes estar bromeando!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//�Qu� buscas a escondidas por aqu�?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//�L�rgate antes de que llame a los guardias!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//�Aqu� no pintas nada! �Te enteras?
	WiseMove					=	"SVM_14_WiseMove"						;//�Inteligente decisi�n!
	Alarm						=	"SVM_14_Alarm"							;//�Guardias! �Aqu�, aqu�!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//���INTRUSO!!!
	BehindYou					=	"SVM_14_BehindYou"						;//�Detr�s de ti!
	TheresAFight				=	"SVM_14_TheresAFight"					;//�Una pelea!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hm.
	CheerFight					=	"SVM_14_CheerFight"						;//�Qu� in�til!
	CheerFriend					=	"SVM_14_CheerFriend"					;//�Parece bastante tenaz!
	Ooh							=	"SVM_14_Ooh"							;//�Eso duele!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//Es un modo de hacerlo...
	RunCoward					=	"SVM_14_RunCoward"						;//�Ha aprendido la lecci�n!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//Eso ha sido todo.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//�Se lo merece!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Eso era innecesario. Ahora tendr�s que afrontar las consecuencias.
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//�Estas peleas me aburren!
	Awake						=	"SVM_14_Awake"							;//�Me he dormido?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Saludos.
	ALGreetings					=	"SVM_14_ALGreetings"					;//�Por G�mez!
	MageGreetings				=	"SVM_14_MageGreetings"					;//�Por el honor de la magia!
	SectGreetings				=	"SVM_14_SectGreetings"					;//�Despierta!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Est� por all�.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//No puedo ense�arte nada. No tienes suficiente experiencia.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Tus posibilidades no dan m�s de s�. Deber�as aprender algo diferente.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Tienes que llegar al nivel avanzado antes de convertirte en maestro
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//�Ya est�s por encima de ese nivel!
	HeyYou						=	"SVM_14_HeyYou"							;//�Oye, t�!
	NotNow						=	"SVM_14_NotNow"							;//�Ahora no!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//�Qu� puedo hacer por ti?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//�Puedo ayudarte?
	MakeWay						=	"SVM_14_MakeWay"						;//�Hazte a un lado!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//D�jame pasar.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//�L�rgate de una vez!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//�Otra vez buscas l�os conmigo?
	LookAway					=	"SVM_14_LookAway"						;//�No me interesa lo que hag�is!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//�Qu�datela!
	WhatsThat					=	"SVM_14_WhatsThat"						;//�Qu� ha sido eso?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//�Devu�lveme mi arma!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//�D�mela!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Vale. �Ya no la quiero!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Uno de los nuestros ha muerto. Encontraremos al culpable...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//�Est�s molestando mis estudios!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//�He o�do que tuviste problemas!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//�Has vencido a un magnate del mineral! �Se qued� impresionado!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Has vencido a un gur�. Estoy impresionado.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Si has vencido a un mago...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//�Sabes que los novicios est�n bajo mi protecci�n y, aun as�, les pones la mano encima?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//�Si tocas a los cavadores es como si echas mano a mis ingresos!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//No deber�as meterte con mis amigos.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//�Si vuelves a poner la mano encima de un novicio lo lamentar�s!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Si atacas a uno de mis protegidos, te podr�a costar la cabeza.
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//�C�mo te atreves a presentarte aqu�, ladr�n asqueroso?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Tienes cosas que nos pertenecen. �Ser� mejor que nos las devuelvas!
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//�T�o! �Has robado a los magnates del mineral! �Estar�n furiosos!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Has levantado algunas cosas a los gur�s.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Has levantado un par de cosas a los magos.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//�Has matado a uno de los nuestros! �Un error m�s y te tocar� a ti!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//�Has matado a un magnate del mineral! T�o, �est�s zumbado?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//�Has matado a un gur�! �No me lo puedo creer!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//�Has matado a un mago! �C�mo tienes pensado justificarlo?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Ha muerto un miembro del Campamento Viejo, y se ha relacionado tu nombre con la muerte...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//�El Campamento Nuevo ha sufrido una p�rdida tr�gica, y parece que est�s implicado!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//�La hermandad tiene un fiel menos, y su muerte pesa sobre tu conciencia!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//�No ser� f�cil solucionar esto!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//�Me has dado una buena tunda, t�o! �Ha sido una lucha justa! �Pero ya ha acabado!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...si t� crees...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...tal vez...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...eso no fue muy inteligente...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...ser� mejor que me mantenga al margen...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...en realidad no es mi problema...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...era evidente que habr�a problemas...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...pero s� discreto; la gente no tiene por qu� saberlo.
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...no volver� a suceder...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...debe haber algo de cierto en esa historia...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...has de tener cuidado con lo que dices a la gente...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...mientras no me vea implicado...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...no deber�as creerte todo lo que oyes...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...no me gustar�a estar en su lugar...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...lo mismo de siempre...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...algunos no aprenden...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...hubo un tiempo en que las cosas habr�an sucedido de manera muy distinta...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...la gente no para de hablar...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...ya no hago caso de los chismorreos...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...conf�as en alguien y te metes en un l�o, eso es lo que pasa...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...me extra�a que vaya a cambiar...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...seguramente tengas raz�n...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...espera. Ser� mejor no apresurarse...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...cre�a que eso se hab�a resuelto hace mucho...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...hablemos de otra cosa...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//�Eh, t�!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//�Espera!

	SectGreetings			=	"SVM_15_SectGreetings"				;//�Despierta!
	ALGreetings				=	"SVM_15_ALGreetings"				;//�Por G�mez!
	MageGreetings			=	"SVM_15_MageGreetings"				;//�Saludos!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//�Hola!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aargh
	Awake					=	"SVM_15_Awake"						;//(se despierta)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//No funciona.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, est� roto.
	NeedKey					= 	"SVM_15_NeedKey"					;// Necesito una llave para eso...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// No hay m�s llaves maestras...
	InvFull					= 	"SVM_15_InvFull"					;// No puedo llevar m�s cosas.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//�Vete! �Se supone que no puedes hablar conmigo!
	Help						=	"SVM_16_Help"			;	//(grita)
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aargh
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverst�ndlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//�ber Stimme 17, sind aber in halbwegsverst�ndlichem orkisch-deutsch
												//Das hier �berall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen erg�nzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WeaponDown					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
/*
	ISaidWeaponDown				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WatchYourAim				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WatchYourAimAngry			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatAreYouDoing				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LetsForgetOurLittleFight	=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Strange						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DieMonster					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	DieMortalEnemy				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWait						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouStillNotHaveEnough		=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAskedForIt				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWaitIntruder				= 	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DirtyThief					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAttackedMyCharge			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledOneOfUs			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Dead						=	"SVM_17_Dead"				;//Aaaarglll....
	Aargh_1						=	"SVM_17_Aargh_1"			;//Aargh!
	Aargh_2						=	"SVM_17_Aargh_2"			;//Aargh!
	Aargh_3						=	"SVM_17_Aargh_3"			;//Aargh!
	Berzerk						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YoullBeSorryForThis			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ShitWhatAMonster			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Help						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WeWillMeetAgain				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NeverTryThatAgain			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ITakeYourWeapon				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ITookYourOre				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ShitNoOre					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	HandsOff					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	GetOutOfHere				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouViolatedForbiddenTerritory=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatsThisSupposedToBe		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhyAreYouInHere				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatDidYouInThere			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WiseMove					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Alarm						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	IntruderAlert				= 	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	BehindYou					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFight					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFriend					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Ooh							=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeDefeatedHim				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeKilledHim					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Awake						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	FriendlyGreetings			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	HeyYou						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NotNow						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhatDoYouWant				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ISaidWhatDoYouWant			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	MakeWay						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	OutOfMyWay					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouDeafOrWhat				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LookingForTroubleAgain		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	GiveItToMe					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouDisturbedMySlumber		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouStoleFromMe				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouStoleFromUs				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledMyFriend			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
*/

};



// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	18;




