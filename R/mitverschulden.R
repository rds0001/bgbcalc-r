vermoegensschaden_mitverschulden <- function(vermoegensschaden = NULL,
    mitverschuldensquote = NULL, quotenbegruendung = NULL,
    kuerzung_nach_254_anwendbar = NULL) {
  schaden <- .geld(vermoegensschaden)
  quote <- .zahleneingabe(mitverschuldensquote)
  if (.vergleichen(quote, .bruch(0)) < 0 || .vergleichen(quote, .bruch(1)) > 0) {
    .fehler("mitverschuldensquote", "Anteil zwischen null und eins erforderlich, keine Prozentzahl.")
  }
  .text(quotenbegruendung, "quotenbegruendung")
  .wahrheitswert(kuerzung_nach_254_anwendbar, "kuerzung_nach_254_anwendbar")
  eingaben <- list(vermoegensschaden = vermoegensschaden,
    mitverschuldensquote = mitverschuldensquote, quotenbegruendung = quotenbegruendung,
    kuerzung_nach_254_anwendbar = kuerzung_nach_254_anwendbar)
  ergebnis <- .geld_ergebnis(if (kuerzung_nach_254_anwendbar) .bruch(0) else NULL,
    "BGB_VERMOEGENSSCHADEN_MITVERSCHULDEN", eingaben, list(list(
      operation = "Rechtlich vorgegebene K\u00fcrzungsquote dieser Verm\u00f6gensschadensposition",
      anwendbar = kuerzung_nach_254_anwendbar, quote = .bruchteile(quote))))
  if (kuerzung_nach_254_anwendbar) {
    kuerzung <- .multiplizieren(schaden, quote)
    rest <- .subtrahieren(schaden, kuerzung)
    ergebnis$wert <- list(kuerzungsbetrag = .bruchteile(kuerzung),
      verbleibender_ersatzbetrag = .bruchteile(rest))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "Verm\u00f6gensschaden mal Quote abziehen; keine Rundung",
      kuerzungsbetrag = .bruchteile(kuerzung))))
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list(
    "Keine automatische Ermittlung der Mitverschuldensquote; nicht auf eine billige Entsch\u00e4digung \u00fcbertragen."))
  ergebnis
}
