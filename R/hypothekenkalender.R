hypothek_beschlagnahme_monatsgrenze <- function(beschlagnahme_am=NULL,einordnungsnachweis=NULL) {
  datum <- .datum(beschlagnahme_am,"beschlagnahme_am")
  .text(einordnungsnachweis,"einordnungsnachweis")
  folgemonat <- as.integer(format(datum,"%d")) > 15
  ende <- .frist(paste0(format(datum,"%Y-%m"),"-01"),if (folgemonat) 2 else 1,"monate","tagesbeginn")
  wert <- list(letzter_erfasster_monat_endet_am=.iso(ende),folgender_monat_einbezogen=folgemonat)
  eingaben <- list(beschlagnahme_am=beschlagnahme_am,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(wert,"kalendergrenzen","BGB_HYPOTHEK_BESCHLAGNAHME_MONATSGRENZE",eingaben,list(list(operation="\u00a7\u00a71123II/1124II: Monatsende, nach dem15.Tag Ende des Folgemonats.")),eingaben)
  ergebnis$hinweise <- list("Nur gesetzliche Kalendergrenze f\u00fcr vorqualifizierte Miet-/Pachtf\u00e4lle.1123 erfordert zus\u00e4tzlich F\u00e4lligkeit, Jahresablauf und Beschlagnahmebezug;1124 vorherige Verf\u00fcgung. Diese Grenze allein entscheidet weder Haftungsfreiheit noch Wirksamkeit. Nicht auf1126 \u00fcbertragen; dort gilt eine andere Dreimonatsregel.")
  ergebnis
}

hypothek_hinterlegung_zeitgrenzen <- function(ausschliessungsbeschluss_rechtskraeftig_am=NULL,einordnungsnachweis=NULL) {
  datum <- .datum(ausschliessungsbeschluss_rechtskraeftig_am,"ausschliessungsbeschluss_rechtskraeftig_am")
  .text(einordnungsnachweis,"einordnungsnachweis")
  jahr <- as.integer(format(datum,"%Y"))
  if (jahr < 5) .fehler("ausschliessungsbeschluss_rechtskraeftig_am","Vier vorangehende Kalenderjahre m\u00fcssen im unterst\u00fctzten Datumsbereich liegen.")
  ende <- .frist(ausschliessungsbeschluss_rechtskraeftig_am,30,"jahre","ereignis")
  wert <- list(fruehester_hinterlegungszinsbeginn=sprintf("%04d-01-01",jahr-4),meldungsgrundfristende=.iso(ende))
  eingaben <- list(ausschliessungsbeschluss_rechtskraeftig_am=ausschliessungsbeschluss_rechtskraeftig_am,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(wert,"kalendergrenzen","BGB_HYPOTHEK_HINTERLEGUNG_ZEITGRENZEN",eingaben,list(list(operation="\u00a71171: Beginn des vierten vorangegangenen Kalenderjahres und30Jahre ab Rechtskraft.")),eingaben)
  ergebnis$hinweise <- list("Zinsbeginn ist nur fr\u00fcheste zu ber\u00fccksichtigende Kalendergrenze, kein erfundener Zinsanspruch; Grundbucheintrag des Zinssatzes, tats\u00e4chlicher Zinslauf und H\u00f6he gesondert.30Jahre sind Grundfrist f\u00fcr hinterlegten Betrag, keine automatische Erl\u00f6schensentscheidung bei vorheriger Meldung. Keine Anwendung anderer Aufgebotsfristen ohne Normpr\u00fcfung.")
  ergebnis
}

