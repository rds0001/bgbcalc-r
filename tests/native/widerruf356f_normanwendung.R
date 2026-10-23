argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/widerruf356f_normanwendung.json'),simplifyVector=FALSE)
h <- 'Unterrichtung tatsächlich vollständig ausgeblieben, kein erfundenes Regelfristende.'
ende <- widerruf_hoechstfristende('unentgeltliches_darlehen_ohne_unterrichtung_356f',list(d$vertrag),h)$wert$hoechstfristende_ohne_kalenderkorrektur
stopifnot(identical(ende,d$hoechstende))
r <- widerruf_fristenden_zusammenfuehren(NULL,ende,h)$wert
stopifnot(identical(r$rechnerisch_bestimmbares_ende,d$hoechstende),identical(r$regelfristende_vorhanden,FALSE),identical(r$hoechstfristende_vorhanden,TRUE))
cat('Native356f-Kette ohne Unterrichtung bestanden.\n')
