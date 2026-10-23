# Zusätzliche Buch5-Anwendungsbelege, keine neue Produktions-API.
argumente <- getOption('bgb.pruefargumente', commandArgs(trailingOnly=TRUE))
stopifnot(length(argumente) >= 1L)
options(warn=2)
if (!isTRUE(getOption('bgb.instrumentiert'))) for (datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
pfad <- if(length(argumente)==2L) argumente[[2]] else file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/erbrecht_schiffsnormanwendung.json')
faelle <- jsonlite::fromJSON(pfad,simplifyVector=FALSE)
ergebnisse <- list()
for (fall in faelle) {
 ergebnis <- do.call(get(fall$funktion),fall$eingaben)
 ergebnisse[[fall$fall_id]] <- ergebnis$wert
 stopifnot(identical(ergebnis$status,'BERECHNET'))
 wert <- ergebnis$wert
 for (teil in fall$wertpfad) wert <- wert[[teil]]
 if(!isTRUE(all.equal(wert,fall$erwartet))) stop(fall$fall_id)
}
cat(length(faelle),'R Normanwendungen PASS\n')
