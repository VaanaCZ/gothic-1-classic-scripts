// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese können	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner Nähe gezaubert wird -> er fordert auf, damit aufzuhören!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	Pünten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Paß auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuhören)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche kämpfen und der Spieler die Waffe wegsteckt) oder als Reaction über das news-Gedächtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn plötzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	Mörder -> kann ihn plötzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC früher noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC früher besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zurückzugeben, seine Waffe wegzustecken -> "Wer nicht hören will muß fühlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(Tür,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC trägt Waffe des NSCs -> NSC ist stärker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schwächeren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schwächere) SC	etwas nimmt, daß ihm gehört	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schwächeren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Schützling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs getötet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// Tödlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	schächer als sein Kontrahent
											// 2. SC zieht Waffe oder nähert sich mit Waffe und NSC ist schwächer als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Scheiße, was ein Höllenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich Stärker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird geplündert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC plündert bewußtlosen SC/aNSC. Während er sich bückt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC plündert bewußtlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC ärgert sich darüber, daß er beim Durchsuchen eines bewußtlosen/toten Körpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, Tür) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schwächeren	SC in seiner Hütte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zurückzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schwächerer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer Hütte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zurückzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gemüse (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	drüben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	Kämpfer	schlägt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist getötet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der Kämpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC tötet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schlägerei" getötet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)

