vergleichsmiete_zeitvoraussetzungen <- function(letzte_massgebliche_miete_ab = NULL,
    zugang_erhoehungsverlangen = NULL, verlangen_formell_ordnungsgemaess = NULL) {
  bisher <- .datum(letzte_massgebliche_miete_ab, "letzte_massgebliche_miete_ab")
  zugang <- .datum(zugang_erhoehungsverlangen, "zugang_erhoehungsverlangen")
  .wahrheitswert(verlangen_formell_ordnungsgemaess, "verlangen_formell_ordnungsgemaess")
  if (bisher > zugang) {
    .fehler("letzte_massgebliche_miete_ab", "Beginn der bisherigen Miete darf nicht nach Zugang liegen.")
  }
  eingaben <- list(letzte_massgebliche_miete_ab = letzte_massgebliche_miete_ab,
    zugang_erhoehungsverlangen = zugang_erhoehungsverlangen,
    verlangen_formell_ordnungsgemaess = verlangen_formell_ordnungsgemaess)
  wert <- NULL
  if (verlangen_formell_ordnungsgemaess) {
    nach_jahr <- .tage_addieren(.frist(letzte_massgebliche_miete_ab, 1, "jahre", "tagesbeginn"), 1)
    nach_wartefrist <- .tage_addieren(.frist(letzte_massgebliche_miete_ab, 15, "monate", "tagesbeginn"), 1)
    erster <- as.Date(paste0(substr(.iso(zugang), 1, 7), "-01"))
    mietbeginn <- .monatsende(erster, 3, FALSE)
    wert <- list(fruehester_zugang_nach_jahresfrist = .iso(nach_jahr),
      fruehester_mietbeginn_nach_wartefrist = .iso(nach_wartefrist),
      mietbeginn_bei_zustimmung = .iso(mietbeginn),
      rechnerisches_ende_zustimmungsfrist = .iso(.tage_addieren(mietbeginn, -1)),
      rechnerisches_ende_klagefrist = .iso(.tage_addieren(.monatsende(erster, 6, FALSE), -1)),
      jahresfrist_eingehalten = zugang >= nach_jahr,
      wartefrist_eingehalten = mietbeginn >= nach_wartefrist)
  }
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte",
    "BGB_VERGLEICHSMIETE_ZEITVORAUSSETZUNGEN", eingaben, list(list(
      operation = "Unver\u00e4nderte Mietdauer und zugangsbezogene Monatsfristen getrennt pr\u00fcfen",
      ergebnis = wert)), eingaben)
  ergebnis$status <- if (verlangen_formell_ordnungsgemaess) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Anwendungsbereich des Vergleichsmietenverfahrens und ma\u00dfgeblicher bisheriger Mietbeginn vorgegeben.")
  ergebnis$hinweise <- list(
    "Jahresfrist und Wartefrist sind getrennte Pr\u00fcfergebnisse; BERECHNET best\u00e4tigt keinen Mieterh\u00f6hungsanspruch.",
    "Erh\u00f6hungen nach \u00a7\u00a7 559 bis 560 setzen den ma\u00dfgeblichen bisherigen Mietbeginn f\u00fcr diese Fristen nicht automatisch neu.",
    "Mietbeginn setzt Zustimmung und weitere materielle Voraussetzungen voraus; keine automatische Verschiebung eines verfr\u00fchten Verlangens.",
    "Fristenden sind kalendarische Ausgangswerte; eine anwendbare Sonnabend-, Sonn- oder Feiertagsverschiebung ist gesondert zu pr\u00fcfen.",
    "Klagefrist folgt dem regul\u00e4ren Ablauf ohne Zustimmung; Nachholung oder Heilung nach \u00a7 558b Absatz 3 erfordert den ma\u00dfgeblichen neuen Zugang.")
  ergebnis
}
