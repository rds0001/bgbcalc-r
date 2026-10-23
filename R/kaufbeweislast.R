.beweislast_ergebnis <- function(wert, kennung, eingaben, operation, hinweis) {
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", kennung, eingaben,
    list(list(operation = operation)), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Konkreter Verbrauchsg\u00fcterkauf nach fester lokaler BGB-Fassung; Gefahr\u00fcbergang und Auftreten des abweichenden Zustands rechtlich bestimmt.")
  ergebnis$hinweise <- list(hinweis, "Nur gesetzliche Beweislastvermutung, keine abschlie\u00dfende Mangelhaftigkeitsentscheidung und keine Verj\u00e4hrungsfrist. Keine automatische Werktagsverschiebung des tats\u00e4chlichen Auftretenszeitraums. Ereignistag und gesetzliches Zeitraumende einschlie\u00dflich; untert\u00e4gige Besonderheiten rechtlich vorab normalisieren.")
  ergebnis
}
kauf_beweislastvermutung <- function(gefahruebergang_am = NULL, zustand_zeigt_sich_am = NULL,
    lebendes_tier = NULL, zustand_abweichend = NULL, vermutung_mit_art_unvereinbar = NULL,
    regel_477_absatz_eins_anwendbar = NULL, einordnungsnachweis = NULL) {
  gefahr <- .datum(gefahruebergang_am, "gefahruebergang_am")
  zeigt <- .datum(zustand_zeigt_sich_am, "zustand_zeigt_sich_am")
  if (zeigt < gefahr) .fehler("zustand_zeigt_sich_am", "Auftreten darf nicht vor Gefahr\u00fcbergang liegen.")
  eingaben <- list(gefahruebergang_am = gefahruebergang_am, zustand_zeigt_sich_am = zustand_zeigt_sich_am,
    lebendes_tier = lebendes_tier, zustand_abweichend = zustand_abweichend,
    vermutung_mit_art_unvereinbar = vermutung_mit_art_unvereinbar,
    regel_477_absatz_eins_anwendbar = regel_477_absatz_eins_anwendbar,
    einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[3:6]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (regel_477_absatz_eins_anwendbar) {
    ende <- .frist(gefahruebergang_am, if (lebendes_tier) 6 else 12, "monate", "ereignis")
    innerhalb <- zeigt <= ende
    wert <- list(vermutungszeitraum_ende = .iso(ende), innerhalb_vermutungszeitraum = innerhalb,
      mangel_bei_gefahruebergang_vermutet = innerhalb && zustand_abweichend && !vermutung_mit_art_unvereinbar)
  }
  .beweislast_ergebnis(wert, "BGB_KAUF_BEWEISLASTVERMUTUNG", eingaben,
    "Ein Jahr seit Gefahr\u00fcbergang, bei lebendem Tier sechs Monate; abweichenden Zustand und Unvereinbarkeitsausnahme verkn\u00fcpfen",
    "Abweichung von\u00a7434/\u00a7475b sowie Unvereinbarkeit mit Art der Ware oder des mangelhaften Zustands ausdr\u00fccklich bewerten. F\u00fcr dauerhaft bereitgestellte digitale Elemente die eigenst\u00e4ndige Regel\u00a7477 Absatz2 beachten; nicht deren Zeitraum oder Aussage durch diese Funktion ersetzen.")
}
kauf_digitale_beweislastvermutung <- function(gefahruebergang_am = NULL, zustand_zeigt_sich_am = NULL,
    bereitstellung_ab = NULL, bereitstellung_bis = NULL, dauerhafte_bereitstellung_vereinbart = NULL,
    digitaler_zustand_abweichend = NULL, regel_477_absatz_zwei_anwendbar = NULL, einordnungsnachweis = NULL) {
  gefahr <- .datum(gefahruebergang_am, "gefahruebergang_am")
  zeigt <- .datum(zustand_zeigt_sich_am, "zustand_zeigt_sich_am")
  beginn <- .datum(bereitstellung_ab, "bereitstellung_ab")
  ende <- if (!is.null(bereitstellung_bis)) .datum(bereitstellung_bis, "bereitstellung_bis") else NULL
  if (zeigt < gefahr) .fehler("zustand_zeigt_sich_am", "Auftreten darf nicht vor Gefahr\u00fcbergang liegen.")
  if (!is.null(ende) && ende < beginn) .fehler("bereitstellung_bis", "Bereitstellungsende darf nicht vor Beginn liegen.")
  eingaben <- list(gefahruebergang_am = gefahruebergang_am, zustand_zeigt_sich_am = zustand_zeigt_sich_am,
    bereitstellung_ab = bereitstellung_ab, bereitstellung_bis = bereitstellung_bis,
    dauerhafte_bereitstellung_vereinbart = dauerhafte_bereitstellung_vereinbart,
    digitaler_zustand_abweichend = digitaler_zustand_abweichend,
    regel_477_absatz_zwei_anwendbar = regel_477_absatz_zwei_anwendbar,
    einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[5:7]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (regel_477_absatz_zwei_anwendbar) {
    zweijahre <- .frist(gefahruebergang_am, 2, "jahre", "ereignis")
    innerhalb_zwei <- zeigt <= zweijahre
    innerhalb_bereitstellung <- zeigt >= beginn && (is.null(ende) || zeigt <= ende)
    wert <- list(zweijahreszeitraum_ende = .iso(zweijahre), innerhalb_zweijahreszeitraum = innerhalb_zwei,
      innerhalb_bereitstellungsdauer = innerhalb_bereitstellung,
      mangel_waehrend_bisheriger_bereitstellung_vermutet = dauerhafte_bereitstellung_vereinbart &&
        digitaler_zustand_abweichend && (innerhalb_zwei || innerhalb_bereitstellung))
  }
  .beweislast_ergebnis(wert, "BGB_KAUF_DIGITALE_BEWEISLASTVERMUTUNG", eingaben,
    "Auftreten innerhalb zweier Jahre seit Gefahr\u00fcbergang ODER w\u00e4hrend vereinbarter dauerhafter Bereitstellung; digitale Abweichung pr\u00fcfen",
    "Nur digitale Elemente einer Ware mit vereinbarter dauerhafter Bereitstellung; kein allgemeiner Digitalproduktvertrag. NULL beim Bereitstellungsende bedeutet rechtlich unbefristet laufend, nicht unbekannt. Vereinbarte Bereitstellung darf l\u00e4nger oder k\u00fcrzer als zwei Jahre sein; der Zweijahresweg bleibt eigenst\u00e4ndig. Vermutung betrifft die bisherige Bereitstellungsdauer und nicht nur den Gefahr\u00fcbergang. Keine zus\u00e4tzliche Unvereinbarkeitsausnahme ausAbsatz1 in den Wortlaut vonAbsatz2 \u00fcbernehmen.")
}
