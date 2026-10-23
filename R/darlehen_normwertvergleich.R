darlehen_normwertvergleich <- function(vergleichsfall=NULL, zu_pruefender_wert=NULL, massgeblicher_vergleichswert=NULL, einordnungsnachweis=NULL) {
 .auswahl(vergleichsfall,'vergleichsfall',c('arbeitgeber_effektivzins_491','oeffentlich_sollzins_491','umschuldung_effektivzins_655c','rueckzahlungsvereinbarung_gesamtbetrag_495'));.text(einordnungsnachweis,'einordnungsnachweis')
 lesen <- if(vergleichsfall=='rueckzahlungsvereinbarung_gesamtbetrag_495') .geld else .zahleneingabe
 links <- lesen(zu_pruefender_wert);rechts <- lesen(massgeblicher_vergleichswert)
 streng <- vergleichsfall %in% c('arbeitgeber_effektivzins_491','rueckzahlungsvereinbarung_gesamtbetrag_495')
 wert <- list(differenz=.bruchteile(.subtrahieren(links,rechts)),vergleich=if(streng)'weniger_als' else 'hoechstens',numerische_bedingung_erfuellt=if(streng).vergleichen(links,rechts)<0 else .vergleichen(links,rechts)<=0)
 eingaben <- list(vergleichsfall=vergleichsfall, zu_pruefender_wert=zu_pruefender_wert, massgeblicher_vergleichswert=massgeblicher_vergleichswert, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"differenz_und_wahrheitswert","BGB_DARLEHEN_NORMWERTVERGLEICH",eingaben,list(list(operation="Qualifizierte Zins- oder Betragswerte exakt vergleichen; strikte und einschlie\u00dflich geltende gesetzliche Grenzen unterscheiden.")),eingaben)
 ergebnis$hinweise <- list("Nur numerische Teilvoraussetzung nach\u00a7491II Nr4/5,\u00a7495II Nr1 oder\u00a7655c. Effektivzinsberechnung nach externem PAngV/EGBGB-Recht nicht neu erfinden; gepr\u00fcfte Werte eingeben.655c: Vergleichszins des abzul\u00f6senden Darlehens ohne Vermittlungskosten, weitere Voraussetzungen Auszahlung/Widerruf/umschuldungsbezogene Verg\u00fctung separat.495: Gesamtbetrag nicht blo\u00df neuer Nettodarlehensbetrag; Verfahrensvermeidung und K\u00fcndigungsberechtigung gesondert.491: Arbeitgeber-/Personenkreis-/Gemeinwohlbedingungen und weitere g\u00fcnstigere Vertragsbedingungen rechtlich qualifizieren. Zinss\u00e4tze d\u00fcrfen negativ sein; EUR-Gesamtbetrag und Restschuld nicht. Keine automatische Entscheidung \u00fcber Verbraucherschutz oder Verg\u00fctungsanspruch.")
 ergebnis
}
