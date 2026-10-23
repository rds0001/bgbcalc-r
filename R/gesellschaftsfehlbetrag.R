
gesellschaft_ausscheidensfehlbetrag <- function(gesellschaftsverbindlichkeiten=NULL, wert_gesellschaftsvermoegen=NULL, gewinn_verlust_anteil=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(gesellschaftsverbindlichkeiten), .geld(wert_gesellschaftsvermoegen), .geld(gewinn_verlust_anteil))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[3]],.bruch(1))>0) .fehler("gewinn_verlust_anteil","Anteil darf eins nicht \u00fcbersteigen.")
 eingaben <- list(gesellschaftsverbindlichkeiten=gesellschaftsverbindlichkeiten, wert_gesellschaftsvermoegen=wert_gesellschaftsvermoegen, gewinn_verlust_anteil=gewinn_verlust_anteil, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(if(.vergleichen(werte[[1]],werte[[2]])>0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0),werte[[3]]), "BGB_GESELLSCHAFT_AUSSCHEIDENSFEHLBETRAG", eingaben, list(list(operation="Positiven Fehlbetrag aus Gesellschaftsverbindlichkeiten minus Gesellschaftsverm\u00f6gen mit Gewinn-/Verlustanteil des Ausgeschiedenen multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7728a im qualifizierten Ausscheidensfall. Verm\u00f6gens- und Verbindlichkeitswerte auf rechtlich einheitlichen Stichtag und Bewertungsumfang beziehen; Gewinn-/Verlustanteil aus Vereinbarung bzw. \u00a7709 rechtlich bestimmen. Kein automatischer Abfindungswert nach \u00a7728, keine Liquidations-Beitragsr\u00fcckerstattung nach \u00a7736d/737 und kein Ausfall anderer Gesellschafter. Gesellschaftsanteil zwischen null und eins; bereits geleistete Fehlbetragszahlungen gesondert anrechnen."))
 ergebnis
}
