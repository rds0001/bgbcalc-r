vermaechtnis_lastenanteile <- function(gesamtbelastung = NULL, beschwerte = NULL, beschwertenart = NULL,
    beschwerungsart = NULL, zweifelsregel_anwendbar = NULL, bewertungsnachweis = NULL) {
  betrag <- .geld(gesamtbelastung)
  .auswahl(beschwertenart, "beschwertenart", c("erben", "vermaechtnisnehmer"))
  .auswahl(beschwerungsart, "beschwerungsart", c("vermaechtnis", "auflage"))
  .vorhanden(beschwerte, "beschwerte")
  if (!is.list(beschwerte) || !is.null(names(beschwerte)) || length(beschwerte) < 2 || length(beschwerte) > 1000)
    .fehler("beschwerte", "Liste mit 2 bis 1000 rechtlich bestimmten Beschwerten erforderlich.")
  namen <- character()
  gewichte <- list()
  summe <- .bruch(0)
  for (eintrag in beschwerte) {
    if (!is.list(eintrag) || !identical(sort(names(eintrag)), sort(c("beschwerter_id", "gewicht"))))
      .fehler("beschwerte", "Genau beschwerter_id und gewicht erforderlich.")
    name <- .text(eintrag$beschwerter_id, "beschwerter_id")
    if (name %in% namen) .fehler("beschwerter_id", "Beschwerte d\u00fcrfen nicht doppelt vorkommen.")
    gewicht <- .zahleneingabe(eintrag$gewicht)
    if (.vergleichen(gewicht, .bruch(0)) < 0 || (beschwertenart == "erben" &&
        (.vergleichen(gewicht, .bruch(0)) <= 0 || .vergleichen(gewicht, .bruch(1)) > 0)))
      .fehler("gewicht", "Erbteile m\u00fcssen positiv und h\u00f6chstens eins, Verm\u00e4chtniswerte nichtnegativ sein.")
    summe <- .addieren(summe, gewicht)
    namen <- c(namen, name)
    gewichte <- c(gewichte, list(gewicht))
  }
  if (.vergleichen(summe, .bruch(0)) == 0 || (beschwertenart == "erben" && .vergleichen(summe, .bruch(1)) > 0))
    .fehler("beschwerte", "Positive Gewichtssumme erforderlich; Summe tats\u00e4chlicher Erbteile darf eins nicht \u00fcbersteigen.")
  .wahrheitswert(zweifelsregel_anwendbar, "zweifelsregel_anwendbar")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(gesamtbelastung = gesamtbelastung, beschwerte = beschwerte,
    beschwertenart = beschwertenart, beschwerungsart = beschwerungsart,
    zweifelsregel_anwendbar = zweifelsregel_anwendbar, bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_VERMAECHTNIS_LASTENANTEILE", eingaben,
    list(list(operation = "Dieselbe Gesamtlast unter den Beschwerten proportional zu deren Erbteilen oder Verm\u00e4chtniswerten verteilen")))
  if (zweifelsregel_anwendbar) {
    anteile <- lapply(gewichte, function(g) .dividieren(g, summe))
    ergebnis$wert <- lapply(seq_along(namen), function(i)
      list(beschwerter_id = namen[[i]], lastquote = .bruchteile(anteile[[i]]),
        lastbetrag = .bruchteile(.multiplizieren(betrag, anteile[[i]]))))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("\u00a72148 ist Zweifelsregel, \u00fcber\u00a72192 auch f\u00fcr Auflagen. Abweichender Erblasserwille und tats\u00e4chliche Beschwerung vorab bestimmen. Nur die mit derselben Last beschwerten Personen einbeziehen; bei Erben d\u00fcrfen deren tats\u00e4chliche Erbteile zusammen unter1 liegen, wenn andere Erben nicht beschwert sind. Dann innerhalb dieser Auswahl normieren. Erben und Verm\u00e4chtnisnehmer nicht in einer ungekl\u00e4rten gemischten Gruppe verrechnen. Gewichte bei Erben sind Erbquoten, bei Verm\u00e4chtnisnehmern konsistent bewertete Verm\u00e4chtniswerte; kein pauschales Kopfteilprinzip. Nullwerte bei Verm\u00e4chtnissen f\u00fchren zu Nullanteilen, ausschlie\u00dflich Nullwerte liefern kein bestimmbares Verh\u00e4ltnis. Ergebnis verteilt eine qualifizierte EUR-Last, entscheidet aber nicht \u00fcber Gegenstands\u00fcbertragung, Au\u00dfenhaftung, Erf\u00fcllbarkeit oder weitere K\u00fcrzungsrechte."))
  ergebnis
}
