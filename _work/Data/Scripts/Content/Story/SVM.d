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
	VAR	STRING	Om;							// Hmmm (Meditation)

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
	StopMagic					=	"SVM_1_StopMagic"					;//P�esta� s t�mi ��ry!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Chce� jednu koupit? Okam�it� toho nech!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Dej pry� tu zbra�!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Dej tu zatracenou zbra� pry�!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Pry� s n�!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Jestli chce� po��dnou do zub�, tak na m� zkus je�t� zam��it!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Dej si pozor! Je�t� jednou a m� ji!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Zapomeneme na tohle mal� nedorozum�n�, oukej?
	Strange						=	"SVM_1_Strange"						;//Odpal, ty bastarde!
	DieMonster					=	"SVM_1_DieMonster"					;//Ty proklatej �ub�� synu!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Te� si to odnese�!
	NowWait						=	"SVM_1_NowWait"						;//Nap�l�m ti j� takovou...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Vypad�, jako kdybys cht�l jednu na tlamu!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//��k� si o to!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//M�m pocit, �e t� odtud odnesou po kousk�ch.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem t�, abys dal pracky pry� od m�ch v�c�!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Skon��m to s tebou, zlod�ji!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Na moje kamar�dy si nikdo dovolovat nebude!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Vzt�hl jsi ruku na jednoho z n�s,  te� p�ijde �ada na tebe!
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_1_YesYes"						;//��dn� strach! Zv�t�zil jsi!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//K sakru! Ut�kej, jak nejrychleji um�!
	Help						=	"SVM_1_Help"						;//K �ertu!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Je�t� se uvid�me!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Zkus to je�t� jednou a bude� litovat!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//P�kn� zbra�! Dej mi ji!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//D�ky, hrdino!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Ty b�dnej �erve, nem� ani kousek rudy!
	HandsOff					=	"SVM_1_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Kli� se odsu�!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Mysl�, �e jsem hlup�k?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej, ty! Co tady pohled�v�?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Vypadni z moj� chatr�e nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Tady nem� co d�lat! Vypadni!
	WiseMove					=	"SVM_1_WiseMove"					;//Bystrej chlap�k!
	Alarm						=	"SVM_1_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//POZOR!! VET�ELEC!!
	BehindYou					=	"SVM_1_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_1_TheresAFight"				;//Hej, do boje!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Po��dn�!
	CheerFight					=	"SVM_1_CheerFight"					;//Pere� se jako �ensk�!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Skon�i to s n�m!
	Ooh							=	"SVM_1_Ooh"							;//Vy�i� ho!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Dej mu co proto!
	RunCoward					=	"SVM_1_RunCoward"					;//Kli� se, ty n�dhero!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Ten m� dost!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Podej si ho!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Pro� jsi ho zabil? Jako bys byl mrtvej!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Dobr� pr�ce!
	Awake						=	"SVM_1_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_1_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Za sl�vu magie!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Vzbu� se!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Vra� se, a� bude� moud�ej��.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//U� je to s tebou lep��!
	HeyYou						=	"SVM_1_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_1_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Co chce�?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_1_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Uhni mi z cesty, �lov��e!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Jse� hluchej? TAK UHNI!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Chce� m�t probl�my?
	LookAway					=	"SVM_1_LookAway"					;//Uhhh! Nic jsem nevid�l!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Dobr�, dobr�! Tak si j� nech!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Chod� tu s MOJ� zbran�!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Dej mi tu v�ci�ku!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Tak si j� nech! J� ji beztak nepot�ebuju!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Dostali jednoho z na�ich chlap�k�. A� j� toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//K �ertu, pro� m� bud�?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! M� na tebe vztek!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Porazil jsi Guru. Vypad� to, �e p�itahuje� probl�my jako magnet!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem nen� zrovna dobr� n�pad!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Nem��e� se tu potloukat a ml�tit novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Nech m� chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Odrovnal jsi m�ho kamar�da...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Nebude� tu d�lat probl�my!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Jestli vzt�hne� ruku na n�koho, kdo je pod moj� ochranou, tak si to schyt�!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Se� mi ukradenej, ty zmetku! U� to znovu nezkou�ej!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Chceme na�e v�ci zp�tky! Vra� n�m je!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Kradl jsi u Rudobaron�? Prob�h, pro�?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Okradl jsi Guru? Jak� �koda, �e t� nachytali!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Kradl jsi u m�g�! Jak stupidn� n�pad!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Jeden z na�ich lid� zem�el a ty s t�m m� co do �in�n�! Sta�� mal� chybi�ka a p�jde� za n�m!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Zabil jsi jednoho z Guru! Hochu, tomu nem��u uv��it!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Byl to dobr� boj! Po��dn� jsem to od tebe schytal, �lov��e!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...nejhor�� �p�na...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...mo�n�, ale koho to zaj�m�?
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...naprosto stupidn�...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...pro� se to d�lo po��d d�l...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...�et�i si dech, jo, jo...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_1_Om"							;//Hmmm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einsch�chterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//��dn� kouzla!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//HEJ! �ekl jsem ��dn� ��ry!
	WeaponDown					=	"SVM_2_WeaponDown"					;//D�lej! Dej tu v�c pry�!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Dej tu zbra� pry�!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//D�vej se, kam m���!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Jestli zam��� na m�, budu si to br�t osobn�!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hej, co to m� znamenat?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Zapomeneme na to, dobr�?
	Strange						=	"SVM_2_Strange"						;//Zvl�tn�! Kam se pod�l?
	DieMonster					=	"SVM_2_DieMonster"					;//A dal��!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Ob�v�m se, �e t� budu muset zlikvidovat
	NowWait						=	"SVM_2_NowWait"						;//Tvoje chyba!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Nem� je�t� dost?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Jestli po tom opravdu tou��!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//V�, �e tu nem� co d�lat!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Pro� se plete� do v�c�, do kter�ch ti nic nen�?
	DirtyThief					=	"SVM_2_DirtyThief"					;//Tys tady kradl! Tohle ti nezapomenu!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Na moje chlapy si nikdo vyskakovat nebude!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Zabil jsi jednoho z n�s! Za to zaplat�!
	Dead						=	"SVM_2_Dead"						;//Aaargl
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_2_YesYes"						;//Klid, klid, vyhr�l jsi!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//J� - ehm - s malou pomoc�!
	Help						=	"SVM_2_Help"						;//Nem�m �as, jenom si vy��d�m sv� v�ci!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Ur�it� se je�t� uvid�me!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//U� to znova nezkou�ej!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Tuhle zbra� si vezmu!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//Tolik rudy nebude� stejn� pot�ebovat!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Ty nem� ��dnou rudu? Tohle nevypad� na tv�j ��astn� den!
	HandsOff					=	"SVM_2_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Nen� od tebe chytr� m�t m� za hlup�ka!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Co tady pohled�v�?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Vypadni z moj� chatr�e nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Vypadni z moj� chatr�e!
	WiseMove					=	"SVM_2_WiseMove"					;//Spr�vn� rozhodnut�!
	Alarm						=	"SVM_2_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_2_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_2_TheresAFight"				;//Hej, do boje!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//To je v�echno!
	CheerFight					=	"SVM_2_CheerFight"					;//Vst�vej, lenochu!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Dobr� r�na!
	Ooh							=	"SVM_2_Ooh"							;//Vy�i� ho!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Je�t� se h�be!
	RunCoward					=	"SVM_2_RunCoward"					;//Kli� se, ty n�dhero!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Ten m� dost!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//To mu pat��!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Tys ho zabil! Bylo to nutn�?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Skv�l� boj, jen trochu kr�tk�!
	Awake						=	"SVM_2_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_2_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Za sl�vu magie
	SectGreetings				=	"SVM_2_SectGreetings"				;//Vzbu� se!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//U� je to s tebou lep��!
	HeyYou						=	"SVM_2_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_2_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Co chce�?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_2_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Uhni mi z cesty, �lov��e!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Ztra� se, nebo se po tob� projdu!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_2_LookAway"					;//NIC jsem nevid�l! V�ECHNO je v po��dku!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Dobr�! Je tvoje!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Hej? Co?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//To, s ��m tady chod�, vypad� jako moje zbra�!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Poj� a dej mi tu v�ci�ku!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//J� ji beztak nepot�ebuju!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Dostali jednoho z na�ich chlap�k�. A� my toho lotra dostaneme...
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Pro� m� bud�?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Dostali t�! Mus�m p�iznat, �e to bylo dobr�!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//P�emohl jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Porazil jsi Guru. Nev�m, jestli je to odvaha nebo bl�znovstv�!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem... Mus� m�t pro strach ud�l�no!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Mus�m tu sjednat po��dek!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Nez�le�� na tom, co m� v �myslu! Jestli odrovn� n�kter�ho kop��e, bude� v mal�ru!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Odrovnal jsi jednoho z m�ch kamar�d�!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Nech ty novice na pokoji!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Moje chlapy nech� na pokoji! Jasn�?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Pro� jsi m� okradl?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Sebral jsi n�co, co bylo na�e. Chceme to zp�tky!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Okradl jsi Guru? M� �t�st�, �e t� nechytili!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//M�gov� nemaj� r�di lidi, co se motaj� kolem jejich v�c�!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//M� v�bec pon�t�, jak je t�k� d�t to zas do po��dku?
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Ano, v�t�z�. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_2_Om"							;// Hmmm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gem�se. "Ich schau noch�n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//��dn� �arov�n�!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//P�esta� u� s t�mi kouzly!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Polo� tu zbra�!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Jestli se tu s tou zbran� bude� motat, dostanu vztek!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Pro� na m� m���?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Polo� tu zbra� nebo budu zlej!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//H��j, co to m� znamenat?
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Dobr�, berme tuhle h�dku jako mal� nedorozum�n�.
	Strange						=	"SVM_3_Strange"						;//Je pry�! Kam se pod�l?
	DieMonster					=	"SVM_3_DieMonster"					;//Ty pra�iv� bestie, ihned m� p�esta� obt�ovat!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Budu s tebou brzy hotovej!
	NowWait						=	"SVM_3_NowWait"						;//Asi budu muset mluvit jasn�ji!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Vypad� to, �e je�t� nem�  dost!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//S�m jsi to cht�l!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Nem� tu co pohled�vat! Budu t� odsu� muset vyrazit!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Asi t� budu muset pra�tit p�es prsty. Jedin� v�c, na kterou sly��!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Tys tady kradl! Tohle ti nezapomenu!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Nem��e� tu na potk�n� hned ka�d�ho spr�skat!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Zabil jsi jednoho z n�s! To byl tv�j posledn� omyl!
	Dead						=	"SVM_3_Dead"						;//Aaargl
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_3_YesYes"						;//Vyhr�l jsi! Dobr�!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//K sakru! Ut�kej, jak nejrychleji um�!
	Help						=	"SVM_3_Help"						;//Mus�m j�t!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Je�t� se uvid�me!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//U� se o to nikdy nepokou�ej!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//D�ky za tu zbra�!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Vezmu si je�t� v�c tvoj� rudy!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Ty u� nem� rudu? To je smutn�, �lov��e, opravdu smutn�!
	HandsOff					=	"SVM_3_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Kli� se odsu�!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hej! Odkud si p�i�el?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Nejsem tak hloup�, jak si mysl�!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//P�esta� tu sl�dit!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Kli� se z moj� chatr�e nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Co tady pohled�v�? Jestli t� dostanu, bude to tv�j konec!
	WiseMove					=	"SVM_3_WiseMove"					;//V�ak ty v�, co pro tebe bude nejlep��!
	Alarm						=	"SVM_3_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_3_BehindYou"					;//Dej pozor!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Dej mu!
	CheerFight					=	"SVM_3_CheerFight"					;//O co se to pokou��?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Dobr� r�na!
	Ooh							=	"SVM_3_Ooh"							;//Ooooh!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//V�born�! Dobr� pr�ce!
	RunCoward					=	"SVM_3_RunCoward"					;//Ut�k� pry�!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Dostal ho!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//To u� se m�lo st�t d�vno!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Ten u� se ani nepohne! Zabil jsi ho!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Po��d jen �arv�tky...
	Awake						=	"SVM_3_Awake"						;//Zas dal�� den a nic se nezm�nilo...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hej, �lov��e.
	ALGreetings					=	"SVM_3_ALGreetings"					;//Za Gomeze! Hur�, hur�!
	MageGreetings				=	"SVM_3_MageGreetings"				;//Za sl�vu magie!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Vzbu� se!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Nem� dost zku�enost�. Tohle t� nem��u nau�it!
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//U� je to s tebou lep��!
	HeyYou						=	"SVM_3_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_3_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Chce� ode m� n�co?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_3_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Uhni mi z cesty, �lov��e!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Kolikr�t to budu opakovat? Nech m� j�t!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_3_LookAway"					;//NIC jsem nevid�l! Ani tu vlastn� nejsem!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Dobr�, dobr�! Tak si j� nech!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//M� moji zbra�!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Dej mi ji!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Jak mysl�! Beztak ji nepot�ebuju!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Dostali dal��ho. Nikdo z n�s se odsud nedostane �iv�...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//K �ertu, pro� m� bud�?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//��kal sis o po��dnou nakl�da�ku!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Asi si koleduje� o mal�r, vi�?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Budou m�t na tebe po��dn� vztek!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//V�t�zstv� nad m�gem znamen� po��dn� mal�r!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Ud�l� l�p, kdy� nech� p��t� novice na pokoji!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Jestli zabije� n�jak�ho kop��e, tak ti to vr�t�m!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Odrovnal jsi jednoho z m�ch p��tel!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Novicov� jsou po moj� ochranou! Nech je na pokoji!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Kop��i mi plat�, a tak nemaj� ��dn� probl�my! A tak to taky z�stane!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Se� mi ukradenej, ty zatracenej zlod�ji!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//M� u sebe n�co, co pat�� n�m. Ud�l� nejl�p, kdy� n�m to vr�t�!
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Okradl jsi Guru? Jak� �koda, �e t� nachytali!
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Kdy� u� se pokou�� okr�st m�gy, m�l bys b�t d�vtipn�j��!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Byl to dobr� boj! �ert vem, �es m� porazil!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_3_Om"							;// Hmmm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Gr�nschn�beln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//P�esta� s t�mi ��ry!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Ud�l� l�p, kdy� m� poslechne� a nech� toho �arov�n�!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Jestli se nechce� dostat do mal�ru, dej tu zbra� pry�!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Odlo� tu zbra�!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//M�l bys d�vat pozor, kam m���!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Jestli s t�m nep�estane�, tak ti tu hra�ku seberu!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hej, ty tam! D�vej pozor!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Zapome�me na tohle mal� nedorozum�n�.
	Strange						=	"SVM_4_Strange"						;//Neschov�vej se! Uka� se!
	DieMonster					=	"SVM_4_DieMonster"					;//Nez�le�� na tom, kolik mu�� zabije�. V�dycky p�ijdou dal��!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//A ty u� tu nebude�!
	NowWait						=	"SVM_4_NowWait"						;//Rad�m ti, aby ses se mnou nedostal do k��ku...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Ty je�t� nem� dost?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//��k� si o to!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Bylo od tebe hloup�, �e ses sem vet�el!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Nem��e� se tu motat a neb�t potrest�n!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Troufl sis m� okr�st!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//To, �e ses s n�ma dostal do k��ku, ti nic dobr�ho nep�inese!
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Zabil jsi jednoho z n�s. Oko za oko!
	Dead						=	"SVM_4_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_4_YesYes"						;//Kl�dek! Zv�t�zil jsi!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Padej odsud jak nejrychleji um�!
	Help						=	"SVM_4_Help"						;//Na to u� jsem p��li� star�!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Tohle jen tak nezapomenu!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Tohle u� nikdy nezkou�ej!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Rad�ji si tu zbra� vezmu sebou!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Tv� rud� bude nejl�pe v m�ch ruk�ch!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//U� nikdy takov� nedomrl� magick� nugety.
	HandsOff					=	"SVM_4_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Ztra� se odsu�!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Tady nem� co d�lat!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Na takov�hle vtipy nem�m n�ladu!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hej, ty! Co tady pohled�v�?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Vypadni nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Cos tady pohled�val?
	WiseMove					=	"SVM_4_WiseMove"					;//M�ls �t�st�!
	Alarm						=	"SVM_4_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//VET�ELEC!!
	BehindYou					=	"SVM_4_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Je�t� jednou!
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Po��dn�!
	CheerFight					=	"SVM_4_CheerFight"					;//To je v�echno, co um�?
	CheerFriend					=	"SVM_4_CheerFriend"					;//Skon�i to s n�m!
	Ooh							=	"SVM_4_Ooh"							;//Vra� mu to!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Dobr� pr�ce!
	RunCoward					=	"SVM_4_RunCoward"					;//Ten zbab�lec prch�!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Kdysi b�vali mu�i z oceli!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Tvoje chyba!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Pro� jsi ho zabil? To byla velk� chyba!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Za star�ch �as�, to se bojovalo jinak!
	Awake						=	"SVM_4_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_4_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Za sl�vu magie!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Vzbu� se!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Najde� ho t�mhle!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//U� je to s tebou lep�� ne� tehdy!
	HeyYou						=	"SVM_4_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_4_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Co chce�?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//N�co po mn� chce�?
	MakeWay						=	"SVM_4_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Uhni mi z cesty, jinak bude� litovat!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_4_LookAway"					;//Nic zl�ho nevid�m, nesly��m, ne��k�m...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Tak si j� nech!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Bu� hodnej chlapec a vra� mi mou zbra�!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Poj� a dej mi ji!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Stejn� jsem r�d, �e jsem se j� zbavil!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Jestli zjist�m, kdo zabil jednoho z n�s...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Ru�� m�j odpo�inek!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Byls pora�en! Pot�eboval jsi po��dn� v�prask!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Obdivuhodn�, ale u� se o to znovu nepokou�ej .
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem... Mus� m�t pro strach ud�l�no!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Mus� b�t ��len�, �es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Co sis vlastn� myslel, �e d�l�, kdy� jsi zab�jel kop��e?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Dostal ses do mal�ru s jedn�m z m�ch p��tel! To je dost zl�!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Jsi p��li� sm�l�, probl�m s n�kter�m z m�ch chr�n�nc� by pro tebe mohl znamenat nebezpe��.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Ruce pry� od m�ch v�c�, jasn�?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//M� u sebe n�co, co pat�� n�m. Vra� n�m to!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Okradl jsi Guru? Nemusel ses aspo� nechat chytit!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//M�gov� nemaj� r�di lidi, co se motaj� kolem jejich v�c�!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tv� jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_4_Om"							;//Hmmm
};


