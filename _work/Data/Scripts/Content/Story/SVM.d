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
	StopMagic					=	"SVM_1_StopMagic"					;//Hej! ¯adnej magii!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Chcesz dostaæ w ucho? Natychmiast przestañ!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Schowaj broñ!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Schowaj natychmiast tê cholern¹ broñ!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Od³ó¿ to!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Chcesz dostaæ w ³eb? To wyceluj we mnie jeszcze raz!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Uwa¿aj! Spróbuj tego jeszcze raz, a rozwalê ci ³eb!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Zapomnijmy o ca³ej sprawie, dobra?
	Strange						=	"SVM_1_Strange"						;//Wy³aŸ st¹d, sukinsynu!
	DieMonster					=	"SVM_1_DieMonster"					;//Psia twoja maæ!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Ju¿ po tobie!
	NowWait						=	"SVM_1_NowWait"						;//Zaraz dostaniesz...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Widzê, ¿e chcesz oberwaæ, co?
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Jak z tob¹ skoñczê, nie bêdzie co zbieraæ!
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Ostrzega³em ciê, ¿ebyœ trzyma³ ³apy z dala od moich rzeczy!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Zap³acisz mi za to, z³odzieju!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Nikt nie bêdzie podskakiwa³ moim kumplom!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Powali³eœ jednego z naszych. Teraz ja ROZWALÊ ciebie!
	Dead						=	"SVM_1_Dead"						;//Aaaaarg!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aaargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aaargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aaargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Jeszcze po¿a³ujesz!
	YesYes						=	"SVM_1_YesYes"						;//Bez paniki! Wygra³eœ!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Cholera! W nogi!
	Help						=	"SVM_1_Help"						;//Szlag by to...!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Jeszcze siê spotkamy!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Spróbuj tego jeszcze raz, a po¿a³ujesz!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Niez³a broñ! Dawaj j¹!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Dziêki za rudê, BOHATERZE!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Biedny g³upcze, nawet nie masz przy sobie rudy!
	HandsOff					=	"SVM_1_HandsOff"					;//£apy precz!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Spadaj st¹d!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz³eœ?!
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Myœlisz, ¿e jestem taki g³upi?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej, ty? Co siê tak skradasz?!
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Won z mojej chaty, albo wezwê stra¿e!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Nie masz tu czego szukaæ! Spadaj!
	WiseMove					=	"SVM_1_WiseMove"					;//M¹dry ch³opiec!
	Alarm						=	"SVM_1_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALARM! INTRUZ!!!
	BehindYou					=	"SVM_1_BehindYou"					;//Za tob¹!
	TheresAFight				=	"SVM_1_TheresAFight"				;//A, rozróba!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_1_CheerFight"					;//Walczycie jak baby!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Wykoñcz go!
	Ooh							=	"SVM_1_Ooh"							;//Oddaj mu wreszcie!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Dawaj go!
	RunCoward					=	"SVM_1_RunCoward"					;//Wracaj, tchórzu!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Facet ma doœæ!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Nale¿a³o mu siê!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Dlaczego go zabi³eœ? Ju¿ po tobie!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Niez³a walka!
	Awake						=	"SVM_1_Awake"						;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Witaj
	ALGreetings					=	"SVM_1_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_1_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Jest tam!
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Wróæ, jak zdobêdziesz trochê doœwiadczenia.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_1_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_1_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Co mogê dla ciebie zrobiæ?
	MakeWay						=	"SVM_1_MakeWay"						;//Przepuœæ mnie!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//ZejdŸ mi z drogi, cz³owieku!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//G³uchy jesteœ? RUSZ SIÊ!!!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Znów szukasz k³opotów?
	LookAway					=	"SVM_1_LookAway"					;//Uhhhh! Nic nie widzia³em!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Co to by³o?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Paradujesz sobie z MOJ¥ broni¹!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Dawaj to!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebujê!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Za³atwili jednego z naszych. Jak dorwê tego, co to zrobi³...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Cholera, czemu mnie budzisz?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Dosta³eœ baty? Nale¿a³o ci siê!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Pobi³eœ Magnata! Jest na ciebie wœciek³y!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Powali³eœ Guru. Zdajesz siê przyci¹gaæ k³opoty jak magnes!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Pokona³eœ maga. To nie by³ najlepszy pomys³...
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Nie mo¿esz tak po prostu biæ Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Zostaw moich ch³opców w spokoju!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Pobi³eœ mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Nie tolerujemy tutaj takich jak ty!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Jak pobijesz któregoœ z moich podopiecznych, bêd¹ k³opoty!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Ty dupku! Jak œmiesz mnie okradaæ! Nigdy wiêcej tego nie próbuj!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Oddawaj nam nasze rzeczy! Ale ju¿!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Okrad³eœ Magnatów! Co ci strzeli³o do g³owy?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Okrad³eœ Guru? Szkoda tylko, ¿e da³eœ siê z³apaæ!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Okrad³eœ magów? Brak ci pi¹tej klepki, czy co?
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Jeden z naszych ludzi nie ¿yje, a ty macza³eœ w tym palce. Nastêpny podejrzany ruch i bêdziesz martwy!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//Nie ³atwo bêdzie to odkrêciæ!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//To by³a uczciwa walka! NieŸle mi siê oberwa³o, stary!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ... co za gówno ...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ... mo¿e, ale kogo to obchodzi? ...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ... g³upota ...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ... nie mój problem ...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ... dlaczego zawsze tak siê dzieje? ...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ... to siê ju¿ nie powtórzy ...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ... skoñcz tê paplaninê, co? ...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ... ja tam siê nie mieszam ...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ... by³ czas, kiedy takie sprawy za³atwiano inaczej ...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ... nie bêdê dalej s³ucha³ tej paplaniny ...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_1_Om"							;//Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschüchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//¯adnej magii!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//Hej! Powiedzia³em: ¿adnej magii!
	WeaponDown					=	"SVM_2_WeaponDown"					;//No ju¿, schowaj to!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Schowaj broñ!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Uwa¿aj gdzie celujesz, baranie!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Wyceluj we mnie jeszcze raz to siê zdenerwujê!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hej, co to ma znaczyæ?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Zapomnijmy o ca³ej sprawie, dobra?
	Strange						=	"SVM_2_Strange"						;//Dziwne! Gdzie on siê podzia³?!
	DieMonster					=	"SVM_2_DieMonster"					;//Jeszcze jeden!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Obawiam siê, ¿e muszê z tob¹ skoñczyæ!
	NowWait						=	"SVM_2_NowWait"						;//Sam jesteœ sobie winien!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Wci¹¿ nie masz doœæ?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Có¿, skoro tego chcesz!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Wiesz, ¿e nie masz tu czego szukaæ!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Trzymaj ³apy z dala o rzeczy, które nie nale¿¹ do ciebie!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Okrad³eœ mnie! Nie darujê ci tego!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Nikt nie bêdzie podskakiwa³ moim ch³opcom!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Zabi³eœ jednego z nas! Zap³acisz za to!
	Dead						=	"SVM_2_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Jeszcze po¿a³ujesz!
	YesYes						=	"SVM_2_YesYes"						;//Spokojnie, spokojnie, wygra³eœ!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Ja... eee... pójdê zawo³aæ pomoc!
	Help						=	"SVM_2_Help"						;//Nie mam czasu, muszê jeszcze coœ za³atwiæ!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Zobaczysz, jeszcze siê spotkamy
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Nigdy wiêcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//JA wezmê tê broñ!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//I tak nie potrzebujesz tej rudy!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Nie masz rudy? To chyba nie jest twój szczêœliwy dzieñ!
	HandsOff					=	"SVM_2_HandsOff"					;//£apy precz!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Wynoœ siê st¹d!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz³eœ?!
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Nie próbuj robiæ ze mnie g³upca, albo po¿a³ujesz!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Czemu siê tak skradasz?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Precz z mojej chaty, albo wezwê stra¿e!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Trzymaj siê z dala od naszych chat!
	WiseMove					=	"SVM_2_WiseMove"					;//M¹dra decyzja!
	Alarm						=	"SVM_2_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ALARM!!
	BehindYou					=	"SVM_2_BehindYou"					;//Za tob¹!
	TheresAFight				=	"SVM_2_TheresAFight"				;//A, rozróba!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//To ju¿ wszystko?!
	CheerFight					=	"SVM_2_CheerFight"					;//No obudŸ siê, królewno!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Niez³y cios!
	Ooh							=	"SVM_2_Ooh"							;//Musia³o boleæ!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Jeszcze siê rusza.
	RunCoward					=	"SVM_2_RunCoward"					;//Zostañ tu, miêczaku!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Facet ma doœæ!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Nale¿a³o mu siê!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Zabi³eœ go! Nie by³o innego wyjœcia?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Niez³a walka, ale ciut za krótka.
	Awake						=	"SVM_2_Awake"						;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_2_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_2_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Tutaj.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_2_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_2_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Co mogê dla ciebie zrobiæ?
	MakeWay						=	"SVM_2_MakeWay"						;//Przepuœæ mnie!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//ZejdŸ mi z drogi!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Z³aŸ mi z drogi, albo oberwiesz w ucho!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Znowu szukasz k³opotów?
	LookAway					=	"SVM_2_LookAway"					;//Ja NIC nie widzia³em! Nie ma sprawy!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Dobra! WeŸ to sobie!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Co? Jak?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Hej, czy to nie jest przypadkiem moja broñ?!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//No ju¿, daj mi to!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//I tak nie bêdê tego potrzebowa³!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Ktoœ za³atwi³ jednego z naszych. Jak dorwiemy faceta - wyl¹duje w piachu.
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Czemu mnie obudzi³eœ?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Dosta³eœ w dziób? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Pokona³eœ Magnata!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Powali³eœ Guru?! Nie wiem czy to jeszcze odwaga, czy ju¿ g³upota!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Pokonaæ maga... musisz byæ dzielnym cz³owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Dbam tutaj o porz¹dek!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Niewa¿ne, o co posz³o! Atakuj¹c Kopacza prosisz siê o k³opoty!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Pobi³eœ mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Zostaw Nowicjuszy w spokoju!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//¯adnej rozróby z moimi ch³opcami! Zrozumiano?!
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Dlaczego mnie okrad³eœ?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Masz tu coœ, co nale¿y do nas, a my chcemy to z powrotem!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Stary! Okrad³eœ Magnatów! Ale siê wœciekn¹.
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Okrad³eœ Guru! Masz szczêœcie, ¿e ciê nie z³apali!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Magowie nie lubi¹, gdy ktoœ grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Wiesz jak trudno jest coœ takiego odkrêciæ?!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Tak, pokona³eœ mnie! To by³a piêkna walka, ale teraz daj ju¿ sobie spokój!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ... ale nie chcia³bym byæ w jego skórze ...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ... w¹tpiê, ¿eby to siê kiedyœ zmieni³o ...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ... zapewne masz racjê ...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//¯adnej magii!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Natychmiast przestañ! ¯adnej magii!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Jak nie przestaniesz tym wymachiwaæ, ktoœ siê w koñcu rozz³oœci!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Dlaczego we mnie celujesz?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Schowaj broñ, albo siê wkurzê!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Heeeej! Co to ma znaczyæ?!
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//No dobra, powiedzmy, ¿e ka¿dy z nas ma swoje racje!
	Strange						=	"SVM_3_Strange"						;//Znik³? Po prostu rozp³yn¹³ siê w powietrzu?
	DieMonster					=	"SVM_3_DieMonster"					;//Nie bêdziesz mnie wiêcej wkurzaæ, œmieciu!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Zaraz bêdzie po wszystkim!
	NowWait						=	"SVM_3_NowWait"						;//Chyba muszê byæ nieco bardziej dosadny!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Widzê, ¿e nadal nie masz doœæ!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sam siê prosi³eœ!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Nie powinno ciê tu byæ! Teraz muszê spuœciæ ci lanie!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Widzê, ¿e ktoœ musi ci daæ po ³apach, zanim zrozumiesz, co ci wolno, a czego nie!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Chcesz mnie okraœæ! Nie mogê w to uwierzyæ!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Nie mo¿esz tak po prostu praæ ka¿dego, kto nawinie ci siê pod rêkê.
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Zabi³eœ jednego z nas! To by³ b³¹d! Powa¿ny b³¹d!
	Dead						=	"SVM_3_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Po¿a³ujesz tego!
	YesYes						=	"SVM_3_YesYes"						;//Dobra! Wygra³eœ!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Cholera! W nogi!
	Help						=	"SVM_3_Help"						;//Muszê ju¿ iœæ!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Jeszcze siê spotkamy!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Nigdy wiêcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Dziêki za broñ!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Po¿yczê sobie trochê twojej rudy!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Nie masz rudy? Ty biedny g³upcze!
	HandsOff					=	"SVM_3_HandsOff"					;//£apy precz!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Spadaj!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz³eœ?!
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Nie jestem taki g³upi!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Przestañ siê tak skradaæ!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Spadaj z mojej chaty, albo wezwê stra¿!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Co ty wyprawiasz? Jak ciê dorwê bêdziesz martwy!
	WiseMove					=	"SVM_3_WiseMove"					;//A! Czyli jednak wiesz, co dla ciebie dobre!
	Alarm						=	"SVM_3_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALARM!!
	BehindYou					=	"SVM_3_BehindYou"					;//Uwaga!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Bójka!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Przywal mu!
	CheerFight					=	"SVM_3_CheerFight"					;//Co ty robisz?!
	CheerFriend					=	"SVM_3_CheerFriend"					;//£adny cios!
	Ooh							=	"SVM_3_Ooh"							;//Ooooch!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Taaak! Dobra robota!
	RunCoward					=	"SVM_3_RunCoward"					;//Facet wzi¹³ nogi za pas!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//No i po facecie!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//Od d³u¿szego czasu mu siê nale¿a³o!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Goœæ przesta³ siê ruszaæ! Zabi³eœ go!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Ci¹gle tylko bójki i bójki...
	Awake						=	"SVM_3_Awake"						;//Kolejny dzieñ i znowu to samo!
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hej, stary!
	ALGreetings					=	"SVM_3_ALGreetings"					;//Za Gomeza, tak, tak!
	MageGreetings				=	"SVM_3_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_3_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Jest tutaj.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_3_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_3_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Czego sobie ¿yczysz?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Co mogê dla ciebie zrobiæ?
	MakeWay						=	"SVM_3_MakeWay"						;//ZejdŸ mi z drogi!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Z³aŸ mi z drogi, cz³owieku!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Ile razy mam ci powtarzaæ? ZejdŸ mi z drogi!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Znowu szukasz guza?!
	LookAway					=	"SVM_3_LookAway"					;//Ja NIC nie widzia³em! Nawet mnie tu nie by³o!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Dobra, zatrzymaj to sobie!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Co to by³o?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Masz mój orê¿!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Oddawaj to!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Jak sobie ¿yczysz! Ja i tak tego nie potrzebujê!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Zabili jeszcze jednego z naszych. Nikt z nas nie wyjdzie st¹d ¿ywy!
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Dlaczego odrywasz mnie o moich snów?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Nale¿a³o ci siê porz¹dne lanie!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Pokona³eœ Magnata! Szukasz k³opotów, co?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Pokona³eœ jednego z Guru. Nigdy ci tego nie zapomn¹!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Zwyciêstwo nad magiem œci¹gnie na ciebie nie lada k³opoty!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Nastêpnym razem lepiej zostaw Nowicjuszy w spokoju.
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Rusz tylko któregoœ z Kopaczy, a nie dadz¹ ci spokoju do koñca ¿ycia!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Pobi³eœ mojego kumpla...
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Nowicjusze s¹ pod moj¹ ochron¹! Zostaw ich w spokoju!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Kopacze p³ac¹ mi za bezpieczeñstwo, wiêc lepiej nie sprawiaj im k³opotów!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Próbujesz mnie okraœæ, przeklêty z³odzieju!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Masz pewne rzeczy, które nale¿¹ do nas. Lepiej od razu je oddaj...
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Cz³owieku! Okrad³eœ Magnatów?! Ale siê wœciekn¹.
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Okrad³eœ Guru! Szkoda tylko, ¿e da³eœ siê z³apaæ.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Próbuj¹c okraœæ maga musisz byæ bardziej ostro¿ny!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//To by³a uczciwa walka! Nie mam do ciebie ¿alu, ¿e mnie powali³eœ!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ... zapewne masz racjê ...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//¯adnej magii!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Pos³uchaj mojej rady i daruj sobie te czary-mary!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Od³ó¿ broñ, chyba ¿e szukasz guza!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//No ju¿, od³ó¿ broñ!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Uwa¿aj, jak tym wymachujesz!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Jak siê nie uspokoisz, zabiorê ci tê zabawkê!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hej, ty! Uwa¿aj sobie!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Zapomnijmy o naszej sprzeczce.
	Strange						=	"SVM_4_Strange"						;//WychodŸ! Poka¿ siê!
	DieMonster					=	"SVM_4_DieMonster"					;//Niewa¿ne ilu zabijesz. Wci¹¿ przychodz¹ nastêpni!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//To ju¿ koniec twojej drogi!
	NowWait						=	"SVM_4_NowWait"						;//Nauczê ciê, ¿e lepiej schodziæ mi z drogi...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Ci¹gle nie masz doœæ?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Biedny g³upcze. Lepiej mi by³o nie przeszkadzaæ.
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Jeœli myœlisz, ¿e pozwolê ci siê tu tak szwendaæ, to jesteœ w b³êdzie!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Oœmieli³eœ siê mnie okraœæ!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Wchodzenie nam w drogê nie wyjdzie ci na dobre.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Zabi³eœ jednego z nas! Oko za oko!
	Dead						=	"SVM_4_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Jeszcze po¿a³ujesz!
	YesYes						=	"SVM_4_YesYes"						;//Spokojnie, wygra³eœ!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Wynoœmy siê st¹d i to szybko!
	Help						=	"SVM_4_Help"						;//Robiê siê na to za stary!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Nie zapomnê ci tego zbyt szybko!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Nigdy wiêcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Chyba po¿yczê sobie twoj¹ broñ!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Myœlê, ¿e lepiej wykorzystam twoj¹ rudê!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Nie masz nawet marnej bry³ki rudy!
	HandsOff					=	"SVM_4_HandsOff"					;//£apy precz!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Spadaj st¹d!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Nie masz tu czego szukaæ!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Nie jestem w nastroju na takie wyg³upy!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hej, ty! Czemu siê tak skradasz?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Wynoœ siê st¹d, zanim wezwê stra¿ników!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Czego tu szuka³eœ?
	WiseMove					=	"SVM_4_WiseMove"					;//Masz szczêœcie...
	Alarm						=	"SVM_4_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//INTRUZ!
	BehindYou					=	"SVM_4_BehindYou"					;//Za tob¹!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Nastêpna bójka.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_4_CheerFight"					;//Tylko na to ciê staæ?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Przy³ó¿ mu!
	Ooh							=	"SVM_4_Ooh"							;//Oddaj mu!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Dobra robota!
	RunCoward					=	"SVM_4_RunCoward"					;//Ten tchórz ucieka!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Za moich czasów walczono jak nale¿y!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Sam sobie na to zas³u¿y³eœ!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Zabi³eœ go! To wielki b³¹d!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Dawniej walki by³y du¿o lepsze.
	Awake						=	"SVM_4_Awake"						;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_4_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_4_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Znajdziesz go tutaj!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_4_HeyYou"						;//Hej tam!
	NotNow						=	"SVM_4_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Czego sobie ¿yczysz?
	MakeWay						=	"SVM_4_MakeWay"						;//Pozwól mi przejœæ!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//ZajdŸ mi z drogi, w tej chwili!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Z³aŸ mi z drogi, albo oberwiesz w ucho!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Nadal szukasz k³opotów?
	LookAway					=	"SVM_4_LookAway"					;//Nic nie widzia³em, nic nie s³ysza³em...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Co to by³o?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//B¹dŸ mi³ym ch³opcem i oddaj mi tê broñ!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//No ju¿, daj mi to!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Albo nie! I tak chcia³em siê tego pozbyæ!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Ja dopadnê tego, kto za³atwi³ jednego z naszych...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Zak³ócasz mój odpoczynek!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Dosta³eœ w ³eb? Od pocz¹tku nale¿a³o ci siê porz¹dne lanie!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Pokona³eœ Magnata!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Pokona³eœ jednego z Guru. Jestem pod wra¿eniem. Ale ju¿ nigdy wiêcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Pokonaæ maga... musisz byæ dzielnym cz³owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Oszala³eœ? Dlaczego bez powodu atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Co ci strzeli³o do g³owy, ¿eby atakowaæ Kopacza?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Podpad³eœ mojemu kumplowi. Teraz masz przechlapane!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Podnieœ jeszcze raz rêkê na Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Jesteœ taki odwa¿ny czy taki g³upi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Trzymaj ³apy z dala od moich rzeczy, zrozumiano?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Masz coœ, co nale¿y do nas. Teraz nam to oddasz!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Cz³owieku! Okrad³eœ Magnatów?! Ale siê wœciekn¹.
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Okrad³eœ Guru! Szkoda tylko, ¿e da³eœ siê z³apaæ.
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Magowie nie lubi¹ jak ktoœ grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//W Nowym Obozie przedwczeœnie zwolni³ siê jeden lokal, i wygl¹da na to, ¿e to twoja wina...
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//Nie bêdzie ³atwo to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//NieŸle mnie spra³eœ, stary! To by³a uczciwa walka, ale ju¿ siê skoñczy³a!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_4_Om"							;//Ommm
};


