.widerrufs_bezugstag <- function(ereignistage,parameter,anzahl=NULL) {
 .vorhanden(ereignistage,parameter)
 if(!is.list(ereignistage)||!is.null(names(ereignistage))||length(ereignistage)<1||length(ereignistage)>10) .fehler(parameter,'Unbenannte Liste1bis10 tats\u00e4chlich eingetretener Ereignistage erforderlich.')
 if(!is.null(anzahl)&&length(ereignistage)!=anzahl) .fehler(parameter,'Anzahl der Bezugsereignisse passt nicht zum gesetzlichen H\u00f6chstfristfall.')
 tage <- lapply(ereignistage,function(t) .datum(t,parameter));ende <- tage[[1]]
 for(t in tage) if(t>ende) ende <- t
 ende
}
widerruf_regelfristende <- function(fristart=NULL,erforderliche_ereignistage=NULL,einordnungsnachweis=NULL) {
 .auswahl(fristart,'fristart',c('standard_vierzehn_tage','darlehen_angabennachholung_monat'))
 beginn <- .widerrufs_bezugstag(erforderliche_ereignistage,'erforderliche_ereignistage');.text(einordnungsnachweis,'einordnungsnachweis')
 ende <- .frist(.iso(beginn),if(fristart=='standard_vierzehn_tage') 14 else 1,if(fristart=='standard_vierzehn_tage') 'tage' else 'monate','ereignis')
 eingaben <- list(fristart=fristart,erforderliche_ereignistage=erforderliche_ereignistage,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(massgeblicher_ereignistag=.iso(beginn),regelfristende_ohne_kalenderkorrektur=.iso(ende)),'daten','BGB_WIDERRUF_REGELFRISTENDE',eingaben,list(list(operation='Sp\u00e4testen Tag aller erforderlichen Anfangsvoraussetzungen w\u00e4hlen und14Tage oder einen Monat fortschreiben.')),eingaben)
 ergebnis$hinweise <- list("\u00a7355II und356\u2013356f:14Tage im qualifizierten Standardfall; ein Monat ausschlie\u00dflich bei nachgeholten Angaben356bII. Liste muss s\u00e4mtliche rechtlich erforderlichen eingetretenen Anfangsvoraussetzungen enthalten: je Norm insbesondere Vertrag/Vorvertrag, ma\u00dfgeblicher Warenempfang, Vertragsurkunde, vollst\u00e4ndige Informationen und Widerrufsbelehrung. Bei356II erste Ware bei regelm\u00e4\u00dfigen Lieferungen, letzte Ware/Teilsendung bei den anderen dort genannten Mehrlieferf\u00e4llen rechtlich zutreffend ausw\u00e4hlen.356cV gegebenenfalls ma\u00dfgeblichen Teilzeit-Wohnrechtevertrag zugrunde legen. Solange eine erforderliche Voraussetzung fehlt, keine k\u00fcnstliche Ersatzdatierung eingeben. Kein automatischer Belehrungs-/Form-/Widerrufsrechtsentscheid; fr\u00fchzeitiges Erl\u00f6schen356V/VI gesondert. Gesetzliche H\u00f6chstfristen und anwendbare193-Korrektur separat, rechtzeitige Absendung355I gesondert.")
 ergebnis
}
widerruf_hoechstfristende <- function(fristfall=NULL,bezugsereignistage=NULL,einordnungsnachweis=NULL) {
 faelle <- list(fernabsatz_aussergeschaeftlich_356=c(12,1),immobiliardarlehen_356b=c(12,2),teilzeitwohnrecht_informationen_356c=c(3,2),teilzeitwohnrecht_belehrung_356c=c(12,2),ratenlieferung_356d=c(12,1),verbraucherbau_356e=c(12,1),unentgeltliches_darlehen_356f=c(12,2),unentgeltliches_darlehen_ohne_unterrichtung_356f=c(12,1))
 .auswahl(fristfall,'fristfall',names(faelle));monate <- faelle[[fristfall]][[1]];anzahl <- faelle[[fristfall]][[2]]
 bezug <- .widerrufs_bezugstag(bezugsereignistage,'bezugsereignistage',anzahl);.text(einordnungsnachweis,'einordnungsnachweis')
 ende <- .tage_addieren(.frist(.iso(bezug),monate,'monate','ereignis'),14)
 eingaben <- list(fristfall=fristfall,bezugsereignistage=bezugsereignistage,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(massgeblicher_bezugstag=.iso(bezug),hoechstfrist_monate=monate,hoechstfristende_ohne_kalenderkorrektur=.iso(ende)),'daten_und_zahlen','BGB_WIDERRUF_HOECHSTFRISTENDE',eingaben,list(list(operation='Gesetzlichen H\u00f6chstfristbezug als sp\u00e4testen Bezugstag w\u00e4hlen, drei oder zw\u00f6lf Monate und danach14Tage addieren.')),eingaben)
 ergebnis$hinweise <- list("Feste lokale Fassung:356IV zw\u00f6lfMonate+14Tage ab356II/355II2, nicht ab versp\u00e4teter Belehrung; bei Finanzdienstleistungen Ausnahme fehlender Belehrung356IV2 beachten, dann diesen H\u00f6chstfristfall nicht anwenden.356bII nur Immobiliardarlehen: sp\u00e4terer Vertragsschluss/Urkundenzeitpunkt356bI; keine pauschale H\u00f6chstfrist f\u00fcr Allgemeindarlehen.356c: sp\u00e4terer Vertrags-/Vorvertragsabschluss und Urkundenerhalt; dreiMonate+14Tage bei Informations-/Formblattmangel, zw\u00f6lfMonate+14Tage bei Belehrungsmangel, letzterer auch bei beidem ma\u00dfgeblich. Bei Urkunde bereits zum Abschluss denselben Tag zweimal angeben.356d/e: ein Bezugstag Vertragsschluss.356f: Bei tats\u00e4chlich erteilter Unterrichtung sp\u00e4teren Vertragsschluss/Unterrichtung verwenden, beide Tage m\u00fcssen feststehen. Bei vollst\u00e4ndig ausgebliebener Unterrichtung ausdr\u00fccklich unentgeltliches_darlehen_ohne_unterrichtung_356f w\u00e4hlen: nur tats\u00e4chlicher Vertragsschlusstag, zw\u00f6lfMonate+14Tage. Dies ist keine fiktive Unterrichtung und startet keine14Tage-Regelfrist. Belegt durchBT-Drs18/7584S.141zur inhaltsgleichen fr\u00fcheren356d-Regelung. Vollst\u00e4ndig fehlende Unterrichtung von unbekannter Informationslage unterscheiden. Ein bereits erloschenes Recht wird durch sp\u00e4tere Information nicht automatisch wiederbelebt; den Zwei-Ereignisfall nicht ungepr\u00fcft daf\u00fcr verwenden. Regelwiderrufsfrist, fr\u00fchzeitiges Erl\u00f6schen und gegebenenfalls193-Korrektur separat; Monatsanteil nicht eigenst\u00e4ndig vor Addition der14Tage verschieben.")
 ergebnis
}
widerruf_fristenden_zusammenfuehren <- function(regelfristende_am=NULL,hoechstfristende_am=NULL,einordnungsnachweis=NULL) {
 regel <- if(is.null(regelfristende_am)) NULL else .datum(regelfristende_am,'regelfristende_am')
 grenze <- if(is.null(hoechstfristende_am)) NULL else .datum(hoechstfristende_am,'hoechstfristende_am')
 .text(einordnungsnachweis,'einordnungsnachweis')
 ende <- if(is.null(regel)) grenze else if(is.null(grenze)) regel else min(regel,grenze)
 eingaben <- list(regelfristende_am=regelfristende_am,hoechstfristende_am=hoechstfristende_am,einordnungsnachweis=einordnungsnachweis)
 wert <- list(rechnerisch_bestimmbares_ende=if(is.null(ende)) NULL else .iso(ende),regelfristende_vorhanden=!is.null(regel),hoechstfristende_vorhanden=!is.null(grenze))
 ergebnis <- .ergebnis(wert,'datum_und_wahrheitswerte','BGB_WIDERRUF_FRISTENDEN_ZUSAMMENFUEHREN',eingaben,list(list(operation='Fr\u00fcheres von Regelfristende und anwendbarem H\u00f6chstfristende bestimmen; fehlende berechenbare Enden ausdr\u00fccklich ausweisen.')),eingaben)
 ergebnis$hinweise <- list("Nur zeitliche Kombination rechtlich vorqualifizierter Enddaten355/356\u2013356f. Vorher gegebenenfalls einschl\u00e4gige Kalenderkorrekturen wie193 f\u00fcr das jeweilige Ende vornehmen; rohe Fristdaten nicht ungepr\u00fcft als endg\u00fcltige Erkl\u00e4rungstermine verwenden. NULL/None bedeutet ausdr\u00fccklich kein vorliegendes berechenbares Ende dieses Typs, nicht stillschweigend erf\u00fcllte Anfangsvoraussetzungen oder eine pauschale unbegrenzte Widerrufsm\u00f6glichkeit. Sind beide EndenNULL, bleibt das ErgebnisdatumNULL. Bei noch nicht begonnener Regelfrist kann eine qualifizierte H\u00f6chstfrist dennoch ma\u00dfgeblich sein. Fr\u00fchzeitiges Erl\u00f6schen, Anwendungsbereich, Form und rechtzeitige Absendung gesondert.")
 ergebnis
}
