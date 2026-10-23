erbschaftskauf_belastungswertminderung <- function(wert_ohne_belastung=NULL,wert_mit_belastung=NULL,
    unentgeltliche_belastung_vor_kauf_qualifiziert=NULL,kaeufer_kennt_belastung_beim_kauf=NULL,
    bewertungsnachweis=NULL) {
  ohne <- .geld(wert_ohne_belastung); mit <- .geld(wert_mit_belastung)
  .wahrheitswert(unentgeltliche_belastung_vor_kauf_qualifiziert,"unentgeltliche_belastung_vor_kauf_qualifiziert")
  .wahrheitswert(kaeufer_kennt_belastung_beim_kauf,"kaeufer_kennt_belastung_beim_kauf")
  .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(wert_ohne_belastung=wert_ohne_belastung,wert_mit_belastung=wert_mit_belastung,
    unentgeltliche_belastung_vor_kauf_qualifiziert=unentgeltliche_belastung_vor_kauf_qualifiziert,
    kaeufer_kennt_belastung_beim_kauf=kaeufer_kennt_belastung_beim_kauf,bewertungsnachweis=bewertungsnachweis)
  wert <- NULL
  if (unentgeltliche_belastung_vor_kauf_qualifiziert) {
    minderung <- .subtrahieren(ohne,mit)
    if (.vergleichen(minderung,.bruch(0))<0) minderung <- .bruch(0)
    wert <- list(wertminderung=.bruchteile(minderung),ersatzbetrag=.bruchteile(if (kaeufer_kennt_belastung_beim_kauf) .bruch(0) else minderung))
  }
  ergebnis <- .ergebnis(wert,"EUR","BGB_ERBSCHAFTSKAUF_BELASTUNGSWERTMINDERUNG",eingaben,
    list(list(operation="Wert ohne minus Wert mit Belastung mindestens null; bei K\u00e4uferkenntnis bei Kauf kein Ersatz nach2375")),eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; Vergleichswerte derselben Sache und rechtlich desselben Bewertungszeitpunkts, isolierte Wirkung der unentgeltlichen Belastung vor Kauf.")
  ergebnis$hinweise <- list("Nur unentgeltliche Belastung eines Erbschaftsgegenstands durch Verk\u00e4ufer vor Erbschaftskauf nach\u00a72375 Absatz1. Vergleichswerte nicht pauschal historische Vorher-/aktuelle Nachherpreise mit anderen Marktbewegungen. Kenntnisse bei Vertragsschluss rechtlich qualifizieren. Verbrauch oder vollst\u00e4ndige unentgeltliche Ver\u00e4u\u00dferung und andere Haftungsgrundlagen getrennt; deren blo\u00dfe Wertvorgabe w\u00e4re keine eigene Differenzrechnung. Keine automatische Anwendung auf Schenkung der Erbschaft:\u00a72385 Absatz2 enth\u00e4lt eigene Ausnahme. Wertminderung kann vorhanden sein, obwohl wegen K\u00e4uferkenntnis der2375-Ersatzbetrag null ist.")
  ergebnis
}
erbschaftskauf_verwendungsersatz <- function(notwendige_verwendungen_vor_kauf=NULL,
    andere_aufwendungen_vor_kauf=NULL,fortbestehende_wertsteigerung_beim_kauf=NULL,
    aufwendungen_nach_2381_qualifiziert=NULL,bewertungsnachweis=NULL) {
  notwendig <- .geld(notwendige_verwendungen_vor_kauf)
  andere <- .geld(andere_aufwendungen_vor_kauf)
  steigerung <- .geld(fortbestehende_wertsteigerung_beim_kauf)
  .wahrheitswert(aufwendungen_nach_2381_qualifiziert,"aufwendungen_nach_2381_qualifiziert")
  .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(notwendige_verwendungen_vor_kauf=notwendige_verwendungen_vor_kauf,
    andere_aufwendungen_vor_kauf=andere_aufwendungen_vor_kauf,
    fortbestehende_wertsteigerung_beim_kauf=fortbestehende_wertsteigerung_beim_kauf,
    aufwendungen_nach_2381_qualifiziert=aufwendungen_nach_2381_qualifiziert,bewertungsnachweis=bewertungsnachweis)
  wert <- NULL
  if (aufwendungen_nach_2381_qualifiziert) {
    andere_ersatz <- if (.vergleichen(andere,steigerung)<0) andere else steigerung
    wert <- list(ersatz_notwendiger_verwendungen=.bruchteile(notwendig),
      ersatz_anderer_aufwendungen=.bruchteile(andere_ersatz),gesamter_verwendungsersatz=.bruchteile(.addieren(notwendig,andere_ersatz)))
  }
  ergebnis <- .ergebnis(wert,"EUR","BGB_ERBSCHAFTSKAUF_VERWENDUNGSERSATZ",eingaben,
    list(list(operation="Notwendige Vorverwendungen voll; andere Voraufwendungen auf fortbestehende Wertsteigerung beim Kauf begrenzen und addieren")),eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; vom Verk\u00e4ufer vor Kauf gemachte notwendige und andere Aufwendungen \u00fcberschneidungsfrei getrennt.")
  ergebnis$hinweise <- list("Nur\u00a72381: Wertsteigerung gerade durch die anderen Aufwendungen und noch zur Zeit des Verkaufs vorhanden. Notwendige Verwendungen nicht zus\u00e4tzlich nochmals in anderen Aufwendungen oder deren Wertdeckung z\u00e4hlen. Kein automatischer Ersatz nach Kauf entstandener Aufwendungen. Geldwerte rechtlich bestimmen, keine erfundene Bewertung. Tilgung von Nachlassverbindlichkeiten\u00a72378 Absatz2 und zeitliche Lasten-/Nutzungszuordnung\u00a7\u00a72379/2380 sowie sonstige Kaufabrechnung separat.")
  ergebnis
}
