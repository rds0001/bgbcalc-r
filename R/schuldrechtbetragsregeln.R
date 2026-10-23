fremdwaehrung_eurobetrag <- function(fremdwaehrungsbetrag = NULL, eurokurs = NULL, eurozahlung_nach_244_zulaessig = NULL, bewertungsnachweis = NULL) {
  eingaben <- list(fremdwaehrungsbetrag = fremdwaehrungsbetrag, eurokurs = eurokurs, eurozahlung_nach_244_zulaessig = eurozahlung_nach_244_zulaessig, bewertungsnachweis = bewertungsnachweis)
  a <- .geld(fremdwaehrungsbetrag)
  b <- .geld(eurokurs)
  .wahrheitswert(eurozahlung_nach_244_zulaessig, "eurozahlung_nach_244_zulaessig")
  .text(bewertungsnachweis, "bewertungsnachweis")
  if (b$zaehler == 0) .fehler("eurokurs", "Positiver Eurokurs erforderlich.")
  betrag <- NULL
  if (eurozahlung_nach_244_zulaessig) {
    betrag <- .multiplizieren(a, b)
  }
  ergebnis <- .geld_ergebnis(betrag, "BGB_FREMDWAEHRUNG_EUROBETRAG", eingaben, list(list(operation = "Fremdw\u00e4hrungsbetrag mit Euro je Einheit Fremdw\u00e4hrung multiplizieren.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Kurswert am Zahlungsort zur tats\u00e4chlichen Zahlungszeit als belegte Eingabe. Keine Onlinekurse, keine Umkehrung einer Fremdw\u00e4hrung-je-Euro-Notierung. Nur bei zul\u00e4ssiger Eurozahlung im Inland; ausdr\u00fccklich vereinbarte ausschlie\u00dfliche Fremdw\u00e4hrungszahlung ausgeschlossen."))
  ergebnis
}

gelduebermittlung_umzugsmehrkosten <- function(kosten_vor_verlegung = NULL, kosten_nach_verlegung = NULL, kostenvergleich_nach_270_absatz_3_anwendbar = NULL, bewertungsnachweis = NULL) {
  eingaben <- list(kosten_vor_verlegung = kosten_vor_verlegung, kosten_nach_verlegung = kosten_nach_verlegung, kostenvergleich_nach_270_absatz_3_anwendbar = kostenvergleich_nach_270_absatz_3_anwendbar, bewertungsnachweis = bewertungsnachweis)
  a <- .geld(kosten_vor_verlegung)
  b <- .geld(kosten_nach_verlegung)
  .wahrheitswert(kostenvergleich_nach_270_absatz_3_anwendbar, "kostenvergleich_nach_270_absatz_3_anwendbar")
  .text(bewertungsnachweis, "bewertungsnachweis")
  betrag <- NULL
  if (kostenvergleich_nach_270_absatz_3_anwendbar) {
    betrag <- .subtrahieren(b, a)
    if (betrag$zaehler < 0) betrag <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(betrag, "BGB_GELDUEBERMITTLUNG_UMZUGSMEHRKOSTEN", eingaben, list(list(operation = "Kosten nach Verlegung minus vergleichbare Kosten ohne Verlegung, mindestens null.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur kausale Mehrkosten der nach Entstehung des Schuldverh\u00e4ltnisses erfolgten Verlegung von Gl\u00e4ubigerwohnsitz oder ma\u00dfgeblicher Niederlassung. Betr\u00e4ge unter ansonsten gleichen Bedingungen bestimmen; keine \u00dcbernahme der gesamten \u00dcbermittlungskosten oder Berechnung der Gefahrtragung."))
  ergebnis
}

schadensersatz_nach_ersatzherausgabe <- function(schadensersatz_vor_anrechnung = NULL, wert_des_erlangten_ersatzes = NULL, ersatzrecht_nach_285_ausgeuebt = NULL, bewertungsnachweis = NULL) {
  eingaben <- list(schadensersatz_vor_anrechnung = schadensersatz_vor_anrechnung, wert_des_erlangten_ersatzes = wert_des_erlangten_ersatzes, ersatzrecht_nach_285_ausgeuebt = ersatzrecht_nach_285_ausgeuebt, bewertungsnachweis = bewertungsnachweis)
  a <- .geld(schadensersatz_vor_anrechnung)
  b <- .geld(wert_des_erlangten_ersatzes)
  .wahrheitswert(ersatzrecht_nach_285_ausgeuebt, "ersatzrecht_nach_285_ausgeuebt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  betrag <- NULL
  if (ersatzrecht_nach_285_ausgeuebt) {
    betrag <- .subtrahieren(a, b)
    if (betrag$zaehler < 0) betrag <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(betrag, "BGB_SCHADENSERSATZ_NACH_ERSATZHERAUSGABE", eingaben, list(list(operation = "Schadensersatz statt der Leistung um den Wert des herausverlangten Ersatzes mindern, mindestens null.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Wirksamer Schadensersatzanspruch statt der Leistung und Aus\u00fcbung des Rechts nach\u00a7285 Absatz1 fachlich vorgegeben. Ausgangsbetrag noch ohne diese Anrechnung. Keine R\u00fcckzahlungsforderung bei h\u00f6herem Ersatzwert; Herausgabeanspruch und sonstige Anspruchs\u00e4nderungen separat."))
  ergebnis
}

leistungsbestimmung_durchschnittssumme <- function(bestimmte_summen = NULL, zweifelsregel_nach_317_anwendbar = NULL, bewertungsnachweis = NULL) {
  .vorhanden(bestimmte_summen, "bestimmte_summen")
  if (!is.list(bestimmte_summen) || !is.null(names(bestimmte_summen)) || length(bestimmte_summen) < 2 || length(bestimmte_summen) > 1000)
    .fehler("bestimmte_summen", "Liste mit2 bis1000 Bestimmungen erforderlich.")
  namen <- character()
  summe <- .bruch(0)
  for (bestimmung in bestimmte_summen) {
    if (!is.list(bestimmung) || length(bestimmung) != 2 || !setequal(names(bestimmung), c("dritter_id", "summe")))
      .fehler("bestimmte_summen", "Genau dritter_id und summe erforderlich.")
    name <- .text(bestimmung$dritter_id, "dritter_id")
    if (name %in% namen) .fehler("dritter_id", "Jeden Dritten genau einmal einbeziehen.")
    namen <- c(namen, name)
    summe <- .addieren(summe, .geld(bestimmung$summe))
  }
  .wahrheitswert(zweifelsregel_nach_317_anwendbar, "zweifelsregel_nach_317_anwendbar")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(bestimmte_summen = bestimmte_summen, zweifelsregel_nach_317_anwendbar = zweifelsregel_nach_317_anwendbar, bewertungsnachweis = bewertungsnachweis)
  betrag <- if (zweifelsregel_nach_317_anwendbar) .dividieren(summe, .bruch(length(bestimmte_summen))) else NULL
  ergebnis <- .geld_ergebnis(betrag, "BGB_LEISTUNGSBESTIMMUNG_DURCHSCHNITTSSUMME", eingaben, list(list(operation = "Summen s\u00e4mtlicher bestimmender Dritter gleichgewichtet addieren und durch deren Anzahl teilen.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur die Zweifelsregel f\u00fcr eine durch mehrere Dritte bestimmte Geldsumme in einheitlicher W\u00e4hrung EUR. Abweichende Vereinbarungen, rechtlich unwirksame Bestimmungen oder nichtmonet\u00e4re Leistungen nicht erfasst. Jede Person genau einmal einbeziehen; keine Mehrheitsabstimmung und keine Entfernung von Ausrei\u00dfern."))
  ergebnis
}