instance SVM_5 (C_SVM)				//Lebensk�nstler, offen, Fr�hlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewu�t, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//��dn� �arov�n�!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//P�esta� u� s t�mi kouzly!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Co chce� s tou zbran� d�lat, �lov��e?
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//D�lej! Dej tu v�c pry�!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//M��� na m�, ty �a�ku!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Jestli s t�m nep�estane�, uk�u ti, za� je toho loket!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, jse� slepej nebo co?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Dobr�, zapome�me na tuhle h�dku, dobr�?
	Strange						=	"SVM_5_Strange"						;//Je�t� p�ed chvilkou tu byl! To je divn�!
	DieMonster					=	"SVM_5_DieMonster"					;//Te� je �ada na tob�, bastarde!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Vyrovn�me ��ty!
	NowWait						=	"SVM_5_NowWait"						;//��k� si o po��dnou nakl�da�ku!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Ty nem� je�t� dost?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Dobr�! ��kal sis o to!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Nem� tu co pohled�vat!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem t�. Jestli se dotkne� m�ch v�c�, l�t� v pr��vihu!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Zlod�ji! V�ak j� t� nau��m!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Nen� nikdo, kdo by m�l probl�m s m�mi lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Zabil jsi jednoho z m�ch chlap�. Te� zabiju j� TEBE!
	Dead						=	"SVM_5_Dead"					;//Aaargl
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_5_YesYes"						;//Vyhr�l jsi! Dobr�!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//To je na m� trochu moc!
	Help						=	"SVM_5_Help"						;//K �ertu!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//P��t� to dopadne jinak!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//U� to znovu nezkou�ej!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Ta zbra� se mi l�b�!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Pod�v�m se, jak je tv� ruda dob�e ulo�en�!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//U� ��dn� ruda? To je sm�la!
	HandsOff					=	"SVM_5_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hej! Odkud jsi p�i�el?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Dobr� vtip!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Po �em tu sl�d�?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Kli� se odsud nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Tady nem� co d�lat!
	WiseMove					=	"SVM_5_WiseMove"					;//U�� se rychle!
	Alarm						=	"SVM_5_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_5_BehindYou"					;//Dej pozor!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Dej mu!
	CheerFight					=	"SVM_5_CheerFight"					;//Dob�e!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Vra� mu ji!
	Ooh							=	"SVM_5_Ooh"							;//Tak d�vej pozor!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//U� bylo na �ase!
	RunCoward					=	"SVM_5_RunCoward"					;//Ten chlap�k ut�k� pry�!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Jasn� v�t�zstv�, �ekl bych!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Zaslou�il si to!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Po��d zab�j� lidi. Te� m� skute�n� probl�m!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//To byl ale boj!
	Awake						=	"SVM_5_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Nazdar, kamar�de!
	ALGreetings					=	"SVM_5_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Za sl�vu magie!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Vzbu� se!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Nem��u t� nic nau�it, proto�e nem� ��dn� zku�enosti.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//U� je to s tebou lep��!
	HeyYou						=	"SVM_5_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_5_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//M��u ti pomoci?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Co chce�?
	MakeWay						=	"SVM_5_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Uhni, chci proj�t!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Jse� hluchej nebo tou�� po mal�ru?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_5_LookAway"					;//NIC jsem nevid�l... Co se vlastn� stalo?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Dobr�, nech si ten kr�m!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//R�d bych svou zbra� zp�tky!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Hm, nen� �patn�! Sehnal jsem dal��!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Dostali jednoho z na�ich chlap�k�. Jestli j� toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;// Hej, co je? Pro� m� bud�?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Eh? Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Nesta�il se divit!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Skv�l�, ale u� se o to nepokou�ej znovu.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem... Mus� m�t pro strach ud�l�no!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Mus� b�t ��len�, �es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Co sis vlastn� myslel, �e d�l�, kdy� jsi zab�jel kop��e?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Srazil jsi m�ho p��tele, pro�?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Jsi p��li� sm�l�, probl�m s n�kter�m z m�ch chr�n�nc� by pro tebe mohl znamenat nebezpe��.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Jak se tu opova�uje� objevit, ty zlod�ji?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//M� u sebe n�co, co pat�� n�m. Vra� n�m to!
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Okradl jsi Guru? Nemusel ses aspo� nechat chytit!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//M�gov� nemaj� r�di lidi, co se motaj� kolem jejich v�c�!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_5_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Gr�lt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//��dn� �arov�n�!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//P�esta� u� s t�mi kouzly! Ihned!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Dej tu zatracenou zbra� pry�!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Chce� ode m� nakl�da�ku? Dej tu v�c pry�!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Dej tu v�c pry� nebo se n�co stane!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Je�t� jednou na m� nam��� a dostane� po tlam�!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hej! D�vej pozor!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hej, �lov��e! Zapomeneme na tuhle h�dku, dobr�?
	Strange						=	"SVM_6_Strange"						;//Vyjdi! Uka� se!
	DieMonster					=	"SVM_6_DieMonster"					;//Nad�l�m z tebe gul�, bastarde!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//To m� za to!
	NowWait						=	"SVM_6_NowWait"						;//Dostane� jednu p�es tlamu...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Jako by sis ��kal o po��dnou p�es tlamu!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Tum� cos cht�l!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Rozsek�m t� na mad�ru!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem t�. Jestli se dotkne� m�ch v�c�, l�t� v pr��vihu!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Zlod�ji! Tohle bude tv�j konec!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//M�ch chlap� se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Zabil jsi jednoho z m�ch chlap�. Te� zabiju j� TEBE!
	Dead						=	"SVM_6_Dead"						;//Aaargl
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_6_YesYes"						;//Dobr�, dobr�! Klid, vyhr�l jsi!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//K �ertu, takov� bestie! Ut�kej jak nejrychleji um�!
	Help						=	"SVM_6_Help"						;//K �ertu!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Je�t� m� pozn�!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Je�t� jednou to zkus a bude� litovat!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Ta zbra� vypad� dob�e!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//D�ky za rudu, p�ip�j�m na tebe!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Sakra, u� nem� ani kousek rudy...
	HandsOff					=	"SVM_6_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hej! Odkud si p�i�el?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Mysl� si, �e jsem �pln� hloup�?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hej! Po �em tu sl�d�?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Kli� se odsud nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Cos tady d�lal?
	WiseMove					=	"SVM_6_WiseMove"					;//To bylo �t�st�!
	Alarm						=	"SVM_6_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//POZOR!!! VET�ELEC!!!
	BehindYou					=	"SVM_6_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_6_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Po��dn�!
	CheerFight					=	"SVM_6_CheerFight"					;//Bije� se jak �ensk�!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Dora� ho!
	Ooh							=	"SVM_6_Ooh"							;//Nep�rej se s n�m! Dej mu p�es tlamu!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Dej mu! Je�t� se h�be!
	RunCoward					=	"SVM_6_RunCoward"					;//Vra� se, zbab�l�e!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Ten m� dost!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Zaslou�il si to!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Jsi jako samotn� smrt! Ta t� nau�� takhle zab�jet!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! Dob�e jsi mu to uk�zal!
	Awake						=	"SVM_6_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Nazdar!
	ALGreetings					=	"SVM_6_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Za sl�vu magie!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Vzbu� se!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//U� je to s tebou lep��!
	HeyYou						=	"SVM_6_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_6_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Co chce�?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Bylo tam n�co, cos cht�l?
	MakeWay						=	"SVM_6_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Tak uhni!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Kli� se! Nebo chce�, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_6_LookAway"					;//Nic jsem nevid�l! Opravdu nic!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Dobr�, nech si ten kr�m!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Vra� mi zbra�, ty �a�ku!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Tak dej mi ji, �lov��e!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Nevad�! Stejn� ji u� nebudu pot�ebovat!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Dostali jednoho z na�ich chlap�k�. Jestli j� toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Sakra, pro� m� bud�?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! M� na tebe opravdu vztek!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Porazil jsi Guru. P�itahuje� probl�my jako magnet!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem je opravdu ��len� n�pad, �lov��e!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Nem��e� se tu potloukat a takhle ml�tit novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Nech m� chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Odrovnal jsi m�ho kamar�da...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Nebude� tu d�lat probl�my!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Jestli vzt�hne� ruku na n�koho, kdo je pod moj� ochranou, tak si to schyt�!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Se� mi ukradenej, ty zmetku! U� to znovu nezkou�ej!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Chceme na�e v�ci zp�tky! Vra� n�m je!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Kradl jsi u Rudobaron�? Prob�h, pro�?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Okradl jsi Guru? Jak� �koda, �e t� nachytali!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Kradl jsi u m�g�! Jak stupidn� n�pad!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Jeden z na�ich lid� zem�el a ty s t�m m� co do �in�n�! Sta�� mal� chybi�ka a p�jde� za n�m!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Zabil jsi jednoho z Guru! Tomu, hochu, nem��u uv��it!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...nejhor�� �p�na...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...mo�n�, ale koho to zaj�m�?
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...pro� se to d�lo po��d d�l...
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_6_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Dej to pry�! Dej to pry�!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//P�esta� s t�mi kouzly, dej to pry�!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Dej tu zbra� pry�, dej j� pry�!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Mysl�m to v�n�! Pry� s n�!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//M��� na m�? Dej si pozor!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Mysl�, �e se t� leknu? Jak chce�!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Tohle si zapamatuju! Dej si pozor!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Zapomeneme na to, dobr�?
	Strange						=	"SVM_7_Strange"						;//Kam se pod�l? To nen� mo�n�!
	DieMonster					=	"SVM_7_DieMonster"					;//Rozsek�m t�, lot�e!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Dostanu t�! Te� na tebe do�la �ada! ��dn� slitov�n�!
	NowWait						=	"SVM_7_NowWait"						;//Kone�n� jsi mi dal d�vod!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//U� to nem� chu� zkusit podruh�, vi�?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Krev! Tvoje krev!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Rozp��u t� na c�ry!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//M�l bych ti usekat prsty!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty v�ivej zlod�ji! Chci t� vid�t, jak trp�!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Na moje chlapy si krom� m� nikdo vyskakovat nebude!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Zabil jsi jednoho z n�s!
	Dead						=	"SVM_7_Dead"						;//Aaargl
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Nebude� m�t ani �as toho litovat!
	YesYes						=	"SVM_7_YesYes"						;//Dob�e, dob�e!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Nem�m tu spr�vnou zbra�. Je�t� se uvid�me...
	Help						=	"SVM_7_Help"						;//K �ertu!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Je�t� se uvid�me!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//U� to znova nezkou�ej!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Tuhle zbra� si vezmu!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Rad�i bych t� zabil, ta ruda ale nen� �patn�!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Ty nem� ��dnou rudu? Se� nicotn� ve�!
	HandsOff					=	"SVM_7_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Vypadni odsud! Ven!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Sna�� se m� p�echytra�it, co?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hej ty! Co tady pohled�v�?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Vypadni odsud nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Tady nem� co d�lat!
	WiseMove					=	"SVM_7_WiseMove"					;//M� �t�st�! M�l jsem chu� ti rozml�tit tlamu!
	Alarm						=	"SVM_7_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_7_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Po��dn�!
	CheerFight					=	"SVM_7_CheerFight"					;//Chci vid�t krev!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Vy�i� ho!
	Ooh							=	"SVM_7_Ooh"							;//Vra� mu to, idiote!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Uaaah!!!!!!
	RunCoward					=	"SVM_7_RunCoward"					;//Uaaah!!!!!!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Ten m� dost!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Jeho chyba!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Zab�t n�koho p�ed sv�dky je sebevra�da!
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Skv�l� boj!
	Awake						=	"SVM_7_Awake"						;//Je �as d�t se d�l!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_7_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Za sl�vu magie
	SectGreetings				=	"SVM_7_SectGreetings"				;//Probu� se!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Jsi slep�? T�mhle!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//U� je to s tebou lep��!
	HeyYou						=	"SVM_7_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_7_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Co ode m� chce�?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_7_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Chce� m�t probl�my? Kli� se odsud!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_7_LookAway"					;//NIC jsem nevid�l!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Dobr�! Je tvoje!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Vra� mi mou zbra�!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Vra� mi ji!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Dob�e! Nech si ji! Vy�e��m to jinak!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Jeden z n�s je mrtev! To si zasluhuje odplatu!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Pro� jsi m� vzbudil?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Dostal jsi nakl�da�ku, o kterou sis koledoval!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! M� na tebe vztek!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Porazil jsi Guru. P�itahuje� probl�my jako magnet!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem, to je ��len� n�pad!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Tak ty jsi ten, co ml�t� novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Nech m� chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Odrovnal jsi, koho jsi nem�l! T�hneme tu za jeden provaz!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Nebude� tu d�lat probl�my!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Jestli vzt�hne� ruku na n�koho, kdo je pod moj� ochranou, tak si to schyt�!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Se� mi ukradenej, ty zmetku! U� to znovu nezkou�ej!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Chceme na�e v�ci zp�tky! Vra� n�m je!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Kradl jsi u Rudobaron�? Prob�h, pro�?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Okradl jsi Guru? Jak� �koda, �e t� nachytali!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Kradl jsi u m�g�! Jak stupidn� n�pad!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Jeden z na�ich lid� zem�el a ty s t�m m� co do �in�n�! Sta�� mal� chybi�ka a p�jde� za n�m!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Zabil jsi jednoho z Guru! Tomu, hochu, nem��u uv��it!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_7_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, n�chtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Nezkou�ej tady ��dn� ��ry!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//P�esta� u� s t�m! Ihned!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Polo� tu zbra�!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Dej tu v�c pry� nebo to schyt�!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Dej tu zbra� pry�, idiote!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Ty se na m� odva�uje� m��it?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//D�vej pozor!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Dobr�, zapomeneme na tohle mal� nedorozum�n�.
	Strange						=	"SVM_8_Strange"						;//Uka� se! V�m, �e m� sly��!
	DieMonster					=	"SVM_8_DieMonster"					;//Pra�iv� bestie!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Te� zem�e�! Neber si to osobn�!
	NowWait						=	"SVM_8_NowWait"						;//Tys M� napadl, �erve! Jen po�kej...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Neza�lapal jsem t� u� jednou do prachu? Tak si to zopakujeme...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Kdy� neposlouch�, tak si to vyzkou�� na vlastn� k��i!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Jak ses SEM opov�il? Po�kej za moment!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Asi t� budu muset pra�tit p�es prsty.
	DirtyThief					=	"SVM_8_DirtyThief"					;//Tak tohles kr�st nem�l!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Nen� nikdo, kdo by m�l probl�m s m�mi lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Zabil jsi jednoho z n�s! To byl tv�j posledn� omyl!
	Dead						=	"SVM_8_Dead"						;//Aaargl
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_8_YesYes"						;//Dobr�! V�echno je v po��dku!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//M�l jsem se od t� bestie dr�et rad�ji d�l!
	Help						=	"SVM_8_Help"						;//Rychle odsud!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Je�t� se uvid�me!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Je�t� jednou to zkus� a jsi mrtvej!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Dobr� zbra�!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//M�m dojem, �es mi je�t� nezaplatil da� z rudy!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Ubo��k, jako jsi ty, samoz�ejm� nem� ��dnou rudu!
	HandsOff					=	"SVM_8_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Hej! Kde TY ses tu vzal?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Ty jsi opravdu vykut�lenej otrava, co?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hej, ty! Po �em tu po��d sl�d�?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Kli� se odsud nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Po �em jsi sem p�i�el sl�dit?
	WiseMove					=	"SVM_8_WiseMove"					;//M�ls �t�st�!
	Alarm						=	"SVM_8_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//VET�ELEC!!
	BehindYou					=	"SVM_8_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Pod�vejme, kdo se to tu bije!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Po��dn�!
	CheerFight					=	"SVM_8_CheerFight"					;//Tak poj�, poj�!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Dob�e! Nepolevuj!
	Ooh							=	"SVM_8_Ooh"							;//Nep�rej se s n�m! Dej mu po��dnou po tlam�!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Dej mu! Je�t� se h�be!
	RunCoward					=	"SVM_8_RunCoward"					;//U� se tu nikdy neukazuj!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Nudn� boj!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Uk�zals mu to!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//To nebylo nutn�. Ponese� za to n�sledky.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//Byl to dobr� boj!
	Awake						=	"SVM_8_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_8_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Za sl�vu magie!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Vzbu� se!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//T�mhle je.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//U� je to s tebou lep�� ne� tehdy!
	HeyYou						=	"SVM_8_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_8_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Co chce�?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_8_MakeWay"						;//M��u tudy proj�t?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Tak uhni!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Kli� se! Nebo chce�, abych ti to vrazil do mozku? Vypadni odsud!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_8_LookAway"					;//Ehm... Opravdu p�kn� pohled!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Dobr�, je tvoje!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Ha? Co to bylo?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Ty nos� moji zbra�...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Tak dej mi ji, ihned!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Nech si ji, stejn� ji u� nebudu pot�ebovat!
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Dostali jednoho z na�ich chlap�k�. Jestli j� toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Co se d�je?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Eh? Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Nesta�il se divit!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Skv�l�, ale u� se o to nepokou�ej znovu.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem... Mus� m�t pro strach ud�l�no!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//V�, �e tihle novicov� jsou pod moj� ochranou. A p�esto na n� po��d dor��!
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Jestli se dotkne� kop���, jako bys sahal na moje p��jmy!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Nem�l by ses zapl�tat s m�mi p��teli.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Jestli se pust� do n�kter�ho z m�ch chr�n�nc�, mohlo by t� to st�t hlavu!
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Jak se tu opova�uje� objevit, ty zlod�ji?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//M� u sebe n�co, co pat�� n�m. Vra� n�m to!
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Okradl jsi Guru o p�r v�c�, vi�?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Okradl jsi m�gy o p�r v�c�, vi�?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_8_Om"							;//Hmmm
};


