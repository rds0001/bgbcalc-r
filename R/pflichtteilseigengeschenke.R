pflichtteilsergaenzung_mehrere_eigengeschenke <- function(pflichtteilsnachlass=NULL,drittschenkungen_ergaenzungswert=NULL,eigengeschenke=NULL,gesetzliche_erbquote_zaehler=NULL,gesetzliche_erbquote_nenner=NULL,kombination_ohne_ausgleichung_qualifiziert=NULL,bewertungsnachweis=NULL) {
 nachlass <- .zahleneingabe(pflichtteilsnachlass);dritt <- .geld(drittschenkungen_ergaenzungswert);.vorhanden(eigengeschenke,'eigengeschenke')
 if(!is.list(eigengeschenke)||!is.null(names(eigengeschenke))||length(eigengeschenke)>1000) .fehler('eigengeschenke','Liste mit h\u00f6chstens1000 \u00fcberschneidungsfreien Eigengeschenken erforderlich.')
 namen <- character();anrechenbar <- .bruch(0);nur_ergaenzung <- .bruch(0)
 for(p in eigengeschenke) {
  if(!is.list(p)||!identical(sort(names(p)),sort(c('geschenk_id','einheitlicher_wert','anrechnung_nach_2315')))) .fehler('eigengeschenke','Genau geschenk_id, einheitlicher_wert und anrechnung_nach_2315 erforderlich.')
  name <- .text(p$geschenk_id,'geschenk_id');if(name %in% namen) .fehler('geschenk_id','Geschenk nicht doppelt erfassen.');namen <- c(namen,name)
  betrag <- .geld(p$einheitlicher_wert);.wahrheitswert(p$anrechnung_nach_2315,'anrechnung_nach_2315')
  if(p$anrechnung_nach_2315) anrechenbar <- .addieren(anrechenbar,betrag) else nur_ergaenzung <- .addieren(nur_ergaenzung,betrag)
 }
 .wahrheitswert(kombination_ohne_ausgleichung_qualifiziert,'kombination_ohne_ausgleichung_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 ordentlich <- .geld(pflichtteil_betrag(pflichtteilsnachlass,gesetzliche_erbquote_zaehler,gesetzliche_erbquote_nenner,.bruchteile(anrechenbar),TRUE,TRUE,bewertungsnachweis)$wert)
 eingaben <- list(pflichtteilsnachlass=pflichtteilsnachlass,drittschenkungen_ergaenzungswert=drittschenkungen_ergaenzungswert,eigengeschenke=eigengeschenke,gesetzliche_erbquote_zaehler=gesetzliche_erbquote_zaehler,gesetzliche_erbquote_nenner=gesetzliche_erbquote_nenner,kombination_ohne_ausgleichung_qualifiziert=kombination_ohne_ausgleichung_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(kombination_ohne_ausgleichung_qualifiziert) {
  eigene <- .addieren(anrechenbar,nur_ergaenzung);gesamtbasis <- .addieren(.addieren(nachlass,dritt),eigene)
  if(.vergleichen(gesamtbasis,.bruch(0))<0) gesamtbasis <- .bruch(0)
  quote <- .multiplizieren(.bruch(gesetzliche_erbquote_zaehler,gesetzliche_erbquote_nenner),.bruch(1,2));fiktiv <- .multiplizieren(gesamtbasis,quote)
  ergaenzung <- .subtrahieren(.subtrahieren(fiktiv,eigene),ordentlich);if(.vergleichen(ergaenzung,.bruch(0))<0) ergaenzung <- .bruch(0)
  wert <- list(eigengeschenke_mit_2315=.bruchteile(anrechenbar),eigengeschenke_ohne_2315=.bruchteile(nur_ergaenzung),ordentlicher_pflichtteil=.bruchteile(ordentlich),pflichtteilsergaenzung=.bruchteile(ergaenzung),gesamtanspruch=.bruchteile(.addieren(ordentlich,ergaenzung)))
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_PFLICHTTEILSERGAENZUNG_MEHRERE_EIGENGESCHENKE',eingaben,list(list(operation='Eigengeschenke nach2315-Bestimmung summieren; ordentlichen Pflichtteil mit2315-Kern; fiktiven Gesamtpflichtteil minus alle Eigengeschenke minus ordentlichen Pflichtteil, mindestens null')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Je Eigengeschenk ein identischer rechtlich qualifizierter Wert f\u00fcr s\u00e4mtliche verwendeten Hinzurechnungs-/Anrechnungsschritte; keine2316-Ausgleichung.")
 ergebnis$hinweise <- list("A=Summe mit2315-Anrechnungsbestimmung,B=Summe ohne;ordentlich=max(q\u00d7max(N+A,0)\u2212A,0),Erg\u00e4nzung=max(q\u00d7max(N+D+A+B,0)\u2212A\u2212B\u2212ordentlich,0). B darf ordentlichen Pflichtteil nicht vermindern; keine doppelte2315-Anrechnung vom Gesamtbetrag. Drittschenkungswerte bereits rechtlich bewertet und ggf.abgeschmolzen; Eigengeschenke nicht ungepr\u00fcft nach2325III abschmelzen. Unterschiedliche Wertans\u00e4tze f\u00fcr dasselbe Geschenk nach2315 und2327, weitere reine2315-Zuwendungen au\u00dferhalb Geschenkbegriffs,2316-Ausgleichung und2326-Mehrhinterlassung liegen au\u00dferhalb dieses Modells. Mehrere unterschiedliche Geschenke d\u00fcrfen verschiedene Werte und verschiedene Anrechnungsbestimmungen haben. Geschenke nach2327II/2051I gegebenenfalls rechtlich dem Abk\u00f6mmling zurechnen. Keine automatische Anspruchsdurchsetzbarkeit oder Beschenktenhaftung2329.")
 ergebnis
}
