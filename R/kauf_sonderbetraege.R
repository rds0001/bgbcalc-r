
neuverkauf_kosten_und_mindererloes <- function(urspruenglicher_verkaufspreis=NULL, neuer_verkaufspreis=NULL, kosten_neuverkauf=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(urspruenglicher_verkaufspreis), .geld(neuer_verkaufspreis), .geld(kosten_neuverkauf))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(urspruenglicher_verkaufspreis=urspruenglicher_verkaufspreis, neuer_verkaufspreis=neuer_verkaufspreis, kosten_neuverkauf=kosten_neuverkauf, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.addieren(werte[[3]], if(.vergleichen(werte[[1]],werte[[2]]) > 0) .subtrahieren(werte[[1]],werte[[2]]) else .bruch(0)), "BGB_NEUVERKAUF_KOSTEN_UND_MINDERERLOES", eingaben, list(list(operation="Kosten des neuen Verkaufs plus positiver Mindererl\u00f6s gegen\u00fcber urspr\u00fcnglichem Verkauf")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur\u00a7451 Absatz2 nach qualifizierter Genehmigungsverweigerung und dadurch veranlasstem Neuverkauf. Mehrerl\u00f6s wird nicht gegen Neuverkaufskosten aufgerechnet; kein automatischer Gesamtschadensersatz."))
 ergebnis
}

wiederkauf_verwendungsersatz <- function(verwendungsaufwand=NULL, bewirkte_werterhoehung=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(verwendungsaufwand), .geld(bewirkte_werterhoehung))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(verwendungsaufwand=verwendungsaufwand, bewirkte_werterhoehung=bewirkte_werterhoehung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]]) <= 0) werte[[1]] else werte[[2]], "BGB_WIEDERKAUF_VERWENDUNGSERSATZ", eingaben, list(list(operation="Qualifizierten Verwendungsaufwand auf dadurch bewirkte Werterh\u00f6hung begrenzen")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur\u00a7459 Verwendungen vor Wiederkauf; keine Sch\u00e4tzungswertvereinbarung nach\u00a7460, die diesen Anspruch ausschlie\u00dft. Kausale Werterh\u00f6hung extern bewerten; Wegnahmerecht und weitere Kosten gesondert."))
 ergebnis
}

vorkauf_preis_mit_nebenleistungswert <- function(kaufpreis=NULL, zu_ersetzender_nebenleistungswert=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(kaufpreis), .geld(zu_ersetzender_nebenleistungswert))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(kaufpreis=kaufpreis, zu_ersetzender_nebenleistungswert=zu_ersetzender_nebenleistungswert, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.addieren(werte[[1]],werte[[2]]), "BGB_VORKAUF_PREIS_MIT_NEBENLEISTUNGSWERT", eingaben, list(list(operation="Kaufpreis um qualifizierten Geldwert der nicht selbst erf\u00fcllbaren Nebenleistung erh\u00f6hen")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur\u00a7466 monet\u00e4r sch\u00e4tzbare und rechtlich zu ersetzende Nebenleistung, die Vorkaufsberechtigter nicht selbst bewirken kann. Keine Wertbestimmung und kein Wert einer nach\u00a7466 unbeachtlichen Nebenleistungsvereinbarung. Kaufpreis darf diesen Wert noch nicht enthalten."))
 ergebnis
}

vorkauf_gesamtpreisanteil <- function(gesamtpreis=NULL, wert_vorkaufsgegenstand=NULL, wert_gesamtkauf=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(gesamtpreis), .geld(wert_vorkaufsgegenstand), .geld(wert_gesamtkauf))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[3]],.bruch(0)) <= 0 || .vergleichen(werte[[2]],werte[[3]]) > 0) .fehler("wert_gesamtkauf","Gesamtwert muss positiv und mindestens so hoch wie Gegenstandswert sein.")
 eingaben <- list(gesamtpreis=gesamtpreis, wert_vorkaufsgegenstand=wert_vorkaufsgegenstand, wert_gesamtkauf=wert_gesamtkauf, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],.dividieren(werte[[2]],werte[[3]])), "BGB_VORKAUF_GESAMTPREISANTEIL", eingaben, list(list(operation="Gesamtpreis mit Wert des Vorkaufsgegenstands geteilt durch positiven Wert des Gesamtkaufs multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur\u00a7467 Satz1, rechtlich qualifiziertes Wertverh\u00e4ltnis als Eingabe. Bei Verlangen der Gesamterstreckung nach Satz2 anderen Umfang bewerten; keine automatische Alleinbewertung oder Kopfteilung. Gegenstandswert darf Gesamtwert nicht \u00fcbersteigen."))
 ergebnis
}

vorkauf_stundungssicherheit <- function(gestundeter_kaufpreis=NULL, bereits_qualifiziert_gesicherter_teil=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(gestundeter_kaufpreis), .geld(bereits_qualifiziert_gesicherter_teil))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[2]],werte[[1]]) > 0) .fehler("bereits_qualifiziert_gesicherter_teil","Befreiter Teil darf gestundeten Kaufpreis nicht \u00fcbersteigen.")
 eingaben <- list(gestundeter_kaufpreis=gestundeter_kaufpreis, bereits_qualifiziert_gesicherter_teil=bereits_qualifiziert_gesicherter_teil, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.subtrahieren(werte[[1]],werte[[2]]), "BGB_VORKAUF_STUNDUNGSSICHERHEIT", eingaben, list(list(operation="Gestundeten Kaufpreis um den nach\u00a7468 Absatz2 von zus\u00e4tzlicher Sicherheit befreiten Teil vermindern")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Befreiter Teil nur f\u00fcr qualifiziert vereinbarte Hypothek bzw.in Anrechnung auf Kaufpreis \u00fcbernommene hypothekarische Schuld, entsprechend eingetragenes Schiff/Schiffsbauwerk; sonst0. Keine beliebige vorhandene Sicherheit anrechnen, \u00dcberlappungen vorab entfernen. Teil h\u00f6chstens gestundeter Kaufpreis."))
 ergebnis
}
