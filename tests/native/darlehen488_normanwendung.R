argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/darlehen488_normanwendung.json'),simplifyVector=FALSE)
for(f in d$kalender) {
 jahr <- fristende(f$beginn,1,'jahre','ereignis')$wert
 stopifnot(identical(jahr,f$jahresende))
 nach_jahr <- fristverlaengerung(jahr,1,'tage')$wert
 stopifnot(identical(min(f$rueckzahlung,nach_jahr),f$zahlungstag))
}
for(f in d$zinsen) stopifnot(identical(gesetzliche_zinsen(f$kapital,f$zaehler,f$nenner,d$nachweis,FALSE,f$zinssatz)$wert,f$erwartung))
cat(length(d$kalender)+length(d$zinsen),'native R-Darlehenszinsfaelle bestanden.\n')
