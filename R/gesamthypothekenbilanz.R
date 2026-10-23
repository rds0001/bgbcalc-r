gesamthypothek_verteilungsrahmen <- function(ausgangsforderung=NULL, zugeteilte_teilforderungen=NULL, einordnungsnachweis=NULL) {
 forderung <- .geld(ausgangsforderung)
 summe <- .rechnungssumme(zugeteilte_teilforderungen,"zugeteilte_teilforderungen")
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(summe,forderung)>0) .fehler("zugeteilte_teilforderungen","Summe der Teilforderungen darf die Ausgangsforderung nicht \u00fcbersteigen.")
 wert <- list(summe_teilforderungen=.bruchteile(summe),noch_nicht_zugeteilter_betrag=.bruchteile(.subtrahieren(forderung,summe)))
 eingaben <- list(ausgangsforderung=ausgangsforderung, zugeteilte_teilforderungen=zugeteilte_teilforderungen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_GESAMTHYPOTHEK_VERTEILUNGSRAHMEN",eingaben,list(list(operation="Zugewiesene Teilforderungen summieren, auf vorhandene Gesamtforderung begrenzen und noch nicht zugeordneten rechnerischen Betrag bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71132II: numerische Verteilungsplanung mit ausdr\u00fccklich zugeordneten Teilbetr\u00e4gen. Keine proportionale oder gleiche Verteilung erfinden; die rechtlich gew\u00e4hlte Zuordnung bleibt Eingabe. Summe darf die vorhandene Forderung nicht \u00fcbersteigen. Ein positiver noch nicht zugeteilter Betrag zeigt eine unvollst\u00e4ndige Planung, keine automatisch vollzogene teilweise Aufteilung oder Freigabe von Grundst\u00fccken. Voraussetzungen875/876/878, Grundbuchvollzug, Rang und Eigent\u00fcmerrechte au\u00dferhalb der Rechnung. Bereits geleistete Zahlungen vorab eindeutig ber\u00fccksichtigen.")
 ergebnis
}
gesamthypothek_glaeubigerrest <- function(ausgangsforderung=NULL, befriedigungsbetraege=NULL, einordnungsnachweis=NULL) {
 forderung <- .geld(ausgangsforderung)
 summe <- .rechnungssumme(befriedigungsbetraege,"befriedigungsbetraege")
 .text(einordnungsnachweis,"einordnungsnachweis")
 rest <- if(.vergleichen(forderung,summe)>0) .subtrahieren(forderung,summe) else .bruch(0)
 mehr <- if(.vergleichen(summe,forderung)>0) .subtrahieren(summe,forderung) else .bruch(0)
 wert <- list(beruecksichtigte_befriedigung=.bruchteile(summe),verbleibende_glaeubigerforderung=.bruchteile(rest),uebersteigender_zahlbetrag=.bruchteile(mehr))
 eingaben <- list(ausgangsforderung=ausgangsforderung, befriedigungsbetraege=befriedigungsbetraege, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_GESAMTHYPOTHEK_GLAEUBIGERREST",eingaben,list(list(operation="Alle auf dieselbe gesicherte Forderung wirkenden Befriedigungen einmal summieren; Rest beim bisherigen Gl\u00e4ubiger und \u00fcbersteigenden Zahlbetrag getrennt bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71132I: dieselbe Forderung wird nicht mit der Zahl belasteter Grundst\u00fccke multipliziert. Qualifizierte Befriedigungen aus verschiedenen Grundst\u00fccken und sonstigen Quellen nur einmal auf dieselbe Ausgangsforderung anrechnen. Zahlung auf Kosten/Zinsen oder andere Forderungen zuerst richtig zuordnen; Ausgangsforderung und Betr\u00e4ge m\u00fcssen denselben Umfang und Zeitraum betreffen. Ergebnis ist der Rest beim bisherigen Gl\u00e4ubiger, kein allgemeines Erl\u00f6schensurteil: Forderungs-/Hypotheken\u00fcbergang insbesondere1143/1150, Ausgleich und verbleibende Eigent\u00fcmerrechte separat. \u00dcbersteigender Zahlbetrag begr\u00fcndet keinen automatisch festgestellten Erstattungsanspruch.")
 ergebnis
}
