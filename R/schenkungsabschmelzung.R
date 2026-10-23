pflichtteil_schenkungsabschmelzung <- function(schenkungswert = NULL, leistung_am = NULL,
    erbfall_am = NULL, fristanlauf_durch_leistung = NULL, ehegattenschenkung = NULL,
    eheaufloesung_am = NULL, einordnungsnachweis = NULL) {
  betrag <- .geld(schenkungswert)
  leistung <- .datum(leistung_am, "leistung_am")
  erbfall <- .datum(erbfall_am, "erbfall_am")
  if (leistung > erbfall) .fehler("leistung_am", "Leistung darf nicht nach dem Erbfall liegen.")
  .wahrheitswert(fristanlauf_durch_leistung, "fristanlauf_durch_leistung")
  .wahrheitswert(ehegattenschenkung, "ehegattenschenkung")
  aufloesung <- NULL
  if (!is.null(eheaufloesung_am)) {
    aufloesung <- .datum(eheaufloesung_am, "eheaufloesung_am")
    if (aufloesung > erbfall) .fehler("eheaufloesung_am", "Eheaufl\u00f6sung darf nicht nach dem Erbfall liegen.")
  }
  .text(einordnungsnachweis, "einordnungsnachweis")
  beginn <- NULL
  jahre <- 0
  if (fristanlauf_durch_leistung && (!ehegattenschenkung || !is.null(aufloesung))) {
    beginn <- if (ehegattenschenkung) max(leistung, aufloesung) else leistung
    jahre <- min(10, as.numeric(format(erbfall, "%Y")) - as.numeric(format(beginn, "%Y")))
    if (jahre > 0 && erbfall <= .frist(.iso(beginn), jahre, "jahre", "ereignis")) jahre <- jahre - 1
  }
  faktor <- .bruch(10 - jahre, 10)
  ansatz <- .multiplizieren(betrag, faktor)
  eingaben <- list(schenkungswert = schenkungswert, leistung_am = leistung_am, erbfall_am = erbfall_am,
    fristanlauf_durch_leistung = fristanlauf_durch_leistung, ehegattenschenkung = ehegattenschenkung,
    eheaufloesung_am = eheaufloesung_am, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .geld_ergebnis(ansatz, "BGB_PFLICHTTEIL_SCHENKUNGSABSCHMELZUNG", eingaben,
    list(list(operation = "Wirksamen Fristanlauf und gegebenenfalls Eheaufl\u00f6sung bestimmen; voll abgelaufene Ereignisjahre bis zehn z\u00e4hlen und je Jahr ein Zehntel abziehen")))
  ergebnis$wert <- list(fristbeginnereignis_am = if (is.null(beginn)) NULL else .iso(beginn),
    voll_abgelaufene_jahre_bis_zehn = jahre, beruecksichtigungsfaktor = .bruchteile(faktor),
    beruecksichtigter_schenkungswert = .bruchteile(ansatz))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Fristausl\u00f6sende Leistung rechtlich bestimmen; blo\u00dfer Schenkungsvertrag oder vorbehaltene Nutzung k\u00f6nnen hierf\u00fcr unzureichend sein. Ehegattenschenkung: Frist fr\u00fchestens ab Eheaufl\u00f6sung; kein Beginn bei noch nicht aufgel\u00f6ster Ehe. Ereignisjahre gem\u00e4\u00df\u00a7\u00a7187/188: jeweiliger Jahrestag wird noch bis Tagesschluss mitgerechnet, Abschlag ab Folgetag; keine Werktagsverschiebung. Vorherige Bewertung\u00a72325 Absatz2 und Ausnahme\u00a72330 separat, danach Pflichtteilsquote und weitere Anrechnungen; kein fertiger Erg\u00e4nzungsanspruch."))
  ergebnis
}
