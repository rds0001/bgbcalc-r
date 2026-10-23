
reiseleistungsarten_mindestzahl <- function(anzahl_verschiedener_reiseleistungsarten=NULL, einordnungsnachweis=NULL) {
 x <- list(.ganzzahl(anzahl_verschiedener_reiseleistungsarten,"anzahl_verschiedener_reiseleistungsarten",0,9007199254740991))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(anzahl_verschiedener_reiseleistungsarten=anzahl_verschiedener_reiseleistungsarten, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(mindestzahl=2,fehlende_arten=max(2-x[[1]],0),mindestzahl_erreicht=x[[1]]>=2), "zahlen_und_wahrheitswerte", "BGB_REISELEISTUNGSARTEN_MINDESTZAHL", eingaben, list(list(operation="Zahl rechtlich verschiedener Reiseleistungsarten mit mindestens zwei vergleichen.")),eingaben)
 ergebnis$hinweise <- list("Nur numerische Mindestzahl651aII/651bI; rechtlich verschiedene Arten nach651aIII f\u00fcr dieselbe Reise vorqualifizieren. Mehrere Hotels sind nicht automatisch mehrere Arten. Wesensm\u00e4\u00dfige Bestandteile anderer Leistungen nicht doppelt z\u00e4hlen. Weitere Voraussetzungen, touristische Nebenleistungsgrenzen und Ausnahmen separat; Ergebnis ist keine abschlie\u00dfende Pauschalreiseentscheidung.")
 ergebnis
}

touristische_leistung_wertanteil <- function(touristischer_teilwert=NULL, gesamtwert_zusammenstellung=NULL, einordnungsnachweis=NULL) {
 x <- list(.geld(touristischer_teilwert), .geld(gesamtwert_zusammenstellung))
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(.vergleichen(x[[2]],.bruch(0))==0||.vergleichen(x[[1]],x[[2]])>0) .fehler("gesamtwert_zusammenstellung","Positiver Gesamtwert erforderlich; touristischer Teilwert darf ihn nicht \u00fcbersteigen.")
 eingaben <- list(touristischer_teilwert=touristischer_teilwert, gesamtwert_zusammenstellung=gesamtwert_zusammenstellung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(wertanteil=.bruchteile(.dividieren(x[[1]],x[[2]])),wertanteil_prozent=.bruchteile(.multiplizieren(.dividieren(x[[1]],x[[2]]),.bruch(100))),unter_25_prozent=.vergleichen(.dividieren(x[[1]],x[[2]]),.bruch(1,4))<0), "zahlen_und_wahrheitswerte", "BGB_TOURISTISCHE_LEISTUNG_WERTANTEIL", eingaben, list(list(operation="Touristischen Teilwert durch positiven Gesamtwert teilen; Anteil strikt mit25Prozent vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7651aIV: nur rechnerischer touristischer Wertanteil in einer qualifizierten Zusammenstellung aus einer Art651aIII1bis3 und zus\u00e4tzlichen touristischen Leistungen. Genau25Prozent ist nicht weniger als25Prozent. Teil-/Gesamtwerte derselben Bewertungsbasis, Gesamtwert strikt positiv, Teilwert h\u00f6chstens Gesamtwert. Wesentliches Merkmal/Bewerbung sowie sp\u00e4tere Auswahl bleiben gesondert; ein kleiner Anteil allein schlie\u00dft Pauschalreiserecht nicht aus. Keine automatische Bewertung aus unbekannten Einzelpreisen.")
 ergebnis
}

tagesreise_reisepreisgrenze <- function(reisepreis=NULL, einordnungsnachweis=NULL) {
 x <- list(.geld(reisepreis))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(reisepreis=reisepreis, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(preisgrenze_euro=.bruchteile(.bruch(500)),preisgrenze_eingehalten=.vergleichen(x[[1]],.bruch(500))<=0,ueberschreitungsbetrag=.bruchteile(if(.vergleichen(x[[1]],.bruch(500))>0) .subtrahieren(x[[1]],.bruch(500)) else .bruch(0))), "zahlen_und_wahrheitswerte", "BGB_TAGESREISE_REISEPREISGRENZE", eingaben, list(list(operation="Reisepreis einschlie\u00dflich Gleichheit mit500EUR vergleichen und \u00dcberschreitungsbetrag berechnen.")),eingaben)
 ergebnis$hinweise <- list("Nur Preisgrenze651aV2, nicht gesamte Tagesreiseausnahme. Reisedauer strikt unter24Stunden und keine \u00dcbernachtung zus\u00e4tzlich qualifizieren. Im besonderen651cIII-Fall ist die Tagesreiseausnahme unabh\u00e4ngig vom Preis anzuwenden; dort keinen500EUR-Filter erfinden.")
 ergebnis
}