instance SVM_5 (C_SVM)				//Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//¯adnego czarowania!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Dobrze ci radzê! ¯adnej magii!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Co chcesz zrobiæ z t¹ broni¹, cz³owieku?!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//No ju¿, schowaj tê broñ!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Przestañ we mnie celowaæ, ba³wanie!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Jak natychmiast nie przestaniesz, zrobiê z ciebie kotlety!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, œlepy jesteœ, czy co?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Mo¿e zapomnijmy o naszej ma³ej sprzeczce, dobra?
	Strange						=	"SVM_5_Strange"						;//Ale by³ tutaj chwilê temu?! Dziwne!
	DieMonster					=	"SVM_5_DieMonster"					;//Twoja kolej, palancie!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Czas zap³aty!
	NowWait						=	"SVM_5_NowWait"						;//Prosisz siê o solidne lanie!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Nadal nie masz doœæ?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Dobra, sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Bêd¹ ciê wynosiæ na noszach!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Ostrzega³em ciê! Jak bêdziesz grzeba³ w moich rzeczach, dostaniesz po ³apach!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Ty z³odzieju! Ja ci poka¿ê!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Zadzieranie z moimi ch³opakami nie wyjdzie ci na dobre!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Zabi³eœ jednego z moich ludzi. Teraz ja zabijê ciebie!
	Dead						=	"SVM_5_Dead"					;//Aaarg!
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Jeszcze po¿a³ujesz!
	YesYes						=	"SVM_5_YesYes"						;//Spokojnie, wygra³eœ!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//To jak dla mnie trochê za du¿o!
	Help						=	"SVM_5_Help"						;//Cholera!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Nastêpnym razem bêdzie trochê inaczej!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Nigdy wiêcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Podoba mi siê twoja broñ!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Ja siê lepiej zaopiekujê twoj¹ rud¹!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Co za pech! ¯adnej rudy!
	HandsOff					=	"SVM_5_HandsOff"					;//£apy precz!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Wynoœ siê st¹d!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hej! Sk¹d siê tu wzi¹³eœ?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Dobry ¿art!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Czemu siê tak skradasz?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Wynoœ siê st¹d, zanim wezwê stra¿ników!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Nie masz tu czego szukaæ!
	WiseMove					=	"SVM_5_WiseMove"					;//Szybko siê uczysz!
	Alarm						=	"SVM_5_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALARM!
	BehindYou					=	"SVM_5_BehindYou"					;//Hej, uwa¿aj!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Rozróba!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Dalej!
	CheerFight					=	"SVM_5_CheerFight"					;//Œwietnie!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Przy³ó¿ mu wreszcie!
	Ooh							=	"SVM_5_Ooh"							;//Tylko uwa¿aj!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Najwy¿szy czas!
	RunCoward					=	"SVM_5_RunCoward"					;//Oho! Bierze nogi za pas!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Zwyciêzca, bez dwóch zdañ!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Zas³u¿y³ na to!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Tak po prostu zabiæ cz³owieka... Bêdziesz mia³ teraz niez³e k³opoty!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Co za walka!
	Awake						=	"SVM_5_Awake"						;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Witaj, przyjacielu!
	ALGreetings					=	"SVM_5_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_5_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Tutaj.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_5_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_5_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Czym mogê s³u¿yæ?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Czego chcesz?
	MakeWay						=	"SVM_5_MakeWay"						;//Przepuœæ mnie.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//No rusz siê, chcê przejœæ.
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//G³uchy jesteœ, czy szukasz k³opotów?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Nadal szukasz k³opotów?
	LookAway					=	"SVM_5_LookAway"					;//Ja NIC nie widzia³em! Nawet nie wiem, co siê sta³o!
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Dobra, zatrzymaj to sobie!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Co to by³o?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Wola³bym dostaæ z powrotem moj¹ broñ.
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Daj mi to!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Có¿, nie ma tego z³ego... Mam tego wiêcej!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak siê dowiem, kto to zrobi³...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Hej, co siê dzieje? Czemu mnie budzisz?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Hê? Dosta³eœ baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Pokona³eœ Magnata. Facet by³ pod wra¿eniem.
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Pokona³eœ jednego z Guru. Jestem pod wra¿eniem. Ale ju¿ nigdy wiêcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Pokonaæ maga... musisz byæ dzielnym cz³owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Oszala³eœ? Dlaczego bez powodu atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Co ci strzeli³o do g³owy, ¿eby atakowaæ Kopacza?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Powali³eœ mojego kumpla, a ja chcê wiedzieæ, dlaczego?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Podnieœ jeszcze raz rêkê na Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Jesteœ taki odwa¿ny czy taki g³upi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Œmiesz siê tu jeszcze pokazywaæ, parszywy z³odzieju?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Masz kilka rzeczy, które nale¿¹ do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Cz³owieku! Okrad³eœ Magnatów?! Ale siê wœciekn¹.
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Okrad³eœ Guru! Szkoda tylko, ¿e da³eœ siê z³apaæ.
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Magowie nie lubi¹ jak ktoœ grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i bêdziesz gryz³ ziemiê!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Spuœci³eœ mi niez³e baty, stary. To by³a dobra walka, ale ju¿ siê skoñczy³a!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//¯adnej magii!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Przestañ czarowaæ! Natychmiast!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Od³ó¿ tê cholern¹ broñ!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Chcesz oberwaæ? Schowaj tê broñ!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Schowaj broñ, albo siê wkurzê!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Jak nie przestaniesz we mnie celowaæ, to oberwiesz!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hej! Uwa¿aj!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hej, stary! Zapomnijmy o tej sprzeczce, dobra?
	Strange						=	"SVM_6_Strange"						;//Wy³aŸ! Poka¿ siê!
	DieMonster					=	"SVM_6_DieMonster"					;//Zrobiê z ciebie kotlety, ty wieprzu!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Ju¿ po tobie!
	NowWait						=	"SVM_6_NowWait"						;//Teraz dostaniesz baty...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Widzê, ¿e chcesz koniecznie dostaæ w ³eb!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Teraz ciê posiekam!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Ostrzega³em ciê! Jak bêdziesz grzeba³ w moich rzeczach, dostaniesz po ³apach!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Ty z³odzieju! Ja ci poka¿ê!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Nikt nie bêdzie podskakiwa³ moim ch³opcom!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Zabi³eœ jednego z moich ludzi. Teraz ja zabijê ciebie!
	Dead						=	"SVM_6_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Jeszcze po¿a³ujesz!
	YesYes						=	"SVM_6_YesYes"						;//Spokojnie! Bez nerwów! Wygra³eœ!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Cholera, co za potwór! Lepiej wzi¹æ nogi za pas!
	Help						=	"SVM_6_Help"						;//Szlag by to!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Jeszcze mnie popamiêtasz!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Spróbuj tego jeszcze raz, a po¿a³ujesz!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Podoba mi siê twoja broñ!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Dziêki za rudê! Wypijê za twoje zdrowie!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Szlag by ciê! Nie masz ani krztyny rudy!
	HandsOff					=	"SVM_6_HandsOff"					;//£apy precz!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Wynoœ siê st¹d!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hej! Jak tu wlaz³eœ?!
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Co jest? Myœlisz, ¿e jestem taki g³upi?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hej! Czemu siê tak skradasz?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Wynoœ siê st¹d zanim zawo³am stra¿!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Czego tu szuka³eœ?
	WiseMove					=	"SVM_6_WiseMove"					;//Masz szczêœcie...
	Alarm						=	"SVM_6_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_6_BehindYou"					;//Za tob¹!
	TheresAFight				=	"SVM_6_TheresAFight"				;//O! Walka!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_6_CheerFight"					;//Walczycie jak baby!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Wykoñcz go!
	Ooh							=	"SVM_6_Ooh"							;//Przestañ siê mazgaiæ! Oddaj mu!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//No ju¿! Facet jeszcze dycha!
	RunCoward					=	"SVM_6_RunCoward"					;//Wracaj, tchórzu!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Ma ju¿ doœæ.
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Nale¿a³o siê mu!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Jesteœ ju¿ martwy! To ciê oduczy zabijania niewinnych ludzi!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! No! Ale mu pokaza³eœ!
	Awake						=	"SVM_6_Awake"						;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_6_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_6_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Jest tam.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_6_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_6_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//W czym mogê pomóc?
	MakeWay						=	"SVM_6_MakeWay"						;//Przepuœæ mnie.
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//No ju¿, zejdŸ mi z drogi!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Spadaj! Mam ci to rêcznie wbiæ do tej zakutej pa³y?!
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Szukasz k³opotów?!
	LookAway					=	"SVM_6_LookAway"					;//Nic nie widzia³em! S³owo honoru!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Co to by³o?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Oddaj mi swoj¹ broñ, ¿artownisiu!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Daj mi to, stary!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Niewa¿ne! I tak tego nie potrzebowa³em!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak siê dowiem, kto to zrobi³...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Do diab³a! Czemu mnie obudzi³eœ?!
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Dosta³eœ têgie baty? Nale¿a³o ci siê!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Pobi³eœ Magnata. Jest na ciebie wœciek³y.
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Pokona³eœ Guru! Chyba przyci¹gasz k³opoty jak jakiœ magnes!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Pokonaæ maga... chyba jesteœ niespe³na rozumu!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Nie mo¿esz tak po prostu atakowaæ Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Zostaw moich ludzi w spokoju!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Napad³eœ na mojego przyjaciela...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Nie tolerujemy tu wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Spojrzyj krzywo na któregoœ z moich protegowanych, a bêd¹ k³opoty!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Sukinsynu! Próbujesz mnie okraœæ! Nigdy wiêcej tego nie rób!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Chcemy z powrotem nasze rzeczy! Oddawaj je!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Okrad³eœ Magnatów! Co ci strzeli³o do g³owy?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Okrad³eœ Guru? Szkoda tylko, ¿e da³eœ siê z³apaæ!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Okrad³eœ maga! To nienajlepszy pomys³!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Jeden z naszych ludzi nie ¿yje, a ty macza³eœ w tym palce. Nastêpny podejrzany ruch i bêdziesz martwy!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//NieŸle mnie spra³eœ, stary! To by³a uczciwa walka, ale ju¿ siê skoñczy³a!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Tylko nie to! Tylko nie to!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//¯adnej magii! ¯adnej magii!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Schowaj broñ! No, schowaj!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Mówiê serio! Schowaj to!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//We mnie celujesz?! Uwa¿aj sobie!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Myœlisz, ¿e dam siê zastraszyæ? To siê grubo mylisz!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Zapamiêtam to sobie! Uwa¿aj tylko!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Zapomnijmy o ca³ej sprawie, dobra?
	Strange						=	"SVM_7_Strange"						;//Gdzie on siê podzia³? No nie! To niemo¿liwe!
	DieMonster					=	"SVM_7_DieMonster"					;//Zat³ukê ciê, ty gnido!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Rozedrê ciê na strzêpy! Nie bêdê mia³ litoœci!
	NowWait						=	"SVM_7_NowWait"						;//Nareszcie! Teraz mam pretekst!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Chyba nie chcesz jeszcze raz spróbowaæ, co?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Krwi! Chcê twojej krwi!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Por¹biê ciê na dzwona!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Powinienem odr¹baæ ci palce!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty parszywy z³odzieju! Zap³acisz mi za to!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Ja tu jestem od bicia innych! Zrozumiano!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Zabi³eœ jednego z naszych!
	Dead						=	"SVM_7_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Nie po¿yjesz doœæ d³ugo, ¿eby zd¹¿yæ tego po¿a³owaæ.
	YesYes						=	"SVM_7_YesYes"						;//Dobra, dobra!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Nie mam teraz odpowiedniego orê¿a... Ale jeszcze siê spotkamy!
	Help						=	"SVM_7_Help"						;//Cholera!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Jeszcze siê spotkamy!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Nigdy wiêcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Zatrzymam sobie tê broñ!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Wola³bym ciê zabiæ, ale ruda te¿ mi siê przyda!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Nie masz rudy? Ty bezu¿yteczny œmieciu!
	HandsOff					=	"SVM_7_HandsOff"					;//Trzymaj ³apy przy sobie!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Spadaj! No ju¿! Won!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Jak tu wlaz³eœ?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Ty naprawdê próbujesz mnie zrobiæ w konia!
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hej, ty! Co siê tak skradasz?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Spadaj st¹d, albo wezwê stra¿e!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Nie masz tu czego szukaæ!
	WiseMove					=	"SVM_7_WiseMove"					;//Masz szczêœcie! Ju¿ mia³em wyklepaæ ci buŸkê!
	Alarm						=	"SVM_7_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALARM!
	BehindYou					=	"SVM_7_BehindYou"					;//Za tob¹!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Rozróba!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_7_CheerFight"					;//Chcê zobaczyæ krew!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Za³atw go!
	Ooh							=	"SVM_7_Ooh"							;//Oddaj mu, idioto!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Dobra!
	RunCoward					=	"SVM_7_RunCoward"					;//Biegnij! Wracaj do mamusi!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Facet ma ju¿ doœæ!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Sam jesteœ sobie winien!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Zabójstwo przy œwiadkach to SAMObójstwo. Zapamiêtaj moje s³owa.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Niez³a walka!
	Awake						=	"SVM_7_Awake"						;//Pora wstawaæ!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_7_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_7_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Oœlep³eœ?! Tutaj!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_7_HeyYou"						;//Hej, ty
	NotNow						=	"SVM_7_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Czego ode mnie chcesz?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Co mogê dla ciebie zrobiæ?
	MakeWay						=	"SVM_7_MakeWay"						;//Przepuœæ mnie.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//ZejdŸ mi z drogi!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Szukasz k³opotów? Wynoœ siê st¹d!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Ci¹gle szukasz guza?
	LookAway					=	"SVM_7_LookAway"					;//Ja NIC nie widzia³em!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Dobra, dobra! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Co to by³o?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Oddaj mi broñ!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Daj mi to!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Dobra, zatrzymaj to sobie! Jakoœ prze¿yjê!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Poleg³ jeden z naszych! Musimy go pomœciæ.
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Dlaczego mnie obudzi³eœ?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Nale¿a³o ci siê porz¹dne lanie!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Pobi³eœ Magnata. Jest na ciebie wœciek³y.
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Pokona³eœ Guru! Przyci¹gasz k³opoty jak jakiœ magnes!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Pokona³eœ maga! To nie by³ najlepszy sposób!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//A wiêc to ty nie dajesz spokoju Nowicjuszom!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Zostaw moich przyjació³ w spokoju!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Zadar³eœ z niew³aœciwym cz³owiekiem! Tutaj lepiej nie robiæ sobie wrogów.
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Nie tolerujemy tu wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Jeœli wejdziesz w drogê któremuœ z moich podopiecznych, po¿a³ujesz!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Ty biedny dupku! Jak œmiesz mnie okradaæ! Nigdy wiêcej tego nie próbuj.
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Oddawaj nam nasze rzeczy!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Okrad³eœ Magnatów! Co ci strzeli³o do g³owy?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Okrad³eœ Guru? Szkoda tylko, ¿e da³eœ siê z³apaæ!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Okrad³eœ maga! To nienajlepszy pomys³!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Jeden z naszych ludzi nie ¿yje, a ty macza³eœ w tym palce. Nastêpny podejrzany ruch i bêdziesz martwy!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Spuœci³eœ mi niez³e baty, stary. To by³a dobra walka, ale ju¿ siê skoñczy³a!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Nie próbuj ze mn¹ tych magicznych sztuczek!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Przestañ! Natychmiast!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Schowaj broñ!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Schowaj broñ, albo siê zdenerwuj¹!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Schowaj broñ, idioto!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Œmiesz we mnie celowaæ, psie?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Uwa¿aj!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Dobra, zapomnijmy o naszej ma³ej sprzeczce.
	Strange						=	"SVM_8_Strange"						;//Wy³aŸ! Wiem, ¿e mnie s³yszysz!
	DieMonster					=	"SVM_8_DieMonster"					;//Przeklête stwory!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Teraz zginiesz. To nic osobistego. Sam rozumiesz...
	NowWait						=	"SVM_8_NowWait"						;//Ty œmieciu! Masz czelnoœæ atakowaæ MNIE! Zaczekaj no...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Czy ja ci ju¿ kiedyœ nie przy³o¿y³em? No có¿, bêdzie powtórka...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Kto nie chce s³uchaæ, musi poczuæ!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Œmiesz siê tu pokazywaæ? Czekaj ty...
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Chyba ktoœ musi ci wreszcie daæ po ³apach.
	DirtyThief					=	"SVM_8_DirtyThief"					;//Lepiej by by³o dla ciebie, gdybyœ tego nie ukrad³!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Nikt nie bêdzie podskakiwa³ moim ch³opcom!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Zabi³eœ jednego z naszych! To by³ twój ostatni b³¹d!
	Dead						=	"SVM_8_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Jeszcze tego po¿a³ujesz!
	YesYes						=	"SVM_8_YesYes"						;//Spokojnie! Wszystko jest w porz¹dku!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Wola³bym ogl¹daæ tê bestiê z dystansu!
	Help						=	"SVM_8_Help"						;//Szybko! Wiejmy st¹d!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Jeszcze siê spotkamy!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Spróbuj tego jeszcze raz, a po¿a³ujesz!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Podoba mi siê twoja broñ!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Za³o¿ê siê, ¿e nie zap³aci³eœ mi jeszcze podatku od bezpieczeñstwa!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//No jasne: sk¹d taki frajer jak ty mia³by wzi¹æ rudê!
	HandsOff					=	"SVM_8_HandsOff"					;//£apy precz!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Precz st¹d!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Jak siê tu dosta³eœ?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Ma³y spryciarz z ciebie, co?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hej, ty! Czemu siê tak skradasz?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Zmykaj st¹d, albo wezwê stra¿e!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Czego tu szuka³eœ?
	WiseMove					=	"SVM_8_WiseMove"					;//Masz szczêœcie!
	Alarm						=	"SVM_8_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_8_BehindYou"					;//Za tob¹!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Zobaczmy no, kto siê wzi¹³ za ³by!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Mocniej!
	CheerFight					=	"SVM_8_CheerFight"					;//Tak! Dalej, dalej!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Œwietnie! Nie popuszczaj mu!
	Ooh							=	"SVM_8_Ooh"							;//Nie daj siê! Przy³ó¿ mu!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Dobrze, do³ó¿ mu! Jeszcze siê rusza!
	RunCoward					=	"SVM_8_RunCoward"					;//Nigdy wiêcej siê tu nie pokazuj!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Nuda!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Nale¿a³o mu siê!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//To by³o niepotrzebne. Teraz bêdziesz musia³ ponieœæ konsekwencje.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//To by³a dobra walka.
	Awake						=	"SVM_8_Awake"						;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_8_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_8_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Jest tutaj.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_8_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_8_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Co mogê dla ciebie zrobiæ?
	MakeWay						=	"SVM_8_MakeWay"						;//Mogê przejœæ?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//ZejdŸ mi z drogi!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Mam ci to wbiæ do tej zakutej pa³y? Rusz siê!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Znowu szukasz k³opotów?
	LookAway					=	"SVM_8_LookAway"					;//Ahem... Piêkny widok!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Dobrze! WeŸ to sobie!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Hej! Co to by³o?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Masz moj¹ broñ.
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Oddawaj! Natychmiast!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebujê!
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak siê dowiem, kto to zrobi³...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Co siê dzieje?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Hê? Dosta³eœ baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Pokona³eœ Magnata. Facet by³ pod wra¿eniem.
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Pokona³eœ jednego z Guru. Jestem pod wra¿eniem. Ale ju¿ nigdy wiêcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Pokonaæ maga... musisz byæ dzielnym cz³owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Wiesz, ¿e wszyscy Nowicjusze s¹ pod moj¹ opiek¹, a mimo to œmiesz ich zaczepiaæ?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Atakuj¹c Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Lepiej nie wchodziæ w drogê moim przyjacio³om!
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Spróbuj jeszcze raz zaczepiæ Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Jeœli jeszcze raz zaczepisz któregoœ z moich protegowanych, skrócê ciê o g³owê.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Jak œmiesz siê tu pokazywaæ, parszywy z³odzieju?!
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Masz kilka rzeczy, które nale¿¹ do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Cz³owieku! Okrad³eœ Magnatów?! Ale siê wœciekn¹.
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Po¿yczy³eœ sobie kilka rzeczy Guru, prawda?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do magów, prawda?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i bêdziesz gryz³ ziemiê!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Spuœci³eœ mi niez³e baty, stary. To by³a dobra walka, ale ju¿ siê skoñczy³a!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Nie chcemy tutaj ¿adnej magii!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Natychmiast przestañ!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Chcesz mnie zaatakowaæ?!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Schowasz to sam, czy mam ci pomóc?!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Uwa¿aj gdzie celujesz!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Schowaj to!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hej! Uwa¿aj!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Mo¿e zapomnimy o naszej ma³ej sprzeczce...
	Strange						=	"SVM_9_Strange"						;//Poka¿ siê! Wiem, ¿e mnie s³yszysz.
	DieMonster					=	"SVM_9_DieMonster"					;//Te bestie mno¿¹ siê jak króliki!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Ju¿ po tobie!
	NowWait						=	"SVM_9_NowWait"						;//Poka¿ê ci, gdzie raki zimuj¹!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Jesteœ strasznie nachalny!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Kto nie chce s³uchaæ, musi poczuæ!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Przebra³a siê miarka, przyb³êdo.
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Ostrzega³em ciê! Jak bêdziesz grzeba³ w moich rzeczach, dostaniesz po ³apach!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Ty z³odzieju! Ja ci poka¿ê!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Nikt nie bêdzie podskakiwa³ moim ch³opcom!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Zabi³eœ jednego z moich ludzi. Teraz ja zabijê ciebie!
	Dead						=	"SVM_9_Dead"						;//Aaarg!
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Ju¿ nie ¿yjesz! Tylko jeszcze o tym nie wiesz!
	YesYes						=	"SVM_9_YesYes"						;//Spokojnie! Nic siê nie sta³o.
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Cholera, co za potwór.
	Help						=	"SVM_9_Help"						;//Szybko! Uciekajmy!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Jeszcze siê zobaczymy!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Nastêpnym razem wyl¹dujesz w piachu!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Ta broñ nale¿y teraz do mnie.
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Ruda! Có¿, lepszy rydz ni¿ nic.
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Nawet nie ma przy sobie rudy!
	HandsOff					=	"SVM_9_HandsOff"					;//£apy precz, kolego!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Wynoœ siê st¹d.
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Czego tu szukasz?!
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Próbujesz zrobiæ ze mnie idiotê?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hej, ty! Czemu siê tak skradasz?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Wynoœ siê st¹d, zanim wezwê stra¿ników!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Czego tu szuka³eœ?
	WiseMove					=	"SVM_9_WiseMove"					;//M¹drala!
	Alarm						=	"SVM_9_Alarm"						;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ALARM! INTRUZ!
	BehindYou					=	"SVM_9_BehindYou"					;//Za tob¹!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Zobaczmy, co potrafi¹...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Tak trzymaæ!
	CheerFight					=	"SVM_9_CheerFight"					;//Tak! Dalej, dalej!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Dobrze!
	Ooh							=	"SVM_9_Ooh"							;//Och! To musia³o boleæ!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Œwietna robota, ch³opcze!
	RunCoward					=	"SVM_9_RunCoward"					;//Nigdy wiêcej siê tu nie pokazuj!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//No i po walce!
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Sam jesteœ sobie winien!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//To by³o niepotrzebne. Teraz bêdziesz musia³ ponieœæ konsekwencje.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//To by³a dobra walka.
	Awake						=	"SVM_9_Awake"						;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Witaj.
	ALGreetings					=	"SVM_9_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Za potêgê magii!
	SectGreetings				=	"SVM_9_SectGreetings"				;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Oœlep³eœ? Tutaj!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_9_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_9_NotNow"						;//Nie teraz!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//W czym mogê pomóc?
	MakeWay						=	"SVM_9_MakeWay"						;//Przepuœæ mnie.
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Odsuñ siê.
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//No ju¿, z drogi!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Znowu szukasz k³opotów? Ci¹gle mi podpadasz.
	LookAway					=	"SVM_9_LookAway"					;//Taaa... £adna dziœ pogoda.
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Dobra! Zatrzymaj to sobie.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Co to by³o?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Policzê do trzech, a ty oddasz mi broñ.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Oddawaj! Natychmiast!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Zatrzymaj to sobie! I tak tego nie potrzebujê!
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Dorwali jednego z naszych. Jak siê dowiem, kto to zrobi³...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Co siê dzieje?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Hê? Dosta³eœ baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Powali³eœ Magnata! Facet by³ pod wra¿eniem!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Pokona³eœ jednego z Guru. Jestem pod wra¿eniem. Ale ju¿ nigdy wiêcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Pokonaæ maga... musisz byæ dzielnym cz³owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Co ci odbi³o, ¿eby tak atakowaæ Nowicjusza?
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Co ci strzeli³o do g³owy, ¿eby atakowaæ Kopacza?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Pobi³eœ mojego kumpla. Co to ma znaczyæ?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Spróbuj jeszcze raz zaczepiæ Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Jesteœ taki odwa¿ny czy taki g³upi? Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Œmiesz siê tu pokazywaæ? Czekaj ty...
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Nie ma nic gorszego od okradania naszych ludzi. Jeszcze tego po¿a³ujesz!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Stary! Okrad³eœ Magnatów? Ale siê wœciekn¹!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Po¿yczy³eœ sobie kilka rzeczy Guru, prawda?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do magów, prawda?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i bêdziesz gryz³ ziemiê!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Dobra walka! Twój trening siê op³aci³!
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ... có¿, jeœli tak uwa¿asz ...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ... to siê chyba nigdy nie skoñczy ...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ... tak, pewnie masz racjê ...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_9_Om"							;// Ommm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//¯adnej magii!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Natychmiast przestañ!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Schowaj broñ!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Co ty wyprawiasz? Szukasz guza?!
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Schowasz to sam, czy mam ci pomóc?!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Jak nie przestaniesz we mnie celowaæ, to oberwiesz!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hej! Uwa¿aj! Chcesz dostaæ w ucho?!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Hej, stary! Zapomnijmy o tej sprzeczce, dobra?
	Strange						=	"SVM_10_Strange"						;//Wy³aŸ! Poka¿ siê!
	DieMonster					=	"SVM_10_DieMonster"						;//Skurczybyki!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Ju¿ po tobie!
	NowWait						=	"SVM_10_NowWait"						;//Czas zap³aty!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Chyba bardzo chcesz dostaæ w dziób, co?
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Por¹biê ciê na dzwona!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Ostrzega³em ciê! Jak bêdziesz grzeba³ w moich rzeczach, dostaniesz po ³apach!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Ty z³odzieju! Zat³ukê ciê!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Nikt nie bêdzie podskakiwa³ moim kumplom!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Zabi³eœ jednego z moich ludzi. Teraz ja zabijê ciebie!
	Dead						=	"SVM_10_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Jeszcze dostaniesz za swoje, bêkarcie!
	YesYes						=	"SVM_10_YesYes"							;//Dobra, dobra! Wygra³eœ!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Co za potwór! W nogi!
	Help						=	"SVM_10_Help"							;//Odwrót!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Jeszcze ci poka¿ê!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Spróbuj tego jeszcze raz, a po¿a³ujesz!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Zabieram twoj¹ broñ!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Po¿yczê sobie trochê twojej rudy!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Cholera, nawet nie masz rudy!
	HandsOff					=	"SVM_10_HandsOff"						;//£apy przy sobie, szkodniku!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Wynoœ siê st¹d!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hej! Sk¹d siê tu wzi¹³eœ?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Myœlisz, ¿e jestem taki g³upi?!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hej, ty! Dlaczego tak siê skradasz?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Wynoœ siê st¹d, albo zawo³am stra¿!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Czego tu szuka³eœ?
	WiseMove					=	"SVM_10_WiseMove"						;//Twoje szczêœcie.
	Alarm						=	"SVM_10_Alarm"							;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ALARM! INTRUZ!
	BehindYou					=	"SVM_10_BehindYou"						;//Za tob¹!
	TheresAFight				=	"SVM_10_TheresAFight"					;//O! Bójka!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Mocniej!
	CheerFight					=	"SVM_10_CheerFight"						;//Nie oszczêdzaj go!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Wykoñcz go!
	Ooh							=	"SVM_10_Ooh"							;//Nie daj sobie w kaszê dmuchaæ!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Przy³ó¿ mu raz a dobrze!
	RunCoward					=	"SVM_10_RunCoward"						;//Wracaj, tchórzu!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Wystarczy³o dmuchn¹æ, i goœæ sam by siê przewróci³.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Nale¿a³o mu siê!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Ju¿ nie ¿yjesz! To ciê oduczy zabijania niewinnych ludzi!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Da³eœ mu nauczkê, nie ma co!
	Awake						=	"SVM_10_Awake"							;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Za potêgê magii!
	SectGreetings				=	"SVM_10_SectGreetings"					;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Jest tam!
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_10_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_10_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Jak mogê ci pomóc?
	MakeWay						=	"SVM_10_MakeWay"						;//Przepuœæ mnie.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//ZejdŸ mi z drogi!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Mam ci to wbiæ do tej zakutej pa³y? Rusz siê!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Znowu szukasz k³opotów?
	LookAway					=	"SVM_10_LookAway"						;//Mnie tu nie ma...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Co to by³o?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Oddaj mi moj¹ broñ!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//WeŸ to sobie. I tak tego nie potrzebujê!
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Za³atwili jednego z naszych. Jak dorwê tego, co to zrobi³...
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Dlaczego mnie obudzi³eœ?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Hê? Dosta³eœ baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Powali³eœ jednego z Magnatów!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Pokona³eœ jednego z Guru 
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Pokona³eœ maga...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Zanim podniesiesz rêkê na Nowicjusza, zastanów siê nad konsekwencjami!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Ja tu dbam o porz¹dek! Zostaw moich ludzi w spokoju!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Powali³eœ mojego przyjaciela!
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Spróbuj jeszcze raz zaczepiæ Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Zaczepianie moich protegowanych oznacza k³opoty!
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Nigdy wiêcej tego nie próbuj, z³odzieju!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Masz kilka rzeczy, które nale¿¹ do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Stary! Okrad³eœ Magnatów? Ale siê wœciekn¹!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Podobno po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do Guru. Szkoda tylko, ¿e da³eœ siê z³apaæ!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do magów, prawda?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i bêdziesz gryz³ ziemiê!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Gratulujê! Wygra³eœ! To by³a piêkna walka.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ... to siê chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Ani siê wa¿ u¿ywaæ czarów!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Natychmiast przestañ!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Jeœli szukasz k³opotów, to trafi³eœ na w³aœciwego cz³owieka!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Od³ó¿ to, albo dostaniesz!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Schowaj to!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Jesteœ pewien, ¿e chcesz mnie rozz³oœciæ?!
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Co ty wyprawiasz? Przestañ!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Mo¿e zapomnimy o naszej ma³ej sprzeczce?
	Strange						=	"SVM_11_Strange"						;//Uch! Szlag by to! Gdzie on siê podzia³?!
	DieMonster					=	"SVM_11_DieMonster"						;//Jak nie przestan¹ wchodziæ mi w drogê, grozi im rych³a zag³ada!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Nie rób sobie wrogów, jeœli nie jesteœ w stanie stawiæ im czo³a. Giñ!
	NowWait						=	"SVM_11_NowWait"						;//By³oby dla ciebie lepiej, gdybyœ tego nie zrobi³!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Czy ja ci ju¿ kiedyœ nie przy³o¿y³em? No có¿, bêdzie powtórka...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Kto nie chce s³uchaæ, musi poczuæ!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//No, przyb³êdo! Teraz dostaniesz nauczkê!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Chyba bêdê ci musia³ daæ po ³apach!
	DirtyThief					=	"SVM_11_DirtyThief"						;//Kradzie¿ nie pop³aca!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Wkroczy³eœ na mój teren. Teraz muszê ciê zabiæ.
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Zabicie jednego z naszych to by³ powa¿ny b³¹d.
	Dead						=	"SVM_11_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//By³oby dla ciebie lepiej, gdybyœ tego nie zrobi³!
	YesYes						=	"SVM_11_YesYes"							;//Dobra, dobra! Wygra³eœ!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//To ju¿ za wiele!
	Help						=	"SVM_11_Help"							;//Odwrót!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Jeszcze siê zobaczymy, koleœ!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Nigdy wiêcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Twoja broñ bardziej przyda siê komuœ, kto wie jak siê z ni¹ obchodziæ!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//To mi³o z twojej strony, ¿e dzielisz siê ze mn¹ swoj¹ rud¹!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Nic! Ani krzty rudy!
	HandsOff					=	"SVM_11_HandsOff"						;//Zabieraj swoje lepkie ³apy!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Wynoœ siê st¹d, albo ci pomogê!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hej, jak tu wlaz³eœ?!
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Nie ze mn¹ te numery!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Co to ma byæ?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Ta chata nale¿y do mnie! Wynoœ siê, albo zawo³am stra¿e!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Czego tu szuka³eœ? Spadaj, zanim zrobiê ci krzywdê!
	WiseMove					=	"SVM_11_WiseMove"						;//No! I ¿eby mi to by³ ostatni raz!
	Alarm						=	"SVM_11_Alarm"							;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ALARM! INTRUZ!
	BehindYou					=	"SVM_11_BehindYou"						;//Za tob¹!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Zobaczmy, co potrafi¹...
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//No ju¿, œmia³o!
	CheerFight					=	"SVM_11_CheerFight"						;//Przestañ siê z nim bawiæ!
	CheerFriend					=	"SVM_11_CheerFriend"					;//No dalej! To wszystko, na co ciê staæ?!
	Ooh							=	"SVM_11_Ooh"							;//Ups! Nie dobrze!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Mmmh! NieŸle!
	RunCoward					=	"SVM_11_RunCoward"						;//Nigdy wiêcej siê tu nie pokazuj!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Piêkny cios!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Niewa¿ne! Zas³u¿y³ na to!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Zabi³eœ go! Masz przechlapane!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Œwietnie! Niez³e przedstawienie!
	Awake						=	"SVM_11_Awake"							;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_11_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Za potêgê magii!
	SectGreetings				=	"SVM_11_SectGreetings"					;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Oœlep³eœ? Tutaj!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_11_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_11_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Co mogê dla ciebie zrobiæ?
	MakeWay						=	"SVM_11_MakeWay"						;//Mo¿esz mnie przepuœciæ?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Odsuñ siê!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Mam ci to wbiæ do tej zakutej pa³y? Rusz siê!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Znowu szukasz k³opotów?
	LookAway					=	"SVM_11_LookAway"						;//Nie bêdê siê do tego miesza³!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Dobrze! Zatrzymaj to sobie!
	WhatsThat					=	"SVM_11_WhatsThat"						;//Co to by³o?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Masz moj¹ broñ!
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//No ju¿, oddawaj!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Zatrzymaj to sobie!
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Dopadli jednego z naszych. Jak siê dowiem, kto to zrobi³...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Co siê dzieje?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Dosta³eœ lanie? Nale¿a³o ci siê!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Pokona³eœ jednego z Magnatów. Musisz byæ bardzo dzielny, albo bardzo... BARDZO g³upi.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Pokona³eœ jednego z Guru. 
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Pokona³eœ maga... To chyba nienajlepszy pomys³.
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Dbam tu o zdrowie kilku osób, a ty jedn¹ z nich pobi³eœ...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Zaczepiaj¹c Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Kto w³azi w drogê moim kumplom, w³azi w drogê mnie!
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Zaczep jeszcze raz Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Jak œmiesz siê tu jeszcze pokazywaæ, z³odzieju?!
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Masz kilka rzeczy, które nale¿¹ do nas. Teraz je nam grzecznie oddasz.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Stary! Okrad³eœ Magnatów? Ale siê wœciekn¹!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do Guru, tak?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do magów, prawda?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Z³ama³eœ regu³ê nr 1: ¿adnego zabijania!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//To by³a piêkna walka. Koœci mnie jeszcze bol¹. Ale teraz jest ju¿ po wszystkim!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ... to siê chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_11_Om"								;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-Händler		Nach außen freundlich,jovial,Innen hinterhältig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//¯adnej magii!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Ostrzegam ciê! ¯adnych czarów!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Co zamierzasz zrobiæ z t¹ broni¹?!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Schowaj to!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Celujesz we mnie!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Jeœli natychmiast nie przestaniesz, bêdziesz mia³ k³opoty!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hej, œlepy jesteœ, czy co?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Zapomnijmy o naszej ma³ej sprzeczce, dobra?
	Strange						=	"SVM_12_Strange"						;//Ale by³ tutaj dos³ownie chwilê temu! Dziwne.
	DieMonster					=	"SVM_12_DieMonster"						;//Pora wyrównaæ rachunki!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Czas zap³aty!
	NowWait						=	"SVM_12_NowWait"						;//Prosisz siê o porz¹dne lanie!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Dalej nie masz doœæ?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Dobra, sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Wynios¹ ciê st¹d na noszach!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Ostrzega³em ciê! Jak bêdziesz grzeba³ w moich rzeczach, dostaniesz po ³apach!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Ty przeklêty z³odzieju! Ja ci poka¿ê...
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Nikt nie bêdzie podskakiwa³ moim kolegom.
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Zabi³eœ jednego z moich ludzi. Teraz ja zabijê ciebie!
	Dead						=	"SVM_12_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Jeszcze tego po¿a³ujesz!
	YesYes						=	"SVM_12_YesYes"							;//Spokojnie! Wygra³eœ!
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//To ju¿ za wiele! Spadam st¹d!
	Help						=	"SVM_12_Help"							;//Cholera!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Nastêpnym razem bêdzie trochê inaczej!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Nigdy wiêcej tego nie próbuj!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Podoba mi siê ta broñ!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Twoja ruda bardzo mi siê przyda!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Szlag! ¯adnej rudy!
	HandsOff					=	"SVM_12_HandsOff"						;//£apy precz!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Wynoœ siê st¹d!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hej! Sk¹d siê tu wzi¹³eœ?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Czy ja ci wygl¹dam na idiotê?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Dlaczego tak siê skradasz?!
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Wynoœ siê st¹d, albo wezwê stra¿!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Nie masz tu czego szukaæ!
	WiseMove					=	"SVM_12_WiseMove"						;//Szybko siê uczysz!
	Alarm						=	"SVM_12_Alarm"							;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALARM!!!
	BehindYou					=	"SVM_12_BehindYou"						;//Uwa¿aj!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Walka!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Przy³ó¿ mu!
	CheerFight					=	"SVM_12_CheerFight"						;//Dobrze!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Powal go wreszcie!
	Ooh							=	"SVM_12_Ooh"							;//Uwa¿aj, cz³owieku!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Najwy¿szy czas!
	RunCoward					=	"SVM_12_RunCoward"						;//Facet ucieka!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Mamy zwyciêzcê!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Zas³u¿y³ na to!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Nie mo¿esz tak po prostu zabijaæ ludzi. Teraz bêdziesz mia³ nie lada k³opoty.
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Co za walka!
	Awake						=	"SVM_12_Awake"							;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Witaj, przyjacielu!
	ALGreetings					=	"SVM_12_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Za potêgê magii!
	SectGreetings				=	"SVM_12_SectGreetings"					;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Tutaj!
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_12_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_12_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//W czym mogê pomóc?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Czego chcesz?
	MakeWay						=	"SVM_12_MakeWay"						;//Przepuœæ mnie.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//No ju¿, zejdŸ mi z drogi!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Og³uch³eœ, czy szukasz guza?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Ci¹gle szukasz k³opotów?
	LookAway					=	"SVM_12_LookAway"						;//Czy coœ siê sta³o? Bo ja NIC nie widzia³em...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Dobra! Zatrzymaj to sobie.
	WhatsThat					=	"SVM_12_WhatsThat"						;//Co to by³o?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Chcê dostaæ moj¹ broñ!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//No có¿, trudno! Mam tego wiêcej.
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Dopadli jednego z naszych. Jak siê dowiem, kto to zrobi³...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hmmm? O co chodzi? Dlaczego mnie budzisz?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Hê? Dosta³eœ baty? I bardzo dobrze!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Powali³eœ Magnata! Facet by³ pod wra¿eniem!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Pokona³eœ jednego z Guru. Jestem pod wra¿eniem. Ale ju¿ nigdy wiêcej tego nie próbuj.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Pokonaæ maga... musisz byæ dzielnym cz³owiekiem!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Oszala³eœ? Dlaczego atakujesz Nowicjuszy?
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Co ci strzeli³o do g³owy, ¿eby atakowaæ Kopacza?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Zaatakowa³eœ mojego kumpla. Mogê wiedzieæ, dlaczego?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Spróbuj jeszcze raz zaczepiæ Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Zadzieranie z moimi protegowanymi nie wyjdzie ci na zdrowie.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Œmiesz siê tu jeszcze pokazywaæ, z³odzieju?!
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Masz kilka rzeczy, które nale¿¹ do nas, a my chcemy je dostaæ z powrotem.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Stary! Okrad³eœ Magnatów? Ale siê wœciekn¹!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Okrad³eœ Guru! Szkoda tylko, ¿e da³eœ siê z³apaæ.
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Magowie nie lubi¹ jak ktoœ grzebie w ich rzeczach!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Masz na sumieniu jednego z naszych! Jeszcze jeden taki wybryk i trafisz do piachu!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Pokona³eœ mnie w piêknym stylu, stary. Ale walka ju¿ skoñczona!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ... to siê chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y´berion blind,	Mitläufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//¯adnej magii!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Przestañ, s³yszysz? Przestañ!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Schowaj broñ!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Schowaj tê broñ!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//We mnie celujesz? Poczekaj no...
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Nie celuj we mnie, jeœli ci ¿ycie mi³e!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Co to ma znaczyæ, do diab³a?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Zapomnijmy o tym nieporozumieniu, dobrze?
	Strange						=	"SVM_13_Strange"						;//Gdzie on siê podzia³?! To niemo¿liwe!
	DieMonster					=	"SVM_13_DieMonster"						;//Na kolacjê bêdzie miêso!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Twoja kolej! Bez litoœci!
	NowWait						=	"SVM_13_NowWait"						;//Za to ciê zabijê!
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Chcesz spróbowaæ szczêœcia jeszcze raz?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Ju¿ nie ¿yjesz, przyb³êdo!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Odr¹biê ci palce!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Przeklêty z³odziej! Po³amiê ci rêce.
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//W tej okolicy to JA bijê ludzi!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Zabi³eœ jednego z naszych!
	Dead						=	"SVM_13_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Nawet nie zd¹¿ysz tego po¿a³owaæ, gnido!
	YesYes						=	"SVM_13_YesYes"							;//Nie ma sprawy! Nic siê nie sta³o!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Nie mam odpowiedniej broni! Ale jeszcze siê spotkamy...
	Help						=	"SVM_13_Help"							;//£aaaa... W nogi!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Jeszcze siê spotkamy!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//Nastêpnym razem ciê wykoñczê!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//£adna broñ! Twoja? Nie??? To œwietnie!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Nie obrazisz siê chyba, jeœli po¿yczê trochê twojej rudy?
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Nie masz ani krzty rudy? Nawet okruszka?!
	HandsOff					=	"SVM_13_HandsOff"						;//£apy precz, œmieciu!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//IdŸ precz! Wynoœ siê st¹d!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Czego tu szukasz?!
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Próbujesz mnie okpiæ?!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hej, ty! Dlaczego tak siê skradasz?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Co tu robisz? Uciekaj, albo wezwê stra¿!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Nie masz tu czego szukaæ!
	WiseMove					=	"SVM_13_WiseMove"						;//Masz szczêœcie! Chêtnie bym ci pokaza³, gdzie raki zimuj¹!
	Alarm						=	"SVM_13_Alarm"							;//Stra¿! Tutaj!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALARM!!!
	BehindYou					=	"SVM_13_BehindYou"						;//Za tob¹!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Zobaczymy kto pierwszy trafi do piachu!
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Tak! Jeszcze raz!
	CheerFight					=	"SVM_13_CheerFight"						;//Chcê zobaczyæ krew!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Wykoñcz go!
	Ooh							=	"SVM_13_Ooh"							;//Oddaj mu, idioto!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Taaak!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Taaa, spadaj!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//S³abe przedstawienie! Facet potyka³ siê w w³asne nogi!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Phi, nale¿a³o mu siê!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Zabójstwo przy œwiadkach to SAMObójstwo. Zapamiêtaj moje s³owa.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Niez³a walka!
	Awake						=	"SVM_13_Awake"							;//(Ziewniêcie)
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Wszystko w porz¹dku?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Za potêgê magii!
	SectGreetings				=	"SVM_13_SectGreetings"					;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Oœlep³eœ? Tutaj!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_13_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_13_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Czego chcesz?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Co mogê dla ciebie zrobiæ?
	MakeWay						=	"SVM_13_MakeWay"						;//Przepuœæ mnie.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//ZejdŸ mi z drogi!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Szukasz guza? Wynoœ siê st¹d!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Ci¹gle szukasz k³opotów?
	LookAway					=	"SVM_13_LookAway"						;//Ja NIC nie widzia³em!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Spokojnie! WeŸ to sobie!
	WhatsThat					=	"SVM_13_WhatsThat"						;//Co to by³o?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Oddaj mi moj¹ broñ!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Dobra! Zatrzymaj to sobie.
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Zgin¹³ jeden z naszych! Musimy go pomœciæ!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Dlaczego mnie obudzi³eœ?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Nale¿a³o ci siê porz¹dne lanie!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Powali³eœ jednego z Magnatów! Jest na ciebie naprawdê wœciek³y!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Pokona³eœ Guru. Zdajesz siê przyci¹gaæ k³opoty jak magnes!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Pokonaæ maga... To nie by³ najlepszy pomys³!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//A wiêc to ty atakujesz Nowicjuszy!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Zostaw moich kumpli w spokoju!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Dobrze ci radzê! Nie zaczepiaj wiêcej moich kumpli!
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Nie tolerujemy tutaj wichrzycieli!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Dobrze ci radzê! Nie zaczepiaj nigdy wiêcej moich protegowanych!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Nigdy wiêcej nie próbuj mnie okradaæ!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Chcemy z powrotem nasze rzeczy! Oddawaj je!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Okrad³eœ Magnata! Co ci do diab³a strzeli³o do g³owy!
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Okrad³eœ Guru! Szkoda tylko, ¿e da³eœ siê z³apaæ.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Okrad³eœ magów! To nie by³ najlepszy pomys³!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Zgin¹³ jeden z naszych ludzi, a ty macza³eœ w tym palce! Jeszcze jeden taki b³¹d a bêdzie po tobie.
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Spuœci³eœ mi niez³e baty, stary. To by³a dobra walka, ale ju¿ siê skoñczy³a!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ... to siê chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzähler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Natychmiast przestañ czarowaæ!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//S³yszysz?! ¯adnych czarów!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Co zamierzasz zrobiæ z t¹ broni¹?!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Schowaj broñ!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Celujesz we mnie!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Mo¿esz wreszcie przestaæ we mnie celowaæ?!
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Uwa¿aj, cz³owieku!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Zapomnijmy o tym nieporozumieniu, dobrze?
	Strange						=	"SVM_14_Strange"						;//Niez³a sztuczka! Po prostu rozp³yn¹³ siê w powietrzu!
	DieMonster					=	"SVM_14_DieMonster"						;//Uci¹¿liwe stworzenie.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Muszê ciê zabiæ... To nic osobistego. Sam rozumiesz...
	NowWait						=	"SVM_14_NowWait"						;//Na razie wystarczy!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Chyba nie szukasz znowu guza, co?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Sam siê o to prosi³eœ!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Nie zaprasza³em ciê tutaj!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//To moja w³asnoœæ! 
	DirtyThief					=	"SVM_14_DirtyThief"						;//Zabra³eœ coœ, co nale¿a³o do mnie. Teraz mi za to zap³acisz!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Musisz siê nauczyæ postêpowaæ zgodnie z zasadami.
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Zabi³eœ cz³owieka!
	Dead						=	"SVM_14_Dead"							;//Aaarg!
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Po¿a³ujesz tego!
	YesYes						=	"SVM_14_YesYes"							;//Dobra, dobra!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Nie mam ochoty mierzyæ siê z takim przeciwnikiem.
	Help						=	"SVM_14_Help"							;//Muszê wracaæ do mych badañ!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Jeszcze siê spotkamy!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Nigdy wiêcej tego nie rób!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Wezmê tê broñ!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Twoja ruda bardzo mi siê przyda!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Nie masz rudy?!
	HandsOff					=	"SVM_14_HandsOff"						;//Rêce przy sobie!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Wynoœ siê st¹d.
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Jak siê tu dosta³eœ?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Chyba ¿artujesz!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Czemu tak siê skradasz?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//WyjdŸ st¹d, zanim wezwê stra¿e!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Nie masz tu czego szukaæ, zrozumiano?
	WiseMove					=	"SVM_14_WiseMove"						;//M¹dra decyzja!
	Alarm						=	"SVM_14_Alarm"							;//Stra¿! Tutaj! Tutaj!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//INTRUZ!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Za tob¹!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Walka!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Jakie to... nieefektywne.
	CheerFriend					=	"SVM_14_CheerFriend"					;//To chyba doœæ mêcz¹ce.
	Ooh							=	"SVM_14_Ooh"							;//To musia³o boleæ!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//Có¿, tak te¿ mo¿na...
	RunCoward					=	"SVM_14_RunCoward"						;//Czegoœ siê nauczy³!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//No i po wszystkim.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Nale¿a³o mu siê!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Dlaczego go zabi³eœ? Teraz bêdziesz mia³ k³opoty!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Te walki s¹ strasznie nudne!
	Awake						=	"SVM_14_Awake"							;//Chyba przysn¹³em...
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Witaj.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Za Gomeza!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Za potêgê magii!
	SectGreetings				=	"SVM_14_SectGreetings"					;//ZbudŸ siê!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Jest tutaj!
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Nie mogê ciê niczego nauczyæ. Brak ci doœwiadczenia.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Umiesz ju¿ wszystko. Spróbuj zaj¹æ siê czymœ innym.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Jesteœ ju¿ lepszy!
	HeyYou						=	"SVM_14_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_14_NotNow"							;//Nie teraz!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Co mogê dla ciebie zrobiæ?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Mogê ci jakoœ pomóc?
	MakeWay						=	"SVM_14_MakeWay"						;//Odsuñ siê!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Pozwól mi przejœæ.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//IdŸ sobie wreszcie!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Znowu szukasz k³opotów?
	LookAway					=	"SVM_14_LookAway"						;//Nie interesuje mnie, co tam robisz.
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Zatrzymaj to sobie!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Co to by³o?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Oddaj mi moj¹ broñ!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Oddawaj!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//A zreszt¹... I tak tego nie potrzebowa³em.
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Zgin¹³ jeden z naszych ludzi. Jeœli znajdziemy winnego...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Przeszkadzasz mi w badaniach!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//S³ysza³em, ¿e wpakowa³eœ siê w jak¹œ kaba³ê...
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Powali³eœ Magnata! Facet by³ pod wra¿eniem!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Pokona³eœ jednego z Guru. Jestem pod wra¿eniem. 
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Pokonaæ maga... no, no...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Wiesz, ¿e Nowicjusze s¹ pod moj¹ ochron¹, a mimo to oœmielasz siê ich zaczepiaæ?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Atakuj¹c Kopaczy psujesz mi interes.
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Lepiej nie wchodŸ w drogê moim przyjacio³om!
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Spróbuj jeszcze raz zaczepiæ Nowicjusza, a po¿a³ujesz!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Zaczepianie moich protegowanych mo¿e ciê kosztowaæ ¿ycie!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Jak œmiesz siê tu jeszcze pokazywaæ, z³odzieju?!
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Masz kilka rzeczy, które nale¿¹ do nas, a my chcemy je dostaæ z powrotem.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Stary! Okrad³eœ Magnatów? Ale siê wœciekn¹!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do Guru, tak?
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Po¿yczy³eœ sobie kilka rzeczy nale¿¹cych do magów, prawda?
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Zabi³eœ jednego z naszych! Jeszcze jeden taki wybryk, a przyjdzie kolej na ciebie!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Zabi³eœ Magnata! Stary, odbi³o ci?!
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Zabi³eœ Guru! Nie mogê w to uwierzyæ!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Zabi³eœ maga! Jak zamierzasz siê z tego wyt³umaczyæ?!
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Zgin¹³ cz³onek Starego Obozu i twoje imiê pad³o w zwi¹zku z t¹ spraw¹...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Nowy Obóz poniós³ niepowetowan¹ stratê, i wygl¹da na to, ¿e macza³eœ w tym palce!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Bractwo utraci³o jednego z wiernych, i to ty masz go na sumieniu!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//Nie ³atwo bêdzie to teraz odkrêciæ!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Pokona³eœ mnie w piêknym stylu, stary. Ale walka ju¿ skoñczona!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ... jeœli myœlisz, ¿e ...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ... mo¿e ...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ... to nie by³o zbyt m¹dre ...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ... lepiej siê do tego nie mieszaæ ...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ... to nie mój problem ...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ... od razu wiedzia³em, ¿e bêd¹ k³opoty ...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ... tylko zachowaj to dla siebie. Inni nie powinni wiedzieæ ...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ... to siê ju¿ wiêcej nie powtórzy ...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ... w tej historii musi byæ jednak ziarno prawdy ...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ... musisz uwa¿aæ na to, co mówisz przy obcych ...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ... tak d³ugo, jak mnie to nie dotyczy ...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ... nie powinieneœ wierzyæ we wszystko ...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ... nie chcia³bym byæ teraz w jego skórze ...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ... zawsze to samo ...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ... niektórzy nigdy siê nie naucz¹ ...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ... kiedyœ takie sprawy za³atwia³o siê inaczej ...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ... ludzie zawsze gadaj¹ ...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ... mam ju¿ doœæ tej paplaniny ...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ... w dzisiejszych czasach na nikim nie mo¿na polegaæ, ot co! ...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ... to siê chyba nigdy nie zmieni ...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ... pewnie masz racjê ...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ... czekaj. Lepiej siê w nic nie pakowaæ ...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ... myœla³em, ¿e to siê skoñczy³o ju¿ dawno temu ...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ... pogadajmy lepiej o czymœ innym ...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hej, ty!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Czekaj no!

	SectGreetings			=	"SVM_15_SectGreetings"				;//ZbudŸ siê!
	ALGreetings				=	"SVM_15_ALGreetings"				;//Za Gomeza!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Witaj!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Czeœæ!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaarg!
	Awake					=	"SVM_15_Awake"						;//(Budzi siê)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nie dzia³a.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, zepsuty.
	NeedKey					= 	"SVM_15_NeedKey"					;// Bêdê potrzebowa³ klucza...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Nie mam ju¿ ¿adnych uniwersalnych kluczy...
	InvFull					= 	"SVM_15_InvFull"					;// Wiêcej nie dam rady unieœæ.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//OdejdŸ! Nie wolno ci ze mn¹ rozmawiaæ!
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




