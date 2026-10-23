vaterschaftsanfechtung_grundfrist <- function(kenntnis_am=NULL,kind_geboren_am=NULL,fristfall=NULL,berechtigter_geboren_am=NULL,anerkennung_wirksam_am=NULL,fristbeginnnachweis=NULL) {
  kenntnis <- .datum(kenntnis_am,"kenntnis_am");geburt <- .datum(kind_geboren_am,"kind_geboren_am")
  fall <- .text(fristfall,"fristfall")
  if (!fall %in% c("allgemein","minderjaehriger_selbst")) .fehler("fristfall","allgemein oder minderjaehriger_selbst erforderlich.")
  .text(fristbeginnnachweis,"fristbeginnnachweis")
  ereignis <- max(kenntnis,geburt)
  if (!is.null(anerkennung_wirksam_am)) ereignis <- max(ereignis,.datum(anerkennung_wirksam_am,"anerkennung_wirksam_am"))
  zweijahresende <- .frist(.iso(ereignis),2,"jahre","ereignis")
  volljaehrigkeit <- NULL;mindestende <- NULL
  if (fall=="minderjaehriger_selbst") {
    berechtigtengeburt <- .datum(berechtigter_geboren_am,"berechtigter_geboren_am")
    if (kenntnis < berechtigtengeburt) .fehler("kenntnis_am","Eigene Kenntnis kann nicht vor eigener Geburt liegen.")
    volljaehrigkeit <- .tage_addieren(.frist(berechtigter_geboren_am,18,"jahre","tagesbeginn"),1)
    zweijahresende <- max(zweijahresende,.frist(.iso(volljaehrigkeit),2,"jahre","tagesbeginn"))
    mindestende <- .frist(berechtigter_geboren_am,21,"jahre","tagesbeginn")
  } else if (!is.null(berechtigter_geboren_am)) {
    .datum(berechtigter_geboren_am,"berechtigter_geboren_am")
    .fehler("berechtigter_geboren_am","Im allgemeinen Fristfall keine unber\u00fccksichtigte Altersangabe zul\u00e4ssig.")
  }
  eingaben <- list(kenntnis_am=kenntnis_am,kind_geboren_am=kind_geboren_am,fristfall=fristfall,berechtigter_geboren_am=berechtigter_geboren_am,anerkennung_wirksam_am=anerkennung_wirksam_am,fristbeginnnachweis=fristbeginnnachweis)
  ende <- if (is.null(mindestende)) zweijahresende else max(zweijahresende,mindestende)
  wert <- list(fruehestes_ereignisbezogenes_beginn_datum=.iso(ereignis),volljaehrigkeitsbeginn=if (is.null(volljaehrigkeit)) NULL else .iso(volljaehrigkeit),zweijahresgrundfristende=.iso(zweijahresende),mindestablauf_vollendung_21=if (is.null(mindestende)) NULL else .iso(mindestende),anfechtungsgrundfristende=.iso(ende))
  ergebnis <- .ergebnis(wert,"daten","BGB_VATERSCHAFTSANFECHTUNG_GRUNDFRIST",eingaben,list(list(operation="Sp\u00e4testes Ereignis aus Kenntnis, Kindesgeburt und gegebenenfalls wirksamer Anerkennung f\u00fcr Zweijahresfrist w\u00e4hlen; bei eigener Minderj\u00e4hrigenanfechtung Vollj\u00e4hrigkeit als Tagesbeginn und Vollendung21 als Mindestablauf ber\u00fccksichtigen.")),eingaben)
  ergebnis$hinweise <- list("\u00a71600bI/II der lokalen Fassung: ungest\u00f6rte Grundfrist, keine abschlie\u00dfende Anfechtungszul\u00e4ssigkeit. allgemein setzt rechtlich qualifiziert voraus, dass die besondere eigene Minderj\u00e4hrigenfrist nicht eingreift. minderjaehriger_selbst erfasst die eigene Anfechtung nach Absatz2S\u00e4tze2/3; Kenntnis ist eigene Kenntnis, nicht Vertreterkenntnis. Die Auswahl ersetzt keine Pr\u00fcfung der gesetzlichen Fallvoraussetzungen. anerkennung_wirksam_am nur bei ma\u00dfgeblicher Anerkennung; bei anderweitiger Vaterschaftszuordnung null. Kindesgeburt und Kenntnis k\u00f6nnen vor Wirksamkeit der Anerkennung liegen. Altersgrenzen nach\u00a7187II2 ab Tagesbeginn: Ablauf am Vortag des21.Geburtstags bedeutet Vollendung21 mit Ablauf dieses Tages, nicht einen Tag fr\u00fcher. Geburtsdaten/Wirksamkeitszeitpunkte rechtlich qualifiziert. Vertreteranfechtung Minderj\u00e4hriger, Wiederanfechtung nach Gesch\u00e4ftsunf\u00e4higkeit(Absatz3), Neubeginn bei Unzumutbarkeit(Absatz5), s\u00e4mtliche Hemmungen/\u00a7\u00a7204,206,210 und\u00a7193-Korrekturen nicht berechnet. Fristende daher nicht ungepr\u00fcft als tats\u00e4chlichen letzten Antragstag verwenden.")
  ergebnis
}
