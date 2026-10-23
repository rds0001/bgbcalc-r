hypothekenvermaechtnis_befriedigungsbetrag <- function(schuldbetrag = NULL, grundstueckswert = NULL,
    vorrangige_belastungen = NULL, vom_dritten_erlangbarer_betrag = NULL,
    schuld_nach_2166_qualifiziert = NULL, zweifelsregel_anwendbar = NULL,
    hoechstbetragshypothek = NULL, weitere_grundstuecke_mithaftend = NULL, bewertungsnachweis = NULL) {
  schuld <- .geld(schuldbetrag)
  wert <- .geld(grundstueckswert)
  lasten <- .geld(vorrangige_belastungen)
  dritter <- .geld(vom_dritten_erlangbarer_betrag)
  if (.vergleichen(dritter, schuld) > 0) .fehler('vom_dritten_erlangbarer_betrag', 'Erlangbarer Drittbetrag darf die betrachtete Schuld nicht \u00fcbersteigen.')
  eingaben <- list(schuldbetrag = schuldbetrag, grundstueckswert = grundstueckswert,
    vorrangige_belastungen = vorrangige_belastungen, vom_dritten_erlangbarer_betrag = vom_dritten_erlangbarer_betrag,
    schuld_nach_2166_qualifiziert = schuld_nach_2166_qualifiziert, zweifelsregel_anwendbar = zweifelsregel_anwendbar,
    hoechstbetragshypothek = hoechstbetragshypothek, weitere_grundstuecke_mithaftend = weitere_grundstuecke_mithaftend,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[5:8]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, 'bewertungsnachweis')
  gilt <- schuld_nach_2166_qualifiziert && zweifelsregel_anwendbar && !hoechstbetragshypothek && !weitere_grundstuecke_mithaftend
  ergebniswert <- NULL
  if (gilt) {
    deckung <- .subtrahieren(wert, lasten)
    if (.vergleichen(deckung, .bruch(0)) < 0) deckung <- .bruch(0)
    rest <- .subtrahieren(schuld, dritter)
    begrenzt <- if (.vergleichen(rest, deckung) <= 0) rest else deckung
    ergebniswert <- list(bereinigter_grundstueckswert = .bruchteile(deckung),
      schuld_nach_drittberichtigung = .bruchteile(rest), befriedigungsbetrag = .bruchteile(begrenzt))
  }
  ergebnis <- .ergebnis(ergebniswert, 'EUR', 'BGB_HYPOTHEKENVERMAECHTNIS_BEFRIEDIGUNGSBETRAG', eingaben,
    list(list(operation = 'Wert bei Eigentums\u00fcbergang um rangvorrangige Belastungen mindern; verbleibende Schuld nach erlangbarer Drittberichtigung auf nichtnegative Deckung begrenzen')), eingaben)
  ergebnis$status <- if (gilt) 'BERECHNET' else 'NICHT_ANWENDBAR'
  ergebnis$annahmen <- list('Feste lokale BGB-Fassung; einzelnes vermachtes Nachlassgrundst\u00fcck ohne weitere mithaftende Grundst\u00fccke, Wert und Schuld rechtlich vergleichbar qualifiziert.')
  ergebnis$hinweise <- list('Nur interne Verpflichtung des Verm\u00e4chtnisnehmers gegen\u00fcber dem Erben zur Befriedigung des Gl\u00e4ubigers nach\u00a72166, keine Begrenzung dinglicher Gl\u00e4ubigerrechte. Schuld muss Schuld des Erblassers sein oder eine Schuld, zu deren Berichtigung er dem Schuldner gegen\u00fcber verpflichtet war. Grundst\u00fcckswert im Zeitpunkt des Eigentums\u00fcbergangs; nur der betrachteten Hypothek im Rang vorgehende Belastungen abziehen, nicht die betrachtete Hypothek selbst doppelt. Drittbetrag ist die vom Erben rechtlich und tats\u00e4chlich erlangbare Berichtigung durch einen gegen\u00fcber dem Erblasser verpflichteten Dritten, nicht beliebige Zahlung eines Dritten; ohne entsprechenden Dritten null. Keine erfundene Bewertung oder Vollstreckungsprognose. H\u00f6chstbetragshypothek\u00a71190 ausgeschlossen; mithaftende Grundst\u00fccke und Verteilung\u00a72167 sowie Gesamtgrund-/Rentenschulden\u00a72168 gesondert. Abweichender Erblasserwille verhindert Anwendung der Zweifelsregel. Keine F\u00e4lligkeitsberechnung.')
  ergebnis
}
