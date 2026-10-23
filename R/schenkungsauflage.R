schenkungsauflage_fehlbetrag <- function(erforderliche_aufwendungen = NULL,
    wert_der_mangelhaften_zuwendung = NULL, unterdeckung_vollstaendig_mangelbedingt = NULL,
    bewertungsnachweis = NULL) {
  eingaben <- list(erforderliche_aufwendungen = erforderliche_aufwendungen,
    wert_der_mangelhaften_zuwendung = wert_der_mangelhaften_zuwendung,
    unterdeckung_vollstaendig_mangelbedingt = unterdeckung_vollstaendig_mangelbedingt,
    bewertungsnachweis = bewertungsnachweis)
  aufwand <- .geld(erforderliche_aufwendungen)
  wert <- .geld(wert_der_mangelhaften_zuwendung)
  .wahrheitswert(unterdeckung_vollstaendig_mangelbedingt, "unterdeckung_vollstaendig_mangelbedingt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  fehlbetrag <- NULL
  if (unterdeckung_vollstaendig_mangelbedingt) {
    fehlbetrag <- .subtrahieren(aufwand, wert)
    if (fehlbetrag$zaehler < 0) fehlbetrag <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(fehlbetrag, "BGB_SCHENKUNGSAUFLAGE_FEHLBETRAG", eingaben,
    list(list(operation = "Mangelbedingt unzureichenden Zuwendungswert von erforderlichem Auflagenaufwand abziehen, mindestens null")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur \u00a7 526 Satz 1 bei vollst\u00e4ndig mangelbedingter Unterdeckung. Teilweise anders verursachte Unterdeckung gesondert bestimmen; FALSE ergibt NICHT_ANWENDBAR. Bereits geleisteter Ausgleich und Aufwendungsersatz nach Satz 2 werden hier nicht verrechnet."))
  ergebnis
}