// Grüße
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('Für Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schläfer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da drüben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung über 100
	var string	NoLearnYouAlreadyKnow	;	// Du mußt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im Räumen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespräch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC rückt NSC zu dicht auf die Pelle -> "Kann ich was für Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schwächerem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht stärkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des stärkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gekämpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schwächer...
	var string	LookAway;					// Eingeschüchterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC trägt	Waffe des schächeren NSCs -> NSCs verlangt die Waffe zurück	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zurückweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC trägt	eine Waffe,	die	dem	NSC	gehört -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC trägt Waffe des NSCs -> NSC ist schwächer (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC trägt Waffe des schwächeren NSCs ->	NSCs verlangt die Waffe	zurück ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Scheiß-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	stärkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zurück

	VAR	STRING	TheyKilledMyFriend;			// NSC Täter - NSC zu Opfer freundlich, zu Täter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat gehört, daß der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Schützling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/gehört hat, daß ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon gehört, daß Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann müssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde getötet
	var	STRING	YouKilledEBr;				// Erzbaron getötet
	VAR	STRING	YouKilledGur;				// Guru getötet
	VAR	STRING	YouKilledMage;				// Guru getötet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler getötet.
	VAR	STRING	YouKilledNCfolk;			// Söldner, Organisator, Schürfer oder Bauer getötet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize getötet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz schön	geplättet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zufällig zu "Dialogen" zusammengewürfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, daß das Ärger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte muß wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man muß eben aufpassen was man rumerzählt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man hört...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...früher wäre das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich hör nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, daß sich daran was ändern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...laß uns lieber über was anderes reden...
	VAR	STRING	Om;							// Ommm (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit Rücken zu dir)                                   
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
// 		Die SVM-Instanzen		(ToDo: News noch überarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese müssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Schürfer)	Nörgler, Alkoholiker, schimpft über	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//Hej! Żadnej magii!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Chcesz dostać w ucho? Natychmiast przestań!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Schowaj broń!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Schowaj natychmiast tę cholerną broń!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Odłóż to!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Chcesz dostać w łeb? To wyceluj we mnie jeszcze raz!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Uważaj! Spróbuj tego jeszcze raz, a rozwalę ci łeb!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Zapomnijmy o całej sprawie, dobra?
	Strange						=	"SVM_1_Strange"						;//Wyłaź stąd, sukinsynu!
	DieMonster					=	"SVM_1_DieMonster"					;//Psia twoja mać!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Już po tobie!
	NowWait						=	"SVM_1_NowWait"						;//Zaraz dostaniesz...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Widzę, że chcesz oberwać, co?
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Jak z tobą skończę, nie będzie co zbierać!
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Ostrzegałem cię, żebyś trzymał łapy z dala od moich rzeczy!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Zapłacisz mi za to, złodzieju!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Nikt nie będzie podskakiwał moim kumplom!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Powaliłeś jednego z naszych. Teraz ja ROZWALĘ ciebie!
	Dead						=	"SVM_1_Dead"						;//Aaaaarg!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aaargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aaargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aaargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Jeszcze pożałujesz!
	YesYes						=	"SVM_1_YesYes"						;//Bez paniki! Wygrałeś!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Cholera! W nogi!
	Help						=	"SVM_1_Help"						;//Szlag by to...!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Jeszcze się spotkamy!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Spróbuj tego jeszcze raz, a pożałujesz!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Niezła broń! Dawaj ją!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Dzięki za rudę, BOHATERZE!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Biedny głupcze, nawet nie masz przy sobie rudy!
	HandsOff					=	"SVM_1_HandsOff"					;//Łapy precz!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Spadaj stąd!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hej! Jak tu wlazłeś?!
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Myślisz, że jestem taki głupi?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej, ty? Co się tak skradasz?!
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Won z mojej chaty, albo wezwę straże!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Nie masz tu czego szukać! Spadaj!
	WiseMove					=	"SVM_1_WiseMove"					;//Mądry chłopiec!
	Alarm						=	"SVM_1_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALARM! INTRUZ!!!
	BehindYou					=	"SVM_1_BehindYou"					;//Za tobą!
	TheresAFight				=	"SVM_1_TheresAFight"				;//A, rozróba!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_1_CheerFight"					;//Walczycie jak baby!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Wykończ go!
	Ooh							=	"SVM_1_Ooh"							;//Oddaj mu wreszcie!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Dawaj go!
	RunCoward					=	"SVM_1_RunCoward"					;//Wracaj, tchórzu!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Facet ma dość!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Należało mu się!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Dlaczego go zabiłeś? Już po tobie!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Niezła walka!
	Awake						=	"SVM_1_Awake"						;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Witaj
	ALGreetings					=	"SVM_1_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Jest tam!
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Wróć, jak zdobędziesz trochę doświadczenia.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_1_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_1_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Co mogę dla ciebie zrobić?
	MakeWay						=	"SVM_1_MakeWay"						;//Przepuść mnie!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Zejdź mi z drogi, człowieku!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Głuchy jesteś? RUSZ SIĘ!!!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Znów szukasz kłopotów?
	LookAway					=	"SVM_1_LookAway"					;//Uhhhh! Nic nie widziałem!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Co to było?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Paradujesz sobie z MOJĄ bronią!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Dawaj to!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebuję!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Załatwili jednego z naszych. Jak dorwę tego, co to zrobił...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Cholera, czemu mnie budzisz?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Dostałeś baty? Należało ci się!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Pobiłeś Magnata! Jest na ciebie wściekły!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Powaliłeś Guru. Zdajesz się przyciągać kłopoty jak magnes!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Pokonałeś maga. To nie był najlepszy pomysł...
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Nie możesz tak po prostu bić Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Zostaw moich chłopców w spokoju!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Pobiłeś mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Nie tolerujemy tutaj takich jak ty!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Jak pobijesz któregoś z moich podopiecznych, będą kłopoty!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Ty dupku! Jak śmiesz mnie okradać! Nigdy więcej tego nie próbuj!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Oddawaj nam nasze rzeczy! Ale już!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Okradłeś Magnatów! Co ci strzeliło do głowy?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Okradłeś Guru? Szkoda tylko, że dałeś się złapać!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Okradłeś magów? Brak ci piątej klepki, czy co?
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Jeden z naszych ludzi nie żyje, a ty maczałeś w tym palce. Następny podejrzany ruch i będziesz martwy!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//Nie łatwo będzie to odkręcić!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//To była uczciwa walka! Nieźle mi się oberwało, stary!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ... co za gówno ...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ... może, ale kogo to obchodzi? ...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ... głupota ...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ... nie mój problem ...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ... dlaczego zawsze tak się dzieje? ...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ... to się już nie powtórzy ...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ... skończ tę paplaninę, co? ...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ... ja tam się nie mieszam ...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ... był czas, kiedy takie sprawy załatwiano inaczej ...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ... nie będę dalej słuchał tej paplaniny ...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_1_Om"							;//Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschüchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Żadnej magii!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//Hej! Powiedziałem: żadnej magii!
	WeaponDown					=	"SVM_2_WeaponDown"					;//No już, schowaj to!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Schowaj broń!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Uważaj gdzie celujesz, baranie!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Wyceluj we mnie jeszcze raz to się zdenerwuję!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hej, co to ma znaczyć?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Zapomnijmy o całej sprawie, dobra?
	Strange						=	"SVM_2_Strange"						;//Dziwne! Gdzie on się podział?!
	DieMonster					=	"SVM_2_DieMonster"					;//Jeszcze jeden!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Obawiam się, że muszę z tobą skończyć!
	NowWait						=	"SVM_2_NowWait"						;//Sam jesteś sobie winien!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Wciąż nie masz dość?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Cóż, skoro tego chcesz!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Wiesz, że nie masz tu czego szukać!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Trzymaj łapy z dala o rzeczy, które nie należą do ciebie!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Okradłeś mnie! Nie daruję ci tego!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Nikt nie będzie podskakiwał moim chłopcom!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Zabiłeś jednego z nas! Zapłacisz za to!
	Dead						=	"SVM_2_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Jeszcze pożałujesz!
	YesYes						=	"SVM_2_YesYes"						;//Spokojnie, spokojnie, wygrałeś!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Ja... eee... pójdę zawołać pomoc!
	Help						=	"SVM_2_Help"						;//Nie mam czasu, muszę jeszcze coś załatwić!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Zobaczysz, jeszcze się spotkamy
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Nigdy więcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//JA wezmę tę broń!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//I tak nie potrzebujesz tej rudy!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Nie masz rudy? To chyba nie jest twój szczęśliwy dzień!
	HandsOff					=	"SVM_2_HandsOff"					;//Łapy precz!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Wynoś się stąd!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hej! Jak tu wlazłeś?!
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Nie próbuj robić ze mnie głupca, albo pożałujesz!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Czemu się tak skradasz?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Precz z mojej chaty, albo wezwę straże!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Trzymaj się z dala od naszych chat!
	WiseMove					=	"SVM_2_WiseMove"					;//Mądra decyzja!
	Alarm						=	"SVM_2_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ALARM!!
	BehindYou					=	"SVM_2_BehindYou"					;//Za tobą!
	TheresAFight				=	"SVM_2_TheresAFight"				;//A, rozróba!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//To już wszystko?!
	CheerFight					=	"SVM_2_CheerFight"					;//No obudź się, królewno!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Niezły cios!
	Ooh							=	"SVM_2_Ooh"							;//Musiało boleć!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Jeszcze się rusza.
	RunCoward					=	"SVM_2_RunCoward"					;//Zostań tu, mięczaku!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Facet ma dość!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Należało mu się!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Zabiłeś go! Nie było innego wyjścia?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Niezła walka, ale ciut za krótka.
	Awake						=	"SVM_2_Awake"						;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_2_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_2_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Tutaj.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_2_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_2_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Co mogę dla ciebie zrobić?
	MakeWay						=	"SVM_2_MakeWay"						;//Przepuść mnie!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Zejdź mi z drogi!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Złaź mi z drogi, albo oberwiesz w ucho!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Znowu szukasz kłopotów?
	LookAway					=	"SVM_2_LookAway"					;//Ja NIC nie widziałem! Nie ma sprawy!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Dobra! Weź to sobie!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Co? Jak?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Hej, czy to nie jest przypadkiem moja broń?!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//No już, daj mi to!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//I tak nie będę tego potrzebował!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Ktoś załatwił jednego z naszych. Jak dorwiemy faceta - wyląduje w piachu.
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Czemu mnie obudziłeś?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Dostałeś w dziób? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Pokonałeś Magnata!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Powaliłeś Guru?! Nie wiem czy to jeszcze odwaga, czy już głupota!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Pokonać maga... musisz być dzielnym człowiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Dbam tutaj o porządek!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Nieważne, o co poszło! Atakując Kopacza prosisz się o kłopoty!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Pobiłeś mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Zostaw Nowicjuszy w spokoju!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Żadnej rozróby z moimi chłopcami! Zrozumiano?!
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Dlaczego mnie okradłeś?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Masz tu coś, co należy do nas, a my chcemy to z powrotem!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Stary! Okradłeś Magnatów! Ale się wściekną.
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Okradłeś Guru! Masz szczęście, że cię nie złapali!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Magowie nie lubią, gdy ktoś grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Wiesz jak trudno jest coś takiego odkręcić?!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Tak, pokonałeś mnie! To była piękna walka, ale teraz daj już sobie spokój!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ... ale nie chciałbym być w jego skórze ...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ... wątpię, żeby to się kiedyś zmieniło ...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ... zapewne masz rację ...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Żadnej magii!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Natychmiast przestań! Żadnej magii!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Jak nie przestaniesz tym wymachiwać, ktoś się w końcu rozzłości!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Dlaczego we mnie celujesz?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Schowaj broń, albo się wkurzę!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Heeeej! Co to ma znaczyć?!
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//No dobra, powiedzmy, że każdy z nas ma swoje racje!
	Strange						=	"SVM_3_Strange"						;//Znikł? Po prostu rozpłynął się w powietrzu?
	DieMonster					=	"SVM_3_DieMonster"					;//Nie będziesz mnie więcej wkurzać, śmieciu!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Zaraz będzie po wszystkim!
	NowWait						=	"SVM_3_NowWait"						;//Chyba muszę być nieco bardziej dosadny!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Widzę, że nadal nie masz dość!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sam się prosiłeś!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Nie powinno cię tu być! Teraz muszę spuścić ci lanie!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Widzę, że ktoś musi ci dać po łapach, zanim zrozumiesz, co ci wolno, a czego nie!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Chcesz mnie okraść! Nie mogę w to uwierzyć!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Nie możesz tak po prostu prać każdego, kto nawinie ci się pod rękę.
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Zabiłeś jednego z nas! To był błąd! Poważny błąd!
	Dead						=	"SVM_3_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Pożałujesz tego!
	YesYes						=	"SVM_3_YesYes"						;//Dobra! Wygrałeś!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Cholera! W nogi!
	Help						=	"SVM_3_Help"						;//Muszę już iść!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Jeszcze się spotkamy!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Nigdy więcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Dzięki za broń!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Pożyczę sobie trochę twojej rudy!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Nie masz rudy? Ty biedny głupcze!
	HandsOff					=	"SVM_3_HandsOff"					;//Łapy precz!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Spadaj!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hej! Jak tu wlazłeś?!
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Nie jestem taki głupi!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Przestań się tak skradać!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Spadaj z mojej chaty, albo wezwę straż!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Co ty wyprawiasz? Jak cię dorwę będziesz martwy!
	WiseMove					=	"SVM_3_WiseMove"					;//A! Czyli jednak wiesz, co dla ciebie dobre!
	Alarm						=	"SVM_3_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALARM!!
	BehindYou					=	"SVM_3_BehindYou"					;//Uwaga!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Bójka!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Przywal mu!
	CheerFight					=	"SVM_3_CheerFight"					;//Co ty robisz?!
	CheerFriend					=	"SVM_3_CheerFriend"					;//Ładny cios!
	Ooh							=	"SVM_3_Ooh"							;//Ooooch!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Taaak! Dobra robota!
	RunCoward					=	"SVM_3_RunCoward"					;//Facet wziął nogi za pas!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//No i po facecie!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//Od dłuższego czasu mu się należało!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Gość przestał się ruszać! Zabiłeś go!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Ciągle tylko bójki i bójki...
	Awake						=	"SVM_3_Awake"						;//Kolejny dzień i znowu to samo!
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hej, stary!
	ALGreetings					=	"SVM_3_ALGreetings"					;//Za Gomeza, tak, tak!
	MageGreetings				=	"SVM_3_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Jest tutaj.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_3_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_3_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Czego sobie życzysz?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Co mogę dla ciebie zrobić?
	MakeWay						=	"SVM_3_MakeWay"						;//Zejdź mi z drogi!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Złaź mi z drogi, człowieku!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Ile razy mam ci powtarzać? Zejdź mi z drogi!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Znowu szukasz guza?!
	LookAway					=	"SVM_3_LookAway"					;//Ja NIC nie widziałem! Nawet mnie tu nie było!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Dobra, zatrzymaj to sobie!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Co to było?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Masz mój oręż!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Oddawaj to!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Jak sobie życzysz! Ja i tak tego nie potrzebuję!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Zabili jeszcze jednego z naszych. Nikt z nas nie wyjdzie stąd żywy!
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Dlaczego odrywasz mnie o moich snów?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Należało ci się porządne lanie!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Pokonałeś Magnata! Szukasz kłopotów, co?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Pokonałeś jednego z Guru. Nigdy ci tego nie zapomną!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Zwycięstwo nad magiem ściągnie na ciebie nie lada kłopoty!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Następnym razem lepiej zostaw Nowicjuszy w spokoju.
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Rusz tylko któregoś z Kopaczy, a nie dadzą ci spokoju do końca życia!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Pobiłeś mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Nowicjusze są pod moją ochroną! Zostaw ich w spokoju!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Kopacze płacą mi za bezpieczeństwo, więc lepiej nie sprawiaj im kłopotów!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Próbujesz mnie okraść, przeklęty złodzieju!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Masz pewne rzeczy, które należą do nas. Lepiej od razu je oddaj...
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Człowieku! Okradłeś Magnatów?! Ale się wściekną.
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Okradłeś Guru! Szkoda tylko, że dałeś się złapać.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Próbując okraść maga musisz być bardziej ostrożny!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//To była uczciwa walka! Nie mam do ciebie żalu, że mnie powaliłeś!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ... zapewne masz rację ...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Żadnej magii!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Posłuchaj mojej rady i daruj sobie te czary-mary!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Odłóż broń, chyba że szukasz guza!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//No już, odłóż broń!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Uważaj, jak tym wymachujesz!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Jak się nie uspokoisz, zabiorę ci tę zabawkę!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hej, ty! Uważaj sobie!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Zapomnijmy o naszej sprzeczce.
	Strange						=	"SVM_4_Strange"						;//Wychodź! Pokaż się!
	DieMonster					=	"SVM_4_DieMonster"					;//Nieważne ilu zabijesz. Wciąż przychodzą następni!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//To już koniec twojej drogi!
	NowWait						=	"SVM_4_NowWait"						;//Nauczę cię, że lepiej schodzić mi z drogi...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Ciągle nie masz dość?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Biedny głupcze. Lepiej mi było nie przeszkadzać.
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Jeśli myślisz, że pozwolę ci się tu tak szwendać, to jesteś w błędzie!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ośmieliłeś się mnie okraść!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Wchodzenie nam w drogę nie wyjdzie ci na dobre.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Zabiłeś jednego z nas! Oko za oko!
	Dead						=	"SVM_4_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Jeszcze pożałujesz!
	YesYes						=	"SVM_4_YesYes"						;//Spokojnie, wygrałeś!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Wynośmy się stąd i to szybko!
	Help						=	"SVM_4_Help"						;//Robię się na to za stary!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Nie zapomnę ci tego zbyt szybko!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Nigdy więcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Chyba pożyczę sobie twoją broń!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Myślę, że lepiej wykorzystam twoją rudę!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Nie masz nawet marnej bryłki rudy!
	HandsOff					=	"SVM_4_HandsOff"					;//Łapy precz!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Spadaj stąd!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Nie masz tu czego szukać!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Nie jestem w nastroju na takie wygłupy!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hej, ty! Czemu się tak skradasz?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Wynoś się stąd, zanim wezwę strażników!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Czego tu szukałeś?
	WiseMove					=	"SVM_4_WiseMove"					;//Masz szczęście...
	Alarm						=	"SVM_4_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//INTRUZ!
	BehindYou					=	"SVM_4_BehindYou"					;//Za tobą!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Następna bójka.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_4_CheerFight"					;//Tylko na to cię stać?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Przyłóż mu!
	Ooh							=	"SVM_4_Ooh"							;//Oddaj mu!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Dobra robota!
	RunCoward					=	"SVM_4_RunCoward"					;//Ten tchórz ucieka!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Za moich czasów walczono jak należy!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Sam sobie na to zasłużyłeś!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Zabiłeś go! To wielki błąd!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Dawniej walki były dużo lepsze.
	Awake						=	"SVM_4_Awake"						;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_4_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Znajdziesz go tutaj!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_4_HeyYou"						;//Hej tam!
	NotNow						=	"SVM_4_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Czego sobie życzysz?
	MakeWay						=	"SVM_4_MakeWay"						;//Pozwól mi przejść!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Zajdź mi z drogi, w tej chwili!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Złaź mi z drogi, albo oberwiesz w ucho!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Nadal szukasz kłopotów?
	LookAway					=	"SVM_4_LookAway"					;//Nic nie widziałem, nic nie słyszałem...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Co to było?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Bądź miłym chłopcem i oddaj mi tę broń!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//No już, daj mi to!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Albo nie! I tak chciałem się tego pozbyć!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Ja dopadnę tego, kto załatwił jednego z naszych...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Zakłócasz mój odpoczynek!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Dostałeś w łeb? Od początku należało ci się porządne lanie!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Pokonałeś Magnata!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Pokonałeś jednego z Guru. Jestem pod wrażeniem. Ale już nigdy więcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Pokonać maga... musisz być dzielnym człowiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Oszalałeś? Dlaczego bez powodu atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Co ci strzeliło do głowy, żeby atakować Kopacza?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Podpadłeś mojemu kumplowi. Teraz masz przechlapane!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Podnieś jeszcze raz rękę na Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Jesteś taki odważny czy taki głupi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Trzymaj łapy z dala od moich rzeczy, zrozumiano?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Masz coś, co należy do nas. Teraz nam to oddasz!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Człowieku! Okradłeś Magnatów?! Ale się wściekną.
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Okradłeś Guru! Szkoda tylko, że dałeś się złapać.
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Magowie nie lubią jak ktoś grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//W Nowym Obozie przedwcześnie zwolnił się jeden lokal, i wygląda na to, że to twoja wina...
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//Nie będzie łatwo to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Nieźle mnie sprałeś, stary! To była uczciwa walka, ale już się skończyła!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_4_Om"							;//Ommm
};


