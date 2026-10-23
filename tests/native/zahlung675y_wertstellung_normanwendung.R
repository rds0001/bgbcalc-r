argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/zahlung675y_wertstellung_normanwendung.json'),simplifyVector=FALSE);h <- d$nachweis;kal <- d$bankkalender
zugang <- zahlungsauftrag_zugangstage('2024-06-03',FALSE,NULL,kal,h)$wert$zugangstag_fuer_ausfuehrungsfrist
for(f in d$faelle) {
 soll <- zahlung_ausfuehrungsfristende(zugang,f$fristfall,NULL,kal,h)$wert$spaetester_eingangstag
 stopifnot(identical(soll,f$soll))
 vergleich <- zahlung_gutschrift_wertstellung(soll,'2024-06-10',h)$wert
 stopifnot(identical(vergleich$wertstellungsgrenze_eingehalten,FALSE),identical(vergleich$spaetestes_wertstellungsdatum,soll))
 letzter <- format(as.Date('2024-06-10')-1,'%Y-%m-%d')
 tage <- zinskalendertage_nach_ausschluss(soll,letzter,list(),h)$wert$verzinsliche_kalendertage
 stopifnot(tage==f$tage)
 zins <- gesetzliche_zinsen('1000',tage,366,h,FALSE,'3.66')$wert
 stopifnot(identical(zins,f$zins))
}
cat('2native R-Wertstellungs-/Zinskorrekturketten bestanden.\n')
