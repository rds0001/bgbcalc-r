zugewinnausgleich_vorausempfang_standardfall <- function(zugewinn_zuwendender = NULL,
    zugewinn_empfaenger = NULL, vorausempfang = NULL, haftungsgrenze_zuwendender = NULL,
    haftungsgrenze_empfaenger = NULL, standardfall_bestaetigt = NULL, bewertungsnachweis = NULL) {
  geber <- .geld(zugewinn_zuwendender)
  empfaenger <- .geld(zugewinn_empfaenger)
  zuwendung <- .geld(vorausempfang)
  grenze_geber <- .geld(haftungsgrenze_zuwendender)
  grenze_empfaenger <- .geld(haftungsgrenze_empfaenger)
  .wahrheitswert(standardfall_bestaetigt, "standardfall_bestaetigt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(zugewinn_zuwendender = zugewinn_zuwendender, zugewinn_empfaenger = zugewinn_empfaenger,
    vorausempfang = vorausempfang, haftungsgrenze_zuwendender = haftungsgrenze_zuwendender,
    haftungsgrenze_empfaenger = haftungsgrenze_empfaenger, standardfall_bestaetigt = standardfall_bestaetigt,
    bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (standardfall_bestaetigt) {
    geber_bereinigt <- .addieren(geber, zuwendung)
    empfaenger_bereinigt <- .subtrahieren(empfaenger, zuwendung)
    if (.vergleichen(empfaenger_bereinigt, .bruch(0)) < 0) empfaenger_bereinigt <- .bruch(0)
    differenz <- .subtrahieren(geber_bereinigt, empfaenger_bereinigt)
    if (.vergleichen(differenz, .bruch(0)) < 0) differenz <- .bruch(0)
    forderung <- .multiplizieren(differenz, .bruch(1, 2))
    gegendifferenz <- .subtrahieren(empfaenger, geber)
    if (.vergleichen(gegendifferenz, .bruch(0)) < 0) gegendifferenz <- .bruch(0)
    gegenforderung <- .multiplizieren(gegendifferenz, .bruch(1, 2))
    if (.vergleichen(grenze_geber, forderung) >= 0 && .vergleichen(grenze_empfaenger, gegenforderung) >= 0) {
      angerechnet <- if (.vergleichen(forderung, zuwendung) < 0) forderung else zuwendung
      rest <- .subtrahieren(forderung, angerechnet)
      richtung <- if (.vergleichen(rest, .bruch(0)) > 0) "zuwendender_an_empfaenger" else if (.vergleichen(gegenforderung, .bruch(0)) > 0) "empfaenger_an_zuwendenden" else "kein_zahlbetrag"
      zahlbetrag <- if (.vergleichen(rest, gegenforderung) > 0) rest else gegenforderung
      wert <- list(zugewinn_zuwendender_bereinigt = .bruchteile(geber_bereinigt),
        zugewinn_empfaenger_bereinigt = .bruchteile(empfaenger_bereinigt),
        ausgleichsforderung_vor_anrechnung = .bruchteile(forderung), angerechneter_vorausempfang = .bruchteile(angerechnet),
        restforderung_empfaenger = .bruchteile(rest), gegenforderung_ohne_1380 = .bruchteile(gegenforderung),
        richtung = richtung, zahlbetrag = .bruchteile(zahlbetrag))
    }
  }
  ergebnis <- .ergebnis(wert, "EUR", "BGB_ZUGEWINNAUSGLEICH_VORAUSEMPFANG_STANDARDFALL", eingaben,
    list(list(operation = "Einseitigen Vorausempfang dem Geberzugewinn hinzuf\u00fcgen und aus Empf\u00e4ngerzugewinn entfernen; positiven halben \u00dcberschuss h\u00f6chstens bis null anrechnen; Gegenforderung separat ohne\u00a71380 berechnen")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Nur einseitige Vorausempf\u00e4nge, einschlie\u00dflich verbrauchtem Empfang und Empf\u00e4ngerzugewinn unter Empfang, keine negativen tats\u00e4chlichen Verm\u00f6gensdifferenzen; Haftungsgrenzen greifen auch vor Anrechnung nicht ein.")
  ergebnis$hinweise <- list("G\u00fcltige Anrechnungsbestimmung und Bewertung zum Zuwendungszeitpunkt einschlie\u00dflich rechtlich gebotener Wertanpassung vorgegeben. Standardfall verlangt nichtnegative ungekappt ermittelte Verm\u00f6gensdifferenzen beider Ehegatten, keine gegenl\u00e4ufigen Vorausempf\u00e4nge und keine unterschiedlichen Zuwendungs-/Herausrechnungswerte. Empf\u00e4ngerzugewinn wird nach Herausrechnung h\u00f6chstens bis null gemindert; Verbrauch oder Empf\u00e4ngerzugewinn unter Empfang schlie\u00dfen die Rechnung nicht aus. Keine zus\u00e4tzliche Behandlung als privilegiertes Anfangsverm\u00f6gen oder illoyale Hinzurechnung. Bei eingreifender Haftungsgrenze NICHT_ANWENDBAR, keine erfundene Verlust-/Deckelreihenfolge. Empf\u00e4ngerforderung nach\u00a71380 nicht negativ machen; Gegenforderung aus urspr\u00fcnglichen Zugewinnen nach\u00a71378 getrennt, nicht aus negativem Anrechnungsrest. Haftungsgrenzen beider Seiten nach\u00a71378 Absatz2 qualifiziert vorgeben. Ergebnis schlie\u00dft Rechenweg dieses Standardfalls, nicht H\u00e4rteeinrede, Verj\u00e4hrung, Vereinbarung oder andere Modifikationen. Keine Schenkungsteuerberechnung.")
  ergebnis
}
