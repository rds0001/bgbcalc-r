widerruf_verbraucherdarlehen_betrag <- function(darlehensbetrag = NULL,
    sollzinssatz_prozent = NULL, zeitanteil_zaehler = NULL, zeitanteil_nenner = NULL,
    zeitanteil_nachweis = NULL, immobiliar_verbraucherdarlehen = NULL,
    niedrigerer_gebrauchsvorteil_nachgewiesen = NULL, gebrauchsvorteil_betrag = NULL,
    nicht_rueckforderbare_oeffentliche_aufwendungen = NULL, widerruf_anwendbar = NULL) {
  kapital <- .geld(darlehensbetrag)
  zinssatz <- .geld(sollzinssatz_prozent)
  anteil <- .zeitanteil(zeitanteil_zaehler, zeitanteil_nenner, zeitanteil_nachweis)
  kosten <- .geld(nicht_rueckforderbare_oeffentliche_aufwendungen)
  eingaben <- list(darlehensbetrag = darlehensbetrag, sollzinssatz_prozent = sollzinssatz_prozent,
    zeitanteil_zaehler = zeitanteil_zaehler, zeitanteil_nenner = zeitanteil_nenner,
    zeitanteil_nachweis = zeitanteil_nachweis, immobiliar_verbraucherdarlehen = immobiliar_verbraucherdarlehen,
    niedrigerer_gebrauchsvorteil_nachgewiesen = niedrigerer_gebrauchsvorteil_nachgewiesen,
    gebrauchsvorteil_betrag = gebrauchsvorteil_betrag,
    nicht_rueckforderbare_oeffentliche_aufwendungen = nicht_rueckforderbare_oeffentliche_aufwendungen,
    widerruf_anwendbar = widerruf_anwendbar)
  for (name in c("immobiliar_verbraucherdarlehen", "niedrigerer_gebrauchsvorteil_nachgewiesen", "widerruf_anwendbar")) {
    .wahrheitswert(eingaben[[name]], name)
  }
  nutzen <- NULL
  if (!is.null(gebrauchsvorteil_betrag) || (immobiliar_verbraucherdarlehen && niedrigerer_gebrauchsvorteil_nachgewiesen)) {
    nutzen <- .geld(gebrauchsvorteil_betrag)
  }
  ergebnis <- .geld_ergebnis(NULL, "BGB_WIDERRUF_VERBRAUCHERDARLEHEN_BETRAG", eingaben,
    list(list(operation = "Vertraglichen Sollzins \u00fcber belegten Jahresanteil berechnen; bei Immobiliardarlehen nachgewiesenen niedrigeren Gebrauchsvorteil ber\u00fccksichtigen; \u00f6ffentliche Aufwendungen hinzuf\u00fcgen")))
  if (widerruf_anwendbar) {
    zins <- .multiplizieren(.multiplizieren(kapital, .multiplizieren(zinssatz, .bruch(1, 100))), anteil)
    ersatz <- zins
    if (immobiliar_verbraucherdarlehen && niedrigerer_gebrauchsvorteil_nachgewiesen && .vergleichen(nutzen, zins) < 0) ersatz <- nutzen
    ergebnis$wert <- list(vertraglicher_sollzinsbetrag = .bruchteile(zins),
      geschuldeter_nutzungsbetrag = .bruchteile(ersatz),
      oeffentliche_aufwendungen = .bruchteile(kosten), gesamtbetrag = .bruchteile(.addieren(ersatz, kosten)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur\u00a7357b Absatz3 f\u00fcr Verbraucherdarlehen mit nichtnegativem Sollzinssatz, konstanter Kapitalbasis und konstantem Satz im eingegebenen Abschnitt. Bei \u00c4nderungen getrennte Abschnitte bilden und \u00f6ffentliche Aufwendungen nur einmal erfassen. Jahresanteil betrifft Auszahlung bis R\u00fcckzahlung nach belegter Zinskonvention, keine pauschale365-Tage-Annahme. Kapitalr\u00fcckzahlung ist nicht im gesamtbetrag enthalten. Finanzierungshilfen und weitere Sondervorschriften separat."))
  ergebnis
}
