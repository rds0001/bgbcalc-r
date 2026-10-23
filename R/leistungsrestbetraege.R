
miete_nach_ersparnis_und_verwertung <- function(zeitraumsmiete=NULL, ersparte_aufwendungen=NULL, anderweitiger_verwertungsvorteil=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(zeitraumsmiete), .geld(ersparte_aufwendungen), .geld(anderweitiger_verwertungsvorteil))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(zeitraumsmiete=zeitraumsmiete, ersparte_aufwendungen=ersparte_aufwendungen, anderweitiger_verwertungsvorteil=anderweitiger_verwertungsvorteil, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(local({rest <- .subtrahieren(.subtrahieren(werte[[1]],werte[[2]]),werte[[3]]); if(.vergleichen(rest,.bruch(0))>0) rest else .bruch(0)}), "BGB_MIETE_NACH_ERSPARNIS_UND_VERWERTUNG", eingaben, list(list(operation="Vom qualifizierten Mietbetrag ersparte Aufwendungen und anderweitigen Verwertungsvorteil abziehen, Rest mindestens null")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7537 Absatz1 bei pers\u00f6nlicher Gebrauchshinderung des Mieters. Zeitraumsmiete muss Zeitr\u00e4ume nach Absatz2 ausschlie\u00dfen, f\u00fcr die wegen Dritt\u00fcberlassung kein Mietanspruch besteht. Abz\u00fcge f\u00fcr denselben Zeitraum rechtlich bewerten und \u00fcberschneidungsfrei eingeben. Kein zus\u00e4tzlicher Anspruch auf einen negativen Rest; Mietminderung und andere Einwendungen gesondert."))
 ergebnis
}

pacht_vorenthaltung_nutzungsanteil <- function(vereinbarte_jahrespacht=NULL, nutzungswert_vorenthaltung=NULL, nutzungswert_pachtjahr=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(vereinbarte_jahrespacht), .geld(nutzungswert_vorenthaltung), .geld(nutzungswert_pachtjahr))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(werte[[3]],.bruch(0)) <= 0 || .vergleichen(werte[[2]],werte[[3]]) > 0) .fehler("nutzungswert_pachtjahr","Jahresnutzungswert muss positiv sein und den Vorenthaltungsanteil umfassen.")
 eingaben <- list(vereinbarte_jahrespacht=vereinbarte_jahrespacht, nutzungswert_vorenthaltung=nutzungswert_vorenthaltung, nutzungswert_pachtjahr=nutzungswert_pachtjahr, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],.dividieren(werte[[2]],werte[[3]])), "BGB_PACHT_VORENTHALTUNG_NUTZUNGSANTEIL", eingaben, list(list(operation="Vereinbarte Jahrespacht mal qualifizierter Nutzungswert der Vorenthaltung geteilt durch positiven Nutzungswert des ganzen Pachtjahrs")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7584b f\u00fcr einen Abschnitt innerhalb eines Pachtjahrs; gezogene oder objektiv erzielbare Nutzungen gleichartig bewerten. Keine automatische Gleichsetzung des Nutzungsanteils mit einem Tagesanteil. Bei mehreren Pachtjahren getrennt rechnen. Weiterer Schaden und Anspruchsvoraussetzungen gesondert; nicht \u00a7597-Landpachtrechnung."))
 ergebnis
}

werk_abschlagsrestbetrag <- function(wert_geschuldeter_erbrachter_leistungen=NULL, bereits_gezahlte_abschlaege=NULL, qualifizierter_zurueckbehaltungsbetrag=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(wert_geschuldeter_erbrachter_leistungen), .geld(bereits_gezahlte_abschlaege), .geld(qualifizierter_zurueckbehaltungsbetrag))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(wert_geschuldeter_erbrachter_leistungen=wert_geschuldeter_erbrachter_leistungen, bereits_gezahlte_abschlaege=bereits_gezahlte_abschlaege, qualifizierter_zurueckbehaltungsbetrag=qualifizierter_zurueckbehaltungsbetrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(local({rest <- .subtrahieren(.subtrahieren(werte[[1]],werte[[2]]),werte[[3]]); if(.vergleichen(rest,.bruch(0))>0) rest else .bruch(0)}), "BGB_WERK_ABSCHLAGSRESTBETRAG", eingaben, list(list(operation="Kumulierten Wert geschuldeter erbrachter Leistungen um bereits gezahlte Abschl\u00e4ge und qualifizierten Zur\u00fcckbehaltungsbetrag vermindern, Rest mindestens null")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7632a kumulierte, nachgewiesene vertragsgeschuldete Leistungen derselben Abrechnung. Nicht blo\u00df Rechnungsnennbetrag. Angemessenen Einbehalt, einschlie\u00dflich entsprechend \u00a7641 Absatz3, extern qualifizieren (vorhandener werk_maengeleinbehalt-Kern). Stoffe/Bauteile nur bei qualifiziert erf\u00fcllten Sicherungs-/Eigentumsvoraussetzungen. Keine automatische R\u00fcckforderung bei \u00dcberzahlung und kein doppelter Abzug schon verrechneter Abschl\u00e4ge oder M\u00e4ngel. Verbraucherbau-Gesamtgrenze und Herstellungssicherheit nach \u00a7650m zus\u00e4tzlich gesondert anwenden."))
 ergebnis
}
