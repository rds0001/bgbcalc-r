miterbe_nachlassschuld_quotenbetrag <- function(nachlassschuld=NULL,erbquote_zaehler=NULL,erbquote_nenner=NULL,haftungsfall=NULL,quotenhaftung_qualifiziert=NULL,einordnungsnachweis=NULL) {
 schuld <- .geld(nachlassschuld);z <- .ganzzahl(erbquote_zaehler,'erbquote_zaehler',0,.zahlengrenze);n <- .ganzzahl(erbquote_nenner,'erbquote_nenner',1,.zahlengrenze)
 if(z>n) .fehler('erbquote','Erbquote darf eins nicht \u00fcbersteigen.')
 .auswahl(haftungsfall,'haftungsfall',c('vor_teilung_unbeschraenkt_2059','nach_teilung_2060','nach_teilung_aufgebot_2061'))
 .wahrheitswert(quotenhaftung_qualifiziert,'quotenhaftung_qualifiziert');.text(einordnungsnachweis,'einordnungsnachweis')
 eingaben <- list(nachlassschuld=nachlassschuld,erbquote_zaehler=erbquote_zaehler,erbquote_nenner=erbquote_nenner,haftungsfall=haftungsfall,quotenhaftung_qualifiziert=quotenhaftung_qualifiziert,einordnungsnachweis=einordnungsnachweis)
 wert <- NULL
 if(quotenhaftung_qualifiziert) {
  anteil <- .multiplizieren(schuld,.bruch(z,n));wert <- list(quotenbetrag=.bruchteile(anteil),ueber_quotenbetrag_hinausgehender_forderungsteil=.bruchteile(.subtrahieren(schuld,anteil)))
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_MITERBE_NACHLASSSCHULD_QUOTENBETRAG',eingaben,list(list(operation='Nachlassschuld mit Erbquote multiplizieren; \u00fcbrigen Forderungsteil als Differenz ausweisen')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Rechtlich qualifizierter individueller Haftungsfall und Erbquote; keine automatische Tatbestands- oder Forderungspr\u00fcfung.")
 ergebnis$hinweise <- list("2059I2: nur unbeschr\u00e4nkt haftender Miterbe vor Teilung; Quotenbetrag ist der vom Verweigerungsrecht f\u00fcr Eigenverm\u00f6gen ausgenommene Teil. Zugriff auf ungeteilten Nachlass2059II bleibt unber\u00fchrt.2060: nach Teilung und konkret qualifizierter Ausschluss-, Sp\u00e4tgl\u00e4ubiger- oder beendeter Insolvenzfall; Teilung allein gen\u00fcgt nicht.2061: wirksame \u00f6ffentliche Aufforderung und Ablauf der Sechsmonatsfrist ab letzter Ver\u00f6ffentlichung, weder rechtzeitige Anmeldung noch diesem Miterben bei Teilung bekannte Forderung. Grundfrist kann erbrecht_weitere_grundfrist liefern, erforderliche Korrekturen rechtlich pr\u00fcfen. Kenntnis individuell je Miterbe beurteilen. Restforderung erlischt nicht; keine automatische Haftungsquote anderer Miterben oder Vollstreckungsentscheidung. Nicht mit beschr\u00e4nkter Haftung auf den Geldwert eines Erbteils verwechseln: Quote bezieht sich auf Schuld, nicht Nachlasswert.")
 ergebnis
}
