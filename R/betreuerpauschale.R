betreuer_aufwandspauschale <- function(hoechststundensatz = NULL, betreuungsjahr_beginn = NULL,
    amtsende_am = NULL, erhaltener_vorschuss = NULL, erhaltener_aufwendungsersatz = NULL,
    verhinderungsbetreuung = NULL, taetigkeitszeitanteil = NULL,
    pauschalenanspruch_qualifiziert = NULL, berechnungsnachweis = NULL) {
  satz <- .geld(hoechststundensatz)
  if (.vergleichen(satz, .bruch(0)) <= 0) .fehler("hoechststundensatz", "Positiver zeitlich ma\u00dfgeblicher externer H\u00f6chststundensatz erforderlich.")
  beginn <- .datum(betreuungsjahr_beginn, "betreuungsjahr_beginn")
  jahresende <- .frist(betreuungsjahr_beginn, 1, "jahre", "tagesbeginn")
  amtsende <- NULL
  if (!is.null(amtsende_am)) {
    amtsende <- .datum(amtsende_am, "amtsende_am")
    if (amtsende < beginn || amtsende > jahresende) .fehler("amtsende_am", "Amtsende muss innerhalb des betrachteten Betreuungsjahres liegen.")
  }
  vorschuss <- .geld(erhaltener_vorschuss)
  ersatz <- .geld(erhaltener_aufwendungsersatz)
  .wahrheitswert(verhinderungsbetreuung, "verhinderungsbetreuung")
  .wahrheitswert(pauschalenanspruch_qualifiziert, "pauschalenanspruch_qualifiziert")
  .text(berechnungsnachweis, "berechnungsnachweis")
  taetigkeit <- NULL
  if (!is.null(taetigkeitszeitanteil)) {
    taetigkeit <- .zahleneingabe(taetigkeitszeitanteil)
    if (.vergleichen(taetigkeit, .bruch(0)) < 0 || .vergleichen(taetigkeit, .bruch(1)) > 0)
      .fehler("taetigkeitszeitanteil", "Qualifizierter Anteil des Betreuungsjahres muss zwischen null und eins liegen.")
  }
  if (verhinderungsbetreuung && is.null(taetigkeit)) .fehler("taetigkeitszeitanteil", "F\u00fcr Verhinderungsbetreuung ist qualifizierter tats\u00e4chlicher T\u00e4tigkeitszeitanteil erforderlich.", "EINGABE_FEHLT")
  if (!verhinderungsbetreuung && !is.null(taetigkeit)) .fehler("taetigkeitszeitanteil", "T\u00e4tigkeitszeitanteil nur f\u00fcr Verhinderungsbetreuung vorgeben.")
  eingaben <- list(hoechststundensatz = hoechststundensatz, betreuungsjahr_beginn = betreuungsjahr_beginn,
    amtsende_am = amtsende_am, erhaltener_vorschuss = erhaltener_vorschuss,
    erhaltener_aufwendungsersatz = erhaltener_aufwendungsersatz, verhinderungsbetreuung = verhinderungsbetreuung,
    taetigkeitszeitanteil = taetigkeitszeitanteil, pauschalenanspruch_qualifiziert = pauschalenanspruch_qualifiziert,
    berechnungsnachweis = berechnungsnachweis)
  wert <- NULL
  if (pauschalenanspruch_qualifiziert) {
    monate <- NULL
    if (verhinderungsbetreuung) anteil <- taetigkeit else {
      monate <- 12
      if (!is.null(amtsende)) for (n in 1:12) {
        if (amtsende <= .frist(betreuungsjahr_beginn, n, "monate", "tagesbeginn")) { monate <- n; break }
      }
      anteil <- .bruch(monate, 12)
    }
    jahresbetrag <- .multiplizieren(satz, .bruch(18))
    vor_abzug <- .multiplizieren(jahresbetrag, anteil)
    abzuege <- .addieren(vorschuss, ersatz)
    rest <- .subtrahieren(vor_abzug, abzuege)
    if (.vergleichen(rest, .bruch(0)) < 0) rest <- .bruch(0)
    wert <- list(betreuungsjahr_ende = .iso(jahresende), beruecksichtigte_monate = monate,
      zeitanteil = .bruchteile(anteil), jahrespauschale = .bruchteile(jahresbetrag),
      pauschale_vor_abzug = .bruchteile(vor_abzug), erhaltener_gesamtbetrag = .bruchteile(abzuege), restpauschale = .bruchteile(rest))
  }
  ergebnis <- .ergebnis(wert, "EUR", "BGB_BETREUER_AUFWANDSPAUSCHALE", eingaben,
    list(list(operation = "18fachen externen H\u00f6chststundensatz mit Jahresanteil multiplizieren; bei Amtsende begonnene Betreuungsmonate voll z\u00e4hlen, erhaltenen Vorschuss/Ersatz abziehen, Rest mindestens null")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Ein einzelnes rechtlich abgegrenztes Betreuungsjahr einer unverg\u00fcteten Betreuung und ein Betreuer; Jahresbeginn bezeichnet ersten mitgez\u00e4hlten Abrechnungstag. Externer zeitg\u00fcltiger JVEG-Satz belegt.")
  ergebnis$hinweise <- list("Je Betreuung und Mitbetreuer gesondert berechnen; Pauschale nicht pauschal zwischen mehreren Betreuern teilen. Ohne Amtsende voller Jahresbetrag, keine Aussage \u00fcber bereits eingetretene F\u00e4lligkeit. Jahresbeginn einschlie\u00dflich erster/weiterer Betreuungsjahre und Amtswirksamkeit rechtlich bestimmen; Kalendermonate nicht automatisch Januar bis Dezember. Bei Amtsende z\u00e4hlt jeder angefangene Betreuungsmonat voll; keine t\u00e4gliche K\u00fcrzung normaler Betreuung. Bei Verhinderungsbetreuung ist zeitanteilig tats\u00e4chlich abgedeckte T\u00e4tigkeit als qualifizierter Anteil des ganzen Betreuungsjahres vorzugeben, einschlie\u00dflich rechtlich gebotener Monatsbehandlung bei Amtsende; dieser Anteil wird nicht nochmals mit Monatsquote multipliziert. Keine selbst erfundene Tagesdivisorregel f\u00fcr\u00a71878 Absatz2. Vorschuss und Ersatz nur f\u00fcr dieselben erfassten Aufwendungen/Periode; \u00fcbersteigender Empfang ergibt Rest0, keinen automatisch festgestellten R\u00fcckzahlungsanspruch. Satz\u00e4nderungen innerhalb des Jahres und \u00dcbergangsrecht vorqualifizieren, nicht automatisch mitteln. Erl\u00f6schen nach Absatz4 und Antrag/F\u00e4lligkeit sind gesonderte Fristrechnung.")
  ergebnis
}

betreuer_pauschalenfristen <- function(bestellung_am = NULL, anspruchsentstehung_am = NULL) {
  bestellung <- .datum(bestellung_am, "bestellung_am")
  entstehung <- .datum(anspruchsentstehung_am, "anspruchsentstehung_am")
  if (entstehung < bestellung) .fehler("anspruchsentstehung_am", "Anspruchsentstehung darf nicht vor Bestellung liegen.")
  erstende <- .frist(bestellung_am, 1, "jahre", "ereignis")
  erloeschen <- .frist(paste0(substr(.iso(entstehung), 1, 4), "-12-31"), 6, "monate", "ereignis")
  eingaben <- list(bestellung_am = bestellung_am, anspruchsentstehung_am = anspruchsentstehung_am)
  ergebnis <- .ergebnis(list(erstes_jahresfristende = .iso(erstende), erloeschensgrundfristende = .iso(erloeschen)),
    "daten", "BGB_BETREUER_PAUSCHALENFRISTEN", eingaben,
    list(list(operation = "Ein Jahr ab Bestellung; sechs Monate ab Ablauf des qualifizierten Anspruchsentstehungsjahres")), eingaben)
  ergebnis$annahmen <- list("Bestellung als Ereignis; tats\u00e4chlicher Anspruchsentstehungstag rechtlich bestimmt. Grundfristen ohne gesonderte Ablaufkorrektur.")
  ergebnis$hinweise <- list("Erste Jahresfrist ab Bestellung, nicht Kalenderjahresende. Anspruchsentstehung kann bei vorherigem Amtsende vor erster Jahresfrist liegen und ist ausdr\u00fccklich vorgegeben. Erl\u00f6schensgrundfrist l\u00e4uft sechs Monate nach Ende dieses Entstehungsjahres. Rechtzeitige gerichtliche Geltendmachung, Wirkung des Jahresberichts nach einmaligem ausdr\u00fccklichem Antrag, Verzicht, Zust\u00e4ndigkeit und etwaige\u00a7193-Verschiebung gesondert rechtlich pr\u00fcfen; kein automatisches Erl\u00f6schensurteil. Anspruchsentstehung nach Satz\u00e4nderungen/\u00dcbergangsrecht nicht automatisch bestimmt.")
  ergebnis
}
