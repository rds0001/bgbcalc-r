miete_werktagstermin <- function(fristfall=NULL, bezugsdatum=NULL, werktagskalender=NULL, kalendernachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('zahlung_556b','grundstueck_quartal_579','landpacht_abschnitt_587'))
 tag <- .datum(bezugsdatum,'bezugsdatum');.text(kalendernachweis,'kalendernachweis')
 .vorhanden(werktagskalender,'werktagskalender')
 if(!is.list(werktagskalender)||!identical(sort(names(werktagskalender)),sort(c('erster_kalendertag','letzter_kalendertag','werktage')))) .fehler('werktagskalender','Genau erster_kalendertag, letzter_kalendertag und werktage erforderlich.')
 kalender <- .bankkalender(list(erster_kalendertag=werktagskalender$erster_kalendertag,letzter_kalendertag=werktagskalender$letzter_kalendertag,geschaeftstage=werktagskalender$werktage))
 if(fristfall=='zahlung_556b') {
  erster <- .banktermin(tag,kalender,'ab')
  ende <- .banktermin(erster,kalender,'nach',2)
 } else {
  if(fristfall=='grundstueck_quartal_579' && (!as.integer(format(tag,'%m')) %in% c(3,6,9,12)||tag!=.frist(paste0(substr(.iso(tag),1,8),'01'),1,'monate','tagesbeginn'))) .fehler('bezugsdatum','Letzter Tag eines Kalenderquartals erforderlich.')
  ende <- .banktermin(.tage_addieren(tag,1),kalender,'ab')
 }
 wert <- list(rechnerischer_zahlungstermin=.iso(ende))
 eingaben <- list(fristfall=fristfall, bezugsdatum=bezugsdatum, werktagskalender=werktagskalender, kalendernachweis=kalendernachweis)
 ergebnis <- .ergebnis(wert,"datum","BGB_MIETE_WERKTAGSTERMIN",eingaben,list(list(operation="Vorhandene Kalenderauswahl wiederverwenden:556b dritter einschl\u00e4giger Werktag ab Zeitabschnittsbeginn einschlie\u00dflich;579 erster einschl\u00e4giger Werktag nach Kalenderquartalsende. 587: erster einschlaegiger Werktag nach dem rechtlich bestimmten Bemessungsabschnitt.")),eingaben)
 ergebnis$hinweise <- list("\u00a7556bI und579II: Miete zu Beginn, sp\u00e4testens am dritten Werktag des Bemessungszeitabschnitts; Ergebnis ist \u00e4u\u00dferer Zahlungstermin, nicht automatisch Verzugseintritt oder notwendiger Geldeingang. \u00a7579I3 nur Grundst\u00fccksmiete ohne k\u00fcrzere Bemessungsabschnitte: erster Werktag nach Kalenderquartal. R\u00e4ume folgen579II/556b. Andere bewegliche Sachen oder k\u00fcrzere Grundst\u00fccksabschnitte nach579I1/2 nicht dieser Quartalsregel unterwerfen. Werk-/Bankgesch\u00e4ftstagsbegriffe nicht gleichsetzen: intern wird nur dieselbe geordnete Kalendersuche wiederverwendet. \u00dcberweisungs-/Barzahlungsregeln und Feiertage ausdr\u00fccklich im Werktagskalender begr\u00fcnden; keine pauschale Montag-bis-Freitag- oder Samstagannahme. Unzureichend belegte Kalender werden zur\u00fcckgewiesen.")
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7587I2: bei Bemessung nach Zeitabschnitten erster rechtlich einschlaegiger Werktag nach deren Ablauf; bezugsdatum ist letzter Abschnittstag, kein zwingendes Kalenderquartal. Werktagskalender vollstaendig rechtlich belegen. Ohne Abschnittsbemessung gilt587I1: Ende der Pachtzeit; gegebenenfalls193 gesondert.587II verweist fuer Ersparnis und anderweitige Verwertung auf537; vorhandene Betragsrechnung verwenden."))
 ergebnis
}
