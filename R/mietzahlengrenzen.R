
waermelieferung_kosten_und_nutzungsgradgrenzen <- function(bisherige_betriebskosten=NULL, neue_waermelieferkosten=NULL, jahresnutzungsgrad_prozent=NULL, einordnungsnachweis=NULL) {
 x <- list(.geld(bisherige_betriebskosten), .geld(neue_waermelieferkosten), .geld(jahresnutzungsgrad_prozent))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(bisherige_betriebskosten=bisherige_betriebskosten, neue_waermelieferkosten=neue_waermelieferkosten, jahresnutzungsgrad_prozent=jahresnutzungsgrad_prozent, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(kostendifferenz=.bruchteile(.subtrahieren(x[[2]],x[[1]])),kostenneutralitaetsgrenze_eingehalten=.vergleichen(x[[2]],x[[1]])<=0,nutzungsgradgrenze_erreicht=.vergleichen(x[[3]],.bruch(80))>=0), "zahlen_und_wahrheitswerte", "BGB_WAERMELIEFERUNG_KOSTEN_UND_NUTZUNGSGRADGRENZEN", eingaben, list(list(operation="Neue und bisherige W\u00e4rmekosten vergleichen; Jahresnutzungsgrad mit80Prozent vergleichen.")),eingaben)
 ergebnis$hinweise <- list("Nur numerische Teilbedingungen nach556cI. Kosten f\u00fcr denselben rechtlich ma\u00dfgeblichen Vergleichszeitraum und Versorgungsumfang vorqualifizieren; keine eigenst\u00e4ndige Berechnung nach externer W\u00e4rmelieferverordnung. Nutzungsgrad in Prozentpunkten,80 bedeutet80Prozent; keine automatische Bewertung der Anlage oder verbesserter Betriebsf\u00fchrung. Grenzwerte einschlie\u00dflich Gleichheit. Ergebnis entscheidet nicht s\u00e4mtliche Voraussetzungen der Kostenumlage; Ank\u00fcndigung556cII separat.")
 ergebnis
}

mietspiegel_spanneneinordnung <- function(spannengrenze_unten=NULL, spannengrenze_oben=NULL, verlangte_miete=NULL, einordnungsnachweis=NULL) {
 x <- list(.geld(spannengrenze_unten), .geld(spannengrenze_oben), .geld(verlangte_miete))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(x[[1]],x[[2]])>0) .fehler("spannengrenze_oben","Obergrenze darf nicht unter Untergrenze liegen.")
 eingaben <- list(spannengrenze_unten=spannengrenze_unten, spannengrenze_oben=spannengrenze_oben, verlangte_miete=verlangte_miete, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(innerhalb_der_spanne=.vergleichen(x[[1]],x[[3]])<=0 && .vergleichen(x[[3]],x[[2]])<=0,unterhalb_unterschreitungsbetrag=.bruchteile(if(.vergleichen(x[[1]],x[[3]])>0) .subtrahieren(x[[1]],x[[3]]) else .bruch(0)),oberhalb_ueberschreitungsbetrag=.bruchteile(if(.vergleichen(x[[3]],x[[2]])>0) .subtrahieren(x[[3]],x[[2]]) else .bruch(0))), "zahlen_und_wahrheitswerte", "BGB_MIETSPIEGEL_SPANNENEINORDNUNG", eingaben, list(list(operation="Verlangte Miete einschlie\u00dflich der Grenzen mit qualifizierter Mietspiegelspanne vergleichen.")),eingaben)
 ergebnis$hinweise <- list("Nur numerischer Spannenvergleich nach558aIV1; gleiche Miet-/Fl\u00e4cheneinheit und gleicher Zeitraum f\u00fcr alle drei Werte. Keine automatische Auswahl der Vergleichsmerkmale, kein Beweis endg\u00fcltiger orts\u00fcblicher Vergleichsmiete und keine Pr\u00fcfung der vollst\u00e4ndigen Mieterh\u00f6hungsberechtigung nach558. Unter- und Obergrenze z\u00e4hlen mit; keine automatische Erh\u00f6hung einer unter der Spanne verlangten Miete.")
 ergebnis
}

vergleichswohnungen_mindestzahl <- function(anzahl_vergleichswohnungen=NULL, einordnungsnachweis=NULL) {
 x <- list(.ganzzahl(anzahl_vergleichswohnungen,"anzahl_vergleichswohnungen",0,9007199254740991))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(anzahl_vergleichswohnungen=anzahl_vergleichswohnungen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(mindestzahl=3,fehlende_wohnungen=max(3-x[[1]],0),mindestzahl_erreicht=x[[1]]>=3), "zahlen_und_wahrheitswerte", "BGB_VERGLEICHSWOHNUNGEN_MINDESTZAHL", eingaben, list(list(operation="Anzahl qualifizierter Vergleichswohnungen mit drei vergleichen und fehlende Anzahl bestimmen.")),eingaben)
 ergebnis$hinweise <- list("Nur numerische Mindestzahl nach558aII Nummer4. Wohnungen m\u00fcssen tats\u00e4chlich verschieden und rechtlich vergleichbar sein; Benennung und entsprechende Entgelte vorqualifizieren. Drei Wohnungen gen\u00fcgen als dieser Begr\u00fcndungsweg, entscheiden aber keine materielle Mieterh\u00f6hung. Kein Ersatz f\u00fcr notwendige Mietspiegelangaben nachAbsatz3.")
 ergebnis
}

mietspiegel_einwohnerschwelle <- function(einwohnerzahl=NULL, einordnungsnachweis=NULL) {
 x <- list(.ganzzahl(einwohnerzahl,"einwohnerzahl",0,9007199254740991))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(einwohnerzahl=einwohnerzahl, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(einwohnergrenze=50000,grenze_ueberschritten=x[[1]]>50000), "zahlen_und_wahrheitswerte", "BGB_MIETSPIEGEL_EINWOHNERSCHWELLE", eingaben, list(list(operation="Gemeindeeinwohnerzahl strikt mit50000 vergleichen.")),eingaben)
 ergebnis$hinweise <- list("Nur numerische Schwelle nach558cIV2; rechtlich ma\u00dfgebliche Einwohnerzahl der betreffenden Gemeinde vorgeben. Genau50000 erf\u00fcllt die strikte \u00dcberschreitung nicht. Unterhalb der Schwelle kann weiterhin ein Bed\u00fcrfnis nachAbsatz4Satz1 bestehen; keine allgemeine Befreiung von Aufgaben und keine automatische Mietspiegelerstellung.")
 ergebnis
}
