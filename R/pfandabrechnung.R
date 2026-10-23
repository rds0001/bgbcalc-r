pfand_verwertungsabrechnung <- function(gesicherte_forderung = NULL, befriedigungsbasis = NULL,
    verwertungsart = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  forderung <- .geld(gesicherte_forderung)
  basis <- .geld(befriedigungsbasis)
  .auswahl(verwertungsart, "verwertungsart", c("erloes_1247", "marktpreis_eigentumszufall_1259"))
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  tilgung <- if (.vergleichen(forderung, basis) <= 0) forderung else basis
  eingaben <- list(gesicherte_forderung = gesicherte_forderung, befriedigungsbasis = befriedigungsbasis,
    verwertungsart = verwertungsart, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert,
    bewertungsnachweis = bewertungsnachweis)
  wert <- if (anwendungsfall_qualifiziert) list(getilgte_forderung = .bruchteile(tilgung),
    restforderung = .bruchteile(.subtrahieren(forderung, tilgung)), ueberschiessender_wert = .bruchteile(.subtrahieren(basis, tilgung))) else NULL
  ergebnis <- .ergebnis(wert, "EUR", "BGB_PFAND_VERWERTUNGSABRECHNUNG", eingaben,
    list(list(operation = "Minimum aus gesicherter Forderung und qualifizierter Befriedigungsbasis als Tilgung; Differenzen als Restforderung und \u00fcberschie\u00dfenden Wert ausweisen")), eingaben)
  ergebnis$status <- if (anwendungsfall_qualifiziert) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Eine gesicherte Forderungsposition nach qualifizierter Kosten-/Rangbereinigung; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Bei1247 ist befriedigungsbasis der nach rechtlich vorrangigen Kosten und Anspr\u00fcchen f\u00fcr diesen Pfandgl\u00e4ubiger verf\u00fcgbare Verwertungserl\u00f6s. Tilgung z\u00e4hlt als Berichtigung durch den Eigent\u00fcmer; \u00fcberschie\u00dfender Erl\u00f6s tritt an Stelle des Pfandes, keine automatische Auszahlung an den Eigent\u00fcmer oder Gl\u00e4ubiger. Bei1259 bezeichnet die Basis den gesamten B\u00f6rsen-/Marktwert des Pfandes am F\u00e4lligkeitstag, nicht am sp\u00e4teren \u00dcbertragungstag. Nur qualifiziert vereinbarter Eigentumszufall innerhalb des besonderen pers\u00f6nlichen Anwendungsbereichs; kein pauschales Verfallrecht f\u00fcr Verbrauchersicherheiten. \u00dcberschie\u00dfender Wert ist dort nur eine Rechendifferenz, keine aus1259 erfundene Erstattungspflicht. Andere Forderungen, Rangverteilungen und mehrere Pfandrechte vorgelagert abgrenzen; keine Doppelbefriedigung.")
  ergebnis
}