instance SVM_9 (C_SVM)				// brummig		   gem�tlicher H�ne, Besonnen, Brummiger B�r, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Nechci tu ��dn� �arov�n�!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//��k�m p�esta�! Ihned!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Chyst� se do m� pustit?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Chce� ode m� nakl�da�ku? Dej tu v�c pry�!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//D�vej pozor, kam m���!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Dej tu v�c pry�!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hej! D�vej pozor!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Rad�ji bych na tohle mal� nedorozum�n� zapomn�l...
	Strange						=	"SVM_9_Strange"						;//Uka� se! V�m, �e m� sly��!
	DieMonster					=	"SVM_9_DieMonster"					;//Tahle zv�� je opravdu stupidn�!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//To m� za to!
	NowWait						=	"SVM_9_NowWait"						;//Te� pozn�, kdo jsem!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Ty m� ale v�dr�!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Kdy� neposlouch�, tak si to vyzkou�� na vlastn� k��i!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Te� t� dostanu, vet�el�e!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem t�. Jestli se dotkne� m�ch v�c�, l�t� v pr��vihu!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Zlod�ji! Tohle bude tv�j konec!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//M�ch chlap� se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Zabil jsi jednoho z n�s!
	Dead						=	"SVM_9_Dead"						;//Aaargl
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Jse� mrtvej mu�, akor�t o tom je�t� nev�.
	YesYes						=	"SVM_9_YesYes"						;//Dob�e. V�echno dobr�!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Sakra, takov� zv��e!
	Help						=	"SVM_9_Help"						;//Rychle odsud!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Je�t� se uvid�me!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Je�t� jednou a zabiju t�!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Tahle zbra� je te� moje!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Ruda! Je to lep�� ne� nic!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//U� nem� ani kousek rudy!
	HandsOff					=	"SVM_9_HandsOff"					;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Co tady d�l�?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Sna�� se m� p�echytra�it, co?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hej ty! Co tady pohled�v�?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Vypadni odsud nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Cos tady d�lal?
	WiseMove					=	"SVM_9_WiseMove"					;//Chytr� hlavi�ka!
	Alarm						=	"SVM_9_Alarm"						;//Str�e! Sem!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//POZOR!! VET�ELEC!!!
	BehindYou					=	"SVM_9_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Uvid�me, jak jsou dobr�...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Po��dn�!
	CheerFight					=	"SVM_9_CheerFight"					;//T��k! Pokra�uj, pokra�uj!
	CheerFriend					=	"SVM_9_CheerFriend"					;//V�born�!
	Ooh							=	"SVM_9_Ooh"							;//Ah, dob�e m��en� r�na!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//V�born� pr�ce, hochu!
	RunCoward					=	"SVM_9_RunCoward"					;//Uaaah!!!!!!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//O tomhle boji u� je rozhodnuto.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Tvoje chyba!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//To nebylo nutn�. Ponese� za to n�sledky.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//Skv�l� boj!
	Awake						=	"SVM_9_Awake"						;//Jo
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_9_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Za sl�vu magie
	SectGreetings				=	"SVM_9_SectGreetings"				;//Probu� se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Jsi slep�? T�mhle!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�..
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//U� je to s tebou lep��!
	HeyYou						=	"SVM_9_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_9_NotNow"						;//Te� ne!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Co ode m� chce�?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_9_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Uhni stranou!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//D�lej, jdi z cesty!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Chce� m�t zas se mnou probl�my? Pro� si m� po��d dob�r�?
	LookAway					=	"SVM_9_LookAway"					;//Nojo! To m�me dneska p�kn� po�as�!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Dobr�! Je tvoje!
	WhatsThat					=	"SVM_9_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Ne� napo��t�m do t��, chci svou zbra� zp�tky!
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Vra� mi ji! Hned!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Nech si ji! U� ji nebudu pot�ebovat.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Dostali jednoho z na�ich kluk�. Jestli j� toho lotra...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Co se d�je?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Eh? Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! M� na tebe vztek!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Obdivuhodn�, ale u� se o to znovu nepokou�ej.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Zv�t�zit nad m�gem... Mus� m�t pro strach ud�l�no!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Mus� b�t ��len�, �es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Co sis vlastn� myslel, �e d�l�, kdy� jsi zab�jel kop��e?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Srazil jsi m�ho p��tele, pro�?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Jsi p��li� sm�l�, probl�m s n�kter�m z chr�n�nc� by pro tebe mohl znamenat nebezpe��.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Jak se tu opova�uje� objevit, ty zlod�ji?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Kr�st u na�� rodiny je hor�� ne� cokoliv jin�ho! Toho bude� litovat!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Okradl jsi Guru o p�r v�c�, vi�?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Okradl jsi m�gy o p�r v�c�, vi�?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Dobr� boj! Tv� p��prava st�la za to!
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_9_Om"							;// Hmmm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//��dn� �arov�n�!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//P�esta� u� s t�mi kouzly! Ihned!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Dej tu zbra� pry�!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Co tady pohled�v�? Chce� m�t se mnou probl�my?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Dej to pry� nebo ti uk�u!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Jestli chce� m�t probl�my, tak na m� je�t� jednou zami�!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hej! D�vej pozor! Je�t� jednou a schyt� to!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Posly�, �lov��e! Zapomeneme na tuhle malou h�dku, jo?
	Strange						=	"SVM_10_Strange"						;//Vystup! Uka� se!
	DieMonster					=	"SVM_10_DieMonster"						;//Pra�iv� bestie!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Te� zem�e�!
	NowWait						=	"SVM_10_NowWait"						;//Je �as z��tov�n�!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Vypad� to, jako bys cht�l je�t� jednu do tlamy!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//��kal sis o to!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Te� t� dostanu, vet�el�e!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem t�. Jestli se dotkne� m�ch v�c�, l�t� v pr��vihu!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Zlod�ji! Tohle bude tv�j konec!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//M�ch chlap� se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Zabil jsi jednoho z m�ch chlap�. Te� zabiju j� TEBE!
	Dead						=	"SVM_10_Dead"							;//Aaargl
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Toho bude� litovat! Bastarde!
	YesYes						=	"SVM_10_YesYes"							;//Dobr�, dobr�! Klid, vyhr�l jsi!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Takov� bestie! Ut�kej jak nejrychleji um�!
	Help						=	"SVM_10_Help"							;//Pry�!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Je�t� m� pozn�!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Je�t� jednou to zkus a bude� litovat!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Ta zbra� je te� moje!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Vezmu si trochu tvoj� rudy!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Sakra, ��dn� RUDA!
	HandsOff					=	"SVM_10_HandsOff"						;//Ruce od toho pry�!Ty kryso!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hej! Odkud si p�i�el?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Mysl� si, �e jsem �pln� hloup�?
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hej! Po �em tu sl�d�?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Kli� se odsud nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Cos tady d�lal?
	WiseMove					=	"SVM_10_WiseMove"						;//To bylo �t�st�!
	Alarm						=	"SVM_10_Alarm"							;//Str�e! Sem!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//POZOR!!! VET�ELEC!!!
	BehindYou					=	"SVM_10_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_10_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Po��dn�!
	CheerFight					=	"SVM_10_CheerFight"						;//��dnou l�tost!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Dora� ho!
	Ooh							=	"SVM_10_Ooh"							;//Nep�rej se s n�m!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Dej mu p�es tlamu!
	RunCoward					=	"SVM_10_RunCoward"						;//Vra� se, zbab�l�e!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Jenom z�van v�tru a hned by to s n�m pra�tilo!
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Zaslou�il si to!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Jsi jako samotn� smrt! Ta t� nau�� takhle zab�jet!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Tys mu dal lekci!
	Awake						=	"SVM_10_Awake"							;//Uaah
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Nazdar.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Za sl�vu magie!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Vzbu� se!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//U� je to s tebou lep��!
	HeyYou						=	"SVM_10_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_10_NotNow"							;//Te� ne!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Co chce�?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//M��u ti pomoci?
	MakeWay						=	"SVM_10_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Kli� se! Nebo chce�, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_10_LookAway"						;//Nejsem vlastn� tady...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Dobr�, nech si ten kr�m!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Vra� mi mou zbra�!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Nech si ji! U� ji nebudu pot�ebovat.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Dostali jednoho z na�ich chlap�k�. To m� doopravdy �tve!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;// Hej, co je? Pro� m� bud�?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Eh? Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Zv�t�zit nad m�gem...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Mo�n� bys m�l v�d�t, s k�m si za��n�, kdy� takhle sr�� novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Mus�m tu sjednat po��dek! Nech m� lidi na pokoji!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Srazil jsi m�ho p��tele.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Dotkni se n�kter�ho z m�ch chr�n�nc� a p�ijde t� to draho.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//U� to nezkou�ej znova, zlod�ji!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//M� u sebe n�co, co pat�� n�m. M�l bys n�m to vr�tit.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Okradl jsi Guru o p�r v�c�. To nebylo moudr� nechat se p�itom chytit!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Okradl jsi m�gy o p�r v�c�, vi�?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//V�born�! Vyhr�l jsi, ale byl to dobr� boj.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_10_Om"							;//Hmmm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vern�nftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Nepokou�ej se tu �arovat!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//P�esta� u� s t�mi kouzly! Ihned!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Jestli hled� probl�my, tak pokra�uj!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Ruce od toho pry� nebo t� odd�l�m!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Dej tu v�c pry�!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Tak ty chce� m�t se mnou probl�my? V� to jist�?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Co to d�l�! P�esta�!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Dobr�, zapomeneme na tuhle h�dku.
	Strange						=	"SVM_11_Strange"						;//Hmm! Sakra! Jak se sem dostal?
	DieMonster					=	"SVM_11_DieMonster"						;//Jestli mi zk��� cestu, bude to jejich smrt!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Pokud si ud�l� nep��tele, pak se s nimi mus� dok�zat vypo��dat. Zem�i.
	NowWait						=	"SVM_11_NowWait"						;//Tos nem�l d�lat!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Copak jsem ti u� jednu nevrazil? Tum� dal��...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Kdy� neum� poslouchat, bude t� to mrzet!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Hej, vet�el�e! Te� dostane� lekci!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Asi t� budu muset pra�tit p�es prsty.
	DirtyThief					=	"SVM_11_DirtyThief"						;//Kr�de� za to nestoj�.
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Naru�il jsi moje �zem�! Te� t� odd�l�m!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Zabil jsi jednoho z m�ch chlap�. To byla tvoje posledn� chyba!
	Dead						=	"SVM_11_Dead"							;//Aaargl
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Tos nem�l d�lat!
	YesYes						=	"SVM_11_YesYes"							;//Dobr�, dobr�! Klid, vyhr�l jsi!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//To je na m� moc!
	Help						=	"SVM_11_Help"							;//Kli� se!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Tohle bude m�t n�sledky, kamar�de!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//U� to znova nezkou�ej!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//O tvoj� zbra� se postar�m l�p ne� ty!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//D�k, �es mi nechal trochu sv� rudy!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Nic, ��dn� ruda!
	HandsOff					=	"SVM_11_HandsOff"						;//Dej ty sv� �pinav� pracky pry�!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Kli� se odsu� nebo t� pro�enu!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hej! Kde TY ses tu vzal?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Se mnou ne, p��teli!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Po �em tu sl�d�?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Ta chatr� je moje! Kli� se nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Cos tady d�lal? Vypadni, ne� t� sejmu!
	WiseMove					=	"SVM_11_WiseMove"						;//Dobr�! U� to znovu ned�lej!
	Alarm						=	"SVM_11_Alarm"							;//Str�e! Sem!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//POZOR!!! VET�ELEC!!!
	BehindYou					=	"SVM_11_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Uvid�me tentokr�t, kdo z koho!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Po��dn�! Do toho!
	CheerFight					=	"SVM_11_CheerFight"						;//P�esta� si s n�m hr�t!
	CheerFriend					=	"SVM_11_CheerFriend"					;//D�lej, snad na n�j sta��, ne?
	Ooh							=	"SVM_11_Ooh"							;//Oh! Nic moc!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Hmm! To nebylo zl�!
	RunCoward					=	"SVM_11_RunCoward"						;//U� se tu nikdy neukazuj!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Dobr� r�na!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Co d�lat! Zaslou�il si to!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Tys ho zabil! Z toho bude velk� mrzutost!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//V�born� pr�ce! Kr�sn� p�edstaven�!
	Awake						=	"SVM_11_Awake"							;//Uaah
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Nazdar!
	ALGreetings					=	"SVM_11_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Za sl�vu magie!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Vzbu� se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Jsi slep�? T�mhle!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Nem��u t� nic nau�it, proto�e nem� ��dn� zku�enosti.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//U� je to s tebou lep��!
	HeyYou						=	"SVM_11_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_11_NotNow"							;//Te� ne!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Co chce�?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_11_MakeWay"						;//M��u tudy proj�t?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Ustup stranou!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Kli� se! Nebo chce�, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_11_LookAway"						;//Nechci se do toho zapl�st!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Dobr�, je tvoje!
	WhatsThat					=	"SVM_11_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Ty m� moji zbra�...?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Tak dej mi ji, d�lej!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Nech si ji! Stejn� ji u� nebudu pot�ebovat!
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Dostali jednoho z na�ich chlap�k�. Jestli j� toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Co po��d je?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Porazil jsi jednoho z Rudobaron�! Skv�l�, ale hloup�! Velmi hloup�!
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Zv�t�zit nad m�gem... to nen� pr�v� moudr�!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Tihle ho�i jsou pod moj� ochranou, a tys jednoho z nich srazil...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Jestli se dotkne� kop���, jako bys sahal na moje p��jmy!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Kdo je proti m�mu  p��teli, jakoby byl proti mn�!
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Jestli vzt�hne� ruku na n�koho, kdo je pod moj� ochranou, bude t� to st�t hlavu!
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Jak se sem opova�uje� vr�tit, ty zlod�ji?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//M� n�co, co pat�� n�m. M�l bys n�m to vr�tit.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Okradl jsi Guru o p�r v�c�, vi�?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Okradl jsi m�gy o p�r v�c�, vi�?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Poru�il jsi na�e pravidlo ��slo 1. Nezab�jet!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nem��u uv��it!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//Byl to dobr� boj! Po��dn� jsem to od tebe schytal, �lov��e!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...nech si to pro sebe, lid� to nemusej� v�d�t...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_11_Om"								;//Hmmm
};


