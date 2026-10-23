argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
f <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/grundbuch883_normanwendung.json'),simplifyVector=FALSE)
h <- '883III: maßgeblicher Eintragungsrang der rechtlich zugeordneten Vormerkung, keine automatische Auslegung des gesicherten Anspruchs.'
stopifnot(grundbuch_rangpaarvergleich(f$vormerkung,f$anderes_recht,h)$wert$rangvergleich==f$rangvergleich)
spaet <- f$vormerkung;spaet$eintragungstag <- f$spaetere_rechtseintragung
stopifnot(grundbuch_rangpaarvergleich(spaet,f$anderes_recht,h)$wert$rangvergleich==1)
r <- grundbuch_betraglicher_rangumfang('120','100','vormerkungsumfang_883',h)$wert
stopifnot(identical(r$erfasster_rechtsteil,list(zaehler=f$erfasster_teil,nenner='1')),identical(r$nicht_erfasster_rechtsteil,list(zaehler=f$restteil,nenner='1')))
cat('883: native Vormerkungsrang-/Teilbetragskette bestanden.\n')
