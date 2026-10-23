# Zusätzliche Buch5-Anwendungsbelege, keine neue Produktions-API.
argumente <- getOption('bgb.pruefargumente', commandArgs(trailingOnly=TRUE))
stopifnot(length(argumente) >= 1L)
options(warn=2)
if (!isTRUE(getOption('bgb.instrumentiert'))) for (datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
pfad <- if(length(argumente)==2L) argumente[[2]] else file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/erbrecht_normanwendungen_zusatz.json')
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

teile <- list(ehegatte=.bruch(1,2),verwandter=.bruch(1,8))
stopifnot(.vergleichen(.addieren(teile$ehegatte,teile$verwandter),.bruch(5,8))==0)
stopifnot(.vergleichen(.subtrahieren(.bruch(1,3),.bruch(1,4)),.bruch(1,12))==0)
stopifnot(min(ergebnisse$`1954_grund`$dreissigjahresgrenze,ergebnisse$`1954_ablaufhemmung`$rechnerischer_letzter_tag)=='2024-04-01')
ende <- ergebnisse$`2252_hemmung`$rechnerischer_letzter_tag
stopifnot('2024-04-10'<=ende,'2024-04-11'<=ende,!('2024-04-12'<=ende))
stopifnot(identical(ergebnisse$`2189_stufe1`$nachrangiger_zuteilungsbetrag,list(zaehler='60',nenner='1')))
stopifnot(identical(ergebnisse$`2189_stufe2`$nachrangiger_zuteilungsbetrag,list(zaehler='10',nenner='1')))
