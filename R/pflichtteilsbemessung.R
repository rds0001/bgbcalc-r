pflichtteilsnachlass_positionssumme <- function(nachlasspositionen=NULL,ehegattenvoraus_wert=NULL,
    berechtigter_abkoemmling_oder_elternteil=NULL,bewertungsnachweis=NULL) {
  .vorhanden(nachlasspositionen,"nachlasspositionen")
  if (!is.list(nachlasspositionen) || !is.null(names(nachlasspositionen)) || length(nachlasspositionen)>1000)
    .fehler("nachlasspositionen","Liste mit h\u00f6chstens1000 eindeutig abgegrenzten Positionen erforderlich.")
  namen <- character(); aktiva <- .bruch(0); passiva <- .bruch(0)
  for (p in nachlasspositionen) {
    if (!is.list(p) || !identical(sort(names(p)),sort(c("position_id","betrag","vermoegensseite","ansatzart"))))
      .fehler("nachlasspositionen","Genau position_id, betrag, vermoegensseite und ansatzart erforderlich.")
    name <- .text(p$position_id,"position_id")
    if (name %in% namen) .fehler("position_id","Position nicht doppelt erfassen.")
    namen <- c(namen,name); betrag <- .geld(p$betrag)
    .auswahl(p$vermoegensseite,"vermoegensseite",c("aktiv","passiv"))
    .auswahl(p$ansatzart,"ansatzart",c("unbedingt","aufloesend_offen","aufschiebend_offen","ungewiss_oder_unsicher"))
    if (p$ansatzart %in% c("unbedingt","aufloesend_offen")) {
      if (p$vermoegensseite=="aktiv") aktiva <- .addieren(aktiva,betrag) else passiva <- .addieren(passiva,betrag)
    }
  }
  voraus <- .geld(ehegattenvoraus_wert)
  .wahrheitswert(berechtigter_abkoemmling_oder_elternteil,"berechtigter_abkoemmling_oder_elternteil")
  .text(bewertungsnachweis,"bewertungsnachweis")
  abzug <- if (berechtigter_abkoemmling_oder_elternteil) voraus else .bruch(0)
  netto <- .subtrahieren(.subtrahieren(aktiva,passiva),abzug)
  eingaben <- list(nachlasspositionen=nachlasspositionen,ehegattenvoraus_wert=ehegattenvoraus_wert,
    berechtigter_abkoemmling_oder_elternteil=berechtigter_abkoemmling_oder_elternteil,bewertungsnachweis=bewertungsnachweis)
  wert <- list(beruecksichtigte_aktiva=.bruchteile(aktiva),beruecksichtigte_passiva=.bruchteile(passiva),
    abgezogener_ehegattenvoraus=.bruchteile(abzug),pflichtteilsnachlass=.bruchteile(netto))
  ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEILSNACHLASS_POSITIONSSUMME",eingaben,
    list(list(operation="Unbedingte und noch aufl\u00f6send bedingte Positionen summieren; aufschiebend offene/ungewisse auslassen; Passiva und einschl\u00e4gigen Voraus abziehen")),eingaben)
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; vollst\u00e4ndige \u00fcberschneidungsfreie rechtlich qualifizierte Nachlasspositionen und Werte zum einschl\u00e4gigen Bewertungsstichtag.")
  ergebnis$hinweise <- list("Voraus ist nur bei Pflichtteil von Abk\u00f6mmlingen/Eltern abzuziehen und muss in den eingegebenen Aktiva enthalten sein, nicht bereits dort abgezogen. Ans\u00e4tze nach2313 unterscheiden noch offene aufschiebende von noch offenen aufl\u00f6senden Bedingungen. Nach Bedingungseintritt Rechtslage neu qualifizieren: fortbestehende Position unbedingt, endg\u00fcltig entfallene Position entfernen. Ungewisse/unsichere Rechte und zweifelhafte Verbindlichkeiten zun\u00e4chst auslassen. Inventar-/Bewertungskosten2314 und sonstige Abzugsf\u00e4higkeit rechtlich vorpr\u00fcfen, nicht jeden Zahlungsbetrag als Passivum behandeln. Ergebnis darf negativ sein; nicht vorschnell vor Schenkungshinzurechnungen auf null setzen. Keine Immobilienbewertung, Landgutkapitalisierung2312, Pflichtteilsquote oder automatische Bedingungspr\u00fcfung.")
  ergebnis
}
pflichtteil_bemessungsausgleich <- function(frueherer_pflichtteilsnachlass=NULL,neuer_pflichtteilsnachlass=NULL,
    gesetzliche_erbquote_zaehler=NULL,gesetzliche_erbquote_nenner=NULL,
    grundmodell_ohne_anrechnung_qualifiziert=NULL,bewertungsnachweis=NULL) {
  alt <- .zahleneingabe(frueherer_pflichtteilsnachlass); neu <- .zahleneingabe(neuer_pflichtteilsnachlass)
  zaehler <- .ganzzahl(gesetzliche_erbquote_zaehler,"gesetzliche_erbquote_zaehler",0,.zahlengrenze)
  nenner <- .ganzzahl(gesetzliche_erbquote_nenner,"gesetzliche_erbquote_nenner",1,.zahlengrenze)
  if (zaehler>nenner) .fehler("gesetzliche_erbquote","Gesetzliche Erbquote darf eins nicht \u00fcbersteigen.")
  .wahrheitswert(grundmodell_ohne_anrechnung_qualifiziert,"grundmodell_ohne_anrechnung_qualifiziert")
  .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(frueherer_pflichtteilsnachlass=frueherer_pflichtteilsnachlass,neuer_pflichtteilsnachlass=neuer_pflichtteilsnachlass,
    gesetzliche_erbquote_zaehler=gesetzliche_erbquote_zaehler,gesetzliche_erbquote_nenner=gesetzliche_erbquote_nenner,
    grundmodell_ohne_anrechnung_qualifiziert=grundmodell_ohne_anrechnung_qualifiziert,bewertungsnachweis=bewertungsnachweis)
  wert <- NULL
  if (grundmodell_ohne_anrechnung_qualifiziert) {
    quote <- .multiplizieren(.bruch(zaehler,nenner),.bruch(1,2))
    if (.vergleichen(alt,.bruch(0))<0) alt <- .bruch(0)
    if (.vergleichen(neu,.bruch(0))<0) neu <- .bruch(0)
    vorher <- .multiplizieren(alt,quote); nachher <- .multiplizieren(neu,quote)
    wert <- list(frueherer_pflichtteilswert=.bruchteile(vorher),neuer_pflichtteilswert=.bruchteile(nachher),
      ausgleichsdifferenz=.bruchteile(.subtrahieren(nachher,vorher)))
  }
  ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEIL_BEMESSUNGSAUSGLEICH",eingaben,
    list(list(operation="Alte/neue Nachlassbasis jeweils mindestens null mit halber gesetzlicher Erbquote multiplizieren; neuer minus alter Pflichtteilswert")),eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; rechtlich begr\u00fcndete Neubemessung nach2313 bei unver\u00e4nderter gesetzlicher Erbquote und ohne andere Anrechnungs-/Ausgleichungsregime.")
  ergebnis$hinweise <- list("Positive Differenz bezeichnet h\u00f6heren, negative Differenz niedrigeren Pflichtteilswert; nicht automatisch Zahlungs- oder R\u00fcckzahlungsanspruch in dieser H\u00f6he, tats\u00e4chliche Vorleistungen und Einwendungen gesondert. Grundmodell ohne2315-Anrechnung,2316-Ausgleichung,2325-Erg\u00e4nzung oder Verm\u00e4chtnisanrechnung. Alte/neue Werte m\u00fcssen denselben rechtlichen Bewertungsma\u00dfstab mit korrekt ge\u00e4nderter Positionserfassung verwenden; keine willk\u00fcrliche neue Marktpreisbewertung. Bei negativem Nachlass jede Basis vor Quotierung einzeln auf null setzen, nicht ungepr\u00fcft Netto\u00e4nderung mal Quote rechnen.")
  ergebnis
}
