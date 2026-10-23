argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/modernisierung559c_foerderung_normanwendung.json'),simplifyVector=FALSE)
h <- '559c/559a-Methoden rechtlich begründet, einmalige und laufende Förderung getrennt. Zinsermäßigung nach559cI3nicht abzugsfähig.'
for(f in faelle) {
 basis <- modernisierung_vereinfachte_foerderkostenbasis('10000','0','2000',f$kostenmethode,h)$wert$ausgewaehlte_kostenbasis
 jahr <- .bruchteile(.multiplizieren(.zahleneingabe(basis),.bruch(2,25)))
 kap <- modernisierung_kappungsgrenze('50','8',f$bisher,'0','allgemein',TRUE)$wert$massgebliche_restgrenze
 wert <- modernisierung_kappung_mit_laufenden_abzuegen(jahr,'0','120',kap,f$abzugsreihenfolge,h)$wert
 stopifnot(identical(wert$monatlicher_betrag_nach_vorgegebener_methode,f$erwartet))
}
cat('559c: vier native Förderketten bestanden.\n')
