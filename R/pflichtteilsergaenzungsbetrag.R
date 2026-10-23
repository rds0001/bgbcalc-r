pflichtteilsergaenzung_grundbetrag <- function(pflichtteilsnachlass = NULL,
    hinzuzurechnende_schenkungen = NULL, gesetzliche_erbquote_zaehler = NULL,
    gesetzliche_erbquote_nenner = NULL, pflichtteilsberechtigt = NULL, bewertungsnachweis = NULL) {
  nachlass <- .zahleneingabe(pflichtteilsnachlass)
  schenkungen <- .geld(hinzuzurechnende_schenkungen)
  zaehler <- .ganzzahl(gesetzliche_erbquote_zaehler, "gesetzliche_erbquote_zaehler", 0, .zahlengrenze)
  nenner <- .ganzzahl(gesetzliche_erbquote_nenner, "gesetzliche_erbquote_nenner", 1, .zahlengrenze)
  if (zaehler > nenner) .fehler("gesetzliche_erbquote", "Gesetzliche Erbquote darf eins nicht \u00fcbersteigen.")
  .wahrheitswert(pflichtteilsberechtigt, "pflichtteilsberechtigt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(pflichtteilsnachlass = pflichtteilsnachlass, hinzuzurechnende_schenkungen = hinzuzurechnende_schenkungen,
    gesetzliche_erbquote_zaehler = gesetzliche_erbquote_zaehler, gesetzliche_erbquote_nenner = gesetzliche_erbquote_nenner,
    pflichtteilsberechtigt = pflichtteilsberechtigt, bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_PFLICHTTEILSERGAENZUNG_GRUNDBETRAG", eingaben,
    list(list(operation = "Tats\u00e4chlichen und um qualifizierte Drittschenkungen erh\u00f6hten Nachlass jeweils mindestens null ansetzen; halbe gesetzliche Erbquote anwenden und Pflichtteilsdifferenz bilden")))
  if (pflichtteilsberechtigt) {
    quote <- .multiplizieren(.bruch(zaehler, nenner), .bruch(1, 2))
    ordentlich <- .multiplizieren(if (nachlass$zaehler > 0) nachlass else .bruch(0), quote)
    fiktiv <- .addieren(nachlass, schenkungen)
    erhoeht <- .multiplizieren(if (fiktiv$zaehler > 0) fiktiv else .bruch(0), quote)
    ergebnis$wert <- list(ordentlicher_pflichtteilswert = .bruchteile(ordentlich),
      erhoehter_pflichtteilswert = .bruchteile(erhoeht), ergaenzungsgrundbetrag = .bruchteile(.subtrahieren(erhoeht, ordentlich)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Grundmodell ohne Anrechnung eigener Geschenke\u00a7\u00a72315/2327 oder Ausgleichung\u00a72316. Summe der Drittschenkungen muss bereits Bewertung, Abschmelzung und Ausnahmen erf\u00fcllen. Bei negativem Nachlass nicht blo\u00df Schenkungswert mal Quote rechnen. Mehrhinterlassung\u00a72326, Erbenschutz\u00a72328 und Beschenktenhaftung\u00a72329 separat; kein abschlie\u00dfender Zahlungsanspruch."))
  ergebnis
}
