modernisierung_pflichtverletzungsvermutung <- function(monatliche_miete = NULL,
    angekuendigte_monatliche_erhoehung = NULL, ankuendigung_nach_555c_absatz_1 = NULL,
    beginnverzoegerung_nummer_1 = NULL, belastungen_nummer_3 = NULL,
    arbeitsruhe_nummer_4 = NULL, objektiver_grund_dargelegt = NULL, tatbestandsnachweis = NULL) {
  eingaben <- list(monatliche_miete = monatliche_miete,
    angekuendigte_monatliche_erhoehung = angekuendigte_monatliche_erhoehung,
    ankuendigung_nach_555c_absatz_1 = ankuendigung_nach_555c_absatz_1,
    beginnverzoegerung_nummer_1 = beginnverzoegerung_nummer_1,
    belastungen_nummer_3 = belastungen_nummer_3, arbeitsruhe_nummer_4 = arbeitsruhe_nummer_4,
    objektiver_grund_dargelegt = objektiver_grund_dargelegt, tatbestandsnachweis = tatbestandsnachweis)
  miete <- .geld(monatliche_miete)
  if (miete$zaehler <= 0) .fehler("monatliche_miete", "Positive monatliche Vergleichsmiete erforderlich.")
  erhoehung <- .geld(angekuendigte_monatliche_erhoehung)
  for (name in c("ankuendigung_nach_555c_absatz_1", "beginnverzoegerung_nummer_1",
      "belastungen_nummer_3", "arbeitsruhe_nummer_4", "objektiver_grund_dargelegt"))
    .wahrheitswert(eingaben[[name]], name)
  .text(tatbestandsnachweis, "tatbestandsnachweis")
  nummer_2 <- ankuendigung_nach_555c_absatz_1 && .vergleichen(erhoehung, miete) >= 0
  tatbestand <- beginnverzoegerung_nummer_1 || nummer_2 || belastungen_nummer_3 || arbeitsruhe_nummer_4
  wert <- list(verdoppelung_nummer_2 = nummer_2, vermutungstatbestand_erfuellt = tatbestand,
    pflichtverletzung_wird_vermutet = tatbestand && !objektiver_grund_dargelegt)
  ergebnis <- .ergebnis(wert, "wahrheitswerte", "BGB_MODERNISIERUNG_PFLICHTVERLETZUNGSVERMUTUNG",
    eingaben, list(list(operation = "Angek\u00fcndigte Erh\u00f6hung mit bisheriger Monatsmiete vergleichen; alternative Tatbest\u00e4nde und objektiven Grund ber\u00fccksichtigen")), eingaben)
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; sachlicher und zeitlicher Anwendungsbereich sowie Tatbest\u00e4nde Nummer 1, 3 und 4 rechtlich vorgegeben.")
  ergebnis$hinweise <- list("Widerlegbare Vermutung, keine abschlie\u00dfende Feststellung einer Pflichtverletzung oder eines Schadenersatzanspruchs. Ein objektiver Grund muss das relevante Verhalten im Einzelfall abdecken.",
    "Keine Zeitberechnung f\u00fcr Nummer 1 oder 4 und keine automatische Bewertung objektiv nicht notwendiger Belastungen nach Nummer 3.")
  ergebnis
}
