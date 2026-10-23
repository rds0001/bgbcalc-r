argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/schuldverschreibung802_801_normanwendung.json'),simplifyVector=FALSE)
h <- 'Qualifizierte801III-Urkundenbestimmung und802/206-Verknüpfung; festes Fenster rechtlich bestimmt.'
vorgrund <- fristende('2024-01-01',1,'jahre','tagesbeginn')$wert
stopifnot(identical(vorgrund,'2024-12-31'))
sechs <- schuldrechtliche_sondergrundfrist('schuldverschreibung_zahlungssperre_802','2024-01-01',h)$wert$rechnerisches_fristende
stopifnot(identical(sechs,'2024-07-01'))
korr <- verjaehrung_hoehere_gewalt_festes_ablauffenster('2024-01-02',sechs,list(list(erster_verhinderter_tag='2024-06-25',letzter_verhinderter_tag='2024-07-05')),'fester_ablauf_ohne_206','letzter_monatstag',h)$wert$rechnerischer_letzter_tag
stopifnot(identical(korr,'2024-07-08'))
for(f in faelle) {
 intervalle <- schuldverschreibung_zahlungssperre_intervall('2024-01-01',TRUE,korr,NULL,f$erledigung,'2024-08-01',h)$wert
 stopifnot(isTRUE(intervalle$hemmung_bis_beobachtung_abgeschlossen),identical(intervalle$feststehendes_hemmungsende,f$hemmungsende))
 vor <- verjaehrung_gehemmte_kalendertage('2024-01-01',vorgrund,intervalle$hemmungszeitraeume,TRUE)$wert
 stopifnot(vor$beruecksichtigte_hemmungstage==f$tage,identical(vor$rechnerischer_letzter_tag,f$vorlegungsende),identical(fristende(vor$rechnerischer_letzter_tag,2,'jahre','ereignis')$wert,f$verjaehrungsende))
}
cat('Native801/802-Gesamtketten bestanden.\n')
