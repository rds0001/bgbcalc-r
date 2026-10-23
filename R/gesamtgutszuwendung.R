gesamtgutszuwendung_anteile <- function(zuwendungswert = NULL, abstammungszuordnung = NULL,
    ersatzpflichtzuordnung = NULL, gesamtgut_anwendbar = NULL, einordnungsnachweis = NULL) {
  betrag <- .geld(zuwendungswert)
  arten <- c('keine', 'ehegatte_1', 'ehegatte_2')
  .auswahl(abstammungszuordnung, 'abstammungszuordnung', arten)
  .auswahl(ersatzpflichtzuordnung, 'ersatzpflichtzuordnung', arten)
  .wahrheitswert(gesamtgut_anwendbar, 'gesamtgut_anwendbar')
  .text(einordnungsnachweis, 'einordnungsnachweis')
  eingaben <- list(zuwendungswert = zuwendungswert, abstammungszuordnung = abstammungszuordnung,
    ersatzpflichtzuordnung = ersatzpflichtzuordnung, gesamtgut_anwendbar = gesamtgut_anwendbar,
    einordnungsnachweis = einordnungsnachweis)
  sonder <- unique(c(abstammungszuordnung, ersatzpflichtzuordnung))
  sonder <- sonder[sonder != 'keine']
  wert <- NULL
  if (gesamtgut_anwendbar && length(sonder) <= 1) {
    zuordnung <- if (length(sonder)) sonder[[1]] else 'keine'
    quote <- if (zuordnung == 'keine') .bruch(1, 2) else .bruch(if (zuordnung == 'ehegatte_1') 1 else 0)
    andere <- if (zuordnung == 'keine') .bruch(1, 2) else .bruch(if (zuordnung == 'ehegatte_2') 1 else 0)
    wert <- list(quote_ehegatte_1 = .bruchteile(quote), quote_ehegatte_2 = .bruchteile(andere),
      betrag_ehegatte_1 = .bruchteile(.multiplizieren(betrag, quote)),
      betrag_ehegatte_2 = .bruchteile(.multiplizieren(betrag, andere)))
  }
  ergebnis <- .ergebnis(wert, 'quoten_und_EUR', 'BGB_GESAMTGUTSZUWENDUNG_ANTEILE', eingaben,
    list(list(operation = 'Gesamtgutszuwendung h\u00e4lftig zurechnen; eindeutige Abstammungs- oder Ersatzpflichtausnahme ordnet sie ausschlie\u00dflich einem Ehegatten zu')), eingaben)
  ergebnis$status <- if (!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
  ergebnis$annahmen <- list('Feste lokale BGB-Fassung; qualifizierter Wert der betrachteten Zuwendung und rechtlich gepr\u00fcfte Zuordnungstatbest\u00e4nde.')
  ergebnis$hinweise <- list('Abstammungsausnahme: Empf\u00e4nger ist Abk\u00f6mmling nur eines Ehegatten oder Person, von der nur einer der Ehegatten abstammt. Gemeinsame Abstammung begr\u00fcndet diese Ausnahme nicht. Ersatzpflicht betrifft gerade diese Zuwendung gegen\u00fcber dem Gesamtgut. Bei widersprechenden Zuordnungen keine erfundene Vorrangregel: NICHT_ANWENDBAR, gesondert kl\u00e4ren. Gesamtgut der fortgesetzten G\u00fctergemeinschaft nach Absatz2 eingeschlossen; Ehegatte_1/2 bezeichnet die urspr\u00fcnglichen Ehegatten. Ergebnis ist Zurechnung f\u00fcr Pflichtteilsrecht, kein Eigentums- oder Zahlungsanspruch und keine Schenkungssteuerregel. Bewertungszeitpunkt, Pflichtteilsquote, Anrechnung und Abschmelzung gesondert berechnen.')
  ergebnis
}
