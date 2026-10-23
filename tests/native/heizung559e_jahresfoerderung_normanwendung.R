argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
f <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/heizung559e_jahresfoerderung_normanwendung.json'),simplifyVector=FALSE)
h <- '559e-Fördertatbestand sowie559aII-Jahresabzugsmethode im konkreten Fall ausdrücklich rechtlich qualifiziert; Reihenfolge gegenüber Kappung vorgegeben.'
zins <- modernisierung_zinsermaessigung(f$darlehen,f$ermaessigt,f$markt,h,TRUE,FALSE)$wert
kap <- modernisierung_kappungsgrenze(f$wohnflaeche,'8','0','0','heizung_559e',TRUE)$wert$massgebliche_restgrenze
stopifnot(identical(zins,list(zaehler=f$zinsvorteil,nenner='1')),identical(kap,list(zaehler=f$kappung,nenner='1')))
for(s in f$faelle) {
 r <- heizungsmodernisierung_mit_jahresfoerderung('10000','0','0',zins,'20',kap,s$methode,h)$wert$foerderkappung
 stopifnot(identical(r$monatlicher_betrag_nach_vorgegebener_methode,list(zaehler=s$monat,nenner='1')))
}
cat('559e: zwei native Jahresförderketten bestanden.\n')
