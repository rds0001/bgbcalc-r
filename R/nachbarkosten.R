nachbarrecht_kostengleichanteil <- function(gesamtkosten = NULL,
    kostenart = NULL, beteiligtenzahl = NULL, abweichendes_rechtsverhaeltnis = NULL,
    gesetzlicher_kostenfall = NULL, kostennachweis = NULL) {
  kosten <- .geld(gesamtkosten)
  .auswahl(kostenart, "kostenart", c("abmarkung", "grenzeinrichtung_unterhaltung"))
  anzahl <- .ganzzahl(beteiligtenzahl, "beteiligtenzahl", 2, .zahlengrenze)
  .wahrheitswert(abweichendes_rechtsverhaeltnis, "abweichendes_rechtsverhaeltnis")
  .wahrheitswert(gesetzlicher_kostenfall, "gesetzlicher_kostenfall")
  .text(kostennachweis, "kostennachweis")
  if (kostenart == "grenzeinrichtung_unterhaltung" && anzahl != 2) {
    .fehler("beteiligtenzahl", "Unterhaltung zweier Nachbargrundst\u00fccke: genau zwei Kostenseiten erforderlich.")
  }
  eingaben <- list(gesamtkosten = gesamtkosten, kostenart = kostenart, beteiligtenzahl = beteiligtenzahl,
    abweichendes_rechtsverhaeltnis = abweichendes_rechtsverhaeltnis,
    gesetzlicher_kostenfall = gesetzlicher_kostenfall, kostennachweis = kostennachweis)
  gilt <- gesetzlicher_kostenfall && !abweichendes_rechtsverhaeltnis
  .geld_ergebnis(if (gilt) .multiplizieren(kosten, .bruch(1, anzahl)) else NULL,
    "BGB_NACHBARRECHT_KOSTENGLEICHANTEIL", eingaben,
    list(list(operation = "Gesetzlichen Kostenfall ohne abweichende Kostenregelung zu gleichen Teilen auf beteiligte Kostenseiten verteilen")))
}
grenzbaum_beseitigungskosten <- function(beseitigungskosten = NULL,
    anderer_nachbar_verzichtet = NULL, unersetzliches_grenzzeichen = NULL,
    grenzbaumregel_anwendbar = NULL, kostennachweis = NULL) {
  kosten <- .geld(beseitigungskosten)
  eingaben <- list(beseitigungskosten = beseitigungskosten, anderer_nachbar_verzichtet = anderer_nachbar_verzichtet,
    unersetzliches_grenzzeichen = unersetzliches_grenzzeichen, grenzbaumregel_anwendbar = grenzbaumregel_anwendbar,
    kostennachweis = kostennachweis)
  for (name in names(eingaben)[2:4]) .wahrheitswert(eingaben[[name]], name)
  .text(kostennachweis, "kostennachweis")
  gilt <- grenzbaumregel_anwendbar && !unersetzliches_grenzzeichen
  ergebnis <- .geld_ergebnis(NULL, "BGB_GRENZBAUM_BESEITIGUNGSKOSTEN", eingaben,
    list(list(operation = "Gesetzlichen Beseitigungsfall pr\u00fcfen; bei Verzicht des anderen alleinige, sonst h\u00e4lftige Kosten des Verlangenden")))
  if (gilt) {
    verlangender <- if (anderer_nachbar_verzichtet) kosten else .multiplizieren(kosten, .bruch(1, 2))
    ergebnis$wert <- list(kosten_verlangender_nachbar = .bruchteile(verlangender),
      kosten_anderer_nachbar = .bruchteile(.subtrahieren(kosten, verlangender)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur gesetzlicher Beseitigungsfall\u00a7923, auch Grenzstrauch. Dient der Baum als nicht zweckm\u00e4\u00dfig ersetzbares Grenzzeichen, ist dieser Anspruch ausgeschlossen; freiwillige anderweitige Regelungen separat. Rechtsverzicht am Baum rechtlich belegen. Eigentums\u00fcbergang bei Trennung und Fr\u00fcchteverteilung nicht durch Kostenergebnis entschieden."))
  ergebnis
}
