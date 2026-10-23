darlehen_rueckzahlung_im_zweiwochenfenster <- function(kuendigung_wirksam_am=NULL, geschuldeter_betrag=NULL, rueckzahlungen=NULL, feiertagskalender=NULL, einordnungsnachweis=NULL) {
 start <- .datum(kuendigung_wirksam_am,'kuendigung_wirksam_am');schuld <- .geld(geschuldeter_betrag);.text(einordnungsnachweis,'einordnungsnachweis')
 grund <- .frist(kuendigung_wirksam_am,2,'wochen','ereignis')
 .vorhanden(feiertagskalender,'feiertagskalender')
 if(!is.list(feiertagskalender) || length(feiertagskalender)!=5 || !setequal(names(feiertagskalender),c('feiertage','ort','kalenderquelle','kalender_von','kalender_bis'))) .fehler('feiertagskalender','Vollst\u00e4ndiges Kalenderobjekt erforderlich.')
 ende <- .datum(do.call(werktagsverschiebung,c(list(datum=.iso(grund),anwendungsfall='leistung'),feiertagskalender))$wert,'fristende')
 .vorhanden(rueckzahlungen,'rueckzahlungen')
 if(!is.list(rueckzahlungen) || !is.null(names(rueckzahlungen)) || length(rueckzahlungen)>1000) .fehler('rueckzahlungen','Liste0..1000 erforderlich.')
 namen <- character();recht <- .geld('0');spaet <- .geld('0')
 for(z in rueckzahlungen) {
  if(!is.list(z) || length(z)!=3 || !setequal(names(z),c('zahlung_id','rueckzahlung_am','betrag'))) .fehler('rueckzahlungen','Genau zahlung_id,rueckzahlung_am,betrag erforderlich.')
  name <- .text(z$zahlung_id,'zahlung_id');tag <- .datum(z$rueckzahlung_am,'rueckzahlung_am');betrag <- .geld(z$betrag)
  if(name %in% namen || tag<start) .fehler('rueckzahlungen','Eindeutige Zahlungen ab Wirksamwerden erforderlich.')
  namen <- c(namen,name)
  if(tag<=ende) recht <- .addieren(recht,betrag) else spaet <- .addieren(spaet,betrag)
 }
 fehl <- if(.vergleichen(schuld,recht)>0) .subtrahieren(schuld,recht) else .bruch(0)
 wert <- list(rueckzahlungsgrundfrist_letzter_tag=.iso(grund),rueckzahlungsfrist_letzter_tag=.iso(ende),rechtzeitig_zurueckgezahlt=.bruchteile(recht),spaeter_zurueckgezahlt=.bruchteile(spaet),rechtzeitiger_fehlbetrag=.bruchteile(fehl),geschuldeter_betrag_rechtzeitig_gedeckt=.vergleichen(fehl,.bruch(0))==0)
 eingaben <- list(kuendigung_wirksam_am=kuendigung_wirksam_am, geschuldeter_betrag=geschuldeter_betrag, rueckzahlungen=rueckzahlungen, feiertagskalender=feiertagskalender, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_EUR_und_wahrheitswert","BGB_DARLEHEN_RUECKZAHLUNG_IM_ZWEIWOCHENFENSTER",eingaben,list(list(operation="Zweiwochenr\u00fcckzahlungsfrist mit193 korrigieren und rechtzeitige R\u00fcckzahlungen mit geschuldetem Betrag vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7489III: Zweiwochengrundfrist ab Wirksamwerden der K\u00fcndigung, anschlie\u00dfend193-Leistungsfristkorrektur mit vorhandenem Kalenderkern. Nur bis einschlie\u00dflich korrigiertem Ende erf\u00fcllungswirksame R\u00fcckzahlungen summieren; Deckung und positiven Fehlbetrag vergleichen. Sp\u00e4tere Zahlungen getrennt summieren, sie heilen die Frist nicht automatisch. Keine automatische K\u00fcndigungswirksamkeitsentscheidung; geschuldete Summe und Erf\u00fcllung rechtlich vorqualifiziert. Kalenderdatum einer Zahlung reicht nur bei rechtlich eindeutig normalisiertem Erf\u00fcllungszeitpunkt.")
 ergebnis
}
