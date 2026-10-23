pflichtteilsergaenzung_eigengeschenk <- function(pflichtteilsnachlass=NULL,
    hinzuzurechnende_drittschenkungen=NULL, eigengeschenk_wert=NULL,
    gesetzliche_erbquote_zaehler=NULL, gesetzliche_erbquote_nenner=NULL,
    eigengeschenk_nach_2315_anzurechnen=NULL, einheitlicher_wert_qualifiziert=NULL,
    grundmodell_ohne_ausgleichung_anwendbar=NULL, bewertungsnachweis=NULL) {
  nachlass <- .zahleneingabe(pflichtteilsnachlass)
  dritte <- .geld(hinzuzurechnende_drittschenkungen)
  eigen <- .geld(eigengeschenk_wert)
  zaehler <- .ganzzahl(gesetzliche_erbquote_zaehler,"gesetzliche_erbquote_zaehler",0,.zahlengrenze)
  nenner <- .ganzzahl(gesetzliche_erbquote_nenner,"gesetzliche_erbquote_nenner",1,.zahlengrenze)
  if (zaehler>nenner) .fehler("gesetzliche_erbquote","Gesetzliche Erbquote darf eins nicht \u00fcbersteigen.")
  .wahrheitswert(eigengeschenk_nach_2315_anzurechnen,"eigengeschenk_nach_2315_anzurechnen")
  .wahrheitswert(einheitlicher_wert_qualifiziert,"einheitlicher_wert_qualifiziert")
  .wahrheitswert(grundmodell_ohne_ausgleichung_anwendbar,"grundmodell_ohne_ausgleichung_anwendbar")
  .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(pflichtteilsnachlass=pflichtteilsnachlass,
    hinzuzurechnende_drittschenkungen=hinzuzurechnende_drittschenkungen,eigengeschenk_wert=eigengeschenk_wert,
    gesetzliche_erbquote_zaehler=gesetzliche_erbquote_zaehler,gesetzliche_erbquote_nenner=gesetzliche_erbquote_nenner,
    eigengeschenk_nach_2315_anzurechnen=eigengeschenk_nach_2315_anzurechnen,
    einheitlicher_wert_qualifiziert=einheitlicher_wert_qualifiziert,
    grundmodell_ohne_ausgleichung_anwendbar=grundmodell_ohne_ausgleichung_anwendbar,
    bewertungsnachweis=bewertungsnachweis)
  wert <- NULL
  if (einheitlicher_wert_qualifiziert && grundmodell_ohne_ausgleichung_anwendbar) {
    quote <- .multiplizieren(.bruch(zaehler,nenner),.bruch(1,2))
    ordentlich_grundlage <- if (eigengeschenk_nach_2315_anzurechnen) .addieren(nachlass,eigen) else nachlass
    if (.vergleichen(ordentlich_grundlage,.bruch(0))<0) ordentlich_grundlage <- .bruch(0)
    ordentlich_vor <- .multiplizieren(ordentlich_grundlage,quote)
    ordentlich <- if (eigengeschenk_nach_2315_anzurechnen) .subtrahieren(ordentlich_vor,eigen) else ordentlich_vor
    if (.vergleichen(ordentlich,.bruch(0))<0) ordentlich <- .bruch(0)
    fiktiv_grundlage <- .addieren(.addieren(nachlass,dritte),eigen)
    if (.vergleichen(fiktiv_grundlage,.bruch(0))<0) fiktiv_grundlage <- .bruch(0)
    fiktiv <- .multiplizieren(fiktiv_grundlage,quote)
    if (eigengeschenk_nach_2315_anzurechnen) {
      gesamt <- .subtrahieren(fiktiv,eigen)
      if (.vergleichen(gesamt,.bruch(0))<0) gesamt <- .bruch(0)
      ergaenzung <- .subtrahieren(gesamt,ordentlich)
      # Nichtnegative Drittschenkungen: gesamt ist mindestens ordentlich.
    } else {
      ergaenzung <- .subtrahieren(.subtrahieren(fiktiv,ordentlich),eigen)
      if (.vergleichen(ergaenzung,.bruch(0))<0) ergaenzung <- .bruch(0)
      gesamt <- .addieren(ordentlich,ergaenzung)
    }
    wert <- list(ordentlicher_pflichtteilsbetrag=.bruchteile(ordentlich),
      erhoehter_pflichtteilswert_vor_anrechnung=.bruchteile(fiktiv),
      ergaenzungsbetrag_nach_eigengeschenk=.bruchteile(ergaenzung),
      gesamtbetrag_nach_eigengeschenk=.bruchteile(gesamt))
  }
  ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEILSERGAENZUNG_EIGENGESCHENK",eingaben,
    list(list(operation="Eigengeschenk zur fiktiven Masse addieren; ohne2315 nur Erg\u00e4nzung mindern, mit2315 einmal Gesamtbetrag mindern und ordentlichen Pflichtteil gesondert abgrenzen")),eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; ein Eigengeschenk mit rechtlich identischem Wert f\u00fcr erforderliche Hinzurechnung und Anrechnung; Pflichtteilsgrundmodell ohne Ausgleichung oder andere Eigengeschenke.")
  ergebnis$hinweise <- list("Eigengeschenkwert ist bereits rechtlich bewertet; keine automatische Anwendung der Drittschenkungs-Abschmelzung\u00a72325 Absatz3 auf Eigengeschenke und keine Annahme, dass alte Eigengeschenke ohne Weiteres unber\u00fccksichtigt bleiben. Bei2315 muss einheitlicher Wert zugleich dessen Bewertung und der Bewertung nach2327 gen\u00fcgen; abweichende Werte oder Mischgeschenke au\u00dferhalb dieses Modells. Ohne2315 bleibt ordentlicher Pflichtteil von der Eigengeschenkanrechnung unber\u00fchrt; negative Erg\u00e4nzung erzeugt keine R\u00fcckzahlung. Mit2315 Geschenk nicht zuerst von Erg\u00e4nzung und dann nochmals vom Gesamtbetrag abziehen. Ordentlicher Pflichtteil wird aus Nachlass plus2315-Geschenk berechnet und um dieses vermindert; fiktiver Gesamtbetrag umfasst Drittschenkungen und dasselbe Eigengeschenk genau einmal. Negative Nachlasswerte werden erst nach jeweils erforderlicher Hinzurechnung auf null begrenzt. Drittschenkungen enthalten das Eigengeschenk nicht und m\u00fcssen bereits rechtlich bewertete, ber\u00fccksichtigungsf\u00e4hige Werte sein. \u00a72327 Absatz2/\u00a72051 Absatz1 bei Nachr\u00fccken gesondert; kein blo\u00dfes Geschenk an einen anderen Abk\u00f6mmling als eigenes behandeln. Mehrhinterlassung2326, Ausgleichung2316, Erbenschutz2328, Beschenktenhaftung2329 und tats\u00e4chliche Zahlungserf\u00fcllung separat; kein abschlie\u00dfender Zahlungsanspruch.")
  ergebnis
}
