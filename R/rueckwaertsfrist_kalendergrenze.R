rueckwaertsfrist_kalendergrenze <- function(bezugstag=NULL, anzahl=NULL, einheit=NULL, bezugsart=NULL, monatsendregel=NULL, methodennachweis=NULL) {
 a <- .datum(bezugstag,'bezugstag');z <- .ganzzahl(anzahl,'anzahl',1,3652059);.auswahl(einheit,'einheit',c('tage','wochen','monate','jahre'));.auswahl(bezugsart,'bezugsart',c('ereignistag','tagesende'));.auswahl(monatsendregel,'monatsendregel',c('nur_taggleiche_monate','letzter_monatstag'));.text(methodennachweis,'methodennachweis')
 if(einheit %in% c('tage','wochen')) vergleich <- .tage_addieren(a,-z*(if(einheit=='wochen')7 else 1)) else {
  vergleich <- .monatsende(a,-z*(if(einheit=='jahre')12 else 1),FALSE)
  if(format(vergleich,'%d')!=format(a,'%d') && monatsendregel=='nur_taggleiche_monate') .fehler('monatsendregel','Fehlende Tageszahl ohne freigegebene Monatsendregel.')
 }
 grenze <- if(bezugsart=='tagesende') .tage_addieren(vergleich,1) else vergleich
 letzter <- .tage_addieren(grenze,-1)
 wert <- list(grenztag_beginn=format(grenze,'%Y-%m-%d'),letzter_voller_tag_vor_grenze=format(letzter,'%Y-%m-%d'))
 eingaben <- list(bezugstag=bezugstag, anzahl=anzahl, einheit=einheit, bezugsart=bezugsart, monatsendregel=monatsendregel, methodennachweis=methodennachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_RUECKWAERTSFRIST_KALENDERGRENZE",eingaben,list(list(operation="Qualifizierten Kalenderabstand r\u00fcckw\u00e4rts mit bestehenden Datumshelfern berechnen; Grenztagesbeginn und vorausgehenden vollen Tag ausweisen.")),eingaben)
 ergebnis$hinweise <- list("Bedingter Kalenderkern zur ausdr\u00fccklich qualifizierten R\u00fcckw\u00e4rtsanalogie187/188. Ereignistag: zur\u00fcckliegender gleichbenannter/gleichzahliger Tag beginnt die Grenze; letzter voller vorausgehender Handlungstag ist dessen Vortag. Tagesende: r\u00fcckw\u00e4rts mitgez\u00e4hlter Bezugstag, Grenze am Folgetagesbeginn des zur\u00fcckliegenden Vergleichstags; letzter voller Handlungstag ist Vergleichstag. F\u00fcr reine Zeitfenster ist die Grenztagesbeginn-Ausgabe zu verwenden, nicht ungepr\u00fcft der letzte Handlungstag. Untert\u00e4gige Zeitpunkte und rechtliche Einschlie\u00dfung einer einzelnen Grenzhandlung gesondert bestimmen. Monatsende nur auf ausdr\u00fcckliche Methodenvorgabe; nur_taggleiche_monate verhindert eine ungesicherte Ersatzregel. Kein193-Automatismus: Verfahrenszwecke k\u00f6nnen unterschiedliche Werktagskorrekturen verlangen. Keine Inversion durch Suche nach einem beliebigen vorw\u00e4rts passenden Datum. Standardkalender und bestehende Datumshelfer, unver\u00e4nderte Vorw\u00e4rtsfunktionen.")
 ergebnis
}
