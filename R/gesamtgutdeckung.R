gesamtgut_vorzeitiger_berichtigungsbetrag <- function(schuld=NULL,verfuegbares_vorbehaltsgut=NULL,verfuegbares_sondergut=NULL,zuordnungsnachweis=NULL) {
  betrag <- .geld(schuld);vorbehalt <- .geld(verfuegbares_vorbehaltsgut);sonder <- .geld(verfuegbares_sondergut)
  .text(zuordnungsnachweis,"zuordnungsnachweis")
  deckung <- .addieren(vorbehalt,sonder);vorzeitig <- if (.vergleichen(betrag,deckung)<=0) betrag else deckung
  eingaben <- list(schuld=schuld,verfuegbares_vorbehaltsgut=verfuegbares_vorbehaltsgut,verfuegbares_sondergut=verfuegbares_sondergut,zuordnungsnachweis=zuordnungsnachweis)
  ergebnis <- .ergebnis(list(vorzeitiger_berichtigungsbetrag=.bruchteile(vorzeitig),restschuld=.bruchteile(.subtrahieren(betrag,vorzeitig))),"EUR","BGB_GESAMTGUT_VORZEITIGER_BERICHTIGUNGSBETRAG",eingaben,list(list(operation="Verf\u00fcgbares Vorbehaltsgut und Sondergut addieren, Schuld hierauf begrenzen und ungedeckten Rest ausweisen.")),eingaben)
  ergebnis$hinweise <- list("Qualifizierte Innenlast gegen\u00fcber Gesamtgut oder Vorbehalts-/Sondergut des anderen Ehegatten. \u00a71446II nur f\u00fcr den nicht allein verwaltenden Ehegatten; bei gemeinschaftlicher Verwaltung\u00a71468. Verf\u00fcgbarkeit der Verm\u00f6genswerte und konkurrierende Verpflichtungen rechtlich bereinigt. Keine Pflicht zur vorzeitigen Leistung aus Gesamtgut und keine Rangfolge zwischen Vorbehaltsgut und Sondergut erfunden. Restschuld wird nicht erlassen; gesetzlicher Aufschub bis Beendigung und weitere F\u00e4lligkeit rechtlich gesondert. Keine Au\u00dfenhaftungsentscheidung.")
  ergebnis
}
familienunterhalt_mittelvorrang <- function(bedarf_dieser_mittelstufe=NULL,gesamtgutsmittel=NULL,nachrangige_mittel=NULL,mittelart=NULL,zuordnungsnachweis=NULL) {
  bedarf <- .geld(bedarf_dieser_mittelstufe);vorrang <- .geld(gesamtgutsmittel);nachrang <- .geld(nachrangige_mittel)
  .text(mittelart,"mittelart");.text(zuordnungsnachweis,"zuordnungsnachweis")
  if (!(mittelart %in% c("einkuenfte","vermoegensstamm"))) .fehler("mittelart","einkuenfte oder vermoegensstamm erforderlich.")
  minimum <- function(a,b) if (.vergleichen(a,b)<=0) a else b
  aus_gesamtgut <- minimum(bedarf,vorrang);rest <- .subtrahieren(bedarf,aus_gesamtgut);aus_nachrang <- minimum(rest,nachrang)
  eingaben <- list(bedarf_dieser_mittelstufe=bedarf_dieser_mittelstufe,gesamtgutsmittel=gesamtgutsmittel,nachrangige_mittel=nachrangige_mittel,mittelart=mittelart,zuordnungsnachweis=zuordnungsnachweis)
  wert <- lapply(list(einsatz_gesamtgut=aus_gesamtgut,einsatz_nachrangige_mittel=aus_nachrang,ungedeckter_bedarf=.subtrahieren(rest,aus_nachrang),verbleibende_gesamtgutsmittel=.subtrahieren(vorrang,aus_gesamtgut),verbleibende_nachrangige_mittel=.subtrahieren(nachrang,aus_nachrang)),.bruchteile)
  ergebnis <- .ergebnis(wert,"EUR","BGB_FAMILIENUNTERHALT_MITTELVORRANG",eingaben,list(list(operation="Qualifizierten Bedarf zun\u00e4chst aus Gesamtgutsmitteln, Rest erst aus nachrangigen gleichartigen Mitteln decken; Restbedarf und Restmittel ausweisen.")),eingaben)
  ergebnis$hinweise <- list("\u00a71420 enth\u00e4lt zwei getrennte Vorr\u00e4nge. mittelart=einkuenfte: Gesamtguteink\u00fcnfte vor Vorbehaltseink\u00fcnften. mittelart=vermoegensstamm: Gesamtgutstamm vor zusammengefasstem Vorbehalts-/Sondergutstamm. Bedarf und verf\u00fcgbare Mittel f\u00fcr dieselbe qualifizierte Mittelstufe/Periode vorgeben. Keine zus\u00e4tzliche allgemeine Reihenfolge zwischen Vorbehaltseink\u00fcnften und Gesamtgutstamm oder zwischen Vorbehalts-/Sondergutstamm erfunden; diese Funktion allein ist kein vollst\u00e4ndiger Familienunterhaltsfinanzierungsplan. Keine Bedarfsermittlung, Verf\u00fcgbarkeitsermittlung oder freie Verm\u00f6gensmassenzuordnung.")
  ergebnis
}
