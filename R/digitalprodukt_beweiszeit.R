digitalprodukt_beweislastzeitvergleich <- function(bereitstellungsart=NULL, bereitstellung_an_verbraucher_am=NULL, abweichung_gezeigt_am=NULL, bereitstellungsende_am=NULL, einordnungsnachweis=NULL) {
 .auswahl(bereitstellungsart,'bereitstellungsart',c('einmalig','befristet_dauerhaft','unbefristet_dauerhaft'))
 beginn <- .datum(bereitstellung_an_verbraucher_am,'bereitstellung_an_verbraucher_am');abweichung <- .datum(abweichung_gezeigt_am,'abweichung_gezeigt_am');.text(einordnungsnachweis,'einordnungsnachweis')
 if(bereitstellungsart=='befristet_dauerhaft') {
  ende <- .datum(bereitstellungsende_am,'bereitstellungsende_am')
  if(ende<beginn) .fehler('bereitstellungsende_am','Ende darf nicht vor Beginn liegen.')
 } else {
  if(!is.null(bereitstellungsende_am)) .fehler('bereitstellungsende_am','Nur bei befristeter Dauerbereitstellung setzen.')
  ende <- if(bereitstellungsart=='einmalig') .frist(bereitstellung_an_verbraucher_am,1,'jahre','ereignis') else NULL
 }
 wert <- list(zeitfenster_beginn_am=.iso(beginn),zeitfenster_ende_am=if(is.null(ende)) NULL else .iso(ende),abweichung_im_zeitfenster=abweichung>=beginn && (is.null(ende) || abweichung<=ende))
 eingaben <- list(bereitstellungsart=bereitstellungsart, bereitstellung_an_verbraucher_am=bereitstellung_an_verbraucher_am, abweichung_gezeigt_am=abweichung_gezeigt_am, bereitstellungsende_am=bereitstellungsende_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswert","BGB_DIGITALPRODUKT_BEWEISLASTZEITVERGLEICH",eingaben,list(list(operation="Auftreten eines abweichenden Zustands mit Jahresgrundgrenze oder tats\u00e4chlichem dauerhaften Bereitstellungszeitraum vergleichen.")),eingaben)
 ergebnis$hinweise <- list("Bei einmaliger Bereitstellung Jahresgrundgrenze nach\u00a7327kI/\u00a7\u00a7187I/188; bei dauerhafter Bereitstellung tats\u00e4chlicher qualifizierter Bereitstellungszeitraum nach\u00a7327kII. Beginn jeweils Bereitstellung an den Verbraucher, auch nach\u00a7327uIII. Abweichung muss innerhalb einschlie\u00dflich Anfangs-/Endtag auftreten; tats\u00e4chliche Reihenfolge am selben Tag ist qualifiziert. Unbefristete Bereitstellung hat keine erfundene maximale Jahresgrenze. Ergebnis bezeichnet ausschlie\u00dflich zeitliche Voraussetzung, keine automatische Beweislast-, Mangel- oder Haftungsentscheidung. Technische Umgebung, Mitwirkung und Belehrung nachAbs\u00e4tzen3/4 separat; keine193Verl\u00e4ngerung des Beobachtungszeitraums.")
 ergebnis
}
