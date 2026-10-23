argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/modernisierung_foerderkappung_normanwendung.json'),simplifyVector=FALSE)
br <- function(x) list(zaehler=x,nenner='1')
for(f in faelle) {
 zins <- modernisierung_zinsermaessigung('6000','3','5','Synthetischer Vergleichszins, kein aktueller Marktwert.',TRUE,FALSE)$wert
 stopifnot(identical(zins,br('120')))
 basis <- modernisierung_regulaerer_zwischenbetrag('10000','2000','1000',zins,'0',TRUE)$wert
 stopifnot(identical(basis$jahresbetrag_vor_laufenden_abzuegen,br('560')))
 kap <- modernisierung_kappungsgrenze(f$wohnflaeche,f$altmiete_je_qm,f$bisherige_erhoehung,'0',f$erhoehungsart,TRUE)$wert$massgebliche_restgrenze
 stopifnot(identical(kap,br(f$restkappung)))
 for(modus in c('abzug_vor_kappung','abzug_nach_kappung')) {
  erwartet <- if(modus=='abzug_vor_kappung') f$betrag_vor else f$betrag_nach
  ergebnis <- modernisierung_kappung_mit_laufenden_abzuegen(basis$jahresbetrag_vor_laufenden_abzuegen,zins,'0',kap,modus,'Synthetische explizite Methodenwahl; kein allgemeiner Rechtsauslegungsbeleg.')$wert
  stopifnot(identical(ergebnis$monatlicher_betrag_nach_vorgegebener_methode,br(erwartet)))
 }
}
cat(length(faelle)*2,'native R-Foerderkappungsketten bestanden.\n')
