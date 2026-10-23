argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
d <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/unterhalt1607_1609_normanwendung.json'),simplifyVector=FALSE);h <- d$nachweis
primaer <- unterhalt_rangweise_mittelverteilung('100',d$berechtigte,h)$wert
rest <- primaer$verteilung[[1]]$ungedeckter_restbedarf
stopifnot(identical(rest,list(zaehler='75',nenner='1')))
ersatz <- unterhalt_anteile_mit_leistungsgrenzen(rest,d$ersatzpflichtige,h)$wert
stopifnot(identical(lapply(ersatz$verteilung,function(p)p$beibringbarer_unterhaltsbetrag),list(list(zaehler='20',nenner='1'),list(zaehler='55',nenner='1'))),identical(ersatz$ungedeckter_barunterhalt,list(zaehler='0',nenner='1')))
cat('Native R-Rang-/Ersatzhaftungskette bestanden.\n')
