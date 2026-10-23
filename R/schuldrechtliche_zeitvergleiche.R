miete_schonfrist_wiederholungszeitraum <- function(fruehere_geheilte_kuendigung_am=NULL, erneute_kuendigung_am=NULL, einordnungsnachweis=NULL) {
 frueher <- .datum(fruehere_geheilte_kuendigung_am,'fruehere_geheilte_kuendigung_am');erneut <- .datum(erneute_kuendigung_am,'erneute_kuendigung_am')
 if(erneut<=frueher) .fehler('erneute_kuendigung_am','Erneute K\u00fcndigung muss nach fr\u00fcherer K\u00fcndigung liegen.')
 ende <- .frist(fruehere_geheilte_kuendigung_am,2,'jahre','ereignis')
 wert <- list(zweijahresgrenze=.iso(ende),innerhalb_wiederholungszeitraum=erneut<=ende)
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(fruehere_geheilte_kuendigung_am=fruehere_geheilte_kuendigung_am, erneute_kuendigung_am=erneute_kuendigung_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswerte","BGB_MIETE_SCHONFRIST_WIEDERHOLUNGSZEITRAUM",eingaben,list(list(operation="Fr\u00fchere geheilte K\u00fcndigung um zwei Jahre fortschreiben und erneute K\u00fcndigung einschlie\u00dflich des Grenztags vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7569III2Satz2: erneute K\u00fcndigung innerhalb von einschlie\u00dflich zwei Jahren nach fr\u00fcherer, durch Schonfrist unwirksam gewordener K\u00fcndigung. Eine blo\u00df erfolgte Mietzahlung ohne diese fr\u00fchere Heilung gen\u00fcgt nicht als Bezugsvorgang. Zeitraum keine Handlungsfrist; keine193Verschiebung. Ergebnis betrifft nur die Wiederholungsgrenze der Schonfrist, nicht jede Zahlung, Aufrechnung oder sonstige Unwirksamkeit der neuen K\u00fcndigung.")
 ergebnis
}
kauf_digitale_mindesthaftungsdauer <- function(ablieferung_am=NULL, bereitstellung_bis=NULL, bereitstellung_unbefristet=NULL, einordnungsnachweis=NULL) {
 lieferung <- .datum(ablieferung_am,'ablieferung_am');.wahrheitswert(bereitstellung_unbefristet,'bereitstellung_unbefristet')
 if(bereitstellung_unbefristet) {
  if(!is.null(bereitstellung_bis)) .fehler('bereitstellung_bis','Bei unbefristeter Bereitstellung kein bestimmtes Ende einsetzen.')
  ende <- NULL
 } else {
  ende <- .datum(bereitstellung_bis,'bereitstellung_bis')
  if(ende<lieferung) .fehler('bereitstellung_bis','Bereitstellungsende darf nicht vor Ablieferung liegen.')
 }
 mindestende <- .frist(ablieferung_am,2,'jahre','ereignis')
 wert <- list(zweijahresgrenze=.iso(mindestende),massgebliches_zeitraumende=if(is.null(ende)) NULL else .iso(max(ende,mindestende)))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(ablieferung_am=ablieferung_am, bereitstellung_bis=bereitstellung_bis, bereitstellung_unbefristet=bereitstellung_unbefristet, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswerte","BGB_KAUF_DIGITALE_MINDESTHAFTUNGSDAUER",eingaben,list(list(operation="Zweijahresgrenze ab Ablieferung berechnen und mit qualifiziertem Bereitstellungsende das sp\u00e4tere Ende bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7475cII: zeitlicher Umfang der Anforderungen an dauerhaft bereitzustellende digitale Elemente, mindestens zwei Jahre ab Ablieferung. Bei l\u00e4ngerem qualifizierten Bereitstellungszeitraum gilt dessen Ende; bei unbefristeter Bereitstellung kein bestimmtes Gesamtende. Keine Verj\u00e4hrungsfrist und keine Beweislastvermutung477II; Mangel, \u00fcbrige Anspruchsvoraussetzungen und rechtliche Bestimmung des Bereitstellungszeitraums separat. Keine193Verschiebung. Nur hier festgelegte endliche oder tats\u00e4chlich unbefristete Dauer; unbekannte Dauer darf nicht als unbefristet eingesetzt werden.")
 ergebnis
}
