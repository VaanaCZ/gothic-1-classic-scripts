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
	StopMagic					=	"SVM_1_StopMagic"					;//Hej! �adnej magii!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Chcesz dosta� w ucho? Natychmiast przesta�!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Schowaj bro�!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Schowaj natychmiast t� cholern� bro�!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Od�� to!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Chcesz dosta� w �eb? To wyceluj we mnie jeszcze raz!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Uwa�aj! Spr�buj tego jeszcze raz, a rozwal� ci �eb!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Zapomnijmy o ca�ej sprawie, dobra?
	Strange						=	"SVM_1_Strange"						;//Wy�a� st�d, sukinsynu!
	DieMonster					=	"SVM_1_DieMonster"					;//Psia twoja ma�!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Ju� po tobie!
	NowWait						=	"SVM_1_NowWait"						;//Zaraz dostaniesz...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Widz�, �e chcesz oberwa�, co?
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Jak z tob� sko�cz�, nie b�dzie co zbiera�!
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Ostrzega�em ci�, �eby� trzyma� �apy z dala od moich rzeczy!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Zap�acisz mi za to, z�odzieju!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Nikt nie b�dzie podskakiwa� moim kumplom!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Powali�e� jednego z naszych. Teraz ja ROZWAL� ciebie!
	Dead						=	"SVM_1_Dead"						;//Aaaaarg!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aaargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aaargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aaargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Jeszcze po�a�ujesz!
	YesYes						=	"SVM_1_YesYes"						;//Bez paniki! Wygra�e�!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Cholera! W nogi!
	Help						=	"SVM_1_Help"						;//Szlag by to...!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Jeszcze si� spotkamy!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Spr�buj tego jeszcze raz, a po�a�ujesz!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Niez�a bro�! Dawaj j�!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Dzi�ki za rud�, BOHATERZE!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Biedny g�upcze, nawet nie masz przy sobie rudy!
	HandsOff					=	"SVM_1_HandsOff"					;//�apy precz!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Spadaj st�d!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz�e�?!
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//My�lisz, �e jestem taki g�upi?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej, ty? Co si� tak skradasz?!
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Won z mojej chaty, albo wezw� stra�e!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Nie masz tu czego szuka�! Spadaj!
	WiseMove					=	"SVM_1_WiseMove"					;//M�dry ch�opiec!
	Alarm						=	"SVM_1_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALARM! INTRUZ!!!
	BehindYou					=	"SVM_1_BehindYou"					;//Za tob�!
	TheresAFight				=	"SVM_1_TheresAFight"				;//A, rozr�ba!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_1_CheerFight"					;//Walczycie jak baby!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Wyko�cz go!
	Ooh							=	"SVM_1_Ooh"							;//Oddaj mu wreszcie!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Dawaj go!
	RunCoward					=	"SVM_1_RunCoward"					;//Wracaj, tch�rzu!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Facet ma do��!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Nale�a�o mu si�!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Dlaczego go zabi�e�? Ju� po tobie!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Niez�a walka!
	Awake						=	"SVM_1_Awake"						;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Witaj
	ALGreetings					=	"SVM_1_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Jest tam!
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Wr��, jak zdob�dziesz troch� do�wiadczenia.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_1_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_1_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Co mog� dla ciebie zrobi�?
	MakeWay						=	"SVM_1_MakeWay"						;//Przepu�� mnie!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Zejd� mi z drogi, cz�owieku!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//G�uchy jeste�? RUSZ SI�!!!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Zn�w szukasz k�opot�w?
	LookAway					=	"SVM_1_LookAway"					;//Uhhhh! Nic nie widzia�em!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Co to by�o?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Paradujesz sobie z MOJ� broni�!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Dawaj to!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebuj�!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Za�atwili jednego z naszych. Jak dorw� tego, co to zrobi�...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Cholera, czemu mnie budzisz?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Dosta�e� baty? Nale�a�o ci si�!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Pobi�e� Magnata! Jest na ciebie w�ciek�y!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Powali�e� Guru. Zdajesz si� przyci�ga� k�opoty jak magnes!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Pokona�e� maga. To nie by� najlepszy pomys�...
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Nie mo�esz tak po prostu bi� Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Zostaw moich ch�opc�w w spokoju!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Pobi�e� mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Nie tolerujemy tutaj takich jak ty!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Jak pobijesz kt�rego� z moich podopiecznych, b�d� k�opoty!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Ty dupku! Jak �miesz mnie okrada�! Nigdy wi�cej tego nie pr�buj!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Oddawaj nam nasze rzeczy! Ale ju�!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Okrad�e� Magnat�w! Co ci strzeli�o do g�owy?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Okrad�e� Guru? Szkoda tylko, �e da�e� si� z�apa�!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Okrad�e� mag�w? Brak ci pi�tej klepki, czy co?
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Jeden z naszych ludzi nie �yje, a ty macza�e� w tym palce. Nast�pny podejrzany ruch i b�dziesz martwy!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//Nie �atwo b�dzie to odkr�ci�!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//To by�a uczciwa walka! Nie�le mi si� oberwa�o, stary!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ... co za g�wno ...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ... mo�e, ale kogo to obchodzi? ...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ... g�upota ...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ... nie m�j problem ...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ... dlaczego zawsze tak si� dzieje? ...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ... to si� ju� nie powt�rzy ...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ... sko�cz t� paplanin�, co? ...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ... ja tam si� nie mieszam ...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ... by� czas, kiedy takie sprawy za�atwiano inaczej ...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ... nie b�d� dalej s�ucha� tej paplaniny ...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_1_Om"							;//Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einsch�chterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//�adnej magii!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//Hej! Powiedzia�em: �adnej magii!
	WeaponDown					=	"SVM_2_WeaponDown"					;//No ju�, schowaj to!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Schowaj bro�!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Uwa�aj gdzie celujesz, baranie!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Wyceluj we mnie jeszcze raz to si� zdenerwuj�!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hej, co to ma znaczy�?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Zapomnijmy o ca�ej sprawie, dobra?
	Strange						=	"SVM_2_Strange"						;//Dziwne! Gdzie on si� podzia�?!
	DieMonster					=	"SVM_2_DieMonster"					;//Jeszcze jeden!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Obawiam si�, �e musz� z tob� sko�czy�!
	NowWait						=	"SVM_2_NowWait"						;//Sam jeste� sobie winien!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Wci�� nie masz do��?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//C�, skoro tego chcesz!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Wiesz, �e nie masz tu czego szuka�!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Trzymaj �apy z dala o rzeczy, kt�re nie nale�� do ciebie!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Okrad�e� mnie! Nie daruj� ci tego!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Nikt nie b�dzie podskakiwa� moim ch�opcom!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Zabi�e� jednego z nas! Zap�acisz za to!
	Dead						=	"SVM_2_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Jeszcze po�a�ujesz!
	YesYes						=	"SVM_2_YesYes"						;//Spokojnie, spokojnie, wygra�e�!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Ja... eee... p�jd� zawo�a� pomoc!
	Help						=	"SVM_2_Help"						;//Nie mam czasu, musz� jeszcze co� za�atwi�!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Zobaczysz, jeszcze si� spotkamy
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Nigdy wi�cej tego nie pr�buj!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//JA wezm� t� bro�!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//I tak nie potrzebujesz tej rudy!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Nie masz rudy? To chyba nie jest tw�j szcz�liwy dzie�!
	HandsOff					=	"SVM_2_HandsOff"					;//�apy precz!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Wyno� si� st�d!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz�e�?!
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Nie pr�buj robi� ze mnie g�upca, albo po�a�ujesz!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Czemu si� tak skradasz?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Precz z mojej chaty, albo wezw� stra�e!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Trzymaj si� z dala od naszych chat!
	WiseMove					=	"SVM_2_WiseMove"					;//M�dra decyzja!
	Alarm						=	"SVM_2_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ALARM!!
	BehindYou					=	"SVM_2_BehindYou"					;//Za tob�!
	TheresAFight				=	"SVM_2_TheresAFight"				;//A, rozr�ba!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//To ju� wszystko?!
	CheerFight					=	"SVM_2_CheerFight"					;//No obud� si�, kr�lewno!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Niez�y cios!
	Ooh							=	"SVM_2_Ooh"							;//Musia�o bole�!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Jeszcze si� rusza.
	RunCoward					=	"SVM_2_RunCoward"					;//Zosta� tu, mi�czaku!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Facet ma do��!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Nale�a�o mu si�!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Zabi�e� go! Nie by�o innego wyj�cia?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Niez�a walka, ale ciut za kr�tka.
	Awake						=	"SVM_2_Awake"						;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_2_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_2_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Tutaj.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_2_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_2_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Co mog� dla ciebie zrobi�?
	MakeWay						=	"SVM_2_MakeWay"						;//Przepu�� mnie!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Zejd� mi z drogi!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Z�a� mi z drogi, albo oberwiesz w ucho!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Znowu szukasz k�opot�w?
	LookAway					=	"SVM_2_LookAway"					;//Ja NIC nie widzia�em! Nie ma sprawy!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Dobra! We� to sobie!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Co? Jak?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Hej, czy to nie jest przypadkiem moja bro�?!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//No ju�, daj mi to!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//I tak nie b�d� tego potrzebowa�!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Kto� za�atwi� jednego z naszych. Jak dorwiemy faceta - wyl�duje w piachu.
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Czemu mnie obudzi�e�?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Dosta�e� w dzi�b? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Pokona�e� Magnata!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Powali�e� Guru?! Nie wiem czy to jeszcze odwaga, czy ju� g�upota!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Pokona� maga... musisz by� dzielnym cz�owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Dbam tutaj o porz�dek!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Niewa�ne, o co posz�o! Atakuj�c Kopacza prosisz si� o k�opoty!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Pobi�e� mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Zostaw Nowicjuszy w spokoju!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//�adnej rozr�by z moimi ch�opcami! Zrozumiano?!
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Dlaczego mnie okrad�e�?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Masz tu co�, co nale�y do nas, a my chcemy to z powrotem!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Stary! Okrad�e� Magnat�w! Ale si� w�ciekn�.
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Okrad�e� Guru! Masz szcz�cie, �e ci� nie z�apali!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Magowie nie lubi�, gdy kto� grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Wiesz jak trudno jest co� takiego odkr�ci�?!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Tak, pokona�e� mnie! To by�a pi�kna walka, ale teraz daj ju� sobie spok�j!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ... ale nie chcia�bym by� w jego sk�rze ...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ... w�tpi�, �eby to si� kiedy� zmieni�o ...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ... zapewne masz racj� ...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gem�se. "Ich schau noch�n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//�adnej magii!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Natychmiast przesta�! �adnej magii!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Od�� bro�!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Jak nie przestaniesz tym wymachiwa�, kto� si� w ko�cu rozz�o�ci!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Dlaczego we mnie celujesz?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Schowaj bro�, albo si� wkurz�!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Heeeej! Co to ma znaczy�?!
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//No dobra, powiedzmy, �e ka�dy z nas ma swoje racje!
	Strange						=	"SVM_3_Strange"						;//Znik�? Po prostu rozp�yn�� si� w powietrzu?
	DieMonster					=	"SVM_3_DieMonster"					;//Nie b�dziesz mnie wi�cej wkurza�, �mieciu!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Zaraz b�dzie po wszystkim!
	NowWait						=	"SVM_3_NowWait"						;//Chyba musz� by� nieco bardziej dosadny!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Widz�, �e nadal nie masz do��!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sam si� prosi�e�!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Nie powinno ci� tu by�! Teraz musz� spu�ci� ci lanie!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Widz�, �e kto� musi ci da� po �apach, zanim zrozumiesz, co ci wolno, a czego nie!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Chcesz mnie okra��! Nie mog� w to uwierzy�!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Nie mo�esz tak po prostu pra� ka�dego, kto nawinie ci si� pod r�k�.
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Zabi�e� jednego z nas! To by� b��d! Powa�ny b��d!
	Dead						=	"SVM_3_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Po�a�ujesz tego!
	YesYes						=	"SVM_3_YesYes"						;//Dobra! Wygra�e�!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Cholera! W nogi!
	Help						=	"SVM_3_Help"						;//Musz� ju� i��!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Jeszcze si� spotkamy!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Nigdy wi�cej tego nie pr�buj!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Dzi�ki za bro�!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Po�ycz� sobie troch� twojej rudy!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Nie masz rudy? Ty biedny g�upcze!
	HandsOff					=	"SVM_3_HandsOff"					;//�apy precz!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Spadaj!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz�e�?!
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Nie jestem taki g�upi!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Przesta� si� tak skrada�!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Spadaj z mojej chaty, albo wezw� stra�!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Co ty wyprawiasz? Jak ci� dorw� b�dziesz martwy!
	WiseMove					=	"SVM_3_WiseMove"					;//A! Czyli jednak wiesz, co dla ciebie dobre!
	Alarm						=	"SVM_3_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALARM!!
	BehindYou					=	"SVM_3_BehindYou"					;//Uwaga!
	TheresAFight				=	"SVM_3_TheresAFight"				;//B�jka!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Przywal mu!
	CheerFight					=	"SVM_3_CheerFight"					;//Co ty robisz?!
	CheerFriend					=	"SVM_3_CheerFriend"					;//�adny cios!
	Ooh							=	"SVM_3_Ooh"							;//Ooooch!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Taaak! Dobra robota!
	RunCoward					=	"SVM_3_RunCoward"					;//Facet wzi�� nogi za pas!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//No i po facecie!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//Od d�u�szego czasu mu si� nale�a�o!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Go�� przesta� si� rusza�! Zabi�e� go!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Ci�gle tylko b�jki i b�jki...
	Awake						=	"SVM_3_Awake"						;//Kolejny dzie� i znowu to samo!
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hej, stary!
	ALGreetings					=	"SVM_3_ALGreetings"					;//Za Gomeza, tak, tak!
	MageGreetings				=	"SVM_3_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Jest tutaj.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_3_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_3_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Czego sobie �yczysz?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Co mog� dla ciebie zrobi�?
	MakeWay						=	"SVM_3_MakeWay"						;//Zejd� mi z drogi!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Z�a� mi z drogi, cz�owieku!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Ile razy mam ci powtarza�? Zejd� mi z drogi!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Znowu szukasz guza?!
	LookAway					=	"SVM_3_LookAway"					;//Ja NIC nie widzia�em! Nawet mnie tu nie by�o!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Dobra, zatrzymaj to sobie!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Co to by�o?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Masz m�j or�!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Oddawaj to!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Jak sobie �yczysz! Ja i tak tego nie potrzebuj�!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Zabili jeszcze jednego z naszych. Nikt z nas nie wyjdzie st�d �ywy!
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Dlaczego odrywasz mnie o moich sn�w?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Nale�a�o ci si� porz�dne lanie!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Pokona�e� Magnata! Szukasz k�opot�w, co?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Pokona�e� jednego z Guru. Nigdy ci tego nie zapomn�!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Zwyci�stwo nad magiem �ci�gnie na ciebie nie lada k�opoty!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Nast�pnym razem lepiej zostaw Nowicjuszy w spokoju.
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Rusz tylko kt�rego� z Kopaczy, a nie dadz� ci spokoju do ko�ca �ycia!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Pobi�e� mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Nowicjusze s� pod moj� ochron�! Zostaw ich w spokoju!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Kopacze p�ac� mi za bezpiecze�stwo, wi�c lepiej nie sprawiaj im k�opot�w!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Pr�bujesz mnie okra��, przekl�ty z�odzieju!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Masz pewne rzeczy, kt�re nale�� do nas. Lepiej od razu je oddaj...
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Cz�owieku! Okrad�e� Magnat�w?! Ale si� w�ciekn�.
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Okrad�e� Guru! Szkoda tylko, �e da�e� si� z�apa�.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Pr�buj�c okra�� maga musisz by� bardziej ostro�ny!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//To by�a uczciwa walka! Nie mam do ciebie �alu, �e mnie powali�e�!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ... zapewne masz racj� ...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Gr�nschn�beln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//�adnej magii!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Pos�uchaj mojej rady i daruj sobie te czary-mary!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Od�� bro�, chyba �e szukasz guza!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//No ju�, od�� bro�!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Uwa�aj, jak tym wymachujesz!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Jak si� nie uspokoisz, zabior� ci t� zabawk�!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hej, ty! Uwa�aj sobie!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Zapomnijmy o naszej sprzeczce.
	Strange						=	"SVM_4_Strange"						;//Wychod�! Poka� si�!
	DieMonster					=	"SVM_4_DieMonster"					;//Niewa�ne ilu zabijesz. Wci�� przychodz� nast�pni!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//To ju� koniec twojej drogi!
	NowWait						=	"SVM_4_NowWait"						;//Naucz� ci�, �e lepiej schodzi� mi z drogi...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Ci�gle nie masz do��?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Biedny g�upcze. Lepiej mi by�o nie przeszkadza�.
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Je�li my�lisz, �e pozwol� ci si� tu tak szwenda�, to jeste� w b��dzie!
	DirtyThief					=	"SVM_4_DirtyThief"					;//O�mieli�e� si� mnie okra��!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Wchodzenie nam w drog� nie wyjdzie ci na dobre.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Zabi�e� jednego z nas! Oko za oko!
	Dead						=	"SVM_4_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Jeszcze po�a�ujesz!
	YesYes						=	"SVM_4_YesYes"						;//Spokojnie, wygra�e�!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Wyno�my si� st�d i to szybko!
	Help						=	"SVM_4_Help"						;//Robi� si� na to za stary!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Nie zapomn� ci tego zbyt szybko!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Nigdy wi�cej tego nie pr�buj!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Chyba po�ycz� sobie twoj� bro�!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//My�l�, �e lepiej wykorzystam twoj� rud�!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Nie masz nawet marnej bry�ki rudy!
	HandsOff					=	"SVM_4_HandsOff"					;//�apy precz!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Spadaj st�d!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Nie masz tu czego szuka�!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Nie jestem w nastroju na takie wyg�upy!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hej, ty! Czemu si� tak skradasz?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Wyno� si� st�d, zanim wezw� stra�nik�w!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Czego tu szuka�e�?
	WiseMove					=	"SVM_4_WiseMove"					;//Masz szcz�cie...
	Alarm						=	"SVM_4_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//INTRUZ!
	BehindYou					=	"SVM_4_BehindYou"					;//Za tob�!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Nast�pna b�jka.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_4_CheerFight"					;//Tylko na to ci� sta�?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Przy�� mu!
	Ooh							=	"SVM_4_Ooh"							;//Oddaj mu!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Dobra robota!
	RunCoward					=	"SVM_4_RunCoward"					;//Ten tch�rz ucieka!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Za moich czas�w walczono jak nale�y!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Sam sobie na to zas�u�y�e�!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Zabi�e� go! To wielki b��d!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Dawniej walki by�y du�o lepsze.
	Awake						=	"SVM_4_Awake"						;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_4_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Znajdziesz go tutaj!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_4_HeyYou"						;//Hej tam!
	NotNow						=	"SVM_4_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Czego sobie �yczysz?
	MakeWay						=	"SVM_4_MakeWay"						;//Pozw�l mi przej��!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Zajd� mi z drogi, w tej chwili!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Z�a� mi z drogi, albo oberwiesz w ucho!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Nadal szukasz k�opot�w?
	LookAway					=	"SVM_4_LookAway"					;//Nic nie widzia�em, nic nie s�ysza�em...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Co to by�o?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//B�d� mi�ym ch�opcem i oddaj mi t� bro�!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//No ju�, daj mi to!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Albo nie! I tak chcia�em si� tego pozby�!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Ja dopadn� tego, kto za�atwi� jednego z naszych...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Zak��casz m�j odpoczynek!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Dosta�e� w �eb? Od pocz�tku nale�a�o ci si� porz�dne lanie!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Pokona�e� Magnata!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Pokona�e� jednego z Guru. Jestem pod wra�eniem. Ale ju� nigdy wi�cej tego nie pr�buj.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Pokona� maga... musisz by� dzielnym cz�owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Oszala�e�? Dlaczego bez powodu atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Co ci strzeli�o do g�owy, �eby atakowa� Kopacza?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Podpad�e� mojemu kumplowi. Teraz masz przechlapane!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Podnie� jeszcze raz r�k� na Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Jeste� taki odwa�ny czy taki g�upi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Trzymaj �apy z dala od moich rzeczy, zrozumiano?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Masz co�, co nale�y do nas. Teraz nam to oddasz!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Cz�owieku! Okrad�e� Magnat�w?! Ale si� w�ciekn�.
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Okrad�e� Guru! Szkoda tylko, �e da�e� si� z�apa�.
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Magowie nie lubi� jak kto� grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//W Nowym Obozie przedwcze�nie zwolni� si� jeden lokal, i wygl�da na to, �e to twoja wina...
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//Nie b�dzie �atwo to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Nie�le mnie spra�e�, stary! To by�a uczciwa walka, ale ju� si� sko�czy�a!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_4_Om"							;//Ommm
};


