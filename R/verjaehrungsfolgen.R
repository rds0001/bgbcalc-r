verjaehrung_aufrechnung_zurueckbehaltung <- function(letzter_tag_vor_verjaehrung = NULL,
    erstmals_ausuebbar_am = NULL, rechtsart = NULL, einordnungsnachweis = NULL) {
  fristende <- .datum(letzter_tag_vor_verjaehrung, "letzter_tag_vor_verjaehrung")
  moeglich <- .datum(erstmals_ausuebbar_am, "erstmals_ausuebbar_am")
  .auswahl(rechtsart, "rechtsart", c("aufrechnung", "zurueckbehaltung"))
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(letzter_tag_vor_verjaehrung = letzter_tag_vor_verjaehrung,
    erstmals_ausuebbar_am = erstmals_ausuebbar_am, rechtsart = rechtsart, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(moeglich <= fristende, "wahrheitswert", "BGB_VERJAEHRUNG_AUFRECHNUNG_ZURUECKBEHALTUNG", eingaben,
    list(list(operation = "Erstmalige rechtliche Aus\u00fcbbarkeit mit letztem Tag vor Verj\u00e4hrung vergleichen")), eingaben)
  ergebnis$annahmen <- list("Rechtlich abschlie\u00dfend bestimmter letzter unverj\u00e4hrter Tag und tats\u00e4chliche erstmalige Aus\u00fcbbarkeit des ausgew\u00e4hlten Rechts vorgegeben.")
  ergebnis$hinweise <- list("TRUE bedeutet nur: sp\u00e4tere Verj\u00e4hrung schlie\u00dft das bezeichnete Recht nach\u00a7215 nicht aus. Andere Voraussetzungen und Verbote bleiben bestehen. FALSE entscheidet nicht \u00fcber andere Ausnahmen. Fristdatum muss alle ma\u00dfgeblichen Hemmungen, Neubeginne und gegebenenfalls Werktagsverschiebung ber\u00fccksichtigen; keine rohe Grundfrist einsetzen.", "Taggenau normalisierte Rechtsereignisse; keine automatische Beurteilung untert\u00e4giger Verj\u00e4hrungs-/Aus\u00fcbungszeitpunkte. Einrede\u00a7390 nicht ohne Pr\u00fcfung dieses Privilegs aus blo\u00df sp\u00e4terem Fristablauf ableiten.")
  ergebnis
}
verjaehrung_abhaengige_nebenleistung <- function(hauptanspruch_letzter_tag = NULL,
    nebenleistung_eigener_letzter_tag = NULL, nebenleistung_abhaengig = NULL,
    fristnachweis = NULL) {
  haupt <- .datum(hauptanspruch_letzter_tag, "hauptanspruch_letzter_tag")
  neben <- .datum(nebenleistung_eigener_letzter_tag, "nebenleistung_eigener_letzter_tag")
  .wahrheitswert(nebenleistung_abhaengig, "nebenleistung_abhaengig")
  .text(fristnachweis, "fristnachweis")
  eingaben <- list(hauptanspruch_letzter_tag = hauptanspruch_letzter_tag,
    nebenleistung_eigener_letzter_tag = nebenleistung_eigener_letzter_tag,
    nebenleistung_abhaengig = nebenleistung_abhaengig, fristnachweis = fristnachweis)
  wert <- if (nebenleistung_abhaengig) .iso(min(haupt, neben)) else NULL
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERJAEHRUNG_ABHAENGIGE_NEBENLEISTUNG", eingaben,
    list(list(operation = "Bei abh\u00e4ngiger Nebenleistung fr\u00fcheren letzten Tag aus Hauptanspruch und eigener Verj\u00e4hrung w\u00e4hlen")), eingaben)
  ergebnis$status <- if (nebenleistung_abhaengig) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Abh\u00e4ngigkeit der Nebenleistung und beide ma\u00dfgeblichen Fristl\u00e4ufe rechtlich gepr\u00fcft; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nicht jede Forderung zwischen denselben Parteien ist abh\u00e4ngige Nebenleistung. Beide eingegebenen letzten Tage m\u00fcssen ihre jeweiligen Hemmungen, Neubeginne und sonstigen Ver\u00e4nderungen bereits zutreffend ber\u00fccksichtigen. Keine erneute Addition der Hemmungen zu diesem Minimum; keine automatische Feststellung einer erhobenen Verj\u00e4hrungseinrede.")
  ergebnis
}
