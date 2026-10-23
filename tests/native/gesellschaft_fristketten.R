argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/gesellschaft_fristketten.json'),simplifyVector=FALSE)
for(f in faelle) {
 if(f$art=='erbe') {
  schutz <- do.call(verjaehrung_ablaufhemmung_mindestablauf,f$schutz_eingaben)
  stopifnot(identical(schutz$status,'BERECHNET'))
  r <- gesellschaft_erbenrechtsfrist(erbschaftskenntnis_am='2024-01-31',ablaufhemmung_mindestende_am=schutz$wert$rechnerischer_letzter_tag,ausschlagungsrecht_bei_dreimonatsablauf_noch_offen=TRUE,ausschlagungsfristende_am='2024-07-31',einordnungsnachweis=f$nachweis)
  stopifnot(identical(r$status,'BERECHNET'));ende <- r$wert$rechnerisches_ausuebungsfristende
 } else if(f$art=='hemmung') {
  grund <- gesellschaft_fuenfjahresgrundfrist(fristfall='erloeschen_verjaehrung_739',ausscheiden_oder_erloeschen_am='2024-01-01',glaeubigerkenntnis_am='2024-01-31',registereintragung_am=NULL,einordnungsnachweis=f$nachweis)
  stopifnot(identical(grund$status,'BERECHNET'))
  r <- verjaehrung_gehemmte_kalendertage(fristlauf_erster_tag='2024-02-01',grundfrist_letzter_tag=grund$wert$rechnerisches_fuenfjahresende,hemmungszeitraeume=list(list(erster_gehemmter_tag='2024-03-01',letzter_gehemmter_tag='2024-03-31')),hemmung_nach_209_anwendbar=TRUE)
  stopifnot(identical(r$status,'BERECHNET'),r$wert$beruecksichtigte_hemmungstage==31);ende <- r$wert$rechnerischer_letzter_tag
 } else {
  r <- verjaehrung_neubeginn_grundfrist(neubeginnereignis_am='2026-06-30',fristdauer=5,fristeinheit='jahre',wirksamer_neubeginn=TRUE)
  stopifnot(identical(r$status,'BERECHNET'));ende <- r$wert
  if(f$art=='neubeginn_kurz') {
   kurz <- verjaehrung_neubeginn_grundfrist(neubeginnereignis_am='2026-06-30',fristdauer=3,fristeinheit='jahre',wirksamer_neubeginn=TRUE)
   stopifnot(identical(kurz$status,'BERECHNET'));ende <- min(ende,kurz$wert)
  }
 }
 stopifnot(identical(ende,f$erwartetes_ende))
}
cat(length(faelle),'R Gesellschaftsfristketten PASS\n')