instance SVM_12	(C_SVM)		//Bazaar-H�ndler		Nach au�en freundlich,jovial,Innen hinterh�ltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//P�esta� s t�mi kouzly!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Kdy� ��k�m: p�esta� s t�mi kouzly, tak to mysl�m v�n�!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Co chce� s tou zbran� ud�lat, �lov��e!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Dej to pry�!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//M��� na m�!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Jestli s t�m nep�estane�, bude� m�t probl�my!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hej, se� slepej, nebo co?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Zapomeneme na to mal� nedorozum�n�, dobr�?
	Strange						=	"SVM_12_Strange"						;//Je�t� p�ed chvilkou tu byl! Divn�!
	DieMonster					=	"SVM_12_DieMonster"						;//Tv�j �as nade�el, bastarde!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Je �as z��tov�n�!
	NowWait						=	"SVM_12_NowWait"						;//��k� si o po��dnou nakl�da�ku!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Ty je�t� nem� dost?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Dobr�, ��kal sis o to!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Oni t� odsud vynesou!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem t�. Jestli se dotkne� m�ch v�c�, l�t� v pr��vihu!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Ty v�ivej zlod�ji! J� t� nau��m!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Nen� nikdo, kdo by m�l probl�m s m�mi lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Zabil jsi jednoho z n�s! Te� zabiju j� TEBE!
	Dead						=	"SVM_12_Dead"							;//Aaargl
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_12_YesYes"							;//Klid, klid, vyhr�l jsi!
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//To je na m� moc! Na to nesta��m!
	Help						=	"SVM_12_Help"							;//K �ertu!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Je�t� se uvid�me!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//U� to znova nezkou�ej!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Tahle zbra� se mi l�b�!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Pod�v�m se, jak je tv� ruda dob�e ulo�en�!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//K �ertu! ��dn� ruda!
	HandsOff					=	"SVM_12_HandsOff"						;//Ruce od toho pry�!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Mysl�, �e jsem tak hloup�?
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Co tady pohled�v�?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Vypadni odsud nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Tady nem� co d�lat!
	WiseMove					=	"SVM_12_WiseMove"						;//U�� se rychle!
	Alarm						=	"SVM_12_Alarm"							;//Str�e! Sem!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//POZOR!!
	BehindYou					=	"SVM_12_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Po��dn�!
	CheerFight					=	"SVM_12_CheerFight"						;//V�born�!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Vy�i� ho!
	Ooh							=	"SVM_12_Ooh"							;//Tak d�vej pozor!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//U� bylo na �ase!
	RunCoward					=	"SVM_12_RunCoward"						;//Ten chlap�k ut�k� pry�!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Jasn� v�t�z, jak jsem �ek!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Zaslou�il si to!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Akor�t zab�j� lidi. M� te� po��dnej probl�m.
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Skv�l� boj!
	Awake						=	"SVM_12_Awake"							;//Uuaah
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Nazdar
	ALGreetings					=	"SVM_12_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Za sl�vu magie
	SectGreetings				=	"SVM_12_SectGreetings"					;//Probu� se!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//T�mhle!
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�..
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//U� je to s tebou lep��!
	HeyYou						=	"SVM_12_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_12_NotNow"							;//Te� ne!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//M��u ti pomoci?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Co chce�?
	MakeWay						=	"SVM_12_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//D�lej, uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Jse� hluchej nebo tou�� po mal�ru?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_12_LookAway"						;//Stalo se n�co? Nevid�l jsem NIC...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Dobr�! Tak si ji nech!
	WhatsThat					=	"SVM_12_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Opravdu chci svoji zbra� zp�tky!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Hm, nen� �patn�! Sehnal jsem dal��!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Dostali jednoho z na�ich kluk�. Jestli j� toho lotra...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm, co to je? Pro� m� bud�?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Eh? Dostal jsi nakl�da�ku? Dob�e ti tak!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! M� na tebe vztek!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Skv�l�, ale u� se o to znovu nepokou�ej.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Zv�t�zit nad m�gem... Mus� m�t pro strach ud�l�no!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Mus� b�t ��len�, �es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Co sis vlastn� myslel, �e d�l�, kdy� jsi zab�jel kop��e?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Srazil jsi m�ho p��tele, pro�?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Jsi p��li� sm�l�, probl�m s n�kter�m z m�ch chr�n�nc� by pro tebe mohl znamenat nebezpe��.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Jak se sem opova�uje� vr�tit, ty zlod�ji?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//M� n�co, co pat�� n�m. M�l bys n�m to vr�tit.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Kradl jsi u Guru! Nemusel ses aspo� nechat nachytat!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//M�gov� nemaj� r�di lidi, co se motaj� kolem jejich v�c�!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nem��u uv��it!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_12_Om"							;//Hmmm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, �bereifrig, �hnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y�berion blind,	Mitl�ufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//P�esta� u� s t�mi kouzly!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Dej to pry�! IHNED!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Polo� tu zbra�!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Polo� tu zbra�!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Ty na m� m���? Dej si pozor!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Jde� si rovnou pro smrt! M�l bys rad�ji m��it jinam!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Co to m�lo znamenat?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Dobr�, zapome�me na tuhle h�dku, dobr�?
	Strange						=	"SVM_13_Strange"						;//Kam se pod�l? To nen� mo�n�!
	DieMonster					=	"SVM_13_DieMonster"						;//Dnes ve�er budeme m�t maso!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Te� je �ada na tob�! Bez milosti!
	NowWait						=	"SVM_13_NowWait"						;//To znamen� po��dn� v�prask!
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//U� to znova nezkou�ej! Jasn�?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//S�m jsi to cht�l!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Nem� tu co pohled�vat, vet�el�e!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Asi t� budu muset pra�tit p�es prsty!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Zlod�ji pra�ivej! Zp�er��m ti hn�ty...
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Tady se nikdo nikoho nedotkne, s v�jimkou m�!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Zabil jsi jednoho z n�s!
	Dead						=	"SVM_13_Dead"							;//Aaargl
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Nebude� m�t moc �asu toho litovat!
	YesYes						=	"SVM_13_YesYes"							;//Nic se ned�je, v�bec nic!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Nem�m tu spr�vnou zbra�. Je�t� se uvid�me...
	Help						=	"SVM_13_Help"							;//Uuuuaaaaahh! Zmiz!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Je�t� se uvid�me!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//P��t� t� zabiju!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//P�kn� zbra�! Tvoje? Ne? Dobr�!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Douf�m, �e se na m� nena�tve�, kdy� si vezmu trochu rudy.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Ty u� nem� ani kousek rudy!
	HandsOff					=	"SVM_13_HandsOff"						;//Ty kryso! Ruce pry�, nebo t� zabiju!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Padej odsud! Kli� se odsu�!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Co tady pohled�v�?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Ty se m� snad sna�� p�echytra�it?
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hej, ty! Co tady pohled�v�?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Co tady d�l�? Upaluj nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Tady nem� co d�lat!
	WiseMove					=	"SVM_13_WiseMove"						;//M� �t�st�! Nejrad�i bych ti dal jednu po tlam�!
	Alarm						=	"SVM_13_Alarm"							;//Str�e! Sem!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//POZOR!!
	BehindYou					=	"SVM_13_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Uvid�me, kdo bude �r�t hl�nu prvn�.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//V�born�! Je�t�!
	CheerFight					=	"SVM_13_CheerFight"						;//Chci vid�t krev!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Uka� mu!
	Ooh							=	"SVM_13_Ooh"							;//St�hni se, idiote!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Uuaahh!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Uahh, upaluj pry�!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Trapn� vystoupen�! Slabounk� z�van v�tru a ulet�l jako v�chet sl�my!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Uh! Nandej mu to!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//To je sebevra�da, zab�t n�koho p�ed sv�dky!
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//P�kn� boj!
	Awake						=	"SVM_13_Awake"							;//Uuahh
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Jsi v po��dku?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Za sl�vu magie!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Vzbu� se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Jsi slep�? T�mhle!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//U� je to s tebou lep��!
	HeyYou						=	"SVM_13_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_13_NotNow"							;//Te� ne!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Chce� ode m� n�co?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//M��u pro tebe n�co ud�lat?
	MakeWay						=	"SVM_13_MakeWay"						;//Nech m� j�t!
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Uhni mi z cesty, �lov��e!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Hled� probl�my? Uhni!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_13_LookAway"						;//NIC jsem nevid�l!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Dobr�. Je tvoje.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Vra� mi moji zbra�!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Dej mi ji!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Dobr�! Nech si ji! Najdu jin� �e�en�!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Jeden z n�s je mrtev. To si zasluhuje odplatu!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Pro� jsi m� vzbudil?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Dostal jsi nakl�da�ku, o kterou sis koledoval!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Bude na tebe po��dn� na�tvan�!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Vypad� to, �e p�itahuje� probl�my jako magnet!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Zv�t�zit nad m�gem je opravdu ��len� n�pad, �lov��e!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Tak ty jsi ten, kdo ml�t� novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Nech m� hochy na pokoji!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Motat se kolem m�ch p��tel nen� rozumn�!
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Nebude� tu d�lat probl�my!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Jestli vzt�hne� ruku na n�koho, kdo je pod moj� ochranou, tak si to schyt�!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Se� mi ukradenej, ty zmetku! U� to znovu nezkou�ej!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Chceme na�e v�ci zp�tky! Vra� n�m je!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Kradl jsi u Rudobaron�? Prob�h, pro�?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Okradl jsi Guru? Jak� �koda, �e t� nachytali!
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Kradl jsi u m�g�! Jak stupidn� n�pad!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Jeden z na�ich lid� zem�el a ty s t�m m� co do �in�n�! Sta�� mal� chybi�ka a p�jde� za n�m!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nem��u uv��it!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_13_Om"							;//Hmmm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erz�hler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//P�esta� u� s t�mi kouzly!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Sly�el jsi m�! P�esta� s t�mi kouzly!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Co chce� s tou zbran� ud�lat, �lov��e!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Dej tu zbra� pry�!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//M��� na m�!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Tak p�estane� na m� m��it?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Tak d�vej pozor!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Zapome�me na tuhle malou neshodu n�zor�!
	Strange						=	"SVM_14_Strange"						;//Dobr� trik, najednou zmizel!
	DieMonster					=	"SVM_14_DieMonster"						;//Otravn� stv�ra.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Mus�m t� zab�t... Nic osobn�ho, ch�pe�!
	NowWait						=	"SVM_14_NowWait"						;//Pro dne�ek dost!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//U� nechce� m�t znova probl�my, vi�?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Takhle jsi to cht�l!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Nebyl jsi pozvan�!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Do m�ch v�c� ti nic nen�!
	DirtyThief					=	"SVM_14_DirtyThief"						;//N�co sis ode m� vyp�j�il! Te� mi to bude� muset zaplatit!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Mus� se nau�it dodr�ovat pravidla!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//N�koho jsi zabil!
	Dead						=	"SVM_14_Dead"							;//Aaargl
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Toho bude� litovat!
	YesYes						=	"SVM_14_YesYes"							;//Dob�e, dob�e!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Tuhle v�zvu te� nechci p�ijmout!
	Help						=	"SVM_14_Help"							;//Pot�ebuji se vr�tit k sv�m studi�m!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Ur�it� se je�t� uvid�me!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Rad�ji u� to znova ned�lej!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Vezmu si tu zbra�!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Ta ruda je jist� znamenit�!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Nem� ��dnou rudu!
	HandsOff					=	"SVM_14_HandsOff"						;//Ruce pry�!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Jak jsi se sem dostal?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Ty si snad d�l� legraci!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Po �em tady sl�d�?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Vypadni nebo zavol�m str�e!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Tady nem� co d�lat! Rozum�?
	WiseMove					=	"SVM_14_WiseMove"						;//Chytr� rozhodnut�!
	Alarm						=	"SVM_14_Alarm"							;//Str�e, sem!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//VET�ELEC!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Jak neschopn�!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Vypad� sna�iv�!
	Ooh							=	"SVM_14_Ooh"							;//To bylo trapn�!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//To je jedin� zp�sob, jako to ud�lat....
	RunCoward					=	"SVM_14_RunCoward"						;//N�co se nau�il!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//To bylo a� potom!
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Dob�e mu tak!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Nebylo nutn� ho zab�jet, bude� m�t z toho velkou nep��jemnost!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Takov�hle �arv�tky m� nud�!
	Awake						=	"SVM_14_Awake"							;//Zaspal jsem?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Nazdar.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Za sl�vu magie!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Vzbu� se!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Nem��u t� nic nau�it. Nem� dost zku�enost�.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Jsi u konce sv�ch mo�nost�. M�l by ses u�it n�co jin�ho.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Aby ses mohl st�t v�dcem, mus� na sob� je�t� pracovat!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//U� je to s tebou lep��!
	HeyYou						=	"SVM_14_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_14_NotNow"							;//Te� ne!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Co pro tebe m��u ud�lat?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//M��u ti pomoci?
	MakeWay						=	"SVM_14_MakeWay"						;//Ustup stranou!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Nech m� j�t!
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Te� se ztra�!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Chce� m�t zas se mnou probl�my?
	LookAway					=	"SVM_14_LookAway"						;//Nezaj�m� m�, co m� za lubem!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Nech si ji!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Vra� mi moji zbra�!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Vra� mi ji!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Dob�e. U� ji nechci!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Dostali jednoho z na�ich chlap�k�. Najdeme vin�ka...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Ru�� m� p�i studi�ch!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Sly�el jsem, �e m� probl�my!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Nesta�il se divit!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Skv�l�.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Zv�t�zit nad m�gem...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//V�, �e tihle novicov� jsou pod moj� ochranou. A p�esto na n� po��d dor��!
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Jestli se dotkne� kop���, jako bys sahal na moje p��jmy!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Nem�l by ses zapl�tat s m�mi p��teli.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Je�t� jednou se dotkne� n�kter�ho novice a bude� litovat!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Jestli se pust� do n�kter�ho z m�ch chr�n�nc�, mohlo by t� to st�t hlavu!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Jak se tu opova�uje� objevit, ty zlod�ji?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//M� u sebe n�co, co pat�� n�m. Vra� n�m to!
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//�lov��e, tys kradl u Rudobaron�? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Okradl jsi Guru o p�r v�c�, vi�?
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Okradl jsi m�gy o p�r v�c�, vi�?
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//M� na sv�dom� jednoho z na�ich mu��. Sta�� mal� chybi�ka a p�ijde �ada na tebe!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaron�! �lov��e, �pln� ses pominul?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Zabil jsi jednoho z Guru! Nem��u tomu uv��it!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Zabil jsi jednoho z m�g�! Jak se to chyst� obh�jit?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Jeden z �len� Star�ho t�bora je mrtev a tvoje jm�no je spojeno s jeho smrt�...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Nov� t�bor utrp�l t�kou ztr�tu a ty v tom m� prsty!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze sv�ch v���c�ch a ty ho m� na sv�dom�!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//To nebude snadn� napravit!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Po��dn� jsi mi to nandal, �lov��e. Byl to dobr� boj! Ale te� u� je konec!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...kdy� mysl�...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...mo�n�...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...to nebylo moc chytr�...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...ud�l�m nejl�p, kdy� se budu dr�et d�l...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...tohle opravdu nen� m�j probl�m...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...bylo jasn�, �e z toho bude mrzutost...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...nech si to ale pro sebe, lid� to nemus� v�d�t...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...u� se to znovu nestane...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...a p�esto na tom mus� n�co b�t...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...mus� d�vat pozor na to, co lidem ��k�...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...jestli se m� to net�k�...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...nem�l bys v�emu v��it...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...p�esto bych necht�l b�t v jeho k��i...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...po��d ta sam� poh�dka...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...n�kte�� lid� se nikdy nepou��...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...d��ve b�valo v�echno docela jinak...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...lid� ��kaj�...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...takov� �e�i j� nikdy neposlouch�m...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...na n�koho se spol�h� a dostane� se do probl�m�, tak to chod�...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...pochybuji, �e by se to mohlo zm�nit...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...m� asi pravdu...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...vydr�. Lep�� je do ni�eho se nepou�t�t...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...myslel jsem, �e u� je to d�vno za n�mi...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...poj�me rad�ji mluvit o n��em jin�m...
	Om							= 	"SVM_14_Om"							;//Hmmm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hej, ty!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Po�kej!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Vzbu� se!
	ALGreetings				=	"SVM_15_ALGreetings"				;//Za Gomeze!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Zdrav�m.
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Zdar.
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//(probouz� se)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nejde to.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, je to rozbit�.
	NeedKey					= 	"SVM_15_NeedKey"					;// Pot�ebuji od toho kl��...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// U� ��dn� dal�� pakl�� nen�...
	InvFull					= 	"SVM_15_InvFull"					;// Nem��u s t�m nic v�c ud�lat.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Jdi pry�! Se mnou nesm� mluvit!
	Help						=	"SVM_16_Help"			;	//(v�k�iky)
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaargl
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverst�ndlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//�ber Stimme 17, sind aber in halbwegsverst�ndlichem orkisch-deutsch
												//Das hier �berall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen erg�nzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
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




