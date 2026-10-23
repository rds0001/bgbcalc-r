argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/fortsetzung_bilanzkette_normanwendung.json'),simplifyVector=FALSE);h <- d$nachweis
br <- function(n)list(zaehler=as.character(n),nenner='1')
alt <- fortgesetzte_guetergemeinschaft_altlasten('200','100','0','0',h)$wert$anrechnungspostensumme
stopifnot(identical(alt,br(100)))
bilanz <- fortsetzung_rechnerische_schlussbilanz('900','100',alt,'100',h)$wert
stopifnot(identical(bilanz$ehegattensaldo,br(500)),identical(bilanz$abkoemmlingssaldo_vor_abfindungsanrechnung,br(500)),identical(bilanz$abkoemmlingssaldo,br(400)))
aus <- fortgesetzte_guetergemeinschaft_vorempfangsausgleich(bilanz$abkoemmlingssaldo_vor_abfindungsanrechnung,d$abkoemmlinge,h)$wert
stopifnot(identical(lapply(aus$verteilung,function(p)p$betrag),list(br(225),br(275))))
personen <- lapply(aus$verteilung,function(p)list(abkoemmling_id=p$person_id,grundanteilswert=p$betrag))
ende <- fortsetzung_beguenstigtenbezogene_lasten(personen,d$lasten,h)$wert
stopifnot(identical(lapply(ende$abkoemmlingssalden,function(p)p$rechnerischer_saldo),list(br(125),br(275))),identical(ende$rechnerische_saldosumme,bilanz$abkoemmlingssaldo))
cat('Native R-Bilanzkette bestanden.\n')