instance SVM_5 (C_SVM)				//Lebensk�nstler, offen, Fr�hlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewu�t, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//�adnego czarowania!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Dobrze ci radz�! �adnej magii!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Co chcesz zrobi� z t� broni�, cz�owieku?!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//No ju�, schowaj t� bro�!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Przesta� we mnie celowa�, ba�wanie!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Jak natychmiast nie przestaniesz, zrobi� z ciebie kotlety!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, �lepy jeste�, czy co?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Mo�e zapomnijmy o naszej ma�ej sprzeczce, dobra?
	Strange						=	"SVM_5_Strange"						;//Ale by� tutaj chwil� temu?! Dziwne!
	DieMonster					=	"SVM_5_DieMonster"					;//Twoja kolej, palancie!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Czas zap�aty!
	NowWait						=	"SVM_5_NowWait"						;//Prosisz si� o solidne lanie!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Nadal nie masz do��?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Dobra, sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//B�d� ci� wynosi� na noszach!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Ostrzega�em ci�! Jak b�dziesz grzeba� w moich rzeczach, dostaniesz po �apach!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Ty z�odzieju! Ja ci poka��!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Zadzieranie z moimi ch�opakami nie wyjdzie ci na dobre!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Zabi�e� jednego z moich ludzi. Teraz ja zabij� ciebie!
	Dead						=	"SVM_5_Dead"					;//Aaarg!
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Jeszcze po�a�ujesz!
	YesYes						=	"SVM_5_YesYes"						;//Spokojnie, wygra�e�!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//To jak dla mnie troch� za du�o!
	Help						=	"SVM_5_Help"						;//Cholera!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Nast�pnym razem b�dzie troch� inaczej!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Nigdy wi�cej tego nie pr�buj!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Podoba mi si� twoja bro�!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Ja si� lepiej zaopiekuj� twoj� rud�!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Co za pech! �adnej rudy!
	HandsOff					=	"SVM_5_HandsOff"					;//�apy precz!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Wyno� si� st�d!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hej! Sk�d si� tu wzi��e�?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Dobry �art!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Czemu si� tak skradasz?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Wyno� si� st�d, zanim wezw� stra�nik�w!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Nie masz tu czego szuka�!
	WiseMove					=	"SVM_5_WiseMove"					;//Szybko si� uczysz!
	Alarm						=	"SVM_5_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALARM!
	BehindYou					=	"SVM_5_BehindYou"					;//Hej, uwa�aj!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Rozr�ba!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Dalej!
	CheerFight					=	"SVM_5_CheerFight"					;//�wietnie!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Przy�� mu wreszcie!
	Ooh							=	"SVM_5_Ooh"							;//Tylko uwa�aj!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Najwy�szy czas!
	RunCoward					=	"SVM_5_RunCoward"					;//Oho! Bierze nogi za pas!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Zwyci�zca, bez dw�ch zda�!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Zas�u�y� na to!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Tak po prostu zabi� cz�owieka... B�dziesz mia� teraz niez�e k�opoty!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Co za walka!
	Awake						=	"SVM_5_Awake"						;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Witaj, przyjacielu!
	ALGreetings					=	"SVM_5_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Tutaj.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_5_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_5_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Czym mog� s�u�y�?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Czego chcesz?
	MakeWay						=	"SVM_5_MakeWay"						;//Przepu�� mnie.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//No rusz si�, chc� przej��.
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//G�uchy jeste�, czy szukasz k�opot�w?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Nadal szukasz k�opot�w?
	LookAway					=	"SVM_5_LookAway"					;//Ja NIC nie widzia�em! Nawet nie wiem, co si� sta�o!
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Dobra, zatrzymaj to sobie!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Co to by�o?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Wola�bym dosta� z powrotem moj� bro�.
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Daj mi to!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//C�, nie ma tego z�ego... Mam tego wi�cej!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak si� dowiem, kto to zrobi�...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Hej, co si� dzieje? Czemu mnie budzisz?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//H�? Dosta�e� baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Pokona�e� Magnata. Facet by� pod wra�eniem.
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Pokona�e� jednego z Guru. Jestem pod wra�eniem. Ale ju� nigdy wi�cej tego nie pr�buj.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Pokona� maga... musisz by� dzielnym cz�owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Oszala�e�? Dlaczego bez powodu atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Co ci strzeli�o do g�owy, �eby atakowa� Kopacza?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Powali�e� mojego kumpla, a ja chc� wiedzie�, dlaczego?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Podnie� jeszcze raz r�k� na Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Jeste� taki odwa�ny czy taki g�upi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//�miesz si� tu jeszcze pokazywa�, parszywy z�odzieju?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Masz kilka rzeczy, kt�re nale�� do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Cz�owieku! Okrad�e� Magnat�w?! Ale si� w�ciekn�.
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Okrad�e� Guru! Szkoda tylko, �e da�e� si� z�apa�.
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Magowie nie lubi� jak kto� grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i b�dziesz gryz� ziemi�!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Spu�ci�e� mi niez�e baty, stary. To by�a dobra walka, ale ju� si� sko�czy�a!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Gr�lt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//�adnej magii!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Przesta� czarowa�! Natychmiast!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Od�� t� cholern� bro�!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Chcesz oberwa�? Schowaj t� bro�!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Schowaj bro�, albo si� wkurz�!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Jak nie przestaniesz we mnie celowa�, to oberwiesz!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hej! Uwa�aj!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hej, stary! Zapomnijmy o tej sprzeczce, dobra?
	Strange						=	"SVM_6_Strange"						;//Wy�a�! Poka� si�!
	DieMonster					=	"SVM_6_DieMonster"					;//Zrobi� z ciebie kotlety, ty wieprzu!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Ju� po tobie!
	NowWait						=	"SVM_6_NowWait"						;//Teraz dostaniesz baty...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Widz�, �e chcesz koniecznie dosta� w �eb!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Teraz ci� posiekam!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Ostrzega�em ci�! Jak b�dziesz grzeba� w moich rzeczach, dostaniesz po �apach!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Ty z�odzieju! Ja ci poka��!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Nikt nie b�dzie podskakiwa� moim ch�opcom!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Zabi�e� jednego z moich ludzi. Teraz ja zabij� ciebie!
	Dead						=	"SVM_6_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Jeszcze po�a�ujesz!
	YesYes						=	"SVM_6_YesYes"						;//Spokojnie! Bez nerw�w! Wygra�e�!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Cholera, co za potw�r! Lepiej wzi�� nogi za pas!
	Help						=	"SVM_6_Help"						;//Szlag by to!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Jeszcze mnie popami�tasz!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Spr�buj tego jeszcze raz, a po�a�ujesz!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Podoba mi si� twoja bro�!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Dzi�ki za rud�! Wypij� za twoje zdrowie!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Szlag by ci�! Nie masz ani krztyny rudy!
	HandsOff					=	"SVM_6_HandsOff"					;//�apy precz!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Wyno� si� st�d!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz�e�?!
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Co jest? My�lisz, �e jestem taki g�upi?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hej! Czemu si� tak skradasz?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Wyno� si� st�d zanim zawo�am stra�!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Czego tu szuka�e�?
	WiseMove					=	"SVM_6_WiseMove"					;//Masz szcz�cie...
	Alarm						=	"SVM_6_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_6_BehindYou"					;//Za tob�!
	TheresAFight				=	"SVM_6_TheresAFight"				;//O! Walka!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_6_CheerFight"					;//Walczycie jak baby!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Wyko�cz go!
	Ooh							=	"SVM_6_Ooh"							;//Przesta� si� mazgai�! Oddaj mu!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//No ju�! Facet jeszcze dycha!
	RunCoward					=	"SVM_6_RunCoward"					;//Wracaj, tch�rzu!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Ma ju� do��.
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Nale�a�o si� mu!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Jeste� ju� martwy! To ci� oduczy zabijania niewinnych ludzi!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! No! Ale mu pokaza�e�!
	Awake						=	"SVM_6_Awake"						;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_6_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Jest tam.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_6_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_6_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//W czym mog� pom�c?
	MakeWay						=	"SVM_6_MakeWay"						;//Przepu�� mnie.
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//No ju�, zejd� mi z drogi!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Spadaj! Mam ci to r�cznie wbi� do tej zakutej pa�y?!
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Szukasz k�opot�w?!
	LookAway					=	"SVM_6_LookAway"					;//Nic nie widzia�em! S�owo honoru!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Co to by�o?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Oddaj mi swoj� bro�, �artownisiu!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Daj mi to, stary!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Niewa�ne! I tak tego nie potrzebowa�em!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak si� dowiem, kto to zrobi�...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Do diab�a! Czemu mnie obudzi�e�?!
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Dosta�e� t�gie baty? Nale�a�o ci si�!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Pobi�e� Magnata. Jest na ciebie w�ciek�y.
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Pokona�e� Guru! Chyba przyci�gasz k�opoty jak jaki� magnes!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Pokona� maga... chyba jeste� niespe�na rozumu!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Nie mo�esz tak po prostu atakowa� Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Zostaw moich ludzi w spokoju!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Napad�e� na mojego przyjaciela...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Nie tolerujemy tu wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Spojrzyj krzywo na kt�rego� z moich protegowanych, a b�d� k�opoty!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Sukinsynu! Pr�bujesz mnie okra��! Nigdy wi�cej tego nie r�b!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Chcemy z powrotem nasze rzeczy! Oddawaj je!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Okrad�e� Magnat�w! Co ci strzeli�o do g�owy?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Okrad�e� Guru? Szkoda tylko, �e da�e� si� z�apa�!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Okrad�e� maga! To nienajlepszy pomys�!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Jeden z naszych ludzi nie �yje, a ty macza�e� w tym palce. Nast�pny podejrzany ruch i b�dziesz martwy!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Nie�le mnie spra�e�, stary! To by�a uczciwa walka, ale ju� si� sko�czy�a!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Tylko nie to! Tylko nie to!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//�adnej magii! �adnej magii!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Schowaj bro�! No, schowaj!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//M�wi� serio! Schowaj to!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//We mnie celujesz?! Uwa�aj sobie!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//My�lisz, �e dam si� zastraszy�? To si� grubo mylisz!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Zapami�tam to sobie! Uwa�aj tylko!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Zapomnijmy o ca�ej sprawie, dobra?
	Strange						=	"SVM_7_Strange"						;//Gdzie on si� podzia�? No nie! To niemo�liwe!
	DieMonster					=	"SVM_7_DieMonster"					;//Zat�uk� ci�, ty gnido!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Rozedr� ci� na strz�py! Nie b�d� mia� lito�ci!
	NowWait						=	"SVM_7_NowWait"						;//Nareszcie! Teraz mam pretekst!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Chyba nie chcesz jeszcze raz spr�bowa�, co?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Krwi! Chc� twojej krwi!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Por�bi� ci� na dzwona!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Powinienem odr�ba� ci palce!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty parszywy z�odzieju! Zap�acisz mi za to!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Ja tu jestem od bicia innych! Zrozumiano!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Zabi�e� jednego z naszych!
	Dead						=	"SVM_7_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Nie po�yjesz do�� d�ugo, �eby zd��y� tego po�a�owa�.
	YesYes						=	"SVM_7_YesYes"						;//Dobra, dobra!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Nie mam teraz odpowiedniego or�a... Ale jeszcze si� spotkamy!
	Help						=	"SVM_7_Help"						;//Cholera!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Jeszcze si� spotkamy!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Nigdy wi�cej tego nie pr�buj!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Zatrzymam sobie t� bro�!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Wola�bym ci� zabi�, ale ruda te� mi si� przyda!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Nie masz rudy? Ty bezu�yteczny �mieciu!
	HandsOff					=	"SVM_7_HandsOff"					;//Trzymaj �apy przy sobie!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Spadaj! No ju�! Won!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Jak tu wlaz�e�?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Ty naprawd� pr�bujesz mnie zrobi� w konia!
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hej, ty! Co si� tak skradasz?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Spadaj st�d, albo wezw� stra�e!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Nie masz tu czego szuka�!
	WiseMove					=	"SVM_7_WiseMove"					;//Masz szcz�cie! Ju� mia�em wyklepa� ci bu�k�!
	Alarm						=	"SVM_7_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALARM!
	BehindYou					=	"SVM_7_BehindYou"					;//Za tob�!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Rozr�ba!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_7_CheerFight"					;//Chc� zobaczy� krew!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Za�atw go!
	Ooh							=	"SVM_7_Ooh"							;//Oddaj mu, idioto!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Dobra!
	RunCoward					=	"SVM_7_RunCoward"					;//Biegnij! Wracaj do mamusi!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Facet ma ju� do��!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Sam jeste� sobie winien!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Zab�jstwo przy �wiadkach to SAMOb�jstwo. Zapami�taj moje s�owa.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Niez�a walka!
	Awake						=	"SVM_7_Awake"						;//Pora wstawa�!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_7_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_7_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//O�lep�e�?! Tutaj!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_7_HeyYou"						;//Hej, ty
	NotNow						=	"SVM_7_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Czego ode mnie chcesz?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Co mog� dla ciebie zrobi�?
	MakeWay						=	"SVM_7_MakeWay"						;//Przepu�� mnie.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Zejd� mi z drogi!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Szukasz k�opot�w? Wyno� si� st�d!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Ci�gle szukasz guza?
	LookAway					=	"SVM_7_LookAway"					;//Ja NIC nie widzia�em!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Co to by�o?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Oddaj mi bro�!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Daj mi to!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Dobra, zatrzymaj to sobie! Jako� prze�yj�!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Poleg� jeden z naszych! Musimy go pom�ci�.
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Dlaczego mnie obudzi�e�?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Nale�a�o ci si� porz�dne lanie!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Pobi�e� Magnata. Jest na ciebie w�ciek�y.
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Pokona�e� Guru! Przyci�gasz k�opoty jak jaki� magnes!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Pokona�e� maga! To nie by� najlepszy spos�b!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//A wi�c to ty nie dajesz spokoju Nowicjuszom!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Zostaw moich przyjaci� w spokoju!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Zadar�e� z niew�a�ciwym cz�owiekiem! Tutaj lepiej nie robi� sobie wrog�w.
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Nie tolerujemy tu wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Je�li wejdziesz w drog� kt�remu� z moich podopiecznych, po�a�ujesz!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Ty biedny dupku! Jak �miesz mnie okrada�! Nigdy wi�cej tego nie pr�buj.
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Oddawaj nam nasze rzeczy!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Okrad�e� Magnat�w! Co ci strzeli�o do g�owy?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Okrad�e� Guru? Szkoda tylko, �e da�e� si� z�apa�!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Okrad�e� maga! To nienajlepszy pomys�!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Jeden z naszych ludzi nie �yje, a ty macza�e� w tym palce. Nast�pny podejrzany ruch i b�dziesz martwy!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Spu�ci�e� mi niez�e baty, stary. To by�a dobra walka, ale ju� si� sko�czy�a!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, n�chtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Nie pr�buj ze mn� tych magicznych sztuczek!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Przesta�! Natychmiast!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Schowaj bro�!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Schowaj bro�, albo si� zdenerwuj�!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Schowaj bro�, idioto!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//�miesz we mnie celowa�, psie?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Uwa�aj!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Dobra, zapomnijmy o naszej ma�ej sprzeczce.
	Strange						=	"SVM_8_Strange"						;//Wy�a�! Wiem, �e mnie s�yszysz!
	DieMonster					=	"SVM_8_DieMonster"					;//Przekl�te stwory!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Teraz zginiesz. To nic osobistego. Sam rozumiesz...
	NowWait						=	"SVM_8_NowWait"						;//Ty �mieciu! Masz czelno�� atakowa� MNIE! Zaczekaj no...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Czy ja ci ju� kiedy� nie przy�o�y�em? No c�, b�dzie powt�rka...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Kto nie chce s�ucha�, musi poczu�!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//�miesz si� tu pokazywa�? Czekaj ty...
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Chyba kto� musi ci wreszcie da� po �apach.
	DirtyThief					=	"SVM_8_DirtyThief"					;//Lepiej by by�o dla ciebie, gdyby� tego nie ukrad�!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Nikt nie b�dzie podskakiwa� moim ch�opcom!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Zabi�e� jednego z naszych! To by� tw�j ostatni b��d!
	Dead						=	"SVM_8_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Jeszcze tego po�a�ujesz!
	YesYes						=	"SVM_8_YesYes"						;//Spokojnie! Wszystko jest w porz�dku!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Wola�bym ogl�da� t� besti� z dystansu!
	Help						=	"SVM_8_Help"						;//Szybko! Wiejmy st�d!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Jeszcze si� spotkamy!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Spr�buj tego jeszcze raz, a po�a�ujesz!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Podoba mi si� twoja bro�!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Za�o�� si�, �e nie zap�aci�e� mi jeszcze podatku od bezpiecze�stwa!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//No jasne: sk�d taki frajer jak ty mia�by wzi�� rud�!
	HandsOff					=	"SVM_8_HandsOff"					;//�apy precz!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Precz st�d!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Jak si� tu dosta�e�?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Ma�y spryciarz z ciebie, co?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hej, ty! Czemu si� tak skradasz?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Zmykaj st�d, albo wezw� stra�e!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Czego tu szuka�e�?
	WiseMove					=	"SVM_8_WiseMove"					;//Masz szcz�cie!
	Alarm						=	"SVM_8_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_8_BehindYou"					;//Za tob�!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Zobaczmy no, kto si� wzi�� za �by!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_8_CheerFight"					;//Tak! Dalej, dalej!
	CheerFriend					=	"SVM_8_CheerFriend"					;//�wietnie! Nie popuszczaj mu!
	Ooh							=	"SVM_8_Ooh"							;//Nie daj si�! Przy�� mu!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Dobrze, do�� mu! Jeszcze si� rusza!
	RunCoward					=	"SVM_8_RunCoward"					;//Nigdy wi�cej si� tu nie pokazuj!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Nuda!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Nale�a�o mu si�!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//To by�o niepotrzebne. Teraz b�dziesz musia� ponie�� konsekwencje.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//To by�a dobra walka.
	Awake						=	"SVM_8_Awake"						;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_8_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Jest tutaj.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_8_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_8_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Co mog� dla ciebie zrobi�?
	MakeWay						=	"SVM_8_MakeWay"						;//Mog� przej��?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Zejd� mi z drogi!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Mam ci to wbi� do tej zakutej pa�y? Rusz si�!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Znowu szukasz k�opot�w?
	LookAway					=	"SVM_8_LookAway"					;//Ahem... Pi�kny widok!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Dobrze! We� to sobie!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Hej! Co to by�o?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Masz moj� bro�.
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Oddawaj! Natychmiast!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebuj�!
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak si� dowiem, kto to zrobi�...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Co si� dzieje?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//H�? Dosta�e� baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Pokona�e� Magnata. Facet by� pod wra�eniem.
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Pokona�e� jednego z Guru. Jestem pod wra�eniem. Ale ju� nigdy wi�cej tego nie pr�buj.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Pokona� maga... musisz by� dzielnym cz�owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Wiesz, �e wszyscy Nowicjusze s� pod moj� opiek�, a mimo to �miesz ich zaczepia�?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Atakuj�c Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Lepiej nie wchodzi� w drog� moim przyjacio�om!
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Spr�buj jeszcze raz zaczepi� Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Je�li jeszcze raz zaczepisz kt�rego� z moich protegowanych, skr�c� ci� o g�ow�.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Jak �miesz si� tu pokazywa�, parszywy z�odzieju?!
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Masz kilka rzeczy, kt�re nale�� do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Cz�owieku! Okrad�e� Magnat�w?! Ale si� w�ciekn�.
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Po�yczy�e� sobie kilka rzeczy Guru, prawda?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Po�yczy�e� sobie kilka rzeczy nale��cych do mag�w, prawda?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i b�dziesz gryz� ziemi�!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Spu�ci�e� mi niez�e baty, stary. To by�a dobra walka, ale ju� si� sko�czy�a!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gem�tlicher H�ne, Besonnen, Brummiger B�r, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Nie chcemy tutaj �adnej magii!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Natychmiast przesta�!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Chcesz mnie zaatakowa�?!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Schowasz to sam, czy mam ci pom�c?!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Uwa�aj gdzie celujesz!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Schowaj to!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hej! Uwa�aj!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Mo�e zapomnimy o naszej ma�ej sprzeczce...
	Strange						=	"SVM_9_Strange"						;//Poka� si�! Wiem, �e mnie s�yszysz.
	DieMonster					=	"SVM_9_DieMonster"					;//Te bestie mno�� si� jak kr�liki!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Ju� po tobie!
	NowWait						=	"SVM_9_NowWait"						;//Poka�� ci, gdzie raki zimuj�!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Jeste� strasznie nachalny!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Kto nie chce s�ucha�, musi poczu�!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Przebra�a si� miarka, przyb��do.
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Ostrzega�em ci�! Jak b�dziesz grzeba� w moich rzeczach, dostaniesz po �apach!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Ty z�odzieju! Ja ci poka��!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Nikt nie b�dzie podskakiwa� moim ch�opcom!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Zabi�e� jednego z moich ludzi. Teraz ja zabij� ciebie!
	Dead						=	"SVM_9_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Ju� nie �yjesz! Tylko jeszcze o tym nie wiesz!
	YesYes						=	"SVM_9_YesYes"						;//Spokojnie! Nic si� nie sta�o.
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Cholera, co za potw�r.
	Help						=	"SVM_9_Help"						;//Szybko! Uciekajmy!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Jeszcze si� zobaczymy!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Nast�pnym razem wyl�dujesz w piachu!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Ta bro� nale�y teraz do mnie.
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Ruda! C�, lepszy rydz ni� nic.
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Nawet nie ma przy sobie rudy!
	HandsOff					=	"SVM_9_HandsOff"					;//�apy precz, kolego!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Wyno� si� st�d.
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Czego tu szukasz?!
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Pr�bujesz zrobi� ze mnie idiot�?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hej, ty! Czemu si� tak skradasz?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Wyno� si� st�d, zanim wezw� stra�nik�w!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Czego tu szuka�e�?
	WiseMove					=	"SVM_9_WiseMove"					;//M�drala!
	Alarm						=	"SVM_9_Alarm"						;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_9_BehindYou"					;//Za tob�!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Zobaczmy, co potrafi�...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Tak trzyma�!
	CheerFight					=	"SVM_9_CheerFight"					;//Tak! Dalej, dalej!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Dobrze!
	Ooh							=	"SVM_9_Ooh"							;//Och! To musia�o bole�!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//�wietna robota, ch�opcze!
	RunCoward					=	"SVM_9_RunCoward"					;//Nigdy wi�cej si� tu nie pokazuj!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//No i po walce!
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Sam jeste� sobie winien!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//To by�o niepotrzebne. Teraz b�dziesz musia� ponie�� konsekwencje.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//To by�a dobra walka.
	Awake						=	"SVM_9_Awake"						;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_9_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Za pot�g� magii!
	SectGreetings				=	"SVM_9_SectGreetings"				;//Zbud� si�!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//O�lep�e�? Tutaj!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_9_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_9_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//W czym mog� pom�c?
	MakeWay						=	"SVM_9_MakeWay"						;//Przepu�� mnie.
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Odsu� si�.
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//No ju�, z drogi!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Znowu szukasz k�opot�w? Ci�gle mi podpadasz.
	LookAway					=	"SVM_9_LookAway"					;//Taaa... �adna dzi� pogoda.
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Dobra! Zatrzymaj to sobie.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Co to by�o?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Policz� do trzech, a ty oddasz mi bro�.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Oddawaj! Natychmiast!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebuj�!
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak si� dowiem, kto to zrobi�...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Co si� dzieje?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//H�? Dosta�e� baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Powali�e� Magnata! Facet by� pod wra�eniem!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Pokona�e� jednego z Guru. Jestem pod wra�eniem. Ale ju� nigdy wi�cej tego nie pr�buj.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Pokona� maga... musisz by� dzielnym cz�owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Co ci odbi�o, �eby tak atakowa� Nowicjusza?
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Co ci strzeli�o do g�owy, �eby atakowa� Kopacza?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Pobi�e� mojego kumpla. Co to ma znaczy�?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Spr�buj jeszcze raz zaczepi� Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Jeste� taki odwa�ny czy taki g�upi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//�miesz si� tu pokazywa�? Czekaj ty...
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Nie ma nic gorszego od okradania naszych ludzi. Jeszcze tego po�a�ujesz!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Stary! Okrad�e� Magnat�w? Ale si� w�ciekn�!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Po�yczy�e� sobie kilka rzeczy Guru, prawda?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Po�yczy�e� sobie kilka rzeczy nale��cych do mag�w, prawda?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i b�dziesz gryz� ziemi�!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Dobra walka! Tw�j trening si� op�aci�!
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ... c�, je�li tak uwa�asz ...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ... to si� chyba nigdy nie sko�czy ...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ... tak, pewnie masz racj� ...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_9_Om"							;// Ommm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//�adnej magii!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Natychmiast przesta�!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Schowaj bro�!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Co ty wyprawiasz? Szukasz guza?!
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Schowasz to sam, czy mam ci pom�c?!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Jak nie przestaniesz we mnie celowa�, to oberwiesz!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hej! Uwa�aj! Chcesz dosta� w ucho?!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Hej, stary! Zapomnijmy o tej sprzeczce, dobra?
	Strange						=	"SVM_10_Strange"						;//Wy�a�! Poka� si�!
	DieMonster					=	"SVM_10_DieMonster"						;//Skurczybyki!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Ju� po tobie!
	NowWait						=	"SVM_10_NowWait"						;//Czas zap�aty!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Chyba bardzo chcesz dosta� w dzi�b, co?
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Por�bi� ci� na dzwona!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Ostrzega�em ci�! Jak b�dziesz grzeba� w moich rzeczach, dostaniesz po �apach!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Ty z�odzieju! Zat�uk� ci�!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Nikt nie b�dzie podskakiwa� moim kumplom!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Zabi�e� jednego z moich ludzi. Teraz ja zabij� ciebie!
	Dead						=	"SVM_10_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Jeszcze dostaniesz za swoje, b�karcie!
	YesYes						=	"SVM_10_YesYes"							;//Dobra, dobra! Wygra�e�!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Co za potw�r! W nogi!
	Help						=	"SVM_10_Help"							;//Odwr�t!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Jeszcze ci poka��!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Spr�buj tego jeszcze raz, a po�a�ujesz!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Zabieram twoj� bro�!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Po�ycz� sobie troch� twojej rudy!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Cholera, nawet nie masz rudy!
	HandsOff					=	"SVM_10_HandsOff"						;//�apy przy sobie, szkodniku!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Wyno� si� st�d!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hej! Sk�d si� tu wzi��e�?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//My�lisz, �e jestem taki g�upi?!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hej, ty! Dlaczego tak si� skradasz?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Wyno� si� st�d, albo zawo�am stra�!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Czego tu szuka�e�?
	WiseMove					=	"SVM_10_WiseMove"						;//Twoje szcz�cie.
	Alarm						=	"SVM_10_Alarm"							;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ALARM! INTRUZ!
	BehindYou					=	"SVM_10_BehindYou"						;//Za tob�!
	TheresAFight				=	"SVM_10_TheresAFight"					;//O! B�jka!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Mocniej!
	CheerFight					=	"SVM_10_CheerFight"						;//Nie oszcz�dzaj go!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Wyko�cz go!
	Ooh							=	"SVM_10_Ooh"							;//Nie daj sobie w kasz� dmucha�!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Przy�� mu raz a dobrze!
	RunCoward					=	"SVM_10_RunCoward"						;//Wracaj, tch�rzu!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Wystarczy�o dmuchn��, i go�� sam by si� przewr�ci�.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Nale�a�o mu si�!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Ju� nie �yjesz! To ci� oduczy zabijania niewinnych ludzi!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Da�e� mu nauczk�, nie ma co!
	Awake						=	"SVM_10_Awake"							;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Za pot�g� magii!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Zbud� si�!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Jest tam!
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_10_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_10_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Jak mog� ci pom�c?
	MakeWay						=	"SVM_10_MakeWay"						;//Przepu�� mnie.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Zejd� mi z drogi!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Mam ci to wbi� do tej zakutej pa�y? Rusz si�!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Znowu szukasz k�opot�w?
	LookAway					=	"SVM_10_LookAway"						;//Mnie tu nie ma...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Co to by�o?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Oddaj mi moj� bro�!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//We� to sobie. I tak tego nie potrzebuj�!
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Za�atwili jednego z naszych. Jak dorw� tego, co to zrobi�...
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Dlaczego mnie obudzi�e�?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//H�? Dosta�e� baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Powali�e� jednego z Magnat�w!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Pokona�e� jednego z Guru 
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Pokona�e� maga...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Zanim podniesiesz r�k� na Nowicjusza, zastan�w si� nad konsekwencjami!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Ja tu dbam o porz�dek! Zostaw moich ludzi w spokoju!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Powali�e� mojego przyjaciela!
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Spr�buj jeszcze raz zaczepi� Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Zaczepianie moich protegowanych oznacza k�opoty!
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Nigdy wi�cej tego nie pr�buj, z�odzieju!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Masz kilka rzeczy, kt�re nale�� do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Stary! Okrad�e� Magnat�w? Ale si� w�ciekn�!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Podobno po�yczy�e� sobie kilka rzeczy nale��cych do Guru. Szkoda tylko, �e da�e� si� z�apa�!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Po�yczy�e� sobie kilka rzeczy nale��cych do mag�w, prawda?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i b�dziesz gryz� ziemi�!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Gratuluj�! Wygra�e�! To by�a pi�kna walka.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ... to si� chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vern�nftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Ani si� wa� u�ywa� czar�w!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Natychmiast przesta�!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Je�li szukasz k�opot�w, to trafi�e� na w�a�ciwego cz�owieka!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Od�� to, albo dostaniesz!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Schowaj to!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Jeste� pewien, �e chcesz mnie rozz�o�ci�?!
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Co ty wyprawiasz? Przesta�!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Mo�e zapomnimy o naszej ma�ej sprzeczce?
	Strange						=	"SVM_11_Strange"						;//Uch! Szlag by to! Gdzie on si� podzia�?!
	DieMonster					=	"SVM_11_DieMonster"						;//Jak nie przestan� wchodzi� mi w drog�, grozi im rych�a zag�ada!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Nie r�b sobie wrog�w, je�li nie jeste� w stanie stawi� im czo�a. Gi�!
	NowWait						=	"SVM_11_NowWait"						;//By�oby dla ciebie lepiej, gdyby� tego nie zrobi�!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Czy ja ci ju� kiedy� nie przy�o�y�em? No c�, b�dzie powt�rka...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Kto nie chce s�ucha�, musi poczu�!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//No, przyb��do! Teraz dostaniesz nauczk�!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Chyba b�d� ci musia� da� po �apach!
	DirtyThief					=	"SVM_11_DirtyThief"						;//Kradzie� nie pop�aca!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Wkroczy�e� na m�j teren. Teraz musz� ci� zabi�.
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Zabicie jednego z naszych to by� powa�ny b��d.
	Dead						=	"SVM_11_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//By�oby dla ciebie lepiej, gdyby� tego nie zrobi�!
	YesYes						=	"SVM_11_YesYes"							;//Dobra, dobra! Wygra�e�!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//To ju� za wiele!
	Help						=	"SVM_11_Help"							;//Odwr�t!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Jeszcze si� zobaczymy, kole�!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Nigdy wi�cej tego nie pr�buj!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Twoja bro� bardziej przyda si� komu�, kto wie jak si� z ni� obchodzi�!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//To mi�o z twojej strony, �e dzielisz si� ze mn� swoj� rud�!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Nic! Ani krzty rudy!
	HandsOff					=	"SVM_11_HandsOff"						;//Zabieraj swoje lepkie �apy!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Wyno� si� st�d, albo ci pomog�!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hej, jak tu wlaz�e�?!
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Nie ze mn� te numery!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Co to ma by�?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Ta chata nale�y do mnie! Wyno� si�, albo zawo�am stra�e!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Czego tu szuka�e�? Spadaj, zanim zrobi� ci krzywd�!
	WiseMove					=	"SVM_11_WiseMove"						;//No! I �eby mi to by� ostatni raz!
	Alarm						=	"SVM_11_Alarm"							;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ALARM! INTRUZ!
	BehindYou					=	"SVM_11_BehindYou"						;//Za tob�!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Zobaczmy, co potrafi�...
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//No ju�, �mia�o!
	CheerFight					=	"SVM_11_CheerFight"						;//Przesta� si� z nim bawi�!
	CheerFriend					=	"SVM_11_CheerFriend"					;//No dalej! To wszystko, na co ci� sta�?!
	Ooh							=	"SVM_11_Ooh"							;//Ups! Nie dobrze!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Mmmh! Nie�le!
	RunCoward					=	"SVM_11_RunCoward"						;//Nigdy wi�cej si� tu nie pokazuj!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Pi�kny cios!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Niewa�ne! Zas�u�y� na to!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Zabi�e� go! Masz przechlapane!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//�wietnie! Niez�e przedstawienie!
	Awake						=	"SVM_11_Awake"							;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_11_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Za pot�g� magii!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Zbud� si�!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//O�lep�e�? Tutaj!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_11_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_11_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Co mog� dla ciebie zrobi�?
	MakeWay						=	"SVM_11_MakeWay"						;//Mo�esz mnie przepu�ci�?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Odsu� si�!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Mam ci to wbi� do tej zakutej pa�y? Rusz si�!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Znowu szukasz k�opot�w?
	LookAway					=	"SVM_11_LookAway"						;//Nie b�d� si� do tego miesza�!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Dobrze! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_11_WhatsThat"						;//Co to by�o?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Masz moj� bro�!
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//No ju�, oddawaj!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Zatrzymaj to sobie!
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Dopadli jednego z naszych. Jak si� dowiem, kto to zrobi�...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Co si� dzieje?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Dosta�e� lanie? Nale�a�o ci si�!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Pokona�e� jednego z Magnat�w. Musisz by� bardzo dzielny, albo bardzo... BARDZO g�upi.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Pokona�e� jednego z Guru. 
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Pokona�e� maga... To chyba nienajlepszy pomys�.
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Dbam tu o zdrowie kilku os�b, a ty jedn� z nich pobi�e�...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Zaczepiaj�c Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Kto w�azi w drog� moim kumplom, w�azi w drog� mnie!
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Zaczep jeszcze raz Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Jak �miesz si� tu jeszcze pokazywa�, z�odzieju?!
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Masz kilka rzeczy, kt�re nale�� do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Stary! Okrad�e� Magnat�w? Ale si� w�ciekn�!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Po�yczy�e� sobie kilka rzeczy nale��cych do Guru, tak?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Po�yczy�e� sobie kilka rzeczy nale��cych do mag�w, prawda?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Z�ama�e� regu�� nr 1: �adnego zabijania!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//To by�a pi�kna walka. Ko�ci mnie jeszcze bol�. Ale teraz jest ju� po wszystkim!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ... to si� chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_11_Om"								;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-H�ndler		Nach au�en freundlich,jovial,Innen hinterh�ltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//�adnej magii!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Ostrzegam ci�! �adnych czar�w!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Co zamierzasz zrobi� z t� broni�?!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Schowaj to!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Celujesz we mnie!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Je�li natychmiast nie przestaniesz, b�dziesz mia� k�opoty!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hej, �lepy jeste�, czy co?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Zapomnijmy o naszej ma�ej sprzeczce, dobra?
	Strange						=	"SVM_12_Strange"						;//Ale by� tutaj dos�ownie chwil� temu! Dziwne.
	DieMonster					=	"SVM_12_DieMonster"						;//Pora wyr�wna� rachunki!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Czas zap�aty!
	NowWait						=	"SVM_12_NowWait"						;//Prosisz si� o porz�dne lanie!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Dalej nie masz do��?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Dobra, sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Wynios� ci� st�d na noszach!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Ostrzega�em ci�! Jak b�dziesz grzeba� w moich rzeczach, dostaniesz po �apach!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Ty przekl�ty z�odzieju! Ja ci poka��...
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Nikt nie b�dzie podskakiwa� moim kolegom.
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Zabi�e� jednego z moich ludzi. Teraz ja zabij� ciebie!
	Dead						=	"SVM_12_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Jeszcze tego po�a�ujesz!
	YesYes						=	"SVM_12_YesYes"							;//Spokojnie! Wygra�e�!
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//To ju� za wiele! Spadam st�d!
	Help						=	"SVM_12_Help"							;//Cholera!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Nast�pnym razem b�dzie troch� inaczej!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Nigdy wi�cej tego nie pr�buj!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Podoba mi si� ta bro�!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Twoja ruda bardzo mi si� przyda!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Szlag! �adnej rudy!
	HandsOff					=	"SVM_12_HandsOff"						;//�apy precz!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Wyno� si� st�d!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hej! Sk�d si� tu wzi��e�?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Czy ja ci wygl�dam na idiot�?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Dlaczego tak si� skradasz?!
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Wyno� si� st�d, albo wezw� stra�!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Nie masz tu czego szuka�!
	WiseMove					=	"SVM_12_WiseMove"						;//Szybko si� uczysz!
	Alarm						=	"SVM_12_Alarm"							;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALARM!!!
	BehindYou					=	"SVM_12_BehindYou"						;//Uwa�aj!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Walka!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Przy�� mu!
	CheerFight					=	"SVM_12_CheerFight"						;//Dobrze!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Powal go wreszcie!
	Ooh							=	"SVM_12_Ooh"							;//Uwa�aj, cz�owieku!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Najwy�szy czas!
	RunCoward					=	"SVM_12_RunCoward"						;//Facet ucieka!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Mamy zwyci�zc�!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Zas�u�y� na to!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Nie mo�esz tak po prostu zabija� ludzi. Teraz b�dziesz mia� nie lada k�opoty.
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Co za walka!
	Awake						=	"SVM_12_Awake"							;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Witaj, przyjacielu!
	ALGreetings					=	"SVM_12_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Za pot�g� magii!
	SectGreetings				=	"SVM_12_SectGreetings"					;//Zbud� si�!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Tutaj!
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_12_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_12_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//W czym mog� pom�c?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Czego chcesz?
	MakeWay						=	"SVM_12_MakeWay"						;//Przepu�� mnie.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//No ju�, zejd� mi z drogi!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Og�uch�e�, czy szukasz guza?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Ci�gle szukasz k�opot�w?
	LookAway					=	"SVM_12_LookAway"						;//Czy co� si� sta�o? Bo ja NIC nie widzia�em...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Dobra! Zatrzymaj to sobie.
	WhatsThat					=	"SVM_12_WhatsThat"						;//Co to by�o?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Chc� dosta� moj� bro�!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//No c�, trudno! Mam tego wi�cej.
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Dopadli jednego z naszych. Jak si� dowiem, kto to zrobi�...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hmmm? O co chodzi? Dlaczego mnie budzisz?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//H�? Dosta�e� baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Powali�e� Magnata! Facet by� pod wra�eniem!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Pokona�e� jednego z Guru. Jestem pod wra�eniem. Ale ju� nigdy wi�cej tego nie pr�buj.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Pokona� maga... musisz by� dzielnym cz�owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Oszala�e�? Dlaczego atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Co ci strzeli�o do g�owy, �eby atakowa� Kopacza?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Zaatakowa�e� mojego kumpla. Mog� wiedzie�, dlaczego?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Spr�buj jeszcze raz zaczepi� Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//�miesz si� tu jeszcze pokazywa�, z�odzieju?!
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Masz kilka rzeczy, kt�re nale�� do nas, a my chcemy je dosta� z powrotem.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Stary! Okrad�e� Magnat�w? Ale si� w�ciekn�!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Okrad�e� Guru! Szkoda tylko, �e da�e� si� z�apa�.
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Magowie nie lubi� jak kto� grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Pokona�e� mnie w pi�knym stylu, stary. Ale walka ju� sko�czona!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ... to si� chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, �bereifrig, �hnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y�berion blind,	Mitl�ufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//�adnej magii!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Przesta�, s�yszysz? Przesta�!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Schowaj bro�!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Schowaj t� bro�!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//We mnie celujesz? Poczekaj no...
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Nie celuj we mnie, je�li ci �ycie mi�e!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Co to ma znaczy�, do diab�a?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Zapomnijmy o tym nieporozumieniu, dobrze?
	Strange						=	"SVM_13_Strange"						;//Gdzie on si� podzia�?! To niemo�liwe!
	DieMonster					=	"SVM_13_DieMonster"						;//Na kolacj� b�dzie mi�so!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Twoja kolej! Bez lito�ci!
	NowWait						=	"SVM_13_NowWait"						;//Za to ci� zabij�!
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Chcesz spr�bowa� szcz�cia jeszcze raz?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Ju� nie �yjesz, przyb��do!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Odr�bi� ci palce!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Przekl�ty z�odziej! Po�ami� ci r�ce.
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//W tej okolicy to JA bij� ludzi!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Zabi�e� jednego z naszych!
	Dead						=	"SVM_13_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Nawet nie zd��ysz tego po�a�owa�, gnido!
	YesYes						=	"SVM_13_YesYes"							;//Nie ma sprawy! Nic si� nie sta�o!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Nie mam odpowiedniej broni! Ale jeszcze si� spotkamy...
	Help						=	"SVM_13_Help"							;//�aaaa... W nogi!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Jeszcze si� spotkamy!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//Nast�pnym razem ci� wyko�cz�!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//�adna bro�! Twoja? Nie??? To �wietnie!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Nie obrazisz si� chyba, je�li po�ycz� troch� twojej rudy?
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Nie masz ani krzty rudy? Nawet okruszka?!
	HandsOff					=	"SVM_13_HandsOff"						;//�apy precz, �mieciu!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Id� precz! Wyno� si� st�d!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Czego tu szukasz?!
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Pr�bujesz mnie okpi�?!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hej, ty! Dlaczego tak si� skradasz?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Co tu robisz? Uciekaj, albo wezw� stra�!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Nie masz tu czego szuka�!
	WiseMove					=	"SVM_13_WiseMove"						;//Masz szcz�cie! Ch�tnie bym ci pokaza�, gdzie raki zimuj�!
	Alarm						=	"SVM_13_Alarm"							;//Stra�! Tutaj!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALARM!!!
	BehindYou					=	"SVM_13_BehindYou"						;//Za tob�!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Zobaczymy kto pierwszy trafi do piachu!
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Tak! Jeszcze raz!
	CheerFight					=	"SVM_13_CheerFight"						;//Chc� zobaczy� krew!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Wyko�cz go!
	Ooh							=	"SVM_13_Ooh"							;//Oddaj mu, idioto!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Taaak!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Taaa, spadaj!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//S�abe przedstawienie! Facet potyka� si� w w�asne nogi!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Phi, nale�a�o mu si�!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Zab�jstwo przy �wiadkach to SAMOb�jstwo. Zapami�taj moje s�owa.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Niez�a walka!
	Awake						=	"SVM_13_Awake"							;//(Ziewni�cie)
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Wszystko w porz�dku?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Za pot�g� magii!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Zbud� si�!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//O�lep�e�? Tutaj!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_13_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_13_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Co mog� dla ciebie zrobi�?
	MakeWay						=	"SVM_13_MakeWay"						;//Przepu�� mnie.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Zejd� mi z drogi!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Szukasz guza? Wyno� si� st�d!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Ci�gle szukasz k�opot�w?
	LookAway					=	"SVM_13_LookAway"						;//Ja NIC nie widzia�em!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Spokojnie! We� to sobie!
	WhatsThat					=	"SVM_13_WhatsThat"						;//Co to by�o?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Oddaj mi moj� bro�!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Dobra! Zatrzymaj to sobie.
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Zgin�� jeden z naszych! Musimy go pom�ci�!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Dlaczego mnie obudzi�e�?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Nale�a�o ci si� porz�dne lanie!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Powali�e� jednego z Magnat�w! Jest na ciebie naprawd� w�ciek�y!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Pokona�e� Guru. Zdajesz si� przyci�ga� k�opoty jak magnes!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Pokona� maga... To nie by� najlepszy pomys�!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//A wi�c to ty atakujesz Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Zostaw moich kumpli w spokoju!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Dobrze ci radz�! Nie zaczepiaj wi�cej moich kumpli!
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Nie tolerujemy tutaj wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Dobrze ci radz�! Nie zaczepiaj nigdy wi�cej moich protegowanych!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Nigdy wi�cej nie pr�buj mnie okrada�!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Chcemy z powrotem nasze rzeczy! Oddawaj je!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Okrad�e� Magnata! Co ci do diab�a strzeli�o do g�owy!
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Okrad�e� Guru! Szkoda tylko, �e da�e� si� z�apa�.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Okrad�e� mag�w! To nie by� najlepszy pomys�!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Zgin�� jeden z naszych ludzi, a ty macza�e� w tym palce! Jeszcze jeden taki b��d a b�dzie po tobie.
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Spu�ci�e� mi niez�e baty, stary. To by�a dobra walka, ale ju� si� sko�czy�a!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ... to si� chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erz�hler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Natychmiast przesta� czarowa�!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//S�yszysz?! �adnych czar�w!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Co zamierzasz zrobi� z t� broni�?!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Schowaj bro�!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Celujesz we mnie!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Mo�esz wreszcie przesta� we mnie celowa�?!
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Uwa�aj, cz�owieku!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Zapomnijmy o tym nieporozumieniu, dobrze?
	Strange						=	"SVM_14_Strange"						;//Niez�a sztuczka! Po prostu rozp�yn�� si� w powietrzu!
	DieMonster					=	"SVM_14_DieMonster"						;//Uci��liwe stworzenie.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Musz� ci� zabi�... To nic osobistego. Sam rozumiesz...
	NowWait						=	"SVM_14_NowWait"						;//Na razie wystarczy!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Chyba nie szukasz znowu guza, co?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Sam si� o to prosi�e�!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Nie zaprasza�em ci� tutaj!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//To moja w�asno��! 
	DirtyThief					=	"SVM_14_DirtyThief"						;//Zabra�e� co�, co nale�a�o do mnie. Teraz mi za to zap�acisz!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Musisz si� nauczy� post�powa� zgodnie z zasadami.
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Zabi�e� cz�owieka!
	Dead						=	"SVM_14_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Po�a�ujesz tego!
	YesYes						=	"SVM_14_YesYes"							;//Dobra, dobra!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Nie mam ochoty mierzy� si� z takim przeciwnikiem.
	Help						=	"SVM_14_Help"							;//Musz� wraca� do mych bada�!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Jeszcze si� spotkamy!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Nigdy wi�cej tego nie r�b!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Wezm� t� bro�!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Twoja ruda bardzo mi si� przyda!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Nie masz rudy?!
	HandsOff					=	"SVM_14_HandsOff"						;//R�ce przy sobie!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Wyno� si� st�d.
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Jak si� tu dosta�e�?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Chyba �artujesz!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Czemu tak si� skradasz?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Wyjd� st�d, zanim wezw� stra�e!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Nie masz tu czego szuka�, zrozumiano?
	WiseMove					=	"SVM_14_WiseMove"						;//M�dra decyzja!
	Alarm						=	"SVM_14_Alarm"							;//Stra�! Tutaj! Tutaj!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//INTRUZ!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Za tob�!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Walka!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Jakie to... nieefektywne.
	CheerFriend					=	"SVM_14_CheerFriend"					;//To chyba do�� m�cz�ce.
	Ooh							=	"SVM_14_Ooh"							;//To musia�o bole�!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//C�, tak te� mo�na...
	RunCoward					=	"SVM_14_RunCoward"						;//Czego� si� nauczy�!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//No i po wszystkim.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Nale�a�o mu si�!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Dlaczego go zabi�e�? Teraz b�dziesz mia� k�opoty!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Te walki s� strasznie nudne!
	Awake						=	"SVM_14_Awake"							;//Chyba przysn��em...
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Za pot�g� magii!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Zbud� si�!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Jest tutaj!
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Nie mog� ci� niczego nauczy�. Brak ci do�wiadczenia.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Umiesz ju� wszystko. Spr�buj zaj�� si� czym� innym.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Musisz si� jeszcze wiele nauczy� zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Jeste� ju� lepszy!
	HeyYou						=	"SVM_14_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_14_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Co mog� dla ciebie zrobi�?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Mog� ci jako� pom�c?
	MakeWay						=	"SVM_14_MakeWay"						;//Odsu� si�!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Pozw�l mi przej��.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Id� sobie wreszcie!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Znowu szukasz k�opot�w?
	LookAway					=	"SVM_14_LookAway"						;//Nie interesuje mnie, co tam robisz.
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Co to by�o?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Oddaj mi moj� bro�!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//A zreszt�... I tak tego nie potrzebowa�em.
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Zgin�� jeden z naszych ludzi. Je�li znajdziemy winnego...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Przeszkadzasz mi w badaniach!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//S�ysza�em, �e wpakowa�e� si� w jak�� kaba��...
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Powali�e� Magnata! Facet by� pod wra�eniem!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Pokona�e� jednego z Guru. Jestem pod wra�eniem. 
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Pokona� maga... no, no...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Wiesz, �e Nowicjusze s� pod moj� ochron�, a mimo to o�mielasz si� ich zaczepia�?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Atakuj�c Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Lepiej nie wchod� w drog� moim przyjacio�om!
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Spr�buj jeszcze raz zaczepi� Nowicjusza, a po�a�ujesz!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Zaczepianie moich protegowanych mo�e ci� kosztowa� �ycie!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Jak �miesz si� tu jeszcze pokazywa�, z�odzieju?!
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Masz kilka rzeczy, kt�re nale�� do nas, a my chcemy je dosta� z powrotem.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Stary! Okrad�e� Magnat�w? Ale si� w�ciekn�!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Po�yczy�e� sobie kilka rzeczy nale��cych do Guru, tak?
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Po�yczy�e� sobie kilka rzeczy nale��cych do mag�w, prawda?
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Zabi�e� jednego z naszych! Jeszcze jeden taki wybryk, a przyjdzie kolej na ciebie!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Zabi�e� Magnata! Stary, odbi�o ci?!
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Zabi�e� Guru! Nie mog� w to uwierzy�!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Zabi�e� maga! Jak zamierzasz si� z tego wyt�umaczy�?!
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Zgin�� cz�onek Starego Obozu i twoje imi� pad�o w zwi�zku z t� spraw�...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Nowy Ob�z poni�s� niepowetowan� strat�, i wygl�da na to, �e macza�e� w tym palce!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Bractwo utraci�o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//Nie �atwo b�dzie to teraz odkr�ci�!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Pokona�e� mnie w pi�knym stylu, stary. Ale walka ju� sko�czona!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ... je�li my�lisz, �e ...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ... mo�e ...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ... to nie by�o zbyt m�dre ...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ... lepiej si� do tego nie miesza� ...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ... to nie m�j problem ...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ... od razu wiedzia�em, �e b�d� k�opoty ...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzie� ...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ... to si� ju� wi�cej nie powt�rzy ...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ... w tej historii musi by� jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ... musisz uwa�a� na to, co m�wisz przy obcych ...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ... tak d�ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ... nie powiniene� wierzy� we wszystko ...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ... nie chcia�bym by� teraz w jego sk�rze ...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ... niekt�rzy nigdy si� nie naucz� ...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ... kiedy� takie sprawy za�atwia�o si� inaczej ...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ... ludzie zawsze gadaj� ...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ... mam ju� do�� tej paplaniny ...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo�na polega�, ot co! ...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ... to si� chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ... pewnie masz racj� ...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ... czekaj. Lepiej si� w nic nie pakowa� ...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ... my�la�em, �e to si� sko�czy�o ju� dawno temu ...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ... pogadajmy lepiej o czym� innym ...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hej, ty!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Czekaj no!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Zbud� si�!
	ALGreetings				=	"SVM_15_ALGreetings"				;//Za Gomeza!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Witaj!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Cze��!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaarg!
	Awake					=	"SVM_15_Awake"						;//(Budzi si�)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nie dzia�a.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, zepsuty.
	NeedKey					= 	"SVM_15_NeedKey"					;// B�d� potrzebowa� klucza...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Nie mam ju� �adnych uniwersalnych kluczy...
	InvFull					= 	"SVM_15_InvFull"					;// Wi�cej nie dam rady unie��.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Odejd�! Nie wolno ci ze mn� rozmawia�!
	Help						=	"SVM_16_Help"			;	//(Krzyk)
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaarg!
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




