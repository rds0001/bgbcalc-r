ruecktritt_aufwendungsersatz <- function(notwendige_verwendungen = NULL,
    andere_aufwendungen = NULL, bereicherung_durch_andere_aufwendungen = NULL,
    gegenstand_zurueckgegeben = NULL, wertersatz_geleistet = NULL,
    wertersatzpflicht_nach_346_3_nummer_1_2_ausgeschlossen = NULL, bewertungsnachweis = NULL) {
  notwendig <- .geld(notwendige_verwendungen)
  andere <- .geld(andere_aufwendungen)
  bereicherung <- .geld(bereicherung_durch_andere_aufwendungen)
  eingaben <- list(notwendige_verwendungen = notwendige_verwendungen, andere_aufwendungen = andere_aufwendungen,
    bereicherung_durch_andere_aufwendungen = bereicherung_durch_andere_aufwendungen,
    gegenstand_zurueckgegeben = gegenstand_zurueckgegeben, wertersatz_geleistet = wertersatz_geleistet,
    wertersatzpflicht_nach_346_3_nummer_1_2_ausgeschlossen = wertersatzpflicht_nach_346_3_nummer_1_2_ausgeschlossen,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[4:6]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  anwendbar <- gegenstand_zurueckgegeben || wertersatz_geleistet ||
    wertersatzpflicht_nach_346_3_nummer_1_2_ausgeschlossen
  gedeckt <- if (.vergleichen(andere, bereicherung) <= 0) andere else bereicherung
  gesamt <- if (anwendbar) .addieren(notwendig, gedeckt) else NULL
  ergebnis <- .geld_ergebnis(gesamt, "BGB_RUECKTRITT_AUFWENDUNGSERSATZ", eingaben,
    list(list(operation = "R\u00fcckgew\u00e4hr-/Wertersatzlage pr\u00fcfen; notwendige Verwendungen plus andere Aufwendungen bis zur Bereicherung")))
  if (anwendbar) {
    ergebnis$wert <- list(notwendige_verwendungen_ersatz = .bruchteile(notwendig),
      andere_aufwendungen_ersatz = .bruchteile(gedeckt), gesamtbetrag = .bruchteile(gesamt))
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Qualifizierte notwendige Verwendungen und andere Aufwendungen \u00fcberschneidungsfrei abgrenzen. Blo\u00dfer Wertersatzausschluss nach\u00a7346 Absatz3 Nummer3 erf\u00fcllt die hier gepr\u00fcfte Ausnahme nicht. Kein R\u00fccktrittsgrund, keine Bewertung der Notwendigkeit/Bereicherung und keine automatische Aufrechnung mit R\u00fcckgew\u00e4hranspr\u00fcchen."))
  ergebnis
}