instance SVM_5 (C_SVM)				//Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Żadnego czarowania!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Dobrze ci radzę! Żadnej magii!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Co chcesz zrobić z tą bronią, człowieku?!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//No już, schowaj tę broń!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Przestań we mnie celować, bałwanie!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Jak natychmiast nie przestaniesz, zrobię z ciebie kotlety!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, ślepy jesteś, czy co?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Może zapomnijmy o naszej małej sprzeczce, dobra?
	Strange						=	"SVM_5_Strange"						;//Ale był tutaj chwilę temu?! Dziwne!
	DieMonster					=	"SVM_5_DieMonster"					;//Twoja kolej, palancie!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Czas zapłaty!
	NowWait						=	"SVM_5_NowWait"						;//Prosisz się o solidne lanie!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Nadal nie masz dość?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Dobra, sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Będą cię wynosić na noszach!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Ostrzegałem cię! Jak będziesz grzebał w moich rzeczach, dostaniesz po łapach!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Ty złodzieju! Ja ci pokażę!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Zadzieranie z moimi chłopakami nie wyjdzie ci na dobre!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Zabiłeś jednego z moich ludzi. Teraz ja zabiję ciebie!
	Dead						=	"SVM_5_Dead"					;//Aaarg!
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Jeszcze pożałujesz!
	YesYes						=	"SVM_5_YesYes"						;//Spokojnie, wygrałeś!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//To jak dla mnie trochę za dużo!
	Help						=	"SVM_5_Help"						;//Cholera!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Następnym razem będzie trochę inaczej!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Nigdy więcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Podoba mi się twoja broń!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Ja się lepiej zaopiekuję twoją rudą!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Co za pech! Żadnej rudy!
	HandsOff					=	"SVM_5_HandsOff"					;//Łapy precz!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Wynoś się stąd!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hej! Skąd się tu wziąłeś?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Dobry żart!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Czemu się tak skradasz?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Wynoś się stąd, zanim wezwę strażników!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Nie masz tu czego szukać!
	WiseMove					=	"SVM_5_WiseMove"					;//Szybko się uczysz!
	Alarm						=	"SVM_5_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALARM!
	BehindYou					=	"SVM_5_BehindYou"					;//Hej, uważaj!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Rozróba!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Dalej!
	CheerFight					=	"SVM_5_CheerFight"					;//Świetnie!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Przyłóż mu wreszcie!
	Ooh							=	"SVM_5_Ooh"							;//Tylko uważaj!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Najwyższy czas!
	RunCoward					=	"SVM_5_RunCoward"					;//Oho! Bierze nogi za pas!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Zwycięzca, bez dwóch zdań!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Zasłużył na to!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Tak po prostu zabić człowieka... Będziesz miał teraz niezłe kłopoty!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Co za walka!
	Awake						=	"SVM_5_Awake"						;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Witaj, przyjacielu!
	ALGreetings					=	"SVM_5_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Tutaj.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_5_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_5_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Czym mogę służyć?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Czego chcesz?
	MakeWay						=	"SVM_5_MakeWay"						;//Przepuść mnie.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//No rusz się, chcę przejść.
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Głuchy jesteś, czy szukasz kłopotów?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Nadal szukasz kłopotów?
	LookAway					=	"SVM_5_LookAway"					;//Ja NIC nie widziałem! Nawet nie wiem, co się stało!
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Dobra, zatrzymaj to sobie!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Co to było?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Wolałbym dostać z powrotem moją broń.
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Daj mi to!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Cóż, nie ma tego złego... Mam tego więcej!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak się dowiem, kto to zrobił...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Hej, co się dzieje? Czemu mnie budzisz?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Hę? Dostałeś baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Pokonałeś Magnata. Facet był pod wrażeniem.
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Pokonałeś jednego z Guru. Jestem pod wrażeniem. Ale już nigdy więcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Pokonać maga... musisz być dzielnym człowiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Oszalałeś? Dlaczego bez powodu atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Co ci strzeliło do głowy, żeby atakować Kopacza?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Powaliłeś mojego kumpla, a ja chcę wiedzieć, dlaczego?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Podnieś jeszcze raz rękę na Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Jesteś taki odważny czy taki głupi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Śmiesz się tu jeszcze pokazywać, parszywy złodzieju?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Masz kilka rzeczy, które należą do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Człowieku! Okradłeś Magnatów?! Ale się wściekną.
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Okradłeś Guru! Szkoda tylko, że dałeś się złapać.
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Magowie nie lubią jak ktoś grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i będziesz gryzł ziemię!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Spuściłeś mi niezłe baty, stary. To była dobra walka, ale już się skończyła!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Żadnej magii!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Przestań czarować! Natychmiast!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Odłóż tę cholerną broń!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Chcesz oberwać? Schowaj tę broń!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Schowaj broń, albo się wkurzę!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Jak nie przestaniesz we mnie celować, to oberwiesz!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hej! Uważaj!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hej, stary! Zapomnijmy o tej sprzeczce, dobra?
	Strange						=	"SVM_6_Strange"						;//Wyłaź! Pokaż się!
	DieMonster					=	"SVM_6_DieMonster"					;//Zrobię z ciebie kotlety, ty wieprzu!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Już po tobie!
	NowWait						=	"SVM_6_NowWait"						;//Teraz dostaniesz baty...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Widzę, że chcesz koniecznie dostać w łeb!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Teraz cię posiekam!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Ostrzegałem cię! Jak będziesz grzebał w moich rzeczach, dostaniesz po łapach!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Ty złodzieju! Ja ci pokażę!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Nikt nie będzie podskakiwał moim chłopcom!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Zabiłeś jednego z moich ludzi. Teraz ja zabiję ciebie!
	Dead						=	"SVM_6_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Jeszcze pożałujesz!
	YesYes						=	"SVM_6_YesYes"						;//Spokojnie! Bez nerwów! Wygrałeś!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Cholera, co za potwór! Lepiej wziąć nogi za pas!
	Help						=	"SVM_6_Help"						;//Szlag by to!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Jeszcze mnie popamiętasz!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Spróbuj tego jeszcze raz, a pożałujesz!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Podoba mi się twoja broń!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Dzięki za rudę! Wypiję za twoje zdrowie!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Szlag by cię! Nie masz ani krztyny rudy!
	HandsOff					=	"SVM_6_HandsOff"					;//Łapy precz!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Wynoś się stąd!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hej! Jak tu wlazłeś?!
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Co jest? Myślisz, że jestem taki głupi?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hej! Czemu się tak skradasz?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Wynoś się stąd zanim zawołam straż!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Czego tu szukałeś?
	WiseMove					=	"SVM_6_WiseMove"					;//Masz szczęście...
	Alarm						=	"SVM_6_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_6_BehindYou"					;//Za tobą!
	TheresAFight				=	"SVM_6_TheresAFight"				;//O! Walka!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_6_CheerFight"					;//Walczycie jak baby!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Wykończ go!
	Ooh							=	"SVM_6_Ooh"							;//Przestań się mazgaić! Oddaj mu!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//No już! Facet jeszcze dycha!
	RunCoward					=	"SVM_6_RunCoward"					;//Wracaj, tchórzu!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Ma już dość.
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Należało się mu!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Jesteś już martwy! To cię oduczy zabijania niewinnych ludzi!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! No! Ale mu pokazałeś!
	Awake						=	"SVM_6_Awake"						;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_6_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Jest tam.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_6_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_6_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//W czym mogę pomóc?
	MakeWay						=	"SVM_6_MakeWay"						;//Przepuść mnie.
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//No już, zejdź mi z drogi!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Spadaj! Mam ci to ręcznie wbić do tej zakutej pały?!
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Szukasz kłopotów?!
	LookAway					=	"SVM_6_LookAway"					;//Nic nie widziałem! Słowo honoru!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Co to było?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Oddaj mi swoją broń, żartownisiu!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Daj mi to, stary!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Nieważne! I tak tego nie potrzebowałem!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak się dowiem, kto to zrobił...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Do diabła! Czemu mnie obudziłeś?!
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Dostałeś tęgie baty? Należało ci się!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Pobiłeś Magnata. Jest na ciebie wściekły.
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Pokonałeś Guru! Chyba przyciągasz kłopoty jak jakiś magnes!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Pokonać maga... chyba jesteś niespełna rozumu!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Nie możesz tak po prostu atakować Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Zostaw moich ludzi w spokoju!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Napadłeś na mojego przyjaciela...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Nie tolerujemy tu wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Spojrzyj krzywo na któregoś z moich protegowanych, a będą kłopoty!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Sukinsynu! Próbujesz mnie okraść! Nigdy więcej tego nie rób!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Chcemy z powrotem nasze rzeczy! Oddawaj je!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Okradłeś Magnatów! Co ci strzeliło do głowy?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Okradłeś Guru? Szkoda tylko, że dałeś się złapać!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Okradłeś maga! To nienajlepszy pomysł!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Jeden z naszych ludzi nie żyje, a ty maczałeś w tym palce. Następny podejrzany ruch i będziesz martwy!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Nieźle mnie sprałeś, stary! To była uczciwa walka, ale już się skończyła!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Tylko nie to! Tylko nie to!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Żadnej magii! Żadnej magii!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Schowaj broń! No, schowaj!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Mówię serio! Schowaj to!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//We mnie celujesz?! Uważaj sobie!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Myślisz, że dam się zastraszyć? To się grubo mylisz!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Zapamiętam to sobie! Uważaj tylko!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Zapomnijmy o całej sprawie, dobra?
	Strange						=	"SVM_7_Strange"						;//Gdzie on się podział? No nie! To niemożliwe!
	DieMonster					=	"SVM_7_DieMonster"					;//Zatłukę cię, ty gnido!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Rozedrę cię na strzępy! Nie będę miał litości!
	NowWait						=	"SVM_7_NowWait"						;//Nareszcie! Teraz mam pretekst!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Chyba nie chcesz jeszcze raz spróbować, co?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Krwi! Chcę twojej krwi!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Porąbię cię na dzwona!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Powinienem odrąbać ci palce!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty parszywy złodzieju! Zapłacisz mi za to!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Ja tu jestem od bicia innych! Zrozumiano!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Zabiłeś jednego z naszych!
	Dead						=	"SVM_7_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Nie pożyjesz dość długo, żeby zdążyć tego pożałować.
	YesYes						=	"SVM_7_YesYes"						;//Dobra, dobra!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Nie mam teraz odpowiedniego oręża... Ale jeszcze się spotkamy!
	Help						=	"SVM_7_Help"						;//Cholera!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Jeszcze się spotkamy!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Nigdy więcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Zatrzymam sobie tę broń!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Wolałbym cię zabić, ale ruda też mi się przyda!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Nie masz rudy? Ty bezużyteczny śmieciu!
	HandsOff					=	"SVM_7_HandsOff"					;//Trzymaj łapy przy sobie!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Spadaj! No już! Won!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Jak tu wlazłeś?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Ty naprawdę próbujesz mnie zrobić w konia!
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hej, ty! Co się tak skradasz?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Spadaj stąd, albo wezwę straże!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Nie masz tu czego szukać!
	WiseMove					=	"SVM_7_WiseMove"					;//Masz szczęście! Już miałem wyklepać ci buźkę!
	Alarm						=	"SVM_7_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALARM!
	BehindYou					=	"SVM_7_BehindYou"					;//Za tobą!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Rozróba!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_7_CheerFight"					;//Chcę zobaczyć krew!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Załatw go!
	Ooh							=	"SVM_7_Ooh"							;//Oddaj mu, idioto!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Dobra!
	RunCoward					=	"SVM_7_RunCoward"					;//Biegnij! Wracaj do mamusi!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Facet ma już dość!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Sam jesteś sobie winien!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Zabójstwo przy świadkach to SAMObójstwo. Zapamiętaj moje słowa.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Niezła walka!
	Awake						=	"SVM_7_Awake"						;//Pora wstawać!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_7_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_7_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Oślepłeś?! Tutaj!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_7_HeyYou"						;//Hej, ty
	NotNow						=	"SVM_7_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Czego ode mnie chcesz?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Co mogę dla ciebie zrobić?
	MakeWay						=	"SVM_7_MakeWay"						;//Przepuść mnie.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Zejdź mi z drogi!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Szukasz kłopotów? Wynoś się stąd!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Ciągle szukasz guza?
	LookAway					=	"SVM_7_LookAway"					;//Ja NIC nie widziałem!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Co to było?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Oddaj mi broń!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Daj mi to!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Dobra, zatrzymaj to sobie! Jakoś przeżyję!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Poległ jeden z naszych! Musimy go pomścić.
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Dlaczego mnie obudziłeś?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Należało ci się porządne lanie!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Pobiłeś Magnata. Jest na ciebie wściekły.
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Pokonałeś Guru! Przyciągasz kłopoty jak jakiś magnes!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Pokonałeś maga! To nie był najlepszy sposób!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//A więc to ty nie dajesz spokoju Nowicjuszom!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Zostaw moich przyjaciół w spokoju!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Zadarłeś z niewłaściwym człowiekiem! Tutaj lepiej nie robić sobie wrogów.
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Nie tolerujemy tu wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Jeśli wejdziesz w drogę któremuś z moich podopiecznych, pożałujesz!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Ty biedny dupku! Jak śmiesz mnie okradać! Nigdy więcej tego nie próbuj.
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Oddawaj nam nasze rzeczy!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Okradłeś Magnatów! Co ci strzeliło do głowy?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Okradłeś Guru? Szkoda tylko, że dałeś się złapać!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Okradłeś maga! To nienajlepszy pomysł!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Jeden z naszych ludzi nie żyje, a ty maczałeś w tym palce. Następny podejrzany ruch i będziesz martwy!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Spuściłeś mi niezłe baty, stary. To była dobra walka, ale już się skończyła!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Nie próbuj ze mną tych magicznych sztuczek!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Przestań! Natychmiast!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Schowaj broń!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Schowaj broń, albo się zdenerwują!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Schowaj broń, idioto!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Śmiesz we mnie celować, psie?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Uważaj!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Dobra, zapomnijmy o naszej małej sprzeczce.
	Strange						=	"SVM_8_Strange"						;//Wyłaź! Wiem, że mnie słyszysz!
	DieMonster					=	"SVM_8_DieMonster"					;//Przeklęte stwory!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Teraz zginiesz. To nic osobistego. Sam rozumiesz...
	NowWait						=	"SVM_8_NowWait"						;//Ty śmieciu! Masz czelność atakować MNIE! Zaczekaj no...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Czy ja ci już kiedyś nie przyłożyłem? No cóż, będzie powtórka...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Kto nie chce słuchać, musi poczuć!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Śmiesz się tu pokazywać? Czekaj ty...
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Chyba ktoś musi ci wreszcie dać po łapach.
	DirtyThief					=	"SVM_8_DirtyThief"					;//Lepiej by było dla ciebie, gdybyś tego nie ukradł!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Nikt nie będzie podskakiwał moim chłopcom!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Zabiłeś jednego z naszych! To był twój ostatni błąd!
	Dead						=	"SVM_8_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Jeszcze tego pożałujesz!
	YesYes						=	"SVM_8_YesYes"						;//Spokojnie! Wszystko jest w porządku!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Wolałbym oglądać tę bestię z dystansu!
	Help						=	"SVM_8_Help"						;//Szybko! Wiejmy stąd!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Jeszcze się spotkamy!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Spróbuj tego jeszcze raz, a pożałujesz!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Podoba mi się twoja broń!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Założę się, że nie zapłaciłeś mi jeszcze podatku od bezpieczeństwa!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//No jasne: skąd taki frajer jak ty miałby wziąć rudę!
	HandsOff					=	"SVM_8_HandsOff"					;//Łapy precz!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Precz stąd!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Jak się tu dostałeś?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Mały spryciarz z ciebie, co?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hej, ty! Czemu się tak skradasz?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Zmykaj stąd, albo wezwę straże!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Czego tu szukałeś?
	WiseMove					=	"SVM_8_WiseMove"					;//Masz szczęście!
	Alarm						=	"SVM_8_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_8_BehindYou"					;//Za tobą!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Zobaczmy no, kto się wziął za łby!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_8_CheerFight"					;//Tak! Dalej, dalej!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Świetnie! Nie popuszczaj mu!
	Ooh							=	"SVM_8_Ooh"							;//Nie daj się! Przyłóż mu!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Dobrze, dołóż mu! Jeszcze się rusza!
	RunCoward					=	"SVM_8_RunCoward"					;//Nigdy więcej się tu nie pokazuj!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Nuda!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Należało mu się!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//To było niepotrzebne. Teraz będziesz musiał ponieść konsekwencje.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//To była dobra walka.
	Awake						=	"SVM_8_Awake"						;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_8_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Jest tutaj.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_8_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_8_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Co mogę dla ciebie zrobić?
	MakeWay						=	"SVM_8_MakeWay"						;//Mogę przejść?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Zejdź mi z drogi!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Mam ci to wbić do tej zakutej pały? Rusz się!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Znowu szukasz kłopotów?
	LookAway					=	"SVM_8_LookAway"					;//Ahem... Piękny widok!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Dobrze! Weź to sobie!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Hej! Co to było?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Masz moją broń.
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Oddawaj! Natychmiast!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebuję!
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak się dowiem, kto to zrobił...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Co się dzieje?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Hę? Dostałeś baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Pokonałeś Magnata. Facet był pod wrażeniem.
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Pokonałeś jednego z Guru. Jestem pod wrażeniem. Ale już nigdy więcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Pokonać maga... musisz być dzielnym człowiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Wiesz, że wszyscy Nowicjusze są pod moją opieką, a mimo to śmiesz ich zaczepiać?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Atakując Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Lepiej nie wchodzić w drogę moim przyjaciołom!
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Spróbuj jeszcze raz zaczepić Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Jeśli jeszcze raz zaczepisz któregoś z moich protegowanych, skrócę cię o głowę.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Jak śmiesz się tu pokazywać, parszywy złodzieju?!
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Masz kilka rzeczy, które należą do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Człowieku! Okradłeś Magnatów?! Ale się wściekną.
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Pożyczyłeś sobie kilka rzeczy Guru, prawda?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Pożyczyłeś sobie kilka rzeczy należących do magów, prawda?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i będziesz gryzł ziemię!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Spuściłeś mi niezłe baty, stary. To była dobra walka, ale już się skończyła!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Nie chcemy tutaj żadnej magii!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Natychmiast przestań!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Chcesz mnie zaatakować?!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Schowasz to sam, czy mam ci pomóc?!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Uważaj gdzie celujesz!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Schowaj to!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hej! Uważaj!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Może zapomnimy o naszej małej sprzeczce...
	Strange						=	"SVM_9_Strange"						;//Pokaż się! Wiem, że mnie słyszysz.
	DieMonster					=	"SVM_9_DieMonster"					;//Te bestie mnożą się jak króliki!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Już po tobie!
	NowWait						=	"SVM_9_NowWait"						;//Pokażę ci, gdzie raki zimują!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Jesteś strasznie nachalny!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Kto nie chce słuchać, musi poczuć!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Przebrała się miarka, przybłędo.
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Ostrzegałem cię! Jak będziesz grzebał w moich rzeczach, dostaniesz po łapach!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Ty złodzieju! Ja ci pokażę!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Nikt nie będzie podskakiwał moim chłopcom!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Zabiłeś jednego z moich ludzi. Teraz ja zabiję ciebie!
	Dead						=	"SVM_9_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Już nie żyjesz! Tylko jeszcze o tym nie wiesz!
	YesYes						=	"SVM_9_YesYes"						;//Spokojnie! Nic się nie stało.
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Cholera, co za potwór.
	Help						=	"SVM_9_Help"						;//Szybko! Uciekajmy!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Jeszcze się zobaczymy!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Następnym razem wylądujesz w piachu!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Ta broń należy teraz do mnie.
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Ruda! Cóż, lepszy rydz niż nic.
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Nawet nie ma przy sobie rudy!
	HandsOff					=	"SVM_9_HandsOff"					;//Łapy precz, kolego!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Wynoś się stąd.
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Czego tu szukasz?!
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Próbujesz zrobić ze mnie idiotę?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hej, ty! Czemu się tak skradasz?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Wynoś się stąd, zanim wezwę strażników!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Czego tu szukałeś?
	WiseMove					=	"SVM_9_WiseMove"					;//Mądrala!
	Alarm						=	"SVM_9_Alarm"						;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_9_BehindYou"					;//Za tobą!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Zobaczmy, co potrafią...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Tak trzymać!
	CheerFight					=	"SVM_9_CheerFight"					;//Tak! Dalej, dalej!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Dobrze!
	Ooh							=	"SVM_9_Ooh"							;//Och! To musiało boleć!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Świetna robota, chłopcze!
	RunCoward					=	"SVM_9_RunCoward"					;//Nigdy więcej się tu nie pokazuj!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//No i po walce!
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Sam jesteś sobie winien!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//To było niepotrzebne. Teraz będziesz musiał ponieść konsekwencje.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//To była dobra walka.
	Awake						=	"SVM_9_Awake"						;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_9_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Za potęgę magii!
	SectGreetings				=	"SVM_9_SectGreetings"				;//Zbudź się!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Oślepłeś? Tutaj!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Jesteś już lepszy!
	HeyYou						=	"SVM_9_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_9_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//W czym mogę pomóc?
	MakeWay						=	"SVM_9_MakeWay"						;//Przepuść mnie.
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Odsuń się.
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//No już, z drogi!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Znowu szukasz kłopotów? Ciągle mi podpadasz.
	LookAway					=	"SVM_9_LookAway"					;//Taaa... Ładna dziś pogoda.
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Dobra! Zatrzymaj to sobie.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Co to było?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Policzę do trzech, a ty oddasz mi broń.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Oddawaj! Natychmiast!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebuję!
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak się dowiem, kto to zrobił...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Co się dzieje?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Hę? Dostałeś baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Powaliłeś Magnata! Facet był pod wrażeniem!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Pokonałeś jednego z Guru. Jestem pod wrażeniem. Ale już nigdy więcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Pokonać maga... musisz być dzielnym człowiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Co ci odbiło, żeby tak atakować Nowicjusza?
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Co ci strzeliło do głowy, żeby atakować Kopacza?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Pobiłeś mojego kumpla. Co to ma znaczyć?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Spróbuj jeszcze raz zaczepić Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Jesteś taki odważny czy taki głupi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Śmiesz się tu pokazywać? Czekaj ty...
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Nie ma nic gorszego od okradania naszych ludzi. Jeszcze tego pożałujesz!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Stary! Okradłeś Magnatów? Ale się wściekną!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Pożyczyłeś sobie kilka rzeczy Guru, prawda?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Pożyczyłeś sobie kilka rzeczy należących do magów, prawda?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i będziesz gryzł ziemię!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Dobra walka! Twój trening się opłacił!
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ... cóż, jeśli tak uważasz ...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ... to się chyba nigdy nie skończy ...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ... tak, pewnie masz rację ...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_9_Om"							;// Ommm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Żadnej magii!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Natychmiast przestań!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Schowaj broń!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Co ty wyprawiasz? Szukasz guza?!
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Schowasz to sam, czy mam ci pomóc?!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Jak nie przestaniesz we mnie celować, to oberwiesz!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hej! Uważaj! Chcesz dostać w ucho?!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Hej, stary! Zapomnijmy o tej sprzeczce, dobra?
	Strange						=	"SVM_10_Strange"						;//Wyłaź! Pokaż się!
	DieMonster					=	"SVM_10_DieMonster"						;//Skurczybyki!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Już po tobie!
	NowWait						=	"SVM_10_NowWait"						;//Czas zapłaty!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Chyba bardzo chcesz dostać w dziób, co?
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Porąbię cię na dzwona!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Ostrzegałem cię! Jak będziesz grzebał w moich rzeczach, dostaniesz po łapach!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Ty złodzieju! Zatłukę cię!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Nikt nie będzie podskakiwał moim kumplom!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Zabiłeś jednego z moich ludzi. Teraz ja zabiję ciebie!
	Dead						=	"SVM_10_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Jeszcze dostaniesz za swoje, bękarcie!
	YesYes						=	"SVM_10_YesYes"							;//Dobra, dobra! Wygrałeś!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Co za potwór! W nogi!
	Help						=	"SVM_10_Help"							;//Odwrót!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Jeszcze ci pokażę!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Spróbuj tego jeszcze raz, a pożałujesz!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Zabieram twoją broń!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Pożyczę sobie trochę twojej rudy!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Cholera, nawet nie masz rudy!
	HandsOff					=	"SVM_10_HandsOff"						;//Łapy przy sobie, szkodniku!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Wynoś się stąd!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hej! Skąd się tu wziąłeś?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Myślisz, że jestem taki głupi?!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hej, ty! Dlaczego tak się skradasz?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Wynoś się stąd, albo zawołam straż!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Czego tu szukałeś?
	WiseMove					=	"SVM_10_WiseMove"						;//Twoje szczęście.
	Alarm						=	"SVM_10_Alarm"							;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ALARM! INTRUZ!
	BehindYou					=	"SVM_10_BehindYou"						;//Za tobą!
	TheresAFight				=	"SVM_10_TheresAFight"					;//O! Bójka!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Mocniej!
	CheerFight					=	"SVM_10_CheerFight"						;//Nie oszczędzaj go!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Wykończ go!
	Ooh							=	"SVM_10_Ooh"							;//Nie daj sobie w kaszę dmuchać!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Przyłóż mu raz a dobrze!
	RunCoward					=	"SVM_10_RunCoward"						;//Wracaj, tchórzu!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Wystarczyło dmuchnąć, i gość sam by się przewrócił.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Należało mu się!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Już nie żyjesz! To cię oduczy zabijania niewinnych ludzi!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Dałeś mu nauczkę, nie ma co!
	Awake						=	"SVM_10_Awake"							;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Za potęgę magii!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Zbudź się!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Jest tam!
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Jesteś już lepszy!
	HeyYou						=	"SVM_10_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_10_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Jak mogę ci pomóc?
	MakeWay						=	"SVM_10_MakeWay"						;//Przepuść mnie.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Zejdź mi z drogi!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Mam ci to wbić do tej zakutej pały? Rusz się!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Znowu szukasz kłopotów?
	LookAway					=	"SVM_10_LookAway"						;//Mnie tu nie ma...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Co to było?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Oddaj mi moją broń!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Weź to sobie. I tak tego nie potrzebuję!
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Załatwili jednego z naszych. Jak dorwę tego, co to zrobił...
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Dlaczego mnie obudziłeś?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Hę? Dostałeś baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Powaliłeś jednego z Magnatów!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Pokonałeś jednego z Guru 
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Pokonałeś maga...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Zanim podniesiesz rękę na Nowicjusza, zastanów się nad konsekwencjami!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Ja tu dbam o porządek! Zostaw moich ludzi w spokoju!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Powaliłeś mojego przyjaciela!
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Spróbuj jeszcze raz zaczepić Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Zaczepianie moich protegowanych oznacza kłopoty!
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Nigdy więcej tego nie próbuj, złodzieju!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Masz kilka rzeczy, które należą do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Stary! Okradłeś Magnatów? Ale się wściekną!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Podobno pożyczyłeś sobie kilka rzeczy należących do Guru. Szkoda tylko, że dałeś się złapać!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Pożyczyłeś sobie kilka rzeczy należących do magów, prawda?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i będziesz gryzł ziemię!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Gratuluję! Wygrałeś! To była piękna walka.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ... to się chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Ani się waż używać czarów!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Natychmiast przestań!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Jeśli szukasz kłopotów, to trafiłeś na właściwego człowieka!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Odłóż to, albo dostaniesz!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Schowaj to!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Jesteś pewien, że chcesz mnie rozzłościć?!
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Co ty wyprawiasz? Przestań!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Może zapomnimy o naszej małej sprzeczce?
	Strange						=	"SVM_11_Strange"						;//Uch! Szlag by to! Gdzie on się podział?!
	DieMonster					=	"SVM_11_DieMonster"						;//Jak nie przestaną wchodzić mi w drogę, grozi im rychła zagłada!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Nie rób sobie wrogów, jeśli nie jesteś w stanie stawić im czoła. Giń!
	NowWait						=	"SVM_11_NowWait"						;//Byłoby dla ciebie lepiej, gdybyś tego nie zrobił!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Czy ja ci już kiedyś nie przyłożyłem? No cóż, będzie powtórka...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Kto nie chce słuchać, musi poczuć!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//No, przybłędo! Teraz dostaniesz nauczkę!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Chyba będę ci musiał dać po łapach!
	DirtyThief					=	"SVM_11_DirtyThief"						;//Kradzież nie popłaca!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Wkroczyłeś na mój teren. Teraz muszę cię zabić.
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Zabicie jednego z naszych to był poważny błąd.
	Dead						=	"SVM_11_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Byłoby dla ciebie lepiej, gdybyś tego nie zrobił!
	YesYes						=	"SVM_11_YesYes"							;//Dobra, dobra! Wygrałeś!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//To już za wiele!
	Help						=	"SVM_11_Help"							;//Odwrót!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Jeszcze się zobaczymy, koleś!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Nigdy więcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Twoja broń bardziej przyda się komuś, kto wie jak się z nią obchodzić!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//To miło z twojej strony, że dzielisz się ze mną swoją rudą!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Nic! Ani krzty rudy!
	HandsOff					=	"SVM_11_HandsOff"						;//Zabieraj swoje lepkie łapy!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Wynoś się stąd, albo ci pomogę!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hej, jak tu wlazłeś?!
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Nie ze mną te numery!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Co to ma być?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Ta chata należy do mnie! Wynoś się, albo zawołam straże!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Czego tu szukałeś? Spadaj, zanim zrobię ci krzywdę!
	WiseMove					=	"SVM_11_WiseMove"						;//No! I żeby mi to był ostatni raz!
	Alarm						=	"SVM_11_Alarm"							;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ALARM! INTRUZ!
	BehindYou					=	"SVM_11_BehindYou"						;//Za tobą!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Zobaczmy, co potrafią...
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//No już, śmiało!
	CheerFight					=	"SVM_11_CheerFight"						;//Przestań się z nim bawić!
	CheerFriend					=	"SVM_11_CheerFriend"					;//No dalej! To wszystko, na co cię stać?!
	Ooh							=	"SVM_11_Ooh"							;//Ups! Nie dobrze!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Mmmh! Nieźle!
	RunCoward					=	"SVM_11_RunCoward"						;//Nigdy więcej się tu nie pokazuj!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Piękny cios!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Nieważne! Zasłużył na to!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Zabiłeś go! Masz przechlapane!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Świetnie! Niezłe przedstawienie!
	Awake						=	"SVM_11_Awake"							;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_11_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Za potęgę magii!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Zbudź się!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Oślepłeś? Tutaj!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Jesteś już lepszy!
	HeyYou						=	"SVM_11_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_11_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Co mogę dla ciebie zrobić?
	MakeWay						=	"SVM_11_MakeWay"						;//Możesz mnie przepuścić?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Odsuń się!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Mam ci to wbić do tej zakutej pały? Rusz się!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Znowu szukasz kłopotów?
	LookAway					=	"SVM_11_LookAway"						;//Nie będę się do tego mieszał!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Dobrze! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_11_WhatsThat"						;//Co to było?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Masz moją broń!
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//No już, oddawaj!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Zatrzymaj to sobie!
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Dopadli jednego z naszych. Jak się dowiem, kto to zrobił...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Co się dzieje?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Dostałeś lanie? Należało ci się!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Pokonałeś jednego z Magnatów. Musisz być bardzo dzielny, albo bardzo... BARDZO głupi.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Pokonałeś jednego z Guru. 
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Pokonałeś maga... To chyba nienajlepszy pomysł.
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Dbam tu o zdrowie kilku osób, a ty jedną z nich pobiłeś...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Zaczepiając Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Kto włazi w drogę moim kumplom, włazi w drogę mnie!
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Zaczep jeszcze raz Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Jak śmiesz się tu jeszcze pokazywać, złodzieju?!
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Masz kilka rzeczy, które należą do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Stary! Okradłeś Magnatów? Ale się wściekną!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Pożyczyłeś sobie kilka rzeczy należących do Guru, tak?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Pożyczyłeś sobie kilka rzeczy należących do magów, prawda?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Złamałeś regułę nr 1: żadnego zabijania!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//To była piękna walka. Kości mnie jeszcze bolą. Ale teraz jest już po wszystkim!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ... to się chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_11_Om"								;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-Händler		Nach außen freundlich,jovial,Innen hinterhältig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Żadnej magii!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Ostrzegam cię! Żadnych czarów!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Co zamierzasz zrobić z tą bronią?!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Schowaj to!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Celujesz we mnie!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Jeśli natychmiast nie przestaniesz, będziesz miał kłopoty!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hej, ślepy jesteś, czy co?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Zapomnijmy o naszej małej sprzeczce, dobra?
	Strange						=	"SVM_12_Strange"						;//Ale był tutaj dosłownie chwilę temu! Dziwne.
	DieMonster					=	"SVM_12_DieMonster"						;//Pora wyrównać rachunki!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Czas zapłaty!
	NowWait						=	"SVM_12_NowWait"						;//Prosisz się o porządne lanie!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Dalej nie masz dość?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Dobra, sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Wyniosą cię stąd na noszach!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Ostrzegałem cię! Jak będziesz grzebał w moich rzeczach, dostaniesz po łapach!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Ty przeklęty złodzieju! Ja ci pokażę...
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Nikt nie będzie podskakiwał moim kolegom.
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Zabiłeś jednego z moich ludzi. Teraz ja zabiję ciebie!
	Dead						=	"SVM_12_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Jeszcze tego pożałujesz!
	YesYes						=	"SVM_12_YesYes"							;//Spokojnie! Wygrałeś!
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//To już za wiele! Spadam stąd!
	Help						=	"SVM_12_Help"							;//Cholera!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Następnym razem będzie trochę inaczej!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Nigdy więcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Podoba mi się ta broń!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Twoja ruda bardzo mi się przyda!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Szlag! Żadnej rudy!
	HandsOff					=	"SVM_12_HandsOff"						;//Łapy precz!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Wynoś się stąd!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hej! Skąd się tu wziąłeś?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Czy ja ci wyglądam na idiotę?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Dlaczego tak się skradasz?!
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Wynoś się stąd, albo wezwę straż!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Nie masz tu czego szukać!
	WiseMove					=	"SVM_12_WiseMove"						;//Szybko się uczysz!
	Alarm						=	"SVM_12_Alarm"							;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALARM!!!
	BehindYou					=	"SVM_12_BehindYou"						;//Uważaj!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Walka!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Przyłóż mu!
	CheerFight					=	"SVM_12_CheerFight"						;//Dobrze!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Powal go wreszcie!
	Ooh							=	"SVM_12_Ooh"							;//Uważaj, człowieku!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Najwyższy czas!
	RunCoward					=	"SVM_12_RunCoward"						;//Facet ucieka!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Mamy zwycięzcę!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Zasłużył na to!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Nie możesz tak po prostu zabijać ludzi. Teraz będziesz miał nie lada kłopoty.
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Co za walka!
	Awake						=	"SVM_12_Awake"							;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Witaj, przyjacielu!
	ALGreetings					=	"SVM_12_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Za potęgę magii!
	SectGreetings				=	"SVM_12_SectGreetings"					;//Zbudź się!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Tutaj!
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Jesteś już lepszy!
	HeyYou						=	"SVM_12_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_12_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//W czym mogę pomóc?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Czego chcesz?
	MakeWay						=	"SVM_12_MakeWay"						;//Przepuść mnie.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//No już, zejdź mi z drogi!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Ogłuchłeś, czy szukasz guza?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Ciągle szukasz kłopotów?
	LookAway					=	"SVM_12_LookAway"						;//Czy coś się stało? Bo ja NIC nie widziałem...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Dobra! Zatrzymaj to sobie.
	WhatsThat					=	"SVM_12_WhatsThat"						;//Co to było?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Chcę dostać moją broń!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//No cóż, trudno! Mam tego więcej.
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Dopadli jednego z naszych. Jak się dowiem, kto to zrobił...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hmmm? O co chodzi? Dlaczego mnie budzisz?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Hę? Dostałeś baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Powaliłeś Magnata! Facet był pod wrażeniem!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Pokonałeś jednego z Guru. Jestem pod wrażeniem. Ale już nigdy więcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Pokonać maga... musisz być dzielnym człowiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Oszalałeś? Dlaczego atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Co ci strzeliło do głowy, żeby atakować Kopacza?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Zaatakowałeś mojego kumpla. Mogę wiedzieć, dlaczego?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Spróbuj jeszcze raz zaczepić Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Śmiesz się tu jeszcze pokazywać, złodzieju?!
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Masz kilka rzeczy, które należą do nas, a my chcemy je dostać z powrotem.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Stary! Okradłeś Magnatów? Ale się wściekną!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Okradłeś Guru! Szkoda tylko, że dałeś się złapać.
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Magowie nie lubią jak ktoś grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Pokonałeś mnie w pięknym stylu, stary. Ale walka już skończona!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ... to się chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y´berion blind,	Mitläufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Żadnej magii!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Przestań, słyszysz? Przestań!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Schowaj broń!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Schowaj tę broń!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//We mnie celujesz? Poczekaj no...
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Nie celuj we mnie, jeśli ci życie miłe!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Co to ma znaczyć, do diabła?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Zapomnijmy o tym nieporozumieniu, dobrze?
	Strange						=	"SVM_13_Strange"						;//Gdzie on się podział?! To niemożliwe!
	DieMonster					=	"SVM_13_DieMonster"						;//Na kolację będzie mięso!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Twoja kolej! Bez litości!
	NowWait						=	"SVM_13_NowWait"						;//Za to cię zabiję!
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Chcesz spróbować szczęścia jeszcze raz?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Już nie żyjesz, przybłędo!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Odrąbię ci palce!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Przeklęty złodziej! Połamię ci ręce.
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//W tej okolicy to JA biję ludzi!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Zabiłeś jednego z naszych!
	Dead						=	"SVM_13_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Nawet nie zdążysz tego pożałować, gnido!
	YesYes						=	"SVM_13_YesYes"							;//Nie ma sprawy! Nic się nie stało!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Nie mam odpowiedniej broni! Ale jeszcze się spotkamy...
	Help						=	"SVM_13_Help"							;//Łaaaa... W nogi!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Jeszcze się spotkamy!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//Następnym razem cię wykończę!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Ładna broń! Twoja? Nie??? To świetnie!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Nie obrazisz się chyba, jeśli pożyczę trochę twojej rudy?
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Nie masz ani krzty rudy? Nawet okruszka?!
	HandsOff					=	"SVM_13_HandsOff"						;//Łapy precz, śmieciu!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Idź precz! Wynoś się stąd!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Czego tu szukasz?!
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Próbujesz mnie okpić?!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hej, ty! Dlaczego tak się skradasz?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Co tu robisz? Uciekaj, albo wezwę straż!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Nie masz tu czego szukać!
	WiseMove					=	"SVM_13_WiseMove"						;//Masz szczęście! Chętnie bym ci pokazał, gdzie raki zimują!
	Alarm						=	"SVM_13_Alarm"							;//Straż! Tutaj!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALARM!!!
	BehindYou					=	"SVM_13_BehindYou"						;//Za tobą!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Zobaczymy kto pierwszy trafi do piachu!
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Tak! Jeszcze raz!
	CheerFight					=	"SVM_13_CheerFight"						;//Chcę zobaczyć krew!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Wykończ go!
	Ooh							=	"SVM_13_Ooh"							;//Oddaj mu, idioto!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Taaak!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Taaa, spadaj!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Słabe przedstawienie! Facet potykał się w własne nogi!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Phi, należało mu się!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Zabójstwo przy świadkach to SAMObójstwo. Zapamiętaj moje słowa.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Niezła walka!
	Awake						=	"SVM_13_Awake"							;//(Ziewnięcie)
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Wszystko w porządku?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Za potęgę magii!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Zbudź się!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Oślepłeś? Tutaj!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Jesteś już lepszy!
	HeyYou						=	"SVM_13_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_13_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Co mogę dla ciebie zrobić?
	MakeWay						=	"SVM_13_MakeWay"						;//Przepuść mnie.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Zejdź mi z drogi!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Szukasz guza? Wynoś się stąd!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Ciągle szukasz kłopotów?
	LookAway					=	"SVM_13_LookAway"						;//Ja NIC nie widziałem!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Spokojnie! Weź to sobie!
	WhatsThat					=	"SVM_13_WhatsThat"						;//Co to było?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Oddaj mi moją broń!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Dobra! Zatrzymaj to sobie.
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Zginął jeden z naszych! Musimy go pomścić!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Dlaczego mnie obudziłeś?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Należało ci się porządne lanie!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Powaliłeś jednego z Magnatów! Jest na ciebie naprawdę wściekły!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Pokonałeś Guru. Zdajesz się przyciągać kłopoty jak magnes!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Pokonać maga... To nie był najlepszy pomysł!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//A więc to ty atakujesz Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Zostaw moich kumpli w spokoju!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Dobrze ci radzę! Nie zaczepiaj więcej moich kumpli!
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Nie tolerujemy tutaj wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Dobrze ci radzę! Nie zaczepiaj nigdy więcej moich protegowanych!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Nigdy więcej nie próbuj mnie okradać!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Chcemy z powrotem nasze rzeczy! Oddawaj je!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Okradłeś Magnata! Co ci do diabła strzeliło do głowy!
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Okradłeś Guru! Szkoda tylko, że dałeś się złapać.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Okradłeś magów! To nie był najlepszy pomysł!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Zginął jeden z naszych ludzi, a ty maczałeś w tym palce! Jeszcze jeden taki błąd a będzie po tobie.
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Spuściłeś mi niezłe baty, stary. To była dobra walka, ale już się skończyła!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ... to się chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzähler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Natychmiast przestań czarować!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Słyszysz?! Żadnych czarów!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Co zamierzasz zrobić z tą bronią?!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Schowaj broń!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Celujesz we mnie!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Możesz wreszcie przestać we mnie celować?!
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Uważaj, człowieku!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Zapomnijmy o tym nieporozumieniu, dobrze?
	Strange						=	"SVM_14_Strange"						;//Niezła sztuczka! Po prostu rozpłynął się w powietrzu!
	DieMonster					=	"SVM_14_DieMonster"						;//Uciążliwe stworzenie.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Muszę cię zabić... To nic osobistego. Sam rozumiesz...
	NowWait						=	"SVM_14_NowWait"						;//Na razie wystarczy!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Chyba nie szukasz znowu guza, co?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Sam się o to prosiłeś!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Nie zapraszałem cię tutaj!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//To moja własność! 
	DirtyThief					=	"SVM_14_DirtyThief"						;//Zabrałeś coś, co należało do mnie. Teraz mi za to zapłacisz!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Musisz się nauczyć postępować zgodnie z zasadami.
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Zabiłeś człowieka!
	Dead						=	"SVM_14_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Pożałujesz tego!
	YesYes						=	"SVM_14_YesYes"							;//Dobra, dobra!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Nie mam ochoty mierzyć się z takim przeciwnikiem.
	Help						=	"SVM_14_Help"							;//Muszę wracać do mych badań!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Jeszcze się spotkamy!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Nigdy więcej tego nie rób!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Wezmę tę broń!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Twoja ruda bardzo mi się przyda!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Nie masz rudy?!
	HandsOff					=	"SVM_14_HandsOff"						;//Ręce przy sobie!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Wynoś się stąd.
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Jak się tu dostałeś?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Chyba żartujesz!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Czemu tak się skradasz?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Wyjdź stąd, zanim wezwę straże!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Nie masz tu czego szukać, zrozumiano?
	WiseMove					=	"SVM_14_WiseMove"						;//Mądra decyzja!
	Alarm						=	"SVM_14_Alarm"							;//Straż! Tutaj! Tutaj!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//INTRUZ!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Za tobą!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Walka!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Jakie to... nieefektywne.
	CheerFriend					=	"SVM_14_CheerFriend"					;//To chyba dość męczące.
	Ooh							=	"SVM_14_Ooh"							;//To musiało boleć!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//Cóż, tak też można...
	RunCoward					=	"SVM_14_RunCoward"						;//Czegoś się nauczył!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//No i po wszystkim.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Należało mu się!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Dlaczego go zabiłeś? Teraz będziesz miał kłopoty!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Te walki są strasznie nudne!
	Awake						=	"SVM_14_Awake"							;//Chyba przysnąłem...
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Za potęgę magii!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Zbudź się!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Jest tutaj!
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Nie mogę cię niczego nauczyć. Brak ci doświadczenia.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Umiesz już wszystko. Spróbuj zająć się czymś innym.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Musisz się jeszcze wiele nauczyć zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Jesteś już lepszy!
	HeyYou						=	"SVM_14_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_14_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Co mogę dla ciebie zrobić?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Mogę ci jakoś pomóc?
	MakeWay						=	"SVM_14_MakeWay"						;//Odsuń się!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Pozwól mi przejść.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Idź sobie wreszcie!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Znowu szukasz kłopotów?
	LookAway					=	"SVM_14_LookAway"						;//Nie interesuje mnie, co tam robisz.
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Co to było?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Oddaj mi moją broń!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//A zresztą... I tak tego nie potrzebowałem.
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Zginął jeden z naszych ludzi. Jeśli znajdziemy winnego...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Przeszkadzasz mi w badaniach!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Słyszałem, że wpakowałeś się w jakąś kabałę...
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Powaliłeś Magnata! Facet był pod wrażeniem!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Pokonałeś jednego z Guru. Jestem pod wrażeniem. 
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Pokonać maga... no, no...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Wiesz, że Nowicjusze są pod moją ochroną, a mimo to ośmielasz się ich zaczepiać?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Atakując Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Lepiej nie wchodź w drogę moim przyjaciołom!
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Spróbuj jeszcze raz zaczepić Nowicjusza, a pożałujesz!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Zaczepianie moich protegowanych może cię kosztować życie!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Jak śmiesz się tu jeszcze pokazywać, złodzieju?!
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Masz kilka rzeczy, które należą do nas, a my chcemy je dostać z powrotem.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Stary! Okradłeś Magnatów? Ale się wściekną!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Pożyczyłeś sobie kilka rzeczy należących do Guru, tak?
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Pożyczyłeś sobie kilka rzeczy należących do magów, prawda?
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Zabiłeś jednego z naszych! Jeszcze jeden taki wybryk, a przyjdzie kolej na ciebie!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Zabiłeś Magnata! Stary, odbiło ci?!
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Zabiłeś Guru! Nie mogę w to uwierzyć!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Zabiłeś maga! Jak zamierzasz się z tego wytłumaczyć?!
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Zginął członek Starego Obozu i twoje imię padło w związku z tą sprawą...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Nowy Obóz poniósł niepowetowaną stratę, i wygląda na to, że maczałeś w tym palce!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Bractwo utraciło jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//Nie łatwo będzie to teraz odkręcić!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Pokonałeś mnie w pięknym stylu, stary. Ale walka już skończona!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ... jeśli myślisz, że ...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ... może ...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ... to nie było zbyt mądre ...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ... lepiej się do tego nie mieszać ...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ... od razu wiedziałem, że będą kłopoty ...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieć ...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ... to się już więcej nie powtórzy ...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ... w tej historii musi być jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ... musisz uważać na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ... tak długo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ... nie powinieneś wierzyć we wszystko ...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ... nie chciałbym być teraz w jego skórze ...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ... niektórzy nigdy się nie nauczą ...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ... kiedyś takie sprawy załatwiało się inaczej ...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ... ludzie zawsze gadają ...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ... mam już dość tej paplaniny ...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie można polegać, ot co! ...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ... to się chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ... pewnie masz rację ...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ... czekaj. Lepiej się w nic nie pakować ...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ... myślałem, że to się skończyło już dawno temu ...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ... pogadajmy lepiej o czymś innym ...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hej, ty!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Czekaj no!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Zbudź się!
	ALGreetings				=	"SVM_15_ALGreetings"				;//Za Gomeza!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Witaj!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Cześć!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaarg!
	Awake					=	"SVM_15_Awake"						;//(Budzi się)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nie działa.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, zepsuty.
	NeedKey					= 	"SVM_15_NeedKey"					;// Będę potrzebował klucza...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Nie mam już żadnych uniwersalnych kluczy...
	InvFull					= 	"SVM_15_InvFull"					;// Więcej nie dam rady unieść.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Odejdź! Nie wolno ci ze mną rozmawiać!
	Help						=	"SVM_16_Help"			;	//(Krzyk)
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaarg!
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverständlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//über Stimme 17, sind aber in halbwegsverständlichem orkisch-deutsch
												//Das hier überall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen ergänzt

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




