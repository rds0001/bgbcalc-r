fruechte_lasten_betragszuordnung <- function(zuordnungsart = NULL, gesamtbetrag = NULL,
    massgebliches_ereignis_im_zeitraum = NULL, zeitanteil_zaehler = NULL, zeitanteil_nenner = NULL,
    abweichende_bestimmung = NULL, zuordnungsnachweis = NULL) {
  .auswahl(zuordnungsart, "zuordnungsart", c("natuerliche_fruechte", "sonstige_fruechte",
    "regelmaessige_fruechte", "sonstige_lasten", "regelmaessige_lasten"))
  betrag <- .geld(gesamtbetrag)
  .wahrheitswert(massgebliches_ereignis_im_zeitraum, "massgebliches_ereignis_im_zeitraum")
  .wahrheitswert(abweichende_bestimmung, "abweichende_bestimmung")
  .text(zuordnungsnachweis, "zuordnungsnachweis")
  regelmaessig <- zuordnungsart %in% c("regelmaessige_fruechte", "regelmaessige_lasten")
  anteil <- NULL
  if (regelmaessig || !is.null(zeitanteil_zaehler) || !is.null(zeitanteil_nenner)) {
    anteil <- .zeitanteil(zeitanteil_zaehler, zeitanteil_nenner, zuordnungsnachweis)
    if (.vergleichen(anteil, .bruch(1)) > 0) .fehler("zeitanteil", "Zeitanteil darf eins nicht \u00fcbersteigen.")
  }
  eingaben <- list(zuordnungsart = zuordnungsart, gesamtbetrag = gesamtbetrag,
    massgebliches_ereignis_im_zeitraum = massgebliches_ereignis_im_zeitraum,
    zeitanteil_zaehler = zeitanteil_zaehler, zeitanteil_nenner = zeitanteil_nenner,
    abweichende_bestimmung = abweichende_bestimmung, zuordnungsnachweis = zuordnungsnachweis)
  wert <- NULL
  if (!abweichende_bestimmung) {
    wert <- if (regelmaessig) .multiplizieren(betrag, anteil) else
      if (massgebliches_ereignis_im_zeitraum) betrag else .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_FRUECHTE_LASTEN_BETRAGSZUORDNUNG", eingaben,
    list(list(operation = "Wiederkehrende Betr\u00e4ge nach Zeitanteil, sonst nach rechtlich ma\u00dfgeblichem Trennungs-/F\u00e4lligkeits-/Entrichtungsereignis zuordnen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nat\u00fcrliche Fr\u00fcchte: Trennung; sonstige Fr\u00fcchte: F\u00e4lligkeit; sonstige Lasten: rechtlicher Entrichtungszeitpunkt. Regelm\u00e4\u00dfige Betr\u00e4ge nach Daueranteil unabh\u00e4ngig vom einzelnen F\u00e4lligkeitstag. Abweichende Bestimmung gesondert; keine automatische Eigentums\u00fcbertragung bestimmter Naturst\u00fccke."))
  ergebnis
}

fruechte_gewinnungskostenersatz <- function(ordnungsgemaesse_gewinnungskosten = NULL,
    wert_der_fruechte = NULL, herausgabepflicht_fruechte = NULL, kostennachweis = NULL) {
  kosten <- .geld(ordnungsgemaesse_gewinnungskosten)
  wert <- .geld(wert_der_fruechte)
  .wahrheitswert(herausgabepflicht_fruechte, "herausgabepflicht_fruechte")
  .text(kostennachweis, "kostennachweis")
  eingaben <- list(ordnungsgemaesse_gewinnungskosten = ordnungsgemaesse_gewinnungskosten,
    wert_der_fruechte = wert_der_fruechte, herausgabepflicht_fruechte = herausgabepflicht_fruechte,
    kostennachweis = kostennachweis)
  ergebniswert <- NULL
  if (herausgabepflicht_fruechte) ergebniswert <- if (.vergleichen(kosten, wert) < 0) kosten else wert
  .geld_ergebnis(ergebniswert, "BGB_FRUECHTE_GEWINNUNGSKOSTENERSATZ", eingaben,
    list(list(operation = "Bei Fr\u00fcchteherausgabepflicht ordnungsgem\u00e4\u00dfe Gewinnungskosten auf Fruchtwert begrenzen")))
}
