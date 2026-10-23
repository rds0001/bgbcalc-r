argumente <- getOption('bgb.pruefargumente',commandArgs(trailingOnly=TRUE))
options(warn=2)
if(!isTRUE(getOption('bgb.instrumentiert'))) for(datei in list.files(file.path(argumente[[1]],'r/R'),full.names=TRUE)) source(datei)
faelle <- jsonlite::fromJSON(file.path(argumente[[1]],'tests/fixtures/kompositionsfaelle/teilzahlung508_normanwendung.json'),simplifyVector=FALSE)
for(f in faelle) {
 r <- do.call(verbraucherdarlehen_verzugsschwelle,c(f$rueckstand_eingaben,list(nennbetrag=f$gesamtbetrag,immobiliar_verbraucherdarlehen=FALSE,teilzahlungsdarlehen=TRUE)))
 stopifnot(identical(r$status,'BERECHNET'),identical(r$wert$rueckstandsquote,f$erwartete_quote),identical(r$wert$mindestrueckstand,f$erwarteter_mindestrueckstand),identical(r$wert$voraussetzungen_nummer_1_erfuellt,f$erwartete_nummer1))
 n <- do.call(verbraucherdarlehen_kuendigungsnachfrist,f$nachfrist_eingaben)
 stopifnot(identical(n$status,'BERECHNET'),identical(n$wert$rechnerisches_mindestende,f$erwartetes_mindestende),isTRUE(n$wert$nachfrist_am_prueftag_abgelaufen))
}
cat(length(faelle),'R Teilzahlung508-Ketten PASS\n')
