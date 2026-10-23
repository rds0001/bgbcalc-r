schenkung_unterhaltsrueckforderung <- function(unterhaltsbedarf=NULL,eigene_deckungsmittel=NULL,beschenkte=NULL,einordnungsnachweis=NULL) {
 bedarf <- .geld(unterhaltsbedarf); deckung <- .geld(eigene_deckungsmittel)
 .text(einordnungsnachweis,'einordnungsnachweis'); .vorhanden(beschenkte,'beschenkte')
 if(!is.list(beschenkte) || !is.null(names(beschenkte)) || length(beschenkte)>1000) .fehler('beschenkte','Liste mit h\u00f6chstens 1000 Beschenkten erforderlich.')
 geprueft <- list(); kennungen <- character(); raenge <- numeric()
 for(person in beschenkte) {
  if(!is.list(person) || !identical(sort(names(person)),sort(c('beschenkten_id','schenkungsrang','bereicherungsgrenze','leistungsfaehigkeitsgrenze')))) .fehler('beschenkte','Je Beschenktem sind Kennung, eindeutiger Schenkungsrang und beide Betragsgrenzen erforderlich.')
  kennung <- .text(person$beschenkten_id,'beschenkten_id'); rang <- .ganzzahl(person$schenkungsrang,'schenkungsrang',1,1000000)
  if(kennung %in% kennungen || rang %in% raenge) .fehler('beschenkte','Beschenktenkennungen und rechtlich bestimmte Schenkungsr\u00e4nge m\u00fcssen eindeutig sein.')
  kennungen <- c(kennungen,kennung); raenge <- c(raenge,rang)
  geprueft[[length(geprueft)+1]] <- list(rang=rang,kennung=kennung,bereicherung=.geld(person$bereicherungsgrenze),leistungsfaehigkeit=.geld(person$leistungsfaehigkeitsgrenze))
 }
 fehlbetrag <- .subtrahieren(bedarf,deckung); if(.vergleichen(fehlbetrag,.bruch(0))<0) fehlbetrag <- .bruch(0)
 rest <- fehlbetrag; verteilung <- list()
 for(i in order(raenge,decreasing=TRUE)) {
  person <- geprueft[[i]]; anteil <- rest
  if(.vergleichen(person$bereicherung,anteil)<0) anteil <- person$bereicherung
  if(.vergleichen(person$leistungsfaehigkeit,anteil)<0) anteil <- person$leistungsfaehigkeit
  rest <- .subtrahieren(rest,anteil)
  verteilung[[length(verteilung)+1]] <- list(beschenkten_id=person$kennung,rueckforderungsbetrag=.bruchteile(anteil))
 }
 wert <- list(unterhaltsfehlbetrag=.bruchteile(fehlbetrag),verteilung=verteilung,gesamtbetrag=.bruchteile(.subtrahieren(fehlbetrag,rest)),ungedeckter_fehlbetrag=.bruchteile(rest))
 eingaben <- list(unterhaltsbedarf=unterhaltsbedarf,eigene_deckungsmittel=eigene_deckungsmittel,beschenkte=beschenkte,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR','BGB_SCHENKUNG_UNTERHALTSRUECKFORDERUNG',eingaben,list(list(operation='Positiven Unterhaltsfehlbetrag in absteigender Schenkungsrangfolge jeweils auf Bereicherungs- und Leistungsf\u00e4higkeitsgrenze begrenzen.')),eingaben)
 ergebnis$hinweise <- list("Nur qualifizierte Geldbetr\u00e4ge eines einheitlichen Unterhaltszeitraums nach \u00a7\u00a7528/529. Jede Person genau einmal mit einem eindeutigen Schenkungsrang; h\u00f6herer Rang bedeutet sp\u00e4ter beschenkt. Gleichzeitig Beschenkte und mehrere Schenkungen an dieselbe Person mit konkurrierenden R\u00e4ngen sind nicht erfasst. Bedarf umfasst rechtlich ber\u00fccksichtigungsf\u00e4higen eigenen Unterhalt und gesetzliche Unterhaltspflichten. Bereicherungsgrenze muss Bereicherungsrecht, bereits erfolgte R\u00fcckzahlungen und Ausschl\u00fcsse nach \u00a7529 Absatz1 ber\u00fccksichtigen; ausgeschlossene Schenkung mit null. Leistungsf\u00e4higkeitsgrenze ist nach \u00a7529 Absatz2 unter Ber\u00fccksichtigung sonstiger Verpflichtungen rechtlich bestimmter verf\u00fcgbarer Geldbetrag. Keine automatische Bewertung von Sachgeschenken, Unterhalt, Leistungsf\u00e4higkeit, Bed\u00fcrftigkeit, Frist oder Anspruchsausschluss; keine wiederholte Nutzung derselben verbleibenden Bereicherung ohne Fortschreibung. Abwendung durch Unterhaltszahlung, F\u00e4lligkeit/R\u00fcckst\u00e4nde nach \u00a7\u00a7760/1613 und Tod nach \u00a71615 gesondert qualifizieren.")
 ergebnis
}
