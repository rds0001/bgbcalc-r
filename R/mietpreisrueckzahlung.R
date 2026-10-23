mietpreisbremse_rueckzahlungsbetraege <- function(ruegezugang_utc=NULL, rueckforderung_auf_spaetere_faelligkeit_beschraenkt=NULL, mietabschnitte=NULL, bereits_erstatteter_betrag=NULL, einordnungsnachweis=NULL) {
 ruege <- .reise_utc_zeitpunkt(ruegezugang_utc,'ruegezugang_utc');.wahrheitswert(rueckforderung_auf_spaetere_faelligkeit_beschraenkt,'rueckforderung_auf_spaetere_faelligkeit_beschraenkt');erstattet <- .geld(bereits_erstatteter_betrag)
 .text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(mietabschnitte,'mietabschnitte')
 if(!is.list(mietabschnitte) || !is.null(names(mietabschnitte)) || length(mietabschnitte)>1000) .fehler('mietabschnitte','Liste0..1000 erforderlich.')
 namen <- character();ids <- list();summe <- .geld('0')
 for(p in mietabschnitte) {
  if(!is.list(p) || !identical(sort(names(p)),sort(c('abschnitt_id','faelligkeit_utc','tatsaechlich_gezahlte_miete','zulaessige_miete')))) .fehler('mietabschnitte','Genau Kennung, F\u00e4lligkeit, gezahlte und zul\u00e4ssige Miete erforderlich.')
  name <- .text(p$abschnitt_id,'abschnitt_id')
  if(name %in% namen) .fehler('abschnitt_id','Jeden Mietabschnitt nur einmal angeben.')
  namen <- c(namen,name);faellig <- .reise_utc_zeitpunkt(p$faelligkeit_utc,'faelligkeit_utc');gezahlt <- .geld(p$tatsaechlich_gezahlte_miete);zulaessig <- .geld(p$zulaessige_miete)
  if(!rueckforderung_auf_spaetere_faelligkeit_beschraenkt || faellig>ruege) {
   ids <- c(ids,list(name));ueber <- if(.vergleichen(gezahlt,zulaessig)>0) .subtrahieren(gezahlt,zulaessig) else .geld('0');summe <- .addieren(summe,ueber)
  }
 }
 rest <- if(.vergleichen(summe,erstattet)>0) .subtrahieren(summe,erstattet) else .geld('0')
 wert <- list(beruecksichtigte_abschnitt_ids=ids,ueberzahlung_vor_erstattung=.bruchteile(summe),verbleibender_rueckzahlungsbetrag=.bruchteile(rest))
 eingaben <- list(ruegezugang_utc=ruegezugang_utc, rueckforderung_auf_spaetere_faelligkeit_beschraenkt=rueckforderung_auf_spaetere_faelligkeit_beschraenkt, mietabschnitte=mietabschnitte, bereits_erstatteter_betrag=bereits_erstatteter_betrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_MIETPREISBREMSE_RUECKZAHLUNGSBETRAEGE",eingaben,list(list(operation="Miet\u00fcberzahlungen nach qualifizierter R\u00fcge-F\u00e4lligkeitsbeschr\u00e4nkung ausw\u00e4hlen, abschnittsweise positive Differenzen summieren und geleistete Erstattung abziehen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7556gI/II: je qualifiziertem Mietabschnitt positive Differenz aus tats\u00e4chlich gezahlter und zul\u00e4ssiger Miete. Im Beschr\u00e4nkungsfall nur nach R\u00fcgezugang f\u00e4llig gewordene Miete ausw\u00e4hlen; Zahlungsdatum ersetzt F\u00e4lligkeit nicht. Bei identischem qualifiziertem Zeitpunkt liegt keine sp\u00e4tere F\u00e4lligkeit vor. Ausgew\u00e4hlte \u00dcberzahlungen addieren und zugeh\u00f6rige Erstattung bis auf null abziehen. Keine Verrechnung einer Unterzahlung in einem anderen Abschnitt, keine automatische Zins-/Verj\u00e4hrungsrechnung.30Monatsgrenze und Beendigung bei R\u00fcge sind hier vorqualifiziert, nicht als automatisch gel\u00f6ste Fristableitung ausgeben. Kein Aufsummieren mehrerer Vollmietgrenzen f\u00fcr Teilzahlungen desselben Abschnitts. UTC-Sekunden nur bei ausreichend genauer Normalisierung.")
 ergebnis
}
