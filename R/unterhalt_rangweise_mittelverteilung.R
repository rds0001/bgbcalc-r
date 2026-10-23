unterhalt_rangweise_mittelverteilung <- function(verfuegbare_mittel=NULL, berechtigte=NULL, verteilungsnachweis=NULL) {
 mittel <- .geld(verfuegbare_mittel);.text(verteilungsnachweis,'verteilungsnachweis');.vorhanden(berechtigte,'berechtigte')
 if(!is.list(berechtigte)||!is.null(names(berechtigte))||length(berechtigte)<1||length(berechtigte)>1000) .fehler('berechtigte','Nichtleere begrenzte Liste erforderlich.')
 personen <- character();raenge <- numeric();grade <- numeric();gewichte <- list();bedarfe <- list()
 for(p in berechtigte) {
  if(!is.list(p)||length(p)!=5||!setequal(names(p),c('person_id','rang1609','verwandtschaftsgrad','ungedeckter_bedarf','verteilungsgewicht'))) .fehler('berechtigte','Genau Kennung, Rang, Bedarf und Gewicht erforderlich.')
  k <- .text(p$person_id,'person_id');r <- .ganzzahl(p$rang1609,'rang1609',1,7);g <- .geld(p$verteilungsgewicht);b <- .geld(p$ungedeckter_bedarf)
  if(k %in% personen||.vergleichen(g,.bruch(0))<=0) .fehler('berechtigte','Eindeutige Kennung und positives Gewicht erforderlich.')
  grad <- if(r==7) .ganzzahl(p$verwandtschaftsgrad,'verwandtschaftsgrad',2,1000) else 0
  if(r!=7&&!is.null(p$verwandtschaftsgrad)) .fehler('verwandtschaftsgrad','Nur Rang7verwendet einen Naehegrad.')
  personen <- c(personen,k);raenge <- c(raenge,r);grade <- c(grade,grad);gewichte[[length(personen)]] <- g;bedarfe[[length(personen)]] <- b
 }
 rest <- mittel;zuordnung <- rep(list(.bruch(0)),length(personen))
 stufen <- unique(data.frame(rang=raenge,grad=grade));stufen <- stufen[order(stufen$rang,stufen$grad),,drop=FALSE]
 for(stufe in seq_len(nrow(stufen))) {
  indices <- which(raenge==stufen$rang[[stufe]] & grade==stufen$grad[[stufe]]);aus <- .begrenzte_quotenverteilung(rest,gewichte[indices],bedarfe[indices]);rest <- aus$rest
  for(j in seq_along(indices)) zuordnung[[indices[[j]]]] <- aus$zugeordnet[[j]]
 }
 wert <- list(verteilung=lapply(seq_along(personen),function(i)list(person_id=personen[[i]],rang1609=raenge[[i]],verwandtschaftsgrad=if(raenge[[i]]==7) grade[[i]] else NULL,zugeordneter_unterhalt=.bruchteile(zuordnung[[i]]),ungedeckter_restbedarf=.bruchteile(.subtrahieren(bedarfe[[i]],zuordnung[[i]])))),gesamt_zugeordnet=.bruchteile(.subtrahieren(mittel,rest)),verbleibende_mittel=.bruchteile(rest))
 eingaben <- list(verfuegbare_mittel=verfuegbare_mittel, berechtigte=berechtigte, verteilungsnachweis=verteilungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_UNTERHALT_RANGWEISE_MITTELVERTEILUNG",eingaben,list(list(operation="Verfuegbare Mittel nach1609Raengen, innerhalb jedes Rangs nach qualifizierten Gewichten unter Bedarfsgrenzen verteilen und ungedeckten Rest ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7\u00a71603/1609: qualifizierte verfuegbare Mittel rangweise verwenden. Rang1vor2usw.; innerhalb Rang7gehen naehere Verwandtschaftsgrade den ferneren vor. Innerhalb eines Rangs nach rechtlich begruendeten Gewichten proportional unter individuellen ungedeckten Bedarfsgrenzen mit vorhandenem begrenztem Quotenkern verteilen. Erst danach Restmittel an naechsten Rang. Keine Gleichverteilung nach Koepfen und keine erfundene Unterhaltstabelle/Selbstbehaltshoehe.1603IIgesteigerte Haftung bestimmt rechtlich verfuegbare Mittel und qualifizierte Mangelfallgewichte, kein vom BGB vorgegebener weiterer pauschaler Prozentsatz. Gewichte und Grenzen muessen fuer die gesamte jeweilige Rangverteilung gelten; rechtliche Neubewertung bei geaenderter Grundlage explizit erforderlich. Mehrere Pflichtige1606IIIund Ersatzhaftung1607/1608mit bestehenden Anteils-/Leistungsgrenzenkernen in rechtlich bestimmter Reihenfolge komponieren; keine automatische globale Familienmatrix oder Umdeutung eines ungedeckten Bedarfs in Anspruch gegen beliebige Dritte. Bereits anderweitig gedeckte Bedarfe/gebundene Mittel nicht doppelt verwenden. Keine automatische Bestimmung von Berechtigung, Rang, Leistungsfaehigkeit, Naturalleistung oder Tabellenbetrag.")
 ergebnis
}
