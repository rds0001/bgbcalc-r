
darlehen_wertbeteiligungsbetrag <- function(immobilienwert_bei_rueckzahlung=NULL, vertraglicher_wertanteil=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(immobilienwert_bei_rueckzahlung), .geld(vertraglicher_wertanteil))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(immobilienwert_bei_rueckzahlung=immobilienwert_bei_rueckzahlung, vertraglicher_wertanteil=vertraglicher_wertanteil, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],werte[[2]]), "BGB_DARLEHEN_WERTBETEILIGUNGSBETRAG", eingaben, list(list(operation="Qualifizierten Immobilienwert bei R\u00fcckzahlung mit vertraglich festgelegter Wertbeteiligungsquote multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur Wertbeteiligungsdarlehen im Sinne \u00a7492b Absatz1 Nummer3. Immobilienwert f\u00fcr den ma\u00dfgeblichen R\u00fcckzahlungszeitpunkt und vertraglichen Umfang extern bewerten; Quote als Jahres-unabh\u00e4ngiger Anteil (0.2=20Prozent), kein Zinssatz. Keine Bestimmung der Zul\u00e4ssigkeit des Kopplungsgesch\u00e4fts oder automatisches Hinzuf\u00fcgen einer urspr\u00fcnglichen Darlehenssumme. Mehrere R\u00fcckzahlungen nach jeweils rechtlich bestimmtem Anteil/Umfang separat, keine Doppelz\u00e4hlung."))
 ergebnis
}

darlehensvermittlung_auslagenobergrenze <- function(entstandene_erforderliche_auslagen=NULL, vorab_mitgeteilter_hoechstbetrag=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(entstandene_erforderliche_auslagen), .geld(vorab_mitgeteilter_hoechstbetrag))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(entstandene_erforderliche_auslagen=entstandene_erforderliche_auslagen, vorab_mitgeteilter_hoechstbetrag=vorab_mitgeteilter_hoechstbetrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(if(.vergleichen(werte[[1]],werte[[2]])<0) werte[[1]] else werte[[2]], "BGB_DARLEHENSVERMITTLUNG_AUSLAGENOBERGRENZE", eingaben, list(list(operation="Qualifiziert vereinbarte entstandene erforderliche Vermittlerauslagen auf vorab mitgeteilten H\u00f6chstbetrag begrenzen")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7655d Satz2/3: wirksame Vereinbarung \u00fcber tats\u00e4chlich entstandene erforderliche Auslagen vorausgesetzt; nicht Maklerverg\u00fctung oder Beratungsentgelt. Mitgeteilte H\u00f6he/H\u00f6chstgrenze rechtlich bestimmen; bei getrennten Einzelkategorien jede passende Grenze separat anwenden, kein Austausch ungenutzter Grenzen ohne Rechtsgrundlage. Keine automatische Erforderlichkeits- oder Anspruchspr\u00fcfung."))
 ergebnis
}

teilzahlung_gesamtbetragskorrektur <- function(vertraglicher_gesamtbetrag=NULL, angegebener_effektiver_jahreszins=NULL, tatsaechlicher_effektiver_jahreszins=NULL, einordnungsnachweis=NULL) {
 werte <- list(.geld(vertraglicher_gesamtbetrag), .geld(angegebener_effektiver_jahreszins), .geld(tatsaechlicher_effektiver_jahreszins))
 .text(einordnungsnachweis,"einordnungsnachweis")
 differenz <- .subtrahieren(werte[[3]],werte[[2]])
 if(.vergleichen(differenz,.bruch(0))<0 || .vergleichen(differenz,.bruch(1))>0) .fehler("effektivzins_unterangabe","Korrekturdom\u00e4ne verlangt Effektivzins-Unterangabe zwischen null und eins als Zinsquote.")
 eingaben <- list(vertraglicher_gesamtbetrag=vertraglicher_gesamtbetrag, angegebener_effektiver_jahreszins=angegebener_effektiver_jahreszins, tatsaechlicher_effektiver_jahreszins=tatsaechlicher_effektiver_jahreszins, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.multiplizieren(werte[[1]],.subtrahieren(.bruch(1),.subtrahieren(werte[[3]],werte[[2]]))), "BGB_TEILZAHLUNG_GESAMTBETRAGSKORREKTUR", eingaben, list(list(operation="Gesamtbetrag mit eins minus der absoluten Effektivzins-Unterangabe als Zinsquote multiplizieren")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7507 Absatz2 letzter Satz bei qualifiziertem Teilzahlungsgesch\u00e4ft und zu niedrig angegebenem Effektivzins. Eingaben als Jahresquoten,0.05=5Prozent. Beispielsweise Unterangabe8%-6%=2Prozentpunkte vermindert Gesamtbetrag um2Prozent. Nicht \u00a7494III-Sollzinskorrektur; nicht fehlende Zins-/Gesamtbetragsangabe. Sichere Rechendom\u00e4ne: Unterangabe zwischen0und1 einschlie\u00dflich; gr\u00f6\u00dfere Differenzen erfordern gesonderte rechtliche Behandlung und werden nicht automatisch zu negativem Zahlungsanspruch. Tats\u00e4chlicher Effektivzins/Vertragsgesamtbetrag extern bestimmen; keine automatische Ratenneuberechnung."))
 ergebnis
}
