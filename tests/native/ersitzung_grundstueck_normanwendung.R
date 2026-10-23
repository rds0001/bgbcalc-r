argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/ersitzung_grundstueck_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 k <- do.call(ersitzung_anrechenbare_zeitkette,f$ketten_eingaben)
 stopifnot(identical(k$status,'BERECHNET'),identical(k$wert$rechnerisches_fristende,f$erwartetes_besitzende))
 if(f$art=='buchersitzung_900') {
  r <- buchersitzung_dreissigjahresfrist(eintragung_am='1994-01-31',besitzbeginn_am='1994-01-31',beginnart='ereignis',rechtsart='eigentum',korrigiertes_fristende=k$wert$rechnerisches_fristende,prueftag='2024-02-29',zusammenhaengender_zeitraum_qualifiziert=TRUE,einordnungsnachweis=f$ketten_eingaben$einordnungsnachweis)
  stopifnot(identical(r$status,'BERECHNET'));ende <- r$wert$massgebliches_fristende
 } else {
  r <- grundstuecksaufgebot_kombinierte_zeitgrenze(berechnetes_eigenbesitzfristende=k$wert$rechnerisches_fristende,letzte_massgebliche_zustimmungseintragung_am='1995-02-28',einordnungsnachweis=f$ketten_eingaben$einordnungsnachweis)
  stopifnot(identical(r$status,'BERECHNET'));ende <- r$wert$rechnerische_kombinierte_zeitgrenze
 }
 stopifnot(identical(ende,f$erwartete_endgrenze))
}
cat(length(faelle),'R Grundstücks-Ersitzungsketten PASS\n')
