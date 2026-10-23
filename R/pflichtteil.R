pflichtteil_betrag <- function(pflichtteilsnachlass = NULL, gesetzliche_erbquote_zaehler = NULL,
    gesetzliche_erbquote_nenner = NULL, anrechnungswert = NULL, anrechnungsbestimmung = NULL,
    pflichtteilsberechtigt = NULL, bewertungsnachweis = NULL) {
  nachlass <- .zahleneingabe(pflichtteilsnachlass)
  zuwendung <- .geld(anrechnungswert)
  .ganzzahl(gesetzliche_erbquote_zaehler, "gesetzliche_erbquote_zaehler", 0, .zahlengrenze)
  .ganzzahl(gesetzliche_erbquote_nenner, "gesetzliche_erbquote_nenner", 1, .zahlengrenze)
  if (gesetzliche_erbquote_zaehler > gesetzliche_erbquote_nenner) {
    .fehler("gesetzliche_erbquote", "Gesetzliche Erbquote darf 1 nicht \u00fcberschreiten.")
  }
  .wahrheitswert(anrechnungsbestimmung, "anrechnungsbestimmung")
  .wahrheitswert(pflichtteilsberechtigt, "pflichtteilsberechtigt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  quote <- .multiplizieren(.bruch(gesetzliche_erbquote_zaehler, gesetzliche_erbquote_nenner), .bruch(1, 2))
  eingaben <- list(pflichtteilsnachlass = pflichtteilsnachlass,
    gesetzliche_erbquote_zaehler = gesetzliche_erbquote_zaehler,
    gesetzliche_erbquote_nenner = gesetzliche_erbquote_nenner,
    anrechnungswert = anrechnungswert, anrechnungsbestimmung = anrechnungsbestimmung,
    pflichtteilsberechtigt = pflichtteilsberechtigt, bewertungsnachweis = bewertungsnachweis)
  schritte <- list(list(operation = "Pflichtteilsberechtigung und halbe gesetzliche Erbquote",
    anwendbar = pflichtteilsberechtigt, pflichtteilsquote = .bruchteile(quote)))
  wert <- NULL
  if (pflichtteilsberechtigt) {
    anrechnung <- if (anrechnungsbestimmung) zuwendung else .bruch(0)
    grundlage <- .addieren(nachlass, anrechnung)
    if (grundlage$zaehler < 0) grundlage <- .bruch(0)
    vor_anrechnung <- .multiplizieren(grundlage, quote)
    wert <- .subtrahieren(vor_anrechnung, anrechnung)
    if (wert$zaehler < 0) wert <- .bruch(0)
    schritte <- c(schritte, list(list(
      operation = "Anrechnungswert hinzurechnen, Quote anwenden, Wert abziehen; mindestens null",
      berechnungsgrundlage = .bruchteile(grundlage), vor_anrechnung = .bruchteile(vor_anrechnung),
      anrechnung = .bruchteile(anrechnung))))
  }
  .geld_ergebnis(wert, "BGB_PFLICHTTEIL_BETRAG", eingaben, schritte)
}

zusatzpflichtteil_betrag <- function(pflichtteilsbetrag = NULL, unbeschwerter_erbteilwert = NULL,
    pflichtteilsberechtigt = NULL) {
  anspruch <- .geld(pflichtteilsbetrag)
  erbteil <- .geld(unbeschwerter_erbteilwert)
  .wahrheitswert(pflichtteilsberechtigt, "pflichtteilsberechtigt")
  wert <- NULL
  if (pflichtteilsberechtigt) {
    wert <- .subtrahieren(anspruch, erbteil)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  .geld_ergebnis(wert, "BGB_ZUSATZPFLICHTTEIL_BETRAG", list(
    pflichtteilsbetrag = pflichtteilsbetrag, unbeschwerter_erbteilwert = unbeschwerter_erbteilwert,
    pflichtteilsberechtigt = pflichtteilsberechtigt),
    list(list(operation = "Pflichtteilsbetrag minus unbeschwerter Erbteilwert, mindestens null",
      anwendbar = pflichtteilsberechtigt)))
}

pflichtteil_vermaechtnisrest <- function(pflichtteilsbetrag = NULL, unbeschwerter_vermaechtniswert = NULL,
    vermaechtnis_ausgeschlagen = NULL, pflichtteilsberechtigt = NULL) {
  anspruch <- .geld(pflichtteilsbetrag)
  vermaechtnis <- .geld(unbeschwerter_vermaechtniswert)
  .wahrheitswert(vermaechtnis_ausgeschlagen, "vermaechtnis_ausgeschlagen")
  .wahrheitswert(pflichtteilsberechtigt, "pflichtteilsberechtigt")
  abzug <- if (vermaechtnis_ausgeschlagen) .bruch(0) else vermaechtnis
  wert <- NULL
  if (pflichtteilsberechtigt) {
    wert <- .subtrahieren(anspruch, abzug)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  .geld_ergebnis(wert, "BGB_PFLICHTTEIL_VERMAECHTNISREST",
    list(pflichtteilsbetrag = pflichtteilsbetrag, unbeschwerter_vermaechtniswert = unbeschwerter_vermaechtniswert,
      vermaechtnis_ausgeschlagen = vermaechtnis_ausgeschlagen, pflichtteilsberechtigt = pflichtteilsberechtigt),
    list(list(operation = "Nicht ausgeschlagenes Verm\u00e4chtnis auf Pflichtteil anrechnen, mindestens null",
      anwendbar = pflichtteilsberechtigt, abzug = .bruchteile(abzug))))
}
