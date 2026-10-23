argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/mietpreis556e_normanwendung.json'),simplifyVector=FALSE)
h <- 'Zeitlich und sachlich qualifizierter556e-Fall, ohne laufende Förderabzüge stimmen beide Reihenfolgen überein.'
vormiete <- mietpreisbegrenzung_vormiete_bereinigen('900','100',list('50','25'),h)$wert$bereinigte_vormiete
grund <- mietpreisbegrenzung_grundbetrag('820',TRUE,FALSE,h)$wert
vormietweg <- mietpreisbegrenzung_vormietgrenze(grund,vormiete,TRUE,h)$wert
ohne <- mietpreisbegrenzung_grundbetrag('800',TRUE,FALSE,h)$wert
jahr <- modernisierung_regulaerer_zwischenbetrag('12000','2000','1000','0','0',TRUE)$wert$jahresbetrag_vor_laufenden_abzuegen
for(f in faelle) {
 kap <- modernisierung_kappungsgrenze('50','16',f$vorherige_erhoehung,'0','allgemein',TRUE)$wert$massgebliche_restgrenze
 z <- modernisierung_kappung_mit_laufenden_abzuegen(jahr,'0','0',kap,'abzug_vor_kappung',h)$wert$monatlicher_betrag_nach_vorgegebener_methode
 stopifnot(identical(z,list(zaehler=f$zuschlag,nenner='1')))
 r <- mietpreisbegrenzung_modernisierungsalternative(vormietweg,ohne,z,f$privileg,h)
 stopifnot(identical(r$wert$nutzbare_monatsgrenze,list(zaehler=f$grenze,nenner='1')))
}
cat('Native556e-Betragsketten bestanden.\n')
